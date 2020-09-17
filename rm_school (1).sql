-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2020 at 04:47 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rm_school`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(38, 1, 1, 1, 'eutext.png', 'image', 272, 67, 10478, NULL, NULL, NULL, '2020-09-14 12:28:59', '2020-09-14 12:28:59', '2020-09-14 12:28:59', '528f74ef-40f4-4f74-a85e-2aa52d7bb4f8'),
(39, 1, 1, 1, 'logo.png', 'image', 288, 94, 27200, NULL, NULL, NULL, '2020-09-14 12:28:59', '2020-09-14 12:28:59', '2020-09-14 12:28:59', 'b3552714-d2e4-4e89-8d62-c3f24157b3e4'),
(118, 1, 1, 1, 'lab.jpg', 'image', 1280, 853, 166089, NULL, NULL, NULL, '2020-09-15 12:11:42', '2020-09-15 12:11:42', '2020-09-15 12:11:48', '414b1244-2516-4841-b90e-a603d4a54252'),
(123, 2, 4, 1, 'poster_SiC_Challenge_RM.pdf', 'pdf', NULL, NULL, 1466967, NULL, NULL, NULL, '2020-09-15 13:01:43', '2020-09-15 13:01:43', '2020-09-15 13:01:43', 'a6ee8e1a-4450-4e40-a241-222b38539188'),
(142, 1, 1, 1, 'nature5.jpg', 'image', 2199, 715, 407200, NULL, NULL, NULL, '2020-09-15 13:30:41', '2020-09-15 13:30:41', '2020-09-15 13:30:41', '16b3c2e6-c10e-46c6-bdd7-5cb1fcf01c3a'),
(143, 1, 1, 1, 'img-115.jpg', 'image', 1050, 700, 157707, NULL, NULL, NULL, '2020-09-15 13:30:42', '2020-09-15 13:30:42', '2020-09-15 13:30:42', 'a0545d27-3bba-4a96-a3cd-c9f4612576c7'),
(144, 1, 1, 1, 'nature1.jpg', 'image', 2040, 710, 524128, NULL, NULL, NULL, '2020-09-15 13:30:42', '2020-09-15 13:30:43', '2020-09-15 13:30:43', 'fa53573a-e38b-401c-84f7-f1367b524df7');

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `groupId`, `parentId`, `deletedWithGroup`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, NULL, '2020-09-14 09:33:04', '2020-09-14 09:33:04', '1dfaa936-4fa4-4a89-adf3-cbcc4f8b3096'),
(7, 1, NULL, 0, '2020-09-14 09:35:42', '2020-09-14 09:35:42', 'e1b45c7f-8131-4b76-acc4-1c3fef62abc5'),
(226, 1, NULL, 0, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '0c89e120-800a-49ce-a817-8985ec2ad79b'),
(231, 1, NULL, 0, '2020-09-16 13:18:19', '2020-09-16 13:18:19', '91079201-03ec-4a8d-9d1b-8c53b5a2d69a'),
(236, 2, NULL, NULL, '2020-09-16 13:24:44', '2020-09-16 13:24:44', '71558cfc-ddcf-4783-adfb-98148a4da3c9'),
(240, 2, NULL, NULL, '2020-09-16 13:26:32', '2020-09-16 13:26:32', '0d81231b-9ac0-4598-b9fd-fa5e416f0781');

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorygroups`
--

INSERT INTO `categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 3, 'Navigation topics', 'navigationTopics', '2020-09-14 09:29:04', '2020-09-14 09:29:04', NULL, '3a7eb026-21bc-4104-8b48-f870b7d9b8d6'),
(2, 2, 21, 'Footer categories', 'footerCategories', '2020-09-16 13:23:33', '2020-09-16 13:23:33', NULL, 'de77b476-6dea-4810-8fdb-0e13f7783b51');

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorygroups_sites`
--

INSERT INTO `categorygroups_sites` (`id`, `groupId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'navigation-topics/{slug}', NULL, '2020-09-14 09:29:04', '2020-09-14 09:29:04', 'ccc37424-bf67-4fdb-94f4-62edcab4075e'),
(2, 2, 1, 1, 'footer-categories/{slug}', NULL, '2020-09-16 13:23:33', '2020-09-16 13:23:33', '1680a572-fb7c-4fc6-8773-52d32e92ee82');

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(11, 1, 'title', '2020-09-14 12:19:14', 0, 1),
(70, 1, 'uri', '2020-09-15 13:44:55', 0, 1),
(128, 1, 'title', '2020-09-15 13:12:32', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(11, 1, 1, '2020-09-14 12:41:01', 0, 1),
(11, 1, 5, '2020-09-17 12:38:33', 0, 1),
(11, 1, 8, '2020-09-14 12:27:09', 0, 1),
(11, 1, 9, '2020-09-14 12:41:01', 0, 1),
(11, 1, 10, '2020-09-14 12:41:49', 0, 1),
(70, 1, 11, '2020-09-17 13:19:14', 0, 1),
(105, 1, 1, '2020-09-15 13:31:38', 0, 1),
(105, 1, 29, '2020-09-15 13:31:38', 0, 1),
(107, 1, 1, '2020-09-15 13:31:52', 0, 1),
(107, 1, 29, '2020-09-15 13:31:52', 0, 1),
(109, 1, 1, '2020-09-15 13:32:01', 0, 1),
(109, 1, 29, '2020-09-15 13:32:01', 0, 1),
(234, 1, 5, '2020-09-17 12:38:57', 0, 1),
(234, 1, 9, '2020-09-16 13:33:54', 0, 1),
(234, 1, 10, '2020-09-16 13:33:54', 0, 1),
(234, 1, 42, '2020-09-16 13:34:50', 0, 1),
(234, 1, 44, '2020-09-16 13:33:54', 0, 1),
(234, 1, 45, '2020-09-16 14:12:51', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_moreInfoLabel` text DEFAULT NULL,
  `field_learnMoreLabel` text DEFAULT NULL,
  `field_showMoreLabel` text DEFAULT NULL,
  `field_subtitle` text DEFAULT NULL,
  `field_posterPresentationLabel` text DEFAULT NULL,
  `field_eventDate` datetime DEFAULT NULL,
  `field_moreDetailsLabel` text DEFAULT NULL,
  `field_showEventsLabel` text DEFAULT NULL,
  `field_video` varchar(255) DEFAULT NULL,
  `field_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_moreInfoLabel`, `field_learnMoreLabel`, `field_showMoreLabel`, `field_subtitle`, `field_posterPresentationLabel`, `field_eventDate`, `field_moreDetailsLabel`, `field_showEventsLabel`, `field_video`, `field_description`) VALUES
(1, 1, 1, NULL, '2020-09-14 08:05:25', '2020-09-14 08:05:25', '7e76f643-99da-4408-9c85-52f38785d5bd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, 'Header topics', '2020-09-14 09:33:04', '2020-09-17 13:22:13', '6916c987-aa8d-464a-980a-c2a8d060fb48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 7, 1, 'About RM@Schools', '2020-09-14 09:35:42', '2020-09-14 09:35:42', 'aa89daa4-498f-445c-833a-f7011c9f90f4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 11, 1, 'Navigation bar', '2020-09-14 12:18:15', '2020-09-17 13:22:18', 'cc9d59dc-ec3f-4b1c-86ac-240974d390c2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 12, 1, 'Navbar', '2020-09-14 12:18:15', '2020-09-14 12:18:15', 'fcdc6a92-91cf-428a-83bf-9fbd47518217', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 13, 1, 'Navigation bar', '2020-09-14 12:19:14', '2020-09-14 12:19:14', 'f072ca99-3674-44fe-9d44-3a7763303f28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 18, 1, 'Navigation bar', '2020-09-14 12:21:28', '2020-09-14 12:21:28', '282eb7d6-b93b-4646-904c-dbc33cff56ad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 23, 1, 'Navigation bar', '2020-09-14 12:22:15', '2020-09-14 12:22:15', '1add3332-259d-474a-9367-481933d002c9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 28, 1, 'Navigation bar', '2020-09-14 12:26:53', '2020-09-14 12:26:53', '73189d88-672c-404a-ba75-e301a8a39a20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 33, 1, 'Navigation bar', '2020-09-14 12:27:09', '2020-09-14 12:27:09', 'e16f4f03-2004-4ec8-8473-248004016a2d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 38, 1, 'Eutext', '2020-09-14 12:28:59', '2020-09-14 12:28:59', 'a791317c-97d0-4a21-ba4a-d3d70d119d6f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 39, 1, 'Logo', '2020-09-14 12:28:59', '2020-09-14 12:28:59', '440cf8ca-196d-4037-89e9-bcfb20bec6f6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 40, 1, 'Navigation bar', '2020-09-14 12:29:21', '2020-09-14 12:29:21', 'b5a10132-2385-4045-bd5a-f34c11c5d935', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 45, 1, 'Navigation bar', '2020-09-14 12:34:38', '2020-09-14 12:34:38', '628d8f24-4a8b-4e96-81a2-7d4b72367367', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 50, 1, 'Navigation bar', '2020-09-14 12:40:48', '2020-09-14 12:40:48', '66bde116-90c6-4f75-b921-7a3d76095dd7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 55, 1, 'Navigation bar', '2020-09-14 12:41:00', '2020-09-14 12:41:00', '59ede102-3ee7-4f7d-90b1-a137e5929859', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 60, 1, 'Navigation bar', '2020-09-14 12:41:37', '2020-09-14 12:41:37', '44905550-a08f-43ed-994b-b2ea7baab31b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 65, 1, 'Navigation bar', '2020-09-14 12:41:48', '2020-09-14 12:41:48', 'a0b0fe1c-52d2-4430-a847-14f639e6c5ad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 70, 1, 'Homepage', '2020-09-14 13:11:26', '2020-09-17 13:19:14', 'bf053342-e178-4e9d-8302-809c511da262', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 71, 1, 'Homepage', '2020-09-14 13:11:26', '2020-09-14 13:11:26', '97ea907c-26d7-48ff-a99e-e8f0e2c46ae1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 72, 1, NULL, '2020-09-14 13:29:59', '2020-09-15 13:29:41', '7afbf5cb-c391-4c37-b64a-ebac21e9cdff', 'More info', 'Learn more', 'Show more', NULL, 'Poster presentation', NULL, 'More details', 'Show all events', NULL, NULL),
(22, 73, 1, 'Homepage', '2020-09-14 13:48:02', '2020-09-14 13:48:02', '40f16558-e103-45fb-a9f7-8ac97d24bb3b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 74, 1, 'dfcsd', '2020-09-14 13:50:05', '2020-09-14 13:50:05', 'f26cf519-4887-4a75-89fe-2c2e0a8d2aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 75, 1, 'dfcsd', '2020-09-14 13:50:05', '2020-09-14 13:50:05', '727ddbff-15ba-4bda-bc41-8f46be83e21c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 76, 1, 'vsd', '2020-09-14 13:50:13', '2020-09-14 13:50:13', '7d388f61-f451-4798-b753-51253bcc850c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 77, 1, 'vsd', '2020-09-14 13:50:13', '2020-09-14 13:50:13', '31fc41b2-f411-4f17-a2f5-d04caebb8479', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 78, 1, 'vdf', '2020-09-14 13:51:45', '2020-09-14 13:51:45', '09a655d4-3ff7-41c1-9153-32c60f4dc4e5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 79, 1, 'vdf', '2020-09-14 13:51:45', '2020-09-14 13:51:45', '0b068cff-2058-4b22-9812-d1d66123144c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 80, 1, 'fdgf', '2020-09-14 13:51:48', '2020-09-14 13:51:48', '0d920c16-cd7e-4317-810f-2f9272971a44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 81, 1, 'fdgf', '2020-09-14 13:51:48', '2020-09-14 13:51:48', '202b9d11-5b35-42be-ad13-3c8507060528', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 83, 1, 'Homepage', '2020-09-14 14:12:07', '2020-09-14 14:12:07', '1adf94d6-8e21-41ad-9c9a-2b822d98b1f0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 87, 1, 'Homepage', '2020-09-14 14:14:07', '2020-09-14 14:14:07', '9c60dba2-6efa-4929-b0e5-c19bc040241b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 91, 1, 'RawMatTERS Ambassadors at Schools1', '2020-09-14 14:40:42', '2020-09-14 14:40:42', '7ac00552-8d55-47d2-b1e6-d3e41454c523', NULL, NULL, NULL, 'Insolve youngsters in science technology & sustainability 1', NULL, NULL, NULL, NULL, NULL, NULL),
(34, 92, 1, 'RawMatTERS Ambassadors at Schools1', '2020-09-14 14:40:42', '2020-09-14 14:40:42', '127950ff-1f52-46ba-95ac-503877384cf5', NULL, NULL, NULL, 'Insolve youngsters in science technology & sustainability 1', NULL, NULL, NULL, NULL, NULL, NULL),
(35, 93, 1, 'RawMatTERS Ambassadors at Schools 2', '2020-09-14 14:41:18', '2020-09-14 14:41:18', '61271f84-f99e-4419-aed3-7b8386ccc268', NULL, NULL, NULL, 'Insolve youngsters in science technology & sustainability', NULL, NULL, NULL, NULL, NULL, NULL),
(36, 94, 1, 'RawMatTERS Ambassadors at Schools 2', '2020-09-14 14:41:18', '2020-09-14 14:41:18', '47a8dcb5-2754-46e3-8f8e-214ec66785d9', NULL, NULL, NULL, 'Insolve youngsters in science technology & sustainability', NULL, NULL, NULL, NULL, NULL, NULL),
(37, 95, 1, 'RawMatTERS Ambassadors at Schools 3', '2020-09-14 14:41:54', '2020-09-14 14:41:54', '6d146869-a166-4ded-97ce-a67f9fbf2910', NULL, NULL, NULL, 'Insolve youngsters in science <br> technology & sustainabilityInsolve youngsters in science technology & sustainability 3', NULL, NULL, NULL, NULL, NULL, NULL),
(38, 96, 1, 'RawMatTERS Ambassadors at Schools 3', '2020-09-14 14:41:54', '2020-09-14 14:41:54', 'c03f2f5b-01f2-4682-9057-cab714b4512b', NULL, NULL, NULL, 'Insolve youngsters in science <br> technology & sustainabilityInsolve youngsters in science technology & sustainability 3', NULL, NULL, NULL, NULL, NULL, NULL),
(39, 97, 1, 'Homepage', '2020-09-14 14:42:18', '2020-09-14 14:42:18', '440085ee-3565-46cd-a850-6458a6163529', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 99, 1, 'Homepage', '2020-09-15 07:37:55', '2020-09-15 07:37:55', '30fb543a-7e45-423e-afbd-299a270f89ec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 102, 1, 'Homepage', '2020-09-15 07:38:22', '2020-09-15 07:38:22', '753c67ff-fe16-4e39-b1ca-9019736263d6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 105, 1, 'RawMatTERS Ambassadors at Schools 1', '2020-09-15 08:09:01', '2020-09-16 14:30:33', '2325afc2-61f3-430f-ae82-011ebd47e8a2', NULL, NULL, NULL, 'Insolve youngsters in science technology & sustainability', NULL, NULL, NULL, NULL, NULL, NULL),
(43, 106, 1, 'RawMatTERS Ambassadors at Schools 1', '2020-09-15 08:09:01', '2020-09-15 08:09:01', 'a58d442b-7dd0-4b08-b641-801b4d4b282b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 107, 1, 'RawMatTERS Ambassadors at Schools 2', '2020-09-15 08:09:06', '2020-09-15 13:32:07', '458aa4f0-4fde-4dd5-bff0-7d3e7dfe16e0', NULL, NULL, NULL, 'Insolve youngsters in science technology & sustainability', NULL, NULL, NULL, NULL, NULL, NULL),
(45, 108, 1, 'RawMatTERS Ambassadors at Schools 2', '2020-09-15 08:09:06', '2020-09-15 08:09:06', '803530a9-bedc-4269-bce3-b8ed5981af45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 109, 1, 'RawMatTERS Ambassadors at Schools 3', '2020-09-15 08:09:11', '2020-09-15 13:32:01', 'd2776aa9-f80b-4303-b326-26557520c7e3', NULL, NULL, NULL, 'Insolve youngsters in science technology & sustainability', NULL, NULL, NULL, NULL, NULL, NULL),
(47, 110, 1, 'RawMatTERS Ambassadors at Schools 3', '2020-09-15 08:09:11', '2020-09-15 08:09:11', '92aff21a-de57-4fc2-9f1f-520d7aac778a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 111, 1, 'Homepage', '2020-09-15 08:09:22', '2020-09-15 08:09:22', 'd524e392-4a53-4ea9-8001-e6899fe8bb84', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 113, 1, 'Navigation bar', '2020-09-15 10:25:22', '2020-09-15 10:25:22', '0a6df491-a1f9-4e97-87ca-ddbe0448515b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 118, 1, 'Lab', '2020-09-15 12:11:41', '2020-09-15 12:11:48', '95849654-e1c3-4c00-87f0-a80ad15b9a24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 120, 1, 'Homepage', '2020-09-15 12:12:02', '2020-09-15 12:12:02', 'e0c27910-f60a-4392-8c97-b060d2b2888a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 123, 1, 'Poster Si C Challenge RM', '2020-09-15 13:01:43', '2020-09-15 13:01:43', 'fe222018-37bd-48cb-baf5-4e88966e0cf9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 124, 1, 'Actions in EU', '2020-09-15 13:02:49', '2020-09-15 13:02:49', '101e7822-e41e-4713-82c5-cd69fbcd69c4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 125, 1, 'Actions in EU', '2020-09-15 13:02:49', '2020-09-15 13:02:49', '8d7a6fb3-8139-4661-aaf9-e985c16eea5f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 126, 1, 'Study visits in companies', '2020-09-15 13:03:05', '2020-09-15 13:03:05', '96b868b8-87a4-446f-a971-b97fd3e7541b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 127, 1, 'Study visits in companies', '2020-09-15 13:03:05', '2020-09-15 13:03:05', '78175c3e-46fb-4662-8860-e93b2dd98939', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 128, 1, 'Topic 3', '2020-09-15 13:03:23', '2020-09-15 13:12:32', 'a3da6b1a-c106-4c7c-9deb-677705b45b55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 129, 1, 'Poster Presentation', '2020-09-15 13:03:23', '2020-09-15 13:03:23', '175fb61c-7a95-4280-ae66-91743cec409c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 130, 1, 'Topic 4', '2020-09-15 13:03:48', '2020-09-15 13:03:48', 'f91b2afb-b0fd-4f2f-b201-3747f2c92458', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 131, 1, 'Topic 4', '2020-09-15 13:03:48', '2020-09-15 13:03:48', 'b96da2ed-3cf0-4efe-a68c-24ba3bba2bec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 133, 1, 'Homepage', '2020-09-15 13:03:53', '2020-09-15 13:03:53', '415c44c0-8c95-4f35-b09e-798ae128d9d8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 137, 1, 'Topic 3', '2020-09-15 13:12:32', '2020-09-15 13:12:32', '620e7737-2423-431d-bb5e-4b6e2c39cf81', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 138, 1, 'Homepage', '2020-09-15 13:12:36', '2020-09-15 13:12:36', '0803a6f7-5562-4d12-bd0f-6a103f2d6e15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 142, 1, 'Nature5', '2020-09-15 13:30:41', '2020-09-15 13:30:41', 'bf8224e4-09ff-4692-bc5d-6355b9fd03d3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 143, 1, 'nature3', '2020-09-15 13:30:42', '2020-09-15 13:30:58', '1feccfb8-25a4-4cfc-9449-706982797c4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 144, 1, 'Nature1', '2020-09-15 13:30:42', '2020-09-15 13:30:42', '44caad9b-4b10-4d45-bd8e-5c7a92c724e5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 145, 1, 'RawMatTERS Ambassadors at Schools 1', '2020-09-15 13:31:38', '2020-09-15 13:31:38', 'b4ef3602-2be3-4f40-a4f8-69e446215dc9', NULL, NULL, NULL, 'Insolve youngsters in science technology & sustainability', NULL, NULL, NULL, NULL, NULL, NULL),
(68, 146, 1, 'RawMatTERS Ambassadors at Schools 2', '2020-09-15 13:31:52', '2020-09-15 13:31:52', 'b5cb2c24-9130-4f4b-b3e7-8f3bb74950c8', NULL, NULL, NULL, 'Insolve youngsters in science technology & sustainability', NULL, NULL, NULL, NULL, NULL, NULL),
(69, 147, 1, 'RawMatTERS Ambassadors at Schools 3', '2020-09-15 13:32:01', '2020-09-15 13:32:01', '41f375d8-4b33-49b6-afbf-d8dbf968019d', NULL, NULL, NULL, 'Insolve youngsters in science technology & sustainability', NULL, NULL, NULL, NULL, NULL, NULL),
(70, 148, 1, 'RawMatTERS Ambassadors at Schools 2', '2020-09-15 13:32:07', '2020-09-15 13:32:07', '6fc1484c-cc5e-4e8f-8e44-d9b39d6e5247', NULL, NULL, NULL, 'Insolve youngsters in science technology & sustainability', NULL, NULL, NULL, NULL, NULL, NULL),
(71, 149, 1, 'Homepage', '2020-09-15 13:32:08', '2020-09-15 13:32:08', '70f6b563-995d-4bf4-9676-d850b01cbe1e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 153, 1, 'Homepage', '2020-09-15 13:44:55', '2020-09-15 13:44:55', '8db953b8-0671-404b-885a-d9c9864414c9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 158, 1, 'Homepage', '2020-09-15 14:09:54', '2020-09-15 14:09:54', '76ea191b-aed5-4d09-a614-49028c3c853d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 163, 1, 'Homepage', '2020-09-15 14:12:47', '2020-09-15 14:12:47', 'fdd22fcd-bfb6-4407-b843-e6a92705d742', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 168, 1, 'Homepage', '2020-09-15 14:13:14', '2020-09-15 14:13:14', '0a9de749-10bb-400f-b873-0e3fee37a2ad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 172, 1, 'The Future of Education', '2020-09-16 07:34:25', '2020-09-16 07:34:25', 'f368149f-0f7e-4e35-80be-ae6408d71af2', NULL, NULL, NULL, 'Virtual Conference', NULL, '2020-06-18 07:00:00', NULL, NULL, NULL, NULL),
(77, 173, 1, 'The Future of Education', '2020-09-16 07:34:25', '2020-09-16 07:34:25', 'f7a463ed-22b5-4d88-8736-14c0850cb922', NULL, NULL, NULL, 'Virtual Conference', NULL, '2020-06-18 07:00:00', NULL, NULL, NULL, NULL),
(78, 174, 1, 'RAW Materials and Sustainability', '2020-09-16 07:35:16', '2020-09-16 07:35:25', 'bf0e6c3c-2868-4ced-b61d-05933de6fb87', NULL, NULL, NULL, 'Virtual lessons', NULL, '2020-06-11 07:00:00', NULL, NULL, NULL, NULL),
(79, 175, 1, 'RAW Materials and Sustainability', '2020-09-16 07:35:16', '2020-09-16 07:35:16', '683fabba-651e-4faa-b2f4-195dab003b07', NULL, NULL, NULL, 'Virtual lessons', NULL, '2020-06-11 07:00:00', NULL, NULL, NULL, NULL),
(80, 176, 1, 'RAW Materials and Sustainability', '2020-09-16 07:35:25', '2020-09-16 07:35:25', '647890d1-0fa6-42c0-ac7f-d14fed83e9b0', NULL, NULL, NULL, 'Virtual lessons', NULL, '2020-06-11 07:00:00', NULL, NULL, NULL, NULL),
(81, 177, 1, 'All in music!', '2020-09-16 07:36:00', '2020-09-16 07:36:00', '0d895e86-5b95-49a6-847f-0af41d3ee064', NULL, NULL, NULL, 'Live on Youtube and Facebook', NULL, '2020-06-19 07:00:00', NULL, NULL, NULL, NULL),
(82, 178, 1, 'All in music!', '2020-09-16 07:36:00', '2020-09-16 07:36:00', '224bcfea-53ae-47a5-86fe-360f3c6850f1', NULL, NULL, NULL, 'Live on Youtube and Facebook', NULL, '2020-06-19 07:00:00', NULL, NULL, NULL, NULL),
(83, 180, 1, 'Homepage', '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'f3ddc2af-df7f-47da-8a21-e93cdf74d351', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 185, 1, 'New Event', '2020-09-16 08:38:45', '2020-09-16 08:38:45', 'c5108485-3618-40c3-8ffe-e90feb2cb76a', NULL, NULL, NULL, 'Lorem ipsum', NULL, '2020-09-25 07:00:00', NULL, NULL, NULL, NULL),
(85, 186, 1, 'New Event', '2020-09-16 08:38:45', '2020-09-16 08:38:45', 'd1443cd5-faae-42c5-a304-04685ed8d040', NULL, NULL, NULL, 'Lorem ipsum', NULL, '2020-09-25 07:00:00', NULL, NULL, NULL, NULL),
(86, 187, 1, 'Homepage', '2020-09-16 08:38:50', '2020-09-16 08:38:50', '3f6dba50-defa-4075-b5b1-860b2dd25cab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 192, 1, 'Newer event', '2020-09-16 10:01:57', '2020-09-16 10:01:57', '04d9f57e-b949-45ff-b4cf-7094bfa4ec22', NULL, NULL, NULL, 'ldsadjo', NULL, '2020-10-31 07:00:00', NULL, NULL, NULL, NULL),
(88, 193, 1, 'Newer event', '2020-09-16 10:01:57', '2020-09-16 10:01:57', 'c58f675b-9766-4fdb-98ad-4b74cf9681ef', NULL, NULL, NULL, 'ldsadjo', NULL, '2020-10-31 07:00:00', NULL, NULL, NULL, NULL),
(89, 194, 1, 'Next year', '2020-09-16 10:02:16', '2020-09-16 10:02:16', 'd4320dae-07bf-4a6f-a92a-37d50e8c61bb', NULL, NULL, NULL, 'jfksidfjpo', NULL, '2021-03-06 08:00:00', NULL, NULL, NULL, NULL),
(90, 195, 1, 'Next year', '2020-09-16 10:02:16', '2020-09-16 10:02:16', '79a014c8-d6d2-49c3-925f-08d20bffbf12', NULL, NULL, NULL, 'jfksidfjpo', NULL, '2021-03-06 08:00:00', NULL, NULL, NULL, NULL),
(91, 196, 1, 'Homepage', '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'c8b66fd1-5f7c-42f1-b218-2090f5892686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 202, 1, 'Homepage', '2020-09-16 12:48:16', '2020-09-16 12:48:16', '3f3ea971-3b19-44dd-8674-d9fbab883975', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 208, 1, '[ITA] Lorem ipsum dolor sit amet consectetur adipisicing elit', '2020-09-16 13:07:31', '2020-09-16 13:07:31', '42b8bd3c-e89f-458b-8d95-19e4531c62f3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.youtube.com/embed/K1QICrgxTjA', NULL),
(94, 209, 1, '[ITA] Lorem ipsum dolor sit amet consectetur adipisicing elit', '2020-09-16 13:07:31', '2020-09-16 13:07:31', 'f40abc62-d3f1-4e22-a0c6-b14e2be2aab1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.youtube.com/embed/K1QICrgxTjA', NULL),
(95, 210, 1, 'RM@Schools Lorem ipsum dolor sit amet consectetur adipisicing elit', '2020-09-16 13:08:00', '2020-09-16 13:08:00', '86d1e449-b3b9-4997-a28b-21bc453068a8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.youtube.com/embed/K1QICrgxTjA', NULL),
(96, 211, 1, 'RM@Schools Lorem ipsum dolor sit amet consectetur adipisicing elit', '2020-09-16 13:08:00', '2020-09-16 13:08:00', '2c3cf56c-94eb-46a2-b238-503f4d6c7021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.youtube.com/embed/K1QICrgxTjA', NULL),
(97, 212, 1, 'Unde, voluptates? Lorem ipsum dolor sit amet consectetur adipisicing elit.', '2020-09-16 13:08:36', '2020-09-16 13:08:36', '890f3584-2033-476f-abb4-a36a2dc9a386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.youtube.com/embed/K1QICrgxTjA', NULL),
(98, 213, 1, 'Unde, voluptates? Lorem ipsum dolor sit amet consectetur adipisicing elit.', '2020-09-16 13:08:36', '2020-09-16 13:08:36', '92c1df08-e1d2-4f31-9046-c6daa11715d0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.youtube.com/embed/K1QICrgxTjA', NULL),
(99, 214, 1, 'Homepage', '2020-09-16 13:08:43', '2020-09-16 13:08:43', '07d9a661-9679-4954-aee0-f1a530bc6109', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 220, 1, 'Homepage', '2020-09-16 13:13:34', '2020-09-16 13:13:34', '55206592-3ddf-4d8e-b83c-b799c3c4440f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 226, 1, 'Learning Pathways', '2020-09-16 13:16:47', '2020-09-16 13:16:47', 'cbbcb028-0e0c-46ef-8bad-89c6f5c88db6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 231, 1, 'Documents', '2020-09-16 13:18:19', '2020-09-16 13:18:19', 'ab2bc3d3-b990-4432-899d-e78a56b2c9b2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 234, 1, 'Footer', '2020-09-16 13:19:20', '2020-09-17 12:38:57', 'd1f407c1-6dd7-402f-9f12-6d5c265674db', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 235, 1, 'Footer', '2020-09-16 13:19:20', '2020-09-16 13:19:20', '4033c099-bcbc-402f-80d4-91c66062cd6b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 236, 1, 'About RM@Schools', '2020-09-16 13:24:44', '2020-09-17 12:04:22', 'efebc2c7-5ff6-4d6f-bb05-2f8a464b6ea1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 240, 1, 'Learning Pathways', '2020-09-16 13:26:32', '2020-09-16 13:26:32', '4b87ffb5-82e6-4b37-a553-8c7a6516c1b4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 245, 1, 'Footer', '2020-09-16 13:31:21', '2020-09-16 13:31:21', '18c57ba8-1744-4f03-b3ef-13eb51a7bcc5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 246, 1, 'Privacy policy', '2020-09-16 13:32:01', '2020-09-16 13:32:01', 'a3353fa6-62f0-49a9-8fa5-1897f9786afb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 247, 1, 'Privacy policy', '2020-09-16 13:32:01', '2020-09-16 13:32:01', '12b9d2e1-86d8-43e5-8749-f22a78c2f51f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 248, 1, 'Terms & Conditions', '2020-09-16 13:32:20', '2020-09-16 13:32:20', '3e07ece5-9db7-464e-89e6-41b47a6fdb27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 249, 1, 'Terms & Conditions', '2020-09-16 13:32:20', '2020-09-16 13:32:20', '0f6196f5-a0b2-447e-b6f2-116ddd16eeaf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 254, 1, 'Footer', '2020-09-16 13:33:54', '2020-09-16 13:33:54', 'c9f9a65d-3890-4ad4-8bb5-ae3120308516', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 259, 1, 'Footer', '2020-09-16 13:34:09', '2020-09-16 13:34:09', 'dda79781-dcae-4af1-b3b0-5d2c2c4f5efd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 264, 1, 'Footer', '2020-09-16 13:34:50', '2020-09-16 13:34:50', 'd4ad1879-6295-4eb2-aa92-a4072b3738a3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 269, 1, 'Footer', '2020-09-16 14:11:39', '2020-09-16 14:11:39', 'b49c3675-993b-4dab-85ca-59b56d82a26e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 277, 1, 'Footer', '2020-09-16 14:12:51', '2020-09-16 14:12:51', '3048803f-f244-4350-831d-29ca01c9e07a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 285, 1, 'RawMatTERS Ambassadors at Schools 1', '2020-09-16 14:30:33', '2020-09-16 14:30:33', 'ccd81a21-a6b9-44c1-a0fd-269d7216003a', NULL, NULL, NULL, 'Insolve youngsters in science technology & sustainability', NULL, NULL, NULL, NULL, NULL, NULL),
(118, 286, 1, 'Homepage', '2020-09-16 14:30:34', '2020-09-16 14:30:34', 'f22a2c66-1ba8-414e-9ccb-fcadca12fd7f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 292, 1, 'Homepage', '2020-09-16 14:36:56', '2020-09-16 14:36:56', '7da76dae-0e97-453c-a67a-a1680ff553fa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 298, 1, 'Footer', '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'c6a16ea2-432a-4c43-be0e-8b47fe7b9ec5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 306, 1, 'Navigation bar', '2020-09-17 12:36:05', '2020-09-17 12:36:05', 'da91baa8-2d1e-4599-899a-0795d469235e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 311, 1, 'Navigation bar', '2020-09-17 12:36:36', '2020-09-17 12:36:36', '5e17e3ef-8986-4b5c-9417-16c3c2bb4ff4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 316, 1, 'Navigation bar', '2020-09-17 12:37:55', '2020-09-17 12:37:55', '3eb7c605-416a-4c69-a7ae-8c00fcba563b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 321, 1, 'Navigation bar', '2020-09-17 12:38:33', '2020-09-17 12:38:33', '711921cc-b22a-4077-b3c9-9c1566e44ff7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 326, 1, 'Footer', '2020-09-17 12:38:57', '2020-09-17 12:38:57', '6a445b5d-07df-44a8-a93e-0d9c30daee3c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 334, 1, 'About us', '2020-09-17 12:57:46', '2020-09-17 13:10:20', '5acdcdfd-972b-495a-bdc3-3a96e0b45245', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 335, 1, 'About us', '2020-09-17 12:57:47', '2020-09-17 12:57:47', '8ce2ffe7-5823-42ef-9d05-d6ecebe526c8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 336, 1, 'About us', '2020-09-17 12:57:47', '2020-09-17 12:57:47', '2c64a2fb-e7ef-4fbf-ba5a-2b558a38d062', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 337, 1, 'About us', '2020-09-17 13:08:27', '2020-09-17 13:08:27', '517e8a0b-2677-4e66-82ac-1f479774d36a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 338, 1, 'About us', '2020-09-17 13:10:20', '2020-09-17 13:10:20', 'bc1ec9e5-b6b4-4bf9-9ec7-45898e27f320', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 339, 1, 'Something', '2020-09-17 13:19:08', '2020-09-17 13:19:08', '29a506f3-b520-4d73-bc38-6f480d4dda67', NULL, NULL, NULL, 'Something else', NULL, '2020-09-23 07:00:00', NULL, NULL, NULL, NULL),
(132, 340, 1, 'Something', '2020-09-17 13:19:08', '2020-09-17 13:19:08', '7b834045-e1af-4c12-8084-d4aa995a3146', NULL, NULL, NULL, 'Something else', NULL, '2020-09-23 07:00:00', NULL, NULL, NULL, NULL),
(133, 341, 1, 'Homepage', '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'fd23e379-0970-4597-a88f-923434715043', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 347, 1, 'Navigation bar', '2020-09-17 13:22:18', '2020-09-17 13:22:18', '750c4e38-f804-462b-ae12-3d8b06d3dd5e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deprecationerrors`
--

INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(335, 'ElementQuery::getIterator()', 'C:\\xampp\\htdocs\\rm_school\\templates\\common\\navbar.twig:25', '2020-09-17 14:42:45', 'C:\\xampp\\htdocs\\rm_school\\templates\\common\\navbar.twig', 25, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":560,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\storage\\\\runtime\\\\compiled_templates\\\\66\\\\66d28a48b9758863e6c1844d36624bfb4a762c8b903867d1e8971de54f4905f0.php\",\"line\":100,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_697569059acc46dcf913cd2a0113580d9b4cbef36f02494ba27632f443ea8cdc\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_697569059acc46dcf913cd2a0113580d9b4cbef36f02494ba27632f443ea8cdc\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_697569059acc46dcf913cd2a0113580d9b4cbef36f02494ba27632f443ea8cdc\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_697569059acc46dcf913cd2a0113580d9b4cbef36f02494ba27632f443ea8cdc\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\storage\\\\runtime\\\\compiled_templates\\\\7d\\\\7dfcf5c0d06f205a0c335287259ce36ddb53d9c9116cc2c8224267b03ff59c9c.php\",\"line\":100,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...]\"},{\"objectClass\":\"__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":184,\"class\":\"__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd\",\"method\":\"block_header\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"header\\\" => [__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd, \\\"block_header\\\"], \\\"main\\\" => [__TwigTemplate_c98c8c94127e2f73d82a1f5a748f65653cda72685b1ecf9ef289b3c2c6e53af9, \\\"block_main\\\"], \\\"footer\\\" => [__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd, \\\"block_footer\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\storage\\\\runtime\\\\compiled_templates\\\\7d\\\\7dfcf5c0d06f205a0c335287259ce36ddb53d9c9116cc2c8224267b03ff59c9c.php\",\"line\":41,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"header\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"header\\\" => [__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd, \\\"block_header\\\"], \\\"main\\\" => [__TwigTemplate_c98c8c94127e2f73d82a1f5a748f65653cda72685b1ecf9ef289b3c2c6e53af9, \\\"block_main\\\"], \\\"footer\\\" => [__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd, \\\"block_footer\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"header\\\" => [__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd, \\\"block_header\\\"], \\\"main\\\" => [__TwigTemplate_c98c8c94127e2f73d82a1f5a748f65653cda72685b1ecf9ef289b3c2c6e53af9, \\\"block_main\\\"], \\\"footer\\\" => [__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd, \\\"block_footer\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"header\\\" => [__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd, \\\"block_header\\\"], \\\"main\\\" => [__TwigTemplate_c98c8c94127e2f73d82a1f5a748f65653cda72685b1ecf9ef289b3c2c6e53af9, \\\"block_main\\\"], \\\"footer\\\" => [__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd, \\\"block_footer\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c88329689f4a3bc2affedf4f6b89f3f94eb446e88977b65e464c36e2a7117fcd\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\storage\\\\runtime\\\\compiled_templates\\\\bd\\\\bd20a9f23f634af0f36bf8e1ffe699236a5c914eaebf6088e8a223043713bfc6.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_c98c8c94127e2f73d82a1f5a748f65653cda72685b1ecf9ef289b3c2c6e53af9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c98c8c94127e2f73d82a1f5a748f65653cda72685b1ecf9ef289b3c2c6e53af9\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_c98c8c94127e2f73d82a1f5a748f65653cda72685b1ecf9ef289b3c2c6e53af9\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_c98c8c94127e2f73d82a1f5a748f65653cda72685b1ecf9ef289b3c2c6e53af9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c98c8c94127e2f73d82a1f5a748f65653cda72685b1ecf9ef289b3c2c6e53af9\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_c98c8c94127e2f73d82a1f5a748f65653cda72685b1ecf9ef289b3c2c6e53af9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c98c8c94127e2f73d82a1f5a748f65653cda72685b1ecf9ef289b3c2c6e53af9\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_c98c8c94127e2f73d82a1f5a748f65653cda72685b1ecf9ef289b3c2c6e53af9\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":392,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":453,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":251,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"__home__\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":189,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"__home__\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"__home__\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":280,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"__home__\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"__home__\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":265,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\rm_school\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-09-17 14:42:45', '2020-09-17 14:42:45', 'ef739273-27be-45af-b07f-1f8d71595762');

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2020-09-14 08:05:25', '2020-09-14 08:05:25', NULL, '126e9a08-c0bb-4956-b773-6fe635a25e3f'),
(2, NULL, NULL, 3, 'craft\\elements\\Category', 1, 0, '2020-09-14 09:33:04', '2020-09-17 13:22:13', NULL, '77dd8611-43b5-47f8-ac16-4d707cbfce18'),
(3, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 09:33:05', '2020-09-17 12:04:08', NULL, '194a2312-301d-4a36-8882-92541aaa20d4'),
(4, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 09:33:05', '2020-09-17 12:04:08', NULL, 'b83826fe-0375-4ab0-b265-6cb81c9c03d8'),
(5, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 09:33:05', '2020-09-17 12:04:08', NULL, 'f2f1c07d-b20f-47bc-928d-81ce973dd7ec'),
(6, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 09:33:05', '2020-09-14 09:35:56', NULL, '8eb28518-36a6-4f64-8efb-6beabffa0d20'),
(7, NULL, NULL, 3, 'craft\\elements\\Category', 1, 0, '2020-09-14 09:35:42', '2020-09-14 09:35:42', '2020-09-16 13:35:04', '3851ca30-ffa8-4570-949f-080a804f128f'),
(8, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 09:35:42', '2020-09-14 09:35:42', '2020-09-16 13:35:04', 'c8a304f7-33cf-40f8-b4b2-01cca3d9b904'),
(9, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 09:35:42', '2020-09-14 09:35:42', '2020-09-16 13:35:04', '49ae9bdf-714f-473f-8b3b-917b024b7134'),
(10, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 09:35:42', '2020-09-14 09:35:42', '2020-09-16 13:35:04', '03c1468a-cdbb-437a-9729-78ed63e463c1'),
(11, NULL, NULL, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:18:15', '2020-09-17 13:22:18', NULL, 'cebec8be-67ac-4127-b963-3f7eeaeb9f48'),
(12, NULL, 1, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:18:15', '2020-09-14 12:18:15', NULL, 'ce2b0c5a-5d3f-46d0-8c9d-727c0a45b858'),
(13, NULL, 2, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:19:13', '2020-09-14 12:19:13', NULL, 'e70ab1fc-b8d4-4115-b856-4739f22d831b'),
(14, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:21:28', '2020-09-17 12:38:33', NULL, '41c2f0d9-4654-44b7-b2a9-b4b6d4ca6daf'),
(15, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:21:28', '2020-09-15 10:25:22', NULL, 'b6523b4d-e1c7-46b4-957a-d6721860ea44'),
(16, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:21:28', '2020-09-15 10:25:22', NULL, '80fe0c68-da84-4e9e-92cd-5f688233abc0'),
(17, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:21:28', '2020-09-15 10:25:22', NULL, 'd9c58a76-1126-486f-8dc5-e1b242ad2fbe'),
(18, NULL, 3, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:21:28', '2020-09-14 12:21:28', NULL, '2a6532d1-ee07-40fc-8c32-49fce159edda'),
(19, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:21:28', '2020-09-14 12:21:28', NULL, '6ca29d7e-4ecd-4135-9543-f7bcd634ef30'),
(20, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:21:28', '2020-09-14 12:21:28', NULL, '17345b50-ec29-4b06-886e-b93321acfad7'),
(21, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:21:28', '2020-09-14 12:21:28', NULL, '0866a305-704d-4899-82f9-51568fd92900'),
(22, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:21:28', '2020-09-14 12:21:28', NULL, '75f8fb37-5eec-4359-a2c5-748f00d73bb7'),
(23, NULL, 4, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:22:15', '2020-09-14 12:22:15', NULL, '5e7da740-43ea-4ed1-ab8b-cac0d15d9cfb'),
(24, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:22:15', '2020-09-14 12:21:28', NULL, 'bf0edd64-2ace-49c3-aa2c-f5a191ae63d7'),
(25, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:22:15', '2020-09-14 12:21:28', NULL, 'a4393ccc-1653-411c-8ddc-f341d1c5b43e'),
(26, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:22:15', '2020-09-14 12:21:28', NULL, '4f083d15-ce5d-4100-94c6-ef1635712ef8'),
(27, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:22:15', '2020-09-14 12:21:28', NULL, '01fb73ff-ab39-4ed5-8a10-0c1bde03e5cb'),
(28, NULL, 5, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:26:53', '2020-09-14 12:26:53', NULL, '4233c3f3-e4ab-4f0b-a035-a55d06c784c6'),
(29, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:26:53', '2020-09-14 12:21:28', NULL, 'a6beab83-3e0b-4550-adb0-01d18b1050a4'),
(30, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:26:53', '2020-09-14 12:21:28', NULL, '07808bbc-22be-4577-89fb-e78f75e44bed'),
(31, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:26:53', '2020-09-14 12:21:28', NULL, '92ea90b3-904b-4a76-b270-6105295a756f'),
(32, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:26:53', '2020-09-14 12:21:28', NULL, 'a5a7de4e-5f68-462c-81ca-c7861ad81fb9'),
(33, NULL, 6, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:27:09', '2020-09-14 12:27:09', NULL, '3d50292a-4e29-4609-8157-d9063a4af69b'),
(34, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:27:09', '2020-09-14 12:21:28', NULL, '6c6bfbb6-df9b-437e-bee1-7e4db31de4fb'),
(35, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:27:09', '2020-09-14 12:21:28', NULL, 'eabc8a58-310f-4d99-8a35-f9be457ab900'),
(36, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:27:09', '2020-09-14 12:21:28', NULL, '7a4e9a07-539e-46cc-b27f-f1ec1a110dac'),
(37, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:27:09', '2020-09-14 12:21:28', NULL, '1a787339-2389-4c60-b133-5c2a340b22d7'),
(38, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2020-09-14 12:28:59', '2020-09-14 12:28:59', NULL, '90938ca7-8c2a-4b4d-bf91-d93ff1ff9bfc'),
(39, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2020-09-14 12:28:59', '2020-09-14 12:28:59', NULL, '7a0c1f7a-715c-4502-8113-5c9b353697a3'),
(40, NULL, 7, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:29:21', '2020-09-14 12:29:21', NULL, '9a0a3cb9-f8b8-441d-8d2a-f6d96f5d7f94'),
(41, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:29:21', '2020-09-14 12:21:28', NULL, '1a9088c3-b50f-4eda-839a-64b15bb4a348'),
(42, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:29:22', '2020-09-14 12:21:28', NULL, '8febfb4c-df7a-42ce-bff3-1fe463a83f8c'),
(43, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:29:22', '2020-09-14 12:21:28', NULL, '919e97a3-a35c-4314-8902-fa09c796df14'),
(44, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:29:22', '2020-09-14 12:21:28', NULL, 'dc878078-b1be-4f8c-886f-55c6a0b24687'),
(45, NULL, 8, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:34:38', '2020-09-14 12:34:38', NULL, 'ebc67179-33a6-47f5-a990-fe721794a7db'),
(46, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:34:38', '2020-09-14 12:21:28', NULL, 'cfc7046f-c7b7-44d7-9a52-1d13bdc9a7f2'),
(47, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:34:38', '2020-09-14 12:21:28', NULL, 'f3ce7978-f5b2-469f-9ee5-913f59c1924c'),
(48, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:34:38', '2020-09-14 12:21:28', NULL, 'ee0ffec3-0b48-40b6-86ae-74c856dae472'),
(49, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:34:38', '2020-09-14 12:34:38', NULL, '02cbe0db-ecf5-4af5-960b-dd08c42f854d'),
(50, NULL, 9, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:40:48', '2020-09-14 12:40:48', NULL, 'eabafbf7-e068-4521-a0ee-92eecc010b32'),
(51, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:40:48', '2020-09-14 12:21:28', NULL, '5f13d746-4860-45cd-b541-3d2edc8980d7'),
(52, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:40:48', '2020-09-14 12:21:28', NULL, '60a49084-f03b-4c1f-a1ec-9a84fe8bacb5'),
(53, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:40:48', '2020-09-14 12:21:28', NULL, 'da6c8f5d-52db-4218-9981-5c9c454cb795'),
(54, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:40:48', '2020-09-14 12:34:38', NULL, 'b465fedc-7f64-4345-ac13-660bb6c8698c'),
(55, NULL, 10, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:41:00', '2020-09-14 12:41:00', NULL, '60561751-5a0f-4a03-bfca-3f8aeb9fc0f2'),
(56, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:41:00', '2020-09-14 12:21:28', NULL, '4b01fc5b-88dd-432b-bf1d-aa46af1d98c9'),
(57, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:41:00', '2020-09-14 12:21:28', NULL, 'b3ce2905-5d7c-4cf3-b6e3-5012e571f979'),
(58, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:41:00', '2020-09-14 12:21:28', NULL, 'c727578c-657c-4c0c-a044-5da29112b914'),
(59, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:41:00', '2020-09-14 12:34:38', NULL, 'b6febae3-cf99-4fca-b900-4c5a2023b68f'),
(60, NULL, 11, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:41:37', '2020-09-14 12:41:37', NULL, 'f4577d14-2a19-4ae2-9f92-cbb19b85bedd'),
(61, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:41:37', '2020-09-14 12:21:28', NULL, 'c240025a-9b22-4d07-9cef-efc8c52085a8'),
(62, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:41:37', '2020-09-14 12:21:28', NULL, 'ddb326d4-d332-4a84-8a37-211da3a4a237'),
(63, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:41:37', '2020-09-14 12:21:28', NULL, '486ce2d7-8d8c-422a-a201-bbdfa093a5f6'),
(64, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:41:37', '2020-09-14 12:34:38', NULL, '7fe11079-b4c5-438e-9033-de726a1198be'),
(65, NULL, 12, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-14 12:41:48', '2020-09-14 12:41:48', NULL, '0db5f26f-3e8d-4473-b74b-62a1cf9bd1da'),
(66, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:41:48', '2020-09-14 12:21:28', NULL, 'e4572cf7-fcd2-4906-be4d-1cab63b4d33d'),
(67, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:41:48', '2020-09-14 12:21:28', NULL, 'd72e6663-69ba-4118-9669-ed2143db54e3'),
(68, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:41:49', '2020-09-14 12:21:28', NULL, 'b4183f7e-ed6d-4a21-bd32-5689cc73eb59'),
(69, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 12:41:49', '2020-09-14 12:34:38', NULL, '81f24277-7e03-442e-b7b9-14cfeb1732e2'),
(70, NULL, NULL, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-14 13:11:26', '2020-09-17 13:19:14', NULL, 'faded48a-035a-4138-9381-f600ca1c791f'),
(71, NULL, 13, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-14 13:11:26', '2020-09-14 13:11:26', NULL, '89ff381c-44e8-45a9-8352-9629d6bd95a8'),
(72, NULL, NULL, 9, 'craft\\elements\\GlobalSet', 1, 0, '2020-09-14 13:29:59', '2020-09-15 13:29:41', NULL, 'ab3d7b93-6d92-450e-b53c-0489232a17d7'),
(73, NULL, 14, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-14 13:48:02', '2020-09-14 13:48:02', NULL, '23207a71-450e-4420-aa56-9ec57bd40e2d'),
(74, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-14 13:50:05', '2020-09-14 13:50:05', '2020-09-14 13:52:08', 'f6d9eeef-4d13-40e2-b413-7a211454426d'),
(75, NULL, 15, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-14 13:50:05', '2020-09-14 13:50:05', '2020-09-14 13:52:08', 'b9d1519f-48c5-4774-b384-6e7703aaa7e9'),
(76, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-14 13:50:13', '2020-09-14 13:50:13', '2020-09-14 13:52:08', '578424a0-b9cf-40d7-a087-d853addec87e'),
(77, NULL, 16, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-14 13:50:13', '2020-09-14 13:50:13', '2020-09-14 13:52:08', 'c43fa395-f4a5-4f34-8965-a6381018eeff'),
(78, NULL, NULL, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-14 13:51:45', '2020-09-14 13:51:45', '2020-09-14 13:52:02', '704a97c2-1e44-4137-9468-c27bd1f2e6ea'),
(79, NULL, 17, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-14 13:51:45', '2020-09-14 13:51:45', '2020-09-14 13:52:02', '2469c5f9-1726-4c4e-a4be-1b52744b9e83'),
(80, NULL, NULL, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-14 13:51:48', '2020-09-14 13:51:48', '2020-09-14 13:52:03', 'b82993e4-4477-4d8e-bd1a-5045f96b3360'),
(81, NULL, 18, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-14 13:51:48', '2020-09-14 13:51:48', '2020-09-14 13:52:03', '5ec902da-817e-478d-9741-e784e5dc6cfc'),
(82, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 14:12:07', '2020-09-16 12:48:16', NULL, '5fc4b22b-f60a-4e6e-a6d9-5d318b3ad306'),
(83, NULL, 19, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-14 14:12:07', '2020-09-14 14:12:07', NULL, '32ce7473-0b90-4e0f-8980-d21d9c696918'),
(84, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 14:12:07', '2020-09-14 14:12:07', NULL, '18079847-7e1c-42f0-bd5e-d7002564780d'),
(85, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '2020-09-14 14:42:18', '310b085b-782d-4181-9133-5b986d726bdd'),
(86, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '2020-09-14 14:42:18', 'da81ffb1-0f4d-436e-bab2-8044ae613c37'),
(87, NULL, 20, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-14 14:14:07', '2020-09-14 14:14:07', NULL, '4368c82a-76f9-4ca4-8e69-be6a2dc441b4'),
(88, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 14:14:07', '2020-09-14 14:14:07', NULL, '1b02f99c-d115-49a4-8421-1292dbc702fb'),
(89, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 14:14:07', '2020-09-14 14:14:07', NULL, 'ec9302a2-5e48-4f9f-9e2a-445d962704a8'),
(90, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 14:14:07', '2020-09-14 14:14:07', NULL, '956ccd85-a595-4a56-8f78-02ca616e02f0'),
(91, NULL, NULL, 15, 'craft\\elements\\Entry', 1, 0, '2020-09-14 14:40:42', '2020-09-14 14:40:42', '2020-09-15 07:19:49', 'b7f79d55-90bd-4d63-af3e-ee48f222af01'),
(92, NULL, 21, 15, 'craft\\elements\\Entry', 1, 0, '2020-09-14 14:40:42', '2020-09-14 14:40:42', '2020-09-15 07:19:49', 'eeb6cbc4-043c-4b9e-b49a-0fe0918b0408'),
(93, NULL, NULL, 15, 'craft\\elements\\Entry', 1, 0, '2020-09-14 14:41:18', '2020-09-14 14:41:18', '2020-09-15 07:19:49', '5ff35180-7b07-4d51-b7c7-d9d330881e46'),
(94, NULL, 22, 15, 'craft\\elements\\Entry', 1, 0, '2020-09-14 14:41:18', '2020-09-14 14:41:18', '2020-09-15 07:19:49', 'ac24bd53-cc93-49bc-9c31-76d2873dbb9e'),
(95, NULL, NULL, 15, 'craft\\elements\\Entry', 1, 0, '2020-09-14 14:41:54', '2020-09-14 14:41:54', '2020-09-15 07:19:49', '85d9ea05-9b92-4df7-9efb-334912375295'),
(96, NULL, 23, 15, 'craft\\elements\\Entry', 1, 0, '2020-09-14 14:41:54', '2020-09-14 14:41:54', '2020-09-15 07:19:49', 'f4535edf-fd4b-4678-92e6-32cc34428be4'),
(97, NULL, 24, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-14 14:42:18', '2020-09-14 14:42:18', NULL, 'fa3ecbbe-e1a7-4c2c-a34c-454a4ebe8113'),
(98, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-14 14:42:18', '2020-09-14 14:42:18', NULL, '50d9d5b1-7f3b-4c66-a46a-9dcf3225e1b7'),
(99, NULL, 25, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-15 07:37:55', '2020-09-15 07:37:55', NULL, '5e340f4f-df5f-46f6-ab64-a275d043747c'),
(100, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 07:37:55', '2020-09-15 07:37:55', NULL, 'ab78c2ca-9751-46a8-909a-491b62e283a9'),
(101, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 07:38:22', '2020-09-15 07:38:22', '2020-09-15 08:09:22', 'd771c6d1-35d8-4537-a0a9-13ff96bda5a2'),
(102, NULL, 26, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-15 07:38:22', '2020-09-15 07:38:22', NULL, '9e6eb8a4-1faa-4298-83fc-5fc456b6f2d2'),
(103, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 07:38:22', '2020-09-15 07:38:22', NULL, 'd032a35a-3ec6-4825-bd3a-1e6a608d3fc5'),
(104, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 07:38:22', '2020-09-15 07:38:22', NULL, '0f37e7ba-9119-4828-a1d7-a64310bfb5b0'),
(105, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-09-15 08:09:01', '2020-09-16 14:30:33', NULL, '60a2a56e-85ef-4caf-860e-bdea25a94810'),
(106, NULL, 27, 16, 'craft\\elements\\Entry', 1, 0, '2020-09-15 08:09:01', '2020-09-15 08:09:01', NULL, '7d38bffd-d1f5-4bdc-9cda-f598cf9766d9'),
(107, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-09-15 08:09:06', '2020-09-15 13:32:07', NULL, '4bed3872-1c27-48f6-91ab-e79e64fdca54'),
(108, NULL, 28, 16, 'craft\\elements\\Entry', 1, 0, '2020-09-15 08:09:06', '2020-09-15 08:09:06', NULL, 'a72cb397-810b-420b-b427-2f8a53e5bd4e'),
(109, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2020-09-15 08:09:11', '2020-09-15 13:32:01', NULL, 'ef70d5fc-928c-4bc1-925b-a6bb1a95d568'),
(110, NULL, 29, 16, 'craft\\elements\\Entry', 1, 0, '2020-09-15 08:09:11', '2020-09-15 08:09:11', NULL, 'b32c2457-b497-4cfb-9e00-13e753a56fe5'),
(111, NULL, 30, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-15 08:09:22', '2020-09-15 08:09:22', NULL, 'f832d995-01ce-466d-a01b-2b5119d928d7'),
(112, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 08:09:22', '2020-09-15 08:09:22', NULL, 'a3d46dd6-1298-4afb-a069-446c5e0b9a31'),
(113, NULL, 31, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-15 10:25:21', '2020-09-15 10:25:21', NULL, 'cc351bdf-4f4e-47e4-81c1-b62b528821bc'),
(114, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 10:25:22', '2020-09-15 10:25:22', NULL, '54833390-0158-48ee-9a00-9e9a33221ad9'),
(115, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 10:25:22', '2020-09-15 10:25:22', NULL, 'b62d0ded-2ed6-4f34-9a7f-a1efb93e77fd'),
(116, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 10:25:22', '2020-09-15 10:25:22', NULL, '86d5072d-bcaf-4e2a-bdcb-f71c55ace00f'),
(117, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 10:25:22', '2020-09-15 10:25:22', NULL, 'ec34fd9f-d65f-468f-8c54-d87331548da2'),
(118, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2020-09-15 12:11:41', '2020-09-15 12:11:48', NULL, '8f57be1b-861f-4259-a7d3-50bd3836c8bf'),
(119, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 12:12:02', '2020-09-16 12:48:16', NULL, '5d061931-8286-4fb6-ac4d-617fb9d8a7d0'),
(120, NULL, 32, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-15 12:12:02', '2020-09-15 12:12:02', NULL, 'bff25188-5e8c-49c4-9c76-28eb094feabd'),
(121, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 12:12:02', '2020-09-15 12:12:02', NULL, '02a70140-9a26-4d0c-a285-de9c54ab0246'),
(122, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 12:12:02', '2020-09-15 12:12:02', NULL, '45e13698-3235-408c-a23d-6fb7edc05812'),
(123, NULL, NULL, 10, 'craft\\elements\\Asset', 1, 0, '2020-09-15 13:01:43', '2020-09-15 13:01:43', NULL, '6e8b378a-9774-4737-9c0a-8587ce288c57'),
(124, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:02:49', '2020-09-15 13:02:49', NULL, 'f817fd1e-b5e3-4826-ade2-1dbd6340d40a'),
(125, NULL, 33, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:02:49', '2020-09-15 13:02:49', NULL, 'e87c9a22-d629-4c2c-8d4a-d64615e86395'),
(126, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:03:05', '2020-09-15 13:03:05', NULL, '396c4a18-d7de-4e13-9652-c9dad892c7ab'),
(127, NULL, 34, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:03:05', '2020-09-15 13:03:05', NULL, '913eb495-0d3e-4506-8286-aab83bd0191a'),
(128, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:03:23', '2020-09-15 13:12:32', NULL, 'ba4bbe03-f826-49bf-98a0-ce601a4db50a'),
(129, NULL, 35, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:03:23', '2020-09-15 13:03:23', NULL, '664559e1-a926-44d6-8072-4299894f22e1'),
(130, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:03:48', '2020-09-15 13:03:48', NULL, 'e6d70e7d-adf5-4c61-a83e-1163eef3172f'),
(131, NULL, 36, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:03:48', '2020-09-15 13:03:48', NULL, 'b390c133-04f7-4b7f-b433-6cad2e02a9c5'),
(132, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:03:53', '2020-09-16 12:48:16', NULL, '0dba74ab-6f4a-4ff3-95ea-6cd49f3c9abf'),
(133, NULL, 37, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:03:53', '2020-09-15 13:03:53', NULL, 'ac201d7a-70b7-48a0-a034-9f7ebb5b5e72'),
(134, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:03:53', '2020-09-15 13:03:53', NULL, 'b83bf463-47e9-4360-8d24-e291ff71fbaa'),
(135, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:03:53', '2020-09-15 13:03:53', NULL, 'ef8d9523-b260-4f3c-9073-576ae2d69c66'),
(136, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:03:53', '2020-09-15 13:03:53', NULL, '3ea56c70-9c09-49a9-b8c3-87260d2671db'),
(137, NULL, 38, 8, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:12:32', '2020-09-15 13:12:32', NULL, '4d425c57-7343-4c8f-a684-d3d64caaff7e'),
(138, NULL, 39, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:12:36', '2020-09-15 13:12:36', NULL, '4fc88252-ac57-4958-a1ba-409d7408b782'),
(139, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:12:36', '2020-09-15 13:03:53', NULL, '6a6f7d0c-78cc-4e5b-a39b-4da146815d98'),
(140, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:12:36', '2020-09-15 13:03:53', NULL, 'd7f53098-2bdc-44d6-9880-a23315c52245'),
(141, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:12:36', '2020-09-15 13:03:53', NULL, '5dda38b7-a815-4a9a-a206-630ab83fd514'),
(142, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2020-09-15 13:30:41', '2020-09-15 13:30:41', NULL, 'fd2486e9-2620-496b-b429-a520f5d6071c'),
(143, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2020-09-15 13:30:42', '2020-09-15 13:30:58', NULL, 'acb25e46-b903-47d6-8510-ce48047e388c'),
(144, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2020-09-15 13:30:42', '2020-09-15 13:30:42', NULL, '870a55c4-c452-45fa-9e80-bb2626020bbf'),
(145, NULL, 40, 16, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:31:38', '2020-09-15 13:31:38', NULL, '900b0b0a-a220-4e10-a4b5-42a2e3fe6696'),
(146, NULL, 41, 16, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:31:52', '2020-09-15 13:31:52', NULL, '63071fd8-c82a-47d3-a71b-e3f702dbfa61'),
(147, NULL, 42, 16, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:32:01', '2020-09-15 13:32:01', NULL, '308bdc95-f08b-4236-b55e-f37d83164716'),
(148, NULL, 43, 16, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:32:07', '2020-09-15 13:32:07', NULL, 'c35e35d4-ca93-4e18-b8ca-f59bb46f4c9e'),
(149, NULL, 44, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:32:08', '2020-09-15 13:32:08', NULL, '30d0263a-9ffb-41d4-a545-d1a70149da9c'),
(150, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:32:08', '2020-09-15 13:03:53', NULL, 'e0259e7b-d51b-4a7c-85c7-e773cdd7e0d7'),
(151, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:32:08', '2020-09-15 13:03:53', NULL, 'f59b40b4-9e56-400f-bbce-ec0d4327af1d'),
(152, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:32:08', '2020-09-15 13:03:53', NULL, '7ab39921-f1ed-4e6b-9819-a06e037aa6cf'),
(153, NULL, 45, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-15 13:44:55', '2020-09-15 13:44:55', NULL, '4cacc4fd-416a-416b-bd23-fa2f21994232'),
(154, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:44:55', '2020-09-15 13:03:53', NULL, '3de9006e-85af-4735-a8a6-cb821f8475c7'),
(155, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:44:55', '2020-09-15 13:03:53', NULL, 'c20ffe06-fd29-4701-9b34-551a83d206e9'),
(156, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 13:44:55', '2020-09-15 13:03:53', NULL, '2170bde1-77f5-44ef-8a1b-a18379db3a48'),
(157, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 14:09:54', '2020-09-15 14:12:47', '2020-09-15 14:13:14', '6fb565bf-e356-4b54-8a9f-802b3df39dd8'),
(158, NULL, 46, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-15 14:09:54', '2020-09-15 14:09:54', NULL, '38fdcf63-cec3-4cc7-b313-4d07be090f96'),
(159, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 14:09:54', '2020-09-15 14:09:54', NULL, 'a70eadf8-1cee-4f7e-a085-3fa311fcfcfc'),
(160, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 14:09:54', '2020-09-15 14:09:54', NULL, '81d08f6e-d202-4702-b1e1-f8ba78ef08d7'),
(161, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 14:09:54', '2020-09-15 14:09:54', NULL, 'aff3084a-f5b7-4237-890b-782f50b151fe'),
(162, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 14:09:54', '2020-09-15 14:09:54', NULL, '477079a7-97d6-498c-b07b-bc3f662dc6d6'),
(163, NULL, 47, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-15 14:12:47', '2020-09-15 14:12:47', NULL, 'dc5ca4a3-0f1b-421c-bfea-3f47c24b1793'),
(164, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 14:12:47', '2020-09-15 14:12:47', NULL, 'ab45f36d-1cbc-41fd-becb-260a016a19e0'),
(165, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 14:12:47', '2020-09-15 14:12:47', NULL, '188fc326-a079-44fe-922b-db0d0a5dd631'),
(166, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 14:12:47', '2020-09-15 14:12:47', NULL, '3db757dd-229b-4c0f-a8d9-b24b5416f409'),
(167, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 14:12:47', '2020-09-15 14:12:47', NULL, '9d4c3fa8-5a55-49c1-ab54-da2871d23646'),
(168, NULL, 48, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-15 14:13:14', '2020-09-15 14:13:14', NULL, '8c38dc74-9e17-4d55-85f3-59df4bb458f0'),
(169, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 14:13:14', '2020-09-15 14:13:14', NULL, '971f573d-7c4e-4b07-bdce-f33ae77c5319'),
(170, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 14:13:14', '2020-09-15 14:13:14', NULL, 'b351c004-b69a-4f82-ad19-5c83ff855be3'),
(171, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-15 14:13:14', '2020-09-15 14:13:14', NULL, 'a7742775-bb77-4eb1-a9ba-f8358f25c208'),
(172, NULL, NULL, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 07:34:25', '2020-09-16 07:34:25', NULL, '5a16eba2-20f8-4ca9-8448-61cbb6d1d95c'),
(173, NULL, 49, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 07:34:25', '2020-09-16 07:34:25', NULL, '3ead5ab4-ad8c-400b-8210-92a352732f2c'),
(174, NULL, NULL, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 07:35:16', '2020-09-16 07:35:25', NULL, 'e9e3f22b-763b-4bf8-9507-45cd5d1b0f2b'),
(175, NULL, 50, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 07:35:16', '2020-09-16 07:35:16', NULL, 'c29e57e1-9017-4f88-bea6-5df8578dc26b'),
(176, NULL, 51, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 07:35:25', '2020-09-16 07:35:25', NULL, '3bf0ee33-bba3-4772-96f7-240c446a8ab1'),
(177, NULL, NULL, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 07:36:00', '2020-09-16 07:36:00', NULL, '33185eb8-e429-457b-8471-65d2d561cb77'),
(178, NULL, 52, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 07:36:00', '2020-09-16 07:36:00', NULL, '31f0f5d8-18f2-48c6-9926-40bd02c23b7f'),
(179, NULL, NULL, 14, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 07:36:16', '2020-09-17 13:19:14', NULL, '220c2b24-4764-4f10-9452-bf5a03abe199'),
(180, NULL, 53, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-16 07:36:16', '2020-09-16 07:36:16', NULL, '7ff87053-5ed2-42c3-a720-28ffa55d699d'),
(181, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 07:36:16', '2020-09-16 07:36:16', NULL, '391c41db-cf37-4828-9873-f4dc88893205'),
(182, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 07:36:16', '2020-09-16 07:36:16', NULL, 'e5598d1b-cdeb-4586-b62f-28d4d8f5940d'),
(183, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 07:36:16', '2020-09-16 07:36:16', NULL, 'cf54dd39-4b77-45c8-b66d-cd0c8fbc9069'),
(184, NULL, NULL, 14, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 07:36:16', '2020-09-16 07:36:16', NULL, 'e5fe2c68-02ba-4276-a31b-1700a2b4b2a0'),
(185, NULL, NULL, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 08:38:45', '2020-09-16 08:38:45', NULL, '9eb836e1-6ff8-441c-be8c-51c431ad3b26'),
(186, NULL, 54, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 08:38:45', '2020-09-16 08:38:45', NULL, 'befa127b-9886-4284-a181-43d805043ab3'),
(187, NULL, 55, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-16 08:38:50', '2020-09-16 08:38:50', NULL, '7c89504b-1010-4318-af48-e78611910c56'),
(188, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 08:38:50', '2020-09-16 07:36:16', NULL, '8e158e93-30e7-437e-a839-b96c973a2056'),
(189, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 08:38:50', '2020-09-16 07:36:16', NULL, 'b14ceb98-a012-43a3-b373-aa59e7044341'),
(190, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 08:38:50', '2020-09-16 07:36:16', NULL, '85092ed4-8fee-47b0-80ba-35c3f9d6443d'),
(191, NULL, NULL, 14, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 08:38:50', '2020-09-16 08:38:50', NULL, '8ef0fe81-166a-4067-9471-885ddc11a932'),
(192, NULL, NULL, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 10:01:57', '2020-09-16 10:01:57', NULL, '4d155ebe-6574-483c-bc02-8b961d1e8b46'),
(193, NULL, 56, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 10:01:57', '2020-09-16 10:01:57', NULL, 'd775c34d-a433-4105-8500-24076dcf54b9'),
(194, NULL, NULL, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 10:02:16', '2020-09-16 10:02:16', NULL, 'fc589e74-358a-4865-9e03-953d96d58f47'),
(195, NULL, 57, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-16 10:02:16', '2020-09-16 10:02:16', NULL, '49c74b5f-c7af-440f-aa9d-8403aaf865ce'),
(196, NULL, 58, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-16 10:02:20', '2020-09-16 10:02:20', NULL, '2d27cfdc-96d4-4b0b-ba97-07d7ccd9ba08'),
(197, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 10:02:20', '2020-09-16 07:36:16', NULL, '28fd7e46-ddb2-4761-8486-b19e8c1c7a41'),
(198, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 10:02:20', '2020-09-16 07:36:16', NULL, '8036661d-196a-466e-883d-c5f8b76683ab'),
(199, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 10:02:20', '2020-09-16 07:36:16', NULL, '0bde1bf9-dc2b-4819-9f9a-6e2c4114317a'),
(200, NULL, NULL, 14, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 10:02:20', '2020-09-16 10:02:20', NULL, '9c73592d-8811-4df9-8526-55be3480ac0a'),
(201, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 12:48:16', '2020-09-16 14:36:56', NULL, 'a4a14ef0-aa54-4720-bfd4-bd2c6bdacd89'),
(202, NULL, 59, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-16 12:48:16', '2020-09-16 12:48:16', NULL, '95c1c929-8ad3-40ab-b821-c57a4629bc94'),
(203, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 12:48:16', '2020-09-16 12:48:16', NULL, '7d4db872-29bd-4053-bd61-e3b3a7f7e053'),
(204, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 12:48:16', '2020-09-16 12:48:16', NULL, '074a5458-3540-4025-b419-cf1a2f9fe611'),
(205, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 12:48:16', '2020-09-16 12:48:16', NULL, '138a6359-29c7-425f-a508-4eb7be532a96'),
(206, NULL, NULL, 14, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 12:48:16', '2020-09-16 12:48:16', NULL, '25c1a5e8-a2c6-4ea6-bc2c-a880983ca07c'),
(207, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 12:48:16', '2020-09-16 12:48:16', NULL, 'bbc2aa11-467b-4661-b9cb-4dc53dc1a961'),
(208, NULL, NULL, 19, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:07:31', '2020-09-16 13:07:31', NULL, '1fd4196c-b757-4bce-8f86-142fbcf9a2f7'),
(209, NULL, 60, 19, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:07:31', '2020-09-16 13:07:31', NULL, '1a07ea86-794c-43e4-b6bf-975f50a9a1d3'),
(210, NULL, NULL, 19, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:08:00', '2020-09-16 13:08:00', NULL, 'bbb51247-c23b-484d-8ebe-1f4d208b33bd'),
(211, NULL, 61, 19, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:08:00', '2020-09-16 13:08:00', NULL, 'f5054efa-ee97-4f5e-92f2-916254b86307'),
(212, NULL, NULL, 19, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:08:36', '2020-09-16 13:08:36', NULL, '57900b4a-e8c7-495b-8992-2c638d34be0b'),
(213, NULL, 62, 19, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:08:36', '2020-09-16 13:08:36', NULL, '2abc557f-2a6a-4c66-99f2-0bb718c19020'),
(214, NULL, 63, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:08:43', '2020-09-16 13:08:43', NULL, '7a4c3b0a-544b-47ad-a2b8-d6d59fe9cf11'),
(215, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:08:43', '2020-09-16 12:48:16', NULL, '30440066-7a16-4665-b350-67636143c307'),
(216, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:08:43', '2020-09-16 12:48:16', NULL, '1b313a92-08f2-49e7-a155-b550e2b74189'),
(217, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:08:43', '2020-09-16 12:48:16', NULL, '5609c11d-be8a-4b37-b0e4-8a357e67f6ff'),
(218, NULL, NULL, 14, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:08:43', '2020-09-16 12:48:16', NULL, '8dd61c75-bb5f-4b31-a472-08b82a793d73'),
(219, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:08:43', '2020-09-16 13:08:43', NULL, '00f5e119-0cd1-45e9-8a72-402fcd86c307'),
(220, NULL, 64, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:13:34', '2020-09-16 13:13:34', NULL, '882b059a-344c-4979-9a61-3988254324d4'),
(221, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:13:34', '2020-09-16 12:48:16', NULL, '7e093e5f-b6e8-48dc-964a-3daf03ffc77f'),
(222, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:13:34', '2020-09-16 12:48:16', NULL, 'e316cb93-c19c-4f9f-8d01-ad91ef131d89'),
(223, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:13:34', '2020-09-16 12:48:16', NULL, '4d5b831c-20cd-4ad3-aa95-51f135389045'),
(224, NULL, NULL, 14, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:13:34', '2020-09-16 12:48:16', NULL, 'fc50865f-317e-40ac-aafc-ab5d6e9d134b'),
(225, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:13:34', '2020-09-16 13:08:43', NULL, '1b5ab9f9-1086-4f19-a4f8-ab94b7f4561f'),
(226, NULL, NULL, 3, 'craft\\elements\\Category', 1, 0, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '2020-09-16 13:35:04', 'd6256d76-a482-4e9a-ab11-6ea39aee86f3'),
(227, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '2020-09-16 13:35:04', '9405194c-0b6d-4387-b8bd-e443848bf929'),
(228, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '2020-09-16 13:35:04', '7a4e0fcf-8bc1-49ed-909f-493fc0b9b990'),
(229, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '2020-09-16 13:35:04', '04abf62c-a021-4ae3-977b-f3fb7f7e1448'),
(230, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '2020-09-16 13:35:04', '5da4caba-dcaf-4e0a-9a3a-2b122393349d'),
(231, NULL, NULL, 3, 'craft\\elements\\Category', 1, 0, '2020-09-16 13:18:19', '2020-09-16 13:18:19', '2020-09-16 13:35:04', '27a2c6ae-e5f7-46fd-8229-1c24a5b4d42b'),
(232, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:18:20', '2020-09-16 13:18:20', '2020-09-16 13:35:04', '6ca3d618-85d6-47e6-abf4-40ca6b8d7fc3'),
(233, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:18:20', '2020-09-16 13:18:20', '2020-09-16 13:35:04', 'd10501ad-9be0-458a-9e05-d8545252ce0e'),
(234, NULL, NULL, 20, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:19:20', '2020-09-17 12:38:57', NULL, '55c9cb81-7d45-49db-8d54-635a159e6003'),
(235, NULL, 65, 20, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:19:20', '2020-09-16 13:19:20', NULL, '7807ccb4-3d8f-4cda-8a77-a716a6775380'),
(236, NULL, NULL, 21, 'craft\\elements\\Category', 1, 0, '2020-09-16 13:24:44', '2020-09-17 12:04:22', NULL, 'c75349b2-eed7-41d1-8eb0-865b0aca8b80'),
(237, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:24:44', '2020-09-17 12:04:22', NULL, '7ddfce38-ee0a-4e1b-99b8-5827fc4a46e0'),
(238, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:24:44', '2020-09-16 13:24:44', NULL, '7a924485-4dbb-42d3-865b-947514731f87'),
(239, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:24:44', '2020-09-16 13:24:44', NULL, '86b85667-fccc-4c87-8a12-c60dfcfdc776'),
(240, NULL, NULL, 21, 'craft\\elements\\Category', 1, 0, '2020-09-16 13:26:32', '2020-09-16 13:26:32', NULL, 'fcf6041e-d6a7-47b0-bde5-b98d97391198'),
(241, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:26:32', '2020-09-16 13:26:32', NULL, 'bc160608-2039-457d-882f-0aba3a373bb8'),
(242, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:26:33', '2020-09-16 13:26:33', NULL, 'a097c87f-4b33-4c73-845e-84512d718440'),
(243, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:26:33', '2020-09-16 13:26:33', NULL, 'ed4fd7b7-8bd2-44d1-8465-ea18725aa287'),
(244, NULL, NULL, 2, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:26:33', '2020-09-16 13:26:33', NULL, 'f26e4472-b47c-4fb4-afd4-622410049876'),
(245, NULL, 66, 20, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:31:20', '2020-09-16 13:31:20', NULL, 'f5aea5cf-9916-4138-9b5c-386c4ad7acbe'),
(246, NULL, NULL, 22, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:32:01', '2020-09-16 13:32:01', NULL, '8689769e-29cd-4aa9-8a80-26d616abc2b0'),
(247, NULL, 67, 22, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:32:01', '2020-09-16 13:32:01', NULL, 'e7776675-323d-4275-84ac-7b808fc81fe3'),
(248, NULL, NULL, 22, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:32:20', '2020-09-16 13:32:20', NULL, '8262218c-bedb-4e4d-8e88-4f296101f4ba'),
(249, NULL, 68, 22, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:32:20', '2020-09-16 13:32:20', NULL, '2f96ccb6-f44a-4635-82f7-8f424818caae'),
(250, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:33:53', '2020-09-17 12:38:57', NULL, 'bbd9b899-d144-4c97-bb2a-6c9b38072077'),
(251, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:33:54', '2020-09-16 13:33:54', NULL, 'f4b7f4de-95e1-463e-9957-92715f8c7539'),
(252, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:33:54', '2020-09-16 13:33:54', NULL, 'ab13b221-d74f-4585-b40c-3755aadab5ed'),
(253, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:33:54', '2020-09-16 13:33:54', NULL, 'a0034a1e-2821-44c6-a902-8e2e0ef8b1b5'),
(254, NULL, 69, 20, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:33:53', '2020-09-16 13:33:53', NULL, '766ccbd4-6a44-4aa1-8848-80b1710b271d'),
(255, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:33:54', '2020-09-16 13:33:53', NULL, '4efef45d-b518-41bc-a079-ff7998bf61cb'),
(256, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:33:54', '2020-09-16 13:33:54', NULL, 'ace51d27-4247-4342-8936-37c7d2755dc5'),
(257, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:33:54', '2020-09-16 13:33:54', NULL, '37a78a9d-3d13-4b22-8254-d96494625956'),
(258, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:33:54', '2020-09-16 13:33:54', NULL, '9a0ac133-166e-4475-9e05-ae718bd82990'),
(259, NULL, 70, 20, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:34:09', '2020-09-16 13:34:09', NULL, 'd09cca85-dd89-42ad-a264-7425eb9fdce5'),
(260, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:34:09', '2020-09-16 13:33:53', NULL, 'a40e76b6-8e5c-4db9-ab03-00acd79c93e3'),
(261, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:34:09', '2020-09-16 13:33:54', NULL, 'e0d4547a-2d8d-4f50-a419-e8701ca37612'),
(262, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:34:09', '2020-09-16 13:33:54', NULL, 'fb4c205a-783e-46da-9315-0a4811c69de2'),
(263, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:34:09', '2020-09-16 13:33:54', NULL, '3738e7aa-3539-4a2f-b99d-01fbc39733ec'),
(264, NULL, 71, 20, 'craft\\elements\\Entry', 1, 0, '2020-09-16 13:34:50', '2020-09-16 13:34:50', NULL, '5f2355eb-9a1b-4f02-87e3-566216fd5ac7'),
(265, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:34:50', '2020-09-16 13:33:53', NULL, '04cc196c-aec2-402a-8cb4-1830952bfa13'),
(266, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:34:50', '2020-09-16 13:33:54', NULL, 'c238ca63-c4f1-40ad-846f-ea6f7531b3b5'),
(267, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:34:50', '2020-09-16 13:33:54', NULL, '45de1d13-3ffa-418c-b911-e2752400390c'),
(268, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 13:34:50', '2020-09-16 13:33:54', NULL, '606d1f23-e983-4a0a-b667-20aed3a7c014'),
(269, NULL, 72, 20, 'craft\\elements\\Entry', 1, 0, '2020-09-16 14:11:39', '2020-09-16 14:11:39', NULL, '049d5024-7e91-493c-8374-d5b28d13feea'),
(270, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:11:39', '2020-09-16 13:33:53', NULL, 'eb479701-5e5d-4146-86ec-2205eff6f0fe'),
(271, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:11:39', '2020-09-16 13:33:54', NULL, '977eb231-8642-4bdf-a11b-55b14df0c615'),
(272, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:11:39', '2020-09-16 13:33:54', NULL, '806be250-3f2b-4b5d-b361-4526a2a61f24'),
(273, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:11:39', '2020-09-16 13:33:54', NULL, 'ed740b99-196e-47c3-8981-69bd3c591133'),
(274, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:12:50', '2020-09-16 14:12:50', NULL, 'b3ab6d62-e6b8-47d5-a15b-f59b3072b940'),
(275, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:12:51', '2020-09-16 14:12:51', NULL, '50f761e6-565b-45fb-9153-85bd4eafcc6b'),
(276, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:12:51', '2020-09-16 14:12:51', NULL, 'c868496a-822b-4965-8a9f-918e1c9ace80'),
(277, NULL, 73, 20, 'craft\\elements\\Entry', 1, 0, '2020-09-16 14:12:50', '2020-09-16 14:12:50', NULL, '76c98f44-ae7b-4300-8c09-4d610ea02e44'),
(278, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:12:51', '2020-09-16 14:12:50', NULL, 'c68f3c8a-fbc8-41b1-a8db-fed43883e934'),
(279, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:12:51', '2020-09-16 14:12:51', NULL, 'c8854002-b7e2-4e93-a3f6-d09151c96a83'),
(280, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:12:51', '2020-09-16 14:12:51', NULL, '035c14e6-e3a4-4ef7-938a-88f95893423e'),
(281, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:12:51', '2020-09-16 13:33:53', NULL, '189a065f-83fb-4c86-823b-c3278d8838c6'),
(282, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:12:51', '2020-09-16 13:33:54', NULL, '5597128d-0799-4a95-8c4d-f33b81dffc44'),
(283, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:12:51', '2020-09-16 13:33:54', NULL, 'dac087e6-240e-460e-a0f4-3e45382e6165'),
(284, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:12:51', '2020-09-16 13:33:54', NULL, 'f3688089-7030-4ec9-93f4-308decc69068'),
(285, NULL, 74, 16, 'craft\\elements\\Entry', 1, 0, '2020-09-16 14:30:33', '2020-09-16 14:30:33', NULL, '6db96675-3346-4426-9fb2-73caf8b69c67'),
(286, NULL, 75, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-16 14:30:34', '2020-09-16 14:30:34', NULL, '57ab74e9-1d30-4d7c-873d-1870a98479df'),
(287, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:30:34', '2020-09-16 12:48:16', NULL, '51bd8acb-13c0-4265-8c09-dffbf0c0ab80'),
(288, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:30:34', '2020-09-16 12:48:16', NULL, 'f1b412f1-e384-4497-8611-33c52cf997ad'),
(289, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:30:34', '2020-09-16 12:48:16', NULL, '2e8f5aec-acb7-4212-acdb-f5e078a950eb'),
(290, NULL, NULL, 14, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:30:34', '2020-09-16 12:48:16', NULL, '61ef4f07-26f1-45f4-ad12-d3880ffe9698'),
(291, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:30:34', '2020-09-16 13:08:43', NULL, '6a1ab772-58a0-4212-a8b5-d65a94a3e83a'),
(292, NULL, 76, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-16 14:36:56', '2020-09-16 14:36:56', NULL, '8a493337-d2ea-4f11-84cb-a706c63ea923'),
(293, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:36:56', '2020-09-16 12:48:16', NULL, '3aac1f0f-99c2-434c-8825-d86806dd6060'),
(294, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:36:56', '2020-09-16 12:48:16', NULL, 'd4d8cd44-eaf2-4af5-abd3-792ba9517a5e'),
(295, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:36:56', '2020-09-16 12:48:16', NULL, '827fc003-805c-41f5-a817-7076416e59b2'),
(296, NULL, NULL, 14, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:36:56', '2020-09-16 12:48:16', NULL, '798a295f-a42c-4ebb-bdbb-61b680fec98b'),
(297, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-16 14:36:56', '2020-09-16 14:36:56', NULL, '4e722bef-58a4-4029-8c39-b564888e4784'),
(298, NULL, 77, 20, 'craft\\elements\\Entry', 1, 0, '2020-09-17 12:33:10', '2020-09-17 12:33:10', NULL, 'f6055ac2-61b5-4128-bd88-4ac405f10537'),
(299, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:33:11', '2020-09-16 14:12:50', NULL, '63a72df8-bc8b-45ab-9762-035171cbf70f'),
(300, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:33:11', '2020-09-16 14:12:51', NULL, 'f6070b28-0df0-40f1-a996-41901953f26b'),
(301, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:33:11', '2020-09-16 14:12:51', NULL, '2fc88313-b147-4a7c-bdcd-44bf8d114cac'),
(302, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:33:11', '2020-09-17 12:33:11', NULL, 'ee9450c0-1451-4495-9549-9bee34dbd6b9'),
(303, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:33:11', '2020-09-16 13:33:54', NULL, '63fb3ae3-e9ca-4dd2-acec-a7b747ebfce6'),
(304, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:33:11', '2020-09-16 13:33:54', NULL, '8ee5029e-cf42-48fd-8f91-c82df561fae8'),
(305, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:33:11', '2020-09-16 13:33:54', NULL, '436509c8-2bb3-4904-a232-8b69115a6423'),
(306, NULL, 78, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-17 12:36:05', '2020-09-17 12:36:05', NULL, '775283fb-7cd5-43db-85cc-619ddb592381'),
(307, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:36:05', '2020-09-17 12:36:05', NULL, '74c32156-7ccb-4889-a357-1e3da5590994'),
(308, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:36:05', '2020-09-15 10:25:22', NULL, '2504d5f5-ebbc-4ff8-99d9-64b8a43f1b86'),
(309, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:36:05', '2020-09-15 10:25:22', NULL, '9a220d02-f4a7-49bd-a9e2-196aae9ff6a8'),
(310, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:36:05', '2020-09-15 10:25:22', NULL, '24cce8dd-cebe-4d16-b0eb-22cf37cbdb89'),
(311, NULL, 79, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-17 12:36:36', '2020-09-17 12:36:36', NULL, '66597ed2-9067-480e-8b5c-5ffe50a6d5a7'),
(312, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:36:36', '2020-09-17 12:36:36', NULL, '3dc4e905-3413-4a9f-82d6-b7fe9a5f11be'),
(313, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:36:36', '2020-09-15 10:25:22', NULL, 'a4bb920f-b224-4842-83c1-d788f208e997'),
(314, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:36:36', '2020-09-15 10:25:22', NULL, 'e2190c38-c568-4c36-a7e9-5ff557b23689'),
(315, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:36:36', '2020-09-15 10:25:22', NULL, 'a84204d4-3ca6-4379-8dae-a28409c8d28e'),
(316, NULL, 80, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-17 12:37:55', '2020-09-17 12:37:55', NULL, '8fe41dc1-5f75-4f8d-a254-b92aa790bf0b'),
(317, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:37:55', '2020-09-17 12:37:55', NULL, 'dc049314-4426-49f1-b5dd-408c19cf0f28'),
(318, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:37:55', '2020-09-15 10:25:22', NULL, '4db9859c-25d1-4678-a40c-1fd3998260c7'),
(319, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:37:55', '2020-09-15 10:25:22', NULL, '23b26f15-b4ac-42be-9944-1bfd4d56ee49'),
(320, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:37:55', '2020-09-15 10:25:22', NULL, '29e4a56f-040e-4987-8e36-0b3ad5dcf3d8'),
(321, NULL, 81, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-17 12:38:33', '2020-09-17 12:38:33', NULL, '717e86d3-d786-470e-bb05-fdb21dc3f08d'),
(322, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:38:33', '2020-09-17 12:38:33', NULL, 'fc0e2812-171b-4dd2-ae58-fa361c155c28'),
(323, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:38:33', '2020-09-15 10:25:22', NULL, '3ad04ec9-a5e9-4b79-b5e3-64f852a20d4f'),
(324, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:38:33', '2020-09-15 10:25:22', NULL, 'e923ee87-dca4-43bc-8983-dd8d5b52fc7c'),
(325, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:38:33', '2020-09-15 10:25:22', NULL, '7c4b7262-7a95-45a7-94cb-8b1801f7a554'),
(326, NULL, 82, 20, 'craft\\elements\\Entry', 1, 0, '2020-09-17 12:38:57', '2020-09-17 12:38:57', NULL, '172425c3-6812-4e10-b683-6f72faed5c47'),
(327, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:38:57', '2020-09-16 14:12:50', NULL, 'bb13c0a9-bd78-4661-8425-ee248e8433e1'),
(328, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:38:57', '2020-09-16 14:12:51', NULL, '5f9b646d-771d-4c1e-a0f1-b157de4b4f8e'),
(329, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:38:57', '2020-09-16 14:12:51', NULL, '80db5c18-d89d-4685-831c-767009ec986e'),
(330, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:38:57', '2020-09-17 12:38:57', NULL, '87945367-3adc-4cac-b6c5-ddf60aa637f4'),
(331, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:38:57', '2020-09-16 13:33:54', NULL, '73e865e5-8625-480c-867e-61dbd323e858'),
(332, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:38:57', '2020-09-16 13:33:54', NULL, '7ac579dc-ab88-475f-ba2f-4d3b113e82cc'),
(333, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 12:38:57', '2020-09-16 13:33:54', NULL, 'b4a21317-6617-4d42-b757-f74ef6a39206'),
(334, NULL, NULL, 24, 'craft\\elements\\Entry', 1, 0, '2020-09-17 12:57:46', '2020-09-17 13:10:20', NULL, '30d51071-f92a-40ff-b707-82248f5c1abf');
INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(335, NULL, 83, 24, 'craft\\elements\\Entry', 1, 0, '2020-09-17 12:57:46', '2020-09-17 12:57:46', NULL, '1f2af850-022b-461e-bba7-32f513cb171e'),
(336, NULL, 84, 24, 'craft\\elements\\Entry', 1, 0, '2020-09-17 12:57:47', '2020-09-17 12:57:47', NULL, '1a890598-c3b2-4445-addb-83ec3862715f'),
(337, NULL, 85, 24, 'craft\\elements\\Entry', 1, 0, '2020-09-17 13:08:27', '2020-09-17 13:08:27', NULL, 'b77b2524-9d4b-4484-bdde-f203cf99b75f'),
(338, NULL, 86, 24, 'craft\\elements\\Entry', 1, 0, '2020-09-17 13:10:20', '2020-09-17 13:10:20', NULL, '93465e8e-a944-4430-b39e-ee8a66737b51'),
(339, NULL, NULL, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-17 13:19:08', '2020-09-17 13:19:08', NULL, '5766beed-1c08-407a-914d-522da83ed368'),
(340, NULL, 87, 13, 'craft\\elements\\Entry', 1, 0, '2020-09-17 13:19:08', '2020-09-17 13:19:08', NULL, '753e0242-5a7b-4bc5-924c-fb559c624724'),
(341, NULL, 88, 6, 'craft\\elements\\Entry', 1, 0, '2020-09-17 13:19:14', '2020-09-17 13:19:14', NULL, '8cf47b50-e4b7-4b33-a168-cfd4972749b4'),
(342, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 13:19:14', '2020-09-16 12:48:16', NULL, 'd7b03ec1-f84d-454f-86e8-725afc6ca8ab'),
(343, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 13:19:14', '2020-09-16 12:48:16', NULL, '1582fbec-fa92-4016-b543-98162453742f'),
(344, NULL, NULL, 12, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 13:19:14', '2020-09-16 12:48:16', NULL, 'a9b387cd-4999-459e-a668-be68feda033d'),
(345, NULL, NULL, 14, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 13:19:14', '2020-09-17 13:19:14', NULL, 'ccc00dfc-c742-41a4-992d-cf418d3c261f'),
(346, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 13:19:14', '2020-09-16 14:36:56', NULL, '842b6a97-691d-4a4d-8736-e364fc779923'),
(347, NULL, 89, 5, 'craft\\elements\\Entry', 1, 0, '2020-09-17 13:22:18', '2020-09-17 13:22:18', NULL, 'dc505eff-9735-4cae-9075-be412ef33a48'),
(348, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 13:22:18', '2020-09-17 12:38:33', NULL, 'b0a73360-d310-4e92-93ba-2891cc5f522f'),
(349, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 13:22:18', '2020-09-15 10:25:22', NULL, 'cb851100-a6e6-4089-9792-6852fa72ae50'),
(350, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 13:22:18', '2020-09-15 10:25:22', NULL, '0c3dd90f-52e0-4eae-a614-f992a7b7c598'),
(351, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2020-09-17 13:22:18', '2020-09-15 10:25:22', NULL, '35df00be-33a3-4cc4-bb72-a9601dd21c92');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2020-09-14 08:05:25', '2020-09-14 08:05:25', '65bf238d-f96e-4737-b705-1111978b3fba'),
(2, 2, 1, 'header-topics', 'navigation-topics/header-topics', 1, '2020-09-14 09:33:04', '2020-09-14 09:33:05', 'e6df281d-b03b-4c1d-9051-53f7887d1828'),
(3, 3, 1, NULL, NULL, 1, '2020-09-14 09:33:05', '2020-09-14 09:33:05', '3ff37027-5806-4b60-9f39-0459b202f574'),
(4, 4, 1, NULL, NULL, 1, '2020-09-14 09:33:05', '2020-09-14 09:33:05', 'a0ca4233-88ce-433f-9a9a-6a8e5bb6ac6d'),
(5, 5, 1, NULL, NULL, 1, '2020-09-14 09:33:05', '2020-09-14 09:33:05', '8b9f3db8-e28c-43bc-a999-c965b21d4231'),
(6, 6, 1, NULL, NULL, 1, '2020-09-14 09:33:05', '2020-09-14 09:33:05', 'd41f9736-7bb3-4c45-b311-19b1cfb0d0d9'),
(7, 7, 1, 'about-rm-schools', 'navigation-topics/about-rm-schools', 1, '2020-09-14 09:35:42', '2020-09-14 09:35:43', 'c2567f99-ca1d-47c2-be80-5dea855dd2bc'),
(8, 8, 1, NULL, NULL, 1, '2020-09-14 09:35:42', '2020-09-14 09:35:42', '6a225a9b-9869-4a1a-a99e-c378da50401d'),
(9, 9, 1, NULL, NULL, 1, '2020-09-14 09:35:42', '2020-09-14 09:35:42', '81b71c6a-e1cc-43b6-8ab3-3abdb67cec45'),
(10, 10, 1, NULL, NULL, 1, '2020-09-14 09:35:42', '2020-09-14 09:35:42', 'd0fdab27-b0cd-4865-8c87-a5add1e2c0fa'),
(11, 11, 1, 'navbar', NULL, 1, '2020-09-14 12:18:15', '2020-09-14 12:18:15', '5733aaa2-70dc-4518-a566-19ec62497fd0'),
(12, 12, 1, 'navbar', NULL, 1, '2020-09-14 12:18:15', '2020-09-14 12:18:15', '2f46253d-4dd2-4393-992d-9736bd579cc2'),
(13, 13, 1, 'navbar', NULL, 1, '2020-09-14 12:19:14', '2020-09-14 12:19:14', '049c0fab-8504-4335-b8d1-02b516e9b413'),
(14, 14, 1, NULL, NULL, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '3cff77df-d9a5-4af3-97e1-ca1b5aa67cc2'),
(15, 15, 1, NULL, NULL, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '515f2793-f09d-4901-a87a-d501eb05e31d'),
(16, 16, 1, NULL, NULL, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', 'e1f342ef-2065-4c91-bd28-10d4258d051d'),
(17, 17, 1, NULL, NULL, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '6f73e243-8e9f-48cc-baf9-fe93a64b84c9'),
(18, 18, 1, 'navbar', NULL, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '94e02123-898f-4d14-b362-39c19c545cfb'),
(19, 19, 1, NULL, NULL, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '09651596-b234-4907-b6fd-493c0a5fca23'),
(20, 20, 1, NULL, NULL, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', 'ff40b00e-abad-4bab-a20a-d1709d0e0c2b'),
(21, 21, 1, NULL, NULL, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', 'cb2d1dc0-bb27-4348-8256-2a4423bd8b94'),
(22, 22, 1, NULL, NULL, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', 'fcd658d0-7335-41bb-bacf-fdcc3434f4b2'),
(23, 23, 1, 'navbar', NULL, 1, '2020-09-14 12:22:15', '2020-09-14 12:22:15', 'f01bd067-4bfa-425e-8cad-8e983400ed8d'),
(24, 24, 1, NULL, NULL, 1, '2020-09-14 12:22:15', '2020-09-14 12:22:15', '804e5b7c-cd62-4c97-9689-27bded75ab81'),
(25, 25, 1, NULL, NULL, 1, '2020-09-14 12:22:15', '2020-09-14 12:22:15', '4e9da99f-025e-4fba-87c2-9900b0ba197c'),
(26, 26, 1, NULL, NULL, 1, '2020-09-14 12:22:15', '2020-09-14 12:22:15', 'e3b8c72c-05ca-44e8-b681-ff4477391275'),
(27, 27, 1, NULL, NULL, 1, '2020-09-14 12:22:15', '2020-09-14 12:22:15', 'dde53de4-16c2-4428-ad32-aa70bbf793e2'),
(28, 28, 1, 'navbar', NULL, 1, '2020-09-14 12:26:53', '2020-09-14 12:26:53', '01f355c0-416d-4999-8968-ec094fbdd392'),
(29, 29, 1, NULL, NULL, 1, '2020-09-14 12:26:53', '2020-09-14 12:26:53', 'e99c0d5b-55be-4160-8ae5-be506b0e240a'),
(30, 30, 1, NULL, NULL, 1, '2020-09-14 12:26:53', '2020-09-14 12:26:53', '5cf22f55-0b07-43d9-b194-083bc71c4458'),
(31, 31, 1, NULL, NULL, 1, '2020-09-14 12:26:53', '2020-09-14 12:26:53', '9a2c2fe6-49b2-4da6-b143-252c9add048a'),
(32, 32, 1, NULL, NULL, 1, '2020-09-14 12:26:53', '2020-09-14 12:26:53', '2509c304-72af-47b5-8f87-4a09c6f7e713'),
(33, 33, 1, 'navbar', NULL, 1, '2020-09-14 12:27:09', '2020-09-14 12:27:09', '33452179-4add-4686-8a98-d86e8ac6113f'),
(34, 34, 1, NULL, NULL, 1, '2020-09-14 12:27:09', '2020-09-14 12:27:09', '329667de-5c80-4438-acd8-efb9c883e81b'),
(35, 35, 1, NULL, NULL, 1, '2020-09-14 12:27:09', '2020-09-14 12:27:09', 'd4214ca5-ef81-4aa6-9543-250d03a1120c'),
(36, 36, 1, NULL, NULL, 1, '2020-09-14 12:27:09', '2020-09-14 12:27:09', '2a2fab00-4c53-4557-ac0b-50c7b5b6ab43'),
(37, 37, 1, NULL, NULL, 1, '2020-09-14 12:27:09', '2020-09-14 12:27:09', '523bff0f-955b-4506-a77d-e5462ab89753'),
(38, 38, 1, NULL, NULL, 1, '2020-09-14 12:28:59', '2020-09-14 12:28:59', '811bfd61-4c0d-4980-9918-8dae2af26160'),
(39, 39, 1, NULL, NULL, 1, '2020-09-14 12:28:59', '2020-09-14 12:28:59', '9f240993-7cd7-4e09-82b6-e974162224cf'),
(40, 40, 1, 'navbar', NULL, 1, '2020-09-14 12:29:21', '2020-09-14 12:29:21', 'f18e755b-d508-4418-8b0e-aebf4a6772ea'),
(41, 41, 1, NULL, NULL, 1, '2020-09-14 12:29:21', '2020-09-14 12:29:21', '7e83f5d7-e7b1-4630-b056-8355f3c4f1f7'),
(42, 42, 1, NULL, NULL, 1, '2020-09-14 12:29:22', '2020-09-14 12:29:22', 'ba185fe1-2502-46a1-abf8-e3b2820ff93a'),
(43, 43, 1, NULL, NULL, 1, '2020-09-14 12:29:22', '2020-09-14 12:29:22', '75254705-f3c4-4d40-8531-d0c94d4138c6'),
(44, 44, 1, NULL, NULL, 1, '2020-09-14 12:29:22', '2020-09-14 12:29:22', '95c625dd-e768-4dd1-a26a-eb1ed0ed3507'),
(45, 45, 1, 'navbar', NULL, 1, '2020-09-14 12:34:38', '2020-09-14 12:34:38', 'bf33d63a-d8cc-4bc2-bdc8-9d076218b61a'),
(46, 46, 1, NULL, NULL, 1, '2020-09-14 12:34:38', '2020-09-14 12:34:38', 'cc072131-704b-4608-af70-d1590b995e11'),
(47, 47, 1, NULL, NULL, 1, '2020-09-14 12:34:38', '2020-09-14 12:34:38', 'f453db6c-6993-4b57-a127-5ef075705684'),
(48, 48, 1, NULL, NULL, 1, '2020-09-14 12:34:38', '2020-09-14 12:34:38', '3896fc43-18f6-493a-9ccd-a6a3533c475c'),
(49, 49, 1, NULL, NULL, 1, '2020-09-14 12:34:38', '2020-09-14 12:34:38', '533b9de1-06ea-422e-9d8c-bbf904eb9126'),
(50, 50, 1, 'navbar', NULL, 1, '2020-09-14 12:40:48', '2020-09-14 12:40:48', 'c268f46d-c522-4147-bef2-5febd1e1d2b4'),
(51, 51, 1, NULL, NULL, 1, '2020-09-14 12:40:48', '2020-09-14 12:40:48', '85729746-8fcc-49d3-b2e5-f3aaa72e635d'),
(52, 52, 1, NULL, NULL, 1, '2020-09-14 12:40:48', '2020-09-14 12:40:48', 'ec5ac820-0bd6-426d-abfb-b599b6f1d1f1'),
(53, 53, 1, NULL, NULL, 1, '2020-09-14 12:40:48', '2020-09-14 12:40:48', 'b2cbb1a3-824b-4bb3-9228-62844cf9aeb7'),
(54, 54, 1, NULL, NULL, 1, '2020-09-14 12:40:48', '2020-09-14 12:40:48', '6d70acb2-af19-451e-a5af-7c5ce1c1bbb6'),
(55, 55, 1, 'navbar', NULL, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', '0a66acfa-f9ba-4c32-98a6-40bc630d4651'),
(56, 56, 1, NULL, NULL, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', '25472585-b1c5-42d2-b797-d8dbf352846b'),
(57, 57, 1, NULL, NULL, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', 'aacff8e8-8d39-4c6a-9451-810a93f191a8'),
(58, 58, 1, NULL, NULL, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', '7b4fb7b5-85b8-4807-9281-f03b353674fe'),
(59, 59, 1, NULL, NULL, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', 'eb8022ed-06c3-4665-b524-962a87cfb0df'),
(60, 60, 1, 'navbar', NULL, 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', '5ab75380-ec3b-4c4b-b817-09cc79b1e87b'),
(61, 61, 1, NULL, NULL, 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', 'a13ae1fe-02cf-441f-9c5c-369f811e7b3c'),
(62, 62, 1, NULL, NULL, 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', 'fb083415-eeb5-43ab-a740-24b1ec91902b'),
(63, 63, 1, NULL, NULL, 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', 'f9f3d8ee-daaa-4cbc-bd82-c3f3da081d02'),
(64, 64, 1, NULL, NULL, 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', 'eab22916-01dd-4742-83fd-96d9cad05c66'),
(65, 65, 1, 'navbar', NULL, 1, '2020-09-14 12:41:48', '2020-09-14 12:41:48', '18b92ba3-5d10-4f74-949d-c6e14843f898'),
(66, 66, 1, NULL, NULL, 1, '2020-09-14 12:41:48', '2020-09-14 12:41:48', '740aceb8-5683-4a2e-9f12-d8c726c24427'),
(67, 67, 1, NULL, NULL, 1, '2020-09-14 12:41:48', '2020-09-14 12:41:48', 'e8857496-0a88-44d9-a98e-9846398d4ce8'),
(68, 68, 1, NULL, NULL, 1, '2020-09-14 12:41:49', '2020-09-14 12:41:49', 'ba1e73a4-7762-499b-af7d-6488cf7c79f3'),
(69, 69, 1, NULL, NULL, 1, '2020-09-14 12:41:49', '2020-09-14 12:41:49', 'e3200c0b-2fc8-4289-b7d7-3cdb396cad5f'),
(70, 70, 1, 'homepage', '__home__', 1, '2020-09-14 13:11:26', '2020-09-15 13:44:55', 'a38297f5-b212-48c0-93b1-92deb8711ff0'),
(71, 71, 1, 'homepage', 'homepage', 1, '2020-09-14 13:11:26', '2020-09-14 13:11:26', '71bff4d6-9617-40f2-a3c1-76f221a7ca74'),
(72, 72, 1, NULL, NULL, 1, '2020-09-14 13:29:59', '2020-09-14 13:29:59', 'ffefdfaa-909c-4157-bbe8-9ddcc349646e'),
(73, 73, 1, 'homepage', 'homepage', 1, '2020-09-14 13:48:02', '2020-09-14 13:48:02', '2b660019-f2b1-4d9d-a004-f73d63742dc0'),
(74, 74, 1, 'dfcsd', 'students-in-action/dfcsd', 1, '2020-09-14 13:50:05', '2020-09-14 13:50:05', '74e46528-4c0c-45e7-be44-ac167dee5832'),
(75, 75, 1, 'dfcsd', 'students-in-action/dfcsd', 1, '2020-09-14 13:50:05', '2020-09-14 13:50:05', '0197caed-da6e-4515-9776-2bf3d92c5e79'),
(76, 76, 1, 'vsd', 'students-in-action/vsd', 1, '2020-09-14 13:50:13', '2020-09-14 13:50:13', 'a850bdae-daa8-4a60-8496-63eaaeb2a316'),
(77, 77, 1, 'vsd', 'students-in-action/vsd', 1, '2020-09-14 13:50:13', '2020-09-14 13:50:13', '3118844c-5c08-4a6e-959b-66b275eba95b'),
(78, 78, 1, 'vdf', 'event/vdf', 1, '2020-09-14 13:51:45', '2020-09-14 13:51:45', 'ed1d7554-e9f2-4801-bb33-985996cad964'),
(79, 79, 1, 'vdf', 'event/vdf', 1, '2020-09-14 13:51:45', '2020-09-14 13:51:45', 'f625e3ab-e935-4e26-aa88-9556631ed3e6'),
(80, 80, 1, 'fdgf', 'event/fdgf', 1, '2020-09-14 13:51:48', '2020-09-14 13:51:48', '17a1a1c5-a6e8-4de9-ae0f-d8fa75c2a738'),
(81, 81, 1, 'fdgf', 'event/fdgf', 1, '2020-09-14 13:51:48', '2020-09-14 13:51:48', 'e7642432-006a-4d10-a9f2-2f0560d03423'),
(82, 82, 1, NULL, NULL, 1, '2020-09-14 14:12:07', '2020-09-14 14:12:07', '9b55f137-a385-41ed-ae68-a28b6b06ff30'),
(83, 83, 1, 'homepage', 'homepage', 1, '2020-09-14 14:12:07', '2020-09-14 14:12:07', '6d71331b-24aa-4dda-b532-e04daa0459de'),
(84, 84, 1, NULL, NULL, 1, '2020-09-14 14:12:07', '2020-09-14 14:12:07', 'f1a01520-89e6-45ba-96e8-60919c783817'),
(85, 85, 1, NULL, NULL, 1, '2020-09-14 14:14:07', '2020-09-14 14:14:07', 'afadec17-4306-49d4-9482-45f9f2fe0404'),
(86, 86, 1, NULL, NULL, 1, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '942d4e81-6ac3-4ed8-99bb-519e62346285'),
(87, 87, 1, 'homepage', 'homepage', 1, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '41106580-0114-415b-9501-a235c12d0ce9'),
(88, 88, 1, NULL, NULL, 1, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '1116ab84-c05a-48cf-aaf6-05221cf8a644'),
(89, 89, 1, NULL, NULL, 1, '2020-09-14 14:14:07', '2020-09-14 14:14:07', 'a3b9917e-dd02-4b97-92a1-bec32ef785f5'),
(90, 90, 1, NULL, NULL, 1, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '50130933-279f-43d7-b09e-f785b61b9ffb'),
(91, 91, 1, 'rawmatters-ambassadors-at-schools1', 'slider/rawmatters-ambassadors-at-schools1', 1, '2020-09-14 14:40:42', '2020-09-14 14:40:42', '2c4bc025-2d68-4c72-b225-6f1ae7290741'),
(92, 92, 1, 'rawmatters-ambassadors-at-schools1', 'slider/rawmatters-ambassadors-at-schools1', 1, '2020-09-14 14:40:42', '2020-09-14 14:40:42', '290cc093-11cd-409b-8b48-e8f182616fa3'),
(93, 93, 1, 'rawmatters-ambassadors-at-schools-2', 'slider/rawmatters-ambassadors-at-schools-2', 1, '2020-09-14 14:41:18', '2020-09-14 14:41:18', '19aafeb2-ada6-482a-92cb-b95dedc49932'),
(94, 94, 1, 'rawmatters-ambassadors-at-schools-2', 'slider/rawmatters-ambassadors-at-schools-2', 1, '2020-09-14 14:41:18', '2020-09-14 14:41:18', 'cd6dca78-04e0-4feb-97d9-b0e5fecfc6e3'),
(95, 95, 1, 'rawmatters-ambassadors-at-schools-3', 'slider/rawmatters-ambassadors-at-schools-3', 1, '2020-09-14 14:41:54', '2020-09-14 14:41:54', 'd27c398a-f574-4c25-b3ef-11f69f552f05'),
(96, 96, 1, 'rawmatters-ambassadors-at-schools-3', 'slider/rawmatters-ambassadors-at-schools-3', 1, '2020-09-14 14:41:54', '2020-09-14 14:41:54', '076dfc4a-e227-403f-aeee-65c67c031356'),
(97, 97, 1, 'homepage', 'homepage', 1, '2020-09-14 14:42:18', '2020-09-14 14:42:18', 'e2ace0bc-bd9e-4365-8501-212219218fc7'),
(98, 98, 1, NULL, NULL, 1, '2020-09-14 14:42:18', '2020-09-14 14:42:18', '1a7611e2-d906-49e6-84d7-3a003b59b305'),
(99, 99, 1, 'homepage', 'homepage', 1, '2020-09-15 07:37:55', '2020-09-15 07:37:55', 'e4b6b565-e972-4be3-b110-fb474174148c'),
(100, 100, 1, NULL, NULL, 1, '2020-09-15 07:37:55', '2020-09-15 07:37:55', 'b2a53640-9c0f-4b39-a640-5b84dd9c7252'),
(101, 101, 1, NULL, NULL, 1, '2020-09-15 07:38:22', '2020-09-15 07:38:22', '235469af-c571-4c68-838a-82cd970f41d7'),
(102, 102, 1, 'homepage', 'homepage', 1, '2020-09-15 07:38:22', '2020-09-15 07:38:22', 'f9eb6c38-316c-4881-8796-53da947e37df'),
(103, 103, 1, NULL, NULL, 1, '2020-09-15 07:38:22', '2020-09-15 07:38:22', '89f074d5-940a-470a-8433-644eee30817c'),
(104, 104, 1, NULL, NULL, 1, '2020-09-15 07:38:22', '2020-09-15 07:38:22', '627e0751-489c-4d07-a259-d9bb0db7c07a'),
(105, 105, 1, 'rawmatters-ambassadors-at-schools-1', 'hero/rawmatters-ambassadors-at-schools-1', 1, '2020-09-15 08:09:01', '2020-09-15 08:09:01', 'cd6d0d5e-e7b8-41c0-bbfd-327283f66360'),
(106, 106, 1, 'rawmatters-ambassadors-at-schools-1', 'hero/rawmatters-ambassadors-at-schools-1', 1, '2020-09-15 08:09:01', '2020-09-15 08:09:01', '5ef0a462-cddc-4d18-9f4d-7aead9cc543f'),
(107, 107, 1, 'rawmatters-ambassadors-at-schools-2', 'hero/rawmatters-ambassadors-at-schools-2', 1, '2020-09-15 08:09:06', '2020-09-15 08:09:06', '2b8b043a-3bb5-4f3e-95ef-7baeed68e7bf'),
(108, 108, 1, 'rawmatters-ambassadors-at-schools-2', 'hero/rawmatters-ambassadors-at-schools-2', 1, '2020-09-15 08:09:06', '2020-09-15 08:09:06', 'dbc93e38-37c3-4758-a6df-c0fe6839a7f2'),
(109, 109, 1, 'rawmatters-ambassadors-at-schools-3', 'hero/rawmatters-ambassadors-at-schools-3', 1, '2020-09-15 08:09:11', '2020-09-15 08:09:11', '300339bc-259c-4a91-8908-97bbc54f425f'),
(110, 110, 1, 'rawmatters-ambassadors-at-schools-3', 'hero/rawmatters-ambassadors-at-schools-3', 1, '2020-09-15 08:09:11', '2020-09-15 08:09:11', 'aa82afb7-fc9e-4e07-b442-12a1cd161ad3'),
(111, 111, 1, 'homepage', 'homepage', 1, '2020-09-15 08:09:22', '2020-09-15 08:09:22', '76639f34-6126-4a36-a0ec-1e094f1bd9f6'),
(112, 112, 1, NULL, NULL, 1, '2020-09-15 08:09:22', '2020-09-15 08:09:22', '4b433560-9e52-49c3-b308-ad90dae1f235'),
(113, 113, 1, 'navbar', NULL, 1, '2020-09-15 10:25:22', '2020-09-15 10:25:22', 'c7ebff64-2777-4cd1-b098-11d25ea25c3b'),
(114, 114, 1, NULL, NULL, 1, '2020-09-15 10:25:22', '2020-09-15 10:25:22', 'bf947d21-87b1-457e-a39c-b96c6a053e4c'),
(115, 115, 1, NULL, NULL, 1, '2020-09-15 10:25:22', '2020-09-15 10:25:22', 'ede30e17-8408-41de-a1c5-473a48a67382'),
(116, 116, 1, NULL, NULL, 1, '2020-09-15 10:25:22', '2020-09-15 10:25:22', '7a5d9359-0177-4765-8c54-d6243ce7d9b2'),
(117, 117, 1, NULL, NULL, 1, '2020-09-15 10:25:22', '2020-09-15 10:25:22', '778d2866-6b24-4b86-a350-2107a3e13d05'),
(118, 118, 1, NULL, NULL, 1, '2020-09-15 12:11:41', '2020-09-15 12:11:41', 'd01225a6-396e-42b3-aebe-54fb59636860'),
(119, 119, 1, NULL, NULL, 1, '2020-09-15 12:12:02', '2020-09-15 12:12:02', '9d673205-bec3-4a99-9127-98b9561f1c1c'),
(120, 120, 1, 'homepage', 'homepage', 1, '2020-09-15 12:12:02', '2020-09-15 12:12:02', '2eb28642-41d8-478b-a699-9cb22673f1f8'),
(121, 121, 1, NULL, NULL, 1, '2020-09-15 12:12:02', '2020-09-15 12:12:02', '1ccb95e5-1d7d-4c82-8e17-1715ab36f26d'),
(122, 122, 1, NULL, NULL, 1, '2020-09-15 12:12:02', '2020-09-15 12:12:02', '2d6559e1-5a30-4dcf-a54b-5f334af33d12'),
(123, 123, 1, NULL, NULL, 1, '2020-09-15 13:01:43', '2020-09-15 13:01:43', 'cd645bfb-37fe-4d60-9193-0c3729eb59f2'),
(124, 124, 1, 'actions-in-eu', 'students-in-action/actions-in-eu', 1, '2020-09-15 13:02:49', '2020-09-15 13:02:49', '10960d50-57c5-459d-8b2d-65f590667643'),
(125, 125, 1, 'actions-in-eu', 'students-in-action/actions-in-eu', 1, '2020-09-15 13:02:49', '2020-09-15 13:02:49', 'cb7213b9-5585-4ba1-a06d-1598d0b70ee9'),
(126, 126, 1, 'study-visits-in-companies', 'students-in-action/study-visits-in-companies', 1, '2020-09-15 13:03:05', '2020-09-15 13:03:05', 'cda3aa68-a646-46db-bbba-58e62eb588d2'),
(127, 127, 1, 'study-visits-in-companies', 'students-in-action/study-visits-in-companies', 1, '2020-09-15 13:03:05', '2020-09-15 13:03:05', '326df0b4-1701-466f-8090-0c3d01b055ba'),
(128, 128, 1, 'poster-presentation', 'students-in-action/poster-presentation', 1, '2020-09-15 13:03:23', '2020-09-15 13:03:23', '6110a8bd-85be-4617-b882-c1df633de527'),
(129, 129, 1, 'poster-presentation', 'students-in-action/poster-presentation', 1, '2020-09-15 13:03:23', '2020-09-15 13:03:23', 'af64b33e-0898-42e0-86ec-774b44bcda50'),
(130, 130, 1, 'topic-4', 'students-in-action/topic-4', 1, '2020-09-15 13:03:48', '2020-09-15 13:03:48', 'cc9284d8-f594-48a1-b978-0652f06ef50f'),
(131, 131, 1, 'topic-4', 'students-in-action/topic-4', 1, '2020-09-15 13:03:48', '2020-09-15 13:03:48', 'ec6f3eee-2dba-495a-aea4-534eaa7fd972'),
(132, 132, 1, NULL, NULL, 1, '2020-09-15 13:03:53', '2020-09-15 13:03:53', 'badccdef-6c8c-4ccc-8361-c14ed83a5b96'),
(133, 133, 1, 'homepage', 'homepage', 1, '2020-09-15 13:03:53', '2020-09-15 13:03:53', 'bb8b3b96-a45f-4892-b3e0-2cddab72752a'),
(134, 134, 1, NULL, NULL, 1, '2020-09-15 13:03:53', '2020-09-15 13:03:53', 'e05e2f04-ef18-4869-bf65-68ac47abf3f2'),
(135, 135, 1, NULL, NULL, 1, '2020-09-15 13:03:53', '2020-09-15 13:03:53', 'ae3c76eb-c068-4bec-9b24-99c96420ff5a'),
(136, 136, 1, NULL, NULL, 1, '2020-09-15 13:03:53', '2020-09-15 13:03:53', 'a10d8cc1-f7d5-469c-92fa-a9a887caaed1'),
(137, 137, 1, 'poster-presentation', 'students-in-action/poster-presentation', 1, '2020-09-15 13:12:32', '2020-09-15 13:12:32', 'd6834c76-841a-495e-96d1-484b2c99397c'),
(138, 138, 1, 'homepage', 'homepage', 1, '2020-09-15 13:12:36', '2020-09-15 13:12:36', '36b676ac-df77-4747-ae49-42835c934532'),
(139, 139, 1, NULL, NULL, 1, '2020-09-15 13:12:36', '2020-09-15 13:12:36', 'd7161799-5653-420a-a0f2-3ee20d1c72d1'),
(140, 140, 1, NULL, NULL, 1, '2020-09-15 13:12:36', '2020-09-15 13:12:36', '13c105c1-40ff-4dcd-b168-5b7a4a2a6657'),
(141, 141, 1, NULL, NULL, 1, '2020-09-15 13:12:36', '2020-09-15 13:12:36', 'b42a122b-0c02-4894-92eb-685265d55df2'),
(142, 142, 1, NULL, NULL, 1, '2020-09-15 13:30:41', '2020-09-15 13:30:41', 'c6006713-cf48-4ff8-815a-d3259375480a'),
(143, 143, 1, NULL, NULL, 1, '2020-09-15 13:30:42', '2020-09-15 13:30:42', '9661c489-88e2-4c1a-b539-09f42ecb7005'),
(144, 144, 1, NULL, NULL, 1, '2020-09-15 13:30:42', '2020-09-15 13:30:42', '6189fbe6-4802-487b-b83d-8d78bed48d43'),
(145, 145, 1, 'rawmatters-ambassadors-at-schools-1', 'hero/rawmatters-ambassadors-at-schools-1', 1, '2020-09-15 13:31:38', '2020-09-15 13:31:38', 'c340e24a-7ad6-4b45-b881-cf8f7ef0b065'),
(146, 146, 1, 'rawmatters-ambassadors-at-schools-2', 'hero/rawmatters-ambassadors-at-schools-2', 1, '2020-09-15 13:31:52', '2020-09-15 13:31:52', '6f25304f-00d3-4228-885f-0a8ce01004e5'),
(147, 147, 1, 'rawmatters-ambassadors-at-schools-3', 'hero/rawmatters-ambassadors-at-schools-3', 1, '2020-09-15 13:32:01', '2020-09-15 13:32:01', 'f669c565-a0f4-4893-aa8a-36b4de0760e5'),
(148, 148, 1, 'rawmatters-ambassadors-at-schools-2', 'hero/rawmatters-ambassadors-at-schools-2', 1, '2020-09-15 13:32:07', '2020-09-15 13:32:07', '38df6067-abc7-43fd-8ce6-37ef0b97327f'),
(149, 149, 1, 'homepage', 'homepage', 1, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '89578556-86b7-4c56-937e-92b4c58b977c'),
(150, 150, 1, NULL, NULL, 1, '2020-09-15 13:32:08', '2020-09-15 13:32:08', 'b8edd448-9cbe-4134-8cc6-aa815eb29215'),
(151, 151, 1, NULL, NULL, 1, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '808b4b64-8666-46ab-87aa-6ab934d7047f'),
(152, 152, 1, NULL, NULL, 1, '2020-09-15 13:32:08', '2020-09-15 13:32:08', 'b66ba2c7-90b7-4821-9e19-c10ec7a5d59d'),
(153, 153, 1, 'homepage', '__home__', 1, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '537657ec-0aec-4472-84e0-3034d161b9af'),
(154, 154, 1, NULL, NULL, 1, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '5bdfaec0-bb0e-4c28-8898-5599acda7865'),
(155, 155, 1, NULL, NULL, 1, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '4237b1ef-fb12-421e-a44c-6598558890a7'),
(156, 156, 1, NULL, NULL, 1, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '2a8b5bb1-9a93-40e2-a6b2-f69544dbb6ba'),
(157, 157, 1, NULL, NULL, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', 'c20900a8-0f99-4948-9081-6aa0de192f08'),
(158, 158, 1, 'homepage', '__home__', 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', 'c14509c7-31f3-425d-8124-064bd12ffb0b'),
(159, 159, 1, NULL, NULL, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '3e56240c-758b-40e3-98db-d15c58b3ba3e'),
(160, 160, 1, NULL, NULL, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', 'feaff504-bb7d-4117-b5ab-1f38eedb8309'),
(161, 161, 1, NULL, NULL, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '09bb41ea-8899-4fd7-b4c5-a9f3fd5d4ef0'),
(162, 162, 1, NULL, NULL, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '4377874b-6e7f-46e6-ad03-86a5f72b073e'),
(163, 163, 1, 'homepage', '__home__', 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '9819c23f-67d1-4a5f-beaa-bf8606d9ca04'),
(164, 164, 1, NULL, NULL, 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '795d31ec-eb08-4e2b-8b7b-3548fd5f9930'),
(165, 165, 1, NULL, NULL, 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '52d3a81f-0b33-4670-9772-d03b6c8425bc'),
(166, 166, 1, NULL, NULL, 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '87cca89d-e117-440c-b13a-b8cb24bc963a'),
(167, 167, 1, NULL, NULL, 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', 'f35b64e4-dd69-4cda-a8c9-b052fa20d18d'),
(168, 168, 1, 'homepage', '__home__', 1, '2020-09-15 14:13:14', '2020-09-15 14:13:14', '6672e5a8-bf47-4c45-8d76-a0d073f4b140'),
(169, 169, 1, NULL, NULL, 1, '2020-09-15 14:13:14', '2020-09-15 14:13:14', 'e3031f91-d6b4-4d90-a4bf-449aea41eb85'),
(170, 170, 1, NULL, NULL, 1, '2020-09-15 14:13:14', '2020-09-15 14:13:14', '5b06e5db-cade-458f-bcc6-71533bb4f620'),
(171, 171, 1, NULL, NULL, 1, '2020-09-15 14:13:14', '2020-09-15 14:13:14', '757e33ef-1055-44b4-a654-6615e50393fd'),
(172, 172, 1, 'the-future-of-education', 'event/the-future-of-education', 1, '2020-09-16 07:34:25', '2020-09-16 07:34:25', '5a0ed323-4424-44a1-8928-c96360c28456'),
(173, 173, 1, 'the-future-of-education', 'event/the-future-of-education', 1, '2020-09-16 07:34:25', '2020-09-16 07:34:25', '8f51ae19-b9f8-4356-8e77-3a265dccd62a'),
(174, 174, 1, 'raw-materials-and-sustainability', 'event/raw-materials-and-sustainability', 1, '2020-09-16 07:35:16', '2020-09-16 07:35:16', '9ec4e334-da0d-429f-9e47-c9fb784561a5'),
(175, 175, 1, 'raw-materials-and-sustainability', 'event/raw-materials-and-sustainability', 1, '2020-09-16 07:35:16', '2020-09-16 07:35:16', '10a7326b-c92d-437f-990b-6f5adba868a4'),
(176, 176, 1, 'raw-materials-and-sustainability', 'event/raw-materials-and-sustainability', 1, '2020-09-16 07:35:25', '2020-09-16 07:35:25', 'f2fd16bb-985c-4723-84cb-4f480eec67aa'),
(177, 177, 1, 'all-in-music', 'event/all-in-music', 1, '2020-09-16 07:36:00', '2020-09-16 07:36:00', 'ce318254-80b4-4e95-9170-936bc2e51e39'),
(178, 178, 1, 'all-in-music', 'event/all-in-music', 1, '2020-09-16 07:36:00', '2020-09-16 07:36:00', '0be4c7ea-b0ca-4b2e-b0a8-d254c824dc37'),
(179, 179, 1, NULL, NULL, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'e989deaf-04a7-4945-9325-454d98b5de25'),
(180, 180, 1, 'homepage', '__home__', 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '063bff6e-d4ba-417c-9ae4-6299abbb5e0d'),
(181, 181, 1, NULL, NULL, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'a969a178-4e45-4761-ad27-ee27c7d1cd33'),
(182, 182, 1, NULL, NULL, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '603d771b-c523-49e9-ab56-ed9c7faa4f5e'),
(183, 183, 1, NULL, NULL, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '9a5f0cc3-d220-481a-b184-61eee45ccaba'),
(184, 184, 1, NULL, NULL, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '5c8b5bd6-d879-4005-afd4-3a3ab2f7618c'),
(185, 185, 1, 'new-event', 'event/new-event', 1, '2020-09-16 08:38:45', '2020-09-16 08:38:45', 'a7335170-db6a-41b9-a88d-2ae7ec7901ef'),
(186, 186, 1, 'new-event', 'event/new-event', 1, '2020-09-16 08:38:45', '2020-09-16 08:38:45', 'ee832ea0-a0c8-4c2e-aa12-835b795bf50b'),
(187, 187, 1, 'homepage', '__home__', 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '053c5e73-98aa-4ea9-9c71-dd15287bd5fa'),
(188, 188, 1, NULL, NULL, 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', 'e492b28b-97f6-4608-9dae-57d1a3e87538'),
(189, 189, 1, NULL, NULL, 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', 'daf3dda5-f90d-4273-9057-3765d7f70d98'),
(190, 190, 1, NULL, NULL, 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '25db1d68-8932-4533-bafd-cf5ec9ded237'),
(191, 191, 1, NULL, NULL, 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '5a0a13c6-44ab-4f62-83bb-dfaf1e4273b1'),
(192, 192, 1, 'newer-event', 'event/newer-event', 1, '2020-09-16 10:01:57', '2020-09-16 10:01:57', '0f075991-3ae3-4a33-9916-44e5c2949041'),
(193, 193, 1, 'newer-event', 'event/newer-event', 1, '2020-09-16 10:01:57', '2020-09-16 10:01:57', '69a48d5b-03a8-441f-92b2-aa7c12595854'),
(194, 194, 1, 'next-year', 'event/next-year', 1, '2020-09-16 10:02:16', '2020-09-16 10:02:16', '69062c2a-5954-4e03-a790-19e8842a45ca'),
(195, 195, 1, 'next-year', 'event/next-year', 1, '2020-09-16 10:02:16', '2020-09-16 10:02:16', 'e613e6bf-41c7-4fb9-a9d3-809f2c5f6343'),
(196, 196, 1, 'homepage', '__home__', 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '3239ab29-82c1-4c78-b1cf-a1e97c575676'),
(197, 197, 1, NULL, NULL, 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'ad535bde-faaa-4b27-89f4-c1df3eef55af'),
(198, 198, 1, NULL, NULL, 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'd9aabb6f-ff38-46cd-810e-ea0ce78b2057'),
(199, 199, 1, NULL, NULL, 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '0347a7a4-b77c-481f-bd17-8602a0b1bf3b'),
(200, 200, 1, NULL, NULL, 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'c387f33a-af83-4ee1-bd0d-9be50395bc4a'),
(201, 201, 1, NULL, NULL, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '49e52b16-9516-41cf-9521-8c02932fa3a1'),
(202, 202, 1, 'homepage', '__home__', 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '46759173-f1a3-4f88-8769-f987224a93d7'),
(203, 203, 1, NULL, NULL, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', 'b2d6e17a-e24b-4974-983e-e59a3b39ab62'),
(204, 204, 1, NULL, NULL, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '6ca4c284-a404-4c3f-8f34-0f3f0cd644a8'),
(205, 205, 1, NULL, NULL, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '9d44dd26-e75f-41fb-831e-d66745910b4a'),
(206, 206, 1, NULL, NULL, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', 'bbde8242-d20a-4f25-8670-f8b036f0f98b'),
(207, 207, 1, NULL, NULL, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '37b16c94-f236-4313-af24-c7e2376d1bfd'),
(208, 208, 1, 'ita-lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 'youtube/ita-lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 1, '2020-09-16 13:07:31', '2020-09-16 13:07:31', '135e099f-c26c-4c77-aea8-47f6cfa54f8e'),
(209, 209, 1, 'ita-lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 'youtube/ita-lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 1, '2020-09-16 13:07:31', '2020-09-16 13:07:31', '2668d45a-81b3-413f-a802-d17e19f02f4e'),
(210, 210, 1, 'rm-schools-lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 'youtube/rm-schools-lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 1, '2020-09-16 13:08:00', '2020-09-16 13:08:00', '33a08cba-036c-41f5-a875-427621310566'),
(211, 211, 1, 'rm-schools-lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 'youtube/rm-schools-lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 1, '2020-09-16 13:08:00', '2020-09-16 13:08:00', '6f6a0732-5b3c-4a5e-877f-1330ac0fce40'),
(212, 212, 1, 'unde-voluptates-lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 'youtube/unde-voluptates-lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 1, '2020-09-16 13:08:36', '2020-09-16 13:08:36', '8182307d-5ea7-4864-a94d-1e7c7aa43649'),
(213, 213, 1, 'unde-voluptates-lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 'youtube/unde-voluptates-lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 1, '2020-09-16 13:08:36', '2020-09-16 13:08:36', '400d4c95-796e-450d-bfab-5c431a6b8bce'),
(214, 214, 1, 'homepage', '__home__', 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '27e99475-cced-4695-8945-5e0b6b776291'),
(215, 215, 1, NULL, NULL, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', 'c5dd6531-5c74-4d89-b8cb-8db45ee0f430'),
(216, 216, 1, NULL, NULL, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '5264a5a2-b40d-4336-8548-11eaee14f644'),
(217, 217, 1, NULL, NULL, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', 'e0fd1b12-4dfa-41c1-952c-e08c1e90ca57'),
(218, 218, 1, NULL, NULL, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '8cb66a7f-c23d-48e6-94c1-4ff11a807879'),
(219, 219, 1, NULL, NULL, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '0b72802c-d843-48d9-82bd-9af4b0d55daa'),
(220, 220, 1, 'homepage', '__home__', 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '1426d1c0-62c0-4de5-b6bc-b5f4657ceef9'),
(221, 221, 1, NULL, NULL, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '41285d70-6b97-44fc-bea9-9b06f994208a'),
(222, 222, 1, NULL, NULL, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '932e95b3-4493-4649-9de1-cb8e1140dbc4'),
(223, 223, 1, NULL, NULL, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', 'c13d2618-bee4-43c8-a8d1-8fdba88814d5'),
(224, 224, 1, NULL, NULL, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', 'bdd79b35-055e-4f97-9e5e-d9cb73b428d5'),
(225, 225, 1, NULL, NULL, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', 'f1fb7597-ee56-49c8-9148-8fa7c5668084'),
(226, 226, 1, 'learning-pathways', 'navigation-topics/learning-pathways', 1, '2020-09-16 13:16:47', '2020-09-16 13:16:48', 'b3671144-b553-4fbb-b872-ee9214e0931e'),
(227, 227, 1, NULL, NULL, 1, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '316f7be3-ccb2-4a7f-9e04-14d5c49a91df'),
(228, 228, 1, NULL, NULL, 1, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '4f817e6c-1324-4efd-854a-44c4281280b2'),
(229, 229, 1, NULL, NULL, 1, '2020-09-16 13:16:47', '2020-09-16 13:16:47', 'e37b62a3-72b9-477b-b514-b2f9ba48fe52'),
(230, 230, 1, NULL, NULL, 1, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '46eed739-e6ea-4ab4-9306-f609768ecae7'),
(231, 231, 1, 'documents', 'navigation-topics/documents', 1, '2020-09-16 13:18:19', '2020-09-16 13:18:21', 'fecae418-fb67-41bb-8afa-1775343c4ce3'),
(232, 232, 1, NULL, NULL, 1, '2020-09-16 13:18:20', '2020-09-16 13:18:20', '2f23eb6b-b0bc-439e-9744-4084f5c97d2a'),
(233, 233, 1, NULL, NULL, 1, '2020-09-16 13:18:20', '2020-09-16 13:18:20', '57a8dda5-d7f1-47ef-af4f-4aa8f1b769bb'),
(234, 234, 1, 'footer', 'footer', 1, '2020-09-16 13:19:20', '2020-09-16 13:19:20', '93e33bc1-8677-4df6-bf32-4e58abcc9136'),
(235, 235, 1, 'footer', 'footer', 1, '2020-09-16 13:19:20', '2020-09-16 13:19:20', '6d17f3c7-59c1-443d-854e-dcb39d9a5fda'),
(236, 236, 1, 'about-rm-schools', 'footer-categories/about-rm-schools', 1, '2020-09-16 13:24:44', '2020-09-16 13:24:45', 'ccff59f3-d860-4589-b9dd-022b9c74cbc9'),
(237, 237, 1, NULL, NULL, 1, '2020-09-16 13:24:44', '2020-09-16 13:24:44', '82455075-40c1-441d-8dbc-f43735c3d5bb'),
(238, 238, 1, NULL, NULL, 1, '2020-09-16 13:24:44', '2020-09-16 13:24:44', '03b9173e-5931-46c9-9a07-ef5b23950e72'),
(239, 239, 1, NULL, NULL, 1, '2020-09-16 13:24:44', '2020-09-16 13:24:44', '170b2db6-dce9-4540-8778-56ea12258779'),
(240, 240, 1, 'learning-pathways', 'footer-categories/learning-pathways', 1, '2020-09-16 13:26:32', '2020-09-16 13:26:33', '95ced39d-d1d6-495b-8124-da4929e8d5be'),
(241, 241, 1, NULL, NULL, 1, '2020-09-16 13:26:32', '2020-09-16 13:26:32', '3a08e9ee-61f1-4df0-a291-3f270c531c74'),
(242, 242, 1, NULL, NULL, 1, '2020-09-16 13:26:33', '2020-09-16 13:26:33', '5b1adb27-ba13-4a0c-9ac4-1b57e651c1d7'),
(243, 243, 1, NULL, NULL, 1, '2020-09-16 13:26:33', '2020-09-16 13:26:33', '68f1b07e-c56d-4612-8a6f-5f426fe1f408'),
(244, 244, 1, NULL, NULL, 1, '2020-09-16 13:26:33', '2020-09-16 13:26:33', 'c161e63b-bc2a-4ac3-b952-c2ccde22b782'),
(245, 245, 1, 'footer', 'footer', 1, '2020-09-16 13:31:21', '2020-09-16 13:31:21', 'fd734017-85f2-4366-8a5b-90b49a24ef12'),
(246, 246, 1, 'privacy-policy', 'document/privacy-policy', 1, '2020-09-16 13:32:01', '2020-09-16 13:32:01', '34a53b82-878c-487d-9536-12c0e3fcd26c'),
(247, 247, 1, 'privacy-policy', 'document/privacy-policy', 1, '2020-09-16 13:32:01', '2020-09-16 13:32:01', '361f721e-7bcf-4288-a351-dc9f3cb73fb7'),
(248, 248, 1, 'terms-conditions', 'document/terms-conditions', 1, '2020-09-16 13:32:20', '2020-09-16 13:32:20', 'e6ae9543-4456-4719-b228-e9c8da8c7f93'),
(249, 249, 1, 'terms-conditions', 'document/terms-conditions', 1, '2020-09-16 13:32:20', '2020-09-16 13:32:20', '82c0e023-601c-41e3-a6df-66af6e3d741b'),
(250, 250, 1, NULL, NULL, 1, '2020-09-16 13:33:53', '2020-09-16 13:33:53', '9045f800-da1f-496c-ac45-25498bf2f884'),
(251, 251, 1, NULL, NULL, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '5fee9ebe-d23a-4328-b37a-58e5e1fd9831'),
(252, 252, 1, NULL, NULL, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '52c89e59-2aec-493e-bec2-c674acf51d27'),
(253, 253, 1, NULL, NULL, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '8f8bf5d1-d1d9-4e72-be12-50d4fa0de7fe'),
(254, 254, 1, 'footer', 'footer', 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', 'fe5bc943-92bd-4e6c-affe-23c4ec2c3d05'),
(255, 255, 1, NULL, NULL, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', 'ba73bac6-aaf0-4ef7-8804-b79d9a247064'),
(256, 256, 1, NULL, NULL, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '8d3c072b-2d38-46dc-bfcd-662f523cdec4'),
(257, 257, 1, NULL, NULL, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '844780d8-2c0e-46ec-b055-fcef0116b018'),
(258, 258, 1, NULL, NULL, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', 'aaa449bf-dbcb-44a3-a947-79a600853364'),
(259, 259, 1, 'footer', 'footer', 1, '2020-09-16 13:34:09', '2020-09-16 13:34:09', 'b039b3bc-cb0c-4516-b122-667660ad5407'),
(260, 260, 1, NULL, NULL, 1, '2020-09-16 13:34:09', '2020-09-16 13:34:09', 'c60b7953-767d-4585-97fa-dceb379b9ce6'),
(261, 261, 1, NULL, NULL, 1, '2020-09-16 13:34:09', '2020-09-16 13:34:09', '57260855-3a4c-4011-a1e0-389ebf417229'),
(262, 262, 1, NULL, NULL, 1, '2020-09-16 13:34:09', '2020-09-16 13:34:09', 'cba271c5-8fc7-4a27-a7cd-c54555bd5c61'),
(263, 263, 1, NULL, NULL, 1, '2020-09-16 13:34:09', '2020-09-16 13:34:09', 'c5ff15f6-a941-428a-a4d0-65b1f083d7ab'),
(264, 264, 1, 'footer', 'footer', 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '77223c58-0cc5-4e1a-b741-381ee482e681'),
(265, 265, 1, NULL, NULL, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', 'e7861b72-6e51-47f4-aa0e-45fdf9033bfd'),
(266, 266, 1, NULL, NULL, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', 'dc3032d2-fe5e-4e74-b95e-1982b8571751'),
(267, 267, 1, NULL, NULL, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '6e666b35-198f-4415-89f7-1789de6cb21d'),
(268, 268, 1, NULL, NULL, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '669abe7f-163b-4379-a66e-b8a1d577e2c4'),
(269, 269, 1, 'footer', 'footer', 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '286d5b07-dbd5-4ce2-bfa8-cb4895e8724f'),
(270, 270, 1, NULL, NULL, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', 'f9447463-87da-4de4-b8e2-655ac7c0b4eb'),
(271, 271, 1, NULL, NULL, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '9c3a52f2-c0bf-4605-97af-3927240e4819'),
(272, 272, 1, NULL, NULL, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '414004a7-0988-4614-8a9a-5d03ab66fb1a'),
(273, 273, 1, NULL, NULL, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', 'bc96b097-6171-4853-a84e-6b6bfef13ea1'),
(274, 274, 1, NULL, NULL, 1, '2020-09-16 14:12:50', '2020-09-16 14:12:50', '399234f3-7de6-4be4-9a45-1778d5457ed3'),
(275, 275, 1, NULL, NULL, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '1f0c0900-9cad-45de-a23d-9e1705b0629f'),
(276, 276, 1, NULL, NULL, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '38878599-2160-46ad-b09a-b369cb8bcc1a'),
(277, 277, 1, 'footer', 'footer', 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '9615934b-bc8b-43b0-a583-27b9c7e2e9c3'),
(278, 278, 1, NULL, NULL, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'f9716122-af16-4d96-9196-4188029e22b1'),
(279, 279, 1, NULL, NULL, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '86976fa9-d4c4-404f-b8d7-34c90180c7ed'),
(280, 280, 1, NULL, NULL, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '00fff877-2d09-40ab-af06-3c355e4a8549'),
(281, 281, 1, NULL, NULL, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '45f4374a-1cfa-408d-b307-8a419f620d85'),
(282, 282, 1, NULL, NULL, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'd6b6d068-dd18-4924-b1e5-ca4916d28fdf'),
(283, 283, 1, NULL, NULL, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'f6b28c94-b8aa-4d9e-9063-defc00bb6d86'),
(284, 284, 1, NULL, NULL, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'c98364e9-5b2c-4950-9c69-7875759ab57c'),
(285, 285, 1, 'rawmatters-ambassadors-at-schools-1', 'hero/rawmatters-ambassadors-at-schools-1', 1, '2020-09-16 14:30:33', '2020-09-16 14:30:33', '7fb9077f-5c6d-4c43-b9dc-76da7933a158'),
(286, 286, 1, 'homepage', '__home__', 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '4eebf177-28f5-48c8-9cdf-26b1a2ac8f4a'),
(287, 287, 1, NULL, NULL, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', 'a9c8cc68-bfd4-4da4-a38a-418b09f4bea2'),
(288, 288, 1, NULL, NULL, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '5e3fe7b1-a80e-4134-91fb-e0518cfe37e8'),
(289, 289, 1, NULL, NULL, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', 'a80d7d61-54a4-44e2-aa2c-2619d678dfd0'),
(290, 290, 1, NULL, NULL, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '43d265e9-6a94-4aed-aa6e-b0190abda67d'),
(291, 291, 1, NULL, NULL, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', 'dda6a38f-4911-4f20-8282-f77cfe18ead7'),
(292, 292, 1, 'homepage', '__home__', 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '4792eb96-14bf-4360-87ab-162b84612ce4'),
(293, 293, 1, NULL, NULL, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '426498f9-0b03-404f-a0d6-e859444b6132'),
(294, 294, 1, NULL, NULL, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'bf2bc169-c1de-477e-b746-6f79b7bf1660'),
(295, 295, 1, NULL, NULL, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'ac121cf4-76ec-4741-ae38-7b4b1654f961'),
(296, 296, 1, NULL, NULL, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '982ed079-c246-456e-abbe-eab975886a65'),
(297, 297, 1, NULL, NULL, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '0e536cb7-85b7-4acd-8452-d7c6a50de245'),
(298, 298, 1, 'footer', 'footer', 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'eeaa69f0-92e2-48f5-b6fb-2d6616544cd7'),
(299, 299, 1, NULL, NULL, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'f380efc2-779e-4842-92df-b19d0d483a90'),
(300, 300, 1, NULL, NULL, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', '54ccc093-d758-483f-b381-52466fa12e9b'),
(301, 301, 1, NULL, NULL, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', '977e8e43-2965-4ed4-bae2-8de0d5f6e349'),
(302, 302, 1, NULL, NULL, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'e5e5366e-5a68-4484-af42-ce0695b628a6'),
(303, 303, 1, NULL, NULL, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', '64953525-6c8c-496d-b232-c449bda9b358'),
(304, 304, 1, NULL, NULL, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', '3813ce70-762e-41ee-a8e2-b832527f282f'),
(305, 305, 1, NULL, NULL, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'e85f6e6c-3703-4812-bee2-4f8dc1d65210'),
(306, 306, 1, 'navbar', NULL, 1, '2020-09-17 12:36:05', '2020-09-17 12:36:05', '08953231-24c1-45c0-beb3-6cc2a415b268'),
(307, 307, 1, NULL, NULL, 1, '2020-09-17 12:36:05', '2020-09-17 12:36:05', 'eb020209-aa80-4c67-b5c5-82ff37e1ece5'),
(308, 308, 1, NULL, NULL, 1, '2020-09-17 12:36:05', '2020-09-17 12:36:05', '7beb57ce-35b3-4724-a775-3a40babde5bd'),
(309, 309, 1, NULL, NULL, 1, '2020-09-17 12:36:05', '2020-09-17 12:36:05', 'a1fab051-7052-4d12-9c2a-a0e1da974ae3'),
(310, 310, 1, NULL, NULL, 1, '2020-09-17 12:36:05', '2020-09-17 12:36:05', 'e51ee56a-c039-4bd3-a84b-e4a8b5a8bb04'),
(311, 311, 1, 'navbar', NULL, 1, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '4c8335ab-29e0-4f5d-910e-5a9997445088'),
(312, 312, 1, NULL, NULL, 1, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '0016ea53-30ee-4083-8e6f-28860e057a36'),
(313, 313, 1, NULL, NULL, 1, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '9fda2acc-e3af-496d-803d-e153375e36b4'),
(314, 314, 1, NULL, NULL, 1, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '1fd4ef2d-9c0f-4bdd-9bcb-1df3ea23d4a6'),
(315, 315, 1, NULL, NULL, 1, '2020-09-17 12:36:36', '2020-09-17 12:36:36', 'c7262376-e899-4946-9e4b-889dccdb5bae'),
(316, 316, 1, 'navbar', NULL, 1, '2020-09-17 12:37:55', '2020-09-17 12:37:55', '67f26da9-766a-4b09-b1a3-2c3cde1472a1'),
(317, 317, 1, NULL, NULL, 1, '2020-09-17 12:37:55', '2020-09-17 12:37:55', '287cfeac-e2ea-4b2e-ab01-c76f21e01c68'),
(318, 318, 1, NULL, NULL, 1, '2020-09-17 12:37:55', '2020-09-17 12:37:55', 'bbb69684-cd06-4ae0-bd00-4e14d232637b'),
(319, 319, 1, NULL, NULL, 1, '2020-09-17 12:37:55', '2020-09-17 12:37:55', 'ef1078ac-083f-439b-b6f2-85a1d7e17aa5'),
(320, 320, 1, NULL, NULL, 1, '2020-09-17 12:37:55', '2020-09-17 12:37:55', '2c3868bd-33b6-4115-b328-14837752b4cb'),
(321, 321, 1, 'navbar', NULL, 1, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '088215ad-7627-4ea8-aee6-94df1946591a'),
(322, 322, 1, NULL, NULL, 1, '2020-09-17 12:38:33', '2020-09-17 12:38:33', 'd353f033-ee43-4818-9939-d13c0961b4ac'),
(323, 323, 1, NULL, NULL, 1, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '46fb5f36-2a71-42e3-ab6b-7ed55e7de5a7'),
(324, 324, 1, NULL, NULL, 1, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '272c0af5-bf9c-4909-97cc-4218fdab7277'),
(325, 325, 1, NULL, NULL, 1, '2020-09-17 12:38:33', '2020-09-17 12:38:33', 'bcdf9218-ab92-4da8-af97-d7f619f60697'),
(326, 326, 1, 'footer', 'footer', 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '88f2ef76-e103-4101-b8e5-e7d362d029e9'),
(327, 327, 1, NULL, NULL, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '8c340942-a4fd-47a0-b805-b05b81cfbbd2'),
(328, 328, 1, NULL, NULL, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', 'd41573b9-d052-4426-b269-4039a64185e8'),
(329, 329, 1, NULL, NULL, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '0659b8c2-daaf-46d4-b82c-8a37f6230a06'),
(330, 330, 1, NULL, NULL, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '7a26327c-5ab0-461c-a7f3-61b8470d00b5'),
(331, 331, 1, NULL, NULL, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '1a124c9d-7666-4145-a9cc-28d961733b5c'),
(332, 332, 1, NULL, NULL, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', 'd9070ac1-e973-4f3d-9d47-148f10f5a3ec'),
(333, 333, 1, NULL, NULL, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '28fb86bd-415d-4e22-acd6-b2a943889ae1'),
(334, 334, 1, 'about-us', 'about-us', 1, '2020-09-17 12:57:46', '2020-09-17 12:57:46', '987f268e-f44f-412f-a7bc-57bc882490db'),
(335, 335, 1, 'about-us', 'about-us', 1, '2020-09-17 12:57:47', '2020-09-17 12:57:47', 'd113cdc1-3ec8-440c-81fa-bfc41092bb2e'),
(336, 336, 1, 'about-us', 'about-us', 1, '2020-09-17 12:57:47', '2020-09-17 12:57:47', 'b2fae034-1fdf-44b6-90b2-29eb91f1a0d9'),
(337, 337, 1, 'about-us', 'about-us', 1, '2020-09-17 13:08:27', '2020-09-17 13:08:27', 'c5a36d0a-a6b5-4a3b-a90d-bed0d1eb3e19'),
(338, 338, 1, 'about-us', 'about-us', 1, '2020-09-17 13:10:20', '2020-09-17 13:10:20', '5ceb0815-8f20-47df-b1a0-0f1903f5a347'),
(339, 339, 1, 'something', 'event/something', 1, '2020-09-17 13:19:08', '2020-09-17 13:19:08', 'b7216b6b-9694-46d1-a916-961fc5baed46'),
(340, 340, 1, 'something', 'event/something', 1, '2020-09-17 13:19:08', '2020-09-17 13:19:08', 'afe5af76-e18d-43ec-ba2f-c43501283e71'),
(341, 341, 1, 'homepage', '__home__', 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '3cfd8048-9b73-46d6-87d1-228b6c2bc082'),
(342, 342, 1, NULL, NULL, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'b0e780e2-3db7-4c61-9d53-25687ac5841e'),
(343, 343, 1, NULL, NULL, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '401cbbd9-bc1b-40e6-84dc-e784f1bc95b3'),
(344, 344, 1, NULL, NULL, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'd418fbfc-a36a-4bc5-8d0d-913ef8318051'),
(345, 345, 1, NULL, NULL, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'a1dfef17-4bb1-4bce-af4f-66c24296d09e'),
(346, 346, 1, NULL, NULL, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '6cca3f6b-457f-4a5b-98c1-762f6383f6ae'),
(347, 347, 1, 'navbar', NULL, 1, '2020-09-17 13:22:18', '2020-09-17 13:22:18', '5c39e710-b8e0-4d1d-bc6a-7d391b86b42b'),
(348, 348, 1, NULL, NULL, 1, '2020-09-17 13:22:18', '2020-09-17 13:22:18', '35660878-e566-4424-b431-224f75c99534'),
(349, 349, 1, NULL, NULL, 1, '2020-09-17 13:22:18', '2020-09-17 13:22:18', 'b380fdd1-d058-44ae-809a-47106fafe287'),
(350, 350, 1, NULL, NULL, 1, '2020-09-17 13:22:18', '2020-09-17 13:22:18', '48af9522-5b83-46cc-bf34-582c2753447a'),
(351, 351, 1, NULL, NULL, 1, '2020-09-17 13:22:18', '2020-09-17 13:22:18', '66f2e5d7-cbb1-47bc-b9ca-e3bb9ad9924b');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(11, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:18:15', '2020-09-14 12:18:15', 'ba559df5-867a-42e0-9448-b2d187bb15c6'),
(12, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:18:15', '2020-09-14 12:18:15', '1a7a7558-0870-4879-8fb5-5d9b982627cf'),
(13, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:19:14', '2020-09-14 12:19:14', '15fd51a5-179c-4a9d-aea1-73686636dc60'),
(18, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '8088d318-298a-4b84-983f-2ffe969e7fd0'),
(23, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:22:15', '2020-09-14 12:22:15', '6e079c54-46a3-4907-adae-0f4d85a9f5be'),
(28, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:26:53', '2020-09-14 12:26:53', 'ab53679c-48fa-4ee7-833a-420e1001dc3d'),
(33, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:27:09', '2020-09-14 12:27:09', 'b03b8598-d3e8-4a7d-8677-208945cde977'),
(40, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:29:21', '2020-09-14 12:29:21', '51f89e8e-7306-42eb-94fd-01ce55c8246c'),
(45, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:34:38', '2020-09-14 12:34:38', 'd52109b8-ca1d-4ca0-bf82-986e11a5a265'),
(50, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:40:48', '2020-09-14 12:40:48', 'e7a217b2-8f69-48a1-9f36-950951f6bd0e'),
(55, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:41:00', '2020-09-14 12:41:00', '5cc852a6-4ff3-4544-94c6-15e210abcc75'),
(60, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:41:37', '2020-09-14 12:41:37', 'af4c5a17-0b6b-4ce9-970e-8846b19c35bd'),
(65, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-14 12:41:48', '2020-09-14 12:41:48', '0a4965b7-108d-4177-a26b-fb22f2308319'),
(70, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-14 13:11:26', '2020-09-14 13:11:26', '1f68cb92-8dff-40ef-8de4-0656197f5116'),
(71, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-14 13:11:26', '2020-09-14 13:11:26', '425f29cb-00e0-4923-b69e-1cea9918a331'),
(73, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-14 13:48:02', '2020-09-14 13:48:02', '5cb8f89f-4b19-40e5-86ca-4eaa36f3233d'),
(74, 3, NULL, 3, 1, '2020-09-14 13:50:00', NULL, 0, '2020-09-14 13:50:05', '2020-09-14 13:50:05', '42d52729-863a-4463-9327-20dc67057ade'),
(75, 3, NULL, 3, 1, '2020-09-14 13:50:00', NULL, NULL, '2020-09-14 13:50:05', '2020-09-14 13:50:05', 'e681ec32-96d7-4527-8df1-e51be8b3baf0'),
(76, 3, NULL, 3, 1, '2020-09-14 13:50:00', NULL, 0, '2020-09-14 13:50:13', '2020-09-14 13:50:13', 'fa36706c-5be6-4146-89dd-11d620329fe9'),
(77, 3, NULL, 3, 1, '2020-09-14 13:50:00', NULL, NULL, '2020-09-14 13:50:13', '2020-09-14 13:50:13', '9ccceeee-95ee-4edd-8f1d-e7e04361a062'),
(78, 4, NULL, 4, 1, '2020-09-14 13:51:00', NULL, 0, '2020-09-14 13:51:45', '2020-09-14 13:51:45', 'c23c33e3-9bde-4603-9789-33a2575718c7'),
(79, 4, NULL, 4, 1, '2020-09-14 13:51:00', NULL, NULL, '2020-09-14 13:51:45', '2020-09-14 13:51:45', '1ec3d013-f4a3-4ea9-bb01-27e5d017d8ba'),
(80, 4, NULL, 4, 1, '2020-09-14 13:51:00', NULL, 0, '2020-09-14 13:51:48', '2020-09-14 13:51:48', '77b799bc-3427-4e5e-b685-b8ec747a43d7'),
(81, 4, NULL, 4, 1, '2020-09-14 13:51:00', NULL, NULL, '2020-09-14 13:51:48', '2020-09-14 13:51:48', '3a2dbb94-7093-447d-aa18-8c7833b2d816'),
(83, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-14 14:12:07', '2020-09-14 14:12:07', '5dd07d0c-a671-4441-a4ff-6d1b98a0e7f2'),
(87, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '574befde-2d37-42f6-be9d-3ac48efe284f'),
(91, 5, NULL, 5, 1, '2020-09-14 14:40:00', NULL, 1, '2020-09-14 14:40:42', '2020-09-14 14:40:42', '3f4f076b-631c-454c-820d-3eb7008f8ba4'),
(92, 5, NULL, 5, 1, '2020-09-14 14:40:00', NULL, NULL, '2020-09-14 14:40:42', '2020-09-14 14:40:42', 'ca5f09ec-9f18-4d8d-995b-8256b6c0cc28'),
(93, 5, NULL, 5, 1, '2020-09-14 14:41:00', NULL, 1, '2020-09-14 14:41:18', '2020-09-14 14:41:18', 'b13539c2-4fb4-446b-b99c-27c13836ff67'),
(94, 5, NULL, 5, 1, '2020-09-14 14:41:00', NULL, NULL, '2020-09-14 14:41:18', '2020-09-14 14:41:18', '5da57042-cf8b-4666-aa38-0761b76589de'),
(95, 5, NULL, 5, 1, '2020-09-14 14:41:00', NULL, 1, '2020-09-14 14:41:54', '2020-09-14 14:41:54', '82f88410-c7cb-49a9-8e8d-47952b4af680'),
(96, 5, NULL, 5, 1, '2020-09-14 14:41:00', NULL, NULL, '2020-09-14 14:41:54', '2020-09-14 14:41:54', 'ef3eda6f-13ac-42a3-a877-0a128d49e3cd'),
(97, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-14 14:42:18', '2020-09-14 14:42:18', '63b93d29-3c50-4776-a33d-969031032d78'),
(99, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-15 07:37:55', '2020-09-15 07:37:55', '6d24881f-3034-4fdf-96da-db0b234e6e9f'),
(102, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-15 07:38:22', '2020-09-15 07:38:22', 'ca045ff5-1e4a-4832-8c66-66e10582ccbc'),
(105, 6, NULL, 6, 1, '2020-09-15 08:09:00', NULL, NULL, '2020-09-15 08:09:01', '2020-09-15 08:09:01', '5a0b1fc5-8fb6-422a-8535-ebf56b1648f5'),
(106, 6, NULL, 6, 1, '2020-09-15 08:09:00', NULL, NULL, '2020-09-15 08:09:01', '2020-09-15 08:09:01', '89a8301c-3d6e-483f-b6e1-3b3fd9a0ab24'),
(107, 6, NULL, 6, 1, '2020-09-15 08:09:00', NULL, NULL, '2020-09-15 08:09:06', '2020-09-15 08:09:06', '2d007fa3-4a78-47e7-a147-463ec82063ff'),
(108, 6, NULL, 6, 1, '2020-09-15 08:09:00', NULL, NULL, '2020-09-15 08:09:06', '2020-09-15 08:09:06', '6ea43b6c-2a2a-4868-a65b-6d9dd0c266f3'),
(109, 6, NULL, 6, 1, '2020-09-15 08:09:00', NULL, NULL, '2020-09-15 08:09:11', '2020-09-15 08:09:11', '0e761134-fa06-48d8-8c57-139447da5ca0'),
(110, 6, NULL, 6, 1, '2020-09-15 08:09:00', NULL, NULL, '2020-09-15 08:09:11', '2020-09-15 08:09:11', 'a72e72f7-58c1-4709-b3a4-bfb82c20ffec'),
(111, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-15 08:09:22', '2020-09-15 08:09:22', 'ec54e021-9e2c-4889-94cb-b721dd332f8f'),
(113, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-15 10:25:22', '2020-09-15 10:25:22', '9d4c3539-22c3-4171-a159-0f1c52457cf1'),
(120, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-15 12:12:02', '2020-09-15 12:12:02', '055267f2-fff5-41f6-a384-b5e65781a964'),
(124, 3, NULL, 3, 1, '2020-09-15 13:02:00', NULL, NULL, '2020-09-15 13:02:49', '2020-09-15 13:02:49', 'ee4d8535-ec14-47ee-96a9-86352459a6e3'),
(125, 3, NULL, 3, 1, '2020-09-15 13:02:00', NULL, NULL, '2020-09-15 13:02:49', '2020-09-15 13:02:49', 'c438edf2-4ecf-41cd-b5b4-414266dae0c0'),
(126, 3, NULL, 3, 1, '2020-09-15 13:03:00', NULL, NULL, '2020-09-15 13:03:05', '2020-09-15 13:03:05', 'c9db7a4f-ce9c-48d7-b3d7-f63d0dce47b9'),
(127, 3, NULL, 3, 1, '2020-09-15 13:03:00', NULL, NULL, '2020-09-15 13:03:05', '2020-09-15 13:03:05', '7431f54f-f742-4f4d-80d6-46810077b25b'),
(128, 3, NULL, 3, 1, '2020-09-15 13:03:00', NULL, NULL, '2020-09-15 13:03:23', '2020-09-15 13:03:23', '29f31704-0976-4afd-8df7-1baabe849321'),
(129, 3, NULL, 3, 1, '2020-09-15 13:03:00', NULL, NULL, '2020-09-15 13:03:23', '2020-09-15 13:03:23', 'bd653d9b-2acb-4661-8fed-d808f6170354'),
(130, 3, NULL, 3, 1, '2020-09-15 13:03:00', NULL, NULL, '2020-09-15 13:03:48', '2020-09-15 13:03:48', '8aee0dcd-cd38-40c4-bdce-c2fe1d2fdc04'),
(131, 3, NULL, 3, 1, '2020-09-15 13:03:00', NULL, NULL, '2020-09-15 13:03:48', '2020-09-15 13:03:48', '4c3f037c-448f-42c9-a3e2-2a5ad63a4cd1'),
(133, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-15 13:03:53', '2020-09-15 13:03:53', '78dd80dc-24d6-4854-8c66-2f742514fbfe'),
(137, 3, NULL, 3, 1, '2020-09-15 13:03:00', NULL, NULL, '2020-09-15 13:12:32', '2020-09-15 13:12:32', '5d6c6ba9-5bb5-4077-b170-3f68ad93501d'),
(138, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-15 13:12:36', '2020-09-15 13:12:36', '865ad2ac-f1c4-48dc-b299-adbee2fa0d8c'),
(145, 6, NULL, 6, 1, '2020-09-15 08:09:00', NULL, NULL, '2020-09-15 13:31:38', '2020-09-15 13:31:38', 'b44ea7e7-5983-4047-ab99-5803b5f76102'),
(146, 6, NULL, 6, 1, '2020-09-15 08:09:00', NULL, NULL, '2020-09-15 13:31:52', '2020-09-15 13:31:52', '3cc317b0-4007-415a-a369-9ec8f1e4b730'),
(147, 6, NULL, 6, 1, '2020-09-15 08:09:00', NULL, NULL, '2020-09-15 13:32:01', '2020-09-15 13:32:01', '88e7270a-de9d-4332-aa11-f3b5027f202c'),
(148, 6, NULL, 6, 1, '2020-09-15 08:09:00', NULL, NULL, '2020-09-15 13:32:07', '2020-09-15 13:32:07', 'e990b0ec-3a33-4811-899b-377ccbe675ec'),
(149, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '7372241f-be60-4912-801b-fa1011a28fcf'),
(153, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '1c365daa-c605-4fb5-b2e1-4bcdc4ee6158'),
(158, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-15 14:09:54', '2020-09-15 14:09:54', 'caaa1fa3-02c2-471a-8579-f3ac7be0434c'),
(163, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '7a270d6a-d942-46e9-812d-ceb68d68ed2a'),
(168, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-15 14:13:14', '2020-09-15 14:13:14', 'e2a4bd06-48cb-455c-a5ac-c613144714e4'),
(172, 4, NULL, 4, 1, '2020-09-16 07:34:00', NULL, NULL, '2020-09-16 07:34:25', '2020-09-16 07:34:25', 'f9de71f7-02de-468b-9e5c-612c933431e0'),
(173, 4, NULL, 4, 1, '2020-09-16 07:34:00', NULL, NULL, '2020-09-16 07:34:25', '2020-09-16 07:34:25', 'b18ac857-6ca3-4008-b30a-15b31519708c'),
(174, 4, NULL, 4, 1, '2020-09-16 07:35:00', NULL, NULL, '2020-09-16 07:35:16', '2020-09-16 07:35:16', 'c5d3b1b1-4093-47d5-b903-cf875dd2c5b0'),
(175, 4, NULL, 4, 1, '2020-09-16 07:35:00', NULL, NULL, '2020-09-16 07:35:16', '2020-09-16 07:35:16', '76c5c545-d9b6-4bc9-bcea-1498cbe1904f'),
(176, 4, NULL, 4, 1, '2020-09-16 07:35:00', NULL, NULL, '2020-09-16 07:35:25', '2020-09-16 07:35:25', '00cd67eb-b93d-4151-94cc-9ceffcf1c041'),
(177, 4, NULL, 4, 1, '2020-09-16 07:36:00', NULL, NULL, '2020-09-16 07:36:00', '2020-09-16 07:36:00', '979d0b27-e026-4bf4-84c6-c78ffaa37bda'),
(178, 4, NULL, 4, 1, '2020-09-16 07:36:00', NULL, NULL, '2020-09-16 07:36:00', '2020-09-16 07:36:00', '4f4384b9-9434-4e7d-a749-5c60825fc415'),
(180, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '7cf8ab1b-23cb-49be-9bf9-c3f0d4a08152'),
(185, 4, NULL, 4, 1, '2020-09-16 08:38:00', NULL, NULL, '2020-09-16 08:38:45', '2020-09-16 08:38:45', '23a7efd5-b5e6-4121-a718-576fc9cac12f'),
(186, 4, NULL, 4, 1, '2020-09-16 08:38:00', NULL, NULL, '2020-09-16 08:38:45', '2020-09-16 08:38:45', '13d10c72-3d45-467a-8285-8a0c7d60882c'),
(187, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-16 08:38:50', '2020-09-16 08:38:50', 'a066161b-a7f3-4e79-a7c4-237b9542897e'),
(192, 4, NULL, 4, 1, '2020-09-16 10:01:00', NULL, NULL, '2020-09-16 10:01:57', '2020-09-16 10:01:57', 'c54bc09e-4907-49e9-8fc0-452fda129ad9'),
(193, 4, NULL, 4, 1, '2020-09-16 10:01:00', NULL, NULL, '2020-09-16 10:01:57', '2020-09-16 10:01:57', 'f547bcb9-8983-4af6-be01-c1b335d59ded'),
(194, 4, NULL, 4, 1, '2020-09-16 10:02:00', NULL, NULL, '2020-09-16 10:02:16', '2020-09-16 10:02:16', 'cc2213ba-c2dd-4b50-a141-93f868a39660'),
(195, 4, NULL, 4, 1, '2020-09-16 10:02:00', NULL, NULL, '2020-09-16 10:02:16', '2020-09-16 10:02:16', '58406c54-4e43-4775-be90-00437730b1d1'),
(196, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '3a4a1205-94b1-4b9f-93f5-d719195a1425'),
(202, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '5a031f2e-0607-4539-8486-bf3e9bdc1343'),
(208, 7, NULL, 7, 1, '2020-09-16 13:07:00', NULL, NULL, '2020-09-16 13:07:31', '2020-09-16 13:07:31', 'd0f9cb92-df72-417f-b8c6-74ab1e12c1cd'),
(209, 7, NULL, 7, 1, '2020-09-16 13:07:00', NULL, NULL, '2020-09-16 13:07:31', '2020-09-16 13:07:31', 'c68c0f6c-6483-46d9-96e3-2e3474f7fc2f'),
(210, 7, NULL, 7, 1, '2020-09-16 13:08:00', NULL, NULL, '2020-09-16 13:08:00', '2020-09-16 13:08:00', '3a441652-a87f-44fa-b65a-5e49a0169759'),
(211, 7, NULL, 7, 1, '2020-09-16 13:08:00', NULL, NULL, '2020-09-16 13:08:00', '2020-09-16 13:08:00', '49228745-9e31-47f5-9f24-1a7187a54ace'),
(212, 7, NULL, 7, 1, '2020-09-16 13:08:00', NULL, NULL, '2020-09-16 13:08:36', '2020-09-16 13:08:36', '89c9689a-a3fd-42f6-99df-1da3bc0f2236'),
(213, 7, NULL, 7, 1, '2020-09-16 13:08:00', NULL, NULL, '2020-09-16 13:08:36', '2020-09-16 13:08:36', '3e22761e-04b7-4aa9-824f-0aca87a26677'),
(214, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '415c783d-39a0-4469-98e2-50d910cc7566'),
(220, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '66a97e70-05b9-47ed-8863-72a3ccc2dcb3'),
(234, 8, NULL, 8, NULL, '2020-09-16 13:19:00', NULL, NULL, '2020-09-16 13:19:20', '2020-09-16 13:19:20', '51265068-b730-420e-91a5-c5feca50213c'),
(235, 8, NULL, 8, NULL, '2020-09-16 13:19:00', NULL, NULL, '2020-09-16 13:19:20', '2020-09-16 13:19:20', '9d291453-dafd-43f8-9fac-50f3d507df71'),
(245, 8, NULL, 8, NULL, '2020-09-16 13:19:00', NULL, NULL, '2020-09-16 13:31:21', '2020-09-16 13:31:21', '390b0188-b379-4ab1-b98a-cd126b0747fc'),
(246, 9, NULL, 9, 1, '2020-09-16 13:32:00', NULL, NULL, '2020-09-16 13:32:01', '2020-09-16 13:32:01', 'ac19a3b0-778e-4eb2-b3b9-62e0ea45da3e'),
(247, 9, NULL, 9, 1, '2020-09-16 13:32:00', NULL, NULL, '2020-09-16 13:32:01', '2020-09-16 13:32:01', 'e4fea695-c970-4385-93e4-a3c0a127efd3'),
(248, 9, NULL, 9, 1, '2020-09-16 13:32:00', NULL, NULL, '2020-09-16 13:32:20', '2020-09-16 13:32:20', 'be4a9614-c62e-4781-8ac5-452432421ccf'),
(249, 9, NULL, 9, 1, '2020-09-16 13:32:00', NULL, NULL, '2020-09-16 13:32:20', '2020-09-16 13:32:20', '08cb68bd-6bc4-4361-bc22-cf425372463d'),
(254, 8, NULL, 8, NULL, '2020-09-16 13:19:00', NULL, NULL, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '6643118e-c9d7-47e9-9390-e3881270a221'),
(259, 8, NULL, 8, NULL, '2020-09-16 13:19:00', NULL, NULL, '2020-09-16 13:34:09', '2020-09-16 13:34:09', '14461744-dc47-4e65-8b86-ad7dec6ed3bb'),
(264, 8, NULL, 8, NULL, '2020-09-16 13:19:00', NULL, NULL, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '2e160c82-bfaa-42a3-b59a-0da6bab8678d'),
(269, 8, NULL, 8, NULL, '2020-09-16 13:19:00', NULL, NULL, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '5fe292ac-4fd5-4dc0-9bf6-d6b92f4c6a78'),
(277, 8, NULL, 8, NULL, '2020-09-16 13:19:00', NULL, NULL, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'c6534746-eed5-4f04-8350-463c8221382d'),
(285, 6, NULL, 6, 1, '2020-09-15 08:09:00', NULL, NULL, '2020-09-16 14:30:33', '2020-09-16 14:30:33', 'b9c50f47-64d9-4c39-b1e0-494854ff9464'),
(286, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '9d4a2f69-ec1a-4272-84ac-016954cae38e'),
(292, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '1549a664-d4fa-4b55-91cd-a29d92c78527'),
(298, 8, NULL, 8, NULL, '2020-09-16 13:19:00', NULL, NULL, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'f1336893-686e-4d13-a4e4-75d9807da9a9'),
(306, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-17 12:36:05', '2020-09-17 12:36:05', '76498e15-ee8a-4584-bff2-4dbffb042d50'),
(311, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '59a0cd88-92df-45fb-903c-4a69e038b8f0'),
(316, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-17 12:37:55', '2020-09-17 12:37:55', '087faab0-189c-439f-85bb-fd14fb930518'),
(321, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '76a46e8b-2245-425b-b254-dc473ecca744'),
(326, 8, NULL, 8, NULL, '2020-09-16 13:19:00', NULL, NULL, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '9de2f6e8-280a-4fb2-ac3d-89095a93eb23'),
(334, 10, NULL, 10, NULL, '2020-09-17 12:57:00', NULL, NULL, '2020-09-17 12:57:47', '2020-09-17 12:57:47', '5be0d2dc-bc5d-4efd-9d0b-15a8d6e45e9d'),
(335, 10, NULL, 10, NULL, '2020-09-17 12:57:00', NULL, NULL, '2020-09-17 12:57:47', '2020-09-17 12:57:47', '3d7128bf-ee8f-4a15-bfb7-5f15fea3def9'),
(336, 10, NULL, 10, NULL, '2020-09-17 12:57:00', NULL, NULL, '2020-09-17 12:57:47', '2020-09-17 12:57:47', '40b9ae8d-317c-4c8a-86f3-ebd1e6dbfc5f'),
(337, 10, NULL, 10, NULL, '2020-09-17 12:57:00', NULL, NULL, '2020-09-17 13:08:27', '2020-09-17 13:08:27', '63ad0db3-7101-4df1-b08a-b7a32b487401'),
(338, 10, NULL, 10, NULL, '2020-09-17 12:57:00', NULL, NULL, '2020-09-17 13:10:20', '2020-09-17 13:10:20', '6a60d67f-6887-4e3d-ba07-916f49753e03'),
(339, 4, NULL, 4, 1, '2020-09-17 13:19:00', NULL, NULL, '2020-09-17 13:19:08', '2020-09-17 13:19:08', '52b93297-1734-4a4a-a847-cbbcc1e7d888'),
(340, 4, NULL, 4, 1, '2020-09-17 13:19:00', NULL, NULL, '2020-09-17 13:19:08', '2020-09-17 13:19:08', '12d69c78-5312-4f5f-be0e-e91454e48196'),
(341, 2, NULL, 2, NULL, '2020-09-14 13:11:00', NULL, NULL, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '903bc3b5-c9e4-42ae-8015-89c2107dda44'),
(347, 1, NULL, 1, NULL, '2020-09-14 12:18:00', NULL, NULL, '2020-09-17 13:22:18', '2020-09-17 13:22:18', '71034794-a9da-40e3-971e-85637989ff75');

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 5, 'Navbar', 'navbar', 0, 'site', NULL, 'Navigation bar', 1, '2020-09-14 12:18:08', '2020-09-14 12:19:13', NULL, '353f9f56-8f86-40d0-bf4a-cb435c5b0852'),
(2, 2, 6, 'Homepage', 'homepage', 0, 'site', NULL, 'Homepage', 1, '2020-09-14 13:11:26', '2020-09-14 13:48:02', NULL, '4c3bce72-b007-4cb3-9f19-f572b6b15abd'),
(3, 3, 8, 'Students in action', 'studentsInAction', 1, 'site', NULL, NULL, 1, '2020-09-14 13:26:30', '2020-09-14 13:26:30', NULL, '1e08c63f-2d29-4e53-a778-7f8db6b2f268'),
(4, 4, 13, 'Event', 'event', 1, 'site', NULL, NULL, 1, '2020-09-14 13:43:32', '2020-09-14 13:43:32', NULL, 'a182e4c0-fef9-4e45-94ba-eddfbd95471f'),
(5, 5, 15, 'Slider', 'slider', 1, 'site', NULL, NULL, 1, '2020-09-14 14:36:16', '2020-09-14 14:36:16', '2020-09-15 07:19:49', '3c7bfbb4-4b3b-4e8b-aad1-20a5241198b3'),
(6, 6, 16, 'Hero', 'hero', 1, 'site', NULL, NULL, 1, '2020-09-15 08:06:49', '2020-09-15 08:06:49', NULL, '11206ff2-5be9-4e2a-a70d-150ad060d929'),
(7, 7, 19, 'Youtube', 'youtube', 1, 'site', NULL, NULL, 1, '2020-09-16 13:03:46', '2020-09-16 13:03:46', NULL, '748a09d7-f878-4c49-9ed7-b11e17b11403'),
(8, 8, 20, 'Footer', 'footer', 0, 'site', NULL, '{section.name|raw}', 1, '2020-09-16 13:19:20', '2020-09-16 13:19:20', NULL, '7475433f-874a-44d6-aebc-7b8fd3a84c76'),
(9, 9, 22, 'Document', 'document', 1, 'site', NULL, NULL, 1, '2020-09-16 13:27:54', '2020-09-16 13:27:54', NULL, 'dc5d839a-b3c7-4d47-b874-c706fcc06741'),
(10, 10, 24, 'About us', 'aboutUs', 1, 'site', NULL, '{section.name|raw}', 1, '2020-09-17 12:57:46', '2020-09-17 13:08:27', NULL, '4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454'),
(11, 11, 25, 'Cards', 'cards', 1, 'site', NULL, NULL, 1, '2020-09-17 13:04:36', '2020-09-17 13:04:36', NULL, '52708ddf-bfa8-4738-88ff-03538b88e26a');

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2020-09-14 08:05:25', '2020-09-14 08:05:25', '6b1219ff-213c-4e36-abd9-4bba5cbe3f35');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 2, 4, 1, 0, '2020-09-14 09:27:45', '2020-09-14 09:27:45', '56c8fafc-e688-4af2-9b34-a5ea7351e159'),
(2, 2, 2, 3, 1, 1, '2020-09-14 09:27:45', '2020-09-14 09:27:45', 'e394f550-a3d6-4229-b15f-f30bfdafc7a6'),
(4, 3, 4, 2, 0, 1, '2020-09-14 09:29:52', '2020-09-14 09:29:52', '0a415344-48ea-4dcf-8e8e-af912b78ad59'),
(19, 5, 11, 9, 0, 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', '456d8e84-57fa-4961-86f4-995799d69014'),
(20, 5, 11, 10, 0, 2, '2020-09-14 12:41:37', '2020-09-14 12:41:37', 'f070a39b-3a26-4592-ab6b-b9ef0b5bb60d'),
(21, 5, 11, 5, 0, 3, '2020-09-14 12:41:37', '2020-09-14 12:41:37', '0609372b-3dd1-41fc-b5ed-ce28e4781784'),
(22, 5, 11, 8, 0, 4, '2020-09-14 12:41:37', '2020-09-14 12:41:37', 'a5ab35a3-15ea-4cdc-83a4-979cfb9eb163'),
(69, 6, 31, 11, 0, 1, '2020-09-14 13:48:02', '2020-09-14 13:48:02', 'a887c113-f4c4-4b61-9aff-0973cc851e97'),
(83, 15, 37, 29, 0, 1, '2020-09-14 14:37:24', '2020-09-14 14:37:24', '13459a7b-3890-4354-8e99-ce2de6139a31'),
(84, 15, 37, 1, 0, 2, '2020-09-14 14:37:24', '2020-09-14 14:37:24', '9878370a-405a-4853-929e-7eca4958fafb'),
(109, 16, 47, 29, 0, 1, '2020-09-15 08:07:20', '2020-09-15 08:07:20', '970cd444-be12-41f4-8a7b-420f337afb8e'),
(110, 16, 47, 1, 0, 2, '2020-09-15 08:07:20', '2020-09-15 08:07:20', 'c77fdfa4-b15a-4d3e-9e50-65291e29f88a'),
(128, 8, 55, 1, 0, 1, '2020-09-15 12:48:23', '2020-09-15 12:48:23', '0d853fe7-a803-4a29-bb06-9d65dfd91776'),
(129, 8, 55, 32, 0, 2, '2020-09-15 12:48:23', '2020-09-15 12:48:23', '46e41933-e700-4f56-8144-17672129952b'),
(134, 13, 57, 29, 0, 1, '2020-09-15 13:25:30', '2020-09-15 13:25:30', 'dd7172df-2b31-4016-b7d9-ce01d4fcb0bb'),
(135, 13, 57, 34, 0, 2, '2020-09-15 13:25:30', '2020-09-15 13:25:30', '53946d26-bba9-4736-ae78-9680a10b6ce0'),
(147, 9, 62, 15, 0, 0, '2020-09-15 13:29:21', '2020-09-15 13:29:21', '2e53af1f-cbaf-46ed-8e40-0b7957d64aaa'),
(148, 9, 62, 16, 0, 1, '2020-09-15 13:29:21', '2020-09-15 13:29:21', '04eb03ae-6d59-4374-a7b7-f061f385f7fc'),
(149, 9, 62, 17, 0, 2, '2020-09-15 13:29:21', '2020-09-15 13:29:21', '44de0859-fb4b-438d-a329-23794ce52c9c'),
(150, 9, 62, 33, 0, 3, '2020-09-15 13:29:21', '2020-09-15 13:29:21', '054f307b-afe1-47c4-8715-78081236f5fe'),
(151, 9, 62, 35, 0, 4, '2020-09-15 13:29:21', '2020-09-15 13:29:21', 'f939ad36-8818-423d-80ce-032114a16476'),
(152, 9, 62, 36, 0, 5, '2020-09-15 13:29:21', '2020-09-15 13:29:21', '60c2eb1c-3b7b-4700-8a9f-f81454b723cb'),
(176, 18, 72, 39, 0, 0, '2020-09-16 12:51:26', '2020-09-16 12:51:26', '6a80b240-704f-4565-9ed1-7d0493e0abe1'),
(177, 18, 72, 40, 0, 1, '2020-09-16 12:51:26', '2020-09-16 12:51:26', 'db37711d-4783-4a00-b337-e19e09d692a5'),
(192, 21, 81, 2, 0, 1, '2020-09-16 13:23:33', '2020-09-16 13:23:33', '73502848-c5d6-4d1b-9837-c6b648f4d8a7'),
(193, 22, 83, 43, 0, 1, '2020-09-16 13:29:07', '2020-09-16 13:29:07', '510a0190-9071-4ec7-9f56-39d3ba518afd'),
(207, 20, 88, 45, 0, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '94cf4cd3-9d5b-495a-9f08-b7d57c70e9b2'),
(208, 20, 88, 42, 0, 2, '2020-09-16 14:11:39', '2020-09-16 14:11:39', 'e0f67d72-fbee-41a3-9fee-a9e8e5026287'),
(209, 20, 88, 9, 0, 3, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '660bfaf2-0468-4e6f-9032-e4bf3a9feece'),
(210, 20, 88, 10, 0, 4, '2020-09-16 14:11:39', '2020-09-16 14:11:39', 'ba1b4ef2-829b-4fe1-aa65-58b51446677e'),
(211, 20, 88, 44, 0, 5, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '7359649f-3264-47d4-9026-31b21b39f98a'),
(212, 20, 88, 5, 0, 6, '2020-09-16 14:11:39', '2020-09-16 14:11:39', 'a35b2d1e-6a0c-4562-bd4e-584f341284d7'),
(217, 19, 91, 38, 0, 1, '2020-09-16 14:35:44', '2020-09-16 14:35:44', 'bbbe97f8-4944-4456-8ebb-6b737613ae25'),
(246, 25, 106, 49, 0, 1, '2020-09-17 13:05:44', '2020-09-17 13:05:44', '14388154-3f98-4bf2-8043-c3c8762b70de'),
(258, 24, 112, 1, 0, 1, '2020-09-17 13:10:20', '2020-09-17 13:10:20', '4439b47c-e368-477e-a546-5e0d762e3f40'),
(259, 24, 112, 50, 0, 2, '2020-09-17 13:10:20', '2020-09-17 13:10:20', '644c3bb6-8466-44df-b019-e97dade3d867'),
(260, 26, 113, 52, 0, 0, '2020-09-17 13:11:47', '2020-09-17 13:11:47', 'f1e29e4f-7a6d-4187-ad4a-63b354b2cddd'),
(261, 26, 113, 51, 0, 1, '2020-09-17 13:11:47', '2020-09-17 13:11:47', 'a6f70626-6b44-4451-83df-395f75e2a7c2'),
(262, 27, 114, 54, 0, 0, '2020-09-17 13:11:47', '2020-09-17 13:11:47', 'c45751a3-1d03-42b5-80a2-d356dea62e3b'),
(263, 27, 114, 53, 0, 1, '2020-09-17 13:11:47', '2020-09-17 13:11:47', '24e5bc5d-e5a8-4841-af20-46c6a419d943'),
(264, 27, 114, 55, 0, 2, '2020-09-17 13:11:47', '2020-09-17 13:11:47', '888eb5e9-9a8a-4b63-832d-908e080a6658'),
(265, 7, 115, 30, 0, 0, '2020-09-17 13:18:32', '2020-09-17 13:18:32', '8cbe3c14-e96f-4806-a698-67e0d5b1a1aa'),
(266, 11, 116, 21, 0, 0, '2020-09-17 13:18:32', '2020-09-17 13:18:32', 'b8b4a634-0e70-40a2-97f0-b7eaf2ada930'),
(267, 11, 116, 20, 0, 1, '2020-09-17 13:18:32', '2020-09-17 13:18:32', 'ddd27943-5219-4733-8000-1a31f788b9a6'),
(268, 11, 116, 19, 0, 2, '2020-09-17 13:18:32', '2020-09-17 13:18:32', '5f6bed98-a956-4f9d-8ef1-f06f095036a1'),
(269, 11, 116, 18, 0, 3, '2020-09-17 13:18:32', '2020-09-17 13:18:32', '912f0d6a-75c9-4b54-8de3-33d85749f7ad'),
(270, 12, 117, 22, 0, 0, '2020-09-17 13:18:32', '2020-09-17 13:18:32', 'de223c12-e519-4407-9ea9-60b62646a68b'),
(271, 12, 117, 23, 0, 1, '2020-09-17 13:18:32', '2020-09-17 13:18:32', '37aa0680-b7b5-4ebe-b189-da2b99073bb8'),
(272, 12, 117, 24, 0, 2, '2020-09-17 13:18:32', '2020-09-17 13:18:32', 'c5bd7943-19a9-4406-b056-4861a2272e59'),
(273, 14, 118, 27, 0, 0, '2020-09-17 13:18:32', '2020-09-17 13:18:32', '2c934f39-ba5a-4053-9aa4-db132cd81170'),
(274, 14, 118, 26, 0, 1, '2020-09-17 13:18:32', '2020-09-17 13:18:32', '53d8a472-b5b3-4d46-99e7-39c68766cea3'),
(275, 14, 118, 28, 0, 2, '2020-09-17 13:18:32', '2020-09-17 13:18:32', '78c51bdd-1fb4-4fb9-90f6-b9e51d423212'),
(276, 17, 119, 48, 0, 0, '2020-09-17 13:18:33', '2020-09-17 13:18:33', '607d3076-5493-4082-a12f-2efa5e187177'),
(277, 17, 119, 37, 0, 1, '2020-09-17 13:18:33', '2020-09-17 13:18:33', '280dd66a-d622-4de1-a7af-528974c70a69'),
(278, 17, 119, 41, 0, 2, '2020-09-17 13:18:33', '2020-09-17 13:18:33', '8bb8dadf-ed99-4265-a277-90a0d8d30648'),
(279, 4, 120, 7, 0, 0, '2020-09-17 13:21:44', '2020-09-17 13:21:44', '3d8a8e8a-60e7-4c76-97a3-df06ef071a5e'),
(280, 4, 120, 6, 0, 1, '2020-09-17 13:21:44', '2020-09-17 13:21:44', 'd7f87ee3-5c71-4c49-a5f5-fe9c2312986b'),
(281, 23, 121, 46, 0, 0, '2020-09-17 13:24:45', '2020-09-17 13:24:45', '20c7566e-c6a2-44d8-8747-52c7277c1c29'),
(282, 23, 121, 47, 0, 1, '2020-09-17 13:24:45', '2020-09-17 13:24:45', 'd0591e9e-1b65-4a8f-add0-02911c7a8171');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Asset', '2020-09-14 09:02:37', '2020-09-14 09:02:37', NULL, 'af55ffa5-563f-4486-90a3-56917c221a2e'),
(2, 'craft\\elements\\MatrixBlock', '2020-09-14 09:27:45', '2020-09-14 09:27:45', NULL, '8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e'),
(3, 'craft\\elements\\Category', '2020-09-14 09:29:04', '2020-09-14 09:29:04', NULL, '35feebdf-adbc-4185-8fb6-a9d56fb4e04f'),
(4, 'craft\\elements\\MatrixBlock', '2020-09-14 12:17:30', '2020-09-14 12:17:30', NULL, '9611d621-39a2-4327-8ea6-6ae603a43a0a'),
(5, 'craft\\elements\\Entry', '2020-09-14 12:18:08', '2020-09-14 12:18:08', NULL, '50894fd3-2b06-4ae6-9f0c-f0cb8c587053'),
(6, 'craft\\elements\\Entry', '2020-09-14 13:11:26', '2020-09-14 13:11:26', NULL, 'af1e2707-126a-41ae-a9c3-7feb5fb6156f'),
(7, 'craft\\elements\\MatrixBlock', '2020-09-14 13:20:45', '2020-09-14 13:20:45', NULL, '84de8783-8645-4ec6-962b-f06f4e6cd431'),
(8, 'craft\\elements\\Entry', '2020-09-14 13:26:30', '2020-09-14 13:26:30', NULL, '0f2e00b2-39a0-45d9-934d-5d163c1c1891'),
(9, 'craft\\elements\\GlobalSet', '2020-09-14 13:29:59', '2020-09-14 13:29:59', NULL, 'b70ca5f0-6f19-4193-927f-ff6c8c6c79ba'),
(10, 'craft\\elements\\Asset', '2020-09-14 13:36:03', '2020-09-14 13:36:03', NULL, '51568600-c417-4c6a-a5ad-ce9e73447a7e'),
(11, 'craft\\elements\\MatrixBlock', '2020-09-14 13:40:42', '2020-09-14 13:40:42', NULL, 'a4d55249-24ca-4108-bb78-5626a1a28f22'),
(12, 'craft\\elements\\MatrixBlock', '2020-09-14 13:40:43', '2020-09-14 13:40:43', NULL, '6dd56aec-4a50-4cc2-9720-751993a451df'),
(13, 'craft\\elements\\Entry', '2020-09-14 13:43:32', '2020-09-14 13:43:32', NULL, '1dfef4f7-4214-455a-8929-8a90ed2de632'),
(14, 'craft\\elements\\MatrixBlock', '2020-09-14 13:43:41', '2020-09-14 13:43:41', NULL, '29f993b9-acc7-4c69-93f0-715d74744d3c'),
(15, 'craft\\elements\\Entry', '2020-09-14 14:36:16', '2020-09-14 14:36:16', '2020-09-15 07:19:49', '99313874-6c4c-4a3a-9ffe-b61671be7c63'),
(16, 'craft\\elements\\Entry', '2020-09-15 08:06:49', '2020-09-15 08:06:49', NULL, '9fdf5b93-2e5d-4655-b219-5ad2d9d3817a'),
(17, 'craft\\elements\\MatrixBlock', '2020-09-16 12:48:00', '2020-09-16 12:48:00', NULL, '4bf384f5-b771-4741-8211-c3d03c75f739'),
(18, 'craft\\elements\\MatrixBlock', '2020-09-16 12:51:26', '2020-09-16 12:51:26', NULL, '44765ea7-b2af-4e1b-bc1a-917d50e56675'),
(19, 'craft\\elements\\Entry', '2020-09-16 13:03:46', '2020-09-16 13:03:46', NULL, '2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84'),
(20, 'craft\\elements\\Entry', '2020-09-16 13:19:20', '2020-09-16 13:19:20', NULL, 'b83fb6fd-c146-48a3-b240-25d8e72c900a'),
(21, 'craft\\elements\\Category', '2020-09-16 13:23:33', '2020-09-16 13:23:33', NULL, 'bf6432ed-a44f-4842-a41c-c7d3e3332e57'),
(22, 'craft\\elements\\Entry', '2020-09-16 13:27:54', '2020-09-16 13:27:54', NULL, '22b9e509-a583-4761-80cb-8053f690fd01'),
(23, 'craft\\elements\\MatrixBlock', '2020-09-16 14:11:26', '2020-09-16 14:11:26', NULL, 'ee02f3d9-7253-48bc-a3ce-c7b6a611e12e'),
(24, 'craft\\elements\\Entry', '2020-09-17 12:57:46', '2020-09-17 12:57:46', NULL, 'ae71e2a0-b399-464c-bb95-0d9199f0d7f9'),
(25, 'craft\\elements\\Entry', '2020-09-17 13:04:36', '2020-09-17 13:04:36', NULL, 'cb3278a8-2b36-4cf0-bf68-a11894c5f4fa'),
(26, 'craft\\elements\\MatrixBlock', '2020-09-17 13:06:01', '2020-09-17 13:06:01', NULL, '39b548bf-cadb-46aa-bda6-0905cbf7f7ba'),
(27, 'craft\\elements\\MatrixBlock', '2020-09-17 13:06:01', '2020-09-17 13:06:01', NULL, '4e79db3f-9f22-445a-8452-944e5981444b');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-09-14 09:02:37', '2020-09-14 09:02:37', '1a053c94-4e71-4b82-8655-18f5d0fac9ee'),
(2, 2, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"e2ef32d5-9e4a-4dd1-b376-0cab1161c731\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"7f75ae24-1798-42cc-8a41-ccf9de55c6b9\"}]', 1, '2020-09-14 09:27:45', '2020-09-14 09:27:45', '0ec68581-81bb-48bc-a100-830edd27cacd'),
(4, 3, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5b285790-8f09-4d88-9df8-230f175d34aa\"}]', 1, '2020-09-14 09:29:52', '2020-09-14 09:29:52', 'e8db0631-b9a2-4b16-8d8f-8fc39b0b690d'),
(11, 5, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0e88b4f5-9ec7-46e9-83a8-eea51f1f932e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"9f710753-6962-4083-a7bf-e359f9a3651b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f5da9f1e-a4a1-4a78-84c0-9728608c768f\"}]', 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', '93c06a69-d3b9-4d5d-9daf-8ec87db8fe5b'),
(16, 10, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2020-09-14 13:36:03', '2020-09-14 13:36:03', '6abd0369-1cea-4de0-ad16-8cb7e852d8d5'),
(31, 6, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e0f343f5-bf12-49eb-b74e-b89a08a92090\"}]', 1, '2020-09-14 13:48:02', '2020-09-14 13:48:02', '0cbd3c63-75cc-45fb-823b-0698e9ee55be'),
(37, 15, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"85e693d4-43fa-4350-9216-28f926cfa9bb\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5c91fda2-e84e-4484-bd53-c79ed3381b02\"}]', 1, '2020-09-14 14:37:24', '2020-09-14 14:37:24', '62e14eff-481c-4ff1-85fe-93bae7fb555c'),
(47, 16, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"85e693d4-43fa-4350-9216-28f926cfa9bb\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5c91fda2-e84e-4484-bd53-c79ed3381b02\"}]', 1, '2020-09-15 08:07:20', '2020-09-15 08:07:20', '12023029-e36f-44a1-87ac-45299d897d37'),
(55, 8, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5c91fda2-e84e-4484-bd53-c79ed3381b02\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1784873d-1ebf-4125-8d11-8c4ef2ac050d\"}]', 1, '2020-09-15 12:48:23', '2020-09-15 12:48:23', 'e93394f2-8220-4d1f-9a41-e30e24163527'),
(57, 13, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"85e693d4-43fa-4350-9216-28f926cfa9bb\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d98e34e6-36c6-40af-bee4-4adab40fad3c\"}]', 1, '2020-09-15 13:25:30', '2020-09-15 13:25:30', '7c490ec0-8aae-41be-88c9-c33ca93f6217'),
(62, 9, 'Labels', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2a3f8c96-0aee-410f-868f-a675681c471f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"23b45aa3-721a-4395-9c74-59d4a180aa45\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"401c58db-239b-49c7-b873-bd05fdafa11c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"52d20310-6f48-427b-b799-39a76175f78a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"40267a4d-a478-4f62-a3d4-146cf4b6b9ca\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e7f18898-8c9a-4955-9c1e-b38d5a880bf0\"}]', 1, '2020-09-15 13:29:21', '2020-09-15 13:29:21', 'a8305f8d-1948-4c40-803f-e1a832c639ca'),
(72, 18, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"02a56483-ffcf-4031-a54e-29966a07d174\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"384d078d-2f91-453a-abbd-909780a3dab9\"}]', 1, '2020-09-16 12:51:26', '2020-09-16 12:51:26', 'c618084b-21d4-40b4-8f9c-de4c6d0851dd'),
(81, 21, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5b285790-8f09-4d88-9df8-230f175d34aa\"}]', 1, '2020-09-16 13:23:33', '2020-09-16 13:23:33', '1c571d1e-44d1-434a-885f-07134dd7ea16'),
(83, 22, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f5fd202b-8a13-49c8-a6af-c542fb5c5fbf\"}]', 1, '2020-09-16 13:29:07', '2020-09-16 13:29:07', '46711225-8073-4cc3-8e2f-5fa54b409c04'),
(88, 20, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6b338a19-9dc3-4a10-9fa7-d324f5c60c4d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"80a2f56c-8091-4197-96f4-e6cb985dccde\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0e88b4f5-9ec7-46e9-83a8-eea51f1f932e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"9f710753-6962-4083-a7bf-e359f9a3651b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"315091b6-8d01-4b11-8790-47438044dbcf\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9\"}]', 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '45fddce1-5e80-4cce-8ae1-a8298e3d5ccb'),
(91, 19, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e12922f2-d58c-47c0-890e-5d5f5f1dc98b\"}]', 1, '2020-09-16 14:35:44', '2020-09-16 14:35:44', 'dbef4e58-aa1b-4ee2-b803-40ebcbaa1621'),
(106, 25, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3a6afe25-67a1-4b72-ae4c-12618a865d72\"}]', 1, '2020-09-17 13:05:44', '2020-09-17 13:05:44', '1586624b-ebc6-44fe-9e71-8b93fb1d66c6'),
(112, 24, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"\",\"instructions\":\"\",\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":\"Background image\",\"instructions\":\"\",\"tip\":null,\"warning\":null,\"required\":\"\",\"width\":100,\"fieldUid\":\"5c91fda2-e84e-4484-bd53-c79ed3381b02\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":\"Page blocks\",\"instructions\":\"\",\"tip\":null,\"warning\":null,\"required\":\"\",\"width\":100,\"fieldUid\":\"063f1856-6981-4caa-85ca-5a2842fe313f\"}]', 1, '2020-09-17 13:10:20', '2020-09-17 13:10:20', '3eb18154-5dd2-47d5-81ed-6e67659150d4'),
(113, 26, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f4a52dcb-b5c7-4620-9218-57c2f75e440b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"9c9768c2-5ef2-41b7-aa63-0ee058f5ab70\"}]', 1, '2020-09-17 13:11:47', '2020-09-17 13:11:47', 'b52836e4-3351-4ac9-b3aa-39b65f320d03'),
(114, 27, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"9b6f32dd-6e58-4258-84e1-39b72a26a406\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3518821f-2d9c-419f-9f6c-3457ca8e43fe\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f97713a1-0546-40e0-92ce-0df6a863b2ee\"}]', 1, '2020-09-17 13:11:47', '2020-09-17 13:11:47', 'a69ab652-acac-47a0-967c-8a6998381099'),
(115, 7, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"67223488-f1a2-4bf8-88f5-07ccee112531\"}]', 1, '2020-09-17 13:18:32', '2020-09-17 13:18:32', '85b4bff4-f286-4a46-a91b-59c8a8c848c1'),
(116, 11, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"9080de68-bd02-456a-a32d-8f0e68117450\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"81db77d5-72c6-412d-829c-df7ea50eec4f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5d923d4a-e3ba-499c-9818-9209946aecba\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"20c25c0f-575a-4351-bdd6-627a65e29b93\"}]', 1, '2020-09-17 13:18:32', '2020-09-17 13:18:32', '32d6d16c-56fd-4713-8a13-eb2445d73f93'),
(117, 12, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"401d8e85-f282-41aa-b599-9a1b5c40ff4d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"60828b3b-af20-45e7-a350-412a29e33865\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b97a18e5-d60b-4ab8-ad55-570d492e9314\"}]', 1, '2020-09-17 13:18:32', '2020-09-17 13:18:32', '5e80d0d2-8ad3-4c94-be4c-4831b8f201d2'),
(118, 14, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fb882e52-164e-429c-abc7-3c9de80d2d5c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"df979902-a677-4079-a560-07c547adeb8c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7e31abf0-d327-4e55-9301-863a2fd1c854\"}]', 1, '2020-09-17 13:18:32', '2020-09-17 13:18:32', '2828f111-3a0e-4df3-a878-9afbd800b8a2'),
(119, 17, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"21e60286-b5c2-44b9-95f1-93ca5d85fbc9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"a7c33f69-9eb3-4886-aaa3-f5e7753de473\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d99fd25f-dba2-409c-9722-a6f250396b6c\"}]', 1, '2020-09-17 13:18:33', '2020-09-17 13:18:33', 'e46da61e-1bd3-489d-b086-8ad96659b993'),
(120, 4, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4a1775f7-e4ce-407f-b568-7fb63d019a03\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"19dd2ee0-1bff-4667-a021-39a787224265\"}]', 1, '2020-09-17 13:21:44', '2020-09-17 13:21:44', 'b1ad3d09-ec78-43d9-b079-d0276b6e8918'),
(121, 23, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6afa1bc1-7908-4558-aa63-69cc006ff789\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d3ab2053-a86a-4b83-8ab5-8d7d99044d80\"}]', 1, '2020-09-17 13:24:45', '2020-09-17 13:24:45', '1c2129c7-128e-4877-aca3-ee8ee455fe31');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Image', 'image', 'global', '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2020-09-14 09:03:40', '2020-09-15 13:42:02', '5c91fda2-e84e-4484-bd53-c79ed3381b02'),
(2, 1, 'Topic', 'topic', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_topic}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-09-14 09:27:45', '2020-09-14 09:27:45', '5b285790-8f09-4d88-9df8-230f175d34aa'),
(3, NULL, 'Topic url', 'topicUrl', 'matrixBlockType:b8e10694-8207-4a73-8690-01ee91089398', '', 0, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":\"255\",\"placeholder\":\"\"}', '2020-09-14 09:27:45', '2020-09-14 09:27:45', '7f75ae24-1798-42cc-8a41-ccf9de55c6b9'),
(4, NULL, 'Topic name', 'topicName', 'matrixBlockType:b8e10694-8207-4a73-8690-01ee91089398', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-14 09:27:45', '2020-09-14 09:27:45', 'e2ef32d5-9e4a-4dd1-b376-0cab1161c731'),
(5, 1, 'Social networks', 'socialNetworks', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_socialnetworks}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-09-14 12:17:30', '2020-09-14 12:17:30', '160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9'),
(6, NULL, 'URL', 'socialLink', 'matrixBlockType:88f0f88c-1b50-4e34-9a0b-63b83b821f4e', 'Enter the URL to your social network page', 0, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":\"255\",\"placeholder\":\"\"}', '2020-09-14 12:17:30', '2020-09-17 13:21:44', '19dd2ee0-1bff-4667-a021-39a787224265'),
(7, NULL, 'Social network', 'socialIcon', 'matrixBlockType:88f0f88c-1b50-4e34-9a0b-63b83b821f4e', 'Choose a social network', 0, 'none', NULL, 'craft\\fields\\Dropdown', '{\"optgroups\":true,\"options\":[{\"label\":\"Facebook\",\"value\":\"fa fa-facebook-square\",\"default\":\"\"},{\"label\":\"Twitter\",\"value\":\"fa fa-twitter\",\"default\":\"\"},{\"label\":\"Youtube\",\"value\":\"fa fa-youtube-play\",\"default\":\"\"},{\"label\":\"Instagram\",\"value\":\"fa fa-instagram\",\"default\":\"\"},{\"label\":\"Linked In\",\"value\":\"fa fa-linkedin\",\"default\":\"\"}]}', '2020-09-14 12:17:30', '2020-09-17 13:21:44', '4a1775f7-e4ce-407f-b568-7fb63d019a03'),
(8, 1, 'Header category', 'headerCategory', 'global', '', 0, 'site', NULL, 'craft\\fields\\Categories', '{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"1\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:3a7eb026-21bc-4104-8b48-f870b7d9b8d6\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-09-14 12:26:42', '2020-09-14 12:27:33', 'f5da9f1e-a4a1-4a78-84c0-9728608c768f'),
(9, 1, 'Logo', 'logo', 'global', '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2020-09-14 12:40:34', '2020-09-14 12:40:34', '0e88b4f5-9ec7-46e9-83a8-eea51f1f932e'),
(10, 1, 'EU text', 'euText', 'global', '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2020-09-14 12:41:25', '2020-09-14 12:41:25', '9f710753-6962-4083-a7bf-e359f9a3651b'),
(11, 1, 'Homepage blocks', 'homepageBlocks', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_homepageblocks}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-09-14 13:20:45', '2020-09-14 13:20:45', 'e0f343f5-bf12-49eb-b74e-b89a08a92090'),
(15, 1, 'More info label', 'moreInfoLabel', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-14 13:29:05', '2020-09-14 13:29:05', '2a3f8c96-0aee-410f-868f-a675681c471f'),
(16, 1, 'Learn more label', 'learnMoreLabel', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-14 13:29:14', '2020-09-14 13:29:14', '23b45aa3-721a-4395-9c74-59d4a180aa45'),
(17, 1, 'Show more label', 'showMoreLabel', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-14 13:29:25', '2020-09-14 13:29:25', '401c58db-239b-49c7-b873-bd05fdafa11c'),
(18, NULL, 'Image', 'imageArticle', 'matrixBlockType:44662993-89d8-4367-a0b2-9d96e062eeb3', '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2020-09-14 13:40:42', '2020-09-14 13:51:22', '20c25c0f-575a-4351-bdd6-627a65e29b93'),
(19, NULL, 'Description', 'descriptionArticle', 'matrixBlockType:44662993-89d8-4367-a0b2-9d96e062eeb3', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-14 13:40:42', '2020-09-14 13:40:42', '5d923d4a-e3ba-499c-9818-9209946aecba'),
(20, NULL, 'Subtitle', 'subtitleArticle', 'matrixBlockType:44662993-89d8-4367-a0b2-9d96e062eeb3', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-14 13:40:42', '2020-09-14 13:40:42', '81db77d5-72c6-412d-829c-df7ea50eec4f'),
(21, NULL, 'Title', 'titleArticle', 'matrixBlockType:44662993-89d8-4367-a0b2-9d96e062eeb3', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-14 13:40:42', '2020-09-14 13:40:42', '9080de68-bd02-456a-a32d-8f0e68117450'),
(22, NULL, 'Title', 'titlePresentation', 'matrixBlockType:0fa09bda-4927-413e-912c-dacd1a5d3d95', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-14 13:40:43', '2020-09-14 13:40:43', '401d8e85-f282-41aa-b599-9a1b5c40ff4d'),
(23, NULL, 'Description', 'descriptionPresentation', 'matrixBlockType:0fa09bda-4927-413e-912c-dacd1a5d3d95', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-14 13:40:43', '2020-09-14 13:40:43', '60828b3b-af20-45e7-a350-412a29e33865'),
(24, NULL, 'Presentation section', 'presentationSection', 'matrixBlockType:0fa09bda-4927-413e-912c-dacd1a5d3d95', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"4\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":[\"section:7d39eb22-1737-4478-9f1d-2a40252eb160\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-09-14 13:40:43', '2020-09-14 13:40:43', 'b97a18e5-d60b-4ab8-ad55-570d492e9314'),
(26, NULL, 'Description', 'descriptionEvents', 'matrixBlockType:cbeed6a9-78e6-436a-ad97-4dadf7fc5d11', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-14 13:43:41', '2020-09-14 13:43:41', 'df979902-a677-4079-a560-07c547adeb8c'),
(27, NULL, 'Title', 'titleEvents', 'matrixBlockType:cbeed6a9-78e6-436a-ad97-4dadf7fc5d11', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-14 13:43:41', '2020-09-14 13:43:41', 'fb882e52-164e-429c-abc7-3c9de80d2d5c'),
(28, NULL, 'Event section', 'eventSection', 'matrixBlockType:cbeed6a9-78e6-436a-ad97-4dadf7fc5d11', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":[\"section:c7fec439-ba6f-4143-9a75-eac421fb0280\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-09-14 13:47:43', '2020-09-16 08:38:21', '7e31abf0-d327-4e55-9301-863a2fd1c854'),
(29, 1, 'Subtitle', 'subtitle', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-14 14:37:04', '2020-09-14 14:37:04', '85e693d4-43fa-4350-9216-28f926cfa9bb'),
(30, NULL, 'Slide', 'hero', 'matrixBlockType:3cc89c3b-1c24-480b-8a29-84e84ad27ee1', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"3\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":[\"section:ef251137-89c9-4576-aa61-14697e629903\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-09-15 07:19:37', '2020-09-17 13:18:32', '67223488-f1a2-4bf8-88f5-07ccee112531'),
(32, 1, 'pdfPresentation', 'pdfpresentation', 'global', '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:6175f870-5bd3-44ef-a8b4-7066f710a2a3\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2020-09-15 12:47:57', '2020-09-15 13:42:42', '1784873d-1ebf-4125-8d11-8c4ef2ac050d'),
(33, 1, 'Poster presentation label', 'posterPresentationLabel', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-15 12:48:45', '2020-09-15 12:48:45', '52d20310-6f48-427b-b799-39a76175f78a'),
(34, 1, 'Event date', 'eventDate', 'global', '', 0, 'none', NULL, 'craft\\fields\\Date', '{\"max\":null,\"min\":null,\"minuteIncrement\":\"30\",\"showDate\":true,\"showTime\":false}', '2020-09-15 13:25:11', '2020-09-15 13:25:11', 'd98e34e6-36c6-40af-bee4-4adab40fad3c'),
(35, 1, 'More details label', 'moreDetailsLabel', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-15 13:28:52', '2020-09-15 13:28:52', '40267a4d-a478-4f62-a3d4-146cf4b6b9ca'),
(36, 1, 'Show events label', 'showEventsLabel', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-15 13:29:05', '2020-09-15 13:29:05', 'e7f18898-8c9a-4955-9c1e-b38d5a880bf0'),
(37, NULL, 'Video title', 'videoTitle', 'matrixBlockType:b37ce238-1d49-4e49-9112-eb0ca6e0878f', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-16 12:48:00', '2020-09-16 13:05:25', 'a7c33f69-9eb3-4886-aaa3-f5e7753de473'),
(38, 1, 'Video', 'video', 'global', '', 0, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":\"255\",\"placeholder\":\"\"}', '2020-09-16 12:51:26', '2020-09-16 13:06:50', 'e12922f2-d58c-47c0-890e-5d5f5f1dc98b'),
(39, NULL, 'Video title', 'videoTitle', 'matrixBlockType:69b98422-b52a-448b-b51e-774bb1a1d8fe', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-16 12:51:26', '2020-09-16 12:51:26', '02a56483-ffcf-4031-a54e-29966a07d174'),
(40, NULL, 'Video url', 'videoUrl', 'matrixBlockType:69b98422-b52a-448b-b51e-774bb1a1d8fe', '', 0, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":\"255\",\"placeholder\":\"\"}', '2020-09-16 12:51:26', '2020-09-16 12:51:26', '384d078d-2f91-453a-abbd-909780a3dab9'),
(41, NULL, 'Video url', 'videoUrl', 'matrixBlockType:b37ce238-1d49-4e49-9112-eb0ca6e0878f', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"3\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":[\"section:093c3fe9-83bd-41d7-a933-c3e656f3574c\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-09-16 13:05:25', '2020-09-16 13:05:25', 'd99fd25f-dba2-409c-9722-a6f250396b6c'),
(42, 1, 'Footer category', 'footerCategory', 'global', '', 0, 'site', NULL, 'craft\\fields\\Categories', '{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:de77b476-6dea-4810-8fdb-0e13f7783b51\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-09-16 13:20:29', '2020-09-16 13:34:33', '80a2f56c-8091-4197-96f4-e6cb985dccde'),
(43, 1, 'Document', 'document', 'global', '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:6175f870-5bd3-44ef-a8b4-7066f710a2a3\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2020-09-16 13:28:43', '2020-09-16 13:28:43', 'f5fd202b-8a13-49c8-a6af-c542fb5c5fbf'),
(44, 1, 'Footer docs', 'footerDocs', 'global', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":[\"section:4536c42b-f61b-49b7-a666-1bdbdf3d3bb8\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-09-16 13:29:42', '2020-09-16 13:29:42', '315091b6-8d01-4b11-8790-47438044dbcf'),
(45, 1, 'Share page', 'sharePage', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_sharepage}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-09-16 14:11:25', '2020-09-16 14:11:25', '6b338a19-9dc3-4a10-9fa7-d324f5c60c4d'),
(46, NULL, 'Social network', 'socialIcon', 'matrixBlockType:e32094d0-88fd-461d-a24a-a3bcf59b4922', 'Choose a social network', 0, 'none', NULL, 'craft\\fields\\Dropdown', '{\"optgroups\":true,\"options\":[{\"label\":\"Facebook\",\"value\":\"fa fa-facebook-square\",\"default\":\"\"},{\"label\":\"Twitter\",\"value\":\"fa fa-twitter\",\"default\":\"\"},{\"label\":\"LinkedIn\",\"value\":\"fa fa-linkedin-square\",\"default\":\"\"}]}', '2020-09-16 14:11:26', '2020-09-17 13:24:45', '6afa1bc1-7908-4558-aa63-69cc006ff789'),
(47, NULL, 'URL', 'socialUrl', 'matrixBlockType:e32094d0-88fd-461d-a24a-a3bcf59b4922', 'Enter the URL to your social network page', 0, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":\"255\",\"placeholder\":\"\"}', '2020-09-16 14:11:26', '2020-09-17 13:24:45', 'd3ab2053-a86a-4b83-8ab5-8d7d99044d80'),
(48, NULL, 'Background image', 'videoImage', 'matrixBlockType:b37ce238-1d49-4e49-9112-eb0ca6e0878f', '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2020-09-16 14:36:36', '2020-09-16 14:36:36', '21e60286-b5c2-44b9-95f1-93ca5d85fbc9'),
(49, 1, 'Description', 'description', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-17 13:05:24', '2020-09-17 13:05:24', '3a6afe25-67a1-4b72-ae4c-12618a865d72'),
(50, 1, 'About page blocks', 'aboutPageBlocks', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_aboutpageblocks}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2020-09-17 13:06:00', '2020-09-17 13:06:00', '063f1856-6981-4caa-85ca-5a2842fe313f'),
(51, NULL, 'Description', 'descriptionAbout', 'matrixBlockType:571684f8-3bd9-41b0-b85b-af936bb0900a', '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}', '2020-09-17 13:06:01', '2020-09-17 13:06:01', '9c9768c2-5ef2-41b7-aa63-0ee058f5ab70'),
(52, NULL, 'Title', 'titleAbout', 'matrixBlockType:571684f8-3bd9-41b0-b85b-af936bb0900a', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-17 13:06:01', '2020-09-17 13:06:01', 'f4a52dcb-b5c7-4620-9218-57c2f75e440b'),
(53, NULL, 'Description', 'descriptionLearnMore', 'matrixBlockType:80f0a9a1-95df-4f12-a999-dd6b2a758b6b', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-17 13:06:01', '2020-09-17 13:06:01', '3518821f-2d9c-419f-9f6c-3457ca8e43fe'),
(54, NULL, 'Title', 'titleLearnMore', 'matrixBlockType:80f0a9a1-95df-4f12-a999-dd6b2a758b6b', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2020-09-17 13:06:01', '2020-09-17 13:06:01', '9b6f32dd-6e58-4258-84e1-39b72a26a406'),
(55, NULL, 'Cards', 'cardsAbout', 'matrixBlockType:80f0a9a1-95df-4f12-a999-dd6b2a758b6b', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"3\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":[\"section:ddaf32a5-8670-415d-8b4c-8118092a7fd4\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2020-09-17 13:07:09', '2020-09-17 13:07:09', 'f97713a1-0546-40e0-92ce-0df6a863b2ee');

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `globalsets`
--

INSERT INTO `globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(72, 'Layout', 'layout', 9, '2020-09-14 13:29:59', '2020-09-14 13:29:59', 'ab3d7b93-6d92-450e-b53c-0489232a17d7');

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.5.10.1', '3.5.13', 0, 'wcdbeugbvusg', 'lnwjsvohddqd', '2020-09-14 08:05:25', '2020-09-17 13:28:15', 'dc7e69a2-ddf3-4f42-8abe-f417f3cf96b3');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixblocks`
--

INSERT INTO `matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 2, 2, 1, 1, NULL, '2020-09-14 09:33:05', '2020-09-14 09:33:05', '1f1753de-6849-4192-bca5-f05e6ad51a2e'),
(4, 2, 2, 1, 2, NULL, '2020-09-14 09:33:05', '2020-09-14 09:33:05', 'a3c877f7-0d6b-4973-8dd8-4419651a468e'),
(5, 2, 2, 1, 3, NULL, '2020-09-14 09:33:05', '2020-09-14 09:33:05', 'feaff26a-54c1-4120-903c-eeaf5cab296e'),
(6, 2, 2, 1, 4, NULL, '2020-09-14 09:33:05', '2020-09-14 09:33:05', '987b9114-9279-4dcf-9f67-d70871fc7e1f'),
(8, 7, 2, 1, 1, 1, '2020-09-14 09:35:42', '2020-09-14 09:35:42', '8ec52d5f-e944-41c4-91ab-f8391c23aac1'),
(9, 7, 2, 1, 2, 1, '2020-09-14 09:35:42', '2020-09-14 09:35:42', 'e0204d41-6cb1-478c-8d77-a6baf8480a6d'),
(10, 7, 2, 1, 3, 1, '2020-09-14 09:35:42', '2020-09-14 09:35:42', '673d338e-da6f-465f-ad72-7ddd053459bb'),
(14, 11, 5, 2, 1, NULL, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '8f8276a6-01e1-4104-a8c8-6c344ea8f92f'),
(15, 11, 5, 2, 2, NULL, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '7e90921c-f167-4d6c-bc03-8bf829b90549'),
(16, 11, 5, 2, 3, NULL, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '6543b655-b598-46e6-b32a-297b9727cc8f'),
(17, 11, 5, 2, 4, NULL, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '8dd9b58b-0a8f-4805-8c38-92d057f9b413'),
(19, 18, 5, 2, 1, NULL, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '48f3f064-f1cd-4a74-bd37-f6fc18c7a78b'),
(20, 18, 5, 2, 2, NULL, '2020-09-14 12:21:28', '2020-09-14 12:21:28', 'fa15b7c1-fe21-4e7f-8d4a-beef2c8f6275'),
(21, 18, 5, 2, 3, NULL, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '40bf8158-4f1d-49ac-b797-537bdebe3d7d'),
(22, 18, 5, 2, 4, NULL, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '1c0a4bc6-5aae-48c0-8339-08cc446aeacd'),
(24, 23, 5, 2, 1, NULL, '2020-09-14 12:22:15', '2020-09-14 12:22:15', '7873a12b-4baf-44c2-9605-d1bd7afae53b'),
(25, 23, 5, 2, 2, NULL, '2020-09-14 12:22:15', '2020-09-14 12:22:15', '90e564ea-850d-46a2-9c67-19553d84abf6'),
(26, 23, 5, 2, 3, NULL, '2020-09-14 12:22:15', '2020-09-14 12:22:15', '02c3f893-2c99-4dd6-824f-87d4bc1f22dd'),
(27, 23, 5, 2, 4, NULL, '2020-09-14 12:22:15', '2020-09-14 12:22:15', '717b04e2-7fae-4440-a51d-e85adb0160de'),
(29, 28, 5, 2, 1, NULL, '2020-09-14 12:26:53', '2020-09-14 12:26:53', '94bc4c40-04fb-4c1a-baed-06ad46bd4eef'),
(30, 28, 5, 2, 2, NULL, '2020-09-14 12:26:53', '2020-09-14 12:26:53', 'aefc459a-2856-40d7-a59b-255cc5f5257b'),
(31, 28, 5, 2, 3, NULL, '2020-09-14 12:26:53', '2020-09-14 12:26:53', '6b93859f-c85f-494f-8004-1ecb54efe99c'),
(32, 28, 5, 2, 4, NULL, '2020-09-14 12:26:53', '2020-09-14 12:26:53', 'fafaa9ac-4066-4bf2-b3b2-2d3f38a0221a'),
(34, 33, 5, 2, 1, NULL, '2020-09-14 12:27:09', '2020-09-14 12:27:09', '96f4a905-ae44-42bd-982c-e9b337a7d7f7'),
(35, 33, 5, 2, 2, NULL, '2020-09-14 12:27:09', '2020-09-14 12:27:09', '50721088-e932-4b07-a23f-b4238918703b'),
(36, 33, 5, 2, 3, NULL, '2020-09-14 12:27:09', '2020-09-14 12:27:09', '1294f7cf-7bf2-4399-bcc3-9169ef53a804'),
(37, 33, 5, 2, 4, NULL, '2020-09-14 12:27:09', '2020-09-14 12:27:09', '00f1965e-2ac2-47a9-bfbe-f96fd68fc33d'),
(41, 40, 5, 2, 1, NULL, '2020-09-14 12:29:22', '2020-09-14 12:29:22', '0650ae3c-9dde-40c6-8859-25d56aa7f038'),
(42, 40, 5, 2, 2, NULL, '2020-09-14 12:29:22', '2020-09-14 12:29:22', '6fa3019e-ea01-477b-be5b-ac9e2395f83f'),
(43, 40, 5, 2, 3, NULL, '2020-09-14 12:29:22', '2020-09-14 12:29:22', 'dc9bc136-b6aa-49e0-87f0-365376bb3611'),
(44, 40, 5, 2, 4, NULL, '2020-09-14 12:29:22', '2020-09-14 12:29:22', '34746001-0a76-405d-a94e-70b3e3deb427'),
(46, 45, 5, 2, 1, NULL, '2020-09-14 12:34:38', '2020-09-14 12:34:38', '018e551c-cf6b-4f2e-bc38-812bcc3b8d0a'),
(47, 45, 5, 2, 2, NULL, '2020-09-14 12:34:38', '2020-09-14 12:34:38', 'de38cd16-24bc-4833-b07b-51dc558fa21a'),
(48, 45, 5, 2, 3, NULL, '2020-09-14 12:34:38', '2020-09-14 12:34:38', '0b8d95d9-2451-4f35-853e-38cdd1a85a95'),
(49, 45, 5, 2, 4, NULL, '2020-09-14 12:34:38', '2020-09-14 12:34:38', 'e7ac0a6b-af13-4860-88de-a53634b6bf21'),
(51, 50, 5, 2, 1, NULL, '2020-09-14 12:40:48', '2020-09-14 12:40:48', '67580ab9-4ab0-4150-95b3-7fb16afe456a'),
(52, 50, 5, 2, 2, NULL, '2020-09-14 12:40:48', '2020-09-14 12:40:48', '22e7d0ac-d950-4643-9f0b-abe177563a19'),
(53, 50, 5, 2, 3, NULL, '2020-09-14 12:40:48', '2020-09-14 12:40:48', '3f80486d-d1f8-457c-b554-7fef3fa511c5'),
(54, 50, 5, 2, 4, NULL, '2020-09-14 12:40:48', '2020-09-14 12:40:48', '0e155ec5-61ed-4a2f-9d48-a0a6af1f29e9'),
(56, 55, 5, 2, 1, NULL, '2020-09-14 12:41:00', '2020-09-14 12:41:00', '9385c43e-547a-4b32-a3b5-fd40190884ec'),
(57, 55, 5, 2, 2, NULL, '2020-09-14 12:41:00', '2020-09-14 12:41:00', 'ebcadcad-4d0b-4b4c-a125-f4a9f94486a8'),
(58, 55, 5, 2, 3, NULL, '2020-09-14 12:41:00', '2020-09-14 12:41:00', '88e52a95-f9d1-4eab-84aa-db37336282ab'),
(59, 55, 5, 2, 4, NULL, '2020-09-14 12:41:00', '2020-09-14 12:41:00', '7108221e-634f-406e-b398-95664adf4de4'),
(61, 60, 5, 2, 1, NULL, '2020-09-14 12:41:37', '2020-09-14 12:41:37', 'ff39247f-80c5-47a6-98d2-776fd1794220'),
(62, 60, 5, 2, 2, NULL, '2020-09-14 12:41:37', '2020-09-14 12:41:37', '42753d6a-9a13-45b0-bd68-e62088d1b66e'),
(63, 60, 5, 2, 3, NULL, '2020-09-14 12:41:37', '2020-09-14 12:41:37', 'bdf35c8c-011f-45ef-b21d-3f5c6cc9f0cc'),
(64, 60, 5, 2, 4, NULL, '2020-09-14 12:41:37', '2020-09-14 12:41:37', '4355dbe3-301e-48bf-b26d-ff7559aa5860'),
(66, 65, 5, 2, 1, NULL, '2020-09-14 12:41:48', '2020-09-14 12:41:48', 'fe7412db-b9f9-4c56-904d-1c29e5cd0ae2'),
(67, 65, 5, 2, 2, NULL, '2020-09-14 12:41:48', '2020-09-14 12:41:48', '7cd0e658-ebb0-4b03-bf30-239d0a901f42'),
(68, 65, 5, 2, 3, NULL, '2020-09-14 12:41:49', '2020-09-14 12:41:49', 'f5d79117-d5b6-4734-b90c-df4ffff15693'),
(69, 65, 5, 2, 4, NULL, '2020-09-14 12:41:49', '2020-09-14 12:41:49', '6f505777-0e29-4f3a-98eb-1cfeedee33e0'),
(82, 70, 11, 3, 1, NULL, '2020-09-14 14:12:07', '2020-09-14 14:12:07', '06be00f1-f79b-4735-b9cd-c794564efb5c'),
(84, 83, 11, 3, 1, NULL, '2020-09-14 14:12:07', '2020-09-14 14:12:07', '434fc731-62b0-43d7-b6ee-07d2d02b889e'),
(85, 70, 11, 3, 2, 0, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '9585c79b-9a31-4374-92fa-5694df6cd137'),
(86, 70, 11, 3, 3, 0, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '070ab919-430a-4d73-a21c-9983f74932d9'),
(88, 87, 11, 3, 1, NULL, '2020-09-14 14:14:07', '2020-09-14 14:14:07', 'd20d2d87-325c-4f14-8f88-b28253f0e763'),
(89, 87, 11, 3, 2, NULL, '2020-09-14 14:14:07', '2020-09-14 14:14:07', 'f8f5bcb1-a8a6-4db2-ba89-77731300e57e'),
(90, 87, 11, 3, 3, NULL, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '8e1b7a02-faf3-4c93-abae-c7dddeb156ba'),
(98, 97, 11, 3, 1, NULL, '2020-09-14 14:42:18', '2020-09-14 14:42:18', '1ef9123d-0569-4dc9-83fc-7bfab0c9a25c'),
(100, 99, 11, 3, 1, NULL, '2020-09-15 07:37:55', '2020-09-15 07:37:55', 'b4229907-088f-4159-8644-42057c87b027'),
(101, 70, 11, 3, 2, 0, '2020-09-15 07:38:22', '2020-09-15 07:38:22', 'ef07c7c2-af17-43da-9159-f46100d55942'),
(103, 102, 11, 3, 1, NULL, '2020-09-15 07:38:22', '2020-09-15 07:38:22', 'f20bf16e-d173-4759-af23-2e6942c265e2'),
(104, 102, 11, 3, 2, NULL, '2020-09-15 07:38:22', '2020-09-15 07:38:22', '245edcfd-0e09-4c67-b593-8d2fe39900e0'),
(112, 111, 11, 3, 1, NULL, '2020-09-15 08:09:22', '2020-09-15 08:09:22', 'add212e9-21ff-4f9f-8663-7f15b3671789'),
(114, 113, 5, 2, 1, NULL, '2020-09-15 10:25:22', '2020-09-15 10:25:22', 'baccfbc6-9282-49b2-9612-5bb12bd47ad2'),
(115, 113, 5, 2, 2, NULL, '2020-09-15 10:25:22', '2020-09-15 10:25:22', 'f360182c-aa89-4258-a3ae-2f8ae4bae0d7'),
(116, 113, 5, 2, 3, NULL, '2020-09-15 10:25:22', '2020-09-15 10:25:22', '40736721-c64c-4b05-95d2-2e10f68ee87c'),
(117, 113, 5, 2, 4, NULL, '2020-09-15 10:25:22', '2020-09-15 10:25:22', 'd39c7240-c33a-4ede-8626-6dfd3630d819'),
(119, 70, 11, 4, 2, NULL, '2020-09-15 12:12:02', '2020-09-15 12:12:02', '2d4d0c25-5cd6-4fe9-9263-c1e82ab4fc75'),
(121, 120, 11, 3, 1, NULL, '2020-09-15 12:12:02', '2020-09-15 12:12:02', 'b767ed45-4aeb-465b-b13a-03576c5dee17'),
(122, 120, 11, 4, 2, NULL, '2020-09-15 12:12:02', '2020-09-15 12:12:02', '5bfb5b9b-5bf4-468a-99d0-c7ef9628d3a5'),
(132, 70, 11, 5, 3, NULL, '2020-09-15 13:03:53', '2020-09-15 14:13:14', '925679c3-9536-4e64-8d09-810aa25e9197'),
(134, 133, 11, 3, 1, NULL, '2020-09-15 13:03:53', '2020-09-15 13:03:53', 'db4125bb-0ed1-4ffe-972a-8631180805f4'),
(135, 133, 11, 4, 2, NULL, '2020-09-15 13:03:53', '2020-09-15 13:03:53', '60e65078-5e8c-4ec9-ae38-9f5b100cf86c'),
(136, 133, 11, 5, 3, NULL, '2020-09-15 13:03:53', '2020-09-15 13:03:53', 'ce8358e9-d949-4df5-b307-56e5a6b7ff36'),
(139, 138, 11, 3, 1, NULL, '2020-09-15 13:12:36', '2020-09-15 13:12:36', '45d0fd87-79a8-46c7-8b18-9db05db1d2e6'),
(140, 138, 11, 4, 2, NULL, '2020-09-15 13:12:36', '2020-09-15 13:12:36', '12cbfe78-d284-43c5-a53e-e833095d4cbe'),
(141, 138, 11, 5, 3, NULL, '2020-09-15 13:12:36', '2020-09-15 13:12:36', '56d57ae2-04bc-455c-b75d-cb1f6ef8ecc6'),
(150, 149, 11, 3, 1, NULL, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '08dee988-525c-4d66-af12-cc55b8eada05'),
(151, 149, 11, 4, 2, NULL, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '2511f95d-381d-4971-9e15-26896cf1693f'),
(152, 149, 11, 5, 3, NULL, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '42ce5d59-492d-4296-9dcc-d5ee5fef2c06'),
(154, 153, 11, 3, 1, NULL, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '8f6869ef-a195-42eb-9b14-ee242f9adda7'),
(155, 153, 11, 4, 2, NULL, '2020-09-15 13:44:55', '2020-09-15 13:44:55', 'aab6f5d9-3df1-4dc0-81a4-b91be9e5bbc3'),
(156, 153, 11, 5, 3, NULL, '2020-09-15 13:44:55', '2020-09-15 13:44:55', 'e135a6cb-5e70-435e-bd52-0805d06cb9a9'),
(157, 70, 11, 3, 3, 0, '2020-09-15 14:09:54', '2020-09-15 14:12:47', '1eeb193c-9776-44f1-b54f-9dc09eae2025'),
(159, 158, 11, 3, 1, NULL, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '99fae6a4-49d9-43db-b09f-87c796639a98'),
(160, 158, 11, 4, 2, NULL, '2020-09-15 14:09:54', '2020-09-15 14:09:54', 'bf210930-4df5-4479-8913-1b6068fa744f'),
(161, 158, 11, 5, 3, NULL, '2020-09-15 14:09:54', '2020-09-15 14:09:54', 'df540e22-60d4-47ef-aa24-93dccffbd0ca'),
(162, 158, 11, 3, 4, NULL, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '98963c2e-5636-4e5c-936d-6c6866eb0568'),
(164, 163, 11, 3, 1, NULL, '2020-09-15 14:12:47', '2020-09-15 14:12:47', 'a1419ce9-71ee-4a22-a57a-34cb3696ea30'),
(165, 163, 11, 4, 2, NULL, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '9c1f6c9f-4fae-4489-8a7c-b93b81cbe393'),
(166, 163, 11, 3, 3, NULL, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '530e5174-fd24-4ddc-b2a7-5d23d8f99e0f'),
(167, 163, 11, 5, 4, NULL, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '34ce1ef2-de5e-4405-ae61-9536fe101a89'),
(169, 168, 11, 3, 1, NULL, '2020-09-15 14:13:14', '2020-09-15 14:13:14', '02836b93-6f87-4c1d-8d52-f90a5412fef3'),
(170, 168, 11, 4, 2, NULL, '2020-09-15 14:13:14', '2020-09-15 14:13:14', '110f5cb4-089a-4b9d-8b06-733a072e8d98'),
(171, 168, 11, 5, 3, NULL, '2020-09-15 14:13:14', '2020-09-15 14:13:14', '9ff61d09-52de-48dd-94e2-875d871b2aa6'),
(179, 70, 11, 6, 4, NULL, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '303460f1-fa66-4748-ac19-55530174cca3'),
(181, 180, 11, 3, 1, NULL, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'd703f778-9a0d-428e-958b-0ee8384d32ad'),
(182, 180, 11, 4, 2, NULL, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'f18a445b-5884-461e-bb0b-96720dd06bc6'),
(183, 180, 11, 5, 3, NULL, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '208ac17b-dfaa-4f18-a3bf-7c710bb7608a'),
(184, 180, 11, 6, 4, NULL, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'ac739cae-2e1c-4dfc-a7af-798c76f68cc3'),
(188, 187, 11, 3, 1, NULL, '2020-09-16 08:38:50', '2020-09-16 08:38:50', 'eca7cce9-b874-4209-92d2-df33551ceff5'),
(189, 187, 11, 4, 2, NULL, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '2f745074-b79a-4dc0-8c44-e6435b23f90e'),
(190, 187, 11, 5, 3, NULL, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '2f1160b9-874b-4dce-b9b3-3598f7348a70'),
(191, 187, 11, 6, 4, NULL, '2020-09-16 08:38:50', '2020-09-16 08:38:50', 'c50c4404-3728-46dc-b881-71d32043416e'),
(197, 196, 11, 3, 1, NULL, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '68a90725-344e-4ccb-ae97-d85d0b6a0a72'),
(198, 196, 11, 4, 2, NULL, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'ca9e80a9-3dba-4992-aadb-3e68f3d7f920'),
(199, 196, 11, 5, 3, NULL, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'e35902e6-ddf9-43ba-bd84-896d3ad07af7'),
(200, 196, 11, 6, 4, NULL, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'f848d618-9e79-46b1-8b49-5bd2ece1ee8d'),
(201, 70, 11, 7, 5, NULL, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '32acc878-9de6-49a5-b7d8-9415fad11eb1'),
(203, 202, 11, 3, 1, NULL, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '6bc28044-6ee3-43f9-b9ed-64d5ff23ee90'),
(204, 202, 11, 4, 2, NULL, '2020-09-16 12:48:16', '2020-09-16 12:48:16', 'fa17764f-92f0-47c5-a332-d14493fce627'),
(205, 202, 11, 5, 3, NULL, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '368348a1-fb1c-499b-a258-841949319cf4'),
(206, 202, 11, 6, 4, NULL, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '2f7c9d4e-cbdb-476b-96d7-b7af4def5ccc'),
(207, 202, 11, 7, 5, NULL, '2020-09-16 12:48:16', '2020-09-16 12:48:16', 'f01c9e31-1336-4e25-99bf-16c4efdc348e'),
(215, 214, 11, 3, 1, NULL, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '217c545f-56a5-455d-b486-f13f706ed8aa'),
(216, 214, 11, 4, 2, NULL, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '81266fe3-bed4-43c3-9bbf-90f4143d21fc'),
(217, 214, 11, 5, 3, NULL, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '7a495c64-a9f5-4b27-b7bb-1af6e5413372'),
(218, 214, 11, 6, 4, NULL, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '49cf7bbd-4daa-4d78-b1f5-f4fd7fc9bb13'),
(219, 214, 11, 7, 5, NULL, '2020-09-16 13:08:43', '2020-09-16 13:08:43', 'f5e926f9-e568-46f6-b19a-b83d3202345a'),
(221, 220, 11, 3, 1, NULL, '2020-09-16 13:13:34', '2020-09-16 13:13:34', 'e758dc00-b04c-47d6-aafc-ebe9e41228c1'),
(222, 220, 11, 4, 2, NULL, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '41dd077a-be0a-4d42-9dab-4bb413383b78'),
(223, 220, 11, 5, 3, NULL, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '4bb89ab2-5e8b-4725-b85c-557cedebeec7'),
(224, 220, 11, 6, 4, NULL, '2020-09-16 13:13:34', '2020-09-16 13:13:34', 'db0ead6c-ee52-4c23-ab80-4a1083051f8b'),
(225, 220, 11, 7, 5, NULL, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '2e9f9c8a-1508-41cf-b9cc-199f602ea6e1'),
(227, 226, 2, 1, 1, 1, '2020-09-16 13:16:47', '2020-09-16 13:16:47', 'ec319075-4b3d-4abe-af96-ad12682b680e'),
(228, 226, 2, 1, 2, 1, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '9fa41525-f020-4772-b911-d3b9ccb1713f'),
(229, 226, 2, 1, 3, 1, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '3b966047-d354-47b4-80e0-e893206e74c7'),
(230, 226, 2, 1, 4, 1, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '16dab561-d6db-4943-a10c-52e53b71eef8'),
(232, 231, 2, 1, 1, 1, '2020-09-16 13:18:20', '2020-09-16 13:18:20', 'da030d6b-9fef-466b-a640-037803176189'),
(233, 231, 2, 1, 2, 1, '2020-09-16 13:18:20', '2020-09-16 13:18:20', '64cd6345-685a-4a0d-b664-3bb7bdb1175b'),
(237, 236, 2, 1, 1, NULL, '2020-09-16 13:24:44', '2020-09-16 13:24:44', '19b5f716-c99e-45f0-86ca-dc2f202d881b'),
(238, 236, 2, 1, 2, NULL, '2020-09-16 13:24:44', '2020-09-16 13:24:44', 'acfe42d5-daa0-4f1c-8e4e-2b29b3afd1bd'),
(239, 236, 2, 1, 3, NULL, '2020-09-16 13:24:44', '2020-09-16 13:24:44', 'f747221c-e057-4738-a93d-00bed320f2b4'),
(241, 240, 2, 1, 1, NULL, '2020-09-16 13:26:33', '2020-09-16 13:26:33', '2a0ef547-bf3f-4132-bd82-b396572008ea'),
(242, 240, 2, 1, 2, NULL, '2020-09-16 13:26:33', '2020-09-16 13:26:33', '423c7d9d-a696-4571-99a5-e65aed9815b9'),
(243, 240, 2, 1, 3, NULL, '2020-09-16 13:26:33', '2020-09-16 13:26:33', '01c67358-8714-4c5c-8e21-42270d21140e'),
(244, 240, 2, 1, 4, NULL, '2020-09-16 13:26:33', '2020-09-16 13:26:33', '1ea3fc50-7e6c-45e2-bcf0-d5a823765444'),
(250, 234, 5, 2, 1, NULL, '2020-09-16 13:33:54', '2020-09-16 13:33:54', 'fcb2b624-30ca-4445-acc0-03b70824d544'),
(251, 234, 5, 2, 2, NULL, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '14ac583c-1429-455e-9461-804d0785eef6'),
(252, 234, 5, 2, 3, NULL, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '11ffe4aa-7162-4d64-8c81-b3420787f048'),
(253, 234, 5, 2, 4, NULL, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '74549bc2-692b-4494-81ae-d101dc3635a0'),
(255, 254, 5, 2, 1, NULL, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '59f66956-9989-428d-bfa3-369f5d7b40fb'),
(256, 254, 5, 2, 2, NULL, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '7a921dcf-5f2d-4776-810f-c96e8943fa8d'),
(257, 254, 5, 2, 3, NULL, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '00fbc7da-3302-43dc-9be4-877420b30eb3'),
(258, 254, 5, 2, 4, NULL, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '52bf8b76-b41b-4e37-8f4e-78c615a24d72'),
(260, 259, 5, 2, 1, NULL, '2020-09-16 13:34:09', '2020-09-16 13:34:09', 'df7cd8be-fc06-4db2-9837-439e19a6bb87'),
(261, 259, 5, 2, 2, NULL, '2020-09-16 13:34:09', '2020-09-16 13:34:09', '03f84c9f-fdfa-47d4-b535-0606a78c4bb3'),
(262, 259, 5, 2, 3, NULL, '2020-09-16 13:34:09', '2020-09-16 13:34:09', 'dae8b9d7-bea8-440c-b85d-607da60d91cc'),
(263, 259, 5, 2, 4, NULL, '2020-09-16 13:34:09', '2020-09-16 13:34:09', 'b8cd6447-e0a5-45bf-8e46-7624aabb981d'),
(265, 264, 5, 2, 1, NULL, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '2c3d1601-1120-4ff0-ba8c-f2abe6d8924d'),
(266, 264, 5, 2, 2, NULL, '2020-09-16 13:34:50', '2020-09-16 13:34:50', 'aaab6149-3291-4d14-bb87-636959967ff2'),
(267, 264, 5, 2, 3, NULL, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '70818e3a-63db-4204-aa78-afa38b3ad84b'),
(268, 264, 5, 2, 4, NULL, '2020-09-16 13:34:50', '2020-09-16 13:34:50', 'd6c4bad4-b8e2-479d-80d6-79de6fe75faf'),
(270, 269, 5, 2, 1, NULL, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '3dde7b8f-dbaf-489d-83c4-04c064e69e5e'),
(271, 269, 5, 2, 2, NULL, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '126bc9df-360c-4d88-ab61-4fc3ecc96d34'),
(272, 269, 5, 2, 3, NULL, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '21e4e90c-8b57-4c28-aef3-6fa87d684652'),
(273, 269, 5, 2, 4, NULL, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '9390a470-ddac-4e92-bbd7-ba90c8c7b359'),
(274, 234, 45, 9, 1, NULL, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '935fbce8-efb1-45a4-b1c6-06034f3880b5'),
(275, 234, 45, 9, 2, NULL, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '137b52e3-1398-4450-9b5a-8cd5e6a0bd1b'),
(276, 234, 45, 9, 3, NULL, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '92a6a6e4-1724-440f-b296-55c6ceb262e4'),
(278, 277, 45, 9, 1, NULL, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'e3916161-6ab2-4cdb-bfd4-0f48088d882f'),
(279, 277, 45, 9, 2, NULL, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '08bdef3c-cf3c-4628-95e9-e12c9c7b0746'),
(280, 277, 45, 9, 3, NULL, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '2e5eef03-c221-4ee1-8a03-7e0f869ada1e'),
(281, 277, 5, 2, 1, NULL, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'ca94228e-5fc2-4082-ab9a-dee8333257cb'),
(282, 277, 5, 2, 2, NULL, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '595af5df-0aab-43b8-a949-fbf1c8970c24'),
(283, 277, 5, 2, 3, NULL, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'c05a025f-67a3-4296-923b-74de342186bd'),
(284, 277, 5, 2, 4, NULL, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'c1e7d0c7-1cb9-4d1f-adeb-138a69a2e59c'),
(287, 286, 11, 3, 1, NULL, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '101d8d9d-3b31-4ccf-92b3-1557ab0d6a5d'),
(288, 286, 11, 4, 2, NULL, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '7ddc366f-8e8f-40c6-8315-91bf7a191d24'),
(289, 286, 11, 5, 3, NULL, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '0cd0315a-0f6d-4ca0-8e68-60d1d9c79f1c'),
(290, 286, 11, 6, 4, NULL, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '0da891df-2d59-44e1-b138-b255128c3c08'),
(291, 286, 11, 7, 5, NULL, '2020-09-16 14:30:34', '2020-09-16 14:30:34', 'cb86269d-1385-4135-9acf-fe732cbe83e6'),
(293, 292, 11, 3, 1, NULL, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '6a445f08-4e8b-40fd-8824-8ec92b10afda'),
(294, 292, 11, 4, 2, NULL, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'a4932c16-d438-48d7-bce3-d72dbb1abbe2'),
(295, 292, 11, 5, 3, NULL, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'aaf99018-2704-489e-90af-823d9c07bd03'),
(296, 292, 11, 6, 4, NULL, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'd2458aff-a12a-4a1d-96b0-74d8da5bfb5d'),
(297, 292, 11, 7, 5, NULL, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'feae98e9-c55b-4620-b8dd-4d2fffdbdfe6'),
(299, 298, 45, 9, 1, NULL, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'b56a18e7-ce8c-4e68-a1b5-ec73aa1f739d'),
(300, 298, 45, 9, 2, NULL, '2020-09-17 12:33:11', '2020-09-17 12:33:11', '86e1c326-36ce-45ee-9b44-c1b14d2deb0a'),
(301, 298, 45, 9, 3, NULL, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'b47d1473-11ae-41aa-a349-686f0ae061ec'),
(302, 298, 5, 2, 1, NULL, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'cd0f8655-f460-442c-80d2-9ad4aaa10610'),
(303, 298, 5, 2, 2, NULL, '2020-09-17 12:33:11', '2020-09-17 12:33:11', '4ffe7519-55c6-49d7-9b03-f83cc58858b0'),
(304, 298, 5, 2, 3, NULL, '2020-09-17 12:33:11', '2020-09-17 12:33:11', '70b3218c-172a-44f4-bb38-df99634f3c38'),
(305, 298, 5, 2, 4, NULL, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'dcdeae21-ff4c-4495-a9ce-f7b8a23649a5'),
(307, 306, 5, 2, 1, NULL, '2020-09-17 12:36:05', '2020-09-17 12:36:05', '62d6beb5-0d7a-4cd8-a830-eeca4ceee160'),
(308, 306, 5, 2, 2, NULL, '2020-09-17 12:36:05', '2020-09-17 12:36:05', 'ea4628a7-9959-4a1b-94f1-85d8459cfeef'),
(309, 306, 5, 2, 3, NULL, '2020-09-17 12:36:05', '2020-09-17 12:36:05', '6e9448c6-ea85-4353-9798-0a3a9fb00832'),
(310, 306, 5, 2, 4, NULL, '2020-09-17 12:36:05', '2020-09-17 12:36:05', '5c11787f-2cf0-4663-9771-79a08e80ef2c'),
(312, 311, 5, 2, 1, NULL, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '2ede4110-e216-4416-80c6-a8d67bebce6d'),
(313, 311, 5, 2, 2, NULL, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '08716118-88ac-431f-8a18-3ffafbac7ac9'),
(314, 311, 5, 2, 3, NULL, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '6bab403a-b88d-493f-a523-f7b6137fdf04'),
(315, 311, 5, 2, 4, NULL, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '5d614c01-b91f-4284-bd00-852b90549268'),
(317, 316, 5, 2, 1, NULL, '2020-09-17 12:37:55', '2020-09-17 12:37:55', 'a2f2b0e1-09e8-4975-bfca-6e4c15b45f3c'),
(318, 316, 5, 2, 2, NULL, '2020-09-17 12:37:55', '2020-09-17 12:37:55', '7fcbbdab-5d66-4e20-9a9b-5ed26be27535'),
(319, 316, 5, 2, 3, NULL, '2020-09-17 12:37:55', '2020-09-17 12:37:55', '9c82cded-5f4f-4a66-8fee-ceef11be0bfb'),
(320, 316, 5, 2, 4, NULL, '2020-09-17 12:37:55', '2020-09-17 12:37:55', 'fff461e5-9b92-408e-84d6-1742c80c501e'),
(322, 321, 5, 2, 1, NULL, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '2ca0bdda-ddf3-493b-ad92-6d8156b1c5a9'),
(323, 321, 5, 2, 2, NULL, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '9b1ecb1d-dcd0-49d1-8600-58e0288df7ad'),
(324, 321, 5, 2, 3, NULL, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '927b2691-20a9-48c4-9757-88642baaa5dc'),
(325, 321, 5, 2, 4, NULL, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '0bf2e86b-9df9-4716-9b7e-6071b5037450'),
(327, 326, 45, 9, 1, NULL, '2020-09-17 12:38:57', '2020-09-17 12:38:57', 'ce79b5e8-98bf-4587-91e7-ecfc5cb4783f'),
(328, 326, 45, 9, 2, NULL, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '9ad5f97e-c2d7-4fa3-bfa6-0a5a55169e3e'),
(329, 326, 45, 9, 3, NULL, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '7327a46c-f2c8-4cc0-a13e-fc7aab5d7d6b'),
(330, 326, 5, 2, 1, NULL, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '75633cf6-a3b8-4069-b216-a475cfa985f6'),
(331, 326, 5, 2, 2, NULL, '2020-09-17 12:38:57', '2020-09-17 12:38:57', 'ff952373-b916-4788-a553-8fd9836eadf5'),
(332, 326, 5, 2, 3, NULL, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '8f9da140-6217-4ddb-bc93-f0f296f214af'),
(333, 326, 5, 2, 4, NULL, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '40add4b0-6128-4270-8fff-3753bf7acb95'),
(342, 341, 11, 3, 1, NULL, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '40bc5e6c-4d17-4eb1-933b-8dcbbd8176a2'),
(343, 341, 11, 4, 2, NULL, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '536b1cb5-98d3-4275-a737-412a0cf85317'),
(344, 341, 11, 5, 3, NULL, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'f7c4affc-ada2-4224-b986-abb9f907e4b0'),
(345, 341, 11, 6, 4, NULL, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'b2ba7bf2-70f3-4e9d-b0a0-b04e3e363e70'),
(346, 341, 11, 7, 5, NULL, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '56d97ce3-67de-41b5-88d0-8990846ed243'),
(348, 347, 5, 2, 1, NULL, '2020-09-17 13:22:18', '2020-09-17 13:22:18', 'd9039c14-9cb9-4034-86c1-256c0f8b34d4'),
(349, 347, 5, 2, 2, NULL, '2020-09-17 13:22:18', '2020-09-17 13:22:18', '1bde2c1e-0c76-49d6-b729-0eb8dd17939b'),
(350, 347, 5, 2, 3, NULL, '2020-09-17 13:22:18', '2020-09-17 13:22:18', '32d4ce59-8473-473e-92b3-cb84336fea92'),
(351, 347, 5, 2, 4, NULL, '2020-09-17 13:22:18', '2020-09-17 13:22:18', '0d1ccca1-2b89-47c7-94f6-a37cf45446c9');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixblocktypes`
--

INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 2, 'Topic links', 'topicLinks', 1, '2020-09-14 09:27:45', '2020-09-14 09:27:45', 'b8e10694-8207-4a73-8690-01ee91089398'),
(2, 5, 4, 'Social network', 'socialLink', 1, '2020-09-14 12:17:30', '2020-09-17 13:21:44', '88f0f88c-1b50-4e34-9a0b-63b83b821f4e'),
(3, 11, 7, 'Slides block', 'heroRotator', 1, '2020-09-14 13:20:45', '2020-09-17 13:18:32', '3cc89c3b-1c24-480b-8a29-84e84ad27ee1'),
(4, 11, 11, 'Article block', 'article', 2, '2020-09-14 13:40:43', '2020-09-17 13:18:32', '44662993-89d8-4367-a0b2-9d96e062eeb3'),
(5, 11, 12, 'Presentation block', 'presentation', 3, '2020-09-14 13:40:43', '2020-09-17 13:18:32', '0fa09bda-4927-413e-912c-dacd1a5d3d95'),
(6, 11, 14, 'Events block', 'events', 4, '2020-09-14 13:43:42', '2020-09-17 13:18:32', 'cbeed6a9-78e6-436a-ad97-4dadf7fc5d11'),
(7, 11, 17, 'Videos block', 'videos', 5, '2020-09-16 12:48:00', '2020-09-17 13:18:33', 'b37ce238-1d49-4e49-9112-eb0ca6e0878f'),
(8, 38, 18, 'Video link', 'videoLink', 1, '2020-09-16 12:51:26', '2020-09-16 12:51:26', '69b98422-b52a-448b-b51e-774bb1a1d8fe'),
(9, 45, 23, 'Social network', 'socialLink', 1, '2020-09-16 14:11:26', '2020-09-17 13:24:45', 'e32094d0-88fd-461d-a24a-a3bcf59b4922'),
(10, 50, 26, 'Content', 'contentAbout', 1, '2020-09-17 13:06:01', '2020-09-17 13:11:47', '571684f8-3bd9-41b0-b85b-af936bb0900a'),
(11, 50, 27, 'Learn more', 'learnMore', 2, '2020-09-17 13:06:01', '2020-09-17 13:06:01', '80f0a9a1-95df-4f12-a999-dd6b2a758b6b');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_aboutpageblocks`
--

CREATE TABLE `matrixcontent_aboutpageblocks` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_contentAbout_descriptionAbout` text DEFAULT NULL,
  `field_contentAbout_titleAbout` text DEFAULT NULL,
  `field_learnMore_descriptionLearnMore` text DEFAULT NULL,
  `field_learnMore_titleLearnMore` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_homepageblocks`
--

CREATE TABLE `matrixcontent_homepageblocks` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_slider_subtitleSlider` text DEFAULT NULL,
  `field_article_descriptionArticle` text DEFAULT NULL,
  `field_article_subtitleArticle` text DEFAULT NULL,
  `field_article_titleArticle` text DEFAULT NULL,
  `field_presentation_titlePresentation` text DEFAULT NULL,
  `field_presentation_descriptionPresentation` text DEFAULT NULL,
  `field_events_descriptionEvents` text DEFAULT NULL,
  `field_events_titleEvents` text DEFAULT NULL,
  `field_videos_videoTitle` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_homepageblocks`
--

INSERT INTO `matrixcontent_homepageblocks` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_slider_subtitleSlider`, `field_article_descriptionArticle`, `field_article_subtitleArticle`, `field_article_titleArticle`, `field_presentation_titlePresentation`, `field_presentation_descriptionPresentation`, `field_events_descriptionEvents`, `field_events_titleEvents`, `field_videos_videoTitle`) VALUES
(1, 82, 1, '2020-09-14 14:12:07', '2020-09-16 12:48:16', 'c4666555-e446-4521-9ecf-46c169478025', 'Insolve youngsters in science technology & sustainability 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 84, 1, '2020-09-14 14:12:07', '2020-09-14 14:12:07', '3b1ad77a-e6ef-4dc5-b516-117c4e6a5290', 'Insolve youngsters in science technology & sustainability', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 85, 1, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '9a8e695d-6d25-465e-83d3-bda7f3619c19', 'Insolve youngsters in science technology & sustainability 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 86, 1, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '06859c12-7656-4094-ace4-9706f78e3f8a', 'Insolve youngsters in science technology & sustainability 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 88, 1, '2020-09-14 14:14:07', '2020-09-14 14:14:07', 'a7252279-2183-4a75-a3f0-b03cda31df7b', 'Insolve youngsters in science technology & sustainability 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 89, 1, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '03a8cc07-ee4f-4527-ae07-7076dcaad85c', 'Insolve youngsters in science technology & sustainability 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 90, 1, '2020-09-14 14:14:07', '2020-09-14 14:14:07', '19e3c2cd-a395-480c-9353-57bfeb3db97b', 'Insolve youngsters in science technology & sustainability 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 98, 1, '2020-09-14 14:42:18', '2020-09-14 14:42:18', 'a1d08a2c-5e80-4e07-bb4a-0fdd74230932', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 100, 1, '2020-09-15 07:37:55', '2020-09-15 07:37:55', '099295ab-2821-49e8-b3ca-1d09d96c4e51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 101, 1, '2020-09-15 07:38:22', '2020-09-15 07:38:22', 'e32326f6-e7cb-4f8a-a2d4-337ddc5cb0cf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 103, 1, '2020-09-15 07:38:22', '2020-09-15 07:38:22', 'f2d04fb7-8840-42ee-8cc3-85c38ff70b8d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 104, 1, '2020-09-15 07:38:22', '2020-09-15 07:38:22', 'd3b93287-ccea-4208-adaf-a68bd4987c41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 112, 1, '2020-09-15 08:09:22', '2020-09-15 08:09:22', '3af72632-31a5-4786-a4eb-0776368520d8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 119, 1, '2020-09-15 12:12:02', '2020-09-16 12:48:16', 'c6f7d606-268d-402d-851c-492a76faf18d', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(15, 121, 1, '2020-09-15 12:12:02', '2020-09-15 12:12:02', '1a1b1ef4-5c51-4d1d-ae06-91441c1ed050', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 122, 1, '2020-09-15 12:12:02', '2020-09-15 12:12:02', 'db8f9fbc-e165-49c7-9966-723cf8480a99', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(17, 132, 1, '2020-09-15 13:03:53', '2020-09-16 12:48:16', 'effd4348-e50a-46a5-a123-9f81149a6080', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(18, 134, 1, '2020-09-15 13:03:53', '2020-09-15 13:03:53', '0cfe5a1b-d4e1-44ea-8c82-d683d7b137b2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 135, 1, '2020-09-15 13:03:53', '2020-09-15 13:03:53', '8e32804b-d034-45d3-afb1-05603d40f369', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(20, 136, 1, '2020-09-15 13:03:53', '2020-09-15 13:03:53', 'da0e33d4-cde9-4c1e-b4d1-21dc3bd542ab', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(21, 139, 1, '2020-09-15 13:12:36', '2020-09-15 13:12:36', 'b515e5ed-c24c-49be-a25a-577058d3eb3f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 140, 1, '2020-09-15 13:12:36', '2020-09-15 13:12:36', '3431af05-7a18-4e54-881c-cb797c3731ec', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(23, 141, 1, '2020-09-15 13:12:36', '2020-09-15 13:12:36', '4dc6e37c-bbb3-42e6-adbc-d1e98bdcb8a8', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(24, 150, 1, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '0dff7354-049e-4acb-af11-c0860de862dc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 151, 1, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '93b96d52-b9a7-4993-934f-7138ff412ed0', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(26, 152, 1, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '23c8aab6-62f9-4c8c-bff6-2ba69af2ff4c', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(27, 154, 1, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '6e8866ba-0c38-43a7-8f7d-c509a7e802e5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 155, 1, '2020-09-15 13:44:55', '2020-09-15 13:44:55', 'de3cbe02-8924-4114-901b-a30c81633e39', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(29, 156, 1, '2020-09-15 13:44:55', '2020-09-15 13:44:55', 'c0d432cc-cfa7-497c-b507-b9175caf0bfe', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(30, 157, 1, '2020-09-15 14:09:54', '2020-09-15 14:12:47', '1ca62288-7534-4d70-8343-cba758e9a466', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 159, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '6d9cdd0e-9c86-4a23-9f1a-f2f9bbe74328', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 160, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '47ff3fc6-b1b5-4661-8950-00cb168f70e0', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(33, 161, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '41c1eef7-eb4f-4196-9958-e80abb61e06d', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(34, 162, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', 'f4ec5c8a-9398-468f-89a3-479e1b93d4af', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 164, 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '43679118-285d-41fd-a51c-f1d46844a394', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 165, 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '16355ee3-bf12-4e3e-9abf-79c8d5ee9885', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(37, 166, 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '20db6cda-8f59-4b78-b11a-7f0482b1c625', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 167, 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', 'bbf381fd-0944-4049-b225-5f4d5f88255e', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(39, 169, 1, '2020-09-15 14:13:14', '2020-09-15 14:13:14', '6eac1b1f-4a08-4840-9721-8f5bb09efccb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 170, 1, '2020-09-15 14:13:14', '2020-09-15 14:13:14', '4e6f0591-49be-4ae9-b2c8-4f4aa410bc70', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(41, 171, 1, '2020-09-15 14:13:14', '2020-09-15 14:13:14', 'e22cdf1b-8080-4b26-820f-8ebf4da2f0c3', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(42, 179, 1, '2020-09-16 07:36:16', '2020-09-17 13:19:14', '1048d71b-3a05-43d2-beb1-f3b8a8da84f1', NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', 'Events', NULL),
(43, 181, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'fccc9b04-2a19-4831-9e0f-1a8e151d9293', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 182, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '73941fdb-4fb1-4fcc-902b-209ed38e9bd4', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(45, 183, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '5846e455-bf74-4b0a-9d07-6271f047b3db', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(46, 184, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '4253fecb-3a17-4f8e-b9eb-04a4dd2890fe', NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', 'Events', NULL),
(47, 188, 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '9a087d12-898a-4e6b-b1fb-605c9e6be937', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 189, 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', 'c557460c-58c5-49b0-8288-0fce4bdb919d', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(49, 190, 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '0e72e5e1-80ce-4a41-a3d6-9ac2116e6876', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(50, 191, 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '396c8b6c-6ac2-404b-98d6-d2772ebf1fea', NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', 'Events', NULL),
(51, 197, 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'fb3c4386-baf5-4487-ad25-f1b831899af2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 198, 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'cd60d3f3-a4b1-4aa5-8f8e-bddd4656714d', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(53, 199, 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '9e0ec0d9-146d-4946-b9e5-404a84a93122', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(54, 200, 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '5ab58e15-8e0f-4d31-a40d-910e0df87160', NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', 'Events', NULL),
(55, 201, 1, '2020-09-16 12:48:16', '2020-09-16 14:36:56', '250effa0-7e7c-4f3b-9c1b-ccf80d677cc5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RM@Schools Videos on YouTube'),
(56, 203, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '7061b030-6955-4ffb-97ee-8c9c91068db9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 204, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', 'fe456dc2-3ac5-45d4-8047-ac6ef1ae11ab', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(58, 205, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '3d7b7d5d-9372-4bf1-a860-f245c515d864', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(59, 206, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '0fd05b12-f760-4dfb-abe7-6618a13820b5', NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', 'Events', NULL),
(60, 207, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '3f649d10-51ee-4bc5-91ef-615ddabb57e8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RM@Schools Videos on YouTube'),
(61, 215, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '71d8a32b-b8b7-405e-a678-83a4de829a95', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 216, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '4e1cd7ec-e652-4be0-b595-21d176944c3b', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(63, 217, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', 'edcaef3b-0494-4257-b732-20ccab29d405', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(64, 218, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '21405fb9-5393-4599-ba72-40976dd3ec09', NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', 'Events', NULL),
(65, 219, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', 'b758953b-b129-4334-bd23-42a63424203c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RM@Schools Videos on YouTube'),
(66, 221, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '1ef45f3a-4d05-4299-94f3-284214ab5301', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 222, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '97d30461-d577-457a-8bdc-c90bbf296d10', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(68, 223, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', 'ad0238cc-db96-45a0-b632-ab9c26dba814', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(69, 224, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', 'c1f17fc5-3574-464f-83e4-4d5567c480e5', NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', 'Events', NULL),
(70, 225, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '1ab230bd-8975-45e6-be25-c5c831db3776', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RM@Schools Videos on YouTube'),
(71, 287, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', 'a2af1769-be8b-4843-ad98-2ee591e2a779', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 288, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '40b8d9b7-19f6-4438-a7be-d38cb47d2375', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(73, 289, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', 'e1ce1ff1-d946-4fe7-8624-1b1bdd26dfa0', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(74, 290, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '572c5fdd-e1d8-4e85-8f01-65bf7de9c481', NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', 'Events', NULL),
(75, 291, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '5771a82e-0556-4089-bdcd-a64aa47bb67e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RM@Schools Videos on YouTube'),
(76, 293, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '98cadb39-bd8c-4723-9e35-d5c615d6daf4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 294, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '90ae152a-84e7-4bbc-84f4-d119fa246448', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(78, 295, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'f7c28008-051f-4cc1-9b65-7f5a6a70ec93', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(79, 296, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'c9035f47-4843-47df-8e6c-83e602549cb8', NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', 'Events', NULL),
(80, 297, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '658966e7-a7bc-47fa-95b9-15f4254bf117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RM@Schools Videos on YouTube'),
(81, 342, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '6f41e850-70b0-4fd9-9fbc-f72ee045c7f8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 343, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '025f5073-0fee-46c0-b325-646f6ed25450', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, laborum sequi sed recusandae quidem dolorem provident omnis maxime sapiente aliquam ex quisquam aspernatur id dolor libero, accusamus reiciendis commodi beatae?', 'Teaching Resources', 'Active learning with hands-on teaching material', NULL, NULL, NULL, NULL, NULL),
(83, 344, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'c4583ae9-fc3f-4961-a63d-0c221465562b', NULL, NULL, NULL, NULL, 'Young RM ambassadors in action', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', NULL, NULL, NULL),
(84, 345, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'e0600916-2bab-4f04-ace0-b25e59883125', NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore quidem sapiente recusandae ab. Libero ducimus nobis consequatur natus earum aspernatur aperiam! Nam illum nostrum rerum?', 'Events', NULL),
(85, 346, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '3e05eabd-ef5b-4d62-be7b-91097a2c48e6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RM@Schools Videos on YouTube');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_sharepage`
--

CREATE TABLE `matrixcontent_sharepage` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_socialLink_socialIcon` varchar(255) DEFAULT NULL,
  `field_socialLink_socialUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_sharepage`
--

INSERT INTO `matrixcontent_sharepage` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_socialLink_socialIcon`, `field_socialLink_socialUrl`) VALUES
(1, 274, 1, '2020-09-16 14:12:50', '2020-09-16 14:12:50', '26e455af-fa25-4e44-97b5-8345cb699502', 'fa fa-facebook-square', ''),
(2, 275, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '4a5b3c6c-1184-4e47-b13e-83c02a292d04', 'fa fa-twitter', ''),
(3, 276, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'd4758782-d87a-4c49-9702-eebaf9e75ad5', 'fa fa-linkedin-square', ''),
(4, 278, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '0d8016ca-54ed-41b5-9c4f-14ef2cb12f46', 'fa fa-facebook-square', ''),
(5, 279, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '904a05b9-697c-44b0-b29e-6d3e6de4093f', 'fa fa-twitter', ''),
(6, 280, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '83057f19-6022-4e8f-bf8a-a2bf72d651b2', 'fa fa-linkedin-square', ''),
(7, 299, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', '55d78ab6-4572-460e-b7b3-7e253994736d', 'fa fa-facebook-square', ''),
(8, 300, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'e0e5828e-52cb-42a8-85b9-8e7ca437a374', 'fa fa-twitter', ''),
(9, 301, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'ac1280b0-5188-49d5-800c-7db24f576a76', 'fa fa-linkedin-square', ''),
(10, 327, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '39337132-aa6f-48df-b66d-29c07a2b8ae6', 'fa fa-facebook-square', ''),
(11, 328, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '5d00434a-efa8-4138-bbc1-a30ece965bef', 'fa fa-twitter', ''),
(12, 329, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '8eb1b2fc-e720-4e89-8911-273820754637', 'fa fa-linkedin-square', '');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_socialnetworks`
--

CREATE TABLE `matrixcontent_socialnetworks` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_socialLink_socialLink` varchar(255) DEFAULT NULL,
  `field_socialLink_socialIcon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_socialnetworks`
--

INSERT INTO `matrixcontent_socialnetworks` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_socialLink_socialLink`, `field_socialLink_socialIcon`) VALUES
(1, 14, 1, '2020-09-14 12:21:28', '2020-09-17 12:38:33', '098b02cd-e388-451e-9ce9-0090f3ed03e3', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook-square'),
(2, 15, 1, '2020-09-14 12:21:28', '2020-09-15 10:25:22', '32e6c588-066b-4207-886d-536c6d20511e', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(3, 16, 1, '2020-09-14 12:21:28', '2020-09-15 10:25:22', '04c0dc48-29ba-461a-9a82-74595e6b8bf2', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(4, 17, 1, '2020-09-14 12:21:28', '2020-09-15 10:25:22', '39329064-5017-4e27-b40b-2e7deebe3280', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(5, 19, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', 'a5b56eff-38af-49e1-a888-98eb36564397', 'https://www.facebook.com/RMatSchools/', 'assets/img/svg/facebook.svg'),
(6, 20, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '4c648dfb-9c77-4e8e-a9c7-b9a9f05a4855', 'https://twitter.com/RM_Schools', 'assets/img/svg/twitter.svg'),
(7, 21, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '7f179630-7a7a-457f-8425-403f2643c0a4', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'assets/img/svg/youtube.svg'),
(8, 22, 1, '2020-09-14 12:21:28', '2020-09-14 12:21:28', '272d63c5-6efb-4e58-ad38-8cb81f18ac0b', 'https://www.instagram.com/rm_schools/', 'assets/img/svg/facebook.svg'),
(9, 24, 1, '2020-09-14 12:22:15', '2020-09-14 12:22:15', '8eb19dc3-3bd8-4900-8ece-09b09b6a0a72', 'https://www.facebook.com/RMatSchools/', 'assets/img/svg/facebook.svg'),
(10, 25, 1, '2020-09-14 12:22:15', '2020-09-14 12:22:15', 'bbd5c26b-564f-4253-899e-de1ca17b393b', 'https://twitter.com/RM_Schools', 'assets/img/svg/twitter.svg'),
(11, 26, 1, '2020-09-14 12:22:15', '2020-09-14 12:22:15', 'a7c13f9b-0876-4f86-8fb3-72680d65c15f', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'assets/img/svg/youtube.svg'),
(12, 27, 1, '2020-09-14 12:22:15', '2020-09-14 12:22:15', 'f9bc3bd5-aa13-41be-b9bd-d78ebbc5248a', 'https://www.instagram.com/rm_schools/', 'assets/img/svg/facebook.svg'),
(13, 29, 1, '2020-09-14 12:26:53', '2020-09-14 12:26:53', 'f5ce9824-37ca-4526-b385-179ea51391f4', 'https://www.facebook.com/RMatSchools/', 'assets/img/svg/facebook.svg'),
(14, 30, 1, '2020-09-14 12:26:53', '2020-09-14 12:26:53', '1d2d2bfe-41c5-4ebb-ba4d-09afd3417381', 'https://twitter.com/RM_Schools', 'assets/img/svg/twitter.svg'),
(15, 31, 1, '2020-09-14 12:26:53', '2020-09-14 12:26:53', '3090a593-de4b-4060-b308-4a2d5742507d', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'assets/img/svg/youtube.svg'),
(16, 32, 1, '2020-09-14 12:26:53', '2020-09-14 12:26:53', '63661614-29f8-4b03-89f8-4833944283d2', 'https://www.instagram.com/rm_schools/', 'assets/img/svg/facebook.svg'),
(17, 34, 1, '2020-09-14 12:27:09', '2020-09-14 12:27:09', 'd1b95c5c-6057-461f-9689-45e4898f707f', 'https://www.facebook.com/RMatSchools/', 'assets/img/svg/facebook.svg'),
(18, 35, 1, '2020-09-14 12:27:09', '2020-09-14 12:27:09', '07ffcf1e-fe94-4317-b6d8-3664862f7341', 'https://twitter.com/RM_Schools', 'assets/img/svg/twitter.svg'),
(19, 36, 1, '2020-09-14 12:27:09', '2020-09-14 12:27:09', 'da65eeed-3cab-4ecd-ada5-e7df3af8c93f', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'assets/img/svg/youtube.svg'),
(20, 37, 1, '2020-09-14 12:27:09', '2020-09-14 12:27:09', '00c13a98-854f-4de5-be53-321840e6cbf2', 'https://www.instagram.com/rm_schools/', 'assets/img/svg/facebook.svg'),
(21, 41, 1, '2020-09-14 12:29:21', '2020-09-14 12:29:21', '421a944c-93cc-4d6b-af87-910535b994ff', 'https://www.facebook.com/RMatSchools/', 'assets/img/svg/facebook.svg'),
(22, 42, 1, '2020-09-14 12:29:22', '2020-09-14 12:29:22', 'd9ec17a9-df0a-47db-b8d2-298ba192f0e4', 'https://twitter.com/RM_Schools', 'assets/img/svg/twitter.svg'),
(23, 43, 1, '2020-09-14 12:29:22', '2020-09-14 12:29:22', '50702d88-dfc7-49b9-a2a3-d6fb6d9e21b2', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'assets/img/svg/youtube.svg'),
(24, 44, 1, '2020-09-14 12:29:22', '2020-09-14 12:29:22', '902400da-2745-4865-9f91-3bb9946348cb', 'https://www.instagram.com/rm_schools/', 'assets/img/svg/facebook.svg'),
(25, 46, 1, '2020-09-14 12:34:38', '2020-09-14 12:34:38', 'de78be9a-6016-4f38-847f-20325ce1a163', 'https://www.facebook.com/RMatSchools/', 'assets/img/svg/facebook.svg'),
(26, 47, 1, '2020-09-14 12:34:38', '2020-09-14 12:34:38', '384c14ba-3499-4fa8-aac0-e2e103b869b2', 'https://twitter.com/RM_Schools', 'assets/img/svg/twitter.svg'),
(27, 48, 1, '2020-09-14 12:34:38', '2020-09-14 12:34:38', 'e4b6d1be-9aa8-4bf2-b6bd-27d4a82fe015', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'assets/img/svg/youtube.svg'),
(28, 49, 1, '2020-09-14 12:34:38', '2020-09-14 12:34:38', 'bced273a-db94-4d79-9dda-8a37ee1cad4f', 'https://www.instagram.com/rm_schools/', 'assets/img/svg/instagram.svg'),
(29, 51, 1, '2020-09-14 12:40:48', '2020-09-14 12:40:48', '27195b9c-3600-412c-86e6-4fc143a3eeed', 'https://www.facebook.com/RMatSchools/', 'assets/img/svg/facebook.svg'),
(30, 52, 1, '2020-09-14 12:40:48', '2020-09-14 12:40:48', 'bd92ead2-2a5f-4a0e-b883-a88237d699f6', 'https://twitter.com/RM_Schools', 'assets/img/svg/twitter.svg'),
(31, 53, 1, '2020-09-14 12:40:48', '2020-09-14 12:40:48', 'c8344d9e-5b2d-4791-b815-306064e2b88e', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'assets/img/svg/youtube.svg'),
(32, 54, 1, '2020-09-14 12:40:48', '2020-09-14 12:40:48', '6ac1e3ea-2555-466b-a61b-f8f4439ec119', 'https://www.instagram.com/rm_schools/', 'assets/img/svg/instagram.svg'),
(33, 56, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', 'ef2ddf7d-2e98-4365-b92e-59df7be3b80c', 'https://www.facebook.com/RMatSchools/', 'assets/img/svg/facebook.svg'),
(34, 57, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', 'c01feb6b-41d5-455c-a6ed-a626eff74c6b', 'https://twitter.com/RM_Schools', 'assets/img/svg/twitter.svg'),
(35, 58, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', '643a14f3-64d0-438a-8008-f0dc0d8e1885', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'assets/img/svg/youtube.svg'),
(36, 59, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', 'bee34be6-a52a-412b-802d-305c6599b67c', 'https://www.instagram.com/rm_schools/', 'assets/img/svg/instagram.svg'),
(37, 61, 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', 'e7a965a4-26e8-4192-bfea-9d1d00cd7856', 'https://www.facebook.com/RMatSchools/', 'assets/img/svg/facebook.svg'),
(38, 62, 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', '47543516-176c-4f83-91a9-2a5d234334a8', 'https://twitter.com/RM_Schools', 'assets/img/svg/twitter.svg'),
(39, 63, 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', '09e59bf4-9969-4d2d-93a9-1e2e4343eb51', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'assets/img/svg/youtube.svg'),
(40, 64, 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', '44f77a6c-3acc-4ec7-a110-81393970eedd', 'https://www.instagram.com/rm_schools/', 'assets/img/svg/instagram.svg'),
(41, 66, 1, '2020-09-14 12:41:48', '2020-09-14 12:41:48', '03fb12a7-e1eb-40c2-8600-d607b35aa386', 'https://www.facebook.com/RMatSchools/', 'assets/img/svg/facebook.svg'),
(42, 67, 1, '2020-09-14 12:41:48', '2020-09-14 12:41:48', 'e602f2fc-cecf-448d-b3db-6dcdd2098f46', 'https://twitter.com/RM_Schools', 'assets/img/svg/twitter.svg'),
(43, 68, 1, '2020-09-14 12:41:49', '2020-09-14 12:41:49', 'f7b6a337-2549-4e97-ab6f-82b726f3bed7', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'assets/img/svg/youtube.svg'),
(44, 69, 1, '2020-09-14 12:41:49', '2020-09-14 12:41:49', '899b661f-c8e4-426b-a73b-a90e5fa4d5de', 'https://www.instagram.com/rm_schools/', 'assets/img/svg/instagram.svg'),
(45, 114, 1, '2020-09-15 10:25:22', '2020-09-15 10:25:22', 'aa15ac8b-a618-4ab9-84fc-dd035613d835', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook-square'),
(46, 115, 1, '2020-09-15 10:25:22', '2020-09-15 10:25:22', '674a68c4-4e55-44f3-8f44-4f4be27b112f', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(47, 116, 1, '2020-09-15 10:25:22', '2020-09-15 10:25:22', 'fea80a1f-8382-4937-8c9c-b680d2df1063', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(48, 117, 1, '2020-09-15 10:25:22', '2020-09-15 10:25:22', '417a3fd3-d5f1-49b7-b371-ada30305e2b2', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(49, 250, 1, '2020-09-16 13:33:53', '2020-09-17 12:38:57', 'f9fb962f-7e32-47fe-8752-d3675373782e', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook-square'),
(50, 251, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '48666518-43de-4a18-af74-6ff78889d8ea', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(51, 252, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '04515a26-80a0-47af-bb1c-d3943935f63b', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(52, 253, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '7c5fe923-5cb8-43d4-b397-dd15d8e5fa3f', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(53, 255, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '25485d39-ca9a-4d31-bdf4-d4ce7fc1d7b9', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook-square'),
(54, 256, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '059fc3e3-b47d-43ca-b492-3b6176b8448d', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(55, 257, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', 'fc132df7-526b-4d42-96e4-709405023923', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(56, 258, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', 'e1a3f04f-765e-42fe-be38-14249e1483cc', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(57, 260, 1, '2020-09-16 13:34:09', '2020-09-16 13:34:09', '866a5a91-800e-49e7-95b4-263e15e63304', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook-square'),
(58, 261, 1, '2020-09-16 13:34:09', '2020-09-16 13:34:09', 'eaa9dd1c-2835-4f4b-8253-d39b9478dbae', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(59, 262, 1, '2020-09-16 13:34:09', '2020-09-16 13:34:09', '50062e1b-bb26-4469-9cf9-d1afe2c27140', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(60, 263, 1, '2020-09-16 13:34:09', '2020-09-16 13:34:09', '114316a6-179d-4289-a32d-e3708c05d3be', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(61, 265, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '98a61bb6-4a88-4511-9074-290bf17ba5c5', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook-square'),
(62, 266, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '356020c5-9c77-48ec-95af-b877f47725d8', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(63, 267, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '492c6c50-2888-40a3-b417-0c87955ffa9c', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(64, 268, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', 'b0bd53e2-ac5c-49fa-b39b-093d09e0be92', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(65, 270, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '56fd3be5-c0d1-4da5-9be3-71e4705adaf3', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook-square'),
(66, 271, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', 'fcb29e5d-a6f7-415e-a040-cae986a69a2b', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(67, 272, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', 'd7d88f51-f5a6-43d5-954e-7aff9a1441eb', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(68, 273, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '51c951b8-b58a-449c-b47b-26aee8c376ee', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(69, 281, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'ecb6c657-38d7-49fe-b888-0d5badf1546d', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook-square'),
(70, 282, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '36cb2ff0-9860-4241-8a03-93f0e80e393e', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(71, 283, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'aacab2d6-0915-4eba-8e7b-70bff2233b73', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(72, 284, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '2b3fa994-0b98-4c6c-a004-1b7e1634d0cb', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(73, 302, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', '9d993d1d-ee23-460f-beba-74326afb4747', 'https://www.facebook.com/RMatSchools/', 'fab fa-facebook'),
(74, 303, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'ea893b67-57d7-496d-b756-fedf50d0316b', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(75, 304, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', '1b58737e-f3de-47c0-82fa-9eb4121586c3', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(76, 305, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'ed2252f2-b91d-4f6f-a210-b7129d0ef8b0', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(77, 307, 1, '2020-09-17 12:36:05', '2020-09-17 12:36:05', 'c003907a-f854-4cf1-ab65-a67b5c5e3d71', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook'),
(78, 308, 1, '2020-09-17 12:36:05', '2020-09-17 12:36:05', '1330626e-561b-4e32-89ed-ae28dd8662fc', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(79, 309, 1, '2020-09-17 12:36:05', '2020-09-17 12:36:05', 'b510cb5a-4ec3-4c29-ab71-f3b0169f43f3', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(80, 310, 1, '2020-09-17 12:36:05', '2020-09-17 12:36:05', 'b44d930a-2507-4665-a5c1-d903689e8ba2', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(81, 312, 1, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '47782edd-6612-470e-8088-af9f4e67fa04', 'https://www.facebook.com/RMatSchools/', 'fab fa-facebook'),
(82, 313, 1, '2020-09-17 12:36:36', '2020-09-17 12:36:36', 'b603fe19-5f03-45ba-b191-615413d26fa1', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(83, 314, 1, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '931d8b67-5191-44dd-ba96-a091e18f01a5', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(84, 315, 1, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '2c448d67-7b45-4fc8-83fc-6fe51d2d4790', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(85, 317, 1, '2020-09-17 12:37:55', '2020-09-17 12:37:55', '22a86d07-92ce-4d72-9718-6be031f78308', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook'),
(86, 318, 1, '2020-09-17 12:37:55', '2020-09-17 12:37:55', '5452fcb1-12c0-44da-a401-1134d8ea0575', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(87, 319, 1, '2020-09-17 12:37:55', '2020-09-17 12:37:55', '0b41edff-2937-4f83-8210-95b20489ad08', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(88, 320, 1, '2020-09-17 12:37:55', '2020-09-17 12:37:55', 'c9b42e83-97e8-49e0-9fd0-4782b7677776', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(89, 322, 1, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '63a4d698-a083-41ec-8c92-13323a119c65', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook-square'),
(90, 323, 1, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '83c4d868-ede9-4211-b7f4-775293ec6a96', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(91, 324, 1, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '1cb8e538-c760-42a0-ac26-ac2decba96ad', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(92, 325, 1, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '1370968c-ef4f-483e-a429-00423db7a758', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(93, 330, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', 'cedb6ae0-518a-48d5-b150-fec318d12bf7', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook-square'),
(94, 331, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '5a976552-3c6d-4ff7-99dd-7b3b48428ae4', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(95, 332, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '77137b05-0d1a-4899-9e96-dd1a971ba22e', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(96, 333, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '4ecfe61e-70b3-4858-b0d8-0a78109a4409', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram'),
(97, 348, 1, '2020-09-17 13:22:18', '2020-09-17 13:22:18', '1bfc619a-bbba-49b1-aa5c-9d15e5f3c8a7', 'https://www.facebook.com/RMatSchools/', 'fa fa-facebook-square'),
(98, 349, 1, '2020-09-17 13:22:18', '2020-09-17 13:22:18', 'e33aa3f8-c7e8-44ea-b9c7-c64111ca0c29', 'https://twitter.com/RM_Schools', 'fa fa-twitter'),
(99, 350, 1, '2020-09-17 13:22:18', '2020-09-17 13:22:18', 'd49dbbce-70af-49e4-b741-079b74f3eff1', 'https://www.youtube.com/channel/UCrwbWjFme3KxKZh-Ze2ku8Q/featured', 'fa fa-youtube-play'),
(100, 351, 1, '2020-09-17 13:22:18', '2020-09-17 13:22:18', 'c737e7ad-d167-44a6-a3cf-89d0cfcea55a', 'https://www.instagram.com/rm_schools/', 'fa fa-instagram');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_topic`
--

CREATE TABLE `matrixcontent_topic` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_topicLinks_topicUrl` varchar(255) DEFAULT NULL,
  `field_topicLinks_topicName` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_topic`
--

INSERT INTO `matrixcontent_topic` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_topicLinks_topicUrl`, `field_topicLinks_topicName`) VALUES
(1, 3, 1, '2020-09-14 09:33:05', '2020-09-17 12:04:08', '66a12cd5-43ea-4fce-a600-10ea43922248', 'http://school.test/about-us', 'About us'),
(2, 4, 1, '2020-09-14 09:33:05', '2020-09-17 12:04:08', 'a8133eae-acef-4ff9-90ca-c45f246a461f', 'http://school.test/teaching-resources', 'Teaching resources'),
(3, 5, 1, '2020-09-14 09:33:05', '2020-09-17 12:04:08', 'f1eb9650-dc06-449b-8757-63d1afc7f725', 'http://school.test/students-in-action', 'Students in action'),
(4, 6, 1, '2020-09-14 09:33:05', '2020-09-14 09:35:56', '16f8cd16-c96a-4287-9eaa-888711283673', 'http://school.test/events', 'Events'),
(5, 8, 1, '2020-09-14 09:35:42', '2020-09-14 09:35:42', 'd6ddba11-3226-4b3c-bd06-569331467ab0', 'http://school.test/network', 'Our network'),
(6, 9, 1, '2020-09-14 09:35:42', '2020-09-14 09:35:42', 'a10049c2-cf2e-4be7-a7e3-6f8ea45bc32b', 'http://school.test/connections', 'Connections'),
(7, 10, 1, '2020-09-14 09:35:42', '2020-09-14 09:35:42', '33a93943-9202-4cb0-a244-1222e72fabaa', 'http://school.test/contacts', 'Contacts'),
(8, 227, 1, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '183d5fb0-82fe-41c7-8e9c-883add79fce9', 'http://school.test/explorationMining', 'Exploration & Mining'),
(9, 228, 1, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '2b7a3d5c-6240-4cbd-a9a7-bf36f1181c3b', 'http://school.test/substitution', 'Substitution'),
(10, 229, 1, '2020-09-16 13:16:47', '2020-09-16 13:16:47', 'b8a55df1-7de7-4711-a8da-85c99b230266', 'http://school.test/economy', 'Circular economy'),
(11, 230, 1, '2020-09-16 13:16:47', '2020-09-16 13:16:47', '2b211702-1480-4c3f-baf9-e1e1e9f417c2', 'http://school.test/entrepreneurship', 'Entrepreneurship education'),
(12, 232, 1, '2020-09-16 13:18:20', '2020-09-16 13:18:20', 'af0c0b9e-af96-46c7-a2c3-7c5f1d4580a4', 'http://school.test/privacy-policy', 'Privacy policy'),
(13, 233, 1, '2020-09-16 13:18:20', '2020-09-16 13:18:20', '4b61551d-e15f-44d5-a012-10cf4510cc8b', 'http://school.test/terms-&-conditions', 'Terms & Conditions'),
(14, 237, 1, '2020-09-16 13:24:44', '2020-09-17 12:04:22', '15ad25bd-baca-4a99-920f-9259899cecd1', 'http://school.test/our-network', 'Our network'),
(15, 238, 1, '2020-09-16 13:24:44', '2020-09-16 13:24:44', '0fba1a60-7e1e-4fea-8dd4-7b3117cb49f7', 'http://school.test/connections', 'Connections'),
(16, 239, 1, '2020-09-16 13:24:44', '2020-09-16 13:24:44', '4059898d-0660-4bb1-9f1c-7237163ea794', 'http://school.test/contacts', 'Contacts'),
(17, 241, 1, '2020-09-16 13:26:32', '2020-09-16 13:26:32', '2e67da0c-673a-43a1-a474-a05e897c4b25', 'http://school.test/exploration-&-mining', 'Exploration & Mining'),
(18, 242, 1, '2020-09-16 13:26:33', '2020-09-16 13:26:33', '83c84014-1d6b-4730-a097-92f7528ea076', 'http://school.test/substitution', 'Substitution'),
(19, 243, 1, '2020-09-16 13:26:33', '2020-09-16 13:26:33', '51687a60-6db3-40ee-95c1-f0c3e4ffaaf8', 'http://school.test/circular-economy', 'Circular economy'),
(20, 244, 1, '2020-09-16 13:26:33', '2020-09-16 13:26:33', 'df8c6868-7c56-421b-8274-cf4c76c55a75', 'http://school.test/entrepreneurship-education', 'Entrepreneurship education');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_video`
--

CREATE TABLE `matrixcontent_video` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_videoLink_videoTitle` text DEFAULT NULL,
  `field_videoLink_videoUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'ea06b868-78d5-4f5b-bd58-6141b9f14f0b'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '84d062c0-111b-46e8-9cad-cbabb6751857'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '3e8da692-180f-435b-a106-6b40e1ec9d7d'),
(4, 'craft', 'm150403_184533_field_version', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'aaa55d72-22a8-4195-83b9-ec5a48c97234'),
(5, 'craft', 'm150403_184729_type_columns', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'b91e5ea5-dfab-48d3-9d9d-f5a0bcb4d34f'),
(6, 'craft', 'm150403_185142_volumes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'c7fe7c0c-6ee1-4a75-bc74-e73605b50222'),
(7, 'craft', 'm150428_231346_userpreferences', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '8513d303-0312-4edc-adf0-a87d39174b4c'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '1b144dc4-78c0-40a2-83d1-782bcf384aa9'),
(9, 'craft', 'm150617_213829_update_email_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '5d01e99e-56bd-48c3-b6f8-54410cd3d944'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'f99f1bc3-af64-4e37-9659-22a534534df6'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'a37964f1-3f91-456e-9249-0691abe64079'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '19e2403d-57bf-413c-b97b-67a0d288c307'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'c45707b7-aca2-4800-a95f-7aaea12e1294'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2540db76-f497-4517-81b9-cae352430bf6'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '449864e2-dbcd-486d-9bdf-cd6da4a220fd'),
(16, 'craft', 'm151209_000000_move_logo', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '41aba88f-eb69-4de4-bfea-1bdd9895d75c'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '808a8651-3ce7-4148-9353-c33f3931fb5f'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '140254bd-a5c6-40ca-8638-bb09378f466c'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'af3eb3fd-df17-4287-aa90-c6cd6ba98b2d'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '704fc476-8e66-4e19-979c-f9922198aac6'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'c07a83d0-54b5-4f17-b5e3-39efbf6a0422'),
(22, 'craft', 'm160727_194637_column_cleanup', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '09fdec98-4795-4185-92e0-9db4ee17fb65'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'a44747b0-02cd-43c1-ae76-7aeaee4a2e05'),
(24, 'craft', 'm160807_144858_sites', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '61f5d1eb-8590-4fa3-b424-6e1671ea0bda'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '3dfedd21-987d-471f-b965-6d83ba0ac648'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '74c5c124-5f5a-49b8-ae2f-41e4e4cad550'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'ec50b3f8-872d-4cd0-a110-010c913d2d5a'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '3efa0d94-21a6-451e-acf1-bccdf7f81510'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'fdaf50f2-6aac-470d-9890-aeb950bc2c88'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'd738b28d-0b8d-4963-a383-375cd1e88e00'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'abb1fa52-6001-45f1-a7f1-b18226e493c6'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '56088aa7-57c8-48be-a879-024a13863030'),
(33, 'craft', 'm161007_130653_update_email_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2f49517d-e1c7-4da6-a9bf-f03b91e12862'),
(34, 'craft', 'm161013_175052_newParentId', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '071cea6e-9d5f-430f-bb58-0a5729a42200'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'f0aa31ee-ed30-4ada-aac8-d8cac1778f76'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '68e0227c-acd9-44d7-a222-6bcb7f778a34'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '6be6c310-b75b-4426-a5dc-effaba3cb565'),
(38, 'craft', 'm161029_124145_email_message_languages', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '0bb43dc0-73eb-4d4f-a26d-51ec9e03e931'),
(39, 'craft', 'm161108_000000_new_version_format', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '81d3447b-9044-4204-9cd5-5fbf8a56daa8'),
(40, 'craft', 'm161109_000000_index_shuffle', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'd3fbc84a-e212-4680-849e-81c81c54bc03'),
(41, 'craft', 'm161122_185500_no_craft_app', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'a66b93bd-57a2-4c59-b85b-4ff4bef30cf9'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '074dfea1-7bc2-4b3c-b565-6623f9959dd2'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'c8813348-1ad0-4ce5-806b-170ad03e4c08'),
(44, 'craft', 'm170114_161144_udates_permission', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '438a5d57-3fa8-4f58-8bf7-449f95e92bfc'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '5c587787-6e2a-49f9-b208-b5303bbca0ff'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '1a41546e-0159-4bf0-8ba8-afbc10e63ebc'),
(47, 'craft', 'm170206_142126_system_name', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2cef0a38-f789-4b58-bffd-de5d6012ab55'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'f368e3a5-5302-4a16-8353-18d66879d249'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'ce3c9322-226a-4483-89e9-7e52468e26b7'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'ae3f834a-8e46-495d-a4da-f06a77ad82d0'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '6df06ede-4d03-45db-87c3-1bb81678fc07'),
(52, 'craft', 'm170228_171113_system_messages', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '48a553d6-0db7-4cd7-ba23-0b8e9a96f1d9'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '76062935-c756-4246-a16b-ffbfe7064412'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'b7b0e2fa-0072-4087-8340-cfcd66e55dff'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '5e031b5a-7588-4963-a9da-d907ca5052fd'),
(56, 'craft', 'm170612_000000_route_index_shuffle', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '20a84892-af6a-49cd-809f-50259b1350ef'),
(57, 'craft', 'm170621_195237_format_plugin_handles', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '4b963f44-78bf-401a-b1d3-432bab313318'),
(58, 'craft', 'm170630_161027_deprecation_line_nullable', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'cdbb71c3-ad62-4dcc-9660-4ca889e2aba0'),
(59, 'craft', 'm170630_161028_deprecation_changes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '009f5241-f295-45b9-8b4d-61eb3e58a190'),
(60, 'craft', 'm170703_181539_plugins_table_tweaks', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '8b514c5b-aba6-40f3-a2fa-9500c0ae1600'),
(61, 'craft', 'm170704_134916_sites_tables', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'dbc3d216-c5a3-4131-a8c2-7a257ecb72c7'),
(62, 'craft', 'm170706_183216_rename_sequences', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'c7a1d649-44b7-413d-b089-3a9bc03e02b0'),
(63, 'craft', 'm170707_094758_delete_compiled_traits', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'cb494e4b-9dc1-4bf2-b836-811a4582e472'),
(64, 'craft', 'm170731_190138_drop_asset_packagist', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '67b98c36-5d92-4c8c-91b8-2c8c1952463e'),
(65, 'craft', 'm170810_201318_create_queue_table', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '53962d83-eac5-457e-926b-6109dbab05d3'),
(66, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'c90bf3a1-7bd0-469f-bc65-e1c0449a8a1d'),
(67, 'craft', 'm170914_204621_asset_cache_shuffle', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'e39b0040-c75b-43df-9c5b-0e5b8252ce1f'),
(68, 'craft', 'm171011_214115_site_groups', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '52a27e6c-3b79-42e5-bd01-165ec7481040'),
(69, 'craft', 'm171012_151440_primary_site', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '8a1d7e92-3557-4e03-bfe6-9b4089a08f60'),
(70, 'craft', 'm171013_142500_transform_interlace', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '473cf4c2-f819-46bf-8d9e-edfb9fb3ff47'),
(71, 'craft', 'm171016_092553_drop_position_select', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '4fc11510-0767-4d04-bec9-2f667dcce865'),
(72, 'craft', 'm171016_221244_less_strict_translation_method', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '660b9836-eba9-42b1-b0ec-6d3bdd1cb726'),
(73, 'craft', 'm171107_000000_assign_group_permissions', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '90019366-69e9-4857-b96b-f24ad404f644'),
(74, 'craft', 'm171117_000001_templatecache_index_tune', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'e4152254-8b6f-44d5-917e-b67b82694f36'),
(75, 'craft', 'm171126_105927_disabled_plugins', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '9f250a65-bab4-4a06-90c8-b551209bbebb'),
(76, 'craft', 'm171130_214407_craftidtokens_table', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'b09c95c0-9d3c-4de5-94f9-6019bf567ad7'),
(77, 'craft', 'm171202_004225_update_email_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'f0e2db16-af69-489d-9c45-8ffe8aa74caa'),
(78, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '516997da-d6ac-456d-93ed-2538dc1f78a4'),
(79, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '3458eebe-9a16-46be-bcbb-9dc49d60dae5'),
(80, 'craft', 'm171218_143135_longtext_query_column', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '1da82770-b2d0-4724-87e2-199d19eff47c'),
(81, 'craft', 'm171231_055546_environment_variables_to_aliases', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'ec5401d6-a457-451b-b3a1-c798a71d6e64'),
(82, 'craft', 'm180113_153740_drop_users_archived_column', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'bcc57503-9871-463e-8d0d-8aae7dc04039'),
(83, 'craft', 'm180122_213433_propagate_entries_setting', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '66892f2b-2623-412b-b63e-699c97cbf3ba'),
(84, 'craft', 'm180124_230459_fix_propagate_entries_values', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'cddf84ce-dbae-446b-b560-bb117333a7e3'),
(85, 'craft', 'm180128_235202_set_tag_slugs', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'ca1f524e-a021-4a57-ac35-6bb4c7028552'),
(86, 'craft', 'm180202_185551_fix_focal_points', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '4aa3192f-94e5-4927-83f2-57e829a4acf0'),
(87, 'craft', 'm180217_172123_tiny_ints', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '9e71232e-43e8-4d89-b1c1-40d79fa68a29'),
(88, 'craft', 'm180321_233505_small_ints', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '268b59d7-48ed-4901-8e2a-45ef949e428b'),
(89, 'craft', 'm180328_115523_new_license_key_statuses', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '422debca-8b54-4cfa-b052-12080f07b8bc'),
(90, 'craft', 'm180404_182320_edition_changes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '5049f3d2-28e4-409b-b87e-71f32af6fbfe'),
(91, 'craft', 'm180411_102218_fix_db_routes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '45774719-e2a3-4064-86b9-53fb479ddf9d'),
(92, 'craft', 'm180416_205628_resourcepaths_table', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '519974ee-d421-4a34-b762-341289ffb4ac'),
(93, 'craft', 'm180418_205713_widget_cleanup', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'ce313898-25fa-4bfd-bfef-15de1ab387c5'),
(94, 'craft', 'm180425_203349_searchable_fields', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '411c027f-1450-462d-8ce5-e0e3af57f5cf'),
(95, 'craft', 'm180516_153000_uids_in_field_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'c4e9e467-b74a-4476-a480-9fcb8b8dbca5'),
(96, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'cfb993cd-01cb-4407-a659-2bdcdc7dbc0d'),
(97, 'craft', 'm180518_173000_permissions_to_uid', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '4dfced45-3082-45bc-8051-394ba6ec0305'),
(98, 'craft', 'm180520_173000_matrix_context_to_uids', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'cd0bbd28-a728-4a4c-8cd9-20ef94b59be2'),
(99, 'craft', 'm180521_172900_project_config_table', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '93a202fe-3044-487b-9862-a729ffde5f1f'),
(100, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '299c8076-2d71-4a00-b635-b80223924a31'),
(101, 'craft', 'm180731_162030_soft_delete_sites', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '372f693b-644c-4281-8820-f09d083d3efe'),
(102, 'craft', 'm180810_214427_soft_delete_field_layouts', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'badc73ca-fd43-43e9-a0e6-fd6c1bd51527'),
(103, 'craft', 'm180810_214439_soft_delete_elements', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '870680f9-ab45-41e6-b702-4713ea401eb8'),
(104, 'craft', 'm180824_193422_case_sensitivity_fixes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'fee75a10-13d8-4bb9-a409-90cc7543b223'),
(105, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '0aa0e916-647c-4109-adb9-04224f8914d6'),
(106, 'craft', 'm180904_112109_permission_changes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '6a52e26d-3644-4425-a3ad-e4a8286ed2d1'),
(107, 'craft', 'm180910_142030_soft_delete_sitegroups', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'afff1447-693e-4af5-bde7-5789c1277461'),
(108, 'craft', 'm181011_160000_soft_delete_asset_support', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '0b921d33-6930-4bcd-a4b8-f6b58f1f2a1d'),
(109, 'craft', 'm181016_183648_set_default_user_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '795e11b6-4292-4f74-b297-7c83dcc2c6da'),
(110, 'craft', 'm181017_225222_system_config_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '511a36f7-1478-4c19-9e87-539e93005b23'),
(111, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'e660be49-a22c-4912-8db4-7dd1a5798cc3'),
(112, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '6199a992-4f2c-41db-9243-642651b5bc48'),
(113, 'craft', 'm181112_203955_sequences_table', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '80ef7e15-fd1f-4c08-b226-e19aab611c2a'),
(114, 'craft', 'm181121_001712_cleanup_field_configs', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'a8f14ba1-a973-44c0-a3e3-edc941b40ff4'),
(115, 'craft', 'm181128_193942_fix_project_config', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'ba4a004f-30c5-4f5c-8ffa-066fb529ccc2'),
(116, 'craft', 'm181130_143040_fix_schema_version', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '6ff70875-246c-4d99-b6a8-9630a56bd506'),
(117, 'craft', 'm181211_143040_fix_entry_type_uids', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '71ff5e0d-fae1-4b78-ac22-ea9a3131e961'),
(118, 'craft', 'm181217_153000_fix_structure_uids', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '3a5faafa-0d79-4302-ae9a-118032cdf085'),
(119, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'f5ea13d2-552c-404c-b4a5-d8f5edc79d8b'),
(120, 'craft', 'm190108_110000_cleanup_project_config', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '739e64ef-9edd-4761-a903-eae16c52b0c3'),
(121, 'craft', 'm190108_113000_asset_field_setting_change', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '7ad1160c-5c11-49bf-89b0-4791affe1562'),
(122, 'craft', 'm190109_172845_fix_colspan', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'd7fc2b62-208c-4c47-8744-ee19f74c1aff'),
(123, 'craft', 'm190110_150000_prune_nonexisting_sites', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '01ca0215-2f2e-4137-920a-a2897131117b'),
(124, 'craft', 'm190110_214819_soft_delete_volumes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'c9233fad-0c4e-4b6f-979b-3b4f188d187c'),
(125, 'craft', 'm190112_124737_fix_user_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '21e9b77b-de00-4c98-86e3-c81a617a70c7'),
(126, 'craft', 'm190112_131225_fix_field_layouts', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '45760a41-48b6-4ca3-8956-37a370b28de4'),
(127, 'craft', 'm190112_201010_more_soft_deletes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '6f1cc14b-342e-4fb5-9e79-e4eee43e19c8'),
(128, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '636a9f04-8bba-41b0-99e0-2e37e5a4be69'),
(129, 'craft', 'm190121_120000_rich_text_config_setting', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '87eed8b7-1716-485e-92ba-a430ac06f70f'),
(130, 'craft', 'm190125_191628_fix_email_transport_password', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '6cfbd648-29fe-4273-8e0e-c3bb30e938d5'),
(131, 'craft', 'm190128_181422_cleanup_volume_folders', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '8cd27f48-84d7-4261-9928-7bcb21f349fb'),
(132, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'b3e9b589-bb9e-4f77-9d91-a147a1ad9d04'),
(133, 'craft', 'm190218_143000_element_index_settings_uid', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '77357b2c-48fc-477e-8911-9e2208ce1f2c'),
(134, 'craft', 'm190312_152740_element_revisions', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'c27d6cba-f70a-4119-82eb-cfd4d507a347'),
(135, 'craft', 'm190327_235137_propagation_method', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'd9a2f350-1440-487f-a1f9-6a78569f6247'),
(136, 'craft', 'm190401_223843_drop_old_indexes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '39d4d770-b345-4429-b5b9-f9fdffb27cb4'),
(137, 'craft', 'm190416_014525_drop_unique_global_indexes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '576c0d01-b635-47f8-a68d-aeabcc7082ac'),
(138, 'craft', 'm190417_085010_add_image_editor_permissions', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2629f58b-8fe5-46e5-8fb9-d1293a070060'),
(139, 'craft', 'm190502_122019_store_default_user_group_uid', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '984fd303-038f-413d-9a3a-3d23e6402054'),
(140, 'craft', 'm190504_150349_preview_targets', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '98ab58d7-24b6-4db2-8764-c28e0acbaada'),
(141, 'craft', 'm190516_184711_job_progress_label', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'c33a8705-1dec-4430-a923-dfaf30c84c5a'),
(142, 'craft', 'm190523_190303_optional_revision_creators', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'f5e3314b-822b-48d4-a5cd-82132af158d4'),
(143, 'craft', 'm190529_204501_fix_duplicate_uids', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '6887e235-3aa8-4538-ae18-fad250506f87'),
(144, 'craft', 'm190605_223807_unsaved_drafts', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'c9cddccf-7e8d-4071-adf7-f9e0bb83a1fc'),
(145, 'craft', 'm190607_230042_entry_revision_error_tables', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'dc1f2ec9-d4a9-4600-8ecc-ba922692a2bd'),
(146, 'craft', 'm190608_033429_drop_elements_uid_idx', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'e6151d86-4e3a-459b-9f6d-dcb65487667f'),
(147, 'craft', 'm190617_164400_add_gqlschemas_table', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '5a88884d-d8db-48e2-bbdc-43d3d81b382f'),
(148, 'craft', 'm190624_234204_matrix_propagation_method', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'ae07175e-b608-4913-af40-6becb10a06c9'),
(149, 'craft', 'm190711_153020_drop_snapshots', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'f40fcdb1-4a15-42e3-a9e2-a171eab024ec'),
(150, 'craft', 'm190712_195914_no_draft_revisions', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'ee63e9f0-e973-4b0f-87ba-5cab3bbf32af'),
(151, 'craft', 'm190723_140314_fix_preview_targets_column', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'e67f379b-9287-445b-8eb9-3a008c767ab6'),
(152, 'craft', 'm190820_003519_flush_compiled_templates', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '826e491e-7cb3-4e2a-8a49-b8c63229b53c'),
(153, 'craft', 'm190823_020339_optional_draft_creators', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '1cb1f6df-1e34-452e-808a-ef556171d02b'),
(154, 'craft', 'm190913_152146_update_preview_targets', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '7d1454c7-324e-4dff-8fc9-ddea93fa179f'),
(155, 'craft', 'm191107_122000_add_gql_project_config_support', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'fc5fbc05-b31d-41c4-8e29-94306adb0208'),
(156, 'craft', 'm191204_085100_pack_savable_component_settings', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '1b5df3f4-d556-4711-9f58-eaf05115a1e7'),
(157, 'craft', 'm191206_001148_change_tracking', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'a58b6262-2407-4892-8812-0b8e9f59bca4'),
(158, 'craft', 'm191216_191635_asset_upload_tracking', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'c3b48ab9-c6a0-4ae0-8155-de511ebbbbaa'),
(159, 'craft', 'm191222_002848_peer_asset_permissions', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '242d02f4-bcf4-4525-8f53-4bd9af128353'),
(160, 'craft', 'm200127_172522_queue_channels', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '488c3d64-4b8f-46cd-830e-6ed95963a3f2'),
(161, 'craft', 'm200211_175048_truncate_element_query_cache', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'daca049b-9add-4713-8d35-ec1d8cfca9d4'),
(162, 'craft', 'm200213_172522_new_elements_index', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '1abcbbe7-b12d-4ba2-badb-eca8d863dc84'),
(163, 'craft', 'm200228_195211_long_deprecation_messages', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '0cc15390-3dd4-4a0c-839a-38f232d70685'),
(164, 'craft', 'm200306_054652_disabled_sites', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'b3a7897a-7f8a-43f2-921e-5a79c8a07c91'),
(165, 'craft', 'm200522_191453_clear_template_caches', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'fc53ee91-45f1-4e91-b60d-5d3d4c754c5e'),
(166, 'craft', 'm200606_231117_migration_tracks', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '50d34e2e-a159-4671-bf39-f34407b84da3'),
(167, 'craft', 'm200619_215137_title_translation_method', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '5d402856-c21c-4043-b18d-d38597e82d29'),
(168, 'craft', 'm200620_005028_user_group_descriptions', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'b3f1694c-357a-4dd3-85f6-2826bc49de36'),
(169, 'craft', 'm200620_230205_field_layout_changes', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '8f40393a-8689-408c-af29-e92d7b336431'),
(170, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'cca9808c-1710-4b5f-a5ff-d5d4a87696ab'),
(171, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'a0ec4fa8-25c6-4ee2-9e10-212074e55514'),
(172, 'craft', 'm200630_183000_drop_configmap', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '17bf7284-9d41-449a-a5e2-1e0d9cb200ba'),
(173, 'craft', 'm200715_113400_transform_index_error_flag', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '48bb39f1-3594-46ad-9ea8-89d5c45b4574'),
(174, 'craft', 'm200716_110900_replace_file_asset_permissions', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'b62164bb-706a-43df-89c8-faf862905249'),
(175, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'eff0d19f-4247-492e-bbf9-de72ada39c05'),
(176, 'craft', 'm200720_175543_drop_unique_constraints', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'cd2f467a-36a2-4a76-b394-e10d5a166a8d'),
(177, 'craft', 'm200825_051217_project_config_version', '2020-09-14 08:05:26', '2020-09-14 08:05:26', '2020-09-14 08:05:26', 'bf66f4ed-0603-42d4-bc47-f3f5880f4735'),
(178, 'plugin:redactor', 'm180430_204710_remove_old_plugins', '2020-09-14 09:06:01', '2020-09-14 09:06:01', '2020-09-14 09:06:01', '40205243-e957-4302-8c95-414f718e7335'),
(179, 'plugin:redactor', 'Install', '2020-09-14 09:06:01', '2020-09-14 09:06:01', '2020-09-14 09:06:01', '5ba7cb1c-433c-45b2-8c45-93e18dacc6f1'),
(180, 'plugin:redactor', 'm190225_003922_split_cleanup_html_settings', '2020-09-14 09:06:01', '2020-09-14 09:06:01', '2020-09-14 09:06:01', '66d3f9be-aba6-4e55-b18f-d68c36e5615f');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'redactor', '2.7.4', '2.3.0', 'unknown', NULL, '2020-09-14 09:06:01', '2020-09-14 09:06:01', '2020-09-17 13:28:18', 'c4c7bccf-af70-46c3-8417-d8ac4b085397'),
(2, 'cheat-sheet', '2.0.3', '1.0.0', 'unknown', NULL, '2020-09-14 09:06:32', '2020-09-14 09:06:32', '2020-09-17 13:28:18', 'ad5d94f9-0fdf-4d8b-a3a6-950d31e43a58');

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.autocapitalize', 'true'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.autocomplete', 'false'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.autocorrect', 'true'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.class', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.disabled', 'false'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.id', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.instructions', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.label', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.max', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.min', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.name', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.orientation', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.placeholder', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.readonly', 'false'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.requirable', 'false'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.size', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.step', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.tip', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.title', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.warning', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.0.width', '100'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.1.fieldUid', '\"5b285790-8f09-4d88-9df8-230f175d34aa\"'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.1.instructions', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.1.label', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.1.required', 'false'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.1.tip', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.1.warning', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.elements.1.width', '100'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.name', '\"Content\"'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.fieldLayouts.35feebdf-adbc-4185-8fb6-a9d56fb4e04f.tabs.0.sortOrder', '1'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.handle', '\"navigationTopics\"'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.name', '\"Navigation topics\"'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'true'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.template', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.uriFormat', '\"navigation-topics/{slug}\"'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.structure.maxLevels', 'null'),
('categoryGroups.3a7eb026-21bc-4104-8b48-f870b7d9b8d6.structure.uid', '\"a1952835-40ac-4add-b52d-778f936f3148\"'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.autocapitalize', 'true'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.autocomplete', 'false'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.autocorrect', 'true'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.class', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.disabled', 'false'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.id', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.instructions', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.label', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.max', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.min', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.name', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.orientation', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.placeholder', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.readonly', 'false'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.requirable', 'false'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.size', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.step', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.tip', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.title', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.warning', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.0.width', '100'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.1.fieldUid', '\"5b285790-8f09-4d88-9df8-230f175d34aa\"'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.1.instructions', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.1.label', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.1.required', 'false'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.1.tip', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.1.warning', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.elements.1.width', '100'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.name', '\"Content\"'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.fieldLayouts.bf6432ed-a44f-4842-a41c-c7d3e3332e57.tabs.0.sortOrder', '1'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.handle', '\"footerCategories\"'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.name', '\"Footer categories\"'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'true'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.template', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.uriFormat', '\"footer-categories/{slug}\"'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.structure.maxLevels', 'null'),
('categoryGroups.de77b476-6dea-4810-8fdb-0e13f7783b51.structure.uid', '\"e820c7a4-c32a-49ca-9310-2e830aa03867\"'),
('dateModified', '1600349180'),
('email.fromEmail', '\"lidija.suprina@creative-square.agency\"'),
('email.fromName', '\"school.test\"'),
('email.replyToEmail', 'null'),
('email.template', 'null'),
('email.transportSettings.command', '\"\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.class', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.disabled', 'false'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.id', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.instructions', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.label', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.max', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.min', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.name', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.orientation', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.readonly', 'false'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.requirable', 'false'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.size', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.step', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.tip', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.title', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.warning', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.0.width', '100'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.1.fieldUid', '\"85e693d4-43fa-4350-9216-28f926cfa9bb\"'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.1.instructions', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.1.label', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.1.required', 'false'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.1.tip', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.1.warning', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.1.width', '100'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.2.fieldUid', '\"5c91fda2-e84e-4484-bd53-c79ed3381b02\"'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.2.instructions', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.2.label', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.2.required', 'false'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.2.tip', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.2.warning', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.elements.2.width', '100'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.name', '\"Content\"'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.fieldLayouts.9fdf5b93-2e5d-4655-b219-5ad2d9d3817a.tabs.0.sortOrder', '1'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.handle', '\"hero\"'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.hasTitleField', 'true'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.name', '\"Hero\"'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.section', '\"ef251137-89c9-4576-aa61-14697e629903\"'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.sortOrder', '1'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.titleFormat', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.titleTranslationKeyFormat', 'null'),
('entryTypes.11206ff2-5be9-4e2a-a70d-150ad060d929.titleTranslationMethod', '\"site\"'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.class', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.disabled', 'false'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.id', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.instructions', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.label', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.max', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.min', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.name', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.orientation', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.readonly', 'false'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.requirable', 'false'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.size', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.step', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.tip', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.title', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.warning', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.0.width', '100'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.1.fieldUid', '\"5c91fda2-e84e-4484-bd53-c79ed3381b02\"'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.1.instructions', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.1.label', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.1.required', 'false'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.1.tip', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.1.warning', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.1.width', '100'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.2.fieldUid', '\"1784873d-1ebf-4125-8d11-8c4ef2ac050d\"'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.2.instructions', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.2.label', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.2.required', 'false'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.2.tip', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.2.warning', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.elements.2.width', '100'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.name', '\"Content\"'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.fieldLayouts.0f2e00b2-39a0-45d9-934d-5d163c1c1891.tabs.0.sortOrder', '1'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.handle', '\"studentsInAction\"'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.hasTitleField', 'true'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.name', '\"Students in action\"'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.section', '\"7d39eb22-1737-4478-9f1d-2a40252eb160\"'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.sortOrder', '1'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.titleFormat', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.titleTranslationKeyFormat', 'null'),
('entryTypes.1e08c63f-2d29-4e53-a778-7f8db6b2f268.titleTranslationMethod', '\"site\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.class', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.disabled', 'false'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.id', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.instructions', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.label', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.max', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.min', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.name', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.orientation', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.readonly', 'false'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.requirable', 'false'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.size', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.step', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.tip', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.title', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.warning', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.0.width', '100'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.1.fieldUid', '\"0e88b4f5-9ec7-46e9-83a8-eea51f1f932e\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.1.instructions', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.1.label', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.1.required', 'false'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.1.tip', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.1.warning', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.1.width', '100'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.2.fieldUid', '\"9f710753-6962-4083-a7bf-e359f9a3651b\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.2.instructions', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.2.label', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.2.required', 'false'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.2.tip', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.2.warning', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.2.width', '100'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.3.fieldUid', '\"160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.3.instructions', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.3.label', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.3.required', 'false'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.3.tip', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.3.warning', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.3.width', '100'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.4.fieldUid', '\"f5da9f1e-a4a1-4a78-84c0-9728608c768f\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.4.instructions', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.4.label', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.4.required', 'false'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.4.tip', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.4.warning', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.elements.4.width', '100'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.name', '\"Content\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.fieldLayouts.50894fd3-2b06-4ae6-9f0c-f0cb8c587053.tabs.0.sortOrder', '1'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.handle', '\"navbar\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.hasTitleField', 'false'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.name', '\"Navbar\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.section', '\"57d4f7a3-5e87-4d16-aed6-a1e1e2c995b1\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.sortOrder', '1'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.titleFormat', '\"Navigation bar\"'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.titleTranslationKeyFormat', 'null'),
('entryTypes.353f9f56-8f86-40d0-bf4a-cb435c5b0852.titleTranslationMethod', '\"site\"'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.class', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.disabled', 'false'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.id', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.instructions', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.label', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.max', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.min', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.name', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.orientation', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.readonly', 'false'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.requirable', 'false'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.size', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.step', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.tip', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.title', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.warning', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.0.width', '100'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.1.fieldUid', '\"e0f343f5-bf12-49eb-b74e-b89a08a92090\"'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.1.instructions', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.1.label', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.1.required', 'false'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.1.tip', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.1.warning', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.elements.1.width', '100'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.name', '\"Content\"'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.fieldLayouts.af1e2707-126a-41ae-a9c3-7feb5fb6156f.tabs.0.sortOrder', '1'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.handle', '\"homepage\"'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.hasTitleField', 'false'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.name', '\"Homepage\"'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.section', '\"87a3d3d6-7170-474f-b761-21ff0fbcd43e\"'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.sortOrder', '1'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.titleFormat', '\"Homepage\"'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.titleTranslationKeyFormat', 'null'),
('entryTypes.4c3bce72-b007-4cb3-9f19-f572b6b15abd.titleTranslationMethod', '\"site\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.class', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.disabled', 'false'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.id', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.instructions', '\"\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.label', '\"\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.max', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.min', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.name', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.orientation', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.readonly', 'false'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.requirable', 'false'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.size', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.step', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.tip', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.title', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.warning', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.0.width', '100'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.1.fieldUid', '\"5c91fda2-e84e-4484-bd53-c79ed3381b02\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.1.instructions', '\"\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.1.label', '\"Background image\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.1.required', '\"\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.1.tip', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.1.warning', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.1.width', '100'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.2.fieldUid', '\"063f1856-6981-4caa-85ca-5a2842fe313f\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.2.instructions', '\"\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.2.label', '\"Page blocks\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.2.required', '\"\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.2.tip', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.2.warning', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.elements.2.width', '100'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.name', '\"Content\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.fieldLayouts.ae71e2a0-b399-464c-bb95-0d9199f0d7f9.tabs.0.sortOrder', '1'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.handle', '\"aboutUs\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.hasTitleField', 'true'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.name', '\"About us\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.section', '\"98a22aa3-561d-407e-b1ad-5bba63d6eb71\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.sortOrder', '1'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.titleTranslationKeyFormat', 'null'),
('entryTypes.4f3bfcd0-e6cf-4fee-a723-e0c9b4a98454.titleTranslationMethod', '\"site\"'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.class', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.disabled', 'false'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.id', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.instructions', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.label', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.max', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.min', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.name', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.orientation', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.readonly', 'false'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.requirable', 'false'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.size', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.step', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.tip', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.title', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.warning', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.0.width', '100'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.1.fieldUid', '\"3a6afe25-67a1-4b72-ae4c-12618a865d72\"'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.1.instructions', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.1.label', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.1.required', 'false'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.1.tip', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.1.warning', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.elements.1.width', '100'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.name', '\"Content\"'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.fieldLayouts.cb3278a8-2b36-4cf0-bf68-a11894c5f4fa.tabs.0.sortOrder', '1'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.handle', '\"cards\"'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.hasTitleField', 'true'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.name', '\"Cards\"'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.section', '\"ddaf32a5-8670-415d-8b4c-8118092a7fd4\"'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.sortOrder', '1'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.titleFormat', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.titleTranslationKeyFormat', 'null'),
('entryTypes.52708ddf-bfa8-4738-88ff-03538b88e26a.titleTranslationMethod', '\"site\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.class', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.disabled', 'false'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.id', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.instructions', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.label', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.max', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.min', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.name', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.orientation', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.readonly', 'false'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.requirable', 'false'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.size', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.step', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.tip', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.title', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.warning', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.0.width', '100'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.1.fieldUid', '\"6b338a19-9dc3-4a10-9fa7-d324f5c60c4d\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.1.instructions', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.1.label', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.1.required', 'false'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.1.tip', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.1.warning', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.1.width', '100'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.2.fieldUid', '\"80a2f56c-8091-4197-96f4-e6cb985dccde\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.2.instructions', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.2.label', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.2.required', 'false'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.2.tip', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.2.warning', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.2.width', '100'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.3.fieldUid', '\"0e88b4f5-9ec7-46e9-83a8-eea51f1f932e\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.3.instructions', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.3.label', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.3.required', 'false'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.3.tip', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.3.warning', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.3.width', '100'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.4.fieldUid', '\"9f710753-6962-4083-a7bf-e359f9a3651b\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.4.instructions', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.4.label', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.4.required', 'false'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.4.tip', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.4.warning', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.4.width', '100'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.5.fieldUid', '\"315091b6-8d01-4b11-8790-47438044dbcf\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.5.instructions', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.5.label', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.5.required', 'false'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.5.tip', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.5.warning', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.5.width', '100'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.6.fieldUid', '\"160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.6.instructions', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.6.label', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.6.required', 'false'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.6.tip', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.6.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.6.warning', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.elements.6.width', '100'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.name', '\"Content\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.fieldLayouts.b83fb6fd-c146-48a3-b240-25d8e72c900a.tabs.0.sortOrder', '1'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.handle', '\"footer\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.hasTitleField', 'false'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.name', '\"Footer\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.section', '\"f3802f9e-1863-4142-bed5-62a1dd9f0e7a\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.sortOrder', '1'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.titleTranslationKeyFormat', 'null'),
('entryTypes.7475433f-874a-44d6-aebc-7b8fd3a84c76.titleTranslationMethod', '\"site\"'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.class', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.disabled', 'false'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.id', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.instructions', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.label', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.max', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.min', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.name', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.orientation', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.readonly', 'false'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.requirable', 'false'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.size', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.step', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.tip', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.title', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.warning', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.0.width', '100'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.1.fieldUid', '\"e12922f2-d58c-47c0-890e-5d5f5f1dc98b\"'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.1.instructions', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.1.label', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.1.required', 'false'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.1.tip', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.1.warning', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.elements.1.width', '100'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.name', '\"Content\"'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.fieldLayouts.2220dcce-c9e2-4478-bf1f-0c3a8dfa7a84.tabs.0.sortOrder', '1'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.handle', '\"youtube\"'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.hasTitleField', 'true'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.name', '\"Youtube\"'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.section', '\"093c3fe9-83bd-41d7-a933-c3e656f3574c\"'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.sortOrder', '1'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.titleFormat', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.titleTranslationKeyFormat', 'null'),
('entryTypes.748a09d7-f878-4c49-9ed7-b11e17b11403.titleTranslationMethod', '\"site\"'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.class', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.disabled', 'false'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.id', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.instructions', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.label', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.max', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.min', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.name', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.orientation', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.readonly', 'false'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.requirable', 'false'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.size', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.step', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.tip', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.title', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.warning', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.0.width', '100'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.1.fieldUid', '\"85e693d4-43fa-4350-9216-28f926cfa9bb\"'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.1.instructions', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.1.label', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.1.required', 'false'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.1.tip', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.1.warning', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.1.width', '100'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.2.fieldUid', '\"d98e34e6-36c6-40af-bee4-4adab40fad3c\"'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.2.instructions', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.2.label', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.2.required', 'false'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.2.tip', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.2.warning', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.elements.2.width', '100'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.name', '\"Content\"'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.fieldLayouts.1dfef4f7-4214-455a-8929-8a90ed2de632.tabs.0.sortOrder', '1'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.handle', '\"event\"'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.hasTitleField', 'true'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.name', '\"Event\"'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.section', '\"c7fec439-ba6f-4143-9a75-eac421fb0280\"'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.sortOrder', '1'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.titleFormat', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.titleTranslationKeyFormat', 'null'),
('entryTypes.a182e4c0-fef9-4e45-94ba-eddfbd95471f.titleTranslationMethod', '\"site\"'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.class', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.disabled', 'false'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.id', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.instructions', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.label', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.max', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.min', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.name', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.orientation', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.readonly', 'false'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.requirable', 'false'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.size', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.step', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.tip', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.title', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.warning', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.0.width', '100'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.1.fieldUid', '\"f5fd202b-8a13-49c8-a6af-c542fb5c5fbf\"'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.1.instructions', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.1.label', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.1.required', 'false'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.1.tip', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.1.warning', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.elements.1.width', '100'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.name', '\"Content\"'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.fieldLayouts.22b9e509-a583-4761-80cb-8053f690fd01.tabs.0.sortOrder', '1'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.handle', '\"document\"'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.hasTitleField', 'true'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.name', '\"Document\"'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.section', '\"4536c42b-f61b-49b7-a666-1bdbdf3d3bb8\"'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.sortOrder', '1'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.titleFormat', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.titleTranslationKeyFormat', 'null'),
('entryTypes.dc5d839a-b3c7-4d47-b874-c706fcc06741.titleTranslationMethod', '\"site\"'),
('fieldGroups.6b1219ff-213c-4e36-abd9-4bba5cbe3f35.name', '\"Common\"'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.contentColumnType', '\"string\"'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.handle', '\"aboutPageBlocks\"'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.instructions', '\"\"'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.name', '\"About page blocks\"'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.searchable', 'false'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.settings.contentTable', '\"{{%matrixcontent_aboutpageblocks}}\"'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.settings.maxBlocks', '\"\"'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.settings.minBlocks', '\"\"'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.settings.propagationMethod', '\"all\"'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.translationKeyFormat', 'null'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.translationMethod', '\"site\"'),
('fields.063f1856-6981-4caa-85ca-5a2842fe313f.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.contentColumnType', '\"string\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.handle', '\"logo\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.instructions', '\"\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.name', '\"Logo\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.searchable', 'false'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.allowedKinds', 'null'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.allowSelfRelations', 'false'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.defaultUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.defaultUploadLocationSubpath', '\"\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.limit', '\"1\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.localizeRelations', 'false'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.restrictFiles', '\"\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.selectionLabel', '\"\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.showSiteMenu', 'true'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.showUnpermittedFiles', 'false'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.showUnpermittedVolumes', 'false'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.singleUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.singleUploadLocationSubpath', '\"\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.source', 'null'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.sources.0', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.targetSiteId', 'null'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.useSingleFolder', 'false'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.validateRelatedElements', 'false'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.settings.viewMode', '\"list\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.translationKeyFormat', 'null'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.translationMethod', '\"site\"'),
('fields.0e88b4f5-9ec7-46e9-83a8-eea51f1f932e.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.contentColumnType', '\"string\"'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.handle', '\"socialNetworks\"'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.instructions', '\"\"'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.name', '\"Social networks\"'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.searchable', 'false'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.settings.contentTable', '\"{{%matrixcontent_socialnetworks}}\"'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.settings.maxBlocks', '\"\"'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.settings.minBlocks', '\"\"'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.settings.propagationMethod', '\"all\"'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.translationKeyFormat', 'null'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.translationMethod', '\"site\"'),
('fields.160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.contentColumnType', '\"string\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.handle', '\"pdfpresentation\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.instructions', '\"\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.name', '\"pdfPresentation\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.searchable', 'false'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.allowedKinds', 'null'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.allowSelfRelations', 'false'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.defaultUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.defaultUploadLocationSubpath', '\"\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.limit', '\"1\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.localizeRelations', 'false'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.restrictFiles', '\"\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.selectionLabel', '\"\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.showSiteMenu', 'true'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.showUnpermittedFiles', 'false'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.showUnpermittedVolumes', 'false'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.singleUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.singleUploadLocationSubpath', '\"\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.source', 'null'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.sources.0', '\"volume:6175f870-5bd3-44ef-a8b4-7066f710a2a3\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.targetSiteId', 'null'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.useSingleFolder', 'false'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.validateRelatedElements', 'false'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.settings.viewMode', '\"list\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.translationKeyFormat', 'null'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.translationMethod', '\"site\"'),
('fields.1784873d-1ebf-4125-8d11-8c4ef2ac050d.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.contentColumnType', '\"text\"'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.handle', '\"learnMoreLabel\"'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.instructions', '\"\"'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.name', '\"Learn more label\"'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.searchable', 'false'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.settings.byteLimit', 'null'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.settings.charLimit', 'null'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.settings.code', '\"\"'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.settings.columnType', 'null'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.settings.initialRows', '\"4\"'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.settings.multiline', '\"\"'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.settings.placeholder', '\"\"'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.settings.uiMode', '\"normal\"'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.translationKeyFormat', 'null'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.translationMethod', '\"none\"'),
('fields.23b45aa3-721a-4395-9c74-59d4a180aa45.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.contentColumnType', '\"text\"'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.handle', '\"moreInfoLabel\"'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.instructions', '\"\"'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.name', '\"More info label\"'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.searchable', 'false'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.settings.byteLimit', 'null'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.settings.charLimit', 'null'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.settings.code', '\"\"'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.settings.columnType', 'null'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.settings.initialRows', '\"4\"'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.settings.multiline', '\"\"'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.settings.placeholder', '\"\"'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.settings.uiMode', '\"normal\"'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.translationKeyFormat', 'null'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.translationMethod', '\"none\"'),
('fields.2a3f8c96-0aee-410f-868f-a675681c471f.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.contentColumnType', '\"string\"'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.handle', '\"footerDocs\"'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.instructions', '\"\"'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.name', '\"Footer docs\"'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.searchable', 'false'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.settings.allowSelfRelations', 'false'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.settings.limit', '\"\"'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.settings.localizeRelations', 'false'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.settings.selectionLabel', '\"\"'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.settings.showSiteMenu', 'true'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.settings.source', 'null'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.settings.sources.0', '\"section:4536c42b-f61b-49b7-a666-1bdbdf3d3bb8\"'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.settings.targetSiteId', 'null'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.settings.validateRelatedElements', 'false'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.settings.viewMode', 'null'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.translationKeyFormat', 'null'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.translationMethod', '\"site\"'),
('fields.315091b6-8d01-4b11-8790-47438044dbcf.type', '\"craft\\\\fields\\\\Entries\"'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.contentColumnType', '\"text\"'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.handle', '\"description\"'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.instructions', '\"\"'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.name', '\"Description\"'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.searchable', 'false'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.settings.byteLimit', 'null'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.settings.charLimit', 'null'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.settings.code', '\"\"'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.settings.columnType', 'null'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.settings.initialRows', '\"4\"'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.settings.multiline', '\"\"'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.settings.placeholder', '\"\"'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.settings.uiMode', '\"normal\"'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.translationKeyFormat', 'null'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.translationMethod', '\"none\"'),
('fields.3a6afe25-67a1-4b72-ae4c-12618a865d72.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.contentColumnType', '\"text\"'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.handle', '\"showMoreLabel\"'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.instructions', '\"\"'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.name', '\"Show more label\"'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.searchable', 'false'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.settings.byteLimit', 'null'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.settings.charLimit', 'null'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.settings.code', '\"\"'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.settings.columnType', 'null'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.settings.initialRows', '\"4\"'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.settings.multiline', '\"\"'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.settings.placeholder', '\"\"'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.settings.uiMode', '\"normal\"'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.translationKeyFormat', 'null'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.translationMethod', '\"none\"'),
('fields.401c58db-239b-49c7-b873-bd05fdafa11c.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.contentColumnType', '\"text\"'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.handle', '\"moreDetailsLabel\"'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.instructions', '\"\"'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.name', '\"More details label\"'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.searchable', 'false'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.settings.byteLimit', 'null'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.settings.charLimit', 'null'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.settings.code', '\"\"'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.settings.columnType', 'null'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.settings.initialRows', '\"4\"'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.settings.multiline', '\"\"'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.settings.placeholder', '\"\"'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.settings.uiMode', '\"normal\"'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.translationKeyFormat', 'null'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.translationMethod', '\"none\"'),
('fields.40267a4d-a478-4f62-a3d4-146cf4b6b9ca.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.contentColumnType', '\"text\"'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.handle', '\"posterPresentationLabel\"'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.instructions', '\"\"'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.name', '\"Poster presentation label\"'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.searchable', 'false'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.settings.byteLimit', 'null'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.settings.charLimit', 'null'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.settings.code', '\"\"'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.settings.columnType', 'null'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.settings.initialRows', '\"4\"'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.settings.multiline', '\"\"'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.settings.placeholder', '\"\"'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.settings.uiMode', '\"normal\"'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.translationKeyFormat', 'null'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.translationMethod', '\"none\"'),
('fields.52d20310-6f48-427b-b799-39a76175f78a.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.contentColumnType', '\"string\"'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.handle', '\"topic\"'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.instructions', '\"\"'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.name', '\"Topic\"'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.searchable', 'false'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.settings.contentTable', '\"{{%matrixcontent_topic}}\"'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.settings.maxBlocks', '\"\"'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.settings.minBlocks', '\"\"'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.settings.propagationMethod', '\"all\"'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.translationKeyFormat', 'null'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.translationMethod', '\"site\"'),
('fields.5b285790-8f09-4d88-9df8-230f175d34aa.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.contentColumnType', '\"string\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.handle', '\"image\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.instructions', '\"\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.name', '\"Image\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.searchable', 'false'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.allowedKinds', 'null'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.allowSelfRelations', 'false'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.defaultUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.defaultUploadLocationSubpath', '\"\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.limit', '\"1\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.localizeRelations', 'false'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.restrictFiles', '\"\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.selectionLabel', '\"\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.showSiteMenu', 'true'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.showUnpermittedFiles', 'false'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.showUnpermittedVolumes', 'false'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.singleUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.singleUploadLocationSubpath', '\"\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.source', 'null'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.sources.0', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.targetSiteId', 'null'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.useSingleFolder', 'false'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.validateRelatedElements', 'false'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.settings.viewMode', '\"list\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.translationKeyFormat', 'null'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.translationMethod', '\"site\"'),
('fields.5c91fda2-e84e-4484-bd53-c79ed3381b02.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.contentColumnType', '\"string\"'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.handle', '\"sharePage\"'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.instructions', '\"\"'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.name', '\"Share page\"'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.searchable', 'false'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.settings.contentTable', '\"{{%matrixcontent_sharepage}}\"'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.settings.maxBlocks', '\"\"'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.settings.minBlocks', '\"\"'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.settings.propagationMethod', '\"all\"'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.translationKeyFormat', 'null'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.translationMethod', '\"site\"'),
('fields.6b338a19-9dc3-4a10-9fa7-d324f5c60c4d.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.contentColumnType', '\"string\"'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.handle', '\"footerCategory\"'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.instructions', '\"\"'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.name', '\"Footer category\"'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.searchable', 'false'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.allowLimit', 'false'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.allowMultipleSources', 'false'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.allowSelfRelations', 'false'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.branchLimit', '\"\"'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.limit', 'null'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.localizeRelations', 'false'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.selectionLabel', '\"\"'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.showSiteMenu', 'true'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.source', '\"group:de77b476-6dea-4810-8fdb-0e13f7783b51\"'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.sources', '\"*\"'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.targetSiteId', 'null'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.validateRelatedElements', 'false'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.settings.viewMode', 'null'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.translationKeyFormat', 'null'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.translationMethod', '\"site\"'),
('fields.80a2f56c-8091-4197-96f4-e6cb985dccde.type', '\"craft\\\\fields\\\\Categories\"'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.contentColumnType', '\"text\"'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.handle', '\"subtitle\"'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.instructions', '\"\"'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.name', '\"Subtitle\"'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.searchable', 'false'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.settings.byteLimit', 'null'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.settings.charLimit', 'null'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.settings.code', '\"\"'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.settings.columnType', 'null'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.settings.initialRows', '\"4\"'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.settings.multiline', '\"\"'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.settings.placeholder', '\"\"'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.settings.uiMode', '\"normal\"'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.translationKeyFormat', 'null'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.translationMethod', '\"none\"'),
('fields.85e693d4-43fa-4350-9216-28f926cfa9bb.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.contentColumnType', '\"string\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.handle', '\"euText\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.instructions', '\"\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.name', '\"EU text\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.searchable', 'false'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.allowedKinds', 'null'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.allowSelfRelations', 'false');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.defaultUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.defaultUploadLocationSubpath', '\"\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.limit', '\"1\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.localizeRelations', 'false'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.restrictFiles', '\"\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.selectionLabel', '\"\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.showSiteMenu', 'true'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.showUnpermittedFiles', 'false'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.showUnpermittedVolumes', 'false'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.singleUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.singleUploadLocationSubpath', '\"\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.source', 'null'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.sources.0', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.targetSiteId', 'null'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.useSingleFolder', 'false'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.validateRelatedElements', 'false'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.settings.viewMode', '\"list\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.translationKeyFormat', 'null'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.translationMethod', '\"site\"'),
('fields.9f710753-6962-4083-a7bf-e359f9a3651b.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.contentColumnType', '\"datetime\"'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.handle', '\"eventDate\"'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.instructions', '\"\"'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.name', '\"Event date\"'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.searchable', 'false'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.settings.max', 'null'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.settings.min', 'null'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.settings.minuteIncrement', '\"30\"'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.settings.showDate', 'true'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.settings.showTime', 'false'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.translationKeyFormat', 'null'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.translationMethod', '\"none\"'),
('fields.d98e34e6-36c6-40af-bee4-4adab40fad3c.type', '\"craft\\\\fields\\\\Date\"'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.contentColumnType', '\"string\"'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.handle', '\"homepageBlocks\"'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.instructions', '\"\"'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.name', '\"Homepage blocks\"'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.searchable', 'false'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.settings.contentTable', '\"{{%matrixcontent_homepageblocks}}\"'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.settings.maxBlocks', '\"\"'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.settings.minBlocks', '\"\"'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.settings.propagationMethod', '\"all\"'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.translationKeyFormat', 'null'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.translationMethod', '\"site\"'),
('fields.e0f343f5-bf12-49eb-b74e-b89a08a92090.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.e12922f2-d58c-47c0-890e-5d5f5f1dc98b.contentColumnType', '\"string(255)\"'),
('fields.e12922f2-d58c-47c0-890e-5d5f5f1dc98b.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.e12922f2-d58c-47c0-890e-5d5f5f1dc98b.handle', '\"video\"'),
('fields.e12922f2-d58c-47c0-890e-5d5f5f1dc98b.instructions', '\"\"'),
('fields.e12922f2-d58c-47c0-890e-5d5f5f1dc98b.name', '\"Video\"'),
('fields.e12922f2-d58c-47c0-890e-5d5f5f1dc98b.searchable', 'false'),
('fields.e12922f2-d58c-47c0-890e-5d5f5f1dc98b.settings.maxLength', '\"255\"'),
('fields.e12922f2-d58c-47c0-890e-5d5f5f1dc98b.settings.placeholder', '\"\"'),
('fields.e12922f2-d58c-47c0-890e-5d5f5f1dc98b.translationKeyFormat', 'null'),
('fields.e12922f2-d58c-47c0-890e-5d5f5f1dc98b.translationMethod', '\"none\"'),
('fields.e12922f2-d58c-47c0-890e-5d5f5f1dc98b.type', '\"craft\\\\fields\\\\Url\"'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.contentColumnType', '\"text\"'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.handle', '\"showEventsLabel\"'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.instructions', '\"\"'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.name', '\"Show events label\"'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.searchable', 'false'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.settings.byteLimit', 'null'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.settings.charLimit', 'null'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.settings.code', '\"\"'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.settings.columnType', 'null'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.settings.initialRows', '\"4\"'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.settings.multiline', '\"\"'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.settings.placeholder', '\"\"'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.settings.uiMode', '\"normal\"'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.translationKeyFormat', 'null'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.translationMethod', '\"none\"'),
('fields.e7f18898-8c9a-4955-9c1e-b38d5a880bf0.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.contentColumnType', '\"string\"'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.handle', '\"headerCategory\"'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.instructions', '\"\"'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.name', '\"Header category\"'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.searchable', 'false'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.allowLimit', 'false'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.allowMultipleSources', 'false'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.allowSelfRelations', 'false'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.branchLimit', '\"1\"'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.limit', 'null'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.localizeRelations', 'false'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.selectionLabel', '\"\"'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.showSiteMenu', 'true'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.source', '\"group:3a7eb026-21bc-4104-8b48-f870b7d9b8d6\"'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.sources', '\"*\"'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.targetSiteId', 'null'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.validateRelatedElements', 'false'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.settings.viewMode', 'null'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.translationKeyFormat', 'null'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.translationMethod', '\"site\"'),
('fields.f5da9f1e-a4a1-4a78-84c0-9728608c768f.type', '\"craft\\\\fields\\\\Categories\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.contentColumnType', '\"string\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.fieldGroup', '\"6b1219ff-213c-4e36-abd9-4bba5cbe3f35\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.handle', '\"document\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.instructions', '\"\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.name', '\"Document\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.searchable', 'false'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.allowedKinds', 'null'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.allowSelfRelations', 'false'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.defaultUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.defaultUploadLocationSubpath', '\"\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.limit', '\"1\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.localizeRelations', 'false'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.restrictFiles', '\"\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.selectionLabel', '\"\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.showSiteMenu', 'true'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.showUnpermittedFiles', 'false'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.showUnpermittedVolumes', 'false'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.singleUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.singleUploadLocationSubpath', '\"\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.source', 'null'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.sources.0', '\"volume:6175f870-5bd3-44ef-a8b4-7066f710a2a3\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.targetSiteId', 'null'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.useSingleFolder', 'false'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.validateRelatedElements', 'false'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.settings.viewMode', '\"list\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.translationKeyFormat', 'null'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.translationMethod', '\"site\"'),
('fields.f5fd202b-8a13-49c8-a6af-c542fb5c5fbf.type', '\"craft\\\\fields\\\\Assets\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.0.fieldUid', '\"2a3f8c96-0aee-410f-868f-a675681c471f\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.0.instructions', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.0.label', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.0.required', 'false'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.0.tip', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.0.warning', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.0.width', '100'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.1.fieldUid', '\"23b45aa3-721a-4395-9c74-59d4a180aa45\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.1.instructions', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.1.label', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.1.required', 'false'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.1.tip', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.1.warning', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.1.width', '100'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.2.fieldUid', '\"401c58db-239b-49c7-b873-bd05fdafa11c\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.2.instructions', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.2.label', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.2.required', 'false'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.2.tip', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.2.warning', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.2.width', '100'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.3.fieldUid', '\"52d20310-6f48-427b-b799-39a76175f78a\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.3.instructions', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.3.label', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.3.required', 'false'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.3.tip', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.3.warning', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.3.width', '100'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.4.fieldUid', '\"40267a4d-a478-4f62-a3d4-146cf4b6b9ca\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.4.instructions', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.4.label', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.4.required', 'false'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.4.tip', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.4.warning', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.4.width', '100'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.5.fieldUid', '\"e7f18898-8c9a-4955-9c1e-b38d5a880bf0\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.5.instructions', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.5.label', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.5.required', 'false'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.5.tip', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.5.warning', 'null'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.elements.5.width', '100'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.name', '\"Labels\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.fieldLayouts.b70ca5f0-6f19-4193-927f-ff6c8c6c79ba.tabs.0.sortOrder', '1'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.handle', '\"layout\"'),
('globalSets.ab3d7b93-6d92-450e-b53c-0489232a17d7.name', '\"Layout\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.field', '\"e0f343f5-bf12-49eb-b74e-b89a08a92090\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.0.fieldUid', '\"401d8e85-f282-41aa-b599-9a1b5c40ff4d\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.1.fieldUid', '\"60828b3b-af20-45e7-a350-412a29e33865\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.2.fieldUid', '\"b97a18e5-d60b-4ab8-ad55-570d492e9314\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.2.instructions', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.2.label', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.2.required', 'false'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.2.tip', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.2.warning', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.elements.2.width', '100'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fieldLayouts.6dd56aec-4a50-4cc2-9720-751993a451df.tabs.0.sortOrder', '1'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.contentColumnType', '\"text\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.fieldGroup', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.handle', '\"titlePresentation\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.instructions', '\"\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.name', '\"Title\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.searchable', 'false'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.settings.byteLimit', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.settings.charLimit', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.settings.code', '\"\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.settings.columnType', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.settings.initialRows', '\"4\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.settings.multiline', '\"\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.settings.placeholder', '\"\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.translationKeyFormat', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.translationMethod', '\"none\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.401d8e85-f282-41aa-b599-9a1b5c40ff4d.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.contentColumnType', '\"text\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.fieldGroup', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.handle', '\"descriptionPresentation\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.instructions', '\"\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.name', '\"Description\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.searchable', 'false'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.settings.byteLimit', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.settings.charLimit', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.settings.code', '\"\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.settings.columnType', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.settings.initialRows', '\"4\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.settings.multiline', '\"\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.settings.placeholder', '\"\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.translationKeyFormat', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.translationMethod', '\"none\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.60828b3b-af20-45e7-a350-412a29e33865.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.contentColumnType', '\"string\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.fieldGroup', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.handle', '\"presentationSection\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.instructions', '\"\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.name', '\"Presentation section\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.searchable', 'false'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.settings.limit', '\"4\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.settings.localizeRelations', 'false'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.settings.showSiteMenu', 'true'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.settings.source', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.settings.sources.0', '\"section:7d39eb22-1737-4478-9f1d-2a40252eb160\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.settings.targetSiteId', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.settings.viewMode', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.translationKeyFormat', 'null'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.translationMethod', '\"site\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.fields.b97a18e5-d60b-4ab8-ad55-570d492e9314.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.handle', '\"presentation\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.name', '\"Presentation block\"'),
('matrixBlockTypes.0fa09bda-4927-413e-912c-dacd1a5d3d95.sortOrder', '3'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.field', '\"e0f343f5-bf12-49eb-b74e-b89a08a92090\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fieldLayouts.84de8783-8645-4ec6-962b-f06f4e6cd431.tabs.0.elements.0.fieldUid', '\"67223488-f1a2-4bf8-88f5-07ccee112531\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fieldLayouts.84de8783-8645-4ec6-962b-f06f4e6cd431.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fieldLayouts.84de8783-8645-4ec6-962b-f06f4e6cd431.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fieldLayouts.84de8783-8645-4ec6-962b-f06f4e6cd431.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fieldLayouts.84de8783-8645-4ec6-962b-f06f4e6cd431.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fieldLayouts.84de8783-8645-4ec6-962b-f06f4e6cd431.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fieldLayouts.84de8783-8645-4ec6-962b-f06f4e6cd431.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fieldLayouts.84de8783-8645-4ec6-962b-f06f4e6cd431.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fieldLayouts.84de8783-8645-4ec6-962b-f06f4e6cd431.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fieldLayouts.84de8783-8645-4ec6-962b-f06f4e6cd431.tabs.0.sortOrder', '1'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.contentColumnType', '\"string\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.fieldGroup', 'null'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.handle', '\"hero\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.instructions', '\"\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.name', '\"Slide\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.searchable', 'false'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.settings.limit', '\"3\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.settings.localizeRelations', 'false'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.settings.showSiteMenu', 'true'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.settings.source', 'null'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.settings.sources.0', '\"section:ef251137-89c9-4576-aa61-14697e629903\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.settings.targetSiteId', 'null'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.settings.viewMode', 'null'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.translationKeyFormat', 'null'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.translationMethod', '\"site\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.fields.67223488-f1a2-4bf8-88f5-07ccee112531.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.handle', '\"heroRotator\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.name', '\"Slides block\"'),
('matrixBlockTypes.3cc89c3b-1c24-480b-8a29-84e84ad27ee1.sortOrder', '1'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.field', '\"e0f343f5-bf12-49eb-b74e-b89a08a92090\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.0.fieldUid', '\"9080de68-bd02-456a-a32d-8f0e68117450\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.1.fieldUid', '\"81db77d5-72c6-412d-829c-df7ea50eec4f\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.2.fieldUid', '\"5d923d4a-e3ba-499c-9818-9209946aecba\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.2.instructions', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.2.label', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.2.required', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.2.tip', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.2.warning', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.2.width', '100'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.3.fieldUid', '\"20c25c0f-575a-4351-bdd6-627a65e29b93\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.3.instructions', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.3.label', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.3.required', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.3.tip', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.3.warning', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.elements.3.width', '100'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fieldLayouts.a4d55249-24ca-4108-bb78-5626a1a28f22.tabs.0.sortOrder', '1'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.contentColumnType', '\"string\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.fieldGroup', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.handle', '\"imageArticle\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.instructions', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.name', '\"Image\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.searchable', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.allowedKinds', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.defaultUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.defaultUploadLocationSubpath', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.limit', '\"1\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.localizeRelations', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.restrictFiles', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.showSiteMenu', 'true'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.showUnpermittedFiles', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.showUnpermittedVolumes', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.singleUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.singleUploadLocationSubpath', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.source', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.sources.0', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.targetSiteId', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.useSingleFolder', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.settings.viewMode', '\"list\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.translationKeyFormat', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.translationMethod', '\"site\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.20c25c0f-575a-4351-bdd6-627a65e29b93.type', '\"craft\\\\fields\\\\Assets\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.contentColumnType', '\"text\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.fieldGroup', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.handle', '\"descriptionArticle\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.instructions', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.name', '\"Description\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.searchable', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.settings.byteLimit', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.settings.charLimit', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.settings.code', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.settings.columnType', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.settings.initialRows', '\"4\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.settings.multiline', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.settings.placeholder', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.translationKeyFormat', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.translationMethod', '\"none\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.5d923d4a-e3ba-499c-9818-9209946aecba.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.contentColumnType', '\"text\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.fieldGroup', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.handle', '\"subtitleArticle\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.instructions', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.name', '\"Subtitle\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.searchable', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.settings.byteLimit', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.settings.charLimit', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.settings.code', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.settings.columnType', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.settings.initialRows', '\"4\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.settings.multiline', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.settings.placeholder', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.translationKeyFormat', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.translationMethod', '\"none\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.81db77d5-72c6-412d-829c-df7ea50eec4f.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.contentColumnType', '\"text\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.fieldGroup', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.handle', '\"titleArticle\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.instructions', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.name', '\"Title\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.searchable', 'false'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.settings.byteLimit', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.settings.charLimit', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.settings.code', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.settings.columnType', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.settings.initialRows', '\"4\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.settings.multiline', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.settings.placeholder', '\"\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.translationKeyFormat', 'null'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.translationMethod', '\"none\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.fields.9080de68-bd02-456a-a32d-8f0e68117450.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.handle', '\"article\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.name', '\"Article block\"'),
('matrixBlockTypes.44662993-89d8-4367-a0b2-9d96e062eeb3.sortOrder', '2'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.field', '\"063f1856-6981-4caa-85ca-5a2842fe313f\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.0.fieldUid', '\"f4a52dcb-b5c7-4620-9218-57c2f75e440b\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.0.warning', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.1.fieldUid', '\"9c9768c2-5ef2-41b7-aa63-0ee058f5ab70\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fieldLayouts.39b548bf-cadb-46aa-bda6-0905cbf7f7ba.tabs.0.sortOrder', '1'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.contentColumnType', '\"text\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.fieldGroup', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.handle', '\"descriptionAbout\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.instructions', '\"\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.name', '\"Description\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.searchable', 'false'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.availableTransforms', '\"*\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.availableVolumes', '\"*\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.cleanupHtml', 'true'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.columnType', '\"text\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.configSelectionMode', '\"choose\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.defaultTransform', '\"\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.manualConfig', '\"\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.purifierConfig', '\"\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.purifyHtml', '\"1\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.redactorConfig', '\"\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.removeEmptyTags', '\"1\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.removeInlineStyles', '\"1\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.removeNbsp', '\"1\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.showHtmlButtonForNonAdmins', '\"\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.showUnpermittedFiles', 'false'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.showUnpermittedVolumes', 'false'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.settings.uiMode', '\"enlarged\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.translationKeyFormat', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.translationMethod', '\"none\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.9c9768c2-5ef2-41b7-aa63-0ee058f5ab70.type', '\"craft\\\\redactor\\\\Field\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.contentColumnType', '\"text\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.fieldGroup', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.handle', '\"titleAbout\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.instructions', '\"\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.name', '\"Title\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.searchable', 'false'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.settings.byteLimit', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.settings.charLimit', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.settings.code', '\"\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.settings.columnType', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.settings.initialRows', '\"4\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.settings.multiline', '\"\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.settings.placeholder', '\"\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.translationKeyFormat', 'null'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.translationMethod', '\"none\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.fields.f4a52dcb-b5c7-4620-9218-57c2f75e440b.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.handle', '\"contentAbout\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.name', '\"Content\"'),
('matrixBlockTypes.571684f8-3bd9-41b0-b85b-af936bb0900a.sortOrder', '1'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.field', '\"e12922f2-d58c-47c0-890e-5d5f5f1dc98b\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.0.fieldUid', '\"02a56483-ffcf-4031-a54e-29966a07d174\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.1.fieldUid', '\"384d078d-2f91-453a-abbd-909780a3dab9\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fieldLayouts.44765ea7-b2af-4e1b-bc1a-917d50e56675.tabs.0.sortOrder', '1'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.contentColumnType', '\"text\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.fieldGroup', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.handle', '\"videoTitle\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.instructions', '\"\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.name', '\"Video title\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.searchable', 'false'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.settings.byteLimit', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.settings.charLimit', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.settings.code', '\"\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.settings.columnType', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.settings.initialRows', '\"4\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.settings.multiline', '\"\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.settings.placeholder', '\"\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.translationKeyFormat', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.translationMethod', '\"none\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.02a56483-ffcf-4031-a54e-29966a07d174.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.384d078d-2f91-453a-abbd-909780a3dab9.contentColumnType', '\"string(255)\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.384d078d-2f91-453a-abbd-909780a3dab9.fieldGroup', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.384d078d-2f91-453a-abbd-909780a3dab9.handle', '\"videoUrl\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.384d078d-2f91-453a-abbd-909780a3dab9.instructions', '\"\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.384d078d-2f91-453a-abbd-909780a3dab9.name', '\"Video url\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.384d078d-2f91-453a-abbd-909780a3dab9.searchable', 'false'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.384d078d-2f91-453a-abbd-909780a3dab9.settings.maxLength', '\"255\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.384d078d-2f91-453a-abbd-909780a3dab9.settings.placeholder', '\"\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.384d078d-2f91-453a-abbd-909780a3dab9.translationKeyFormat', 'null'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.384d078d-2f91-453a-abbd-909780a3dab9.translationMethod', '\"none\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.fields.384d078d-2f91-453a-abbd-909780a3dab9.type', '\"craft\\\\fields\\\\Url\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.handle', '\"videoLink\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.name', '\"Video link\"'),
('matrixBlockTypes.69b98422-b52a-448b-b51e-774bb1a1d8fe.sortOrder', '1'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.field', '\"063f1856-6981-4caa-85ca-5a2842fe313f\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.0.fieldUid', '\"9b6f32dd-6e58-4258-84e1-39b72a26a406\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.1.fieldUid', '\"3518821f-2d9c-419f-9f6c-3457ca8e43fe\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.2.fieldUid', '\"f97713a1-0546-40e0-92ce-0df6a863b2ee\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.2.instructions', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.2.label', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.2.required', 'false'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.2.tip', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.2.warning', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.elements.2.width', '100'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fieldLayouts.4e79db3f-9f22-445a-8452-944e5981444b.tabs.0.sortOrder', '1'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.contentColumnType', '\"text\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.fieldGroup', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.handle', '\"descriptionLearnMore\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.instructions', '\"\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.name', '\"Description\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.searchable', 'false'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.settings.byteLimit', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.settings.charLimit', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.settings.code', '\"\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.settings.columnType', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.settings.initialRows', '\"4\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.settings.multiline', '\"\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.settings.placeholder', '\"\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.translationKeyFormat', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.translationMethod', '\"none\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.3518821f-2d9c-419f-9f6c-3457ca8e43fe.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.contentColumnType', '\"text\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.fieldGroup', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.handle', '\"titleLearnMore\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.instructions', '\"\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.name', '\"Title\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.searchable', 'false'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.settings.byteLimit', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.settings.charLimit', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.settings.code', '\"\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.settings.columnType', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.settings.initialRows', '\"4\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.settings.multiline', '\"\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.settings.placeholder', '\"\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.translationKeyFormat', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.translationMethod', '\"none\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.9b6f32dd-6e58-4258-84e1-39b72a26a406.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.contentColumnType', '\"string\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.fieldGroup', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.handle', '\"cardsAbout\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.instructions', '\"\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.name', '\"Cards\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.searchable', 'false'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.settings.limit', '\"3\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.settings.localizeRelations', 'false'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.settings.showSiteMenu', 'true'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.settings.source', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.settings.sources.0', '\"section:ddaf32a5-8670-415d-8b4c-8118092a7fd4\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.settings.targetSiteId', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.settings.viewMode', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.translationKeyFormat', 'null'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.translationMethod', '\"site\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.fields.f97713a1-0546-40e0-92ce-0df6a863b2ee.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.handle', '\"learnMore\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.name', '\"Learn more\"'),
('matrixBlockTypes.80f0a9a1-95df-4f12-a999-dd6b2a758b6b.sortOrder', '2'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.field', '\"160d98c4-f407-4d6f-9d7c-9cd8afe4b7e9\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.0.fieldUid', '\"4a1775f7-e4ce-407f-b568-7fb63d019a03\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.1.fieldUid', '\"19dd2ee0-1bff-4667-a021-39a787224265\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fieldLayouts.9611d621-39a2-4327-8ea6-6ae603a43a0a.tabs.0.sortOrder', '1'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.19dd2ee0-1bff-4667-a021-39a787224265.contentColumnType', '\"string(255)\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.19dd2ee0-1bff-4667-a021-39a787224265.fieldGroup', 'null'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.19dd2ee0-1bff-4667-a021-39a787224265.handle', '\"socialLink\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.19dd2ee0-1bff-4667-a021-39a787224265.instructions', '\"Enter the URL to your social network page\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.19dd2ee0-1bff-4667-a021-39a787224265.name', '\"URL\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.19dd2ee0-1bff-4667-a021-39a787224265.searchable', 'false'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.19dd2ee0-1bff-4667-a021-39a787224265.settings.maxLength', '\"255\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.19dd2ee0-1bff-4667-a021-39a787224265.settings.placeholder', '\"\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.19dd2ee0-1bff-4667-a021-39a787224265.translationKeyFormat', 'null'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.19dd2ee0-1bff-4667-a021-39a787224265.translationMethod', '\"none\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.19dd2ee0-1bff-4667-a021-39a787224265.type', '\"craft\\\\fields\\\\Url\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.contentColumnType', '\"string\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.fieldGroup', 'null'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.handle', '\"socialIcon\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.instructions', '\"Choose a social network\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.name', '\"Social network\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.searchable', 'false'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.optgroups', 'true'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.0.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.0.__assoc__.0.1', '\"Facebook\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.0.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.0.__assoc__.1.1', '\"fa fa-facebook-square\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.0.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.0.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.1.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.1.__assoc__.0.1', '\"Twitter\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.1.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.1.__assoc__.1.1', '\"fa fa-twitter\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.1.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.1.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.2.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.2.__assoc__.0.1', '\"Youtube\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.2.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.2.__assoc__.1.1', '\"fa fa-youtube-play\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.2.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.2.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.3.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.3.__assoc__.0.1', '\"Instagram\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.3.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.3.__assoc__.1.1', '\"fa fa-instagram\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.3.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.3.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.4.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.4.__assoc__.0.1', '\"Linked In\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.4.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.4.__assoc__.1.1', '\"fa fa-linkedin\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.4.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.settings.options.4.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.translationKeyFormat', 'null'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.translationMethod', '\"none\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.fields.4a1775f7-e4ce-407f-b568-7fb63d019a03.type', '\"craft\\\\fields\\\\Dropdown\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.handle', '\"socialLink\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.name', '\"Social network\"'),
('matrixBlockTypes.88f0f88c-1b50-4e34-9a0b-63b83b821f4e.sortOrder', '1'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.field', '\"e0f343f5-bf12-49eb-b74e-b89a08a92090\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.0.fieldUid', '\"21e60286-b5c2-44b9-95f1-93ca5d85fbc9\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.1.fieldUid', '\"a7c33f69-9eb3-4886-aaa3-f5e7753de473\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.2.fieldUid', '\"d99fd25f-dba2-409c-9722-a6f250396b6c\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.2.instructions', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.2.label', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.2.required', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.2.tip', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.2.warning', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.elements.2.width', '100'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fieldLayouts.4bf384f5-b771-4741-8211-c3d03c75f739.tabs.0.sortOrder', '1'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.contentColumnType', '\"string\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.fieldGroup', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.handle', '\"videoImage\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.instructions', '\"\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.name', '\"Background image\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.searchable', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.allowedKinds', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.defaultUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.defaultUploadLocationSubpath', '\"\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.limit', '\"1\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.localizeRelations', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.restrictFiles', '\"\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.showSiteMenu', 'true'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.showUnpermittedFiles', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.showUnpermittedVolumes', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.singleUploadLocationSource', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.singleUploadLocationSubpath', '\"\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.source', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.sources.0', '\"volume:defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.targetSiteId', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.useSingleFolder', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.settings.viewMode', '\"list\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.translationKeyFormat', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.translationMethod', '\"site\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.21e60286-b5c2-44b9-95f1-93ca5d85fbc9.type', '\"craft\\\\fields\\\\Assets\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.contentColumnType', '\"text\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.fieldGroup', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.handle', '\"videoTitle\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.instructions', '\"\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.name', '\"Video title\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.searchable', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.settings.byteLimit', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.settings.charLimit', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.settings.code', '\"\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.settings.columnType', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.settings.initialRows', '\"4\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.settings.multiline', '\"\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.settings.placeholder', '\"\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.translationKeyFormat', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.translationMethod', '\"none\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.a7c33f69-9eb3-4886-aaa3-f5e7753de473.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.contentColumnType', '\"string\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.fieldGroup', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.handle', '\"videoUrl\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.instructions', '\"\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.name', '\"Video url\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.searchable', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.settings.limit', '\"3\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.settings.localizeRelations', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.settings.showSiteMenu', 'true'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.settings.source', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.settings.sources.0', '\"section:093c3fe9-83bd-41d7-a933-c3e656f3574c\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.settings.targetSiteId', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.settings.viewMode', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.translationKeyFormat', 'null'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.translationMethod', '\"site\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.fields.d99fd25f-dba2-409c-9722-a6f250396b6c.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.handle', '\"videos\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.name', '\"Videos block\"'),
('matrixBlockTypes.b37ce238-1d49-4e49-9112-eb0ca6e0878f.sortOrder', '5'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.field', '\"5b285790-8f09-4d88-9df8-230f175d34aa\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.0.fieldUid', '\"e2ef32d5-9e4a-4dd1-b376-0cab1161c731\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.1.fieldUid', '\"7f75ae24-1798-42cc-8a41-ccf9de55c6b9\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.1.label', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.1.required', 'true'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fieldLayouts.8c2c2d73-0ddf-49a1-a89f-66fd93a39b8e.tabs.0.sortOrder', '1'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.7f75ae24-1798-42cc-8a41-ccf9de55c6b9.contentColumnType', '\"string(255)\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.7f75ae24-1798-42cc-8a41-ccf9de55c6b9.fieldGroup', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.7f75ae24-1798-42cc-8a41-ccf9de55c6b9.handle', '\"topicUrl\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.7f75ae24-1798-42cc-8a41-ccf9de55c6b9.instructions', '\"\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.7f75ae24-1798-42cc-8a41-ccf9de55c6b9.name', '\"Topic url\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.7f75ae24-1798-42cc-8a41-ccf9de55c6b9.searchable', 'false'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.7f75ae24-1798-42cc-8a41-ccf9de55c6b9.settings.maxLength', '\"255\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.7f75ae24-1798-42cc-8a41-ccf9de55c6b9.settings.placeholder', '\"\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.7f75ae24-1798-42cc-8a41-ccf9de55c6b9.translationKeyFormat', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.7f75ae24-1798-42cc-8a41-ccf9de55c6b9.translationMethod', '\"none\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.7f75ae24-1798-42cc-8a41-ccf9de55c6b9.type', '\"craft\\\\fields\\\\Url\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.contentColumnType', '\"text\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.fieldGroup', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.handle', '\"topicName\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.instructions', '\"\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.name', '\"Topic name\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.searchable', 'false'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.settings.byteLimit', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.settings.charLimit', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.settings.code', '\"\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.settings.columnType', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.settings.initialRows', '\"4\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.settings.multiline', '\"\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.settings.placeholder', '\"\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.translationKeyFormat', 'null'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.translationMethod', '\"none\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.fields.e2ef32d5-9e4a-4dd1-b376-0cab1161c731.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.handle', '\"topicLinks\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.name', '\"Topic links\"'),
('matrixBlockTypes.b8e10694-8207-4a73-8690-01ee91089398.sortOrder', '1'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.field', '\"e0f343f5-bf12-49eb-b74e-b89a08a92090\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.0.fieldUid', '\"fb882e52-164e-429c-abc7-3c9de80d2d5c\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.1.fieldUid', '\"df979902-a677-4079-a560-07c547adeb8c\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.2.fieldUid', '\"7e31abf0-d327-4e55-9301-863a2fd1c854\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.2.instructions', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.2.label', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.2.required', 'false'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.2.tip', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.2.warning', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.elements.2.width', '100'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fieldLayouts.29f993b9-acc7-4c69-93f0-715d74744d3c.tabs.0.sortOrder', '1'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.contentColumnType', '\"string\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.fieldGroup', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.handle', '\"eventSection\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.instructions', '\"\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.name', '\"Event section\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.searchable', 'false'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.settings.limit', '\"\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.settings.localizeRelations', 'false'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.settings.showSiteMenu', 'true'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.settings.source', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.settings.sources.0', '\"section:c7fec439-ba6f-4143-9a75-eac421fb0280\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.settings.targetSiteId', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.settings.viewMode', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.translationKeyFormat', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.translationMethod', '\"site\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.7e31abf0-d327-4e55-9301-863a2fd1c854.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.contentColumnType', '\"text\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.fieldGroup', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.handle', '\"descriptionEvents\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.instructions', '\"\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.name', '\"Description\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.searchable', 'false'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.settings.byteLimit', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.settings.charLimit', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.settings.code', '\"\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.settings.columnType', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.settings.initialRows', '\"4\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.settings.multiline', '\"\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.settings.placeholder', '\"\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.translationKeyFormat', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.translationMethod', '\"none\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.df979902-a677-4079-a560-07c547adeb8c.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.contentColumnType', '\"text\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.fieldGroup', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.handle', '\"titleEvents\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.instructions', '\"\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.name', '\"Title\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.searchable', 'false'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.settings.byteLimit', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.settings.charLimit', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.settings.code', '\"\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.settings.columnType', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.settings.initialRows', '\"4\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.settings.multiline', '\"\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.settings.placeholder', '\"\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.translationKeyFormat', 'null'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.translationMethod', '\"none\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.fields.fb882e52-164e-429c-abc7-3c9de80d2d5c.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.handle', '\"events\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.name', '\"Events block\"'),
('matrixBlockTypes.cbeed6a9-78e6-436a-ad97-4dadf7fc5d11.sortOrder', '4'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.field', '\"6b338a19-9dc3-4a10-9fa7-d324f5c60c4d\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.0.fieldUid', '\"6afa1bc1-7908-4558-aa63-69cc006ff789\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.1.fieldUid', '\"d3ab2053-a86a-4b83-8ab5-8d7d99044d80\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.1.required', 'false'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fieldLayouts.ee02f3d9-7253-48bc-a3ce-c7b6a611e12e.tabs.0.sortOrder', '1'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.contentColumnType', '\"string\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.fieldGroup', 'null'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.handle', '\"socialIcon\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.instructions', '\"Choose a social network\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.name', '\"Social network\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.searchable', 'false'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.optgroups', 'true'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.0.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.0.__assoc__.0.1', '\"Facebook\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.0.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.0.__assoc__.1.1', '\"fa fa-facebook-square\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.0.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.0.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.1.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.1.__assoc__.0.1', '\"Twitter\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.1.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.1.__assoc__.1.1', '\"fa fa-twitter\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.1.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.1.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.2.__assoc__.0.0', '\"label\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.2.__assoc__.0.1', '\"LinkedIn\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.2.__assoc__.1.0', '\"value\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.2.__assoc__.1.1', '\"fa fa-linkedin-square\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.2.__assoc__.2.0', '\"default\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.settings.options.2.__assoc__.2.1', '\"\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.translationKeyFormat', 'null'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.translationMethod', '\"none\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.6afa1bc1-7908-4558-aa63-69cc006ff789.type', '\"craft\\\\fields\\\\Dropdown\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.d3ab2053-a86a-4b83-8ab5-8d7d99044d80.contentColumnType', '\"string(255)\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.d3ab2053-a86a-4b83-8ab5-8d7d99044d80.fieldGroup', 'null'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.d3ab2053-a86a-4b83-8ab5-8d7d99044d80.handle', '\"socialUrl\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.d3ab2053-a86a-4b83-8ab5-8d7d99044d80.instructions', '\"Enter the URL to your social network page\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.d3ab2053-a86a-4b83-8ab5-8d7d99044d80.name', '\"URL\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.d3ab2053-a86a-4b83-8ab5-8d7d99044d80.searchable', 'false'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.d3ab2053-a86a-4b83-8ab5-8d7d99044d80.settings.maxLength', '\"255\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.d3ab2053-a86a-4b83-8ab5-8d7d99044d80.settings.placeholder', '\"\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.d3ab2053-a86a-4b83-8ab5-8d7d99044d80.translationKeyFormat', 'null'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.d3ab2053-a86a-4b83-8ab5-8d7d99044d80.translationMethod', '\"none\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.fields.d3ab2053-a86a-4b83-8ab5-8d7d99044d80.type', '\"craft\\\\fields\\\\Url\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.handle', '\"socialLink\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.name', '\"Social network\"'),
('matrixBlockTypes.e32094d0-88fd-461d-a24a-a3bcf59b4922.sortOrder', '1'),
('plugins.cheat-sheet.edition', '\"standard\"'),
('plugins.cheat-sheet.enabled', 'true'),
('plugins.cheat-sheet.schemaVersion', '\"1.0.0\"'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('sections.093c3fe9-83bd-41d7-a933-c3e656f3574c.enableVersioning', 'true'),
('sections.093c3fe9-83bd-41d7-a933-c3e656f3574c.handle', '\"youtube\"'),
('sections.093c3fe9-83bd-41d7-a933-c3e656f3574c.name', '\"Youtube videos\"'),
('sections.093c3fe9-83bd-41d7-a933-c3e656f3574c.propagationMethod', '\"all\"'),
('sections.093c3fe9-83bd-41d7-a933-c3e656f3574c.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.enabledByDefault', 'true'),
('sections.093c3fe9-83bd-41d7-a933-c3e656f3574c.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'true'),
('sections.093c3fe9-83bd-41d7-a933-c3e656f3574c.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.template', 'null'),
('sections.093c3fe9-83bd-41d7-a933-c3e656f3574c.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.uriFormat', '\"youtube/{slug}\"'),
('sections.093c3fe9-83bd-41d7-a933-c3e656f3574c.type', '\"channel\"'),
('sections.4536c42b-f61b-49b7-a666-1bdbdf3d3bb8.enableVersioning', 'true'),
('sections.4536c42b-f61b-49b7-a666-1bdbdf3d3bb8.handle', '\"documents\"'),
('sections.4536c42b-f61b-49b7-a666-1bdbdf3d3bb8.name', '\"Documents\"'),
('sections.4536c42b-f61b-49b7-a666-1bdbdf3d3bb8.propagationMethod', '\"all\"'),
('sections.4536c42b-f61b-49b7-a666-1bdbdf3d3bb8.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.enabledByDefault', 'true'),
('sections.4536c42b-f61b-49b7-a666-1bdbdf3d3bb8.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'true'),
('sections.4536c42b-f61b-49b7-a666-1bdbdf3d3bb8.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.template', 'null'),
('sections.4536c42b-f61b-49b7-a666-1bdbdf3d3bb8.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.uriFormat', '\"document/{slug}\"'),
('sections.4536c42b-f61b-49b7-a666-1bdbdf3d3bb8.type', '\"channel\"'),
('sections.57d4f7a3-5e87-4d16-aed6-a1e1e2c995b1.enableVersioning', 'true'),
('sections.57d4f7a3-5e87-4d16-aed6-a1e1e2c995b1.handle', '\"navbar\"'),
('sections.57d4f7a3-5e87-4d16-aed6-a1e1e2c995b1.name', '\"Navbar\"'),
('sections.57d4f7a3-5e87-4d16-aed6-a1e1e2c995b1.propagationMethod', '\"all\"'),
('sections.57d4f7a3-5e87-4d16-aed6-a1e1e2c995b1.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.enabledByDefault', 'true'),
('sections.57d4f7a3-5e87-4d16-aed6-a1e1e2c995b1.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'false'),
('sections.57d4f7a3-5e87-4d16-aed6-a1e1e2c995b1.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.template', 'null'),
('sections.57d4f7a3-5e87-4d16-aed6-a1e1e2c995b1.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.uriFormat', 'null'),
('sections.57d4f7a3-5e87-4d16-aed6-a1e1e2c995b1.type', '\"single\"'),
('sections.7d39eb22-1737-4478-9f1d-2a40252eb160.enableVersioning', 'true'),
('sections.7d39eb22-1737-4478-9f1d-2a40252eb160.handle', '\"studentsInAction\"'),
('sections.7d39eb22-1737-4478-9f1d-2a40252eb160.name', '\"Students in action\"'),
('sections.7d39eb22-1737-4478-9f1d-2a40252eb160.propagationMethod', '\"all\"'),
('sections.7d39eb22-1737-4478-9f1d-2a40252eb160.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.enabledByDefault', 'true'),
('sections.7d39eb22-1737-4478-9f1d-2a40252eb160.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'true'),
('sections.7d39eb22-1737-4478-9f1d-2a40252eb160.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.template', 'null'),
('sections.7d39eb22-1737-4478-9f1d-2a40252eb160.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.uriFormat', '\"students-in-action/{slug}\"'),
('sections.7d39eb22-1737-4478-9f1d-2a40252eb160.type', '\"channel\"'),
('sections.87a3d3d6-7170-474f-b761-21ff0fbcd43e.enableVersioning', 'true'),
('sections.87a3d3d6-7170-474f-b761-21ff0fbcd43e.handle', '\"homepage\"'),
('sections.87a3d3d6-7170-474f-b761-21ff0fbcd43e.name', '\"Homepage\"'),
('sections.87a3d3d6-7170-474f-b761-21ff0fbcd43e.propagationMethod', '\"all\"'),
('sections.87a3d3d6-7170-474f-b761-21ff0fbcd43e.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.enabledByDefault', 'true'),
('sections.87a3d3d6-7170-474f-b761-21ff0fbcd43e.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'true'),
('sections.87a3d3d6-7170-474f-b761-21ff0fbcd43e.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.template', '\"index\"'),
('sections.87a3d3d6-7170-474f-b761-21ff0fbcd43e.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.uriFormat', '\"__home__\"'),
('sections.87a3d3d6-7170-474f-b761-21ff0fbcd43e.type', '\"single\"'),
('sections.98a22aa3-561d-407e-b1ad-5bba63d6eb71.enableVersioning', 'true'),
('sections.98a22aa3-561d-407e-b1ad-5bba63d6eb71.handle', '\"aboutUs\"'),
('sections.98a22aa3-561d-407e-b1ad-5bba63d6eb71.name', '\"About us\"'),
('sections.98a22aa3-561d-407e-b1ad-5bba63d6eb71.propagationMethod', '\"all\"'),
('sections.98a22aa3-561d-407e-b1ad-5bba63d6eb71.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.enabledByDefault', 'true'),
('sections.98a22aa3-561d-407e-b1ad-5bba63d6eb71.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'true'),
('sections.98a22aa3-561d-407e-b1ad-5bba63d6eb71.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.template', '\"page\\\\aboutUs\"'),
('sections.98a22aa3-561d-407e-b1ad-5bba63d6eb71.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.uriFormat', '\"about-us\"'),
('sections.98a22aa3-561d-407e-b1ad-5bba63d6eb71.type', '\"single\"'),
('sections.c7fec439-ba6f-4143-9a75-eac421fb0280.enableVersioning', 'true'),
('sections.c7fec439-ba6f-4143-9a75-eac421fb0280.handle', '\"event\"'),
('sections.c7fec439-ba6f-4143-9a75-eac421fb0280.name', '\"Event\"'),
('sections.c7fec439-ba6f-4143-9a75-eac421fb0280.propagationMethod', '\"all\"'),
('sections.c7fec439-ba6f-4143-9a75-eac421fb0280.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.enabledByDefault', 'true'),
('sections.c7fec439-ba6f-4143-9a75-eac421fb0280.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'true'),
('sections.c7fec439-ba6f-4143-9a75-eac421fb0280.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.template', 'null'),
('sections.c7fec439-ba6f-4143-9a75-eac421fb0280.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.uriFormat', '\"event/{slug}\"'),
('sections.c7fec439-ba6f-4143-9a75-eac421fb0280.type', '\"channel\"'),
('sections.ddaf32a5-8670-415d-8b4c-8118092a7fd4.enableVersioning', 'true'),
('sections.ddaf32a5-8670-415d-8b4c-8118092a7fd4.handle', '\"cards\"'),
('sections.ddaf32a5-8670-415d-8b4c-8118092a7fd4.name', '\"Cards\"'),
('sections.ddaf32a5-8670-415d-8b4c-8118092a7fd4.propagationMethod', '\"all\"'),
('sections.ddaf32a5-8670-415d-8b4c-8118092a7fd4.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.enabledByDefault', 'true'),
('sections.ddaf32a5-8670-415d-8b4c-8118092a7fd4.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'true'),
('sections.ddaf32a5-8670-415d-8b4c-8118092a7fd4.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.template', 'null'),
('sections.ddaf32a5-8670-415d-8b4c-8118092a7fd4.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.uriFormat', '\"cards/{slug}\"'),
('sections.ddaf32a5-8670-415d-8b4c-8118092a7fd4.type', '\"channel\"'),
('sections.ef251137-89c9-4576-aa61-14697e629903.enableVersioning', 'true'),
('sections.ef251137-89c9-4576-aa61-14697e629903.handle', '\"hero\"'),
('sections.ef251137-89c9-4576-aa61-14697e629903.name', '\"Hero\"'),
('sections.ef251137-89c9-4576-aa61-14697e629903.propagationMethod', '\"all\"'),
('sections.ef251137-89c9-4576-aa61-14697e629903.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.enabledByDefault', 'true'),
('sections.ef251137-89c9-4576-aa61-14697e629903.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'true'),
('sections.ef251137-89c9-4576-aa61-14697e629903.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.template', '\"segment\\\\heroRotator\"'),
('sections.ef251137-89c9-4576-aa61-14697e629903.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.uriFormat', '\"hero/{slug}\"'),
('sections.ef251137-89c9-4576-aa61-14697e629903.type', '\"channel\"'),
('sections.f3802f9e-1863-4142-bed5-62a1dd9f0e7a.enableVersioning', 'true'),
('sections.f3802f9e-1863-4142-bed5-62a1dd9f0e7a.handle', '\"footer\"'),
('sections.f3802f9e-1863-4142-bed5-62a1dd9f0e7a.name', '\"Footer\"'),
('sections.f3802f9e-1863-4142-bed5-62a1dd9f0e7a.propagationMethod', '\"all\"'),
('sections.f3802f9e-1863-4142-bed5-62a1dd9f0e7a.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.enabledByDefault', 'true'),
('sections.f3802f9e-1863-4142-bed5-62a1dd9f0e7a.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'true'),
('sections.f3802f9e-1863-4142-bed5-62a1dd9f0e7a.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.template', '\"common\\\\footer\"'),
('sections.f3802f9e-1863-4142-bed5-62a1dd9f0e7a.siteSettings.0967bde6-f091-4666-b685-45e13bb32dee.uriFormat', '\"footer\"'),
('sections.f3802f9e-1863-4142-bed5-62a1dd9f0e7a.type', '\"single\"'),
('siteGroups.480f9f7d-c34e-444c-b22c-bd1c36409438.name', '\"school.test\"'),
('sites.0967bde6-f091-4666-b685-45e13bb32dee.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.0967bde6-f091-4666-b685-45e13bb32dee.handle', '\"default\"'),
('sites.0967bde6-f091-4666-b685-45e13bb32dee.hasUrls', 'true'),
('sites.0967bde6-f091-4666-b685-45e13bb32dee.language', '\"en-US\"'),
('sites.0967bde6-f091-4666-b685-45e13bb32dee.name', '\"school.test\"'),
('sites.0967bde6-f091-4666-b685-45e13bb32dee.primary', 'true'),
('sites.0967bde6-f091-4666-b685-45e13bb32dee.siteGroup', '\"480f9f7d-c34e-444c-b22c-bd1c36409438\"'),
('sites.0967bde6-f091-4666-b685-45e13bb32dee.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"school.test\"'),
('system.schemaVersion', '\"3.5.13\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.autocomplete', 'false'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.autocorrect', 'true'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.class', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.disabled', 'false'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.id', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.instructions', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.label', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.max', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.min', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.name', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.orientation', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.placeholder', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.readonly', 'false'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.requirable', 'false'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.size', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.step', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.tip', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.title', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.warning', 'null'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.elements.0.width', '100'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.name', '\"Content\"'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.fieldLayouts.51568600-c417-4c6a-a5ad-ce9e73447a7e.tabs.0.sortOrder', '1'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.handle', '\"pdfFiles\"'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.hasUrls', 'true'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.name', '\"Pdf files\"'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.settings.path', '\"assets/presentations\"'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.sortOrder', '2'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.type', '\"craft\\\\volumes\\\\Local\"'),
('volumes.6175f870-5bd3-44ef-a8b4-7066f710a2a3.url', '\"@web/assets/presentations\"'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.autocomplete', 'false'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.autocorrect', 'true'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.class', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.disabled', 'false'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.id', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.instructions', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.label', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.max', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.min', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.name', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.orientation', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.placeholder', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.readonly', 'false'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.requirable', 'false'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.size', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.step', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.tip', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.title', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.warning', 'null'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.elements.0.width', '100'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.name', '\"Content\"'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.fieldLayouts.af55ffa5-563f-4486-90a3-56917c221a2e.tabs.0.sortOrder', '1'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.handle', '\"images\"'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.hasUrls', 'true'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.name', '\"Images\"'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.settings.path', '\"assets/images\"'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.sortOrder', '1'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.type', '\"craft\\\\volumes\\\\Local\"'),
('volumes.defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d.url', '\"@web/assets/images\"');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 8, 11, NULL, 2, 1, '2020-09-14 12:27:09', '2020-09-14 12:27:09', '00f012fd-2620-4189-aa93-aea58c9fa9c9'),
(2, 8, 33, NULL, 2, 1, '2020-09-14 12:27:09', '2020-09-14 12:27:09', '065229ff-8cb6-4b8b-b633-85c837185a72'),
(4, 1, 11, NULL, 38, 1, '2020-09-14 12:29:21', '2020-09-14 12:41:00', '7cbf4756-35e3-48be-8570-831272a57160'),
(5, 1, 40, NULL, 39, 1, '2020-09-14 12:29:21', '2020-09-14 12:29:21', 'f91d98b6-9191-4a6a-9196-a50ec5fd2879'),
(6, 1, 40, NULL, 38, 2, '2020-09-14 12:29:21', '2020-09-14 12:29:21', 'f98a56ed-b6c6-439f-a5f5-2c341d59436d'),
(7, 8, 40, NULL, 2, 1, '2020-09-14 12:29:21', '2020-09-14 12:29:21', '386602ff-4d91-4666-af90-116ab4f61dfd'),
(8, 1, 45, NULL, 39, 1, '2020-09-14 12:34:38', '2020-09-14 12:34:38', '395083d7-93c8-4ee0-929a-ab6155ba1b54'),
(9, 1, 45, NULL, 38, 2, '2020-09-14 12:34:38', '2020-09-14 12:34:38', 'd1bf3105-964b-4eee-b19d-7e13098baecc'),
(10, 8, 45, NULL, 2, 1, '2020-09-14 12:34:38', '2020-09-14 12:34:38', 'acc95e6c-86b7-40fb-bf1d-e64fa601afc5'),
(11, 1, 50, NULL, 39, 1, '2020-09-14 12:40:48', '2020-09-14 12:40:48', 'c0bd0ec2-2957-484a-8289-07a8ab3b1580'),
(12, 1, 50, NULL, 38, 2, '2020-09-14 12:40:48', '2020-09-14 12:40:48', 'c0f25bda-3250-4f2b-b24e-53a23aa63762'),
(13, 8, 50, NULL, 2, 1, '2020-09-14 12:40:48', '2020-09-14 12:40:48', 'e1471111-51ad-4e59-a81a-f2470cdcd52a'),
(14, 9, 11, NULL, 39, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', 'c64450c7-7d7c-4cf3-8a89-052d48d9ccf4'),
(15, 9, 55, NULL, 39, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', '0450379b-a6d6-4090-9d76-d1a12a042fc0'),
(16, 1, 55, NULL, 38, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', '4506c64c-6db6-49c0-9d53-f2622b3cf16d'),
(17, 8, 55, NULL, 2, 1, '2020-09-14 12:41:00', '2020-09-14 12:41:00', '502820d6-fb99-4b25-ad7b-20a6a7e9a65e'),
(18, 9, 60, NULL, 39, 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', 'b00e3251-7c1c-48e6-91a9-c0679170e344'),
(19, 8, 60, NULL, 2, 1, '2020-09-14 12:41:37', '2020-09-14 12:41:37', 'daa4ab2e-506d-4257-91d3-c659cda8d378'),
(20, 10, 11, NULL, 38, 1, '2020-09-14 12:41:48', '2020-09-14 12:41:48', '544e8018-95df-463e-91e7-43e4b839ad64'),
(21, 9, 65, NULL, 39, 1, '2020-09-14 12:41:48', '2020-09-14 12:41:48', '2d49a197-6498-45ec-8372-5304fe93255f'),
(22, 10, 65, NULL, 38, 1, '2020-09-14 12:41:48', '2020-09-14 12:41:48', '47301d37-94bc-4d53-bfd2-3480ccf68b0d'),
(23, 8, 65, NULL, 2, 1, '2020-09-14 12:41:48', '2020-09-14 12:41:48', 'ccb29551-a6ad-46dc-8a57-2853bacca8c4'),
(30, 30, 82, NULL, 105, 1, '2020-09-15 08:09:22', '2020-09-15 08:09:22', 'aa864d13-e3bb-4755-a7a4-445fdfbbafa8'),
(31, 30, 82, NULL, 107, 2, '2020-09-15 08:09:22', '2020-09-15 08:09:22', 'cf51bac0-71ca-4769-821b-4e4eea04b31e'),
(32, 30, 82, NULL, 109, 3, '2020-09-15 08:09:22', '2020-09-15 08:09:22', '809c6ade-e7bf-4371-ab5d-7818ffa17c58'),
(33, 30, 112, NULL, 105, 1, '2020-09-15 08:09:22', '2020-09-15 08:09:22', '494a6e0c-ee58-44e2-9a3b-101d2d4b0695'),
(34, 30, 112, NULL, 107, 2, '2020-09-15 08:09:22', '2020-09-15 08:09:22', '59674b67-a99e-45a4-9301-b0dd41ee88bd'),
(35, 30, 112, NULL, 109, 3, '2020-09-15 08:09:22', '2020-09-15 08:09:22', 'c3ba1dd2-7355-42bb-aff5-c9ac83335967'),
(36, 9, 113, NULL, 39, 1, '2020-09-15 10:25:22', '2020-09-15 10:25:22', '9937a616-369a-42c4-9b61-ebec3b680f4d'),
(37, 10, 113, NULL, 38, 1, '2020-09-15 10:25:22', '2020-09-15 10:25:22', '6f9b6142-116c-4775-8f64-ed41f6f8e976'),
(38, 8, 113, NULL, 2, 1, '2020-09-15 10:25:22', '2020-09-15 10:25:22', '7a59af84-c942-46f1-a12e-07888da3109d'),
(39, 18, 119, NULL, 118, 1, '2020-09-15 12:12:02', '2020-09-15 12:12:02', '64b24ccd-616c-4347-bb14-91ae044cc769'),
(40, 30, 121, NULL, 105, 1, '2020-09-15 12:12:02', '2020-09-15 12:12:02', '1d29517d-0691-443f-a840-4b355e398b85'),
(41, 30, 121, NULL, 107, 2, '2020-09-15 12:12:02', '2020-09-15 12:12:02', 'f731bd0b-5233-47f3-955b-11154be9c717'),
(42, 30, 121, NULL, 109, 3, '2020-09-15 12:12:02', '2020-09-15 12:12:02', '9302f707-df0a-43fd-9804-b87ad368adfd'),
(43, 18, 122, NULL, 118, 1, '2020-09-15 12:12:02', '2020-09-15 12:12:02', '1a1dddac-46e6-4ebb-823f-571c5c13e245'),
(44, 1, 124, NULL, 118, 1, '2020-09-15 13:02:49', '2020-09-15 13:02:49', '95d208fb-4ccf-42cd-a307-2d10d631b7ca'),
(45, 32, 124, NULL, 123, 1, '2020-09-15 13:02:49', '2020-09-15 13:02:49', 'f4010413-fcab-404a-91e0-be18890f9817'),
(46, 1, 125, NULL, 118, 1, '2020-09-15 13:02:49', '2020-09-15 13:02:49', '9718b0ad-fabf-4de4-ac6d-fdee711a2ff1'),
(47, 32, 125, NULL, 123, 1, '2020-09-15 13:02:49', '2020-09-15 13:02:49', '94a6861d-10c5-450b-8bb9-cc5ea0b83f9c'),
(48, 1, 126, NULL, 118, 1, '2020-09-15 13:03:05', '2020-09-15 13:03:05', '728ff9d3-cdac-45c6-a463-d7342d6aefe2'),
(49, 32, 126, NULL, 123, 1, '2020-09-15 13:03:05', '2020-09-15 13:03:05', '68348295-59c0-49b9-832c-c1d39d044f46'),
(50, 1, 127, NULL, 118, 1, '2020-09-15 13:03:05', '2020-09-15 13:03:05', '69ecb433-9b14-4c9c-90df-0f107d960aff'),
(51, 32, 127, NULL, 123, 1, '2020-09-15 13:03:05', '2020-09-15 13:03:05', '95e27220-27db-4f1c-8d26-f2094dfe9ef0'),
(52, 1, 128, NULL, 118, 1, '2020-09-15 13:03:23', '2020-09-15 13:03:23', '86b282db-b0b3-4729-92bb-464b87c8ffee'),
(53, 32, 128, NULL, 123, 1, '2020-09-15 13:03:23', '2020-09-15 13:03:23', 'e9ca2d7c-4468-42a2-96c7-e9f7cb688796'),
(54, 1, 129, NULL, 118, 1, '2020-09-15 13:03:23', '2020-09-15 13:03:23', '9db571e8-0313-4fd2-8a87-63a963a1f4b4'),
(55, 32, 129, NULL, 123, 1, '2020-09-15 13:03:23', '2020-09-15 13:03:23', '25c8147b-d077-40a4-8310-35b56ff3dc29'),
(56, 1, 130, NULL, 118, 1, '2020-09-15 13:03:48', '2020-09-15 13:03:48', 'ebab9d7e-f2c5-4920-b5fa-bc65fbe71efd'),
(57, 32, 130, NULL, 123, 1, '2020-09-15 13:03:48', '2020-09-15 13:03:48', 'd56be1b9-ad4c-43bd-badb-e35c42649125'),
(58, 1, 131, NULL, 118, 1, '2020-09-15 13:03:48', '2020-09-15 13:03:48', 'f172a402-6ccc-4749-9988-37e8f34d687e'),
(59, 32, 131, NULL, 123, 1, '2020-09-15 13:03:48', '2020-09-15 13:03:48', '55ed20f2-362d-4124-9f72-7b0ca52128bc'),
(60, 24, 132, NULL, 128, 1, '2020-09-15 13:03:53', '2020-09-15 13:03:53', '8d38823e-b645-40cb-a71c-0c576d8cd5a0'),
(61, 24, 132, NULL, 126, 2, '2020-09-15 13:03:53', '2020-09-15 13:03:53', 'b76d92b8-e0eb-4202-a924-46aaebb1c943'),
(62, 24, 132, NULL, 124, 3, '2020-09-15 13:03:53', '2020-09-15 13:03:53', '6e08a92c-b728-4346-bf8c-cd7a90a9e734'),
(63, 24, 132, NULL, 130, 4, '2020-09-15 13:03:53', '2020-09-15 13:03:53', '671f1ec7-7ebd-4128-ae44-a62bffdd9710'),
(64, 30, 134, NULL, 105, 1, '2020-09-15 13:03:53', '2020-09-15 13:03:53', 'e1b82fc2-b5a4-47f1-85f3-8d55b6e5ad20'),
(65, 30, 134, NULL, 107, 2, '2020-09-15 13:03:53', '2020-09-15 13:03:53', 'ba40bc6a-d901-489e-9490-aab82c5fce69'),
(66, 30, 134, NULL, 109, 3, '2020-09-15 13:03:53', '2020-09-15 13:03:53', '284acb0b-b697-4f4f-afcf-1bec11b324d0'),
(67, 18, 135, NULL, 118, 1, '2020-09-15 13:03:53', '2020-09-15 13:03:53', '7e2467f6-afd1-4343-91d4-75bb1aff267f'),
(68, 24, 136, NULL, 128, 1, '2020-09-15 13:03:53', '2020-09-15 13:03:53', '164b0902-f432-4a24-a237-480987d52778'),
(69, 24, 136, NULL, 126, 2, '2020-09-15 13:03:53', '2020-09-15 13:03:53', '5a4d4132-f0d2-4b6d-80b2-fa371f41f8cf'),
(70, 24, 136, NULL, 124, 3, '2020-09-15 13:03:53', '2020-09-15 13:03:53', 'ea218bd4-3bfe-4734-b772-8e6036b17c4f'),
(71, 24, 136, NULL, 130, 4, '2020-09-15 13:03:53', '2020-09-15 13:03:53', '315fd4a9-e791-48c2-831e-90a2fabf3159'),
(72, 1, 137, NULL, 118, 1, '2020-09-15 13:12:32', '2020-09-15 13:12:32', '8f5278aa-1b4b-4fd3-8547-4424d35883d0'),
(73, 32, 137, NULL, 123, 1, '2020-09-15 13:12:32', '2020-09-15 13:12:32', 'a7f09afa-d299-40e0-8e77-4e590d47efb7'),
(74, 30, 139, NULL, 105, 1, '2020-09-15 13:12:36', '2020-09-15 13:12:36', 'ba4ae663-1c23-4e7a-8786-b035afb59c18'),
(75, 30, 139, NULL, 107, 2, '2020-09-15 13:12:36', '2020-09-15 13:12:36', '332b35f6-e08b-46d9-b189-ccfc754f9340'),
(76, 30, 139, NULL, 109, 3, '2020-09-15 13:12:36', '2020-09-15 13:12:36', 'cee2b9f5-4892-4310-bc64-86ab1fe85332'),
(77, 18, 140, NULL, 118, 1, '2020-09-15 13:12:36', '2020-09-15 13:12:36', '79157dc1-484a-4fdc-8b94-62c974a66ebf'),
(78, 24, 141, NULL, 128, 1, '2020-09-15 13:12:36', '2020-09-15 13:12:36', 'f8416ead-3203-49f0-b781-be8581497536'),
(79, 24, 141, NULL, 126, 2, '2020-09-15 13:12:36', '2020-09-15 13:12:36', '9a990f80-8451-44d9-8956-63a1e0d4e1b1'),
(80, 24, 141, NULL, 124, 3, '2020-09-15 13:12:36', '2020-09-15 13:12:36', 'fe421132-e211-44dd-bec6-ffecc87b6fd1'),
(81, 24, 141, NULL, 130, 4, '2020-09-15 13:12:36', '2020-09-15 13:12:36', 'd23c03f2-ab3a-45d5-8a9e-651842fcb29d'),
(82, 1, 105, NULL, 144, 1, '2020-09-15 13:31:38', '2020-09-15 13:31:38', '0816fdb8-a117-41d5-997d-d1acae6c1402'),
(83, 1, 145, NULL, 144, 1, '2020-09-15 13:31:38', '2020-09-15 13:31:38', '35339487-3757-4149-842f-a5dbd69df7fa'),
(84, 1, 107, NULL, 142, 1, '2020-09-15 13:31:52', '2020-09-15 13:31:52', '126b8bc2-16a5-46f4-af28-133a7a9e4456'),
(85, 1, 146, NULL, 142, 1, '2020-09-15 13:31:52', '2020-09-15 13:31:52', 'c36337a3-9a37-4cdf-b1df-ce4d706782b3'),
(86, 1, 109, NULL, 143, 1, '2020-09-15 13:32:01', '2020-09-15 13:32:01', '6ebb8e2f-2e4d-4c15-9ab2-cc93d05e2ad8'),
(87, 1, 147, NULL, 143, 1, '2020-09-15 13:32:01', '2020-09-15 13:32:01', 'e9e0c2b2-2d4d-463e-88c6-41979951837a'),
(88, 1, 148, NULL, 142, 1, '2020-09-15 13:32:07', '2020-09-15 13:32:07', '1bb0cca5-b093-4ee6-8cb7-dc51b957571e'),
(89, 30, 150, NULL, 105, 1, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '5cd6cea3-0c50-42b9-98e5-5b1ea3fcefc7'),
(90, 30, 150, NULL, 107, 2, '2020-09-15 13:32:08', '2020-09-15 13:32:08', 'b179a9f5-70e2-4819-b2b2-2f899ce62638'),
(91, 30, 150, NULL, 109, 3, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '54c38f65-d041-4221-bb9b-fe70cf8f6601'),
(92, 18, 151, NULL, 118, 1, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '4b1f3363-3257-4808-a706-9a908a7fad69'),
(93, 24, 152, NULL, 128, 1, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '9f64f9a8-d27e-4cab-ba9b-c09e01cfc0b4'),
(94, 24, 152, NULL, 126, 2, '2020-09-15 13:32:08', '2020-09-15 13:32:08', 'a73b1950-ce9f-4b26-9de1-6257f7e47e71'),
(95, 24, 152, NULL, 124, 3, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '1ffbde99-5110-4a35-a6fe-8160f23b7d76'),
(96, 24, 152, NULL, 130, 4, '2020-09-15 13:32:08', '2020-09-15 13:32:08', '888aee8a-3a50-4b55-8da8-e75238ff4268'),
(97, 30, 154, NULL, 105, 1, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '8f89a22b-d96f-4c86-aa33-f5deaeaaef55'),
(98, 30, 154, NULL, 107, 2, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '0531e85d-98bf-45ba-b3fc-02ab348c30c0'),
(99, 30, 154, NULL, 109, 3, '2020-09-15 13:44:55', '2020-09-15 13:44:55', 'f6031dad-0732-46d9-a79d-8ba37686e169'),
(100, 18, 155, NULL, 118, 1, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '029ad4e7-1b9b-4a59-86ae-62923888d0ce'),
(101, 24, 156, NULL, 128, 1, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '08f6dae0-c654-4cbe-9070-72609fc6fd08'),
(102, 24, 156, NULL, 126, 2, '2020-09-15 13:44:55', '2020-09-15 13:44:55', 'c48e1f4d-8a71-423c-b25f-8a5bbb466893'),
(103, 24, 156, NULL, 124, 3, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '1df1b9cc-a005-4114-a473-42d730963ac1'),
(104, 24, 156, NULL, 130, 4, '2020-09-15 13:44:55', '2020-09-15 13:44:55', '01c6f409-435d-4b8b-974a-76da267bfb5d'),
(105, 30, 157, NULL, 105, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', 'a44bb952-18a4-46df-90bd-9eead415e7e0'),
(106, 30, 157, NULL, 109, 2, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '6925a8ce-341a-40fe-8b74-51faf6ef3fe0'),
(107, 30, 157, NULL, 107, 3, '2020-09-15 14:09:54', '2020-09-15 14:09:54', 'acc321e8-a420-42a6-ba5d-2be8cfd1edd0'),
(108, 30, 159, NULL, 105, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', 'b1709d84-b4fb-46e7-b1a9-0d95e3f21429'),
(109, 30, 159, NULL, 107, 2, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '11acb535-1ff1-4e46-9b5d-4e55377a933c'),
(110, 30, 159, NULL, 109, 3, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '5288c054-216d-42aa-823a-e865dc8fc2eb'),
(111, 18, 160, NULL, 118, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '757ddef3-4d83-494a-8141-428e04284c26'),
(112, 24, 161, NULL, 128, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '9aeffa1d-5d94-4f5a-8bd6-2892deb67467'),
(113, 24, 161, NULL, 126, 2, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '29c3e505-79b1-4a4c-9ae6-8198f4ec6565'),
(114, 24, 161, NULL, 124, 3, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '9a3bf5d3-2771-4925-b9a1-4fb57e52d864'),
(115, 24, 161, NULL, 130, 4, '2020-09-15 14:09:54', '2020-09-15 14:09:54', 'fdf38388-17e5-422d-8ab6-16b37ffaaa87'),
(116, 30, 162, NULL, 105, 1, '2020-09-15 14:09:54', '2020-09-15 14:09:54', 'baad765e-6e6c-40af-8445-69006fa23a22'),
(117, 30, 162, NULL, 109, 2, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '55b76e13-81ca-435f-879c-205aa40dab64'),
(118, 30, 162, NULL, 107, 3, '2020-09-15 14:09:54', '2020-09-15 14:09:54', '97572aa2-d249-4932-bbee-3abb96ae5d57'),
(119, 30, 164, NULL, 105, 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '669e797f-8d80-4741-9650-59a356989aeb'),
(120, 30, 164, NULL, 107, 2, '2020-09-15 14:12:47', '2020-09-15 14:12:47', 'def114f9-b4be-4b19-b154-5648fb3a5e59'),
(121, 30, 164, NULL, 109, 3, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '0191137c-5a91-4b62-8c6f-5dfbe6b9d840'),
(122, 18, 165, NULL, 118, 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '981bba11-8301-4ed4-9beb-9bcbf423f8d0'),
(123, 30, 166, NULL, 105, 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', 'e02218e2-be6f-417d-ae33-1c0d06071b5a'),
(124, 30, 166, NULL, 109, 2, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '38fc75fb-d849-4d2d-af71-33bd8fa5194a'),
(125, 30, 166, NULL, 107, 3, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '70360064-725e-40c6-8847-70a6ce58b6f9'),
(126, 24, 167, NULL, 128, 1, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '17134ba5-e4b4-4985-b18d-586aeeb16938'),
(127, 24, 167, NULL, 126, 2, '2020-09-15 14:12:47', '2020-09-15 14:12:47', 'c7e3157a-03e5-443d-b927-3b0dd47ac905'),
(128, 24, 167, NULL, 124, 3, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '66cbbc44-d40c-4e37-80a1-71db30676bb1'),
(129, 24, 167, NULL, 130, 4, '2020-09-15 14:12:47', '2020-09-15 14:12:47', '2e00ad2a-9094-47c5-9135-7025d55c3356'),
(130, 30, 169, NULL, 105, 1, '2020-09-15 14:13:14', '2020-09-15 14:13:14', '1c264c9d-a634-4b71-ade5-67976d1005a8'),
(131, 30, 169, NULL, 107, 2, '2020-09-15 14:13:14', '2020-09-15 14:13:14', 'aea5138c-105d-467d-abfe-f59f20426e29'),
(132, 30, 169, NULL, 109, 3, '2020-09-15 14:13:14', '2020-09-15 14:13:14', '10f7180a-6ca4-4513-8853-1682b0b821c9'),
(133, 18, 170, NULL, 118, 1, '2020-09-15 14:13:14', '2020-09-15 14:13:14', '0b090191-099a-4618-9ec3-68bf56ed3fe2'),
(134, 24, 171, NULL, 128, 1, '2020-09-15 14:13:14', '2020-09-15 14:13:14', 'c1e0c2e1-94eb-4697-937a-b0467b3c09e6'),
(135, 24, 171, NULL, 126, 2, '2020-09-15 14:13:14', '2020-09-15 14:13:14', '5fd43455-0d3a-4633-ab20-6e4e5e896c21'),
(136, 24, 171, NULL, 124, 3, '2020-09-15 14:13:14', '2020-09-15 14:13:14', 'c0633c92-2b44-42cb-a228-b9c028072b72'),
(137, 24, 171, NULL, 130, 4, '2020-09-15 14:13:14', '2020-09-15 14:13:14', 'fdf50f89-e17e-43db-837f-800db7235312'),
(138, 28, 179, NULL, 174, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '28cba3af-4065-4fcf-9e40-c9898a6c8a1c'),
(139, 28, 179, NULL, 172, 2, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '58901e6a-fe26-4711-80f2-34a8baa10468'),
(140, 28, 179, NULL, 177, 3, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'c894c600-6b8e-4db6-ae13-255f2972c9d3'),
(141, 30, 181, NULL, 105, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'b60ad464-d6e7-40b8-864d-e3a33652fdf5'),
(142, 30, 181, NULL, 107, 2, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '5d8d983c-0fc5-47b1-bfc3-f8a746b50b4a'),
(143, 30, 181, NULL, 109, 3, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'c707d6b9-9b84-45e8-949c-d74ec50a0212'),
(144, 18, 182, NULL, 118, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '0679a06d-8095-4914-9e1d-c8520d9d754f'),
(145, 24, 183, NULL, 128, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '0f1ae973-69bc-4784-96a4-83bb54024317'),
(146, 24, 183, NULL, 126, 2, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'bbda6e29-3a1e-41eb-87cc-5cf8a3e97d42'),
(147, 24, 183, NULL, 124, 3, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'd7d78a66-70d5-44ed-80d6-408b1d83e79f'),
(148, 24, 183, NULL, 130, 4, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'a5939d9c-f1b5-43ef-9437-9b73db1c9422'),
(149, 28, 184, NULL, 174, 1, '2020-09-16 07:36:16', '2020-09-16 07:36:16', '9da6a9f5-10cd-4ca7-b124-eba831701cee'),
(150, 28, 184, NULL, 172, 2, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'fa3d78aa-440a-4e5b-a916-4b52ed919065'),
(151, 28, 184, NULL, 177, 3, '2020-09-16 07:36:16', '2020-09-16 07:36:16', 'e30c6c10-e10e-4e60-8211-f184d8b79622'),
(152, 28, 179, NULL, 185, 4, '2020-09-16 08:38:50', '2020-09-16 08:38:50', 'a5f75ba5-6968-4524-82d7-82b8ea7a2fda'),
(153, 30, 188, NULL, 105, 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '42d8bdd8-9c53-419d-bf3e-ef88bbd7bf64'),
(154, 30, 188, NULL, 107, 2, '2020-09-16 08:38:50', '2020-09-16 08:38:50', 'e66bdc43-4707-40d5-aa1a-855801563077'),
(155, 30, 188, NULL, 109, 3, '2020-09-16 08:38:50', '2020-09-16 08:38:50', 'aa30342a-f81b-49bf-8907-b70ec495f663'),
(156, 18, 189, NULL, 118, 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', 'cb3cf78f-a694-433d-bc1b-3425276b3bea'),
(157, 24, 190, NULL, 128, 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '0b2090a1-7a8b-46c6-b584-8b05624500bb'),
(158, 24, 190, NULL, 126, 2, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '51b64948-bb0d-46d4-9d1a-b4e40fc2aeec'),
(159, 24, 190, NULL, 124, 3, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '2a7ea11f-7e7e-464e-8075-490b0198ad35'),
(160, 24, 190, NULL, 130, 4, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '5aa5a1d2-3119-4ecb-99b0-63446e437941'),
(161, 28, 191, NULL, 174, 1, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '5512d0de-698c-4264-8d3b-e736df155bae'),
(162, 28, 191, NULL, 172, 2, '2020-09-16 08:38:50', '2020-09-16 08:38:50', 'a42091cb-bfd8-443a-a57a-d8f129679f34'),
(163, 28, 191, NULL, 177, 3, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '68bee1ba-6869-42af-9cd3-9517a0bbbbb3'),
(164, 28, 191, NULL, 185, 4, '2020-09-16 08:38:50', '2020-09-16 08:38:50', '5c2753b7-354b-42d0-b589-0ef4c1f94fd9'),
(165, 28, 179, NULL, 192, 5, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '4ee2385a-7291-4996-8971-ec831f27f607'),
(166, 28, 179, NULL, 194, 6, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'f8d30947-8ccd-4215-8174-cc5b933c93e8'),
(167, 30, 197, NULL, 105, 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '07cb9579-98ff-4096-b171-3bc0085566ac'),
(168, 30, 197, NULL, 107, 2, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '20dfc0ed-4757-4e9b-a903-9b3b88bbddb7'),
(169, 30, 197, NULL, 109, 3, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'f804acd3-6dfe-41e1-8586-4e2af94f2b43'),
(170, 18, 198, NULL, 118, 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '9c4031b7-3200-47b5-8219-5fe013377c4c'),
(171, 24, 199, NULL, 128, 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '51d05945-006e-44d1-a897-05c038290423'),
(172, 24, 199, NULL, 126, 2, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '0d24f410-fe76-4c11-8d2f-b1a1116a05f1'),
(173, 24, 199, NULL, 124, 3, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '51b20880-b07f-41ac-a156-7a22193ff032'),
(174, 24, 199, NULL, 130, 4, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '94079310-eae9-4012-9a9c-51f344bab587'),
(175, 28, 200, NULL, 174, 1, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'b8e60e3f-2e8e-4f06-8eb4-164c00511c44'),
(176, 28, 200, NULL, 172, 2, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'c1fe454a-2029-4749-8e2d-23a91f93122d'),
(177, 28, 200, NULL, 177, 3, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'd11066ae-8da6-4351-b6db-ed3432638293'),
(178, 28, 200, NULL, 185, 4, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '63500f7f-88b5-432d-b590-b9be44404a77'),
(179, 28, 200, NULL, 192, 5, '2020-09-16 10:02:20', '2020-09-16 10:02:20', 'aa29a0ba-2e35-483e-a4a2-fefa1ca7ec7d'),
(180, 28, 200, NULL, 194, 6, '2020-09-16 10:02:20', '2020-09-16 10:02:20', '7db247b1-b065-4f5f-8fa6-ca7b2556e311'),
(181, 30, 203, NULL, 105, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', 'c708045f-d2ad-4c34-a9b0-8b6d0f19fe36'),
(182, 30, 203, NULL, 107, 2, '2020-09-16 12:48:16', '2020-09-16 12:48:16', 'ba77dc19-c413-4565-b80e-d4e25cd58d4f'),
(183, 30, 203, NULL, 109, 3, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '1b12be55-f236-4e77-a337-1923be648cb3'),
(184, 18, 204, NULL, 118, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '18665767-37bf-46c0-9711-47fc807b7a39'),
(185, 24, 205, NULL, 128, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '17ceb6ec-f701-4633-bd12-ad41ac096e1f'),
(186, 24, 205, NULL, 126, 2, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '9a4c732c-d0df-4b98-915e-0102ebd595a7'),
(187, 24, 205, NULL, 124, 3, '2020-09-16 12:48:16', '2020-09-16 12:48:16', 'fc7aaf68-d85c-4817-bc37-5e6d43e93d11'),
(188, 24, 205, NULL, 130, 4, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '832a281b-2d0b-4456-a40d-f86b71f57aee'),
(189, 28, 206, NULL, 174, 1, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '2b8aa20d-b072-43e8-97ab-d42070f2d508'),
(190, 28, 206, NULL, 172, 2, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '4f5918b2-c89b-430d-a13f-64235ab78810'),
(191, 28, 206, NULL, 177, 3, '2020-09-16 12:48:16', '2020-09-16 12:48:16', 'bbdf9da0-5d79-4589-8654-db075da97799'),
(192, 28, 206, NULL, 185, 4, '2020-09-16 12:48:16', '2020-09-16 12:48:16', 'e68d837e-2fe4-4e84-8300-a1cd13b7fefe'),
(193, 28, 206, NULL, 192, 5, '2020-09-16 12:48:16', '2020-09-16 12:48:16', 'c49d0a23-d499-4562-a3c3-c12b91fda0fe'),
(194, 28, 206, NULL, 194, 6, '2020-09-16 12:48:16', '2020-09-16 12:48:16', '723f413a-a5c7-4f75-9473-5f78f03151a4'),
(195, 41, 201, NULL, 210, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', 'cc7ce5af-a984-4687-a8bb-e63cea731319'),
(196, 41, 201, NULL, 212, 2, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '27d1b962-3716-4c8f-a3dd-da577a5646fa'),
(197, 41, 201, NULL, 208, 3, '2020-09-16 13:08:43', '2020-09-16 13:08:43', 'eb4ac879-2099-4009-989d-f1979d03d33d'),
(198, 30, 215, NULL, 105, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '71e8275c-c08f-47a5-9d82-0d853b7960f4'),
(199, 30, 215, NULL, 107, 2, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '9f655802-edea-4355-9f4f-92ac226436a4'),
(200, 30, 215, NULL, 109, 3, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '0d27d9d1-88e4-4273-9c94-44501a7c564a'),
(201, 18, 216, NULL, 118, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', 'a4732b25-d554-4cc1-a2e2-98dda0a13b91'),
(202, 24, 217, NULL, 128, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', 'f5bd316d-9665-40d3-8b00-f9d152701bae'),
(203, 24, 217, NULL, 126, 2, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '2af29bae-a2df-4eb0-9eba-ea6a22e2c419'),
(204, 24, 217, NULL, 124, 3, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '310ee7e2-3805-4e1d-b60c-5fb79602ec25'),
(205, 24, 217, NULL, 130, 4, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '5075a382-233a-46d8-bcb5-e06fd0c4105a'),
(206, 28, 218, NULL, 174, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', 'e176d2c2-3d92-4c48-b836-329924465961'),
(207, 28, 218, NULL, 172, 2, '2020-09-16 13:08:43', '2020-09-16 13:08:43', 'a58fda87-692c-4f4e-96c2-2a920cacf5be'),
(208, 28, 218, NULL, 177, 3, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '6a58095c-7637-4cf8-a7ec-745a7e18b44a'),
(209, 28, 218, NULL, 185, 4, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '8d431e8e-9d22-4261-be62-745d9be21ce3'),
(210, 28, 218, NULL, 192, 5, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '688db508-1ea2-4924-871a-7edbb55a092c'),
(211, 28, 218, NULL, 194, 6, '2020-09-16 13:08:43', '2020-09-16 13:08:43', 'cc363d3e-786b-43c7-8204-1327d8df1d26'),
(212, 41, 219, NULL, 210, 1, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '673da7ec-ca5c-4b1e-b2a6-32d1282dd236'),
(213, 41, 219, NULL, 212, 2, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '54d284ed-a314-4361-a5ed-3d5077106726'),
(214, 41, 219, NULL, 208, 3, '2020-09-16 13:08:43', '2020-09-16 13:08:43', '12339a3f-4891-40f3-81ea-6a52c271e422'),
(215, 30, 221, NULL, 105, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '473458fc-cfc1-47e5-aeda-c55f3ea4f14c'),
(216, 30, 221, NULL, 107, 2, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '6783c850-936b-4e47-b77e-8a8febab9eb5'),
(217, 30, 221, NULL, 109, 3, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '2eb6a70f-92b3-4d54-929a-c1caed79652d'),
(218, 18, 222, NULL, 118, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', 'dd1347ca-9c05-4687-bca2-64c6a09d4838'),
(219, 24, 223, NULL, 128, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '1998639c-097c-44b4-8569-246440b30fe9'),
(220, 24, 223, NULL, 126, 2, '2020-09-16 13:13:34', '2020-09-16 13:13:34', 'd85cba4e-d7a0-42a3-b965-c42c882f55ba'),
(221, 24, 223, NULL, 124, 3, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '8232fbc7-770f-4b0c-8dac-ceda05dabd14'),
(222, 24, 223, NULL, 130, 4, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '7efa3582-61fb-43c4-b198-cb8a7f5a2bd8'),
(223, 28, 224, NULL, 174, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '033faf88-2e35-4fa9-86d7-4155af82d6b9'),
(224, 28, 224, NULL, 172, 2, '2020-09-16 13:13:34', '2020-09-16 13:13:34', 'ffec204b-c728-4ce1-9d77-20bbe3e219cd'),
(225, 28, 224, NULL, 177, 3, '2020-09-16 13:13:34', '2020-09-16 13:13:34', 'e56f6aee-de1c-4f4a-a00a-22c013419270'),
(226, 28, 224, NULL, 185, 4, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '1101b329-942d-43dc-b840-971fd95caaec'),
(227, 28, 224, NULL, 192, 5, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '653d23c3-3831-44a1-b881-76f9d609e7ec'),
(228, 28, 224, NULL, 194, 6, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '0a83f41b-c392-48bf-83af-fbbcda682cc5'),
(229, 41, 225, NULL, 210, 1, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '5c26eb19-7929-4409-85e5-1e0a45e150bf'),
(230, 41, 225, NULL, 212, 2, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '2e02c203-1eff-4f7e-a6ba-6e34d32ee1c1'),
(231, 41, 225, NULL, 208, 3, '2020-09-16 13:13:34', '2020-09-16 13:13:34', '81bce0fe-8023-4ec4-8fd4-9e57530845f1'),
(232, 43, 246, NULL, 123, 1, '2020-09-16 13:32:01', '2020-09-16 13:32:01', '8ef80e4f-1e93-4da2-a386-c48957189e94'),
(233, 43, 247, NULL, 123, 1, '2020-09-16 13:32:01', '2020-09-16 13:32:01', 'af6fe7e4-396f-4c00-9317-794675a32178'),
(234, 43, 248, NULL, 123, 1, '2020-09-16 13:32:20', '2020-09-16 13:32:20', '39963fe7-13c9-4f4b-8053-ac6936ce36f9'),
(235, 43, 249, NULL, 123, 1, '2020-09-16 13:32:20', '2020-09-16 13:32:20', 'e13ce002-55e8-41cb-a202-39285dd887a7'),
(236, 9, 234, NULL, 39, 1, '2020-09-16 13:33:53', '2020-09-16 13:33:53', '26f170b7-6cbc-4ba1-9570-037027f0641a'),
(237, 10, 234, NULL, 38, 1, '2020-09-16 13:33:53', '2020-09-16 13:33:53', '733962ef-0fc6-4c60-b266-a3f36fd87675'),
(238, 44, 234, NULL, 246, 1, '2020-09-16 13:33:53', '2020-09-16 13:33:53', 'cae4ff7d-19a6-4fa5-8755-0c503f1ba92e'),
(239, 44, 234, NULL, 248, 2, '2020-09-16 13:33:53', '2020-09-16 13:33:53', '407b3612-7a4d-43ec-852d-f0fc9fff0a13'),
(240, 9, 254, NULL, 39, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', 'c7a41e5c-a049-43c1-bec5-7e0455ea21e8'),
(241, 10, 254, NULL, 38, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '497e9f7d-f28e-450e-93fb-603073d6c046'),
(242, 44, 254, NULL, 246, 1, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '89babfc4-48ec-493c-bbf4-061d96850937'),
(243, 44, 254, NULL, 248, 2, '2020-09-16 13:33:54', '2020-09-16 13:33:54', '6133b546-abad-498d-83bf-c2409d403886'),
(244, 9, 259, NULL, 39, 1, '2020-09-16 13:34:09', '2020-09-16 13:34:09', '8ac0b87f-62bb-4d8b-af2e-64d48bef1a66'),
(245, 10, 259, NULL, 38, 1, '2020-09-16 13:34:09', '2020-09-16 13:34:09', '37818fc3-e924-4cba-b219-b2535d89a341'),
(246, 44, 259, NULL, 246, 1, '2020-09-16 13:34:09', '2020-09-16 13:34:09', 'ea11a1be-5965-4a6f-8cb8-1e938b04acac'),
(247, 44, 259, NULL, 248, 2, '2020-09-16 13:34:09', '2020-09-16 13:34:09', 'fc279ca7-8e44-458a-9199-a724ad8f8bb6'),
(248, 42, 234, NULL, 236, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '510b8a94-e40b-42d8-8c12-a13b9266a522'),
(249, 42, 234, NULL, 240, 2, '2020-09-16 13:34:50', '2020-09-16 13:34:50', 'e184d13f-237f-45d2-8414-dd3268bb12ff'),
(250, 42, 264, NULL, 236, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '3ee7deb0-ce75-4545-bccd-b3b78e05673f'),
(251, 42, 264, NULL, 240, 2, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '16d4aeb7-b7cc-459d-9144-44c821dd7073'),
(252, 9, 264, NULL, 39, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '4d123e99-9337-418e-92bc-6329d1c0c6f3'),
(253, 10, 264, NULL, 38, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '6768a7c5-2ee2-4d90-aa6d-1a5eec559465'),
(254, 44, 264, NULL, 246, 1, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '1eb8e8dc-0b98-4be7-9d05-94ab3be88049'),
(255, 44, 264, NULL, 248, 2, '2020-09-16 13:34:50', '2020-09-16 13:34:50', '5f544bdd-36b8-49f3-82ce-8593e186b920'),
(256, 42, 269, NULL, 236, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '01604a0e-78ef-4625-ab90-db863cbc1f01'),
(257, 42, 269, NULL, 240, 2, '2020-09-16 14:11:39', '2020-09-16 14:11:39', 'b9357e91-ba17-43c9-94b4-18aa701f0cdd'),
(258, 9, 269, NULL, 39, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '9b8ad0b7-8019-483b-afdb-5cdac7645fb0'),
(259, 10, 269, NULL, 38, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', 'aac58b61-0c27-4f12-a42b-fa7cbbc554b1'),
(260, 44, 269, NULL, 246, 1, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '0937979e-e9e9-4be8-867c-2ade5eea7d67'),
(261, 44, 269, NULL, 248, 2, '2020-09-16 14:11:39', '2020-09-16 14:11:39', '3b4c1de1-f95f-4f70-a98f-66dc8efed303'),
(262, 42, 277, NULL, 236, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '3b17c173-e2fc-4afe-9d89-14ac33cbe622'),
(263, 42, 277, NULL, 240, 2, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'fe204802-19a5-4251-ba86-c586b4c9350a'),
(264, 9, 277, NULL, 39, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', '4961a6ad-6fe4-4910-a3a0-f512115c8bae'),
(265, 10, 277, NULL, 38, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'c44c66a2-0ce8-468e-9abe-f3f47c0897b8'),
(266, 44, 277, NULL, 246, 1, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'b4524378-d15a-4729-b15a-94fbed8bf01a'),
(267, 44, 277, NULL, 248, 2, '2020-09-16 14:12:51', '2020-09-16 14:12:51', 'b0ccd79e-186e-4b3e-91a1-b9f97a2215b6'),
(268, 1, 285, NULL, 144, 1, '2020-09-16 14:30:33', '2020-09-16 14:30:33', '6c22325f-4429-4822-a318-6d04e625ecfb'),
(269, 30, 287, NULL, 105, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '27410b4d-d395-404c-bf05-339a5af50d6e'),
(270, 30, 287, NULL, 107, 2, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '9c766e98-c462-417d-a037-39c12605e0bc'),
(271, 30, 287, NULL, 109, 3, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '76f60c02-78be-4408-97fd-79fcfd2c1418'),
(272, 18, 288, NULL, 118, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '342a42b3-e5ef-4246-a78e-466dd89e4ff9'),
(273, 24, 289, NULL, 128, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', 'e53eb119-9420-4496-b73d-39131dd7316b'),
(274, 24, 289, NULL, 126, 2, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '305acbb2-313c-4937-8d42-da6d9184486b'),
(275, 24, 289, NULL, 124, 3, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '7a47ba73-62dd-4137-98d3-a299fbf1ed78'),
(276, 24, 289, NULL, 130, 4, '2020-09-16 14:30:34', '2020-09-16 14:30:34', 'fedcee40-fc84-4173-bf6c-f8ed740a7505'),
(277, 28, 290, NULL, 174, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', 'a29c56ea-e249-40c4-af21-731b8974bfbc'),
(278, 28, 290, NULL, 172, 2, '2020-09-16 14:30:34', '2020-09-16 14:30:34', 'dd04cc1f-0923-4c70-b8d7-b37115bac31c'),
(279, 28, 290, NULL, 177, 3, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '0d435f29-35a6-48be-b054-4ca28f7cc2c7'),
(280, 28, 290, NULL, 185, 4, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '021a2200-35a7-49c4-9944-0bbd3e3a99e5'),
(281, 28, 290, NULL, 192, 5, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '0e388e35-d3ee-4359-850a-f7f70f8a905d'),
(282, 28, 290, NULL, 194, 6, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '8fb38e23-96d2-4c94-9f80-db8012508367'),
(283, 41, 291, NULL, 210, 1, '2020-09-16 14:30:34', '2020-09-16 14:30:34', 'f47920f9-7345-4517-bdff-7b538d38bf39'),
(284, 41, 291, NULL, 212, 2, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '5fa6ac5d-fb79-4749-a8f2-2d5dfd276039'),
(285, 41, 291, NULL, 208, 3, '2020-09-16 14:30:34', '2020-09-16 14:30:34', '4eceb35f-6890-46d6-ac00-9c30912b5a43'),
(286, 48, 201, NULL, 143, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'faac1bc6-3d12-4ca6-b02c-e6f335dfcf18'),
(287, 30, 293, NULL, 105, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '07b0e43c-1da1-4e1b-b840-c84696a2b078'),
(288, 30, 293, NULL, 107, 2, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '2722efdb-2f4f-4bbf-9008-54eee556c55c'),
(289, 30, 293, NULL, 109, 3, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'a98d3f9e-dd50-4ad2-acb8-250565f64354'),
(290, 18, 294, NULL, 118, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'c1857d33-fa0c-43d2-b76d-583e6c82887c'),
(291, 24, 295, NULL, 128, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '8e0df309-30d7-4f5e-8899-b8c3fb27bc0d'),
(292, 24, 295, NULL, 126, 2, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '553f7cc6-1944-4680-b84f-e4290d79fba3'),
(293, 24, 295, NULL, 124, 3, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'db2ee159-8a8a-4a17-b238-cedb5820e890'),
(294, 24, 295, NULL, 130, 4, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '5eda09e3-edf3-438c-b51b-408f1ccefdd5'),
(295, 28, 296, NULL, 174, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '430bd811-2553-43d4-b12c-7c6927fbea6d'),
(296, 28, 296, NULL, 172, 2, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'ea0ba1c9-bfb8-4252-ba64-83550d5cd36a'),
(297, 28, 296, NULL, 177, 3, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'e2d54dee-9329-4af5-a226-468975a8d2f7'),
(298, 28, 296, NULL, 185, 4, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '63577781-2f07-4150-92aa-cc4b17970976'),
(299, 28, 296, NULL, 192, 5, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'b4a79e93-2a3d-42de-86b6-96a9f3218bf0'),
(300, 28, 296, NULL, 194, 6, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '4aa626e9-c6ad-41e7-ace2-72b941107ead'),
(301, 48, 297, NULL, 143, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'b5e4ba3c-f58c-4b9a-a111-3be6205b743d'),
(302, 41, 297, NULL, 210, 1, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '54a9646d-6c33-4c15-948a-6c87971a2347'),
(303, 41, 297, NULL, 212, 2, '2020-09-16 14:36:56', '2020-09-16 14:36:56', 'd94a635d-3d4f-4fb7-bd52-69152daaf30f'),
(304, 41, 297, NULL, 208, 3, '2020-09-16 14:36:56', '2020-09-16 14:36:56', '4dec2a37-5c81-468a-a535-a2b0005ce9d7'),
(305, 42, 298, NULL, 236, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'eaa587b8-c78e-45fa-b4a7-4b5665e9b0ef'),
(306, 42, 298, NULL, 240, 2, '2020-09-17 12:33:11', '2020-09-17 12:33:11', '39933629-87ab-4d8a-9cee-190f88a3a327'),
(307, 9, 298, NULL, 39, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'b7c67b4b-69ab-4cd5-ab2b-13c4c34f2b52'),
(308, 10, 298, NULL, 38, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'f1843c0b-fc0c-4faa-b5be-8e53ca21fdaa'),
(309, 44, 298, NULL, 246, 1, '2020-09-17 12:33:11', '2020-09-17 12:33:11', 'e77e5cbb-900f-4d34-90a9-666b4a51da31'),
(310, 44, 298, NULL, 248, 2, '2020-09-17 12:33:11', '2020-09-17 12:33:11', '72f5b1ec-56ab-4132-ba6b-ced57b816f26'),
(311, 9, 306, NULL, 39, 1, '2020-09-17 12:36:05', '2020-09-17 12:36:05', '1c55d74b-d644-430d-9398-ee93a12e1f90'),
(312, 10, 306, NULL, 38, 1, '2020-09-17 12:36:05', '2020-09-17 12:36:05', '640886de-9a69-4fc5-a453-cb0e9b028df1'),
(313, 8, 306, NULL, 2, 1, '2020-09-17 12:36:05', '2020-09-17 12:36:05', '5383aad6-9cc0-404b-978d-d108f201b10c'),
(314, 9, 311, NULL, 39, 1, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '296568bd-7a08-4cb0-8bc3-ae0197a91dcc'),
(315, 10, 311, NULL, 38, 1, '2020-09-17 12:36:36', '2020-09-17 12:36:36', '4195465c-f6e6-4d02-b9a4-a67e38f08b23'),
(316, 8, 311, NULL, 2, 1, '2020-09-17 12:36:36', '2020-09-17 12:36:36', 'b6b0776a-8951-424d-bc1a-b5f22432e4b6'),
(317, 9, 316, NULL, 39, 1, '2020-09-17 12:37:55', '2020-09-17 12:37:55', '318597de-289f-4f76-aa42-f914db1b73ac'),
(318, 10, 316, NULL, 38, 1, '2020-09-17 12:37:55', '2020-09-17 12:37:55', '5c461920-edfd-4af0-a66e-d96edd483617'),
(319, 8, 316, NULL, 2, 1, '2020-09-17 12:37:55', '2020-09-17 12:37:55', 'ab572d5d-a527-4674-8f53-efa544661fb3'),
(320, 9, 321, NULL, 39, 1, '2020-09-17 12:38:33', '2020-09-17 12:38:33', '67807edb-d294-429c-a575-d7cfa9291b59'),
(321, 10, 321, NULL, 38, 1, '2020-09-17 12:38:33', '2020-09-17 12:38:33', 'a11a2456-9254-4711-ae5a-7c2311801122'),
(322, 8, 321, NULL, 2, 1, '2020-09-17 12:38:33', '2020-09-17 12:38:33', 'eb3b4d36-2ea3-4a47-93d3-5fca10cebde0'),
(323, 42, 326, NULL, 236, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '3c428ca6-9102-4cf3-b0dc-602b16a8ffca'),
(324, 42, 326, NULL, 240, 2, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '4e880359-4621-4c77-9a39-4923299e4bde'),
(325, 9, 326, NULL, 39, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '2f81fb68-cfea-4b01-9569-66af4f4ad861'),
(326, 10, 326, NULL, 38, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '4cd0eaf8-db4d-4662-8525-cb8dcd8cd249'),
(327, 44, 326, NULL, 246, 1, '2020-09-17 12:38:57', '2020-09-17 12:38:57', '21ada982-a842-49af-8c87-b89779ca19c3'),
(328, 44, 326, NULL, 248, 2, '2020-09-17 12:38:57', '2020-09-17 12:38:57', 'bc943502-cfbd-414c-9160-2fc4971ad332'),
(329, 28, 179, NULL, 339, 7, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '2b4acb3f-8151-4db8-8d49-ac4ae411f052'),
(330, 30, 342, NULL, 105, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'c54d409c-b6af-40bd-89b3-46dc174ab4a2'),
(331, 30, 342, NULL, 107, 2, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '58fbe8c1-4a25-4f74-acc9-b62b5bc8998f'),
(332, 30, 342, NULL, 109, 3, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '9d560c26-644d-421f-8a56-31497708c0ed'),
(333, 18, 343, NULL, 118, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '324d15f1-1ad1-43f9-ba01-7695668183dc'),
(334, 24, 344, NULL, 128, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'e570c23f-680d-4899-84c3-9d603bae5cdb'),
(335, 24, 344, NULL, 126, 2, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'ba81c4b6-e5be-494b-b73f-4c2475f4fb5a'),
(336, 24, 344, NULL, 124, 3, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '8caab3f4-5144-4979-8b4c-512bff4b8dbb'),
(337, 24, 344, NULL, 130, 4, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '0ede9b9c-be68-4793-aaf0-6d8fed4d62d6'),
(338, 28, 345, NULL, 174, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '25d5fc0e-4893-4f1b-beb4-04dde82feaf2'),
(339, 28, 345, NULL, 172, 2, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '9e1216cd-1c14-4870-8ed2-87d1272ac479'),
(340, 28, 345, NULL, 177, 3, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'aaed15c0-a534-4afa-8492-867da9fc5995'),
(341, 28, 345, NULL, 185, 4, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'a7914dc1-1414-41cc-8c95-1b61725951bc'),
(342, 28, 345, NULL, 192, 5, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '8c9a62d8-a68f-4899-b7fa-ab53beee607b'),
(343, 28, 345, NULL, 194, 6, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '567113d1-a62f-4654-bcba-1112bcb61650'),
(344, 28, 345, NULL, 339, 7, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '71b04e33-8642-45ba-99c1-53be696b0e71'),
(345, 48, 346, NULL, 143, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'af60b475-36d8-4cae-9b69-5114011d6e1f'),
(346, 41, 346, NULL, 210, 1, '2020-09-17 13:19:14', '2020-09-17 13:19:14', '7620c4e1-ccf1-4d26-a759-1a263c7c7b9c'),
(347, 41, 346, NULL, 212, 2, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'df2ce6cd-851b-4ade-aa5e-9e482e612e1b'),
(348, 41, 346, NULL, 208, 3, '2020-09-17 13:19:14', '2020-09-17 13:19:14', 'f2459870-f2cb-43ec-8908-22eb473e6091'),
(349, 9, 347, NULL, 39, 1, '2020-09-17 13:22:18', '2020-09-17 13:22:18', 'f1f07099-e0d9-4a51-9c60-5e93bb58c7b5'),
(350, 10, 347, NULL, 38, 1, '2020-09-17 13:22:18', '2020-09-17 13:22:18', '91159bf9-ea0d-4516-b9c7-d7337cf37942'),
(351, 8, 347, NULL, 2, 1, '2020-09-17 13:22:18', '2020-09-17 13:22:18', '4f7ff35f-e426-4207-ac5e-49155d0522d4');

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('124e42a1', '@lib/picturefill'),
('128c12c6', '@lib/jquery.payment'),
('15ea7e63', '@lib/jquery-touch-events'),
('1a55e944', '@lib/element-resize-detector'),
('1ceb62f0', '@lib/d3'),
('1f244a53', '@bower/jquery/dist'),
('244ab5cc', '@lib/velocity'),
('28a61f68', '@craft/web/assets/admintable/dist'),
('2a5b2bd4', '@craft/web/assets/routes/dist'),
('2a9dae7d', '@craft/web/assets/utilities/dist'),
('2b410ff4', '@craft/web/assets/editentry/dist'),
('2e46bb80', '@craft/web/assets/recententries/dist'),
('2f567576', '@lib/garnishjs'),
('30b4e1a6', '@lib/element-resize-detector'),
('34642308', '@craft/web/assets/deprecationerrors/dist'),
('35c542b1', '@bower/jquery/dist'),
('381df457', '@craft/web/assets/dashboard/dist'),
('386d1a24', '@lib/jquery.payment'),
('3893d6fc', '@craft/web/assets/fields/dist'),
('3a10a148', '@lib/fabric'),
('3bd1aa2d', '@craft/web/assets/updateswidget/dist'),
('4002268b', '@lib/jquery-ui'),
('41b0fd8d', '@craft/web/assets/matrix/dist'),
('46306f25', '@lib/selectize'),
('4726f177', '@craft/web/assets/dbbackup/dist'),
('4a4ebf6', '@craft/web/assets/fieldsettings/dist'),
('4c5c2baf', '@lib/xregexp'),
('4db1d67b', '@craft/web/assets/craftsupport/dist'),
('4ddfcd55', '@lib/vue'),
('53ce5783', '@lib/axios'),
('5b42c574', '@craft/web/assets/cp/dist'),
('5cac50f7', '@craft/web/assets/login/dist'),
('6057c48', '@lib/iframe-resizer'),
('673ec5b7', '@lib/vue'),
('695333f7', '@craft/web/assets/fields/dist'),
('69d94cd2', '@craft/web/assets/editsection/dist'),
('6ae32e69', '@lib/jquery-ui'),
('6bbfda7e', '@craft/web/assets/feed/dist'),
('761b2181', '@craft/web/assets/plugins/dist'),
('792f5f61', '@lib/axios'),
('795d321a', '@craft/redactor/assets/redactor/dist'),
('7b5d4b76', '@craft/web/assets/utilities/dist'),
('7e0ed119', '@focuslabllc/cheatsheet/assets/dist'),
('7e4befd8', '@craft/web/assets/craftsupport/dist'),
('843067c4', '@lib/d3'),
('847749e1', '@lib/garnishjs'),
('867f3188', '@craft/web/assets/sites/dist'),
('87c5483d', '@lib/iframe-resizer'),
('8a23a40f', '@craft/web/assets/editsection/dist'),
('8b66772a', '@lib/fileupload'),
('8f6b895b', '@lib/velocity'),
('91319ddf', '@lib/fabric'),
('915e03e2', '@craft/web/assets/feed/dist'),
('934c26b3', '@lib/jquery.payment'),
('938e76d4', '@lib/picturefill'),
('93b2ea6b', '@craft/web/assets/fields/dist'),
('942a4a16', '@lib/jquery-touch-events'),
('96ac409f', '@lib/prismjs'),
('98a7a3ab', '@craft/web/assets/utilities/dist'),
('9ee47e26', '@bower/jquery/dist'),
('a1877fc8', '@lib/fileupload'),
('a64d896b', '@craft/web/assets/login/dist'),
('aa6435f', '@lib/fileupload'),
('ad2440df', '@lib/iframe-resizer'),
('ae964103', '@lib/garnishjs'),
('b07d1a5c', '@craft/web/assets/admintable/dist'),
('b174d5d3', '@lib/element-resize-detector'),
('b23afdf6', '@craft/web/assets/updates/dist'),
('b7ca5e67', '@lib/d3'),
('b96f7e36', '@lib/picturefill'),
('bb512411', '@craft/web/assets/matrix/dist'),
('bbd0953d', '@lib/fabric'),
('bc4d487d', '@lib/prismjs'),
('be7cdf4', '@craft/web/assets/dashboard/dist'),
('becb42f4', '@lib/jquery-touch-events'),
('c1c212fe', '@lib/jquery-ui'),
('c399c040', '@craft/web/assets/cp/dist'),
('c7f05b50', '@lib/selectize'),
('c8bbe729', '@craft/web/assets/editentry/dist'),
('ca8ae1c', '@craft/web/assets/updater/dist'),
('ccc6b538', '@craft/web/assets/admintable/dist'),
('cd9c1fda', '@lib/xregexp'),
('d20e63f6', '@lib/axios'),
('d361fd9', '@craft/web/assets/matrixsettings/dist'),
('d79ecbd5', '@craft/web/assets/deprecationerrors/dist'),
('d82b42f0', '@craft/web/assets/updateswidget/dist'),
('e003f8df', '@craft/web/assets/pluginstore/dist'),
('e3fa18fd', '@craft/web/assets/updates/dist'),
('e4049374', '@craft/web/assets/installer/dist'),
('e691009e', '@craft/web/assets/recententries/dist'),
('e6fef1c2', '@lib/vue'),
('e77d1738', '@lib/xregexp'),
('eabbd2e', '@lib/velocity'),
('ec511983', '@craft/redactor/assets/field/dist'),
('ed1153b2', '@lib/selectize'),
('ef5246c1', '@craft/web/assets/updater/dist'),
('f063f9e3', '@craft/web/assets/cp/dist'),
('f26347af', '@lib/timepicker'),
('f7d7c645', '@craft/web/assets/matrixsettings/dist'),
('fa294568', '@craft/web/assets/generalsettings/dist'),
('fe45326a', '@craft/web/assets/fieldsettings/dist');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 11, 1, 1, NULL),
(2, 11, 1, 2, NULL),
(3, 11, 1, 3, NULL),
(4, 11, 1, 4, NULL),
(5, 11, 1, 5, NULL),
(6, 11, 1, 6, NULL),
(7, 11, 1, 7, NULL),
(8, 11, 1, 8, NULL),
(9, 11, 1, 9, NULL),
(10, 11, 1, 10, NULL),
(11, 11, 1, 11, NULL),
(12, 11, 1, 12, NULL),
(13, 70, 1, 1, NULL),
(14, 70, 1, 2, NULL),
(15, 74, 1, 1, NULL),
(16, 76, 1, 1, NULL),
(17, 78, 1, 1, NULL),
(18, 80, 1, 1, NULL),
(19, 70, 1, 3, NULL),
(20, 70, 1, 4, NULL),
(21, 91, 1, 1, NULL),
(22, 93, 1, 1, NULL),
(23, 95, 1, 1, NULL),
(24, 70, 1, 5, NULL),
(25, 70, 1, 6, NULL),
(26, 70, 1, 7, NULL),
(27, 105, 1, 1, NULL),
(28, 107, 1, 1, NULL),
(29, 109, 1, 1, NULL),
(30, 70, 1, 8, NULL),
(31, 11, 1, 13, NULL),
(32, 70, 1, 9, NULL),
(33, 124, 1, 1, NULL),
(34, 126, 1, 1, NULL),
(35, 128, 1, 1, NULL),
(36, 130, 1, 1, NULL),
(37, 70, 1, 10, NULL),
(38, 128, 1, 2, NULL),
(39, 70, 1, 11, NULL),
(40, 105, 1, 2, NULL),
(41, 107, 1, 2, NULL),
(42, 109, 1, 2, NULL),
(43, 107, 1, 3, NULL),
(44, 70, 1, 12, NULL),
(45, 70, 1, 13, NULL),
(46, 70, 1, 14, NULL),
(47, 70, 1, 15, NULL),
(48, 70, 1, 16, NULL),
(49, 172, 1, 1, NULL),
(50, 174, 1, 1, NULL),
(51, 174, 1, 2, NULL),
(52, 177, 1, 1, NULL),
(53, 70, 1, 17, NULL),
(54, 185, 1, 1, NULL),
(55, 70, 1, 18, NULL),
(56, 192, 1, 1, NULL),
(57, 194, 1, 1, NULL),
(58, 70, 1, 19, NULL),
(59, 70, 1, 20, NULL),
(60, 208, 1, 1, NULL),
(61, 210, 1, 1, NULL),
(62, 212, 1, 1, NULL),
(63, 70, 1, 21, NULL),
(64, 70, 1, 22, NULL),
(65, 234, 1, 1, NULL),
(66, 234, 1, 2, NULL),
(67, 246, 1, 1, NULL),
(68, 248, 1, 1, NULL),
(69, 234, 1, 3, NULL),
(70, 234, 1, 4, NULL),
(71, 234, 1, 5, NULL),
(72, 234, 1, 6, NULL),
(73, 234, 1, 7, NULL),
(74, 105, 1, 3, NULL),
(75, 70, 1, 23, NULL),
(76, 70, 1, 24, NULL),
(77, 234, 1, 8, NULL),
(78, 11, 1, 14, NULL),
(79, 11, 1, 15, NULL),
(80, 11, 1, 16, NULL),
(81, 11, 1, 17, NULL),
(82, 234, 1, 9, NULL),
(83, 334, 1, 1, NULL),
(84, 334, 1, 2, NULL),
(85, 334, 1, 3, NULL),
(86, 334, 1, 4, NULL),
(87, 339, 1, 1, NULL),
(88, 70, 1, 25, NULL),
(89, 11, 1, 18, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' lidija suprina7 gmail com '),
(1, 'slug', 0, 1, ''),
(3, 'slug', 0, 1, ''),
(4, 'slug', 0, 1, ''),
(5, 'slug', 0, 1, ''),
(6, 'slug', 0, 1, ''),
(2, 'title', 0, 1, ' header topics '),
(8, 'slug', 0, 1, ''),
(9, 'slug', 0, 1, ''),
(10, 'slug', 0, 1, ''),
(7, 'slug', 0, 1, ' about rm schools '),
(7, 'title', 0, 1, ' about rm schools '),
(11, 'slug', 0, 1, ' navbar '),
(11, 'title', 0, 1, ' navigation bar '),
(14, 'slug', 0, 1, ''),
(15, 'slug', 0, 1, ''),
(16, 'slug', 0, 1, ''),
(17, 'slug', 0, 1, ''),
(38, 'filename', 0, 1, ' eutext png '),
(38, 'extension', 0, 1, ' png '),
(38, 'kind', 0, 1, ' image '),
(38, 'slug', 0, 1, ''),
(38, 'title', 0, 1, ' eutext '),
(39, 'filename', 0, 1, ' logo png '),
(39, 'extension', 0, 1, ' png '),
(39, 'kind', 0, 1, ' image '),
(39, 'slug', 0, 1, ''),
(39, 'title', 0, 1, ' logo '),
(70, 'slug', 0, 1, ' homepage '),
(72, 'slug', 0, 1, ''),
(70, 'title', 0, 1, ' homepage '),
(74, 'slug', 0, 1, ' dfcsd '),
(74, 'title', 0, 1, ' dfcsd '),
(76, 'slug', 0, 1, ' vsd '),
(76, 'title', 0, 1, ' vsd '),
(78, 'slug', 0, 1, ' vdf '),
(78, 'title', 0, 1, ' vdf '),
(80, 'slug', 0, 1, ' fdgf '),
(80, 'title', 0, 1, ' fdgf '),
(82, 'slug', 0, 1, ''),
(85, 'slug', 0, 1, ''),
(86, 'slug', 0, 1, ''),
(91, 'slug', 0, 1, ' rawmatters ambassadors at schools1 '),
(91, 'title', 0, 1, ' rawmatters ambassadors at schools1 '),
(93, 'slug', 0, 1, ' rawmatters ambassadors at schools 2 '),
(93, 'title', 0, 1, ' rawmatters ambassadors at schools 2 '),
(95, 'slug', 0, 1, ' rawmatters ambassadors at schools 3 '),
(95, 'title', 0, 1, ' rawmatters ambassadors at schools 3 '),
(101, 'slug', 0, 1, ''),
(105, 'title', 0, 1, ' rawmatters ambassadors at schools 1 '),
(107, 'title', 0, 1, ' rawmatters ambassadors at schools 2 '),
(109, 'title', 0, 1, ' rawmatters ambassadors at schools 3 '),
(109, 'slug', 0, 1, ' rawmatters ambassadors at schools 3 '),
(118, 'kind', 0, 1, ' image '),
(118, 'extension', 0, 1, ' jpg '),
(118, 'filename', 0, 1, ' lab jpg '),
(118, 'slug', 0, 1, ''),
(118, 'title', 0, 1, ' lab '),
(119, 'slug', 0, 1, ''),
(123, 'filename', 0, 1, ' poster sic challenge rm pdf '),
(123, 'extension', 0, 1, ' pdf '),
(123, 'kind', 0, 1, ' pdf '),
(123, 'slug', 0, 1, ''),
(123, 'title', 0, 1, ' poster si c challenge rm '),
(124, 'slug', 0, 1, ' actions in eu '),
(124, 'title', 0, 1, ' actions in eu '),
(126, 'slug', 0, 1, ' study visits in companies '),
(126, 'title', 0, 1, ' study visits in companies '),
(128, 'title', 0, 1, ' topic 3 '),
(128, 'slug', 0, 1, ' poster presentation '),
(130, 'slug', 0, 1, ' topic 4 '),
(130, 'title', 0, 1, ' topic 4 '),
(132, 'slug', 0, 1, ''),
(142, 'filename', 0, 1, ' nature5 jpg '),
(142, 'extension', 0, 1, ' jpg '),
(142, 'kind', 0, 1, ' image '),
(142, 'slug', 0, 1, ''),
(142, 'title', 0, 1, ' nature5 '),
(143, 'kind', 0, 1, ' image '),
(143, 'extension', 0, 1, ' jpg '),
(143, 'filename', 0, 1, ' img 115 jpg '),
(144, 'filename', 0, 1, ' nature1 jpg '),
(144, 'extension', 0, 1, ' jpg '),
(144, 'kind', 0, 1, ' image '),
(144, 'slug', 0, 1, ''),
(144, 'title', 0, 1, ' nature1 '),
(143, 'slug', 0, 1, ''),
(143, 'title', 0, 1, ' nature3 '),
(105, 'slug', 0, 1, ' rawmatters ambassadors at schools 1 '),
(107, 'slug', 0, 1, ' rawmatters ambassadors at schools 2 '),
(157, 'slug', 0, 1, ''),
(172, 'slug', 0, 1, ' the future of education '),
(172, 'title', 0, 1, ' the future of education '),
(174, 'title', 0, 1, ' raw materials and sustainability '),
(174, 'slug', 0, 1, ' raw materials and sustainability '),
(177, 'slug', 0, 1, ' all in music '),
(177, 'title', 0, 1, ' all in music '),
(179, 'slug', 0, 1, ''),
(185, 'slug', 0, 1, ' new event '),
(185, 'title', 0, 1, ' new event '),
(192, 'slug', 0, 1, ' newer event '),
(192, 'title', 0, 1, ' newer event '),
(194, 'slug', 0, 1, ' next year '),
(194, 'title', 0, 1, ' next year '),
(201, 'slug', 0, 1, ''),
(208, 'slug', 0, 1, ' ita lorem ipsum dolor sit amet consectetur adipisicing elit '),
(208, 'title', 0, 1, ' ita lorem ipsum dolor sit amet consectetur adipisicing elit '),
(210, 'slug', 0, 1, ' rm schools lorem ipsum dolor sit amet consectetur adipisicing elit '),
(210, 'title', 0, 1, ' rm schools lorem ipsum dolor sit amet consectetur adipisicing elit '),
(212, 'slug', 0, 1, ' unde voluptates lorem ipsum dolor sit amet consectetur adipisicing elit '),
(212, 'title', 0, 1, ' unde voluptates lorem ipsum dolor sit amet consectetur adipisicing elit '),
(227, 'slug', 0, 1, ''),
(228, 'slug', 0, 1, ''),
(229, 'slug', 0, 1, ''),
(230, 'slug', 0, 1, ''),
(226, 'slug', 0, 1, ' learning pathways '),
(226, 'title', 0, 1, ' learning pathways '),
(232, 'slug', 0, 1, ''),
(233, 'slug', 0, 1, ''),
(231, 'slug', 0, 1, ' documents '),
(231, 'title', 0, 1, ' documents '),
(234, 'title', 0, 1, ' footer '),
(237, 'slug', 0, 1, ''),
(238, 'slug', 0, 1, ''),
(239, 'slug', 0, 1, ''),
(236, 'title', 0, 1, ' about rm schools '),
(236, 'slug', 0, 1, ' about rm schools '),
(241, 'slug', 0, 1, ''),
(242, 'slug', 0, 1, ''),
(243, 'slug', 0, 1, ''),
(244, 'slug', 0, 1, ''),
(240, 'slug', 0, 1, ' learning pathways '),
(240, 'title', 0, 1, ' learning pathways '),
(234, 'slug', 0, 1, ' footer '),
(246, 'slug', 0, 1, ' privacy policy '),
(246, 'title', 0, 1, ' privacy policy '),
(248, 'slug', 0, 1, ' terms conditions '),
(248, 'title', 0, 1, ' terms conditions '),
(250, 'slug', 0, 1, ''),
(251, 'slug', 0, 1, ''),
(252, 'slug', 0, 1, ''),
(253, 'slug', 0, 1, ''),
(274, 'slug', 0, 1, ''),
(275, 'slug', 0, 1, ''),
(276, 'slug', 0, 1, ''),
(2, 'slug', 0, 1, ' header topics '),
(334, 'title', 0, 1, ' about us '),
(334, 'slug', 0, 1, ' about us '),
(339, 'slug', 0, 1, ' something '),
(339, 'title', 0, 1, ' something ');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Navbar', 'navbar', 'single', 1, 'all', NULL, '2020-09-14 12:18:08', '2020-09-14 12:18:15', NULL, '57d4f7a3-5e87-4d16-aed6-a1e1e2c995b1'),
(2, NULL, 'Homepage', 'homepage', 'single', 1, 'all', NULL, '2020-09-14 13:11:26', '2020-09-14 13:11:26', NULL, '87a3d3d6-7170-474f-b761-21ff0fbcd43e'),
(3, NULL, 'Students in action', 'studentsInAction', 'channel', 1, 'all', NULL, '2020-09-14 13:26:30', '2020-09-14 13:26:30', NULL, '7d39eb22-1737-4478-9f1d-2a40252eb160'),
(4, NULL, 'Event', 'event', 'channel', 1, 'all', NULL, '2020-09-14 13:43:32', '2020-09-14 13:43:32', NULL, 'c7fec439-ba6f-4143-9a75-eac421fb0280'),
(5, NULL, 'Slider', 'slider', 'channel', 1, 'all', NULL, '2020-09-14 14:36:16', '2020-09-14 14:36:16', '2020-09-15 07:19:49', 'edbd368e-0018-467f-811a-4e897bce277b'),
(6, NULL, 'Hero', 'hero', 'channel', 1, 'all', NULL, '2020-09-15 08:06:49', '2020-09-15 08:06:49', NULL, 'ef251137-89c9-4576-aa61-14697e629903'),
(7, NULL, 'Youtube videos', 'youtube', 'channel', 1, 'all', NULL, '2020-09-16 13:03:46', '2020-09-17 13:26:20', NULL, '093c3fe9-83bd-41d7-a933-c3e656f3574c'),
(8, NULL, 'Footer', 'footer', 'single', 1, 'all', NULL, '2020-09-16 13:19:20', '2020-09-16 13:19:20', NULL, 'f3802f9e-1863-4142-bed5-62a1dd9f0e7a'),
(9, NULL, 'Documents', 'documents', 'channel', 1, 'all', NULL, '2020-09-16 13:27:54', '2020-09-16 13:28:55', NULL, '4536c42b-f61b-49b7-a666-1bdbdf3d3bb8'),
(10, NULL, 'About us', 'aboutUs', 'single', 1, 'all', NULL, '2020-09-17 12:57:46', '2020-09-17 12:57:46', NULL, '98a22aa3-561d-407e-b1ad-5bba63d6eb71'),
(11, NULL, 'Cards', 'cards', 'channel', 1, 'all', NULL, '2020-09-17 13:04:36', '2020-09-17 13:04:36', NULL, 'ddaf32a5-8670-415d-8b4c-8118092a7fd4');

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 0, NULL, NULL, 1, '2020-09-14 12:18:08', '2020-09-14 12:18:15', '2b5c22b5-40bb-4a25-b13f-6bd89ebce53e'),
(2, 2, 1, 1, '__home__', 'index', 1, '2020-09-14 13:11:26', '2020-09-15 13:44:55', 'c9ae4c9e-b1f3-47cc-adcd-45adb299edae'),
(3, 3, 1, 1, 'students-in-action/{slug}', NULL, 1, '2020-09-14 13:26:30', '2020-09-14 13:26:30', '423cb60f-d6aa-4ff4-9dc7-8d36cd6da216'),
(4, 4, 1, 1, 'event/{slug}', NULL, 1, '2020-09-14 13:43:32', '2020-09-14 13:43:32', '3c073ae7-28e7-40b5-8fc7-cb37fe1de275'),
(5, 5, 1, 1, 'slider/{slug}', 'segment\\heroRotator', 1, '2020-09-14 14:36:16', '2020-09-14 14:50:00', 'c1b63b25-1627-415b-8fba-0824b918003d'),
(6, 6, 1, 1, 'hero/{slug}', 'segment\\heroRotator', 1, '2020-09-15 08:06:49', '2020-09-15 08:06:49', '9594ab45-f5aa-44ea-8f53-d2c00d0bf3a8'),
(7, 7, 1, 1, 'youtube/{slug}', NULL, 1, '2020-09-16 13:03:46', '2020-09-16 13:03:46', 'd7376dee-2c8b-4b98-a4c3-5c9ea33c5fcf'),
(8, 8, 1, 1, 'footer', 'common\\footer', 1, '2020-09-16 13:19:20', '2020-09-16 13:19:20', 'dbdb16f1-50c5-49ab-9e03-b795287253b3'),
(9, 9, 1, 1, 'document/{slug}', NULL, 1, '2020-09-16 13:27:54', '2020-09-16 13:27:54', '68b8f8b9-3d58-4922-8baa-018f1fccc312'),
(10, 10, 1, 1, 'about-us', 'page\\aboutUs', 1, '2020-09-17 12:57:46', '2020-09-17 12:57:46', '2d1ebaa0-89f7-4a68-98ee-1970192ebd6b'),
(11, 11, 1, 1, 'cards/{slug}', NULL, 1, '2020-09-17 13:04:36', '2020-09-17 13:04:36', 'ea7d2734-a516-4f4c-a0ed-1a566c0feb21');

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, 'FqZR51Xn7EGrgSXb85xIeHgBFiF97HEwWKvj2Ja4FgbKBX_dd2IvmfZtet3J-N3qim_FAnc0Uiq2qAiZVAMSqlVe4SxgDAvaoLPJ', '2020-09-14 11:28:25', '2020-09-14 14:56:24', '6a73a477-2de1-462a-87c5-45304a710256'),
(4, 1, 'RIiwoFESEEt0KY5EjsvVmsl1FPiD1UPGWv2I7jvt4PN335vPYcjQVERG3_NXmSpyBk-0GXRWNZtQB490_brxwwRANnZq37saLXZa', '2020-09-15 12:03:37', '2020-09-15 14:53:20', 'a3b91897-fa98-454d-89ab-1e2ff194b80e'),
(6, 1, 'JqhhqTFzGh3cbfnN92viN_tESFjNhtu3iEw6zdoD12rCRFgj5_OuOMFituN86QYFqvelAd8Vk6ZAIVA-HMN7YhgE31rW5xaYHYnx', '2020-09-16 12:45:25', '2020-09-16 14:53:40', '8edbc5c1-9ec9-4a0b-aa28-631e553e1a73'),
(8, 1, 'Nbku7irsXxmQxE0plnPmsBWxMqL3Zj_I7CsB6Ic2WCVfp-8i_n3tJqY9h494SGMoAWd1KrhyJi9_otiVH3JO4Uv3OhD0X9ILT7Sq', '2020-09-17 11:43:25', '2020-09-17 14:42:44', 'efab6880-5d61-4872-aa58-c86b2ccacbaf');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'school.test', '2020-09-14 08:05:25', '2020-09-14 08:05:25', NULL, '480f9f7d-c34e-444c-b22c-bd1c36409438');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'school.test', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2020-09-14 08:05:25', '2020-09-14 08:05:25', NULL, '0967bde6-f091-4666-b685-45e13bb32dee');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `structureelements`
--

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 4, 0, '2020-09-14 09:33:04', '2020-09-16 13:35:04', '7a4a8f3e-0d9f-4afb-92f3-0766171d6b2c'),
(2, 1, 2, 1, 2, 3, 1, '2020-09-14 09:33:04', '2020-09-14 09:33:04', '41e4d482-3b43-4c3a-b2bf-1f1065b933f9'),
(6, 2, NULL, 6, 1, 6, 0, '2020-09-16 13:24:44', '2020-09-16 13:26:32', 'eedbf06d-69a1-4b3a-9ddb-c6d8de7f564c'),
(7, 2, 236, 6, 2, 3, 1, '2020-09-16 13:24:44', '2020-09-16 13:24:44', '1b06f5cb-995a-4c4b-916d-1248173e9bb5'),
(8, 2, 240, 6, 4, 5, 1, '2020-09-16 13:26:32', '2020-09-16 13:26:32', '211ca1e7-b25f-4c73-91d8-33e20caedced');

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `structures`
--

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, '2020-09-14 09:29:04', '2020-09-14 09:29:04', NULL, 'a1952835-40ac-4add-b52d-778f936f3148'),
(2, NULL, '2020-09-16 13:23:33', '2020-09-16 13:23:33', NULL, 'e820c7a4-c32a-49ca-9310-2e830aa03867');

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'lidija.suprina7@gmail.com', '$2y$13$a000sQgYXY89LQXolixsfusFGBRJORd2QmNyquF0irGReYgwDJLaq', 1, 0, 0, 0, '2020-09-17 11:43:26', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2020-09-14 08:05:25', '2020-09-14 08:05:25', '2020-09-17 11:43:26', 'a2bde6d1-07b4-463f-8fca-fa00a1f839fe');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Images', '', '2020-09-14 09:02:37', '2020-09-14 09:02:37', 'c42bac58-9890-4e8f-b2bc-a7b63f952099'),
(2, NULL, NULL, 'Temporary source', NULL, '2020-09-14 09:03:43', '2020-09-14 09:03:43', 'b7df82bd-9060-4f8f-8d41-f43a1f10f020'),
(3, 2, NULL, 'user_1', 'user_1/', '2020-09-14 09:03:43', '2020-09-14 09:03:43', 'b411113f-7f30-4142-8ec2-f96fa023fa85'),
(4, NULL, 2, 'Pdf files', '', '2020-09-14 13:36:03', '2020-09-14 13:36:03', 'a709c612-640b-4ab9-a59c-c6999ae0838c');

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 'Images', 'images', 'craft\\volumes\\Local', 1, '@web/assets/images', '{\"path\":\"assets/images\"}', 1, '2020-09-14 09:02:37', '2020-09-14 09:02:37', NULL, 'defb4ea0-0a2e-48ca-8cd4-2703b95c7f2d'),
(2, 10, 'Pdf files', 'pdfFiles', 'craft\\volumes\\Local', 1, '@web/assets/presentations', '{\"path\":\"assets/presentations\"}', 2, '2020-09-14 13:36:03', '2020-09-14 13:36:03', NULL, '6175f870-5bd3-44ef-a8b4-7066f710a2a3');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2020-09-14 08:07:24', '2020-09-14 08:07:24', 'f5fd40f2-b756-425b-9964-812529911a67'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2020-09-14 08:07:24', '2020-09-14 08:07:24', 'b78fec8e-d268-42a3-9e34-d5e3bc04e486'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2020-09-14 08:07:24', '2020-09-14 08:07:24', 'eae81562-41a9-4694-8139-4bd93f1065be'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2020-09-14 08:07:24', '2020-09-14 08:07:24', '43416c46-c43b-4bcc-a1ff-a12ce6be335f');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  ADD KEY `assets_folderId_idx` (`folderId`),
  ADD KEY `assets_volumeId_idx` (`volumeId`),
  ADD KEY `assets_uploaderId_fk` (`uploaderId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransforms_name_idx` (`name`),
  ADD KEY `assettransforms_handle_idx` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_groupId_idx` (`groupId`),
  ADD KEY `categories_parentId_fk` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorygroups_name_idx` (`name`),
  ADD KEY `categorygroups_handle_idx` (`handle`),
  ADD KEY `categorygroups_structureId_idx` (`structureId`),
  ADD KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `changedattributes_siteId_fk` (`siteId`),
  ADD KEY `changedattributes_userId_fk` (`userId`);

--
-- Indexes for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `changedfields_siteId_fk` (`siteId`),
  ADD KEY `changedfields_fieldId_fk` (`fieldId`),
  ADD KEY `changedfields_userId_fk` (`userId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `content_siteId_idx` (`siteId`),
  ADD KEY `content_title_idx` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drafts_creatorId_fk` (`creatorId`),
  ADD KEY `drafts_sourceId_fk` (`sourceId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `elements_type_idx` (`type`),
  ADD KEY `elements_enabled_idx` (`enabled`),
  ADD KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  ADD KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  ADD KEY `elements_draftId_fk` (`draftId`),
  ADD KEY `elements_revisionId_fk` (`revisionId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `elements_sites_siteId_idx` (`siteId`),
  ADD KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `elements_sites_enabled_idx` (`enabled`),
  ADD KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_postDate_idx` (`postDate`),
  ADD KEY `entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `entries_authorId_idx` (`authorId`),
  ADD KEY `entries_sectionId_idx` (`sectionId`),
  ADD KEY `entries_typeId_idx` (`typeId`),
  ADD KEY `entries_parentId_fk` (`parentId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldgroups_name_idx` (`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_handle_context_idx` (`handle`,`context`),
  ADD KEY `fields_groupId_idx` (`groupId`),
  ADD KEY `fields_context_idx` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `globalsets_name_idx` (`name`),
  ADD KEY `globalsets_handle_idx` (`handle`),
  ADD KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  ADD UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  ADD KEY `gqltokens_schemaId_fk` (`schemaId`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `matrixblocks_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocktypes_name_fieldId_idx` (`name`,`fieldId`),
  ADD KEY `matrixblocktypes_handle_fieldId_idx` (`handle`,`fieldId`),
  ADD KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `matrixcontent_aboutpageblocks`
--
ALTER TABLE `matrixcontent_aboutpageblocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_aboutpageblocks_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_aboutpageblocks_siteId_fk` (`siteId`);

--
-- Indexes for table `matrixcontent_homepageblocks`
--
ALTER TABLE `matrixcontent_homepageblocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_homepageblocks_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_homepageblocks_siteId_fk` (`siteId`);

--
-- Indexes for table `matrixcontent_sharepage`
--
ALTER TABLE `matrixcontent_sharepage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_sharepage_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_sharepage_siteId_fk` (`siteId`);

--
-- Indexes for table `matrixcontent_socialnetworks`
--
ALTER TABLE `matrixcontent_socialnetworks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_socialnetworks_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_socialnetworks_siteId_fk` (`siteId`);

--
-- Indexes for table `matrixcontent_topic`
--
ALTER TABLE `matrixcontent_topic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_topic_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_topic_siteId_fk` (`siteId`);

--
-- Indexes for table `matrixcontent_video`
--
ALTER TABLE `matrixcontent_video`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_video_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_video_siteId_fk` (`siteId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `migrations_track_name_unq_idx` (`track`,`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugins_handle_unq_idx` (`handle`);

--
-- Indexes for table `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `relations_sourceId_idx` (`sourceId`),
  ADD KEY `relations_targetId_idx` (`targetId`),
  ADD KEY `relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  ADD KEY `revisions_creatorId_fk` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_handle_idx` (`handle`),
  ADD KEY `sections_name_idx` (`name`),
  ADD KEY `sections_structureId_idx` (`structureId`),
  ADD KEY `sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_uid_idx` (`uid`),
  ADD KEY `sessions_token_idx` (`token`),
  ADD KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `sessions_userId_idx` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sitegroups_name_idx` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `sites_handle_idx` (`handle`),
  ADD KEY `sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `sites_groupId_fk` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `structureelements_root_idx` (`root`),
  ADD KEY `structureelements_lft_idx` (`lft`),
  ADD KEY `structureelements_rgt_idx` (`rgt`),
  ADD KEY `structureelements_level_idx` (`level`),
  ADD KEY `structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `systemmessages_language_idx` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taggroups_name_idx` (`name`),
  ADD KEY `taggroups_handle_idx` (`handle`),
  ADD KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_groupId_idx` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unq_idx` (`token`),
  ADD KEY `tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usergroups_handle_idx` (`handle`),
  ADD KEY `usergroups_name_idx` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_uid_idx` (`uid`),
  ADD KEY `users_verificationCode_idx` (`verificationCode`),
  ADD KEY `users_email_idx` (`email`),
  ADD KEY `users_username_idx` (`username`),
  ADD KEY `users_photoId_fk` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `volumefolders_parentId_idx` (`parentId`),
  ADD KEY `volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volumes_name_idx` (`name`),
  ADD KEY `volumes_handle_idx` (`handle`),
  ADD KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `matrixcontent_aboutpageblocks`
--
ALTER TABLE `matrixcontent_aboutpageblocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matrixcontent_homepageblocks`
--
ALTER TABLE `matrixcontent_homepageblocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `matrixcontent_sharepage`
--
ALTER TABLE `matrixcontent_sharepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `matrixcontent_socialnetworks`
--
ALTER TABLE `matrixcontent_socialnetworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `matrixcontent_topic`
--
ALTER TABLE `matrixcontent_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `matrixcontent_video`
--
ALTER TABLE `matrixcontent_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixcontent_aboutpageblocks`
--
ALTER TABLE `matrixcontent_aboutpageblocks`
  ADD CONSTRAINT `matrixcontent_aboutpageblocks_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_aboutpageblocks_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_homepageblocks`
--
ALTER TABLE `matrixcontent_homepageblocks`
  ADD CONSTRAINT `matrixcontent_homepageblocks_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_homepageblocks_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_sharepage`
--
ALTER TABLE `matrixcontent_sharepage`
  ADD CONSTRAINT `matrixcontent_sharepage_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_sharepage_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_socialnetworks`
--
ALTER TABLE `matrixcontent_socialnetworks`
  ADD CONSTRAINT `matrixcontent_socialnetworks_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_socialnetworks_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_topic`
--
ALTER TABLE `matrixcontent_topic`
  ADD CONSTRAINT `matrixcontent_topic_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_topic_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_video`
--
ALTER TABLE `matrixcontent_video`
  ADD CONSTRAINT `matrixcontent_video_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_video_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
