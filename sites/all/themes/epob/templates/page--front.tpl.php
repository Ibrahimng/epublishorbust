<?php

/**
 * @file
 * Bartik's theme implementation to display a single Drupal page.
 *
 * The doctype, html, head and body tags are not in this template. Instead they
 * can be found in the html.tpl.php template normally located in the
 * modules/system directory.
 *
 * Available variables:
 *
 * General utility variables:
 * - $base_path: The base URL path of the Drupal installation. At the very
 *   least, this will always default to /.
 * - $directory: The directory the template is located in, e.g. modules/system
 *   or themes/bartik.
 * - $is_front: TRUE if the current page is the front page.
 * - $logged_in: TRUE if the user is registered and signed in.
 * - $is_admin: TRUE if the user has permission to access administration pages.
 *
 * Site identity:
 * - $front_page: The URL of the front page. Use this instead of $base_path,
 *   when linking to the front page. This includes the language domain or
 *   prefix.
 * - $logo: The path to the logo image, as defined in theme configuration.
 * - $site_name: The name of the site, empty when display has been disabled
 *   in theme settings.
 * - $site_slogan: The slogan of the site, empty when display has been disabled
 *   in theme settings.
 * - $hide_site_name: TRUE if the site name has been toggled off on the theme
 *   settings page. If hidden, the "element-invisible" class is added to make
 *   the site name visually hidden, but still accessible.
 * - $hide_site_slogan: TRUE if the site slogan has been toggled off on the
 *   theme settings page. If hidden, the "element-invisible" class is added to
 *   make the site slogan visually hidden, but still accessible.
 *
 * Navigation:
 * - $main_menu (array): An array containing the Main menu links for the
 *   site, if they have been configured.
 * - $secondary_menu (array): An array containing the Secondary menu links for
 *   the site, if they have been configured.
 * - $breadcrumb: The breadcrumb trail for the current page.
 *
 * Page content (in order of occurrence in the default page.tpl.php):
 * - $title_prefix (array): An array containing additional output populated by
 *   modules, intended to be displayed in front of the main title tag that
 *   appears in the template.
 * - $title: The page title, for use in the actual HTML content.
 * - $title_suffix (array): An array containing additional output populated by
 *   modules, intended to be displayed after the main title tag that appears in
 *   the template.
 * - $messages: HTML for status and error messages. Should be displayed
 *   prominently.
 * - $tabs (array): Tabs linking to any sub-pages beneath the current page
 *   (e.g., the view and edit tabs when displaying a node).
 * - $action_links (array): Actions local to the page, such as 'Add menu' on the
 *   menu administration interface.
 * - $feed_icons: A string of all feed icons for the current page.
 * - $node: The node object, if there is an automatically-loaded node
 *   associated with the page, and the node ID is the second argument
 *   in the page's path (e.g. node/12345 and node/12345/revisions, but not
 *   comment/reply/12345).
 *
 * Regions:
 * - $page['header']: Items for the header region.
 * - $page['featured']: Items for the featured region.
 * - $page['highlighted']: Items for the highlighted content region.
 * - $page['help']: Dynamic help text, mostly for admin pages.
 * - $page['content']: The main content of the current page.
 * - $page['sidebar_first']: Items for the first sidebar.
 * - $page['triptych_first']: Items for the first triptych.
 * - $page['triptych_middle']: Items for the middle triptych.
 * - $page['triptych_last']: Items for the last triptych.
 * - $page['footer_firstcolumn']: Items for the first footer column.
 * - $page['footer_secondcolumn']: Items for the second footer column.
 * - $page['footer_thirdcolumn']: Items for the third footer column.
 * - $page['footer_fourthcolumn']: Items for the fourth footer column.
 * - $page['footer']: Items for the footer region.
 *
 * @see template_preprocess()
 * @see template_preprocess_page()
 * @see template_process()
 * @see bartik_process_page()
 * @see html.tpl.php
 */

