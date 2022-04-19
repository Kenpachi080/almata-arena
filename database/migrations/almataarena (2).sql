-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 19 2022 г., 08:44
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `almataarena`
--

-- --------------------------------------------------------

--
-- Структура таблицы `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint UNSIGNED NOT NULL,
  `title_mission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'name', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{}', 2),
(24, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(26, 6, 'header_content', 'text', 'Верхний контент', 1, 1, 1, 1, 1, 1, '{}', 2),
(27, 6, 'mission', 'text', 'Миссия', 1, 1, 1, 1, 1, 1, '{}', 4),
(28, 6, 'footer_content', 'text', 'Нижний контент', 1, 1, 1, 1, 1, 1, '{}', 5),
(29, 6, 'lang', 'text', 'Язык', 1, 1, 1, 1, 1, 1, '{}', 6),
(30, 6, 'about_hasone_lang_relationship', 'relationship', 'Язык', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Lang\",\"table\":\"langs\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"abouts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(31, 6, 'title_mission', 'text', 'Заголовок Миссии', 1, 1, 1, 1, 1, 1, '{}', 3),
(32, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(33, 8, 'about', 'text', 'О нас', 1, 1, 1, 1, 1, 1, '{}', 2),
(34, 8, 'service', 'text', 'Услуги', 1, 1, 1, 1, 1, 1, '{}', 3),
(35, 8, 'objects', 'text', 'Объекты', 1, 1, 1, 1, 1, 1, '{}', 4),
(36, 8, 'clients', 'text', 'Клиенты', 1, 1, 1, 1, 1, 1, '{}', 5),
(37, 8, 'reviews', 'text', 'Отзывы', 1, 1, 1, 1, 1, 1, '{}', 6),
(38, 8, 'news', 'text', 'Новости', 1, 1, 1, 1, 1, 1, '{}', 7),
(39, 8, 'contacts', 'text', 'Контакты', 1, 1, 1, 1, 1, 1, '{}', 8),
(40, 8, 'lang', 'text', 'Язык', 1, 1, 1, 1, 1, 1, '{}', 9),
(41, 8, 'navigation_belongsto_lang_relationship', 'relationship', 'langs', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Lang\",\"table\":\"langs\",\"type\":\"belongsTo\",\"column\":\"lang\",\"key\":\"name\",\"label\":\"name\",\"pivot_table\":\"abouts\",\"pivot\":\"0\",\"taggable\":null}', 10),
(42, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(43, 10, 'date', 'date', 'Дата', 1, 1, 1, 1, 1, 1, '{}', 2),
(44, 10, 'preview_text', 'text', 'Превью текст', 1, 1, 1, 1, 1, 1, '{}', 3),
(45, 10, 'preview_photo', 'text', 'Превью Фото', 1, 1, 1, 1, 1, 1, '{}', 4),
(46, 10, 'content', 'text', 'Контент', 1, 1, 1, 1, 1, 1, '{}', 5),
(47, 10, 'lang', 'text', 'Язык', 1, 1, 1, 1, 1, 1, '{}', 6),
(48, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(49, 11, 'photos', 'image', 'Photos', 1, 1, 1, 1, 1, 1, '{}', 2),
(50, 11, 'title', 'text', 'Заголовок', 1, 1, 1, 1, 1, 1, '{}', 3),
(51, 11, 'exploitation', 'date', 'Сдан в эксплуатацию', 1, 1, 1, 1, 1, 1, '{}', 4),
(52, 11, 'square', 'text', 'Общая площадь', 1, 1, 1, 1, 1, 1, '{}', 5),
(53, 11, 'rented', 'text', 'Арендуемая площадь', 1, 1, 1, 1, 1, 1, '{}', 6),
(54, 11, 'underground', 'text', 'Подземный паркинг', 1, 1, 1, 1, 1, 1, '{}', 7),
(55, 11, 'outer', 'text', 'Наружная парковка', 1, 1, 1, 1, 1, 1, '{}', 8),
(56, 11, 'content', 'rich_text_box', 'Контент', 1, 1, 1, 1, 1, 1, '{}', 9),
(57, 11, 'lang', 'text', 'Язык', 1, 1, 1, 1, 1, 1, '{}', 10),
(58, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(59, 12, 'header_logo', 'image', 'Верхний логотип', 1, 1, 1, 1, 1, 1, '{}', 2),
(60, 12, 'header_background', 'image', 'Верхний Бэкграунд', 1, 1, 1, 1, 1, 1, '{}', 3),
(61, 12, 'footer_logo', 'image', 'Нижний логотип', 1, 1, 1, 1, 1, 1, '{}', 4),
(62, 12, 'footer_background', 'image', 'Нижний Бэкграунд', 1, 1, 1, 1, 1, 1, '{}', 5),
(63, 12, 'number', 'text', 'Номер телефона', 1, 1, 1, 1, 1, 1, '{}', 6),
(64, 12, 'email', 'text', 'Почта', 1, 1, 1, 1, 1, 1, '{}', 7),
(65, 12, 'address', 'text', 'Адресс', 1, 1, 1, 1, 1, 1, '{}', 8),
(66, 12, 'lang', 'text', 'Язык', 1, 1, 1, 1, 1, 1, '{}', 9),
(67, 12, 'title_belongsto_lang_relationship', 'relationship', 'langs', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Lang\",\"table\":\"langs\",\"type\":\"belongsTo\",\"column\":\"lang\",\"key\":\"name\",\"label\":\"name\",\"pivot_table\":\"abouts\",\"pivot\":\"0\",\"taggable\":null}', 10),
(68, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 13, 'photo', 'image', 'Фото', 1, 1, 1, 1, 1, 1, '{}', 2),
(70, 13, 'title', 'text', 'Заголовок', 1, 1, 1, 1, 1, 1, '{}', 3),
(71, 13, 'content', 'text', 'Контетнт', 1, 1, 1, 1, 1, 1, '{}', 4),
(72, 13, 'date', 'date', 'Дата', 1, 1, 1, 1, 1, 1, '{}', 5),
(73, 13, 'lang', 'text', 'Язык', 1, 1, 1, 1, 1, 1, '{}', 6),
(74, 13, 'review_card_belongsto_lang_relationship', 'relationship', 'langs', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Lang\",\"table\":\"langs\",\"type\":\"belongsTo\",\"column\":\"lang\",\"key\":\"name\",\"label\":\"name\",\"pivot_table\":\"abouts\",\"pivot\":\"0\",\"taggable\":null}', 7),
(75, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(76, 14, 'content', 'rich_text_box', 'Контент', 1, 1, 1, 1, 1, 1, '{}', 2),
(77, 14, 'lang', 'text', 'Язык', 1, 1, 1, 1, 1, 1, '{}', 3),
(78, 14, 'review_title_belongsto_lang_relationship', 'relationship', 'Язык', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Lang\",\"table\":\"langs\",\"type\":\"belongsTo\",\"column\":\"lang\",\"key\":\"name\",\"label\":\"name\",\"pivot_table\":\"abouts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(79, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(80, 15, 'content', 'rich_text_box', 'Контент', 1, 1, 1, 1, 1, 1, '{}', 2),
(81, 15, 'lang', 'text', 'Язык', 1, 1, 1, 1, 1, 1, '{}', 3),
(82, 15, 'services_title_belongsto_lang_relationship', 'relationship', 'langs', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Lang\",\"table\":\"langs\",\"type\":\"belongsTo\",\"column\":\"lang\",\"key\":\"name\",\"label\":\"name\",\"pivot_table\":\"abouts\",\"pivot\":\"0\",\"taggable\":null}', 4),
(83, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(84, 16, 'title', 'text', 'Заголовок', 1, 1, 1, 1, 1, 1, '{}', 2),
(85, 16, 'preview_photo', 'image', 'Фото на превью', 1, 1, 1, 1, 1, 1, '{}', 3),
(86, 16, 'photo', 'image', 'Фото', 1, 1, 1, 1, 1, 1, '{}', 4),
(87, 16, 'jobs', 'rich_text_box', 'Что мы делаем', 1, 1, 1, 1, 1, 1, '{}', 5),
(88, 16, 'lang', 'text', 'Язык', 1, 1, 1, 1, 1, 1, '{}', 6),
(89, 16, 'services_card_belongsto_lang_relationship', 'relationship', 'langs', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Lang\",\"table\":\"langs\",\"type\":\"belongsTo\",\"column\":\"lang\",\"key\":\"name\",\"label\":\"name\",\"pivot_table\":\"abouts\",\"pivot\":\"0\",\"taggable\":null}', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(4, 'langs', 'langs', 'Языки', 'Языки', NULL, 'App\\Models\\Lang', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-16 22:46:28', '2022-04-16 22:46:28'),
(6, 'abouts', 'abouts', 'О нас', 'О нас', NULL, 'App\\Models\\About', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-18 12:57:32', '2022-04-18 12:59:56'),
(8, 'navigations', 'navigations', 'Навигация', 'Навигация', NULL, 'App\\Models\\Navigation', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-18 13:01:03', '2022-04-18 13:01:03'),
(10, 'news', 'news', 'Новости', 'Новости', NULL, 'App\\Models\\News', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-18 13:10:37', '2022-04-18 13:10:37'),
(11, 'projects', 'projects', 'Проекты', 'Проекты', NULL, 'App\\Models\\Project', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-18 13:13:47', '2022-04-18 13:13:47'),
(12, 'titles', 'titles', 'Заголовок', 'Заголовок', NULL, 'App\\Models\\Title', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-18 13:15:20', '2022-04-18 13:15:20'),
(13, 'review_cards', 'review-cards', 'Отзывы/Карточки', 'Отзывы/Карточки', NULL, 'App\\Models\\ReviewCard', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-18 23:35:41', '2022-04-18 23:35:41'),
(14, 'review_titles', 'review-titles', 'Отзывы/Заголовок', 'Отзывы/Заголовок', NULL, 'App\\Models\\ReviewTitle', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-18 23:37:33', '2022-04-18 23:38:23'),
(15, 'services_titles', 'services-titles', 'Сервисы/Заголовок', 'Сервисы/Заголовок', NULL, 'App\\Models\\ServicesTitle', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-18 23:39:41', '2022-04-18 23:39:41'),
(16, 'services_cards', 'services-cards', 'Сервисы/Карточки', 'Сервисы/Карточки', NULL, 'App\\Models\\ServicesCard', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-18 23:42:18', '2022-04-18 23:42:18');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `langs`
--

CREATE TABLE `langs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `langs`
--

INSERT INTO `langs` (`id`, `name`) VALUES
(1, 'ru'),
(2, 'kz'),
(3, 'en');

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-04-14 12:45:03', '2022-04-14 12:45:03');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-04-14 12:45:03', '2022-04-14 12:45:03', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2022-04-14 12:45:03', '2022-04-14 12:45:03', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2022-04-14 12:45:03', '2022-04-14 12:45:03', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2022-04-14 12:45:03', '2022-04-14 12:45:03', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2022-04-14 12:45:03', '2022-04-14 12:45:03', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2022-04-14 12:45:03', '2022-04-14 12:45:03', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2022-04-14 12:45:03', '2022-04-14 12:45:03', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2022-04-14 12:45:03', '2022-04-14 12:45:03', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2022-04-14 12:45:03', '2022-04-14 12:45:03', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2022-04-14 12:45:03', '2022-04-14 12:45:03', 'voyager.settings.index', NULL),
(11, 1, 'Языки', '', '_self', NULL, NULL, NULL, 15, '2022-04-16 22:46:28', '2022-04-16 22:46:28', 'voyager.langs.index', NULL),
(12, 1, 'О нас', '', '_self', NULL, NULL, NULL, 16, '2022-04-18 12:57:32', '2022-04-18 12:57:32', 'voyager.abouts.index', NULL),
(13, 1, 'Навигация', '', '_self', NULL, NULL, NULL, 17, '2022-04-18 13:01:03', '2022-04-18 13:01:03', 'voyager.navigations.index', NULL),
(14, 1, 'Новости', '', '_self', NULL, NULL, NULL, 18, '2022-04-18 13:10:38', '2022-04-18 13:10:38', 'voyager.news.index', NULL),
(15, 1, 'Проекты', '', '_self', NULL, NULL, NULL, 19, '2022-04-18 13:13:47', '2022-04-18 13:13:47', 'voyager.projects.index', NULL),
(16, 1, 'Заголовок', '', '_self', NULL, NULL, NULL, 20, '2022-04-18 13:15:20', '2022-04-18 13:15:20', 'voyager.titles.index', NULL),
(17, 1, 'Отзывы/Карточки', '', '_self', NULL, NULL, NULL, 21, '2022-04-18 23:35:41', '2022-04-18 23:35:41', 'voyager.review-cards.index', NULL),
(18, 1, 'Отзывы/Заголовок', '', '_self', NULL, NULL, NULL, 22, '2022-04-18 23:37:33', '2022-04-18 23:37:33', 'voyager.review-titles.index', NULL),
(19, 1, 'Сервисы/Заголовок', '', '_self', NULL, NULL, NULL, 23, '2022-04-18 23:39:41', '2022-04-18 23:39:41', 'voyager.services-titles.index', NULL),
(20, 1, 'Сервисы/Карточки', '', '_self', NULL, NULL, NULL, 24, '2022-04-18 23:42:18', '2022-04-18 23:42:18', 'voyager.services-cards.index', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2022_04_14_184058_create_langs_table', 1),
(26, '2022_04_18_054137_create_navigations_table', 2),
(27, '2022_04_18_054257_create_abouts_table', 2),
(28, '2022_04_18_054317_create_titles_table', 2),
(29, '2022_04_18_055340_create_news_table', 3),
(30, '2022_04_18_055702_create_projects_table', 3),
(31, '2022_04_18_191759_create_review_titles_table', 4),
(32, '2022_04_18_191808_create_review_cards_table', 4),
(33, '2022_04_18_193036_create_services_titles_table', 4),
(34, '2022_04_18_193312_create_services_cards_table', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `navigations`
--

CREATE TABLE `navigations` (
  `id` bigint UNSIGNED NOT NULL,
  `about` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `objects` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clients` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviews` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `news` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacts` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `preview_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview_photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(2, 'browse_bread', NULL, '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(3, 'browse_database', NULL, '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(4, 'browse_media', NULL, '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(5, 'browse_compass', NULL, '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(6, 'browse_menus', 'menus', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(7, 'read_menus', 'menus', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(8, 'edit_menus', 'menus', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(9, 'add_menus', 'menus', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(10, 'delete_menus', 'menus', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(11, 'browse_roles', 'roles', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(12, 'read_roles', 'roles', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(13, 'edit_roles', 'roles', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(14, 'add_roles', 'roles', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(15, 'delete_roles', 'roles', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(16, 'browse_users', 'users', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(17, 'read_users', 'users', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(18, 'edit_users', 'users', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(19, 'add_users', 'users', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(20, 'delete_users', 'users', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(21, 'browse_settings', 'settings', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(22, 'read_settings', 'settings', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(23, 'edit_settings', 'settings', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(24, 'add_settings', 'settings', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(25, 'delete_settings', 'settings', '2022-04-14 12:45:03', '2022-04-14 12:45:03'),
(26, 'browse_langs', 'langs', '2022-04-16 22:46:28', '2022-04-16 22:46:28'),
(27, 'read_langs', 'langs', '2022-04-16 22:46:28', '2022-04-16 22:46:28'),
(28, 'edit_langs', 'langs', '2022-04-16 22:46:28', '2022-04-16 22:46:28'),
(29, 'add_langs', 'langs', '2022-04-16 22:46:28', '2022-04-16 22:46:28'),
(30, 'delete_langs', 'langs', '2022-04-16 22:46:28', '2022-04-16 22:46:28'),
(31, 'browse_abouts', 'abouts', '2022-04-18 12:57:32', '2022-04-18 12:57:32'),
(32, 'read_abouts', 'abouts', '2022-04-18 12:57:32', '2022-04-18 12:57:32'),
(33, 'edit_abouts', 'abouts', '2022-04-18 12:57:32', '2022-04-18 12:57:32'),
(34, 'add_abouts', 'abouts', '2022-04-18 12:57:32', '2022-04-18 12:57:32'),
(35, 'delete_abouts', 'abouts', '2022-04-18 12:57:32', '2022-04-18 12:57:32'),
(36, 'browse_navigations', 'navigations', '2022-04-18 13:01:03', '2022-04-18 13:01:03'),
(37, 'read_navigations', 'navigations', '2022-04-18 13:01:03', '2022-04-18 13:01:03'),
(38, 'edit_navigations', 'navigations', '2022-04-18 13:01:03', '2022-04-18 13:01:03'),
(39, 'add_navigations', 'navigations', '2022-04-18 13:01:03', '2022-04-18 13:01:03'),
(40, 'delete_navigations', 'navigations', '2022-04-18 13:01:03', '2022-04-18 13:01:03'),
(41, 'browse_news', 'news', '2022-04-18 13:10:38', '2022-04-18 13:10:38'),
(42, 'read_news', 'news', '2022-04-18 13:10:38', '2022-04-18 13:10:38'),
(43, 'edit_news', 'news', '2022-04-18 13:10:38', '2022-04-18 13:10:38'),
(44, 'add_news', 'news', '2022-04-18 13:10:38', '2022-04-18 13:10:38'),
(45, 'delete_news', 'news', '2022-04-18 13:10:38', '2022-04-18 13:10:38'),
(46, 'browse_projects', 'projects', '2022-04-18 13:13:47', '2022-04-18 13:13:47'),
(47, 'read_projects', 'projects', '2022-04-18 13:13:47', '2022-04-18 13:13:47'),
(48, 'edit_projects', 'projects', '2022-04-18 13:13:47', '2022-04-18 13:13:47'),
(49, 'add_projects', 'projects', '2022-04-18 13:13:47', '2022-04-18 13:13:47'),
(50, 'delete_projects', 'projects', '2022-04-18 13:13:47', '2022-04-18 13:13:47'),
(51, 'browse_titles', 'titles', '2022-04-18 13:15:20', '2022-04-18 13:15:20'),
(52, 'read_titles', 'titles', '2022-04-18 13:15:20', '2022-04-18 13:15:20'),
(53, 'edit_titles', 'titles', '2022-04-18 13:15:20', '2022-04-18 13:15:20'),
(54, 'add_titles', 'titles', '2022-04-18 13:15:20', '2022-04-18 13:15:20'),
(55, 'delete_titles', 'titles', '2022-04-18 13:15:20', '2022-04-18 13:15:20'),
(56, 'browse_review_cards', 'review_cards', '2022-04-18 23:35:41', '2022-04-18 23:35:41'),
(57, 'read_review_cards', 'review_cards', '2022-04-18 23:35:41', '2022-04-18 23:35:41'),
(58, 'edit_review_cards', 'review_cards', '2022-04-18 23:35:41', '2022-04-18 23:35:41'),
(59, 'add_review_cards', 'review_cards', '2022-04-18 23:35:41', '2022-04-18 23:35:41'),
(60, 'delete_review_cards', 'review_cards', '2022-04-18 23:35:41', '2022-04-18 23:35:41'),
(61, 'browse_review_titles', 'review_titles', '2022-04-18 23:37:33', '2022-04-18 23:37:33'),
(62, 'read_review_titles', 'review_titles', '2022-04-18 23:37:33', '2022-04-18 23:37:33'),
(63, 'edit_review_titles', 'review_titles', '2022-04-18 23:37:33', '2022-04-18 23:37:33'),
(64, 'add_review_titles', 'review_titles', '2022-04-18 23:37:33', '2022-04-18 23:37:33'),
(65, 'delete_review_titles', 'review_titles', '2022-04-18 23:37:33', '2022-04-18 23:37:33'),
(66, 'browse_services_titles', 'services_titles', '2022-04-18 23:39:41', '2022-04-18 23:39:41'),
(67, 'read_services_titles', 'services_titles', '2022-04-18 23:39:41', '2022-04-18 23:39:41'),
(68, 'edit_services_titles', 'services_titles', '2022-04-18 23:39:41', '2022-04-18 23:39:41'),
(69, 'add_services_titles', 'services_titles', '2022-04-18 23:39:41', '2022-04-18 23:39:41'),
(70, 'delete_services_titles', 'services_titles', '2022-04-18 23:39:41', '2022-04-18 23:39:41'),
(71, 'browse_services_cards', 'services_cards', '2022-04-18 23:42:18', '2022-04-18 23:42:18'),
(72, 'read_services_cards', 'services_cards', '2022-04-18 23:42:18', '2022-04-18 23:42:18'),
(73, 'edit_services_cards', 'services_cards', '2022-04-18 23:42:18', '2022-04-18 23:42:18'),
(74, 'add_services_cards', 'services_cards', '2022-04-18 23:42:18', '2022-04-18 23:42:18'),
(75, 'delete_services_cards', 'services_cards', '2022-04-18 23:42:18', '2022-04-18 23:42:18');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `id` bigint UNSIGNED NOT NULL,
  `photos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exploitation` date NOT NULL,
  `square` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rented` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `underground` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `outer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `review_cards`
--

CREATE TABLE `review_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `review_titles`
--

CREATE TABLE `review_titles` (
  `id` bigint UNSIGNED NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-04-14 12:44:42', '2022-04-14 12:44:42'),
(2, 'user', 'Normal User', '2022-04-14 12:45:03', '2022-04-14 12:45:03');

-- --------------------------------------------------------

--
-- Структура таблицы `services_cards`
--

CREATE TABLE `services_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview_photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jobs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `services_titles`
--

CREATE TABLE `services_titles` (
  `id` bigint UNSIGNED NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `titles`
--

CREATE TABLE `titles` (
  `id` bigint UNSIGNED NOT NULL,
  `header_logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_background` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_background` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@mail.ru', 'users/default.png', NULL, '$2y$10$braNxrS00GxVCsaStVXt7eqi0EoRJL6vLt2UgOD32qVlG7MEdjyjG', NULL, '{\"locale\":\"ru\"}', '2022-04-14 12:44:42', '2022-04-14 12:45:31');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `navigations`
--
ALTER TABLE `navigations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `review_cards`
--
ALTER TABLE `review_cards`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `review_titles`
--
ALTER TABLE `review_titles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `services_cards`
--
ALTER TABLE `services_cards`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `services_titles`
--
ALTER TABLE `services_titles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `langs`
--
ALTER TABLE `langs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `navigations`
--
ALTER TABLE `navigations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `review_cards`
--
ALTER TABLE `review_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `review_titles`
--
ALTER TABLE `review_titles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `services_cards`
--
ALTER TABLE `services_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `services_titles`
--
ALTER TABLE `services_titles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `titles`
--
ALTER TABLE `titles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
