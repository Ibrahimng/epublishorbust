<?php

function epob_preprocess_page(&$variables)
{
  $block = module_invoke('search','block_view','search');
  $rendered_block = render($block);
  $variables['sitesearch'] = $rendered_block;
}

/**
 * Implements hook_form_alter().
 */
function epob_form_alter(array &$form, array &$form_state = array(), $form_id = NULL) {
  if ($form_id) {
    switch ($form_id) {
      case 'search_form':
        // Add a clearfix class so the results don't overflow onto the form.
        $form['#attributes']['class'][] = 'clearfix';

        // Remove container-inline from the container classes.
        $form['basic']['#attributes']['class'] = array();

        // Hide the default button from display.
        $form['basic']['submit']['#attributes']['class'][] = 'element-invisible';

        // Implement a theme wrapper to add a submit button containing a search
        // icon directly after the input element.
        $form['basic']['keys']['#theme_wrappers'] = array('epob_search_form_wrapper');
        $form['basic']['keys']['#title'] = '';
        //control the width of the input
        $form['basic']['keys']['#attributes']['class'][] = 'search_form-phrase';
        $form['basic']['keys']['#attributes']['placeholder'] = t('Search');
        break;
      case 'search_block_form':
        $form['#attributes']['class'][] = 'search_form';

        $form['search_block_form']['#title'] = '';
        $form['search_block_form']['#attributes']['placeholder'] = t('Search');
        //control the width of the input
        $form['search_block_form']['#attributes']['class'][] ='search_form-phrase';
        // Hide the default button from display and implement a theme wrapper
        // to add a submit button containing a search icon directly after the
        // input element.
        $form['actions']['submit']['#attributes']['class'][] = 'element-invisible';
        $form['search_block_form']['#theme_wrappers'] = array('epob_search_form_wrapper');

        // Apply a clearfix so the results don't overflow onto the form.
        $form['#attributes']['class'][] = 'content-search';
        break;
    }
  }
}

/**
 * Theme function implementation for MYTHEME_search_form_wrapper.
 */
function epob_epob_search_form_wrapper($variables) {
  $output = '<div class="field append">';
  $output .= $variables['element']['#children'];
  $output .= '<button type="submit" class="search_form-submit">';
  $output .= '<span class="element-invisible">' . t('Search') . '</span>';
  $output .= '</button>';
  $output .= '</div>';
  return $output;
}

/**
 * Stub implementation for hook_theme().
 *
 * @see MYTHEME_theme()
 * @see hook_theme()
 */
function epob_theme(&$existing, $type, $theme, $path) {
  // Custom theme hooks:
  // Do not define the `path` or `template`.
  $hook_theme = array(
    'epob_search_form_wrapper' => array(
      'render element' => 'element',
    ),
  );

  return $hook_theme;
}