?>
<!-- THEME WRAPPER -->
<div id="page-wrapper">
  <div id="page">

    <!-- SITE HEADER -->
    <header class="site_header">
      <div class="site_header-top">
        <img src="/sites/default/files/epob/images/qwerty.png" alt="ePublish or BUST mascot image" srcset="/sites/default/files/epob/images/qwerty.png 80w, /sites/default/files/epob/images/qwerty@2x.png 160w" sizes="80px" class="site_header-logo" />
        <?php if ($site_name): ?>
          <?php if ($title): ?>
            <div id="site-name">
              <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home" class="site_header-site_name"><span><?php print $site_name; ?></span></a>
            </div>
          <?php else: /* Use h1 when the content title is empty */ ?>
            <h1 id="site-name"<?php if ($hide_site_name) { print ' class="element-invisible"'; } ?>>
              <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home" class="site_header-site_name"><span><?php print $site_name; ?></span></a>
            </h1>
          <?php endif; ?>
        <?php endif; ?>
        <div class="site_header-top_right">
          <a href="/user/login/" class="site_header-account_link">Account</a>
          <!--
          <form action="#" method="post" class="search_form">
            <input type="text" name="search_phrase" class="search_form-phrase">
            <button type="submit" title="Submit search" class="search_form-submit" value=""></button>
          </form>
          -->
          <?php print $variables['sitesearch']; ?>
        </div>
      </div>
      <div class="site_header-bottom">
        <div class="site_header-bottom_inner">
          <?php if ($site_slogan): ?>
            <div id="site-slogan" class="site_header-site_slogan">
              <?php print $site_slogan; ?>
            </div>
          <?php endif; ?>
          <?php if ($main_menu): ?>
            <nav id="main-menu" class="navigation site_header-nav">
              <?php print theme('links__system_main_menu', array(
                'links' => $main_menu,
                'attributes' => array(
                  'id' => 'main-menu-links',
                  'class' => array('links', 'clearfix'),
                ),
                'heading' => array(
                  'text' => t('Main menu'),
                  'level' => 'h2',
                  'class' => array('element-invisible'),
                ),
              )); ?>
            </nav> <!-- /#main-menu -->
          <?php endif; ?>
        </div>
      </div>
    </header>

    <!-- HERO BANNER -->
    <div class="slideshow flexslider">
      <ul class="slides--fullscreen">
        <li class="slideshow-full_width">
          <section class="slideshow-slide">
            <h1 class="slideshow-slide_title">Libraries + Independent Authors = <img class="slideshow-slide_title-image" src="/sites/default/files/epob/images/qwerty.png" alt="ePublish or BUST mascot image" srcset="/sites/default/files/epob/images/qwerty.png 80w, /sites/default/files/epob/images/qwerty@2x.png 160w" sizes="80px" class="site_header-logo" /></h1>
            <p>ePublish or BUST! is a one-stop site for independent authors to find resources available at participating public libraries.  At your fingertips you'll find the information and tools needed to go from a great idea to a published masterpiece.</p>
            <p>Are you an author or library?  Join today!</p>
            <a href="/user/register" class="button button--pill">Get Started</a>
            <a href="#learn" class="button button--pill">Learn More</a>
          </section>
        </li><!--
        <li>
          <section class="slideshow-slide">
            <h1 class="slideshow-slide_title">Second slide</h1>
            <p>We're a collective of talented people building amazing things. We listen to your needs and formulate solutions that will increase your teams productivity and your client's satisfaction. We make happiness factories. We're a collective of talented people building amazing things. We listen to your needs and formulate solutions that will increase your teams productivity and your client's satisfaction. We make happiness factories.</p>
            <a href="#" class="button">Learn more</a>
          </section>
        </li>-->
      </ul>
    </div>

    <!-- LEARN MORE -->
    <a name="learn"></a>
    <section class="stacked_hero_section stacked_hero_section--learn">
      <h2 class="stacked_hero_section-title">How It Works</h2>
      <div class="icon_box-wrapper">
        <a href="#discover">
          <section class="icon_box icon_box--discover">
            <div class="icon_box-icon"></div>
            <h3 class="icon_box-title">Discover Your Voice</h3>
            <p>Read thoughts on writing from independent authors.<br />&nbsp;<br />&nbsp;<br />&nbsp;</p>
          </section>
        </a>
        <a href="#publish">
          <section class="icon_box icon_box--tell">
            <div class="icon_box-icon"></div>
            <h3 class="icon_box-title">Tell Your Story</h3>
            <p>Share your eBook(s) with patrons of participating libraries throughout Kentucky.<br />&nbsp;<br />&nbsp;</p>
          </section>
        </a>
        <a href="#build">
          <section class="icon_box icon_box--build">
            <div class="icon_box-icon"></div>
            <h3 class="icon_box-title">Build Your Audience</h3>
            <p>Are you an author looking to promote your work?  Select an available date to book an appearance at a participating library.</p>
          </section>
        </a>
      </div>
    </section>

    <!-- DISCOVER YOUR VOICE -->
    <a name="discover"></a>
    <section class="stacked_hero_section stacked_hero_section--discover">
      <h2 class="stacked_hero_section-title">Discover Your Voice</h2>
      <div class="snippet_slideshow flexslider">
        <ul class="slides">
          <li>
            <section class="snippet">
              <div class="snippet-author_thumb" title="Laura Osterfeld's Photo" style="background-image:url('sites/default/files/epob/images/laura-osterfeld.png');"></div>
              <div class="snippet-content">
                <h3 class="snippet-title">New Adult</h3>
                <p class="snippet-attribution">By <a href="laura-osterfeld/">Laura Osterfeld</a> on April 7, 2016</p>
                <p>I’ve been hearing a lot about this “new adult” genre lately.  Aimed at young people navigating through the turbulent waters of early adulthood, this genre is generating a lot of buzz.  It generally targets individuals between the ages of 18 and 30, using protagonists of the same age to better identify with the reader.  The genre also covers topics relevant to people in that age bracket, such as college, relationships, careers, and self-discovery.</p>
                <a href="content/new-adult" class="button">Read More</a>
              </div>
            </section>
          </li>
          <li>
            <section class="snippet">
              <div class="snippet-author_thumb" title="Laura Osterfeld's Photo" style="background-image:url('sites/default/files/epob/images/laura-osterfeld.png');"></div>
              <div class="snippet-content">
                <h3 class="snippet-title">Books vs. Internet</h3>
                <p class="snippet-attribution">By <a href="laura-osterfeld/">Laura Osterfeld</a> on March 3, 2016</p>
                <p>I’ve been working on a fantasy story for a while now.  The problem is, that most of it is just an outline.  The rest of it is an epic, fully developed narrative… all inside my head.  I’ve been working on getting it typed out and have successfully completed a prologue and part of a first chapter.  That being said, organizing my thoughts has been difficult.  Especially where world building is concerned.  To aid with this, I went to the bookstore to see if I could find something specific to the science fiction/fantasy genre.</p>
                <a href="content/books-vs-internet" class="button">Read More</a>
              </div>
            </section>
          </li>
        </ul>
      </div>
    </section>

    <!-- TELL YOUR STORY -->
    <a name="publish"></a>
    <section class="stacked_hero_section stacked_hero_section--publish">
      <h2 class="stacked_hero_section-title">Tell Your Story</h2>
      <div class="icon_box-wrapper">
      <!--  <section class="icon_box icon_box--blank">
          <div class="icon_box-icon"></div>
          <div class="icon_box--blank_content">
          <img src="sites/default/files/epob/images/self-e_logo_2.jpg" alt="SELF-e powered by Library Journal" />
          <p>ePublish or BUST! by submitting your indie-published book here.  You can share your eBook(s) with patrons of participating libraries throughout Kentucky.</p>
        </div>
        </section> -->
        <section class="icon_box icon_box--blank">
          <div class="icon_box-icon"><img src="sites/default/files/epob/images/self-e_logo_2.jpg" alt="SELF-e powered by Library Journal" /></div>
          <h3 class="icon_box-title">&nbsp;</h3>
            <p>A growing consortium of Kentucky libraries welcomes authors to submit their eBooks for our statewide eBook program — ePublish or Bust! By submitting your indie-published book here, you can share your eBook(s) with patrons of participating libraries throughout Kentucky.</p>
        <a href="https://library-journal.biblioboard.com/?promotionId=d8b974c0-43b3-448e-b456-8364d7f9b650" class="button button--pill">Learn More</a>
        </section>
    </section>

    <!-- BUILD YOUR AUDIENCE -->
    <a name="build"></a>
    <section class="stacked_hero_section stacked_hero_section--build">
      <h2 class="stacked_hero_section-title">Build Your Audience</h2>
      <div class="icon_box-wrapper">
        <a href="calendar/">
          <section class="icon_box icon_box--book">
            <div class="icon_box-icon"></div>
            <h3 class="icon_box-title">Book an Appearance</h3>
            <p>Book an author appearance at a participating ePublish or BUST! library.<br />&nbsp;<br />&nbsp;</p>
          </section>
        </a>
        <a href="build-your-audience/">
        <section class="icon_box icon_box--find">
          <div class="icon_box-icon"></div>
          <h3 class="icon_box-title">Find a Library</h3>
          <p>Find a participating ePublish or BUST! library near you.<br />&nbsp;<br />&nbsp;<br />&nbsp;</p>
        </section>
        </a>
    <!-- CONTACT US 
    <a name="contact"></a>
    <section class="stacked_hero_section">
      <h2 class="stacked_hero_section-title">Contact Us</h2>
      <form class="contact_form" action="#" method="post">
        <p class="contact_form-type_label">Which best describes you?</p>
        <div class="contact_form-type">
          <div class="contact_form-radio_wrapper">
            <input type="radio" name="type" id="contact_form-client" value="client">
            <label for="contact_form-client">Client</label>
          </div>
          <div class="contact_form-radio_wrapper">
            <input type="radio" name="type" id="contact_form-partner" value="partner">
            <label for="contact_form-partner">Partner</label>
          </div>
          <div class="contact_form-radio_wrapper">
            <input type="radio" name="type" id="contact_form-curious" value="curious">
            <label for="contact_form-curious">Just curious</label>
          </div>
        </div>
        <input type="text" name="email" placeholder="Email address" class="contact_form-email">
        <input type="text" name="name" placeholder="Your name" class="contact_form-name">
        <select class="contact_form-interest" name="interest">
          <option value="">I am interested in... (please select)</option>
          <option value="info">More information</option>
          <option value="help">Help with a product</option>
        </select>
        <textarea class="contact_form-comments" name="comments" placeholder="Add comments here..."></textarea>
        <input type="submit" value="Send" class="contact_form-submit button">
      </form>
    </section> -->

    <!-- SITE FOOTER -->
    <footer class="site_footer">
      <!--
      <nav class="site_footer-social_nav">
          <a href="#" target="_blank" class="site_footer-facebook_link" title="Facebook icon"></a>
          <a href="#" target="_blank" class="site_footer-twitter_link" title="Twitter icon"></a>
          <a href="#" target="_blank" class="site_footer-linkedin_link" title="LinkedIn icon"></a>
      </nav>
      -->
      <!--
      <div class="site_footer-contact_info">
        <p class="site_footer-copyright">&copy; 2015 The Company, LLC.</p>
        <p class="site_footer-phone">1-800-333-3456</p>
        <p>33872 Main St. Dallas, FL. 012231</p>
      </div>
      -->
      <div class="site_footer-nav_wrapper">
        <nav class="site_footer-nav">
          <a href="/user/login/">Account</a>
          <a href="/calendar/">Calendar</a>
          <a href="/blogs/">Blogs</a>
          <a href="/help/">Help</a>
          <a href="/contact/">Contact Us</a>
          <a href="/#top">Home</a>
        </nav>
        <nav class="site_footer-nav site_footer-nav--alt">
          <a href="/#learn">How it Works</a>
          <a href="/#discover">Discover Your Voice</a>
          <a href="/#tell">Tell Your Story</a>
          <a href="/#build">Build Your Audience</a>
        </nav>
      </div>
    </footer>

    <!-- THEME WRAPPER CLOSING TAGS -->
  </div>
</div>

<!-- PLACEHOLDER JS FOR TEXTFIELD PLACEHOLDER POLYFILL -->
<script src="sites/default/files/epob/bower_components/placeholders/dist/placeholders.js"></script>

<!-- PICTUREFILL JS FOR IMAGE SRCSET POLYFILL -->
<script src="sites/default/files/epob/bower_components/picturefill/dist/picturefill.js" async></script>