-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 26, 2018 at 08:04 AM
-- Server version: 5.7.23-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ang`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Final test', 'dfgfdg', 'fdgf', '2018-09-25 14:55:36', '2018-09-11 00:00:00', NULL, NULL),
(2, 'jhjkhk', 'ghgdsh\r\nghsdfhdshg', 'discover-collaborate-deploy_20180530115202.jpg', '2018-09-29 18:37:45', NULL, NULL, NULL),
(3, 'kjkjkj', 'nmbjjkhkjh', 'discover-collaborate-deploy_20180530115202.jpg', '2018-09-29 18:40:23', NULL, NULL, NULL),
(4, 'jhjkhk', 'kfdhhsgdfhsg', '_home_kiran_Downloads_app_index.html(iPhone 5_SE).', '2018-09-29 18:44:33', NULL, NULL, NULL),
(5, 'jhjkhk', 'hlklkjkj', '_home_kiran_Downloads_app_index.html(iPhone 5_SE).', '2018-09-29 18:45:44', NULL, NULL, NULL),
(6, 'jhjkhk', 'ghgdhg', '/tmp/phpAmN4GW', '2018-09-29 22:27:33', NULL, NULL, NULL),
(7, 'jhjkhk', 'klgdjfsklgfdg\r\nfdsgfdsg', NULL, '2018-09-11 00:00:00', '2018-09-29 23:05:34', NULL, NULL),
(9, 'jhjkhk', 'fgdsgdf\r\ngdfgdfgf<dsg', '/tmp/phpD1rR2j', '2018-09-29 22:47:13', NULL, NULL, NULL),
(10, 'jhjkhk', 'hgfh\r\ngsdhgdh', NULL, '2018-09-29 22:56:24', NULL, 23, NULL),
(11, 'jhjkhk', 'ghsd\r\ngfgdf', NULL, '2018-09-29 22:56:46', NULL, 23, NULL),
(12, 'jhjkhk', 'dfsfgdf', 'main-qimg-0a3ac7a36de0b9dd7898e8a768aba79f-c_(1)_20180929053610.jpeg', '2018-09-29 22:57:29', '2018-09-29 23:06:10', 23, 23),
(13, 'M e', NULL, '', '2018-09-30 11:53:23', NULL, 23, NULL),
(14, 'M e', NULL, '', '2018-09-30 11:53:57', NULL, 23, NULL),
(15, 'New Event', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'download_20180930025058.png', '2018-09-30 20:20:58', '2018-10-07 17:16:41', 23, 23),
(16, 'Event 30', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'new_statesman_events_20181001053844.jpg', '2018-10-01 23:08:44', '2018-10-07 16:06:17', 23, 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
