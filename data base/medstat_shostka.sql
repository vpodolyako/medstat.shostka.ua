-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 21 2020 г., 22:40
-- Версия сервера: 5.6.37
-- Версия PHP: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `medstat.shostka`
--

-- --------------------------------------------------------

--
-- Структура таблицы `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Автор комментария', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-03-30 03:00:37', '2020-03-30 00:00:37', 'Привет! Это комментарий.\nЧтобы начать модерировать, редактировать и удалять комментарии, перейдите на экран «Комментарии» в консоли.\nАватары авторов комментариев загружаются с сервиса <a href=\"https://ru.gravatar.com\">Gravatar</a>.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://medstat.shostka.ua', 'yes'),
(2, 'home', 'http://medstat.shostka.ua', 'yes'),
(3, 'blogname', 'medstat.shostka.ua', 'yes'),
(4, 'blogdescription', 'Ещё один сайт на WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'vpodolyako@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'd.m.Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'd.m.Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '', 'yes'),
(29, 'rewrite_rules', '', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:30:\"advanced-custom-fields/acf.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '3', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:97:\"C:\\Users\\User\\Desktop\\OSPanel\\domains\\medstat.shostka.ua/wp-content/themes/twentytwenty/style.css\";i:1;s:0:\"\";}', 'no'),
(40, 'template', 'basic_theme', 'yes'),
(41, 'stylesheet', 'basic_theme', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '45805', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '8', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'admin_email_lifespan', '1601078430', 'yes'),
(94, 'initial_db_version', '45805', 'yes'),
(95, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(96, 'fresh_site', '0', 'yes'),
(97, 'WPLANG', 'uk', 'yes'),
(98, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'sidebars_widgets', 'a:2:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(104, 'cron', 'a:6:{i:1590073244;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1590105641;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1590105644;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1590105816;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1590105821;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(105, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'theme_mods_twentytwenty', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1586598789;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}}', 'yes'),
(116, 'recovery_keys', 'a:0:{}', 'yes'),
(134, 'can_compress_scripts', '1', 'no'),
(168, 'theme_mods_twentynineteen', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(169, 'theme_mods_twentyseventeen', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(171, 'category_children', 'a:0:{}', 'yes'),
(174, 'recently_activated', 'a:0:{}', 'yes'),
(177, 'new_admin_email', 'vpodolyako@gmail.com', 'yes'),
(209, 'current_theme', 'Theme name', 'yes'),
(210, 'theme_mods_basic_theme', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:12:\"primary-menu\";i:2;}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(211, 'theme_switched', '', 'yes'),
(413, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(562, '_site_transient_timeout_browser_f53f67c772630c669103c19cbe847b77', '1590223244', 'no'),
(563, '_site_transient_browser_f53f67c772630c669103c19cbe847b77', 'a:10:{s:4:\"name\";s:5:\"Opera\";s:7:\"version\";s:13:\"68.0.3618.104\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:22:\"https://www.opera.com/\";s:7:\"img_src\";s:42:\"http://s.w.org/images/browsers/opera.png?1\";s:11:\"img_src_ssl\";s:43:\"https://s.w.org/images/browsers/opera.png?1\";s:15:\"current_version\";s:5:\"12.18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(609, '_transient_timeout_plugin_slugs', '1590145598', 'no'),
(610, '_transient_plugin_slugs', 'a:3:{i:0;s:30:\"advanced-custom-fields/acf.php\";i:1;s:19:\"akismet/akismet.php\";i:2;s:9:\"hello.php\";}', 'no'),
(611, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1590069709', 'no'),
(612, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'O:8:\"stdClass\":100:{s:6:\"widget\";a:3:{s:4:\"name\";s:6:\"widget\";s:4:\"slug\";s:6:\"widget\";s:5:\"count\";i:4693;}s:11:\"woocommerce\";a:3:{s:4:\"name\";s:11:\"woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:5:\"count\";i:4107;}s:4:\"post\";a:3:{s:4:\"name\";s:4:\"post\";s:4:\"slug\";s:4:\"post\";s:5:\"count\";i:2667;}s:5:\"admin\";a:3:{s:4:\"name\";s:5:\"admin\";s:4:\"slug\";s:5:\"admin\";s:5:\"count\";i:2553;}s:5:\"posts\";a:3:{s:4:\"name\";s:5:\"posts\";s:4:\"slug\";s:5:\"posts\";s:5:\"count\";i:1962;}s:9:\"shortcode\";a:3:{s:4:\"name\";s:9:\"shortcode\";s:4:\"slug\";s:9:\"shortcode\";s:5:\"count\";i:1806;}s:8:\"comments\";a:3:{s:4:\"name\";s:8:\"comments\";s:4:\"slug\";s:8:\"comments\";s:5:\"count\";i:1789;}s:7:\"twitter\";a:3:{s:4:\"name\";s:7:\"twitter\";s:4:\"slug\";s:7:\"twitter\";s:5:\"count\";i:1485;}s:6:\"google\";a:3:{s:4:\"name\";s:6:\"google\";s:4:\"slug\";s:6:\"google\";s:5:\"count\";i:1473;}s:6:\"images\";a:3:{s:4:\"name\";s:6:\"images\";s:4:\"slug\";s:6:\"images\";s:5:\"count\";i:1473;}s:8:\"facebook\";a:3:{s:4:\"name\";s:8:\"facebook\";s:4:\"slug\";s:8:\"facebook\";s:5:\"count\";i:1450;}s:5:\"image\";a:3:{s:4:\"name\";s:5:\"image\";s:4:\"slug\";s:5:\"image\";s:5:\"count\";i:1426;}s:3:\"seo\";a:3:{s:4:\"name\";s:3:\"seo\";s:4:\"slug\";s:3:\"seo\";s:5:\"count\";i:1417;}s:7:\"sidebar\";a:3:{s:4:\"name\";s:7:\"sidebar\";s:4:\"slug\";s:7:\"sidebar\";s:5:\"count\";i:1302;}s:5:\"email\";a:3:{s:4:\"name\";s:5:\"email\";s:4:\"slug\";s:5:\"email\";s:5:\"count\";i:1195;}s:7:\"gallery\";a:3:{s:4:\"name\";s:7:\"gallery\";s:4:\"slug\";s:7:\"gallery\";s:5:\"count\";i:1186;}s:9:\"ecommerce\";a:3:{s:4:\"name\";s:9:\"ecommerce\";s:4:\"slug\";s:9:\"ecommerce\";s:5:\"count\";i:1120;}s:4:\"page\";a:3:{s:4:\"name\";s:4:\"page\";s:4:\"slug\";s:4:\"page\";s:5:\"count\";i:1120;}s:6:\"social\";a:3:{s:4:\"name\";s:6:\"social\";s:4:\"slug\";s:6:\"social\";s:5:\"count\";i:1095;}s:5:\"login\";a:3:{s:4:\"name\";s:5:\"login\";s:4:\"slug\";s:5:\"login\";s:5:\"count\";i:988;}s:5:\"video\";a:3:{s:4:\"name\";s:5:\"video\";s:4:\"slug\";s:5:\"video\";s:5:\"count\";i:878;}s:7:\"widgets\";a:3:{s:4:\"name\";s:7:\"widgets\";s:4:\"slug\";s:7:\"widgets\";s:5:\"count\";i:874;}s:5:\"links\";a:3:{s:4:\"name\";s:5:\"links\";s:4:\"slug\";s:5:\"links\";s:5:\"count\";i:873;}s:8:\"security\";a:3:{s:4:\"name\";s:8:\"security\";s:4:\"slug\";s:8:\"security\";s:5:\"count\";i:862;}s:4:\"spam\";a:3:{s:4:\"name\";s:4:\"spam\";s:4:\"slug\";s:4:\"spam\";s:5:\"count\";i:791;}s:10:\"e-commerce\";a:3:{s:4:\"name\";s:10:\"e-commerce\";s:4:\"slug\";s:10:\"e-commerce\";s:5:\"count\";i:774;}s:7:\"content\";a:3:{s:4:\"name\";s:7:\"content\";s:4:\"slug\";s:7:\"content\";s:5:\"count\";i:767;}s:6:\"slider\";a:3:{s:4:\"name\";s:6:\"slider\";s:4:\"slug\";s:6:\"slider\";s:5:\"count\";i:766;}s:9:\"analytics\";a:3:{s:4:\"name\";s:9:\"analytics\";s:4:\"slug\";s:9:\"analytics\";s:5:\"count\";i:758;}s:10:\"buddypress\";a:3:{s:4:\"name\";s:10:\"buddypress\";s:4:\"slug\";s:10:\"buddypress\";s:5:\"count\";i:745;}s:4:\"form\";a:3:{s:4:\"name\";s:4:\"form\";s:4:\"slug\";s:4:\"form\";s:5:\"count\";i:719;}s:3:\"rss\";a:3:{s:4:\"name\";s:3:\"rss\";s:4:\"slug\";s:3:\"rss\";s:5:\"count\";i:716;}s:5:\"media\";a:3:{s:4:\"name\";s:5:\"media\";s:4:\"slug\";s:5:\"media\";s:5:\"count\";i:714;}s:5:\"pages\";a:3:{s:4:\"name\";s:5:\"pages\";s:4:\"slug\";s:5:\"pages\";s:5:\"count\";i:698;}s:6:\"search\";a:3:{s:4:\"name\";s:6:\"search\";s:4:\"slug\";s:6:\"search\";s:5:\"count\";i:686;}s:6:\"jquery\";a:3:{s:4:\"name\";s:6:\"jquery\";s:4:\"slug\";s:6:\"jquery\";s:5:\"count\";i:658;}s:4:\"menu\";a:3:{s:4:\"name\";s:4:\"menu\";s:4:\"slug\";s:4:\"menu\";s:5:\"count\";i:652;}s:4:\"feed\";a:3:{s:4:\"name\";s:4:\"feed\";s:4:\"slug\";s:4:\"feed\";s:5:\"count\";i:650;}s:6:\"editor\";a:3:{s:4:\"name\";s:6:\"editor\";s:4:\"slug\";s:6:\"editor\";s:5:\"count\";i:647;}s:8:\"category\";a:3:{s:4:\"name\";s:8:\"category\";s:4:\"slug\";s:8:\"category\";s:5:\"count\";i:640;}s:4:\"ajax\";a:3:{s:4:\"name\";s:4:\"ajax\";s:4:\"slug\";s:4:\"ajax\";s:5:\"count\";i:628;}s:5:\"embed\";a:3:{s:4:\"name\";s:5:\"embed\";s:4:\"slug\";s:5:\"embed\";s:5:\"count\";i:626;}s:12:\"contact-form\";a:3:{s:4:\"name\";s:12:\"contact form\";s:4:\"slug\";s:12:\"contact-form\";s:5:\"count\";i:586;}s:3:\"css\";a:3:{s:4:\"name\";s:3:\"css\";s:4:\"slug\";s:3:\"css\";s:5:\"count\";i:584;}s:10:\"javascript\";a:3:{s:4:\"name\";s:10:\"javascript\";s:4:\"slug\";s:10:\"javascript\";s:5:\"count\";i:578;}s:7:\"youtube\";a:3:{s:4:\"name\";s:7:\"youtube\";s:4:\"slug\";s:7:\"youtube\";s:5:\"count\";i:576;}s:4:\"link\";a:3:{s:4:\"name\";s:4:\"link\";s:4:\"slug\";s:4:\"link\";s:5:\"count\";i:572;}s:7:\"payment\";a:3:{s:4:\"name\";s:7:\"payment\";s:4:\"slug\";s:7:\"payment\";s:5:\"count\";i:569;}s:5:\"share\";a:3:{s:4:\"name\";s:5:\"share\";s:4:\"slug\";s:5:\"share\";s:5:\"count\";i:556;}s:5:\"theme\";a:3:{s:4:\"name\";s:5:\"theme\";s:4:\"slug\";s:5:\"theme\";s:5:\"count\";i:547;}s:7:\"comment\";a:3:{s:4:\"name\";s:7:\"comment\";s:4:\"slug\";s:7:\"comment\";s:5:\"count\";i:547;}s:9:\"affiliate\";a:3:{s:4:\"name\";s:9:\"affiliate\";s:4:\"slug\";s:9:\"affiliate\";s:5:\"count\";i:542;}s:10:\"responsive\";a:3:{s:4:\"name\";s:10:\"responsive\";s:4:\"slug\";s:10:\"responsive\";s:5:\"count\";i:537;}s:9:\"dashboard\";a:3:{s:4:\"name\";s:9:\"dashboard\";s:4:\"slug\";s:9:\"dashboard\";s:5:\"count\";i:534;}s:6:\"custom\";a:3:{s:4:\"name\";s:6:\"custom\";s:4:\"slug\";s:6:\"custom\";s:5:\"count\";i:529;}s:3:\"ads\";a:3:{s:4:\"name\";s:3:\"ads\";s:4:\"slug\";s:3:\"ads\";s:5:\"count\";i:522;}s:10:\"categories\";a:3:{s:4:\"name\";s:10:\"categories\";s:4:\"slug\";s:10:\"categories\";s:5:\"count\";i:513;}s:3:\"api\";a:3:{s:4:\"name\";s:3:\"api\";s:4:\"slug\";s:3:\"api\";s:5:\"count\";i:505;}s:7:\"contact\";a:3:{s:4:\"name\";s:7:\"contact\";s:4:\"slug\";s:7:\"contact\";s:5:\"count\";i:503;}s:15:\"payment-gateway\";a:3:{s:4:\"name\";s:15:\"payment gateway\";s:4:\"slug\";s:15:\"payment-gateway\";s:5:\"count\";i:501;}s:4:\"user\";a:3:{s:4:\"name\";s:4:\"user\";s:4:\"slug\";s:4:\"user\";s:5:\"count\";i:499;}s:4:\"tags\";a:3:{s:4:\"name\";s:4:\"tags\";s:4:\"slug\";s:4:\"tags\";s:5:\"count\";i:491;}s:9:\"gutenberg\";a:3:{s:4:\"name\";s:9:\"gutenberg\";s:4:\"slug\";s:9:\"gutenberg\";s:5:\"count\";i:491;}s:6:\"button\";a:3:{s:4:\"name\";s:6:\"button\";s:4:\"slug\";s:6:\"button\";s:5:\"count\";i:490;}s:6:\"mobile\";a:3:{s:4:\"name\";s:6:\"mobile\";s:4:\"slug\";s:6:\"mobile\";s:5:\"count\";i:476;}s:5:\"users\";a:3:{s:4:\"name\";s:5:\"users\";s:4:\"slug\";s:5:\"users\";s:5:\"count\";i:475;}s:6:\"events\";a:3:{s:4:\"name\";s:6:\"events\";s:4:\"slug\";s:6:\"events\";s:5:\"count\";i:469;}s:4:\"chat\";a:3:{s:4:\"name\";s:4:\"chat\";s:4:\"slug\";s:4:\"chat\";s:5:\"count\";i:438;}s:5:\"photo\";a:3:{s:4:\"name\";s:5:\"photo\";s:4:\"slug\";s:5:\"photo\";s:5:\"count\";i:438;}s:9:\"marketing\";a:3:{s:4:\"name\";s:9:\"marketing\";s:4:\"slug\";s:9:\"marketing\";s:5:\"count\";i:437;}s:10:\"navigation\";a:3:{s:4:\"name\";s:10:\"navigation\";s:4:\"slug\";s:10:\"navigation\";s:5:\"count\";i:431;}s:9:\"slideshow\";a:3:{s:4:\"name\";s:9:\"slideshow\";s:4:\"slug\";s:9:\"slideshow\";s:5:\"count\";i:428;}s:5:\"popup\";a:3:{s:4:\"name\";s:5:\"popup\";s:4:\"slug\";s:5:\"popup\";s:5:\"count\";i:425;}s:8:\"calendar\";a:3:{s:4:\"name\";s:8:\"calendar\";s:4:\"slug\";s:8:\"calendar\";s:5:\"count\";i:424;}s:5:\"stats\";a:3:{s:4:\"name\";s:5:\"stats\";s:4:\"slug\";s:5:\"stats\";s:5:\"count\";i:423;}s:6:\"photos\";a:3:{s:4:\"name\";s:6:\"photos\";s:4:\"slug\";s:6:\"photos\";s:5:\"count\";i:421;}s:10:\"statistics\";a:3:{s:4:\"name\";s:10:\"statistics\";s:4:\"slug\";s:10:\"statistics\";s:5:\"count\";i:408;}s:5:\"forms\";a:3:{s:4:\"name\";s:5:\"forms\";s:4:\"slug\";s:5:\"forms\";s:5:\"count\";i:407;}s:10:\"newsletter\";a:3:{s:4:\"name\";s:10:\"newsletter\";s:4:\"slug\";s:10:\"newsletter\";s:5:\"count\";i:405;}s:4:\"news\";a:3:{s:4:\"name\";s:4:\"news\";s:4:\"slug\";s:4:\"news\";s:5:\"count\";i:397;}s:10:\"shortcodes\";a:3:{s:4:\"name\";s:10:\"shortcodes\";s:4:\"slug\";s:10:\"shortcodes\";s:5:\"count\";i:396;}s:14:\"contact-form-7\";a:3:{s:4:\"name\";s:14:\"contact form 7\";s:4:\"slug\";s:14:\"contact-form-7\";s:5:\"count\";i:394;}s:12:\"social-media\";a:3:{s:4:\"name\";s:12:\"social media\";s:4:\"slug\";s:12:\"social-media\";s:5:\"count\";i:388;}s:8:\"redirect\";a:3:{s:4:\"name\";s:8:\"redirect\";s:4:\"slug\";s:8:\"redirect\";s:5:\"count\";i:385;}s:7:\"plugins\";a:3:{s:4:\"name\";s:7:\"plugins\";s:4:\"slug\";s:7:\"plugins\";s:5:\"count\";i:377;}s:4:\"code\";a:3:{s:4:\"name\";s:4:\"code\";s:4:\"slug\";s:4:\"code\";s:5:\"count\";i:376;}s:9:\"multisite\";a:3:{s:4:\"name\";s:9:\"multisite\";s:4:\"slug\";s:9:\"multisite\";s:5:\"count\";i:375;}s:11:\"performance\";a:3:{s:4:\"name\";s:11:\"performance\";s:4:\"slug\";s:11:\"performance\";s:5:\"count\";i:372;}s:3:\"url\";a:3:{s:4:\"name\";s:3:\"url\";s:4:\"slug\";s:3:\"url\";s:5:\"count\";i:369;}s:12:\"notification\";a:3:{s:4:\"name\";s:12:\"notification\";s:4:\"slug\";s:12:\"notification\";s:5:\"count\";i:364;}s:4:\"meta\";a:3:{s:4:\"name\";s:4:\"meta\";s:4:\"slug\";s:4:\"meta\";s:5:\"count\";i:358;}s:4:\"list\";a:3:{s:4:\"name\";s:4:\"list\";s:4:\"slug\";s:4:\"list\";s:5:\"count\";i:357;}s:5:\"block\";a:3:{s:4:\"name\";s:5:\"block\";s:4:\"slug\";s:5:\"block\";s:5:\"count\";i:354;}s:9:\"elementor\";a:3:{s:4:\"name\";s:9:\"elementor\";s:4:\"slug\";s:9:\"elementor\";s:5:\"count\";i:350;}s:8:\"shipping\";a:3:{s:4:\"name\";s:8:\"shipping\";s:4:\"slug\";s:8:\"shipping\";s:5:\"count\";i:346;}s:8:\"tracking\";a:3:{s:4:\"name\";s:8:\"tracking\";s:4:\"slug\";s:8:\"tracking\";s:5:\"count\";i:344;}s:16:\"google-analytics\";a:3:{s:4:\"name\";s:16:\"google analytics\";s:4:\"slug\";s:16:\"google-analytics\";s:5:\"count\";i:339;}s:16:\"custom-post-type\";a:3:{s:4:\"name\";s:16:\"custom post type\";s:4:\"slug\";s:16:\"custom-post-type\";s:5:\"count\";i:338;}s:11:\"advertising\";a:3:{s:4:\"name\";s:11:\"advertising\";s:4:\"slug\";s:11:\"advertising\";s:5:\"count\";i:335;}s:5:\"cache\";a:3:{s:4:\"name\";s:5:\"cache\";s:4:\"slug\";s:5:\"cache\";s:5:\"count\";i:333;}}', 'no'),
(615, 'acf_version', '5.8.11', 'yes'),
(618, '_site_transient_timeout_theme_roots', '1590064259', 'no'),
(619, '_site_transient_theme_roots', 'a:4:{s:11:\"basic_theme\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";}', 'no'),
(622, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:4:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:62:\"https://downloads.wordpress.org/release/uk/wordpress-5.4.1.zip\";s:6:\"locale\";s:2:\"uk\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:62:\"https://downloads.wordpress.org/release/uk/wordpress-5.4.1.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.1\";s:7:\"version\";s:5:\"5.4.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.4.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.4.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.1\";s:7:\"version\";s:5:\"5.4.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.4.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.4.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.1\";s:7:\"version\";s:5:\"5.4.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.3.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.3.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.3.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.3.3-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.3.3-partial-2.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.3.3-rollback-2.zip\";}s:7:\"current\";s:5:\"5.3.3\";s:7:\"version\";s:5:\"5.3.3\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:5:\"5.3.2\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1590062461;s:15:\"version_checked\";s:5:\"5.3.2\";s:12:\"translations\";a:0:{}}', 'no'),
(623, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1590062462;s:7:\"checked\";a:4:{s:11:\"basic_theme\";s:5:\"1.0.0\";s:14:\"twentynineteen\";s:3:\"1.4\";s:15:\"twentyseventeen\";s:3:\"2.2\";s:12:\"twentytwenty\";s:3:\"1.1\";}s:8:\"response\";a:3:{s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.5.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.3\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.3.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.3.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:3:{i:0;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:14:\"twentynineteen\";s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:3:\"1.4\";s:7:\"updated\";s:19:\"2020-03-15 15:38:15\";s:7:\"package\";s:75:\"https://downloads.wordpress.org/translation/theme/twentynineteen/1.4/uk.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:15:\"twentyseventeen\";s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:3:\"2.2\";s:7:\"updated\";s:19:\"2019-06-17 18:16:53\";s:7:\"package\";s:76:\"https://downloads.wordpress.org/translation/theme/twentyseventeen/2.2/uk.zip\";s:10:\"autoupdate\";b:1;}i:2;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:12:\"twentytwenty\";s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:3:\"1.1\";s:7:\"updated\";s:19:\"2019-12-29 21:47:39\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/translation/theme/twentytwenty/1.1/uk.zip\";s:10:\"autoupdate\";b:1;}}}', 'no'),
(624, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1590062463;s:7:\"checked\";a:3:{s:30:\"advanced-custom-fields/acf.php\";s:6:\"5.8.11\";s:19:\"akismet/akismet.php\";s:5:\"4.1.3\";s:9:\"hello.php\";s:5:\"1.7.2\";}s:8:\"response\";a:1:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.5\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.1\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:2:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:7:\"akismet\";s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"4.1.3\";s:7:\"updated\";s:19:\"2020-03-17 21:01:41\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/plugin/akismet/4.1.3/uk.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:11:\"hello-dolly\";s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"1.7.2\";s:7:\"updated\";s:19:\"2019-06-07 20:53:10\";s:7:\"package\";s:75:\"https://downloads.wordpress.org/translation/plugin/hello-dolly/1.7.2/uk.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:2:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:6:\"5.8.11\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.5.8.11.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 6, '_edit_lock', '1588539440:1'),
(4, 8, '_edit_lock', '1588539360:1'),
(5, 6, '_edit_last', '1'),
(6, 6, '_wp_page_template', 'page_templates/contact.php'),
(7, 3, '_wp_trash_meta_status', 'draft'),
(8, 3, '_wp_trash_meta_time', '1587758440'),
(9, 3, '_wp_desired_post_slug', 'privacy-policy'),
(10, 2, '_wp_trash_meta_status', 'publish'),
(11, 2, '_wp_trash_meta_time', '1587758465'),
(12, 2, '_wp_desired_post_slug', 'sample-page'),
(13, 13, '_edit_lock', '1589312219:1'),
(14, 13, '_edit_last', '1'),
(15, 13, '_wp_page_template', 'page_templates/news.php'),
(16, 15, '_edit_lock', '1588539312:1'),
(17, 17, '_edit_lock', '1588539399:1'),
(19, 20, '_edit_lock', '1588539481:1'),
(20, 15, '_edit_last', '1'),
(21, 15, '_wp_page_template', 'page_templates/analiz_roboty.php'),
(22, 17, '_edit_last', '1'),
(23, 17, '_wp_page_template', 'page_templates/documents.php'),
(24, 20, '_edit_last', '1'),
(25, 20, '_wp_page_template', 'page_templates/mereza.php'),
(26, 23, '_menu_item_type', 'post_type'),
(27, 23, '_menu_item_menu_item_parent', '0'),
(28, 23, '_menu_item_object_id', '8'),
(29, 23, '_menu_item_object', 'page'),
(30, 23, '_menu_item_target', ''),
(31, 23, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(32, 23, '_menu_item_xfn', ''),
(33, 23, '_menu_item_url', ''),
(35, 24, '_menu_item_type', 'post_type'),
(36, 24, '_menu_item_menu_item_parent', '0'),
(37, 24, '_menu_item_object_id', '15'),
(38, 24, '_menu_item_object', 'page'),
(39, 24, '_menu_item_target', ''),
(40, 24, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(41, 24, '_menu_item_xfn', ''),
(42, 24, '_menu_item_url', ''),
(44, 25, '_menu_item_type', 'post_type'),
(45, 25, '_menu_item_menu_item_parent', '0'),
(46, 25, '_menu_item_object_id', '17'),
(47, 25, '_menu_item_object', 'page'),
(48, 25, '_menu_item_target', ''),
(49, 25, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(50, 25, '_menu_item_xfn', ''),
(51, 25, '_menu_item_url', ''),
(53, 26, '_menu_item_type', 'post_type'),
(54, 26, '_menu_item_menu_item_parent', '0'),
(55, 26, '_menu_item_object_id', '6'),
(56, 26, '_menu_item_object', 'page'),
(57, 26, '_menu_item_target', ''),
(58, 26, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(59, 26, '_menu_item_xfn', ''),
(60, 26, '_menu_item_url', ''),
(62, 27, '_menu_item_type', 'post_type'),
(63, 27, '_menu_item_menu_item_parent', '0'),
(64, 27, '_menu_item_object_id', '20'),
(65, 27, '_menu_item_object', 'page'),
(66, 27, '_menu_item_target', ''),
(67, 27, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(68, 27, '_menu_item_xfn', ''),
(69, 27, '_menu_item_url', ''),
(71, 28, '_menu_item_type', 'post_type'),
(72, 28, '_menu_item_menu_item_parent', '0'),
(73, 28, '_menu_item_object_id', '13'),
(74, 28, '_menu_item_object', 'page'),
(75, 28, '_menu_item_target', ''),
(76, 28, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(77, 28, '_menu_item_xfn', ''),
(78, 28, '_menu_item_url', ''),
(80, 36, '_edit_lock', '1589314602:1'),
(81, 37, '_wp_attached_file', '2020/05/bes-med.png'),
(82, 37, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:940;s:6:\"height\";i:788;s:4:\"file\";s:19:\"2020/05/bes-med.png\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"bes-med-300x251.png\";s:5:\"width\";i:300;s:6:\"height\";i:251;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"bes-med-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:19:\"bes-med-768x644.png\";s:5:\"width\";i:768;s:6:\"height\";i:644;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(83, 40, '_edit_lock', '1589314842:1'),
(84, 41, '_wp_attached_file', '2020/05/COVID-19.png'),
(85, 41, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:236;s:4:\"file\";s:20:\"2020/05/COVID-19.png\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"COVID-19-300x138.png\";s:5:\"width\";i:300;s:6:\"height\";i:138;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"COVID-19-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(86, 42, '_wp_attached_file', '2020/05/izoljacija-2_page-0001.jpg'),
(87, 42, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:1100;s:4:\"file\";s:34:\"2020/05/izoljacija-2_page-0001.jpg\";s:5:\"sizes\";a:4:{s:6:\"medium\";a:4:{s:4:\"file\";s:34:\"izoljacija-2_page-0001-218x300.jpg\";s:5:\"width\";i:218;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:35:\"izoljacija-2_page-0001-745x1024.jpg\";s:5:\"width\";i:745;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:34:\"izoljacija-2_page-0001-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:35:\"izoljacija-2_page-0001-768x1056.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1056;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1584712786\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(88, 43, '_wp_attached_file', '2020/05/izoljacija-2_page-0002.jpg'),
(89, 43, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:1109;s:4:\"file\";s:34:\"2020/05/izoljacija-2_page-0002.jpg\";s:5:\"sizes\";a:4:{s:6:\"medium\";a:4:{s:4:\"file\";s:34:\"izoljacija-2_page-0002-216x300.jpg\";s:5:\"width\";i:216;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:35:\"izoljacija-2_page-0002-739x1024.jpg\";s:5:\"width\";i:739;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:34:\"izoljacija-2_page-0002-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:35:\"izoljacija-2_page-0002-768x1065.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1065;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1584712825\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(90, 45, '_edit_lock', '1589797644:1'),
(91, 46, '_wp_attached_file', '2020/05/leprshutterstock_280043105.jpg'),
(92, 46, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1000;s:6:\"height\";i:659;s:4:\"file\";s:38:\"2020/05/leprshutterstock_280043105.jpg\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:38:\"leprshutterstock_280043105-300x198.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:198;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:38:\"leprshutterstock_280043105-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:38:\"leprshutterstock_280043105-768x506.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:506;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(93, 48, '_edit_lock', '1589315839:1'),
(94, 49, '_wp_attached_file', '2020/05/Tuberkulez.jpg'),
(95, 49, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:400;s:6:\"height\";i:250;s:4:\"file\";s:22:\"2020/05/Tuberkulez.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"Tuberkulez-300x188.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:188;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"Tuberkulez-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(96, 1, '_wp_trash_meta_status', 'publish'),
(97, 1, '_wp_trash_meta_time', '1589316004'),
(98, 1, '_wp_desired_post_slug', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80'),
(99, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:\"1\";}'),
(100, 52, '_edit_lock', '1589316516:1'),
(101, 53, '_wp_attached_file', '2020/05/100689675-1024x683-1.jpg'),
(102, 53, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:696;s:6:\"height\";i:464;s:4:\"file\";s:32:\"2020/05/100689675-1024x683-1.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:32:\"100689675-1024x683-1-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"100689675-1024x683-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(103, 55, '_edit_lock', '1589317263:1'),
(104, 56, '_wp_attached_file', '2020/05/97477550_266187634564645_6314089803340054528_n.jpg'),
(105, 56, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:488;s:6:\"height\";i:609;s:4:\"file\";s:58:\"2020/05/97477550_266187634564645_6314089803340054528_n.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:58:\"97477550_266187634564645_6314089803340054528_n-240x300.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:58:\"97477550_266187634564645_6314089803340054528_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:6:\"Design\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(106, 60, '_edit_last', '1'),
(107, 60, '_edit_lock', '1590069975:1'),
(108, 71, '_edit_last', '1'),
(109, 71, 'sex', 'man'),
(110, 71, '_sex', 'field_5ec66191586df'),
(111, 71, 'first', 'a:1:{i:0;s:5:\"first\";}'),
(112, 71, '_first', 'field_5ec668933ed5a'),
(113, 71, 'oblik', 'a:1:{i:0;s:5:\"oblik\";}'),
(114, 71, '_oblik', 'field_5ec6694fcee80'),
(115, 71, 'hvoroba', 'Н60-Н95'),
(116, 71, '_hvoroba', 'field_5ec66982cee81'),
(117, 71, '_edit_lock', '1590068186:1'),
(118, 72, '_edit_last', '1'),
(119, 72, '_edit_lock', '1590069115:1'),
(120, 72, 'sex', 'woman'),
(121, 72, '_sex', 'field_5ec66191586df'),
(122, 72, 'first', 'a:1:{i:0;s:5:\"first\";}'),
(123, 72, '_first', 'field_5ec668933ed5a'),
(124, 72, 'oblik', ''),
(125, 72, '_oblik', 'field_5ec6694fcee80'),
(126, 72, 'hvoroba', 'К00-К93'),
(127, 72, '_hvoroba', 'field_5ec66982cee81'),
(128, 74, '_edit_last', '1'),
(129, 74, '_edit_lock', '1590069112:1'),
(130, 74, 'sex', 'man'),
(131, 74, '_sex', 'field_5ec66191586df'),
(132, 74, 'first', ''),
(133, 74, '_first', 'field_5ec668933ed5a'),
(134, 74, 'oblik', 'a:1:{i:0;s:5:\"oblik\";}'),
(135, 74, '_oblik', 'field_5ec6694fcee80'),
(136, 74, 'hvoroba', 'E00-E90'),
(137, 74, '_hvoroba', 'field_5ec66982cee81');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-03-30 03:00:37', '2020-03-30 00:00:37', '<!-- wp:paragraph -->\n<p>Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите ее, затем начинайте создавать!</p>\n<!-- /wp:paragraph -->', 'Привет, мир!', '', 'trash', 'open', 'open', '', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80__trashed', '', '', '2020-05-12 23:40:04', '2020-05-12 20:40:04', '', 0, 'http://medstat.shostka.ua/?p=1', 0, 'post', '', 1),
(2, 1, '2020-03-30 03:00:37', '2020-03-30 00:00:37', '<!-- wp:paragraph -->\n<p>Это пример страницы. От записей в блоге она отличается тем, что остаётся на одном месте и отображается в меню сайта (в большинстве тем). На странице &laquo;Детали&raquo; владельцы сайтов обычно рассказывают о себе потенциальным посетителям. Например, так:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Привет! Днём я курьер, а вечером &#8212; подающий надежды актёр. Это мой блог. Я живу в Ростове-на-Дону, люблю своего пса Джека и пинаколаду. (И ещё попадать под дождь.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...или так:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Компания &laquo;Штучки XYZ&raquo; была основана в 1971 году и с тех пор производит качественные штучки. Компания находится в Готэм-сити, имеет штат из более чем 2000 сотрудников и приносит много пользы жителям Готэма.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href=\"http://medstat.shostka.ua/wp-admin/\">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Пример страницы', '', 'trash', 'closed', 'open', '', 'sample-page__trashed', '', '', '2020-04-24 23:01:05', '2020-04-24 20:01:05', '', 0, 'http://medstat.shostka.ua/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-03-30 03:00:37', '2020-03-30 00:00:37', '<!-- wp:heading --><h2>Кто мы</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Наш адрес сайта: http://medstat.shostka.ua.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Какие персональные данные мы собираем и с какой целью</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Комментарии</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если посетитель оставляет комментарий на сайте, мы собираем данные указанные в форме комментария, а также IP адрес посетителя и данные user-agent браузера с целью определения спама.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Анонимизированная строка создаваемая из вашего адреса email (\"хеш\") может предоставляться сервису Gravatar, чтобы определить используете ли вы его. Политика конфиденциальности Gravatar доступна здесь: https://automattic.com/privacy/ . После одобрения комментария ваше изображение профиля будет видимым публично в контексте вашего комментария.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Медиафайлы</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы зарегистрированный пользователь и загружаете фотографии на сайт, вам возможно следует избегать загрузки изображений с метаданными EXIF, так как они могут содержать данные вашего месторасположения по GPS. Посетители могут извлечь эту информацию скачав изображения с сайта.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Формы контактов</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Куки</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы оставляете комментарий на нашем сайте, вы можете включить сохранение вашего имени, адреса email и вебсайта в куки. Это делается для вашего удобства, чтобы не заполнять данные снова при повторном комментировании. Эти куки хранятся в течение одного года.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Если у вас есть учетная запись на сайте и вы войдете в неё, мы установим временный куки для определения поддержки куки вашим браузером, куки не содержит никакой личной информации и удаляется при закрытии вашего браузера.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>При входе в учетную запись мы также устанавливаем несколько куки с данными входа и настройками экрана. Куки входа хранятся в течение двух дней, куки с настройками экрана - год. Если вы выберете возможность \"Запомнить меня\", данные о входе будут сохраняться в течение двух недель. При выходе из учетной записи куки входа будут удалены.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>При редактировании или публикации статьи в браузере будет сохранен дополнительный куки, он не содержит персональных данных и содержит только ID записи отредактированной вами, истекает через 1 день.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Встраиваемое содержимое других вебсайтов</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Статьи на этом сайте могут включать встраиваемое содержимое (например видео, изображения, статьи и др.), подобное содержимое ведет себя так же, как если бы посетитель зашел на другой сайт.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Эти сайты могут собирать данные о вас, использовать куки, внедрять дополнительное отслеживание третьей стороной и следить за вашим взаимодействием с внедренным содержимым, включая отслеживание взаимодействия, если у вас есть учетная запись и вы авторизовались на том сайте.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Веб-аналитика</h3><!-- /wp:heading --><!-- wp:heading --><h2>С кем мы делимся вашими данными</h2><!-- /wp:heading --><!-- wp:heading --><h2>Как долго мы храним ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы оставляете комментарий, то сам комментарий и его метаданные сохраняются неопределенно долго. Это делается для того, чтобы определять и одобрять последующие комментарии автоматически, вместо помещения их в очередь на одобрение.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Для пользователей с регистрацией на нашем сайте мы храним ту личную информацию, которую они указывают в своем профиле. Все пользователи могут видеть, редактировать или удалить свою информацию из профиля в любое время (кроме имени пользователя). Администрация вебсайта также может видеть и изменять эту информацию.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Какие у вас права на ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>При наличии учетной записи на сайте или если вы оставляли комментарии, то вы можете запросить файл экспорта персональных данных, которые мы сохранили о вас, включая предоставленные вами данные. Вы также можете запросить удаление этих данных, это не включает данные, которые мы обязаны хранить в административных целях, по закону или целях безопасности.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Куда мы отправляем ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Комментарии пользователей могут проверяться автоматическим сервисом определения спама.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Ваша контактная информация</h2><!-- /wp:heading --><!-- wp:heading --><h2>Дополнительная информация</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Как мы защищаем ваши данные</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Какие принимаются процедуры против взлома данных</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>От каких третьих сторон мы получаем данные</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Какие автоматические решения принимаются на основе данных пользователей</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Требования к раскрытию отраслевых нормативных требований</h3><!-- /wp:heading -->', 'Политика конфиденциальности', '', 'trash', 'closed', 'open', '', 'privacy-policy__trashed', '', '', '2020-04-24 23:00:43', '2020-04-24 20:00:43', '', 0, 'http://medstat.shostka.ua/?page_id=3', 0, 'page', '', 0),
(6, 1, '2020-04-07 22:14:21', '2020-04-07 19:14:21', '', 'КОНТАКТИ', '', 'publish', 'closed', 'closed', '', '%d0%ba%d0%be%d0%bd%d1%82%d0%b0%d0%ba%d1%82%d0%b8', '', '', '2020-05-03 23:59:32', '2020-05-03 20:59:32', '', 0, 'http://medstat.shostka.ua/?page_id=6', 0, 'page', '', 0),
(7, 1, '2020-04-07 22:14:21', '2020-04-07 19:14:21', '', 'Контакти', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2020-04-07 22:14:21', '2020-04-07 19:14:21', '', 6, 'http://medstat.shostka.ua/?p=7', 0, 'revision', '', 0),
(8, 1, '2020-04-11 12:50:29', '2020-04-11 09:50:29', '', 'ГОЛОВНА', '', 'publish', 'closed', 'closed', '', '%d0%b3%d0%be%d0%bb%d0%be%d0%b2%d0%bd%d0%b0', '', '', '2020-05-03 23:58:14', '2020-05-03 20:58:14', '', 0, 'http://medstat.shostka.ua/?page_id=8', 0, 'page', '', 0),
(9, 1, '2020-04-11 12:50:29', '2020-04-11 09:50:29', '', 'Головна', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2020-04-11 12:50:29', '2020-04-11 09:50:29', '', 8, 'http://medstat.shostka.ua/?p=9', 0, 'revision', '', 0),
(11, 1, '2020-04-24 23:00:43', '2020-04-24 20:00:43', '<!-- wp:heading --><h2>Кто мы</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Наш адрес сайта: http://medstat.shostka.ua.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Какие персональные данные мы собираем и с какой целью</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Комментарии</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если посетитель оставляет комментарий на сайте, мы собираем данные указанные в форме комментария, а также IP адрес посетителя и данные user-agent браузера с целью определения спама.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Анонимизированная строка создаваемая из вашего адреса email (\"хеш\") может предоставляться сервису Gravatar, чтобы определить используете ли вы его. Политика конфиденциальности Gravatar доступна здесь: https://automattic.com/privacy/ . После одобрения комментария ваше изображение профиля будет видимым публично в контексте вашего комментария.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Медиафайлы</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы зарегистрированный пользователь и загружаете фотографии на сайт, вам возможно следует избегать загрузки изображений с метаданными EXIF, так как они могут содержать данные вашего месторасположения по GPS. Посетители могут извлечь эту информацию скачав изображения с сайта.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Формы контактов</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Куки</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы оставляете комментарий на нашем сайте, вы можете включить сохранение вашего имени, адреса email и вебсайта в куки. Это делается для вашего удобства, чтобы не заполнять данные снова при повторном комментировании. Эти куки хранятся в течение одного года.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Если у вас есть учетная запись на сайте и вы войдете в неё, мы установим временный куки для определения поддержки куки вашим браузером, куки не содержит никакой личной информации и удаляется при закрытии вашего браузера.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>При входе в учетную запись мы также устанавливаем несколько куки с данными входа и настройками экрана. Куки входа хранятся в течение двух дней, куки с настройками экрана - год. Если вы выберете возможность \"Запомнить меня\", данные о входе будут сохраняться в течение двух недель. При выходе из учетной записи куки входа будут удалены.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>При редактировании или публикации статьи в браузере будет сохранен дополнительный куки, он не содержит персональных данных и содержит только ID записи отредактированной вами, истекает через 1 день.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Встраиваемое содержимое других вебсайтов</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Статьи на этом сайте могут включать встраиваемое содержимое (например видео, изображения, статьи и др.), подобное содержимое ведет себя так же, как если бы посетитель зашел на другой сайт.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Эти сайты могут собирать данные о вас, использовать куки, внедрять дополнительное отслеживание третьей стороной и следить за вашим взаимодействием с внедренным содержимым, включая отслеживание взаимодействия, если у вас есть учетная запись и вы авторизовались на том сайте.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Веб-аналитика</h3><!-- /wp:heading --><!-- wp:heading --><h2>С кем мы делимся вашими данными</h2><!-- /wp:heading --><!-- wp:heading --><h2>Как долго мы храним ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы оставляете комментарий, то сам комментарий и его метаданные сохраняются неопределенно долго. Это делается для того, чтобы определять и одобрять последующие комментарии автоматически, вместо помещения их в очередь на одобрение.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Для пользователей с регистрацией на нашем сайте мы храним ту личную информацию, которую они указывают в своем профиле. Все пользователи могут видеть, редактировать или удалить свою информацию из профиля в любое время (кроме имени пользователя). Администрация вебсайта также может видеть и изменять эту информацию.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Какие у вас права на ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>При наличии учетной записи на сайте или если вы оставляли комментарии, то вы можете запросить файл экспорта персональных данных, которые мы сохранили о вас, включая предоставленные вами данные. Вы также можете запросить удаление этих данных, это не включает данные, которые мы обязаны хранить в административных целях, по закону или целях безопасности.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Куда мы отправляем ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Комментарии пользователей могут проверяться автоматическим сервисом определения спама.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Ваша контактная информация</h2><!-- /wp:heading --><!-- wp:heading --><h2>Дополнительная информация</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Как мы защищаем ваши данные</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Какие принимаются процедуры против взлома данных</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>От каких третьих сторон мы получаем данные</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Какие автоматические решения принимаются на основе данных пользователей</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Требования к раскрытию отраслевых нормативных требований</h3><!-- /wp:heading -->', 'Политика конфиденциальности', '', 'inherit', 'closed', 'closed', '', '3-revision-v1', '', '', '2020-04-24 23:00:43', '2020-04-24 20:00:43', '', 3, 'http://medstat.shostka.ua/?p=11', 0, 'revision', '', 0),
(12, 1, '2020-04-24 23:01:05', '2020-04-24 20:01:05', '<!-- wp:paragraph -->\n<p>Это пример страницы. От записей в блоге она отличается тем, что остаётся на одном месте и отображается в меню сайта (в большинстве тем). На странице &laquo;Детали&raquo; владельцы сайтов обычно рассказывают о себе потенциальным посетителям. Например, так:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Привет! Днём я курьер, а вечером &#8212; подающий надежды актёр. Это мой блог. Я живу в Ростове-на-Дону, люблю своего пса Джека и пинаколаду. (И ещё попадать под дождь.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...или так:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Компания &laquo;Штучки XYZ&raquo; была основана в 1971 году и с тех пор производит качественные штучки. Компания находится в Готэм-сити, имеет штат из более чем 2000 сотрудников и приносит много пользы жителям Готэма.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href=\"http://medstat.shostka.ua/wp-admin/\">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Пример страницы', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2020-04-24 23:01:05', '2020-04-24 20:01:05', '', 2, 'http://medstat.shostka.ua/?p=12', 0, 'revision', '', 0),
(13, 1, '2020-04-24 23:02:05', '2020-04-24 20:02:05', '', 'НОВИНИ', '', 'publish', 'closed', 'closed', '', '%d0%bd%d0%be%d0%b2%d0%b8%d0%bd%d0%b8', '', '', '2020-05-04 00:00:53', '2020-05-03 21:00:53', '', 0, 'http://medstat.shostka.ua/?page_id=13', 0, 'page', '', 0),
(14, 1, '2020-04-24 23:02:05', '2020-04-24 20:02:05', '', 'Новини', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2020-04-24 23:02:05', '2020-04-24 20:02:05', '', 13, 'http://medstat.shostka.ua/?p=14', 0, 'revision', '', 0),
(15, 1, '2020-04-24 23:04:17', '2020-04-24 20:04:17', '', 'АНАЛІЗ РОБОТИ', '', 'publish', 'closed', 'closed', '', '%d0%b0%d0%bd%d0%b0%d0%bb%d1%96%d0%b7-%d1%80%d0%be%d0%b1%d0%be%d1%82%d0%b8', '', '', '2020-05-03 23:56:55', '2020-05-03 20:56:55', '', 0, 'http://medstat.shostka.ua/?page_id=15', 0, 'page', '', 0),
(16, 1, '2020-04-24 23:04:17', '2020-04-24 20:04:17', '', 'Аналіз роботи', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2020-04-24 23:04:17', '2020-04-24 20:04:17', '', 15, 'http://medstat.shostka.ua/?p=16', 0, 'revision', '', 0),
(17, 1, '2020-04-24 23:04:59', '2020-04-24 20:04:59', '', 'ДОКУМЕНТИ', '', 'publish', 'closed', 'closed', '', '%d0%b4%d0%be%d0%ba%d1%83%d0%bc%d0%b5%d0%bd%d1%82%d0%b8', '', '', '2020-05-03 23:58:56', '2020-05-03 20:58:56', '', 0, 'http://medstat.shostka.ua/?page_id=17', 0, 'page', '', 0),
(18, 1, '2020-04-24 23:04:59', '2020-04-24 20:04:59', '', 'Документи', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2020-04-24 23:04:59', '2020-04-24 20:04:59', '', 17, 'http://medstat.shostka.ua/?p=18', 0, 'revision', '', 0),
(20, 1, '2020-04-24 23:05:30', '2020-04-24 20:05:30', '', 'МЕРЕЖА', '', 'publish', 'closed', 'closed', '', '%d0%bc%d0%b5%d1%80%d0%b5%d0%b6%d0%b0', '', '', '2020-05-04 00:00:19', '2020-05-03 21:00:19', '', 0, 'http://medstat.shostka.ua/?page_id=20', 0, 'page', '', 0),
(21, 1, '2020-04-24 23:05:30', '2020-04-24 20:05:30', '', 'Мережа', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2020-04-24 23:05:30', '2020-04-24 20:05:30', '', 20, 'http://medstat.shostka.ua/?p=21', 0, 'revision', '', 0),
(23, 1, '2020-05-03 21:38:21', '2020-05-03 18:38:21', ' ', '', '', 'publish', 'closed', 'closed', '', '23', '', '', '2020-05-03 21:38:52', '2020-05-03 18:38:52', '', 0, 'http://medstat.shostka.ua/?p=23', 1, 'nav_menu_item', '', 0),
(24, 1, '2020-05-03 21:38:21', '2020-05-03 18:38:21', ' ', '', '', 'publish', 'closed', 'closed', '', '24', '', '', '2020-05-03 21:38:52', '2020-05-03 18:38:52', '', 0, 'http://medstat.shostka.ua/?p=24', 3, 'nav_menu_item', '', 0),
(25, 1, '2020-05-03 21:38:21', '2020-05-03 18:38:21', ' ', '', '', 'publish', 'closed', 'closed', '', '25', '', '', '2020-05-03 21:38:52', '2020-05-03 18:38:52', '', 0, 'http://medstat.shostka.ua/?p=25', 4, 'nav_menu_item', '', 0),
(26, 1, '2020-05-03 21:38:21', '2020-05-03 18:38:21', ' ', '', '', 'publish', 'closed', 'closed', '', '26', '', '', '2020-05-03 21:38:52', '2020-05-03 18:38:52', '', 0, 'http://medstat.shostka.ua/?p=26', 6, 'nav_menu_item', '', 0),
(27, 1, '2020-05-03 21:38:21', '2020-05-03 18:38:21', ' ', '', '', 'publish', 'closed', 'closed', '', '27', '', '', '2020-05-03 21:38:52', '2020-05-03 18:38:52', '', 0, 'http://medstat.shostka.ua/?p=27', 5, 'nav_menu_item', '', 0),
(28, 1, '2020-05-03 21:38:21', '2020-05-03 18:38:21', ' ', '', '', 'publish', 'closed', 'closed', '', '28', '', '', '2020-05-03 21:38:52', '2020-05-03 18:38:52', '', 0, 'http://medstat.shostka.ua/?p=28', 2, 'nav_menu_item', '', 0),
(29, 1, '2020-05-03 23:56:55', '2020-05-03 20:56:55', '', 'АНАЛІЗ РОБОТИ', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2020-05-03 23:56:55', '2020-05-03 20:56:55', '', 15, 'http://medstat.shostka.ua/?p=29', 0, 'revision', '', 0),
(30, 1, '2020-05-03 23:58:14', '2020-05-03 20:58:14', '', 'ГОЛОВНА', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2020-05-03 23:58:14', '2020-05-03 20:58:14', '', 8, 'http://medstat.shostka.ua/?p=30', 0, 'revision', '', 0),
(31, 1, '2020-05-03 23:58:56', '2020-05-03 20:58:56', '', 'ДОКУМЕНТИ', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2020-05-03 23:58:56', '2020-05-03 20:58:56', '', 17, 'http://medstat.shostka.ua/?p=31', 0, 'revision', '', 0),
(32, 1, '2020-05-03 23:59:32', '2020-05-03 20:59:32', '', 'КОНТАКТИ', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2020-05-03 23:59:32', '2020-05-03 20:59:32', '', 6, 'http://medstat.shostka.ua/?p=32', 0, 'revision', '', 0),
(33, 1, '2020-05-04 00:00:19', '2020-05-03 21:00:19', '', 'МЕРЕЖА', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2020-05-04 00:00:19', '2020-05-03 21:00:19', '', 20, 'http://medstat.shostka.ua/?p=33', 0, 'revision', '', 0),
(34, 1, '2020-05-04 00:00:53', '2020-05-03 21:00:53', '', 'НОВИНИ', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2020-05-04 00:00:53', '2020-05-03 21:00:53', '', 13, 'http://medstat.shostka.ua/?p=34', 0, 'revision', '', 0),
(36, 1, '2020-05-12 23:11:40', '0000-00-00 00:00:00', '<!-- wp:image {\"id\":37,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/bes-med.png\" alt=\"\" class=\"wp-image-37\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Інтернет полегшує життя у буденних справах. Ми можемо замовити собі продукти, речі, бронюємо квитки або власне місце у черзі до лікаря. Проте мережа не лише спрощує нам життя, але і створює нові небезпеки. Сьогодні МОЗ України долучається до Дня безпеки в Інтернеті та розповідає вам про фейкові вакцини, недоказову медицину, онлайн-аптеки та правила, що допоможуть вам захистися. </em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3><strong>Ліки через інтернет</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Онлайн-аптек МОЗ України не існує. Не варто замовляти ліки поштою. Згідно з законом, торгівля лікарськими засобами здійснюється виключно через аптечні заклади та не може здійснюватися дистанційно та шляхом електронної торгівлі, а також поштою і через будь-які заклади, крім аптечних, та поза ними (п. 27 Ліцензійних умов, затверджених постановою КМУ 30.11.2016 № 929). Купити фальсифікат або неякісні медичні препарати через онлайн дуже ймовірно, тому не замовляйте їх в інтернеті.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3><strong>Самолікування у мережі</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Самодіагностика у мережі часто пов’язана з народною медициною, гомеопатією та самолікуванням. За даними Всесвітньої організації охорони здоров’я сьогодні прихильниками народної та альтернативної медицини визнають себе понад 100 млн європейців.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Гомеопатія – це альтернативний вид медицини, тобто вона не доказова. У більшості випадків гомеопатія не нашкодить вам, але і не допоможе. Проте поки людина лікується за допомогою гомеопатії вона втрачає власний час на ефективне лікування, що може призвести до негативних наслідків для здоров’я. Жодне належне дослідження не довело, що гомеопатія здатна вилікувати будь-яку хворобу – від застуди до раку. Проте якщо виробник гомеопатичного препарату використав неякісну або небезпечну сировину або якщо процедура виробництва готових препаратів цієї категорії була порушена вони можуть зашкодити вашому здоров’ю.&nbsp; Детальніше про гомеопатію читайте за посиланням:&nbsp;<a href=\"https://bit.ly/38kb7vN\" target=\"_blank\" rel=\"noreferrer noopener\">https://bit.ly/38kb7vN</a>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Якщо самолікування точно шкідливе для вашого здоров’я без консультації з вашим лікарем, то самодіагностика може врятувати вам життя. Вчасне виявлення проблем дозволить розпочати кваліфіковане лікування.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Корисні онлайн-тести:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>Онлайн-скриніг на ризики туберкульозу розроблений Центром громадського здоров’я (ЦГЗ)&nbsp;<a href=\"http://tbtest.phc.org.ua/\" target=\"_blank\" rel=\"noreferrer noopener\">http://tbtest.phc.org.ua/</a></li><li>Опитувальник від Національного інституту раку про попередню діагностику раку шлунку та стравоходу&nbsp;<a href=\"https://bit.ly/2vnCXsi\" target=\"_blank\" rel=\"noreferrer noopener\">https://bit.ly/2vnCXsi</a></li><li>Тест на ВІЛ можна зробити у мобільному додатку&nbsp;<a href=\"https://hivtest.com.ua/ua/\" target=\"_blank\" rel=\"noreferrer noopener\">https://hivtest.com.ua/ua/</a>&nbsp;&nbsp;<a href=\"https://bit.ly/38i4qdH\" target=\"_blank\" rel=\"noreferrer noopener\">https://bit.ly/38i4qdH</a></li></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Пам’ятайте, що тести не можуть поставити вам діагноз. Вони лише вказують на необхідність звернутися до лікаря.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3><strong>Фейкові вакцини та теорії змов&nbsp;</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>На хвилі стурбованості коронавірусом інтернет-ресурси почали наповнюватися не лише статтями, жартами чи апокаліптичними теоріями, але і рекламою вакцин, що не існує від нового коронавірусу. Зараз вакцини від коронавірусу так само як і специфічного лікування немає.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Деякі ресурси активно пропагують антинаукові ідеї та недоказову медицину. Наприклад, СНІД-дисиденти. Це група людей, які вірять в те, що ВІЛ/СНІДу не існує, тому лікуватися не потрібно. На жаль, якщо ВІЛ-позитивний пацієнт перестане вживати АРВ-терапію це не лише погіршить його здоров’я, але й може призвести до смерті. Центр громадського здоров’я спільно з The Ukrainians підготували спецпроєкт про&nbsp; людей, яким поставили цей діагноз і вони продовжують жити завдяки лікуванню&nbsp;<a href=\"https://bit.ly/2OKro5l\" target=\"_blank\" rel=\"noreferrer noopener\">https://bit.ly/2OKro5l</a>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Також у мережі розгортаються інформаційні кампанії ботів про шкідливість щеплень. Ця тема активно використовується російськими тролями і ботами в інформаційній війні проти цілих держав. Але не лише боти розповсюджують інформацію, що підриває національну безпеку: це різного роду “експерти”, “лідери думок”, політики.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Один із популярних міфів те, що вакцини можуть викликати аутизм. Проте багато наукових досліджень спростовують такий зв’язок. Наприклад,&nbsp;<a href=\"https://moz.gov.ua/article/immunization/zvjazku-mizh-vakcinacieju-kpk-ta-autizmom-nemae---rezultati-masshtabnogo-doslidzhennja-\">чергові дані масштабного дослідження у Данії</a>&nbsp;підтвердили, що вакцинація проти кору, паротиту та краснухи не підвищує ризик аутизму. Про факти щодо вакцинації читайте тут:&nbsp;<a href=\"https://bit.ly/2w7AP8x\">https://bit.ly/2w7AP8x</a></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3><strong>Психічне здоров’я у мережі</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Соціальні мережі можуть бути корисними для роботи, спілкування та відпочинку. Проте тривале перебування в мережі може негативно вплинути на вас.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Британські дослідники проєкту #StatusOfMind дійшли висновку, що соціальна мережа Instagram найбільше шкодить ментальному здоров’ю. Дослідження охопило майже 1500 людей від 14 до 24 років. У ньому було проаналізовано 5 найпопулярніших соцмереж. За результатами опитування тривале перебування в Instagram викликає відчуття роздратування та незадоволеності життям, провокує людей на булінг та знущання&nbsp;<a href=\"https://bit.ly/37efCGU\" target=\"_blank\" rel=\"noreferrer noopener\">https://bit.ly/37efCGU</a>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Все ж соціальні мережі можуть стати позитивним досвідом, проте не варто забувати, що спілкування у реальному житті покращує наше самопочуття. На цьому також наголошує Національна служба здоров’я у Британії&nbsp;<a href=\"https://bit.ly/2tRKP52\" target=\"_blank\" rel=\"noreferrer noopener\">https://bit.ly/2tRKP52</a>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3><strong>Як вберегти своє здоров’я?</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul><li>Не витрачайте багато часу на соціальні мережі.</li><li>Звертайте увагу на джерело інформації та його компетенції.</li><li>Не купуйте лікарські препарати в інтернеті.</li><li>Не займайтеся самолікуванням за допомогою порад з мережі. Найкращий спосіб лікування – той, що порадив вам лікар.</li></ul>\n<!-- /wp:list -->', 'Безпечна медицина у мережі', '', 'draft', 'open', 'open', '', '', '', '', '2020-05-12 23:11:41', '2020-05-12 20:11:41', '', 0, 'http://medstat.shostka.ua/?p=36', 0, 'post', '', 0),
(37, 1, '2020-05-12 22:48:56', '2020-05-12 19:48:56', '', 'bes-med', '', 'inherit', 'open', 'closed', '', 'bes-med', '', '', '2020-05-12 22:48:56', '2020-05-12 19:48:56', '', 36, 'http://medstat.shostka.ua/wp-content/uploads/2020/05/bes-med.png', 0, 'attachment', 'image/png', 0),
(38, 1, '2020-05-12 22:50:02', '2020-05-12 19:50:02', '<!-- wp:image {\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"blob:http://medstat.shostka.ua/b998b0f1-4957-456b-bcf5-a6fbfe368f8b\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Інтернет полегшує життя у буденних справах. Ми можемо замовити собі продукти, речі, бронюємо квитки або власне місце у черзі до лікаря. Проте мережа не лише спрощує нам життя, але і створює нові небезпеки. Сьогодні МОЗ України долучається до Дня безпеки в Інтернеті та розповідає вам про фейкові вакцини, недоказову медицину, онлайн-аптеки та правила, що допоможуть вам захистися. </em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3><strong>Ліки через інтернет</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Онлайн-аптек МОЗ України не існує. Не варто замовляти ліки поштою. Згідно з законом, торгівля лікарськими засобами здійснюється виключно через аптечні заклади та не може здійснюватися дистанційно та шляхом електронної торгівлі, а також поштою і через будь-які заклади, крім аптечних, та поза ними (п. 27 Ліцензійних умов, затверджених постановою КМУ 30.11.2016 № 929). Купити фальсифікат або неякісні медичні препарати через онлайн дуже ймовірно, тому не замовляйте їх в інтернеті.</p>\n<!-- /wp:paragraph -->', 'Безпечна медицина у мережі', '', 'inherit', 'closed', 'closed', '', '36-revision-v1', '', '', '2020-05-12 22:50:02', '2020-05-12 19:50:02', '', 36, 'http://medstat.shostka.ua/?p=38', 0, 'revision', '', 0),
(39, 1, '2020-05-12 23:11:41', '2020-05-12 20:11:41', '<!-- wp:image {\"id\":37,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/bes-med.png\" alt=\"\" class=\"wp-image-37\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Інтернет полегшує життя у буденних справах. Ми можемо замовити собі продукти, речі, бронюємо квитки або власне місце у черзі до лікаря. Проте мережа не лише спрощує нам життя, але і створює нові небезпеки. Сьогодні МОЗ України долучається до Дня безпеки в Інтернеті та розповідає вам про фейкові вакцини, недоказову медицину, онлайн-аптеки та правила, що допоможуть вам захистися. </em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3><strong>Ліки через інтернет</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Онлайн-аптек МОЗ України не існує. Не варто замовляти ліки поштою. Згідно з законом, торгівля лікарськими засобами здійснюється виключно через аптечні заклади та не може здійснюватися дистанційно та шляхом електронної торгівлі, а також поштою і через будь-які заклади, крім аптечних, та поза ними (п. 27 Ліцензійних умов, затверджених постановою КМУ 30.11.2016 № 929). Купити фальсифікат або неякісні медичні препарати через онлайн дуже ймовірно, тому не замовляйте їх в інтернеті.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3><strong>Самолікування у мережі</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Самодіагностика у мережі часто пов’язана з народною медициною, гомеопатією та самолікуванням. За даними Всесвітньої організації охорони здоров’я сьогодні прихильниками народної та альтернативної медицини визнають себе понад 100 млн європейців.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Гомеопатія – це альтернативний вид медицини, тобто вона не доказова. У більшості випадків гомеопатія не нашкодить вам, але і не допоможе. Проте поки людина лікується за допомогою гомеопатії вона втрачає власний час на ефективне лікування, що може призвести до негативних наслідків для здоров’я. Жодне належне дослідження не довело, що гомеопатія здатна вилікувати будь-яку хворобу – від застуди до раку. Проте якщо виробник гомеопатичного препарату використав неякісну або небезпечну сировину або якщо процедура виробництва готових препаратів цієї категорії була порушена вони можуть зашкодити вашому здоров’ю.&nbsp; Детальніше про гомеопатію читайте за посиланням:&nbsp;<a href=\"https://bit.ly/38kb7vN\" target=\"_blank\" rel=\"noreferrer noopener\">https://bit.ly/38kb7vN</a>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Якщо самолікування точно шкідливе для вашого здоров’я без консультації з вашим лікарем, то самодіагностика може врятувати вам життя. Вчасне виявлення проблем дозволить розпочати кваліфіковане лікування.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Корисні онлайн-тести:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>Онлайн-скриніг на ризики туберкульозу розроблений Центром громадського здоров’я (ЦГЗ)&nbsp;<a href=\"http://tbtest.phc.org.ua/\" target=\"_blank\" rel=\"noreferrer noopener\">http://tbtest.phc.org.ua/</a></li><li>Опитувальник від Національного інституту раку про попередню діагностику раку шлунку та стравоходу&nbsp;<a href=\"https://bit.ly/2vnCXsi\" target=\"_blank\" rel=\"noreferrer noopener\">https://bit.ly/2vnCXsi</a></li><li>Тест на ВІЛ можна зробити у мобільному додатку&nbsp;<a href=\"https://hivtest.com.ua/ua/\" target=\"_blank\" rel=\"noreferrer noopener\">https://hivtest.com.ua/ua/</a>&nbsp;&nbsp;<a href=\"https://bit.ly/38i4qdH\" target=\"_blank\" rel=\"noreferrer noopener\">https://bit.ly/38i4qdH</a></li></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Пам’ятайте, що тести не можуть поставити вам діагноз. Вони лише вказують на необхідність звернутися до лікаря.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3><strong>Фейкові вакцини та теорії змов&nbsp;</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>На хвилі стурбованості коронавірусом інтернет-ресурси почали наповнюватися не лише статтями, жартами чи апокаліптичними теоріями, але і рекламою вакцин, що не існує від нового коронавірусу. Зараз вакцини від коронавірусу так само як і специфічного лікування немає.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Деякі ресурси активно пропагують антинаукові ідеї та недоказову медицину. Наприклад, СНІД-дисиденти. Це група людей, які вірять в те, що ВІЛ/СНІДу не існує, тому лікуватися не потрібно. На жаль, якщо ВІЛ-позитивний пацієнт перестане вживати АРВ-терапію це не лише погіршить його здоров’я, але й може призвести до смерті. Центр громадського здоров’я спільно з The Ukrainians підготували спецпроєкт про&nbsp; людей, яким поставили цей діагноз і вони продовжують жити завдяки лікуванню&nbsp;<a href=\"https://bit.ly/2OKro5l\" target=\"_blank\" rel=\"noreferrer noopener\">https://bit.ly/2OKro5l</a>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Також у мережі розгортаються інформаційні кампанії ботів про шкідливість щеплень. Ця тема активно використовується російськими тролями і ботами в інформаційній війні проти цілих держав. Але не лише боти розповсюджують інформацію, що підриває національну безпеку: це різного роду “експерти”, “лідери думок”, політики.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Один із популярних міфів те, що вакцини можуть викликати аутизм. Проте багато наукових досліджень спростовують такий зв’язок. Наприклад,&nbsp;<a href=\"https://moz.gov.ua/article/immunization/zvjazku-mizh-vakcinacieju-kpk-ta-autizmom-nemae---rezultati-masshtabnogo-doslidzhennja-\">чергові дані масштабного дослідження у Данії</a>&nbsp;підтвердили, що вакцинація проти кору, паротиту та краснухи не підвищує ризик аутизму. Про факти щодо вакцинації читайте тут:&nbsp;<a href=\"https://bit.ly/2w7AP8x\">https://bit.ly/2w7AP8x</a></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3><strong>Психічне здоров’я у мережі</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Соціальні мережі можуть бути корисними для роботи, спілкування та відпочинку. Проте тривале перебування в мережі може негативно вплинути на вас.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Британські дослідники проєкту #StatusOfMind дійшли висновку, що соціальна мережа Instagram найбільше шкодить ментальному здоров’ю. Дослідження охопило майже 1500 людей від 14 до 24 років. У ньому було проаналізовано 5 найпопулярніших соцмереж. За результатами опитування тривале перебування в Instagram викликає відчуття роздратування та незадоволеності життям, провокує людей на булінг та знущання&nbsp;<a href=\"https://bit.ly/37efCGU\" target=\"_blank\" rel=\"noreferrer noopener\">https://bit.ly/37efCGU</a>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Все ж соціальні мережі можуть стати позитивним досвідом, проте не варто забувати, що спілкування у реальному житті покращує наше самопочуття. На цьому також наголошує Національна служба здоров’я у Британії&nbsp;<a href=\"https://bit.ly/2tRKP52\" target=\"_blank\" rel=\"noreferrer noopener\">https://bit.ly/2tRKP52</a>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3><strong>Як вберегти своє здоров’я?</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:list -->\n<ul><li>Не витрачайте багато часу на соціальні мережі.</li><li>Звертайте увагу на джерело інформації та його компетенції.</li><li>Не купуйте лікарські препарати в інтернеті.</li><li>Не займайтеся самолікуванням за допомогою порад з мережі. Найкращий спосіб лікування – той, що порадив вам лікар.</li></ul>\n<!-- /wp:list -->', 'Безпечна медицина у мережі', '', 'inherit', 'closed', 'closed', '', '36-revision-v1', '', '', '2020-05-12 23:11:41', '2020-05-12 20:11:41', '', 36, 'http://medstat.shostka.ua/?p=39', 0, 'revision', '', 0),
(40, 1, '2020-05-12 23:22:59', '0000-00-00 00:00:00', '<!-- wp:image {\"id\":41,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/COVID-19.png\" alt=\"\" class=\"wp-image-41\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":42,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/izoljacija-2_page-0001-745x1024.jpg\" alt=\"\" class=\"wp-image-42\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":43,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/izoljacija-2_page-0002-739x1024.jpg\" alt=\"\" class=\"wp-image-43\"/></figure>\n<!-- /wp:image -->', 'Рекомендації для осіб, з підозрою або хворими на COVID-19, які перебувають вдома на самоізоляції', '', 'draft', 'open', 'open', '', '', '', '', '2020-05-12 23:22:59', '2020-05-12 20:22:59', '', 0, 'http://medstat.shostka.ua/?p=40', 0, 'post', '', 0),
(41, 1, '2020-05-12 23:20:08', '2020-05-12 20:20:08', '', 'COVID-19', '', 'inherit', 'open', 'closed', '', 'covid-19', '', '', '2020-05-12 23:20:08', '2020-05-12 20:20:08', '', 40, 'http://medstat.shostka.ua/wp-content/uploads/2020/05/COVID-19.png', 0, 'attachment', 'image/png', 0),
(42, 1, '2020-05-12 23:21:03', '2020-05-12 20:21:03', '', 'izoljacija-2_page-0001', '', 'inherit', 'open', 'closed', '', 'izoljacija-2_page-0001', '', '', '2020-05-12 23:21:03', '2020-05-12 20:21:03', '', 40, 'http://medstat.shostka.ua/wp-content/uploads/2020/05/izoljacija-2_page-0001.jpg', 0, 'attachment', 'image/jpeg', 0),
(43, 1, '2020-05-12 23:22:01', '2020-05-12 20:22:01', '', 'izoljacija-2_page-0002', '', 'inherit', 'open', 'closed', '', 'izoljacija-2_page-0002', '', '', '2020-05-12 23:22:01', '2020-05-12 20:22:01', '', 40, 'http://medstat.shostka.ua/wp-content/uploads/2020/05/izoljacija-2_page-0002.jpg', 0, 'attachment', 'image/jpeg', 0),
(44, 1, '2020-05-12 23:22:59', '2020-05-12 20:22:59', '<!-- wp:image {\"id\":41,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/COVID-19.png\" alt=\"\" class=\"wp-image-41\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":42,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/izoljacija-2_page-0001-745x1024.jpg\" alt=\"\" class=\"wp-image-42\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":43,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/izoljacija-2_page-0002-739x1024.jpg\" alt=\"\" class=\"wp-image-43\"/></figure>\n<!-- /wp:image -->', 'Рекомендації для осіб, з підозрою або хворими на COVID-19, які перебувають вдома на самоізоляції', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2020-05-12 23:22:59', '2020-05-12 20:22:59', '', 40, 'http://medstat.shostka.ua/?p=44', 0, 'revision', '', 0),
(45, 1, '2020-05-13 00:12:10', '0000-00-00 00:00:00', '<!-- wp:image {\"id\":46,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/leprshutterstock_280043105.jpg\" alt=\"\" class=\"wp-image-46\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p> Лепра є хронічним інфекційним захворюванням, що вражає периферичні нерви й шкіру,&nbsp;не передається при простому дотику хворого. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Джерелом зараження є хвора на лепру людина.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>За статистичним даними, в осіб, що зазнали небезпеки зараження лепрою, дійсно занедужують від 5% до 10%, тому що, на щастя, більшість людей має достатній рівень імунітету від збудника цієї хвороби.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Небезпека захворювання зростає при тривалому контакті з ураженою проказою шкірою.&nbsp;Однак треба зауважити, що шляхи зараження лепрою досі залишаються предметом дискусії – є теорії про зараження повітряно-крапельним шляхом, через шкіру, воду, ґрунт та навіть теорія генетичної схильності до хвороби.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"center\"} -->\n<p class=\"has-text-align-center\">Хвороба характеризується різноманіттям <strong>клінічних проявів</strong>. Спочатку на тілі людини з’являються бурувато-жовті плями, особливо на обличчі, кінцівках, сідницях. Насамперед у хворого з’являється пляма на спині, зовсім нечутлива на дотик. Пізніше, ці плями перетворюються на горбики та вузлики діаметром до 3 см, синюватого кольору. Обличчя хворого стає схожим на “лев’ячу морду” — зморшки та складки на обличчі поглиблюються, ніс потовщується, різко виступають надбрівні дуги. Брови та вії випадають. Хвороба може розвиватися і прогресувати до 15 років.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Загалом, при загостреннях лепри, якщо її не лікувати, може наступити <strong>смерть.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Чинниками</strong>, що можуть провокувати розвиток прокази, є низький рівень життя та санітарної культури, хронічні шкідливі захворювання — алкоголізм та наркоманія, часті вірусні інфекції. Також до факторів ризику сюди відносять емоційні стреси, зловживання препаратами йоду та оперативні втручання.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Виявити </strong>хворобу можна тільки за допомогою лабораторної діагностики. Дослідження проводять із зіскребу висипу, у сироватці крові, у біоптатах шкіри тощо.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Лікування</strong> здійснює тільки лікар. Хворих ізолюють у спеціальних медичних закладах — лепрозоріях.&nbsp;Зараз в арсеналі лікарів є ефективні препарати, які при сучасній діагностиці забезпечують повне одужання&nbsp; протягом 3-х років.&nbsp;Людина при цьому лікується в лепрозорії або за місцем проживання, якщо встановлено відсутність збудника.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Щодо профілактики</strong> — то вона полягає в дотриманні санітарно-гігієнічних правил: треба часто мити руки, уникати подорожей в ті країни, де зафіксували лепру, щоб уникнути небажаних контактів з можливими носіями або хворими на проказу.</p>\n<!-- /wp:paragraph -->', 'ПРОКАЗА - тяжке хронічне інфекційне захворювання', '', 'draft', 'open', 'open', '', '', '', '', '2020-05-13 00:12:10', '2020-05-12 21:12:10', '', 0, 'http://medstat.shostka.ua/?p=45', 0, 'post', '', 0),
(46, 1, '2020-05-12 23:28:49', '2020-05-12 20:28:49', '', 'leprshutterstock_280043105', '', 'inherit', 'open', 'closed', '', 'leprshutterstock_280043105', '', '', '2020-05-12 23:28:49', '2020-05-12 20:28:49', '', 45, 'http://medstat.shostka.ua/wp-content/uploads/2020/05/leprshutterstock_280043105.jpg', 0, 'attachment', 'image/jpeg', 0),
(47, 1, '2020-05-12 23:32:37', '2020-05-12 20:32:37', '<!-- wp:image {\"id\":46,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/leprshutterstock_280043105.jpg\" alt=\"\" class=\"wp-image-46\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p> Лепра є хронічним інфекційним захворюванням, що вражає периферичні нерви й шкіру, не передається при простому дотику хворого. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Джерелом зараження є хвора на лепру людина.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>За статистичним даними, в осіб, що зазнали небезпеки зараження лепрою, дійсно занедужують від 5% до 10%, тому що, на щастя, більшість людей має достатній рівень імунітету від збудника цієї хвороби.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Небезпека захворювання зростає при тривалому контакті з ураженою проказою шкірою.&nbsp;Однак треба зауважити, що шляхи зараження лепрою досі залишаються предметом дискусії – є теорії про зараження повітряно-крапельним шляхом, через шкіру, воду, ґрунт та навіть теорія генетичної схильності до хвороби.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"center\"} -->\n<p class=\"has-text-align-center\">Хвороба характеризується різноманіттям <strong>клінічних проявів</strong>. Спочатку на тілі людини з’являються бурувато-жовті плями, особливо на обличчі, кінцівках, сідницях. Насамперед у хворого з’являється пляма на спині, зовсім нечутлива на дотик. Пізніше, ці плями перетворюються на горбики та вузлики діаметром до 3 см, синюватого кольору. Обличчя хворого стає схожим на “лев’ячу морду” — зморшки та складки на обличчі поглиблюються, ніс потовщується, різко виступають надбрівні дуги. Брови та вії випадають. Хвороба може розвиватися і прогресувати до 15 років.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Загалом, при загостреннях лепри, якщо її не лікувати, може наступити <strong>смерть.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Чинниками</strong>, що можуть провокувати розвиток прокази, є низький рівень життя та санітарної культури, хронічні шкідливі захворювання — алкоголізм та наркоманія, часті вірусні інфекції. Також до факторів ризику сюди відносять емоційні стреси, зловживання препаратами йоду та оперативні втручання.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Виявити </strong>хворобу можна тільки за допомогою лабораторної діагностики. Дослідження проводять із зіскребу висипу, у сироватці крові, у біоптатах шкіри тощо.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Лікування</strong> здійснює тільки лікар. Хворих ізолюють у спеціальних медичних закладах — лепрозоріях. Зараз в арсеналі лікарів є ефективні препарати, які при сучасній діагностиці забезпечують повне одужання  протягом 3-х років. Людина при цьому лікується в лепрозорії або за місцем проживання, якщо встановлено відсутність збудника.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Щодо профілактики</strong> — то вона полягає в дотриманні санітарно-гігієнічних правил: треба часто мити руки, уникати подорожей в ті країни, де зафіксували лепру, щоб уникнути небажаних контактів з можливими носіями або хворими на проказу.</p>\n<!-- /wp:paragraph -->', 'Тяжке хронічне інфекційне захворювання', '', 'inherit', 'closed', 'closed', '', '45-revision-v1', '', '', '2020-05-12 23:32:37', '2020-05-12 20:32:37', '', 45, 'http://medstat.shostka.ua/?p=47', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(48, 1, '2020-05-12 23:39:38', '0000-00-00 00:00:00', '<!-- wp:image {\"id\":49,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/Tuberkulez.jpg\" alt=\"\" class=\"wp-image-49\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><strong>Туберкульоз</strong>&nbsp;– це інфекційне (заразне) захворювання, збудником якого є мікобактерія туберкульозу (Mykobacterium tuberculosis). Найчастіше цього збудника називають бацилою або паличкою Коха, на честь науковця, який відкрив її у 1882 р.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Туберкульоз передається переважно повітряно-крапельним шляхом від хворої людини до здорової. Туберкульоз у більшості випадків вражає легені, але захворювання може виникнути у будь-якому органі, наприклад, нирках, хребті, мозку, лімфатичних вузлах, кишечнику, шкірі, статевих органах тощо.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Туберкульозом заражаються при вдиханні повітря, в якому є збудник захворювання – мікобактерія туберкульозу.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Цей мікроорганізм є стійким до навколишнього середовища. Мікобактерія туберкульозу не боїться холоду і нетривалого впливу високих температур. Вона довгиий час зберігається у навколишньому середовищі: у пилу, ґрунті, снігу, льоді. Легко потрапляє в організм людини, проте, частіше не викликає захворювання, а вступає в “мирні” відносини з імунною системою організму, яка контролює її перебування в організмі. В “мирних” стосунках з людиною паличка Коха знаходиться в “сплячому” стані в організмах у більшості інфікованих осіб, проте, захворювання не розвивається протягом життя. Лише у 10 % осіб, які інфікувалися паличкою Коха, розвивається захворювання.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Це, насамперед, особи з ослабленою імунною системою внаслідок багатьох захворювань. В першу чергу, ВІЛ-інфекція, яка вражає імунну систему, а також інші хвороби, які значно її ослаблюють: цукровий діабет, захворювання, при яких людина повинна приймати препарати, які пригнічують імунну систему.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Крім зазначених категорій осіб, що мають підвищений ризик до цієї хвороби, на туберкульоз, можуть захворіти особи, в яких імунна система зазнала ослаблення через надмірне перевантаження і виснаження організму. Такі стани бувають при перевтомі, надмірній праці і постійних стресових ситуаціях, поганому харчуванні, зловживанні алкоголем, наркотиками, тютюном тощо.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>На туберкульоз можуть захворіти навіть особи з міцним імунітетом при масивному попаданні збудника захворювання в організм. Такі ситуації зазвичай виникають при близькому контакті з хворою на активний туберкульоз людиною через кашель, чхання, при розмові або попаданні в організм великої кількості повітря, яке заражене мікобактерією туберкульозу. Зараження може відбутися в закритих приміщеннях, які погано провітрюються, де перебуває або перебувала хвора на туберкульоз людина, у громадському транспорті, в магазині, кінотеатрі та будь-яких громадських приміщеннях з великим скупченням людей.<br>Пам’ятайте, що на відкритому просторі ризик зараження туберкульозом менший, ніж у закритому приміщенні!!!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Симптоми туберкульозу.</strong><br>Туберкульоз тривалий час розвивається в організмі людини без будь-яких зовнішніх ознак. У цей період мікобактерія туберкульозу, яка потрапила в легені, починає розмножуватись в легенях або інших органах, а імунна система намагається зупинити або сповільнити цю агресію. Коли ступінь ураження органу набуває значних розмірів, людина починає відчувати нездужання і в неї&nbsp;спостерігається:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>• кашель, що триває понад 2-3 тижні;<br>• рясне потовиділення вночі;<br>• слабкість;<br>• безпричинна втрата ваги;<br>• підвищення температури тіла до 37 і більше градусів без видимої на те причини, що триває понад тиждень.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>В деяких випадках може бути кровохаркання, біль у грудній клітці, задишка.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Будьте на сторожі свого здоров’я та здоров’я свої дітей та близьких!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Туберкульоз виліковний!</strong> Тому, за наявності хоча б декількох із перерахованих симптомів, Ви маєте звернутися до лікаря для обстеження на туберкульоз.</p>\n<!-- /wp:paragraph -->', 'Що треба знати про туберкульоз', '', 'draft', 'open', 'open', '', '', '', '', '2020-05-12 23:39:38', '2020-05-12 20:39:38', '', 0, 'http://medstat.shostka.ua/?p=48', 0, 'post', '', 0),
(49, 1, '2020-05-12 23:38:13', '2020-05-12 20:38:13', '', 'Tuberkulez', '', 'inherit', 'open', 'closed', '', 'tuberkulez', '', '', '2020-05-12 23:38:13', '2020-05-12 20:38:13', '', 48, 'http://medstat.shostka.ua/wp-content/uploads/2020/05/Tuberkulez.jpg', 0, 'attachment', 'image/jpeg', 0),
(50, 1, '2020-05-12 23:39:38', '2020-05-12 20:39:38', '<!-- wp:image {\"id\":49,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/Tuberkulez.jpg\" alt=\"\" class=\"wp-image-49\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><strong>Туберкульоз</strong>&nbsp;– це інфекційне (заразне) захворювання, збудником якого є мікобактерія туберкульозу (Mykobacterium tuberculosis). Найчастіше цього збудника називають бацилою або паличкою Коха, на честь науковця, який відкрив її у 1882 р.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Туберкульоз передається переважно повітряно-крапельним шляхом від хворої людини до здорової. Туберкульоз у більшості випадків вражає легені, але захворювання може виникнути у будь-якому органі, наприклад, нирках, хребті, мозку, лімфатичних вузлах, кишечнику, шкірі, статевих органах тощо.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Туберкульозом заражаються при вдиханні повітря, в якому є збудник захворювання – мікобактерія туберкульозу.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Цей мікроорганізм є стійким до навколишнього середовища. Мікобактерія туберкульозу не боїться холоду і нетривалого впливу високих температур. Вона довгиий час зберігається у навколишньому середовищі: у пилу, ґрунті, снігу, льоді. Легко потрапляє в організм людини, проте, частіше не викликає захворювання, а вступає в “мирні” відносини з імунною системою організму, яка контролює її перебування в організмі. В “мирних” стосунках з людиною паличка Коха знаходиться в “сплячому” стані в організмах у більшості інфікованих осіб, проте, захворювання не розвивається протягом життя. Лише у 10 % осіб, які інфікувалися паличкою Коха, розвивається захворювання.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Це, насамперед, особи з ослабленою імунною системою внаслідок багатьох захворювань. В першу чергу, ВІЛ-інфекція, яка вражає імунну систему, а також інші хвороби, які значно її ослаблюють: цукровий діабет, захворювання, при яких людина повинна приймати препарати, які пригнічують імунну систему.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Крім зазначених категорій осіб, що мають підвищений ризик до цієї хвороби, на туберкульоз, можуть захворіти особи, в яких імунна система зазнала ослаблення через надмірне перевантаження і виснаження організму. Такі стани бувають при перевтомі, надмірній праці і постійних стресових ситуаціях, поганому харчуванні, зловживанні алкоголем, наркотиками, тютюном тощо.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>На туберкульоз можуть захворіти навіть особи з міцним імунітетом при масивному попаданні збудника захворювання в організм. Такі ситуації зазвичай виникають при близькому контакті з хворою на активний туберкульоз людиною через кашель, чхання, при розмові або попаданні в організм великої кількості повітря, яке заражене мікобактерією туберкульозу. Зараження може відбутися в закритих приміщеннях, які погано провітрюються, де перебуває або перебувала хвора на туберкульоз людина, у громадському транспорті, в магазині, кінотеатрі та будь-яких громадських приміщеннях з великим скупченням людей.<br>Пам’ятайте, що на відкритому просторі ризик зараження туберкульозом менший, ніж у закритому приміщенні!!!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Симптоми туберкульозу.</strong><br>Туберкульоз тривалий час розвивається в організмі людини без будь-яких зовнішніх ознак. У цей період мікобактерія туберкульозу, яка потрапила в легені, починає розмножуватись в легенях або інших органах, а імунна система намагається зупинити або сповільнити цю агресію. Коли ступінь ураження органу набуває значних розмірів, людина починає відчувати нездужання і в неї&nbsp;спостерігається:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>• кашель, що триває понад 2-3 тижні;<br>• рясне потовиділення вночі;<br>• слабкість;<br>• безпричинна втрата ваги;<br>• підвищення температури тіла до 37 і більше градусів без видимої на те причини, що триває понад тиждень.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>В деяких випадках може бути кровохаркання, біль у грудній клітці, задишка.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Будьте на сторожі свого здоров’я та здоров’я свої дітей та близьких!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Туберкульоз виліковний!</strong> Тому, за наявності хоча б декількох із перерахованих симптомів, Ви маєте звернутися до лікаря для обстеження на туберкульоз.</p>\n<!-- /wp:paragraph -->', 'Що треба знати про туберкульоз', '', 'inherit', 'closed', 'closed', '', '48-revision-v1', '', '', '2020-05-12 23:39:38', '2020-05-12 20:39:38', '', 48, 'http://medstat.shostka.ua/?p=50', 0, 'revision', '', 0),
(51, 1, '2020-05-12 23:40:04', '2020-05-12 20:40:04', '<!-- wp:paragraph -->\n<p>Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите ее, затем начинайте создавать!</p>\n<!-- /wp:paragraph -->', 'Привет, мир!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2020-05-12 23:40:04', '2020-05-12 20:40:04', '', 1, 'http://medstat.shostka.ua/?p=51', 0, 'revision', '', 0),
(52, 1, '2020-05-12 23:50:50', '0000-00-00 00:00:00', '<!-- wp:image {\"id\":53,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/100689675-1024x683-1.jpg\" alt=\"\" class=\"wp-image-53\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><strong>Паліативна допомога&nbsp;</strong>— це вид медичної допомоги для людей із серйозними хворобами. Завданням цього типу допомоги є полегшити симптоми і зменшити страждання від серйозної хвороби.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Хоспісна медицина</strong>&nbsp;– це складова паліативної медицини, основним завданням якої є забезпечити максимально можливу якість життя паліативних хворих в термінальному періоді прогресування захворювання, шляхом своєчасної діагностики больового синдрому та розладів життєдіяльності, запобігання та полегшення страждань методами ад’ювантної терапії, кваліфікованого медичного догляду фахівцями, які одержали спеціальну підготовку з надання паліативної та хоспісної допомоги.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Мета&nbsp;</strong>— покращити якість життя як пацієнта, так і сім’ї, рідних та близьких, забезпечити максимальну якість життя пацієнта з невиліковним (смертельним) захворюванням і членів його родини, шляхом запобігання та полегшення страждань завдяки ранньому виявленню і точному діагностуванню (оцінці) проблем, що виникають, та проведення адекватних лікувальних заходів (при больовому синдромі та інших розладах життєдіяльності), а також надання психосоціальної та моральної підтримки.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Відповідно до сучасних міжнародних підходів та концепцій, паліативна медицина повинна бути невід’ємною, інтегрованою складовою медичного обслуговування та соціальної опіки.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Паліативна і хоспісна допомога:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>Забезпечує полегшення болю та інших симптомів або розладів життєдіяльності, що спричиняють страждання;</li><li>Стверджує життя та розглядає смерть як природній процес;</li><li>Не має на меті прискорення чи уповільнення настання смерті;</li><li>Поєднує соціальні, психологічні й духовні аспекти піклування про пацієнта;</li><li>Пропонує систему підтримки, що допомагає пацієнту жити активно, наскільки це можливо, до самої смерті;</li><li>Пропонує систему підтримки, що допомагає родині пережити важкі часи хвороби пацієнта та тяжкої втрати – смерті рідної та близької людини;</li><li>Використовує комплексний міждисциплінарний (командний) підхід, направлений на потреби пацієнта та його сім’ї;</li><li>Покращує якість життя і позитивно впливає на перебіг хвороби;</li><li>Призначається незалежно від стадії захворювання або основного лікування, в поєднанні з іншою терапією, яка забезпечує подовження життя, наприклад, така як хіміотерапія і променева терапія, та включає дослідження, що необхідні для кращого розуміння динаміки захворювання, контролю та запобігання клінічних ускладнень.</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>КНП «Шосткинський районний центр ПМСД» надає первинну паліативну допомогу, тобто на первинному рівні в амбулаторно-поліклінічних умовах або вдома лікарями загальної практики-сімейної медицини.</p>\n<!-- /wp:paragraph -->', 'Основні принципи паліативної і хоспісної допомоги', '', 'draft', 'open', 'open', '', '', '', '', '2020-05-12 23:50:50', '2020-05-12 20:50:50', '', 0, 'http://medstat.shostka.ua/?p=52', 0, 'post', '', 0),
(53, 1, '2020-05-12 23:50:23', '2020-05-12 20:50:23', '', '100689675-1024x683-1', '', 'inherit', 'open', 'closed', '', '100689675-1024x683-1', '', '', '2020-05-12 23:50:23', '2020-05-12 20:50:23', '', 52, 'http://medstat.shostka.ua/wp-content/uploads/2020/05/100689675-1024x683-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(54, 1, '2020-05-12 23:50:50', '2020-05-12 20:50:50', '<!-- wp:image {\"id\":53,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/100689675-1024x683-1.jpg\" alt=\"\" class=\"wp-image-53\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><strong>Паліативна допомога&nbsp;</strong>— це вид медичної допомоги для людей із серйозними хворобами. Завданням цього типу допомоги є полегшити симптоми і зменшити страждання від серйозної хвороби.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Хоспісна медицина</strong>&nbsp;– це складова паліативної медицини, основним завданням якої є забезпечити максимально можливу якість життя паліативних хворих в термінальному періоді прогресування захворювання, шляхом своєчасної діагностики больового синдрому та розладів життєдіяльності, запобігання та полегшення страждань методами ад’ювантної терапії, кваліфікованого медичного догляду фахівцями, які одержали спеціальну підготовку з надання паліативної та хоспісної допомоги.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Мета&nbsp;</strong>— покращити якість життя як пацієнта, так і сім’ї, рідних та близьких, забезпечити максимальну якість життя пацієнта з невиліковним (смертельним) захворюванням і членів його родини, шляхом запобігання та полегшення страждань завдяки ранньому виявленню і точному діагностуванню (оцінці) проблем, що виникають, та проведення адекватних лікувальних заходів (при больовому синдромі та інших розладах життєдіяльності), а також надання психосоціальної та моральної підтримки.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Відповідно до сучасних міжнародних підходів та концепцій, паліативна медицина повинна бути невід’ємною, інтегрованою складовою медичного обслуговування та соціальної опіки.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Паліативна і хоспісна допомога:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>Забезпечує полегшення болю та інших симптомів або розладів життєдіяльності, що спричиняють страждання;</li><li>Стверджує життя та розглядає смерть як природній процес;</li><li>Не має на меті прискорення чи уповільнення настання смерті;</li><li>Поєднує соціальні, психологічні й духовні аспекти піклування про пацієнта;</li><li>Пропонує систему підтримки, що допомагає пацієнту жити активно, наскільки це можливо, до самої смерті;</li><li>Пропонує систему підтримки, що допомагає родині пережити важкі часи хвороби пацієнта та тяжкої втрати – смерті рідної та близької людини;</li><li>Використовує комплексний міждисциплінарний (командний) підхід, направлений на потреби пацієнта та його сім’ї;</li><li>Покращує якість життя і позитивно впливає на перебіг хвороби;</li><li>Призначається незалежно від стадії захворювання або основного лікування, в поєднанні з іншою терапією, яка забезпечує подовження життя, наприклад, така як хіміотерапія і променева терапія, та включає дослідження, що необхідні для кращого розуміння динаміки захворювання, контролю та запобігання клінічних ускладнень.</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>КНП «Шосткинський районний центр ПМСД» надає первинну паліативну допомогу, тобто на первинному рівні в амбулаторно-поліклінічних умовах або вдома лікарями загальної практики-сімейної медицини.</p>\n<!-- /wp:paragraph -->', 'Основні принципи паліативної і хоспісної допомоги', '', 'inherit', 'closed', 'closed', '', '52-revision-v1', '', '', '2020-05-12 23:50:50', '2020-05-12 20:50:50', '', 52, 'http://medstat.shostka.ua/?p=54', 0, 'revision', '', 0),
(55, 1, '2020-05-13 00:03:20', '0000-00-00 00:00:00', '<!-- wp:image {\"id\":56,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/97477550_266187634564645_6314089803340054528_n.jpg\" alt=\"\" class=\"wp-image-56\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>ЩО ТАКЕ МЕЛАНОМА</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Меланома  – злоякісна пухлина, яка розвивається з меланоцитів (пігментні клітини, що продукують меланіни). Пухлина переважно локалізується в шкірі, значно рідше в сітківці ока, на слизових оболонках (порожнина рота і носа, періанальної і вульвовагінальної областях) тощо.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>ХТО У ГРУПІ РИЗИКУ </h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Фактори ризику:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>біла шкіра, світлі (блакитні) очі, світле волосся та рожеві веснянки;</li><li>наявність в анамнезі сонячних опіків (навіть ті опіки,&nbsp;які ви отримали в дитячому, підлітковому і юнацькому віці, можуть зіграти фатальну роль у розвитку пухлини в наступні роки);</li><li>надмірний вплив ультрафіолетового випромінювання - навіть штучного в солярії;</li><li>якщо у вас раніше чи у ваших родичів була меланома (особистий чи сімейний анамнез меланоми;</li><li>невуси (родимки): 70% – вроджених, 30% –&nbsp; набутих, понад 50 невусів на шкірі збільшує ризик розвитку меланоми;</li><li>травматизація та зміна характеристик невусів;</li><li>вік – старше 50 років;</li><li>чоловіча стать.</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>ЯК ВИЯВИТИ ХВОРОБУ: ОЗНАКИ МЕЛАНОМИ І ДІАГНОСТИКА</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p><strong>Дерматоскопія</strong>&nbsp;— найперша діагностика меланоми. Проводиться за допомогою простої лупи або дерматоскопа (епілюмінісцентного мікроскопа), який робить прозорим поверхневий шар шкіри-епідермісу.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Клінічно меланома шкіри проявляється пухлиноподібним щільним вузликом чорного забарвлення, іноді з синім відтінком, від 0,5 см до 2 – 3 см у діаметрі, округлої чи овальної форми з нерівними краями. Зрідка зустрічаються безпігментні меланоми рожевого кольору (ахроматична меланома). Часто на поверхні пухлини виникають ерозії чи виразки, які кровоточать, а також кірочки, лущення. У 10% випадків зустрічається так звана піднігтева меланома.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>У 50 – 70% випадків меланома шкіри виникає в ділянці пігментної плями, родимки внаслідок:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>надмірної інсоляції, у тому числі в солярії;</li><li>травмування шкіри в ділянці родимок (тертя, бриття, подразнення хімічними чинниками тощо);</li><li>самолікування (із застосуванням подразнюючих засобів);</li><li>гормональних розладів, розвитку імунодефіцитних станів тощо.</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Ознаками переродження невусів (родимок) у меланому є:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>поява в ділянці невуса неприємних відчуттів (поколювання, свербіж, біль);</li><li>зміна кольору (набуття синього або чорного забарвлення);</li><li>зміна форми невуса, його країв, збільшення у розмірах;</li><li>зміна поверхні (підвищення над рівнем шкіри, поява бугристості чи поява мокріння, кровоточивості).</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>ЯКЩО З\'ЯВИЛИСЬ ЗМІНИ У ДІЛЯНЦІ РОДИМКИ ТА ОЗНАК МЕЛАНОМИ, &nbsp;НЕГАЙНО ЗВЕРНІТЬСЯ ДО ЛІКАРЯ. У &nbsp;ЖОДНОМУ РАЗІ НЕ ЗАЙМАТЕСЯ САМОЛІКУВАННЯМ.</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Для кращого запам’ятовування ознак переродження невусів (родимок) у меланому створено шкалу «ABCDE» та шкалу «АКОРД»:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>A (Asymmetry) – асиметрія невуса;</li><li>B (Border) – край нерівний або нечіткий;</li><li>C (Colour) – колір невуса на різних ділянках різний;</li><li>D (Diameter) – діаметер перевищує5 мм;</li><li>E (Enlargement) – ріст (швидке збільшення в розмірі).</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>ПРОФІЛАКТИКА МЕЛАНОМИ</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Щоби попередити розвиток меланоми:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>уникайте сонячних опіків шкіри - застосовуйте&nbsp;захисні креми;</li><li>уникайте травмування шкіри в ділянці родимок;</li><li>уникайте контакту шкіри в ділянці родимок із хімічними подразниками;</li><li>регулярно оглядайте&nbsp;шкіру&nbsp;та своєчасно&nbsp;звертайтесь до лікаря при будь-яких змінах.</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Скринінг - одна із форм раннього виявлення злоякісних пухлин при профілактичному обстеженні. Якщо ви в групі ризику, то кожних два роки маєте проходити обстеження у лікаря-онколога (фізикальний метод - огляд, пальпація). Також усім вато періодично проводити самообстеження.  </p>\n<!-- /wp:paragraph -->', 'Меланома-один з найнебезпечніших видів раку', '', 'draft', 'open', 'open', '', '', '', '', '2020-05-13 00:03:20', '2020-05-12 21:03:20', '', 0, 'http://medstat.shostka.ua/?p=55', 0, 'post', '', 0),
(56, 1, '2020-05-12 23:56:43', '2020-05-12 20:56:43', '', '97477550_266187634564645_6314089803340054528_n', '', 'inherit', 'open', 'closed', '', '97477550_266187634564645_6314089803340054528_n', '', '', '2020-05-12 23:56:43', '2020-05-12 20:56:43', '', 55, 'http://medstat.shostka.ua/wp-content/uploads/2020/05/97477550_266187634564645_6314089803340054528_n.jpg', 0, 'attachment', 'image/jpeg', 0),
(57, 1, '2020-05-13 00:03:20', '2020-05-12 21:03:20', '<!-- wp:image {\"id\":56,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/97477550_266187634564645_6314089803340054528_n.jpg\" alt=\"\" class=\"wp-image-56\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>ЩО ТАКЕ МЕЛАНОМА</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Меланома  – злоякісна пухлина, яка розвивається з меланоцитів (пігментні клітини, що продукують меланіни). Пухлина переважно локалізується в шкірі, значно рідше в сітківці ока, на слизових оболонках (порожнина рота і носа, періанальної і вульвовагінальної областях) тощо.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>ХТО У ГРУПІ РИЗИКУ </h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Фактори ризику:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>біла шкіра, світлі (блакитні) очі, світле волосся та рожеві веснянки;</li><li>наявність в анамнезі сонячних опіків (навіть ті опіки,&nbsp;які ви отримали в дитячому, підлітковому і юнацькому віці, можуть зіграти фатальну роль у розвитку пухлини в наступні роки);</li><li>надмірний вплив ультрафіолетового випромінювання - навіть штучного в солярії;</li><li>якщо у вас раніше чи у ваших родичів була меланома (особистий чи сімейний анамнез меланоми;</li><li>невуси (родимки): 70% – вроджених, 30% –&nbsp; набутих, понад 50 невусів на шкірі збільшує ризик розвитку меланоми;</li><li>травматизація та зміна характеристик невусів;</li><li>вік – старше 50 років;</li><li>чоловіча стать.</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>ЯК ВИЯВИТИ ХВОРОБУ: ОЗНАКИ МЕЛАНОМИ І ДІАГНОСТИКА</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p><strong>Дерматоскопія</strong>&nbsp;— найперша діагностика меланоми. Проводиться за допомогою простої лупи або дерматоскопа (епілюмінісцентного мікроскопа), який робить прозорим поверхневий шар шкіри-епідермісу.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Клінічно меланома шкіри проявляється пухлиноподібним щільним вузликом чорного забарвлення, іноді з синім відтінком, від 0,5 см до 2 – 3 см у діаметрі, округлої чи овальної форми з нерівними краями. Зрідка зустрічаються безпігментні меланоми рожевого кольору (ахроматична меланома). Часто на поверхні пухлини виникають ерозії чи виразки, які кровоточать, а також кірочки, лущення. У 10% випадків зустрічається так звана піднігтева меланома.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>У 50 – 70% випадків меланома шкіри виникає в ділянці пігментної плями, родимки внаслідок:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>надмірної інсоляції, у тому числі в солярії;</li><li>травмування шкіри в ділянці родимок (тертя, бриття, подразнення хімічними чинниками тощо);</li><li>самолікування (із застосуванням подразнюючих засобів);</li><li>гормональних розладів, розвитку імунодефіцитних станів тощо.</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Ознаками переродження невусів (родимок) у меланому є:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>поява в ділянці невуса неприємних відчуттів (поколювання, свербіж, біль);</li><li>зміна кольору (набуття синього або чорного забарвлення);</li><li>зміна форми невуса, його країв, збільшення у розмірах;</li><li>зміна поверхні (підвищення над рівнем шкіри, поява бугристості чи поява мокріння, кровоточивості).</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>ЯКЩО З\'ЯВИЛИСЬ ЗМІНИ У ДІЛЯНЦІ РОДИМКИ ТА ОЗНАК МЕЛАНОМИ, &nbsp;НЕГАЙНО ЗВЕРНІТЬСЯ ДО ЛІКАРЯ. У &nbsp;ЖОДНОМУ РАЗІ НЕ ЗАЙМАТЕСЯ САМОЛІКУВАННЯМ.</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Для кращого запам’ятовування ознак переродження невусів (родимок) у меланому створено шкалу «ABCDE» та шкалу «АКОРД»:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>A (Asymmetry) – асиметрія невуса;</li><li>B (Border) – край нерівний або нечіткий;</li><li>C (Colour) – колір невуса на різних ділянках різний;</li><li>D (Diameter) – діаметер перевищує5 мм;</li><li>E (Enlargement) – ріст (швидке збільшення в розмірі).</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>ПРОФІЛАКТИКА МЕЛАНОМИ</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Щоби попередити розвиток меланоми:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>уникайте сонячних опіків шкіри - застосовуйте&nbsp;захисні креми;</li><li>уникайте травмування шкіри в ділянці родимок;</li><li>уникайте контакту шкіри в ділянці родимок із хімічними подразниками;</li><li>регулярно оглядайте&nbsp;шкіру&nbsp;та своєчасно&nbsp;звертайтесь до лікаря при будь-яких змінах.</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Скринінг - одна із форм раннього виявлення злоякісних пухлин при профілактичному обстеженні. Якщо ви в групі ризику, то кожних два роки маєте проходити обстеження у лікаря-онколога (фізикальний метод - огляд, пальпація). Також усім вато періодично проводити самообстеження.  </p>\n<!-- /wp:paragraph -->', 'Меланома-один з найнебезпечніших видів раку', '', 'inherit', 'closed', 'closed', '', '55-revision-v1', '', '', '2020-05-13 00:03:20', '2020-05-12 21:03:20', '', 55, 'http://medstat.shostka.ua/?p=57', 0, 'revision', '', 0),
(58, 1, '2020-05-13 00:12:10', '2020-05-12 21:12:10', '<!-- wp:image {\"id\":46,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://medstat.shostka.ua/wp-content/uploads/2020/05/leprshutterstock_280043105.jpg\" alt=\"\" class=\"wp-image-46\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p> Лепра є хронічним інфекційним захворюванням, що вражає периферичні нерви й шкіру,&nbsp;не передається при простому дотику хворого. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Джерелом зараження є хвора на лепру людина.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>За статистичним даними, в осіб, що зазнали небезпеки зараження лепрою, дійсно занедужують від 5% до 10%, тому що, на щастя, більшість людей має достатній рівень імунітету від збудника цієї хвороби.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Небезпека захворювання зростає при тривалому контакті з ураженою проказою шкірою.&nbsp;Однак треба зауважити, що шляхи зараження лепрою досі залишаються предметом дискусії – є теорії про зараження повітряно-крапельним шляхом, через шкіру, воду, ґрунт та навіть теорія генетичної схильності до хвороби.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"center\"} -->\n<p class=\"has-text-align-center\">Хвороба характеризується різноманіттям <strong>клінічних проявів</strong>. Спочатку на тілі людини з’являються бурувато-жовті плями, особливо на обличчі, кінцівках, сідницях. Насамперед у хворого з’являється пляма на спині, зовсім нечутлива на дотик. Пізніше, ці плями перетворюються на горбики та вузлики діаметром до 3 см, синюватого кольору. Обличчя хворого стає схожим на “лев’ячу морду” — зморшки та складки на обличчі поглиблюються, ніс потовщується, різко виступають надбрівні дуги. Брови та вії випадають. Хвороба може розвиватися і прогресувати до 15 років.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Загалом, при загостреннях лепри, якщо її не лікувати, може наступити <strong>смерть.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Чинниками</strong>, що можуть провокувати розвиток прокази, є низький рівень життя та санітарної культури, хронічні шкідливі захворювання — алкоголізм та наркоманія, часті вірусні інфекції. Також до факторів ризику сюди відносять емоційні стреси, зловживання препаратами йоду та оперативні втручання.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Виявити </strong>хворобу можна тільки за допомогою лабораторної діагностики. Дослідження проводять із зіскребу висипу, у сироватці крові, у біоптатах шкіри тощо.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Лікування</strong> здійснює тільки лікар. Хворих ізолюють у спеціальних медичних закладах — лепрозоріях.&nbsp;Зараз в арсеналі лікарів є ефективні препарати, які при сучасній діагностиці забезпечують повне одужання&nbsp; протягом 3-х років.&nbsp;Людина при цьому лікується в лепрозорії або за місцем проживання, якщо встановлено відсутність збудника.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Щодо профілактики</strong> — то вона полягає в дотриманні санітарно-гігієнічних правил: треба часто мити руки, уникати подорожей в ті країни, де зафіксували лепру, щоб уникнути небажаних контактів з можливими носіями або хворими на проказу.</p>\n<!-- /wp:paragraph -->', 'ПРОКАЗА - тяжке хронічне інфекційне захворювання', '', 'inherit', 'closed', 'closed', '', '45-revision-v1', '', '', '2020-05-13 00:12:10', '2020-05-12 21:12:10', '', 45, 'http://medstat.shostka.ua/?p=58', 0, 'revision', '', 0),
(59, 1, '2020-05-21 14:00:57', '0000-00-00 00:00:00', '', 'Авточернетка', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-21 14:00:57', '0000-00-00 00:00:00', '', 0, 'http://medstat.shostka.ua/?post_type=blanks&p=59', 0, 'blanks', '', 0),
(60, 1, '2020-05-21 14:08:29', '2020-05-21 11:08:29', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"blanks\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";a:14:{i:0;s:9:\"permalink\";i:1;s:11:\"the_content\";i:2;s:7:\"excerpt\";i:3;s:10:\"discussion\";i:4;s:8:\"comments\";i:5;s:9:\"revisions\";i:6;s:4:\"slug\";i:7;s:6:\"author\";i:8;s:6:\"format\";i:9;s:15:\"page_attributes\";i:10;s:14:\"featured_image\";i:11;s:10:\"categories\";i:12;s:4:\"tags\";i:13;s:15:\"send-trackbacks\";}s:11:\"description\";s:0:\"\";}', 'Бланк', '%d0%b1%d0%bb%d0%b0%d0%bd%d0%ba', 'publish', 'closed', 'closed', '', 'group_5ec660d246d79', '', '', '2020-05-21 14:57:38', '2020-05-21 11:57:38', '', 0, 'http://medstat.shostka.ua/?post_type=acf-field-group&#038;p=60', 0, 'acf-field-group', '', 0),
(61, 1, '2020-05-21 14:39:48', '2020-05-21 11:39:48', 'a:12:{s:4:\"type\";s:5:\"radio\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:2:{s:3:\"man\";s:14:\"Чоловік\";s:5:\"woman\";s:10:\"Жінка\";}s:10:\"allow_null\";i:0;s:12:\"other_choice\";i:0;s:13:\"default_value\";s:0:\"\";s:6:\"layout\";s:8:\"vertical\";s:13:\"return_format\";s:5:\"value\";s:17:\"save_other_choice\";i:0;}', 'Стать', 'sex', 'publish', 'closed', 'closed', '', 'field_5ec66191586df', '', '', '2020-05-21 14:50:50', '2020-05-21 11:50:50', '', 60, 'http://medstat.shostka.ua/?post_type=acf-field&#038;p=61', 0, 'acf-field', '', 0),
(62, 1, '2020-05-21 14:41:20', '2020-05-21 11:41:20', 'a:12:{s:4:\"type\";s:8:\"checkbox\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:1:{s:5:\"first\";s:12:\"Вперше\";}s:12:\"allow_custom\";i:0;s:13:\"default_value\";b:0;s:6:\"layout\";s:8:\"vertical\";s:6:\"toggle\";i:0;s:13:\"return_format\";s:5:\"value\";s:11:\"save_custom\";i:0;}', 'Звернення', 'first', 'publish', 'closed', 'closed', '', 'field_5ec668933ed5a', '', '', '2020-05-21 14:54:17', '2020-05-21 11:54:17', '', 60, 'http://medstat.shostka.ua/?post_type=acf-field&#038;p=62', 1, 'acf-field', '', 0),
(63, 1, '2020-05-21 14:41:39', '0000-00-00 00:00:00', '', 'Авточернетка', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-21 14:41:39', '0000-00-00 00:00:00', '', 0, 'http://medstat.shostka.ua/?post_type=blanks&p=63', 0, 'blanks', '', 0),
(64, 1, '2020-05-21 14:42:28', '0000-00-00 00:00:00', '', 'Авточернетка', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-21 14:42:28', '0000-00-00 00:00:00', '', 0, 'http://medstat.shostka.ua/?post_type=blanks&p=64', 0, 'blanks', '', 0),
(65, 1, '2020-05-21 14:42:49', '0000-00-00 00:00:00', '', 'Авточернетка', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-21 14:42:49', '0000-00-00 00:00:00', '', 0, 'http://medstat.shostka.ua/?post_type=blanks&p=65', 0, 'blanks', '', 0),
(66, 1, '2020-05-21 14:46:21', '2020-05-21 11:46:21', 'a:12:{s:4:\"type\";s:8:\"checkbox\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:1:{s:5:\"oblik\";s:39:\"Перебуває на д-обліку\";}s:12:\"allow_custom\";i:0;s:13:\"default_value\";b:0;s:6:\"layout\";s:8:\"vertical\";s:6:\"toggle\";i:0;s:13:\"return_format\";s:5:\"value\";s:11:\"save_custom\";i:0;}', 'Нагляд', 'oblik', 'publish', 'closed', 'closed', '', 'field_5ec6694fcee80', '', '', '2020-05-21 14:54:17', '2020-05-21 11:54:17', '', 60, 'http://medstat.shostka.ua/?post_type=acf-field&#038;p=66', 2, 'acf-field', '', 0),
(67, 1, '2020-05-21 14:46:21', '2020-05-21 11:46:21', 'a:13:{s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:15:{s:9:\"А00-Т98\";s:31:\"Усі хвороби А00-Т98\";s:8:\"С00-D48\";s:35:\"Новоутворення С00-D48\";s:7:\"D50-D89\";s:78:\"Хвороби крові та кровотворних органів D50-D89\";s:7:\"E00-E90\";s:53:\"Хвороби ендокринної с-ми E00-E90\";s:7:\"F00-F99\";s:61:\"Розлади психіки та поведінки F00-F99\";s:7:\"G00-G99\";s:47:\"Хвороби нервової с-ми G00-G99\";s:7:\"H00-H59\";s:29:\"Хвороби ока H00-H59\";s:9:\"Н60-Н95\";s:33:\"Хвороби вуха Н60-Н95\";s:7:\"I00-I99\";s:58:\"Хвороби системи кровообігу I00-I99\";s:7:\"J00-J99\";s:52:\"Хвороби органів дихання J00-J99\";s:9:\"К00-К93\";s:58:\"Хвороби органів травлення К00-К93\";s:7:\"L00-L99\";s:80:\"Хвороби шкіри та підшкірної клітковини L00-L99\";s:7:\"M00-M99\";s:63:\"Хвороби кістково-м\'язової с-ми M00-M99\";s:7:\"N00-N99\";s:62:\"Хвороби сечостатевої системи N00-N99\";s:7:\"S00-T98\";s:38:\"Травми, отруєння S00-T98\";}s:13:\"default_value\";b:0;s:10:\"allow_null\";i:0;s:8:\"multiple\";i:0;s:2:\"ui\";i:0;s:13:\"return_format\";s:5:\"value\";s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}', 'Клас хвороби', 'hvoroba', 'publish', 'closed', 'closed', '', 'field_5ec66982cee81', '', '', '2020-05-21 14:57:37', '2020-05-21 11:57:37', '', 60, 'http://medstat.shostka.ua/?post_type=acf-field&#038;p=67', 3, 'acf-field', '', 0),
(68, 1, '2020-05-21 14:49:34', '0000-00-00 00:00:00', '', 'Авточернетка', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-21 14:49:34', '0000-00-00 00:00:00', '', 0, 'http://medstat.shostka.ua/?post_type=blanks&p=68', 0, 'blanks', '', 0),
(69, 1, '2020-05-21 14:50:06', '0000-00-00 00:00:00', '', 'Авточернетка', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-21 14:50:06', '0000-00-00 00:00:00', '', 0, 'http://medstat.shostka.ua/?post_type=blanks&p=69', 0, 'blanks', '', 0),
(70, 1, '2020-05-21 14:51:50', '0000-00-00 00:00:00', '', 'Авточернетка', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-21 14:51:50', '0000-00-00 00:00:00', '', 0, 'http://medstat.shostka.ua/?post_type=blanks&p=70', 0, 'blanks', '', 0),
(71, 1, '2020-05-21 14:55:45', '2020-05-21 11:55:45', '', 'Бланк №1', '', 'publish', 'closed', 'closed', '', '71', '', '', '2020-05-21 14:56:05', '2020-05-21 11:56:05', '', 0, 'http://medstat.shostka.ua/?post_type=blanks&#038;p=71', 0, 'blanks', '', 0),
(72, 1, '2020-05-21 14:56:56', '2020-05-21 11:56:56', '', 'Бланк №2', '', 'publish', 'closed', 'closed', '', '%d0%b1%d0%bb%d0%b0%d0%bd%d0%ba-%e2%84%962', '', '', '2020-05-21 14:56:56', '2020-05-21 11:56:56', '', 0, 'http://medstat.shostka.ua/?post_type=blanks&#038;p=72', 0, 'blanks', '', 0),
(73, 1, '2020-05-21 14:57:17', '0000-00-00 00:00:00', '', 'Авточернетка', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-05-21 14:57:17', '0000-00-00 00:00:00', '', 0, 'http://medstat.shostka.ua/?post_type=blanks&p=73', 0, 'blanks', '', 0),
(74, 1, '2020-05-21 14:58:06', '2020-05-21 11:58:06', '', 'Бланк №3', '', 'publish', 'closed', 'closed', '', '%d0%b1%d0%bb%d0%b0%d0%bd%d0%ba-%e2%84%963', '', '', '2020-05-21 14:58:06', '2020-05-21 11:58:06', '', 0, 'http://medstat.shostka.ua/?post_type=blanks&#038;p=74', 0, 'blanks', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Без рубрики', '%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8', 0),
(2, 'Menu 1', 'menu-1', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(23, 2, 0),
(24, 2, 0),
(25, 2, 0),
(26, 2, 0),
(27, 2, 0),
(28, 2, 0),
(36, 1, 0),
(40, 1, 0),
(45, 1, 0),
(48, 1, 0),
(52, 1, 0),
(55, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'nav_menu', '', 0, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'statistic'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"3981c53b17be836d3f7612df50bfc5c922c44c9f751d938d2b0efc071b3e674d\";a:4:{s:10:\"expiration\";i:1591268384;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36\";s:5:\"login\";i:1590058784;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '35'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(19, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(20, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(21, 1, 'wp_user-settings', 'mfold=o'),
(22, 1, 'wp_user-settings-time', '1587930637'),
(23, 1, 'nav_menu_recently_edited', '2');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'statistic', '$P$BbsuVs5xcMU43QjMyKOxYBxy9OnSY9/', 'statistic', 'vpodolyako@gmail.com', '', '2020-03-30 00:00:36', '', 0, 'statistic');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Индексы таблицы `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Индексы таблицы `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Индексы таблицы `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Индексы таблицы `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Индексы таблицы `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Индексы таблицы `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Индексы таблицы `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=625;
--
-- AUTO_INCREMENT для таблицы `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT для таблицы `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT для таблицы `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT для таблицы `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
