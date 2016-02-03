<?php
/**
 * @file
 * epublish_or_bust.features.workbench_moderation_transitions.inc
 */

/**
 * Implements hook_workbench_moderation_export_transitions().
 */
function epublish_or_bust_workbench_moderation_export_transitions() {
  $items = array(
    'draft:needs_review' => array(
      'from_name' => 'draft',
      'to_name' => 'needs_review',
      'name' => 'draft-needs_review',
    ),
    'needs_review:draft' => array(
      'from_name' => 'needs_review',
      'to_name' => 'draft',
      'name' => 'needs_review-draft',
    ),
    'needs_review:published' => array(
      'from_name' => 'needs_review',
      'to_name' => 'published',
      'name' => 'needs_review-published',
    ),
    'needs_review:reviewed' => array(
      'from_name' => 'needs_review',
      'to_name' => 'reviewed',
      'name' => 'needs_review-reviewed',
    ),
    'reviewed:published' => array(
      'from_name' => 'reviewed',
      'to_name' => 'published',
      'name' => 'reviewed-published',
    ),
  );
  return $items;
}
