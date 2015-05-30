-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Хост: localhost:3306
-- Время создания: Май 30 2015 г., 20:25
-- Версия сервера: 5.6.13
-- Версия PHP: 5.6.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `profit_team`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blog_articles`
--

DROP TABLE IF EXISTS `blog_articles`;
CREATE TABLE IF NOT EXISTS `blog_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `is_commentable` tinyint(1) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `annotation` longtext COLLATE utf8_unicode_ci,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CB80154F989D9B62` (`slug`),
  KEY `IDX_CB80154FF675F31B` (`author_id`),
  KEY `IDX_CB80154F12469DE2` (`category_id`),
  KEY `IDX_CB80154F8B8E8428` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `blog_articles`
--


-- --------------------------------------------------------

--
-- Структура таблицы `blog_articles_tags_relations`
--

DROP TABLE IF EXISTS `blog_articles_tags_relations`;
CREATE TABLE IF NOT EXISTS `blog_articles_tags_relations` (
  `article_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`),
  KEY `IDX_512A6F437294869C` (`article_id`),
  KEY `IDX_512A6F43BAD26311` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `blog_articles_tags_relations`
--


-- --------------------------------------------------------

--
-- Структура таблицы `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
CREATE TABLE IF NOT EXISTS `blog_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned DEFAULT NULL,
  `slug` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DC356481989D9B62` (`slug`),
  KEY `IDX_DC3564813D8E604F` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `blog_categories`
--


-- --------------------------------------------------------

--
-- Структура таблицы `blog_tags`
--

DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE IF NOT EXISTS `blog_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8F6C18B6989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_8F6C18B62B36786B` (`title`),
  KEY `IDX_8F6C18B67CD5541` (`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `blog_tags`
--


-- --------------------------------------------------------

--
-- Структура таблицы `elfinder_file`
--

DROP TABLE IF EXISTS `elfinder_file`;
CREATE TABLE IF NOT EXISTS `elfinder_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longblob NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `read` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `write` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locked` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hidden` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_name` (`parent_id`,`name`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `elfinder_file`
--


-- --------------------------------------------------------

--
-- Структура таблицы `engine_appearance_history`
--

DROP TABLE IF EXISTS `engine_appearance_history`;
CREATE TABLE IF NOT EXISTS `engine_appearance_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9078E776D1B862B8` (`hash`),
  KEY `IDX_9078E776B548B0F` (`path`),
  KEY `IDX_9078E7763C0BE965` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `engine_appearance_history`
--


-- --------------------------------------------------------

--
-- Структура таблицы `engine_folders`
--

DROP TABLE IF EXISTS `engine_folders`;
CREATE TABLE IF NOT EXISTS `engine_folders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_pid` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uri_part` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_file` tinyint(1) NOT NULL,
  `meta` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `redirect_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `router_node_id` int(11) DEFAULT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `lockout_nodes` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `template_inheritable` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_self` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6C047E64A640A07B79628CD` (`folder_pid`,`uri_part`),
  KEY `IDX_6C047E64A640A07B` (`folder_pid`),
  KEY `IDX_6C047E641B5771DD` (`is_active`),
  KEY `IDX_6C047E64FD07C8FB` (`is_deleted`),
  KEY `IDX_6C047E64462CE4F5` (`position`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `engine_folders`
--

INSERT INTO `engine_folders` (`id`, `folder_pid`, `title`, `uri_part`, `is_file`, `meta`, `redirect_to`, `router_node_id`, `permissions`, `lockout_nodes`, `template_inheritable`, `template_self`, `is_active`, `is_deleted`, `created_at`, `deleted_at`, `description`, `position`, `user_id`) VALUES
(1, NULL, 'Главная', NULL, 0, 'a:0:{}', NULL, NULL, 'N;', 'N;', 'index', 'main', 1, 0, '2015-05-28 00:57:27', NULL, NULL, 0, 1),
(2, 1, 'Информация', 'info', 0, 'a:0:{}', NULL, NULL, 'N;', 'N;', NULL, NULL, 1, 0, '2015-05-28 01:49:17', NULL, NULL, 0, 1),
(3, 1, 'Новости', 'news', 0, 'a:0:{}', NULL, NULL, 'N;', 'N;', NULL, NULL, 1, 0, '2015-05-28 01:49:28', NULL, NULL, 0, 1),
(4, 1, 'Контакты', 'contacts', 0, 'a:0:{}', NULL, NULL, 'N;', 'N;', NULL, NULL, 1, 0, '2015-05-28 01:49:42', NULL, NULL, 0, 1),
(5, 1, 'Аккаунт пользователя', 'user', 0, 'a:0:{}', NULL, 7, 'N;', 'N;', NULL, NULL, 1, 0, '2015-05-30 20:18:54', NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `engine_modules`
--

DROP TABLE IF EXISTS `engine_modules`;
CREATE TABLE IF NOT EXISTS `engine_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_BC84EEBC46C53D4C` (`is_enabled`),
  KEY `IDX_BC84EEBC8B8E8428` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `engine_modules`
--


-- --------------------------------------------------------

--
-- Структура таблицы `engine_nodes`
--

DROP TABLE IF EXISTS `engine_nodes`;
CREATE TABLE IF NOT EXISTS `engine_nodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `controls_in_toolbar` smallint(6) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `template` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` smallint(6) NOT NULL,
  `is_cached` tinyint(1) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `is_use_eip` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `IDX_3055D1B7162CB942` (`folder_id`),
  KEY `IDX_3055D1B798260155` (`region_id`),
  KEY `IDX_3055D1B71B5771DD` (`is_active`),
  KEY `IDX_3055D1B7FD07C8FB` (`is_deleted`),
  KEY `IDX_3055D1B7462CE4F5` (`position`),
  KEY `IDX_3055D1B7C242628` (`module`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `engine_nodes`
--

INSERT INTO `engine_nodes` (`id`, `folder_id`, `region_id`, `controls_in_toolbar`, `module`, `params`, `template`, `priority`, `is_cached`, `is_active`, `is_deleted`, `created_at`, `deleted_at`, `description`, `position`, `user_id`, `is_use_eip`) VALUES
(1, 1, 2, 1, 'Menu', 'a:5:{s:5:"depth";N;s:9:"css_class";N;s:13:"current_class";s:6:"active";s:20:"selected_inheritance";b:0;s:8:"group_id";i:1;}', NULL, 0, 0, 1, 0, '2015-05-28 01:52:05', NULL, NULL, 0, 1, 0),
(2, 2, 1, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:1;s:6:"editor";b:1;}', NULL, 0, 0, 1, 0, '2015-05-28 02:47:36', NULL, NULL, 0, 1, 1),
(3, 4, 1, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:2;s:6:"editor";b:1;}', NULL, 0, 0, 1, 0, '2015-05-28 02:48:12', NULL, NULL, 0, 1, 1),
(4, 1, 3, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:3;s:6:"editor";b:0;}', NULL, 0, 0, 1, 0, '2015-05-30 20:03:59', NULL, 'Слайдер на главной', 0, 1, 1),
(5, 1, 4, 0, 'Texter', 'a:2:{s:12:"text_item_id";i:4;s:6:"editor";b:1;}', NULL, 0, 0, 1, 0, '2015-05-30 20:13:55', NULL, 'Контакты в футере', 0, 1, 1),
(6, 1, 5, 0, 'Texter', 'a:2:{s:12:"text_item_id";i:5;s:6:"editor";b:0;}', NULL, 0, 0, 1, 0, '2015-05-30 20:15:33', NULL, 'Социальные кнопки в футере', 0, 1, 1),
(7, 5, 1, 0, 'User', 'a:2:{s:18:"allow_registration";b:1;s:24:"allow_password_resetting";b:1;}', NULL, 0, 0, 1, 0, '2015-05-30 20:19:08', NULL, NULL, 0, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `engine_regions`
--

DROP TABLE IF EXISTS `engine_regions`;
CREATE TABLE IF NOT EXISTS `engine_regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3054D4985E237E06` (`name`),
  KEY `IDX_3054D498462CE4F5` (`position`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `engine_regions`
--

INSERT INTO `engine_regions` (`id`, `name`, `created_at`, `description`, `position`, `user_id`) VALUES
(1, 'content', '2015-05-28 01:50:27', 'Content workspace', 0, 1),
(2, 'main_menu', '2015-05-28 01:50:33', 'Главное меню', 0, 1),
(3, 'homepage_slider', '2015-05-30 20:01:56', 'Слайдер на главной', 0, 1),
(4, 'footer_contacts', '2015-05-30 20:13:11', 'Контакты в футере', 0, 1),
(5, 'footer_socials', '2015-05-30 20:15:25', 'Социальные кнопки в футере', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `engine_regions_inherit`
--

DROP TABLE IF EXISTS `engine_regions_inherit`;
CREATE TABLE IF NOT EXISTS `engine_regions_inherit` (
  `region_id` int(10) unsigned NOT NULL,
  `folder_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`region_id`,`folder_id`),
  KEY `IDX_41BBC12298260155` (`region_id`),
  KEY `IDX_41BBC122162CB942` (`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `engine_regions_inherit`
--

INSERT INTO `engine_regions_inherit` (`region_id`, `folder_id`) VALUES
(2, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `engine_roles`
--

DROP TABLE IF EXISTS `engine_roles`;
CREATE TABLE IF NOT EXISTS `engine_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9B56FA8C5E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `engine_roles`
--

INSERT INTO `engine_roles` (`id`, `name`, `position`) VALUES
(1, 'ROLE_SUPER_ADMIN', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_collection_id` int(10) unsigned NOT NULL,
  `order_albums_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F70E6EB7B52E685C` (`media_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `galleries`
--


-- --------------------------------------------------------

--
-- Структура таблицы `gallery_albums`
--

DROP TABLE IF EXISTS `gallery_albums`;
CREATE TABLE IF NOT EXISTS `gallery_albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned DEFAULT NULL,
  `cover_image_id` int(11) DEFAULT NULL,
  `last_image_id` int(11) DEFAULT NULL,
  `photos_count` int(11) NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5661ABED4E7AF8F` (`gallery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `gallery_albums`
--


-- --------------------------------------------------------

--
-- Структура таблицы `gallery_photos`
--

DROP TABLE IF EXISTS `gallery_photos`;
CREATE TABLE IF NOT EXISTS `gallery_photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned DEFAULT NULL,
  `image_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AAF50C7B1137ABCF` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `gallery_photos`
--


-- --------------------------------------------------------

--
-- Структура таблицы `media_categories`
--

DROP TABLE IF EXISTS `media_categories`;
CREATE TABLE IF NOT EXISTS `media_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_30D688FC727ACA70` (`parent_id`),
  KEY `IDX_30D688FC989D9B62` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `media_categories`
--


-- --------------------------------------------------------

--
-- Структура таблицы `media_collections`
--

DROP TABLE IF EXISTS `media_collections`;
CREATE TABLE IF NOT EXISTS `media_collections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `default_storage_id` int(10) unsigned NOT NULL,
  `default_filter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `relative_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_relative_path_pattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename_pattern` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_244DA17D14E68FF3` (`default_storage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `media_collections`
--


-- --------------------------------------------------------

--
-- Структура таблицы `media_files`
--

DROP TABLE IF EXISTS `media_files`;
CREATE TABLE IF NOT EXISTS `media_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `storage_id` int(10) unsigned NOT NULL,
  `is_preuploaded` tinyint(1) NOT NULL,
  `relative_path` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `original_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `mime_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `original_size` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_192C84E8514956FD` (`collection_id`),
  KEY `IDX_192C84E812469DE2` (`category_id`),
  KEY `IDX_192C84E85CC5DB90` (`storage_id`),
  KEY `IDX_192C84E88CDE5729` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `media_files`
--


-- --------------------------------------------------------

--
-- Структура таблицы `media_files_transformed`
--

DROP TABLE IF EXISTS `media_files_transformed`;
CREATE TABLE IF NOT EXISTS `media_files_transformed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `collection_id` int(10) unsigned NOT NULL,
  `storage_id` int(10) unsigned NOT NULL,
  `filter` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1084B87D7FC45F1D93CB796C` (`filter`,`file_id`),
  KEY `IDX_1084B87D93CB796C` (`file_id`),
  KEY `IDX_1084B87D514956FD` (`collection_id`),
  KEY `IDX_1084B87D5CC5DB90` (`storage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `media_files_transformed`
--


-- --------------------------------------------------------

--
-- Структура таблицы `media_storages`
--

DROP TABLE IF EXISTS `media_storages`;
CREATE TABLE IF NOT EXISTS `media_storages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relative_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `media_storages`
--

INSERT INTO `media_storages` (`id`, `provider`, `relative_path`, `params`, `created_at`, `title`) VALUES
(1, 'SmartCore\\Bundle\\MediaBundle\\Provider\\LocalProvider', '/_media', 'N;', '2015-05-28 02:50:49', 'Новое хранилище');

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `open_in_new_window` tinyint(1) DEFAULT '0',
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7D053A935550C4ED` (`pid`),
  KEY `IDX_7D053A93FE54D947` (`group_id`),
  KEY `IDX_7D053A93162CB942` (`folder_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `pid`, `group_id`, `folder_id`, `url`, `open_in_new_window`, `properties`, `created_at`, `updated_at`, `is_active`, `description`, `position`, `title`, `user_id`) VALUES
(1, NULL, 1, 1, NULL, 0, 'N;', '2015-05-28 01:50:02', NULL, 1, NULL, 0, NULL, 1),
(2, NULL, 1, 2, NULL, 0, 'N;', '2015-05-28 01:50:05', NULL, 1, NULL, 0, NULL, 1),
(3, NULL, 1, 3, NULL, 0, 'N;', '2015-05-28 01:50:14', NULL, 1, NULL, 0, NULL, 1),
(4, NULL, 1, 4, NULL, 0, 'N;', '2015-05-28 01:50:19', NULL, 1, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `menu_groups`
--

DROP TABLE IF EXISTS `menu_groups`;
CREATE TABLE IF NOT EXISTS `menu_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_232A61A85E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `menu_groups`
--

INSERT INTO `menu_groups` (`id`, `name`, `properties`, `created_at`, `description`, `position`, `user_id`) VALUES
(1, 'Главное', NULL, '2015-05-28 01:49:53', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `data` longblob NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `session`
--


-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bundle` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E545A0C5A57B32FD5E237E06` (`bundle`,`name`),
  KEY `IDX_E545A0C5A57B32FD` (`bundle`),
  KEY `IDX_E545A0C55E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `bundle`, `name`, `value`, `serialized`) VALUES
(1, 'cms', 'site_full_name', 'Profit Team', 0),
(2, 'cms', 'site_short_name', 'Profit Team', 0),
(3, 'cms', 'html_title_delimiter', '&ndash;', 0),
(4, 'cms', 'appearance_editor', 'ace', 0),
(5, 'cms', 'appearance_editor_theme', 'idle_fingers', 0),
(6, 'cms', 'twitter_bootstrap_version', '3', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `simple_news`
--

DROP TABLE IF EXISTS `simple_news`;
CREATE TABLE IF NOT EXISTS `simple_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(10) unsigned DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `annotation` longtext COLLATE utf8_unicode_ci,
  `annotation_widget` longtext COLLATE utf8_unicode_ci,
  `publish_date` datetime NOT NULL,
  `end_publish_date` datetime DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B232FBE9989D9B62` (`slug`),
  KEY `IDX_B232FBE93A51721D` (`instance_id`),
  KEY `IDX_B232FBE946C53D4C` (`is_enabled`),
  KEY `IDX_B232FBE98B8E8428` (`created_at`),
  KEY `IDX_B232FBE978B553BA` (`publish_date`),
  KEY `IDX_B232FBE9B80531F1` (`end_publish_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `simple_news`
--


-- --------------------------------------------------------

--
-- Структура таблицы `simple_news_instances`
--

DROP TABLE IF EXISTS `simple_news_instances`;
CREATE TABLE IF NOT EXISTS `simple_news_instances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_collection_id` int(10) unsigned DEFAULT NULL,
  `use_image` tinyint(1) NOT NULL,
  `use_annotation_widget` tinyint(1) NOT NULL,
  `use_end_publish_date` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_98EDD0015E237E06` (`name`),
  KEY `IDX_98EDD001B52E685C` (`media_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `simple_news_instances`
--


-- --------------------------------------------------------

--
-- Структура таблицы `sitemap_urls`
--

DROP TABLE IF EXISTS `sitemap_urls`;
CREATE TABLE IF NOT EXISTS `sitemap_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_visited` tinyint(1) NOT NULL,
  `loc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `referer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_hash` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `lastmod` datetime DEFAULT NULL,
  `changefreq` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_365093828852ACDC` (`loc`),
  KEY `IDX_365093829A62B8C7` (`title_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `sitemap_urls`
--


-- --------------------------------------------------------

--
-- Структура таблицы `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `width` smallint(6) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  `mode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `library` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pause_time` int(11) NOT NULL,
  `slide_properties` longtext COLLATE utf8_unicode_ci,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `sliders`
--


-- --------------------------------------------------------

--
-- Структура таблицы `slides`
--

DROP TABLE IF EXISTS `slides`;
CREATE TABLE IF NOT EXISTS `slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) unsigned NOT NULL,
  `file_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `original_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B8C02091D7DF1668` (`file_name`),
  KEY `IDX_B8C020912CCC9638` (`slider_id`),
  KEY `IDX_B8C02091462CE4F5` (`position`),
  KEY `IDX_B8C02091A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `slides`
--


-- --------------------------------------------------------

--
-- Структура таблицы `texter`
--

DROP TABLE IF EXISTS `texter`;
CREATE TABLE IF NOT EXISTS `texter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` smallint(6) NOT NULL,
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `texter`
--

INSERT INTO `texter` (`id`, `locale`, `editor`, `meta`, `created_at`, `updated_at`, `text`, `user_id`) VALUES
(1, 'ru', 1, 'a:0:{}', '2015-05-28 02:47:36', NULL, '<p>\r\n  Наш сайт создан для объединения знаний и навыков всех желающих найти оплачиваемую работу. Проект для совместного поиска вакансий и выполнения\r\n  работы. Условия сотрудничества равноправные, бюджеты вакансий будут открытыми. Чем больше присоединится желающих, тем шире область наших знаний и\r\n  соответственно возможностей. В идеале требуется дойти до уровня, когда каждый участник сможет развивать свои самые сильные стороны в поиске заказов\r\n  или выполнять тот вид работы, в котором является профессионалом.\r\n</p>\r\n<p>\r\n  У каждого человека есть свои сильные стороны. К сожалению не всем удаётся попасть в нужную среду, максимально реализовать весь свой потенциал и\r\n  посвятить себя любимому делу. Только вместе мы способны расчитывать на спокойное и качественное решение любой задачи. Приглашаем к сотрудничеству\r\n  всех желающих!\r\n</p>\r', 1),
(2, 'ru', 1, 'a:0:{}', '2015-05-28 02:48:12', NULL, 'Скайпы, мыла и т.д. :)\r', 1),
(3, 'ru', 0, 'a:0:{}', '2015-05-30 20:03:59', NULL, '<div id="sequence">\r\n  <ul class="sequence-canvas">\r\n    <!-- Slide 1 -->\r\n    <li class="_bg4" style="background-image: url(/bundles/site/img/homepage-slider/slider-bg4.jpg);">\r\n      <!-- Slide Title -->\r\n      <h2 class="title">Профессиональная разработка сайтов</h2>\r\n      <!-- Slide Text -->\r\n      <h3 class="subtitle">Фреймворк <strong>Symfony2</strong> и система управления контентом <strong>Smart Core CMS</strong>, высокая скорость, открытый исходный код, модульность и визуальное администрирование.</h3>\r\n      <!-- Slide Image -->\r\n      <img class="slide-img" style="height: 280px !important;" src="/uploads/level.jpg" alt="Level House" />\r\n    </li>\r\n    <!-- End Slide 1 -->\r\n    <!-- Slide 2 -->\r\n\r\n    <li class="bg3">\r\n      <!-- Slide Title -->\r\n      <h2 class="title">Профессиональный дизайн</h2>\r\n      <!-- Slide Text -->\r\n      <h3 class="subtitle">Сайты, логотипы, фирменные стили и полиграфическая продукция. Опыт более 5 лет!</h3>\r\n      <!-- Slide Image -->\r\n      <img class="slide-img" src="/bundles/site/img/homepage-slider/slide2.png" alt="" />\r\n    </li>\r\n    <!-- End Slide 2 -->\r\n\r\n    <!-- Slide 3 -->\r\n    <li class="bg1">\r\n      <!-- Slide Title -->\r\n      <h2 class="title">Десктопные приложения</h2>\r\n      <!-- Slide Text -->\r\n      <h3 class="subtitle">Синхронизация с Вашим сайтом. Применяем языки: C++/C#, MQL4, Haskell, D, Assembler x86 и др.</h3>\r\n      <!-- Slide Image -->\r\n      <img class="slide-img" style="height: 280px !important;" src="/uploads/code.jpg" alt="" />\r\n    </li>\r\n    <!-- End Slide 3 -->\r\n\r\n  </ul>\r\n  <div class="sequence-pagination-wrapper">\r\n    <ul class="sequence-pagination">\r\n      <li>1</li>\r\n      <li>2</li>\r\n      <li>3</li>\r\n    </ul>\r\n  </div>\r\n\r\n</div>', 1),
(4, 'ru', 1, 'a:0:{}', '2015-05-30 20:13:55', NULL, '<p class="contact-us-details">\r\n  <strong>Всеволод Соболев:</strong> <a href="skype:sevasobolev?chat"><img src="/bundles/site/img/skype_2013.png" alt="" width="20" />sevasobolev</a>\r\n</p>\r', 1),
(5, 'ru', 0, 'a:0:{}', '2015-05-30 20:15:33', NULL, '<ul class="footer-stay-connected no-list-style">\r\n	<li><a href="#" class="facebook"></a></li>\r\n	<li><a href="#" class="twitter"></a></li>\r\n	<li><a href="#" class="googleplus"></a></li>\r\n</ul>\r\n', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `texter_history`
--

DROP TABLE IF EXISTS `texter_history`;
CREATE TABLE IF NOT EXISTS `texter_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `editor` smallint(6) NOT NULL,
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_82529097126F525E` (`item_id`),
  KEY `IDX_82529097FD07C8FB` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `texter_history`
--


-- --------------------------------------------------------

--
-- Структура таблицы `unicat__configurations`
--

DROP TABLE IF EXISTS `unicat__configurations`;
CREATE TABLE IF NOT EXISTS `unicat__configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_collection_id` int(10) unsigned DEFAULT NULL,
  `default_structure_id` int(10) unsigned DEFAULT NULL,
  `entities_namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_inheritance` tinyint(1) NOT NULL DEFAULT '1',
  `items_per_page` smallint(5) unsigned NOT NULL DEFAULT '10',
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F622D4625E237E06` (`name`),
  UNIQUE KEY `UNIQ_F622D4622B36786B` (`title`),
  KEY `IDX_F622D462B52E685C` (`media_collection_id`),
  KEY `IDX_F622D4627E2E521` (`default_structure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `unicat__configurations`
--


-- --------------------------------------------------------

--
-- Структура таблицы `unicat__structures`
--

DROP TABLE IF EXISTS `unicat__structures`;
CREATE TABLE IF NOT EXISTS `unicat__structures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `configuration_id` int(10) unsigned DEFAULT NULL,
  `title_form` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entries` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `is_required` tinyint(1) DEFAULT NULL,
  `is_default_inheritance` tinyint(1) NOT NULL DEFAULT '0',
  `is_tree` tinyint(1) NOT NULL DEFAULT '1',
  `properties` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B933004773F32DD8` (`configuration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `unicat__structures`
--


-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `firstname`, `lastname`, `created_at`) VALUES
(1, 'root', 'root', 'god@mail.ru', 'god@mail.ru', 1, 'pgw08vyu0askg0w0o8scw04sowggkw4', 'qhxGwF4ReWyH549uKCXy8HcRbtsTxgruZ2HihBIE1QkZLLQWE0f1ZI00L33kpMPmF0XzY+gblkZ9PN1PRYFMDw==', '2015-05-30 20:24:52', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '', '', '2015-05-28 00:12:55');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `blog_articles`
--
ALTER TABLE `blog_articles`
  ADD CONSTRAINT `FK_CB80154F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`),
  ADD CONSTRAINT `FK_CB80154FF675F31B` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `blog_articles_tags_relations`
--
ALTER TABLE `blog_articles_tags_relations`
  ADD CONSTRAINT `FK_512A6F43BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `blog_tags` (`id`),
  ADD CONSTRAINT `FK_512A6F437294869C` FOREIGN KEY (`article_id`) REFERENCES `blog_articles` (`id`);

--
-- Ограничения внешнего ключа таблицы `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `FK_DC3564813D8E604F` FOREIGN KEY (`parent`) REFERENCES `blog_categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `engine_folders`
--
ALTER TABLE `engine_folders`
  ADD CONSTRAINT `FK_6C047E64A640A07B` FOREIGN KEY (`folder_pid`) REFERENCES `engine_folders` (`id`);

--
-- Ограничения внешнего ключа таблицы `engine_nodes`
--
ALTER TABLE `engine_nodes`
  ADD CONSTRAINT `FK_3055D1B7162CB942` FOREIGN KEY (`folder_id`) REFERENCES `engine_folders` (`id`),
  ADD CONSTRAINT `FK_3055D1B798260155` FOREIGN KEY (`region_id`) REFERENCES `engine_regions` (`id`);

--
-- Ограничения внешнего ключа таблицы `engine_regions_inherit`
--
ALTER TABLE `engine_regions_inherit`
  ADD CONSTRAINT `FK_41BBC122162CB942` FOREIGN KEY (`folder_id`) REFERENCES `engine_folders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_41BBC12298260155` FOREIGN KEY (`region_id`) REFERENCES `engine_regions` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `FK_F70E6EB7B52E685C` FOREIGN KEY (`media_collection_id`) REFERENCES `media_collections` (`id`);

--
-- Ограничения внешнего ключа таблицы `gallery_albums`
--
ALTER TABLE `gallery_albums`
  ADD CONSTRAINT `FK_5661ABED4E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`);

--
-- Ограничения внешнего ключа таблицы `gallery_photos`
--
ALTER TABLE `gallery_photos`
  ADD CONSTRAINT `FK_AAF50C7B1137ABCF` FOREIGN KEY (`album_id`) REFERENCES `gallery_albums` (`id`);

--
-- Ограничения внешнего ключа таблицы `media_categories`
--
ALTER TABLE `media_categories`
  ADD CONSTRAINT `FK_30D688FC727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `media_categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `media_collections`
--
ALTER TABLE `media_collections`
  ADD CONSTRAINT `FK_244DA17D14E68FF3` FOREIGN KEY (`default_storage_id`) REFERENCES `media_storages` (`id`);

--
-- Ограничения внешнего ключа таблицы `media_files`
--
ALTER TABLE `media_files`
  ADD CONSTRAINT `FK_192C84E85CC5DB90` FOREIGN KEY (`storage_id`) REFERENCES `media_storages` (`id`),
  ADD CONSTRAINT `FK_192C84E812469DE2` FOREIGN KEY (`category_id`) REFERENCES `media_categories` (`id`),
  ADD CONSTRAINT `FK_192C84E8514956FD` FOREIGN KEY (`collection_id`) REFERENCES `media_collections` (`id`);

--
-- Ограничения внешнего ключа таблицы `media_files_transformed`
--
ALTER TABLE `media_files_transformed`
  ADD CONSTRAINT `FK_1084B87D5CC5DB90` FOREIGN KEY (`storage_id`) REFERENCES `media_storages` (`id`),
  ADD CONSTRAINT `FK_1084B87D514956FD` FOREIGN KEY (`collection_id`) REFERENCES `media_collections` (`id`),
  ADD CONSTRAINT `FK_1084B87D93CB796C` FOREIGN KEY (`file_id`) REFERENCES `media_files` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_7D053A93162CB942` FOREIGN KEY (`folder_id`) REFERENCES `engine_folders` (`id`),
  ADD CONSTRAINT `FK_7D053A935550C4ED` FOREIGN KEY (`pid`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `FK_7D053A93FE54D947` FOREIGN KEY (`group_id`) REFERENCES `menu_groups` (`id`);

--
-- Ограничения внешнего ключа таблицы `simple_news`
--
ALTER TABLE `simple_news`
  ADD CONSTRAINT `FK_B232FBE93A51721D` FOREIGN KEY (`instance_id`) REFERENCES `simple_news_instances` (`id`);

--
-- Ограничения внешнего ключа таблицы `simple_news_instances`
--
ALTER TABLE `simple_news_instances`
  ADD CONSTRAINT `FK_98EDD001B52E685C` FOREIGN KEY (`media_collection_id`) REFERENCES `media_collections` (`id`);

--
-- Ограничения внешнего ключа таблицы `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `FK_B8C020912CCC9638` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`);

--
-- Ограничения внешнего ключа таблицы `unicat__configurations`
--
ALTER TABLE `unicat__configurations`
  ADD CONSTRAINT `FK_F622D4627E2E521` FOREIGN KEY (`default_structure_id`) REFERENCES `unicat__structures` (`id`),
  ADD CONSTRAINT `FK_F622D462B52E685C` FOREIGN KEY (`media_collection_id`) REFERENCES `media_collections` (`id`);

--
-- Ограничения внешнего ключа таблицы `unicat__structures`
--
ALTER TABLE `unicat__structures`
  ADD CONSTRAINT `FK_B933004773F32DD8` FOREIGN KEY (`configuration_id`) REFERENCES `unicat__configurations` (`id`);
