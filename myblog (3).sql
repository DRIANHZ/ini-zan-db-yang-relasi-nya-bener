-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 24, 2023 at 05:27 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(2) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'story'),
(2, 'food'),
(3, 'travel'),
(4, 'school'),
(6, 'dumb'),
(7, 'skincare');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(36) NOT NULL,
  `post_id` int(36) NOT NULL,
  `user_id` int(20) NOT NULL,
  `content` text NOT NULL,
  `created_at` date NOT NULL,
  `update_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(20) NOT NULL,
  `category_id` int(2) NOT NULL,
  `image_url` text NOT NULL,
  `created_at` date NOT NULL,
  `update_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `title`, `content`, `user_id`, `category_id`, `image_url`, `created_at`, `update_at`) VALUES
(1, 'kota bali coeeeee', 'kali ini saya akan membagikan tentang keindahan pulau bali', 552978239, 3, 'img1.jpeg', '2023-10-18', '2023-10-18'),
(93293535, 'cccc', 'ccccccccc', 552978239, 1, 'ccccccc', '2023-10-23', '2023-10-23'),
(138664022, 'rrr', 'bbbb', 653210426, 1, 'bbbbb', '2023-10-23', '2023-10-23'),
(211522534, 'fauzan mandi di cikampek', 'ini content', 552978239, 1, 'ini image', '2023-10-23', '2023-10-23'),
(219067578, 'maman anjayy', 'wkwwkkwwkwkwkw', 366019897, 1, 'gada', '2023-10-24', '2023-10-24'),
(248512877, 'jaru makan warmindo', 'jaru makan warmindo di sawah', 653210426, 3, 'ini image', '2023-10-23', '2023-10-23'),
(903356428, 'maman post lagi', 'maman postt contenttttt', 366019897, 1, 'ini image', '2023-10-24', '2023-10-24'),
(935852571, 'ini maman', 'ini content', 366019897, 1, 'ini image', '2023-10-24', '2023-10-24'),
(1881690538, 'ini title maman', 'ini content maman', 366019897, 1, 'ini image', '2023-10-24', '2023-10-24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(20) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `isAktif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `isAktif`) VALUES
(123456789, 'ADMIN', 'ryanhzashari13@gmail.com', 'ADMIN', 'admin', 1),
(366019897, 'maman', 'maman@yahoo.com', 'maman', 'member', 1),
(552978239, 'sasa', 'sasa@gmail.com', 'sasa', 'member', 1),
(653210426, 'caca', 'cacantik@gmail.com', 'caca', 'member', 1),
(704095068, 'zaza', 'zaza@gmail.com', 'zaza', 'member', 1),
(1425362036, 'kaka', 'paulscholes1512@gmail.com', 'kaka', 'member', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD UNIQUE KEY `post_id` (`post_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id_2` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `password` (`password`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
