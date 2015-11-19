<?php

/**
 * @file
 * Drush user permission commands.
 *
 * @todo Add a command for fetching permissions for a single user.
 * @todo Add a command for checking if a user or role has a permission.
 * @todo Add a command for fetching the roles a permission has been assigned to.
 */

/**
 * Implements hook_drush_help().
 */
function permissions_drush_help($section) {
  switch ($section) {
    case 'meta:permissions:title':
      return dt('User permission commands');
    case 'meta:permissions:summary':
      return dt('List user permissions.');
  }
}

/**
 * Implements hook_drush_command().
 */
function permissions_drush_command() {
  $items['permissions-list'] = array(
    'callback' => 'drush_permissions_list',
    'description' => 'List user permissions.',
    'aliases' => array('perl'),
    'examples' => array(
      'drush permissions-list "authenticated user",administrator --module=node' =>
        'Display all node permissions assigned to the authenticated user and admin.',
    ),
    'arguments' => array(
      'roles' => 'A comma delimited list of role names.'
    ),
    'required-arguments' => FALSE,
    'options' => array(
      'full' => 'Show extended permission information like module and description.',
      'modules' => 'A comma delimited list of modules to limit the list to.',
      'pipe' => 'Generate output useful for pasting into code.',
    ),
  );
  $items['permissions-user'] = array(
    'callback' => 'drush_permissions_user',
    'description' => 'Print permissions of the specified user(s).',
    'aliases' => array('peru'),
    'examples' => array(
      'drush permissions-user 2,3,someguy,somegal,billgates@microsoft.com' =>
        'Display permissions assigned to any users with uids, names, or mail addresses matching the strings between commas.',
    ),
    'arguments' => array(
      'users' => 'A comma delimited list of uids, user names, or email addresses.',
    ),
    'required-arguments' => TRUE,
    'options' => array(
      'full' => 'show permissions and extended information about the user',
      'short' => 'show permissions about the user (this is the default)',
    ),
  );
  return $items;
}

/**
 * Drush command: Print information about permissions.
 */
function drush_permissions_list($roles = '') {
  $permissions = array();
  $all_permissions = user_permission_get_modules();
  // Set up the roles to limit the permissions to.
  $rids = array();
  if (!empty($roles)) {
    foreach (explode(',', $roles) as $role) {
      $role = trim($role);
      $rid_query = db_query("SELECT rid FROM {role} WHERE name = :role", array(':role' => $role));
      if ($rid = drush_db_result($rid_query)) {
        $rids[$rid] = $role;
      }
    }
    // Fetch all permissions applicable to these roles.
    $role_permissions = user_role_permissions($rids);
    // Merge the permissions.
    foreach ($role_permissions as $role) {
      $permissions += $role;
    }
    // Add the module names to the permissions.
    foreach (array_keys($permissions) as $permission) {
      if (isset($all_permissions[$permission])) {
        $permissions[$permission] = $all_permissions[$permission];
      }
    }
  }
  // Simply return all permissions if the user entered no roles.
  else {
    $permissions = $all_permissions;
  }
  // Limit the permissions to the modules option.
  $modules = drush_get_option('modules');
  if ($modules) {
    $modules = explode(',', $modules);
    $module_permissions = array();
    foreach ($permissions as $permission => $module) {
      if (in_array($module, $modules)) {
        $module_permissions[$permission] = $module;
      }
    }
    $permissions = $module_permissions;
  }
  // Build up the output.
  $full = drush_get_option('full');
  $output_pipe = drush_get_option('pipe');
  // Print the module names.
  if ($full) {
    drush_print_table(drush_key_value_to_array_table($permissions), array('permission', 'module'));
  }
  else {
    $pipe = array('array(');
    // Just print the permissions.
    foreach (array_keys($permissions) as $permission) {
      $pipe[] = drush_format($permission, NULL, 'export') . ',';
      drush_print($permission);
    }
    $pipe[] = ')';
    drush_print_pipe($pipe);
  }
}

/**
 * Drush command: Print information about user(s) their permissions.
 */
function drush_permissions_user($users) {
  $uids = _drush_user_get_users_from_arguments($users);
  foreach($uids as $uid) {
    drush_user_print_permission_info($uid);
  }
}

/**
 * Shows permissions for a given user.
 *
 * @param int $uid
 *   A user ID.
 */
function drush_user_print_permission_info($uid) {
  // Determine the correct param to use with user_load() depending on the Drupal
  // version.
  $uid_param = (drush_drupal_major_version() >= 7) ? $uid : array('uid' => $uid);
  $userinfo = user_load($uid_param);
  $user_name = $userinfo->name;
  if ($userinfo === FALSE || $uid == 0) {
    drush_print(dt('Unable to load user with uid @uid.', array('@uid' => $uid)));
    return;
  }
  // Get the permissions assigned to the user.
  $user_permissions = drush_user_get_permissions($userinfo);

  // If the 'full' option was passed, we will add extra user info.
  if (drush_get_option('full')) {
    $userinfo = (array) $userinfo;
    $userinfo_pipe = array();
    unset($userinfo['data']);
    unset($userinfo['block']);
    unset($userinfo['form_build_id']);
    foreach($userinfo as $key => $val) {
      if (is_array($val)) {
        drush_print($key . ': ');
        drush_print_r($val);
        $userinfo_pipe[] = '"' . implode(",", $val) . '"';
      }
      else {
        if ($key === 'created' OR $key === 'access' OR $key === 'login') {
          drush_print($key . ': ' . format_date($val));
          $userinfo_pipe[] = $val;
        }
        else {
          drush_print($key . ': ' . $val);
          $userinfo_pipe[] = $val;
        }
      }
    }
    drush_print_pipe(implode(",", $userinfo_pipe));
    drush_print_pipe("\n");
  }
  drush_print(dt('Permissions for user @user:', array('@user' => $user_name)));
  drush_print(implode("\n", $user_permissions));
  drush_print("\n");
}

/**
 * Gets a list of permissions assigned to a user.
 *
 * @param stdclass $user
 *   User object.
 *
 * @return array
 *   List of permissions assigned to the given user.
 */
function drush_user_get_permissions($user) {
  if (! isset($user->roles) || empty($user->roles)) {
    // Add the anonymous user role.
    $user->roles = array(1);
  }
  // User 1 has all permissions.
  if (isset($user->uid) && $user->uid == 1) {
    return drush_permissions_get_all_permissions();
  }
  $permissions_by_role = user_role_permissions(array_keys($user->roles));
  $permissions = array();
  foreach ($permissions_by_role as $role_permissions) {
    $permissions = array_merge($permissions, $role_permissions);
  }
  ksort($permissions);
  return array_keys($permissions);
}

/**
 * Gets all permissions.
 *
 * @return array
 *   List of all permissions.
 */
function drush_permissions_get_all_permissions() {
  $all_permissions = array_keys(user_permission_get_modules());
  sort($all_permissions);
  return $all_permissions;
}
