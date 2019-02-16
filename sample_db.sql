-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2019 at 07:30 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sample_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `city_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`state_id`, `city_id`, `city_name`) VALUES
(1, 1, 'kochi'),
(1, 2, 'trivendrum'),
(1, 3, 'kotaim'),
(1, 4, 'munnur'),
(2, 5, 'chennai'),
(2, 6, 'madurai'),
(2, 7, 'vellore'),
(2, 8, 'salem'),
(3, 9, 'vijayavada'),
(3, 10, 'guntur'),
(3, 11, 'vizag'),
(3, 12, 'kakinada'),
(4, 13, 'Hyderabad'),
(4, 14, 'nalgonda'),
(4, 15, 'khammam'),
(4, 16, 'warangal');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment_text` varchar(5526) NOT NULL,
  `date_posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `post_id`, `comment_text`, `date_posted`) VALUES
(2, 2, 4, ' 2nd comment', '2019-02-05 07:44:08'),
(3, 2, 4, ' 3rd comment', '2019-02-05 07:44:46'),
(4, 2, 7, ' 6st comment', '2019-02-05 07:53:38'),
(5, 2, 4, ' 4th comment', '2019-02-05 08:01:48'),
(6, 2, 5, ' Hi there ', '2019-02-05 08:02:16'),
(7, 2, 5, ' null', '2019-02-05 08:02:51'),
(8, 2, 7, ' null', '2019-02-05 08:50:02'),
(9, 2, 10, ' 7th comment', '2019-02-05 09:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_name` varchar(256) NOT NULL,
  `mimetype` varchar(256) NOT NULL,
  `size` varchar(11) NOT NULL,
  `saved_name` varchar(10000) NOT NULL,
  `file_path` varchar(50000) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`file_id`, `post_id`, `user_id`, `file_name`, `mimetype`, `size`, `saved_name`, `file_path`, `created`) VALUES
