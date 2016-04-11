<?php
/**
 * @file
 * epublish_or_bust.features.workbench_moderation_states.inc
 */

/**
 * Implements hook_workbench_moderation_export_states().
 */
function epublish_or_bust_workbench_moderation_export_states() {
  $items = array(
    'draft' => array(
      'name' => 'draft',
      'label' => 'Draft',
      'description' => 'Work in progress',
      'weight' => -10,
    ),
    'needs_review' => array(
      'name' => 'needs_review',
      'label' => 'Needs Review',
      'description' => 'Ready for moderation',
      'weight' => -9,
    ),
    'published' => array(
      'name' => 'published',
      'label' => 'Published',
      'description' => 'Make this version live',
      'weight' => -7,
    ),
    'reviewed' => array(
      'name' => 'reviewed',
      'label' => 'Reviewed',
      'description' => 'Ready for publication',
      'weight' => -8,
    ),
  );
  return $items;
}
