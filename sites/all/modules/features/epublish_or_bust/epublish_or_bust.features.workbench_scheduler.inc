<?php
/**
 * @file
 * epublish_or_bust.features.workbench_scheduler.inc
 */

/**
 * Implements hook_workbench_scheduler_export_schedules().
 */
function epublish_or_bust_workbench_scheduler_export_schedules() {
  $items = array(
    'schedule_publishing' => array(
      'name' => 'schedule_publishing',
      'label' => 'Schedule Publishing',
      'start_state' => 'published',
      'end_state' => 'unpublished',
      'types' => array(
        0 => 'article',
        1 => 'event',
      ),
    ),
  );
  return $items;
}
