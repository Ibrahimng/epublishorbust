<?php
/**
 * @file
 * epublish_or_bust.features.user_role.inc
 */

/**
 * Implements hook_user_default_roles().
 */
function epublish_or_bust_user_default_roles() {
  $roles = array();

  // Exported role: Bath KY coordinator.
  $roles['Bath KY coordinator'] = array(
    'name' => 'Bath KY coordinator',
    'weight' => 29,
  );

  // Exported role: Clark KY coordinator.
  $roles['Clark KY coordinator'] = array(
    'name' => 'Clark KY coordinator',
    'weight' => 10,
  );

  // Exported role: Crittenden KY coordinator.
  $roles['Crittenden KY coordinator'] = array(
    'name' => 'Crittenden KY coordinator',
    'weight' => 11,
  );

  // Exported role: Daviess KY coordinator.
  $roles['Daviess KY coordinator'] = array(
    'name' => 'Daviess KY coordinator',
    'weight' => 12,
  );

  // Exported role: Gallatin KY coordinator.
  $roles['Gallatin KY coordinator'] = array(
    'name' => 'Gallatin KY coordinator',
    'weight' => 13,
  );

  // Exported role: Grant KY coordinator.
  $roles['Grant KY coordinator'] = array(
    'name' => 'Grant KY coordinator',
    'weight' => 26,
  );

  // Exported role: Graves KY coordinator.
  $roles['Graves KY coordinator'] = array(
    'name' => 'Graves KY coordinator',
    'weight' => 34,
  );

  // Exported role: Hardin KY coordinator.
  $roles['Hardin KY coordinator'] = array(
    'name' => 'Hardin KY coordinator',
    'weight' => 14,
  );

  // Exported role: Henderson KY coordinator.
  $roles['Henderson KY coordinator'] = array(
    'name' => 'Henderson KY coordinator',
    'weight' => 15,
  );

  // Exported role: Jackson KY coordinator.
  $roles['Jackson KY coordinator'] = array(
    'name' => 'Jackson KY coordinator',
    'weight' => 16,
  );

  // Exported role: Kenton KY coordinator.
  $roles['Kenton KY coordinator'] = array(
    'name' => 'Kenton KY coordinator',
    'weight' => 27,
  );

  // Exported role: LaRue KY coordinator.
  $roles['LaRue KY coordinator'] = array(
    'name' => 'LaRue KY coordinator',
    'weight' => 28,
  );

  // Exported role: Lexington-Village KY coordinator.
  $roles['Lexington-Village KY coordinator'] = array(
    'name' => 'Lexington-Village KY coordinator',
    'weight' => 30,
  );

  // Exported role: Lincoln KY coordinator.
  $roles['Lincoln KY coordinator'] = array(
    'name' => 'Lincoln KY coordinator',
    'weight' => 35,
  );

  // Exported role: Logan KY coordinator.
  $roles['Logan KY coordinator'] = array(
    'name' => 'Logan KY coordinator',
    'weight' => 33,
  );

  // Exported role: Louisville KY coordinator.
  $roles['Louisville KY coordinator'] = array(
    'name' => 'Louisville KY coordinator',
    'weight' => 36,
  );

  // Exported role: Marshall KY coordinator.
  $roles['Marshall KY coordinator'] = array(
    'name' => 'Marshall KY coordinator',
    'weight' => 17,
  );

  // Exported role: Mason KY coordinator.
  $roles['Mason KY coordinator'] = array(
    'name' => 'Mason KY coordinator',
    'weight' => 18,
  );

  // Exported role: McLean KY coordinator.
  $roles['McLean KY coordinator'] = array(
    'name' => 'McLean KY coordinator',
    'weight' => 31,
  );

  // Exported role: Montgomery KY coordinator.
  $roles['Montgomery KY coordinator'] = array(
    'name' => 'Montgomery KY coordinator',
    'weight' => 32,
  );

  // Exported role: Nicholas KY coordinator.
  $roles['Nicholas KY coordinator'] = array(
    'name' => 'Nicholas KY coordinator',
    'weight' => 19,
  );

  // Exported role: Pike KY coordinator.
  $roles['Pike KY coordinator'] = array(
    'name' => 'Pike KY coordinator',
    'weight' => 20,
  );

  // Exported role: Pulaski KY coordinator.
  $roles['Pulaski KY coordinator'] = array(
    'name' => 'Pulaski KY coordinator',
    'weight' => 21,
  );

  // Exported role: Russell KY coordinator.
  $roles['Russell KY coordinator'] = array(
    'name' => 'Russell KY coordinator',
    'weight' => 22,
  );

  // Exported role: Taylor KY coordinator.
  $roles['Taylor KY coordinator'] = array(
    'name' => 'Taylor KY coordinator',
    'weight' => 23,
  );

  // Exported role: Warren KY coordinator.
  $roles['Warren KY coordinator'] = array(
    'name' => 'Warren KY coordinator',
    'weight' => 24,
  );

  // Exported role: Washington KY coordinator.
  $roles['Washington KY coordinator'] = array(
    'name' => 'Washington KY coordinator',
    'weight' => 9,
  );

  // Exported role: Whitley KY coordinator.
  $roles['Whitley KY coordinator'] = array(
    'name' => 'Whitley KY coordinator',
    'weight' => 25,
  );

  // Exported role: contributor.
  $roles['contributor'] = array(
    'name' => 'contributor',
    'weight' => 4,
  );

  // Exported role: coordinator.
  $roles['coordinator'] = array(
    'name' => 'coordinator',
    'weight' => 5,
  );

  // Exported role: editor.
  $roles['editor'] = array(
    'name' => 'editor',
    'weight' => 7,
  );

  return $roles;
}