(1, 1, 1, '01-DARPA ROBO-FLY.png', 'image/png', '958072', '1548049851740_01-DARPA ROBO-FLY.png', 'uploads1548049851740_01-DARPA ROBO-FLY.png', '2019-01-21 05:50:52'),
(2, 1, 1, '1.jpg', 'image/jpeg', '2597735', '1548049851764_1.jpg', 'uploads1548049851764_1.jpg', '2019-01-21 05:50:52'),
(3, 1, 1, 'avengers-age-of-ultron.jpg', 'image/jpeg', '2199504', '1548049851787_avengers-age-of-ultron.jpg', 'uploads1548049851787_avengers-age-of-ultron.jpg', '2019-01-21 05:50:52'),
(4, 2, 1, 'Iron-Man-2.png', 'image/png', '5463703', '1548049875850_Iron-Man-2.png', 'uploads1548049875850_Iron-Man-2.png', '2019-01-21 05:51:16'),
(5, 2, 1, 'iron-man-3.jpg', 'image/jpeg', '1313388', '1548049876020_iron-man-3.jpg', 'uploads1548049876020_iron-man-3.jpg', '2019-01-21 05:51:16'),
(6, 2, 1, 'iron-man-suit-1920x1080.jpg', 'image/jpeg', '433049', '1548049876041_iron-man-suit-1920x1080.jpg', 'uploads1548049876041_iron-man-suit-1920x1080.jpg', '2019-01-21 05:51:16'),
(7, 3, 1, '01.jpg', 'image/jpeg', '1247604', '1548416435981_01.jpg', 'uploads1548416435981_01.jpg', '2019-01-25 11:40:44'),
(8, 3, 1, '004.jpg', 'image/jpeg', '1791240', '1548416438522_004.jpg', 'uploads1548416438522_004.jpg', '2019-01-25 11:40:44'),
(9, 4, 2, 'spider-man-1920x1080.jpg', 'image/jpeg', '608153', '1548678649621_spider-man-1920x1080.jpg', 'uploads1548678649621_spider-man-1920x1080.jpg', '2019-01-28 12:30:49'),
(10, 4, 2, 'tangled_disney_pascal-wallpaper-1366x768.jpg', 'image/jpeg', '157896', '1548678649657_tangled_disney_pascal-wallpaper-1366x768.jpg', 'uploads1548678649657_tangled_disney_pascal-wallpaper-1366x768.jpg', '2019-01-28 12:30:49'),
(11, 5, 2, 'neon_iron_man_4k.jpg', 'image/jpeg', '7702547', '1548678680117_neon_iron_man_4k.jpg', 'uploads1548678680117_neon_iron_man_4k.jpg', '2019-01-28 12:31:20'),
(12, 5, 2, 'rocket_raccoon_2014-wallpaper-1366x768.jpg', 'image/jpeg', '363676', '1548678680351_rocket_raccoon_2014-wallpaper-1366x768.jpg', 'uploads1548678680351_rocket_raccoon_2014-wallpaper-1366x768.jpg', '2019-01-28 12:31:20'),
(13, 5, 2, 'wall_e_in_the_city-wallpaper-1366x768.jpg', 'image/jpeg', '273488', '1548678680377_wall_e_in_the_city-wallpaper-1366x768.jpg', 'uploads1548678680377_wall_e_in_the_city-wallpaper-1366x768.jpg', '2019-01-28 12:31:20'),
(14, 6, 2, 'tangled_disney_pascal-wallpaper-1366x768.jpg', 'image/jpeg', '157896', '1548678735213_tangled_disney_pascal-wallpaper-1366x768.jpg', 'uploads1548678735213_tangled_disney_pascal-wallpaper-1366x768.jpg', '2019-01-28 12:32:15'),
(15, 6, 2, 'the_croods_characters-wallpaper-1366x768.jpg', 'image/jpeg', '560629', '1548678735219_the_croods_characters-wallpaper-1366x768.jpg', 'uploads1548678735219_the_croods_characters-wallpaper-1366x768.jpg', '2019-01-28 12:32:15'),
(16, 7, 2, 'trees-3840x2501-light-green-4k-19568.jpg', 'image/jpeg', '2043384', '1548745837390_trees-3840x2501-light-green-4k-19568.jpg', 'uploads1548745837390_trees-3840x2501-light-green-4k-19568.jpg', '2019-01-29 07:10:37'),
(17, 7, 2, 'venom-1366x768.jpg', 'image/jpeg', '343518', '1548745837451_venom-1366x768.jpg', 'uploads1548745837451_venom-1366x768.jpg', '2019-01-29 07:10:37'),
(18, 7, 2, 'wall_e_in_the_city-wallpaper-1366x768.jpg', 'image/jpeg', '273488', '1548745837458_wall_e_in_the_city-wallpaper-1366x768.jpg', 'uploads1548745837458_wall_e_in_the_city-wallpaper-1366x768.jpg', '2019-01-29 07:10:37'),
(19, 8, 1, '01-DARPA ROBO-FLY.png', 'image/png', '958072', '1548866752146_01-DARPA ROBO-FLY.png', 'uploads1548866752146_01-DARPA ROBO-FLY.png', '2019-01-30 16:45:53'),
(20, 8, 1, '1.jpg', 'image/jpeg', '2597735', '1548866752242_1.jpg', 'uploads1548866752242_1.jpg', '2019-01-30 16:45:53'),
(21, 8, 1, 'avengers-age-of-ultron.jpg', 'image/jpeg', '2199504', '1548866752917_avengers-age-of-ultron.jpg', 'uploads1548866752917_avengers-age-of-ultron.jpg', '2019-01-30 16:45:53'),
(22, 9, 2, '007.jpg', 'image/jpeg', '172279', '1548933451135_007.jpg', 'uploads1548933451135_007.jpg', '2019-01-31 11:17:31'),
(23, 9, 2, '008.jpg', 'image/jpeg', '173331', '1548933451317_008.jpg', 'uploads1548933451317_008.jpg', '2019-01-31 11:17:31'),
(24, 10, 2, '8.jpg', 'image/jpeg', '40574', '1548936234324_8.jpg', 'uploads1548936234324_8.jpg', '2019-01-31 12:03:54'),
(25, 10, 2, '13001213_273384162995201_3857823144413980893_n.jpg', 'image/jpeg', '47494', '1548936234329_13001213_273384162995201_3857823144413980893_n.jpg', 'uploads1548936234329_13001213_273384162995201_3857823144413980893_n.jpg', '2019-01-31 12:03:54'),
(26, 11, 2, 'spider-man-1920x1080.jpg', 'image/jpeg', '608153', '1549605002709_spider-man-1920x1080.jpg', 'uploads1549605002709_spider-man-1920x1080.jpg', '2019-02-08 05:50:03'),
(27, 11, 2, 'tangled_disney_pascal-wallpaper-1366x768.jpg', 'image/jpeg', '157896', '1549605002749_tangled_disney_pascal-wallpaper-1366x768.jpg', 'uploads1549605002749_tangled_disney_pascal-wallpaper-1366x768.jpg', '2019-02-08 05:50:03'),
(28, 11, 2, 'wall_e_in_the_city-wallpaper-1366x768.jpg', 'image/jpeg', '273488', '1549605002752_wall_e_in_the_city-wallpaper-1366x768.jpg', 'uploads1549605002752_wall_e_in_the_city-wallpaper-1366x768.jpg', '2019-02-08 05:50:03'),
(29, 12, 2, 'Iron-Man-2.png', 'image/png', '5463703', '1549606081264_Iron-Man-2.png', 'uploads1549606081264_Iron-Man-2.png', '2019-02-08 06:08:01'),
(30, 12, 2, 'spider-man-1920x1080.jpg', 'image/jpeg', '608153', '1549606081609_spider-man-1920x1080.jpg', 'uploads1549606081609_spider-man-1920x1080.jpg', '2019-02-08 06:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `follower` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fruits`
--

CREATE TABLE `fruits` (
  `fruit_id` int(11) NOT NULL,
  `fruit_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fruits`
--

INSERT INTO `fruits` (`fruit_id`, `fruit_name`) VALUES
(1, 'apples'),
(2, 'mango'),
(3, 'pears'),
(4, 'graphes'),
(5, 'banana'),
(6, 'strawberry');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `like_status` varchar(250) NOT NULL,
  `date_liked` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `user_id`, `post_id`, `like_status`, `date_liked`) VALUES
(1, 1, 2, 'unlike', '2019-01-30 16:44:05'),
(2, 1, 1, 'like', '2019-02-01 09:49:41'),
(3, 1, 3, 'like', '2019-01-30 16:26:51'),
(4, 1, 4, 'unlike', '2019-02-01 13:40:48'),
(5, 1, 5, 'unlike', '2019-02-01 13:40:58'),
(6, 1, 6, 'unlike', '2019-02-01 13:41:08'),
(7, 2, 7, 'like', '2019-01-30 07:01:12'),
(8, 2, 6, 'like', '2019-02-10 16:00:22'),
(9, 2, 5, 'like', '2019-02-10 16:00:04'),
(10, 2, 4, 'unlike', '2019-02-07 16:51:00'),
(11, 2, 9, 'like', '2019-02-10 16:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(2560) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `description`, `created_date`) VALUES
(1, 1, ' Hi How are you ', '2019-01-21 05:50:51'),
(2, 1, ' Hello hi', '2019-01-21 05:51:16'),
(3, 1, ' Working a Fine ', '2019-01-25 11:40:41'),
(4, 2, ' Hi How are you ', '2019-01-28 12:30:49'),
(5, 2, ' Working a Fine ', '2019-01-28 12:31:20'),
(6, 2, ' Hi How are you ......', '2019-01-28 12:32:15'),
(7, 2, ' 4th test', '2019-01-29 07:10:37'),
(8, 1, ' Hi How are you ', '2019-01-30 16:45:53'),
(9, 2, ' 5th test', '2019-01-31 11:17:31'),
(10, 2, ' 6th test', '2019-01-31 12:03:54'),
(11, 2, ' 7th post ', '2019-02-08 05:50:02'),
(12, 2, ' 8th post', '2019-02-08 06:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`state_id`, `state_name`) VALUES
(1, 'kerala'),
(2, 'tamilnadu'),
(3, 'andhra'),
(4, 'Telangana'),
(5, 'karnataka'),
(6, 'maharastra'),
(7, 'Haryana'),
(8, 'punjab');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `lastname` varchar(60) NOT NULL,
  `address_type` varchar(250) NOT NULL,
  `expiry_date` date NOT NULL,
  `street_address` varchar(250) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `zip_code` int(11) NOT NULL,
  `fruits` varchar(250) NOT NULL,
  `creation_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `firstname`, `lastname`, `address_type`, `expiry_date`, `street_address`, `state`, `city`, `zip_code`, `fruits`, `creation_Date`) VALUES
(1, 'siva', '123456', 'siva', 'sankar', 'temporary', '2018-02-01', 'sbi ', '1', '1', 55555, 'true,true,true', '0000-00-00'),
(2, 'sankar', '1234', 'sankar', 'chimata', 'temporary', '2018-02-01', 'sbi ', '1', '1', 55555, 'true,false,true', '0000-00-00'),
(3, 'yyaa', 'wrwr', 'ryrwerw', 'arwrwe', 'permanent', '0000-00-00', 'tertret', '2', '6', 53453, 'true,false,true', '0000-00-00'),
(4, 'yyaa', 'wrwr', 'ryrwerw', 'arwrwe', 'permanent', '0000-00-00', 'tertret', '2', '6', 53453, 'true,false,true', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`follower`);

--
-- Indexes for table `fruits`
--
ALTER TABLE `fruits`
  ADD PRIMARY KEY (`fruit_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `follower` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fruits`
--
ALTER TABLE `fruits`
  MODIFY `fruit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
