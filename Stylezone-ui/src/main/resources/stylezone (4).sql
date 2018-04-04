-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2018 at 10:17 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stylezone`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `b_id` int(11) NOT NULL,
  `brand_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`b_id`, `brand_name`, `created_by`, `created_date`) VALUES
(43, 'ppppp', 16, '2018-03-20 01:18 AM'),
(44, 'dggggggg', 16, '2018-03-20 01:18 AM'),
(45, 'mmm', 2, '2018-03-22 01:12 AM'),
(50, 'keu', 28, '2018-03-31 02:54 PM'),
(51, 'Doremon', 28, '2018-03-31 02:56 PM');

-- --------------------------------------------------------

--
-- Stand-in structure for view `brand_list`
-- (See below for the actual view)
--
CREATE TABLE `brand_list` (
`b_id` int(11)
,`brand_name` varchar(40)
,`created_date` varchar(20)
,`user_name` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items_table`
--

CREATE TABLE `cart_items_table` (
  `cart_item` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `rental_price` decimal(10,2) DEFAULT NULL,
  `deposite_per` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `created_by`, `created_date`) VALUES
(5, 'sffffffffffffffffffffff', 2, '2018-03-17 08:52 PM'),
(6, 'gddddddd', 16, '2018-03-20 01:18 AM'),
(7, 'Fashion', 28, '2018-03-31 01:28 PM'),
(9, 'chiri', 28, '2018-03-31 02:36 PM');

-- --------------------------------------------------------

--
-- Stand-in structure for view `categoryview`
-- (See below for the actual view)
--
CREATE TABLE `categoryview` (
`cat_id` int(11)
,`cat_name` varchar(40)
,`user_name` varchar(30)
,`created_date` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(40) NOT NULL,
  `color_code` varchar(8) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`color_id`, `color_name`, `color_code`, `created_by`, `created_date`) VALUES
(14, 'red', '780904', 2, '2018-03-19 09:36 PM'),
(15, 'Green', '33FF3D', 2, '2018-03-17 08:57 PM'),
(16, 'Pink', 'FF82D3', 2, '2018-03-17 08:57 PM'),
(17, 'dggggggg', '4B2B78', 2, '2018-03-19 09:36 PM'),
(18, 'gdddddddd', 'AFFF59', 16, '2018-03-20 01:18 AM'),
(19, 'Pink', 'FF5CD6', 28, '2018-03-31 01:27 PM'),
(20, 'Blue', '6E54FF', 28, '2018-03-31 02:09 PM');

-- --------------------------------------------------------

--
-- Stand-in structure for view `colorview`
-- (See below for the actual view)
--
CREATE TABLE `colorview` (
`color_id` int(11)
,`color_code` varchar(8)
,`color_name` varchar(40)
,`created_date` varchar(20)
,`user_name` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `custom_fitting_appointment`
--

CREATE TABLE `custom_fitting_appointment` (
  `appointment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `appointment` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_info`
--

CREATE TABLE `login_info` (
  `user_id` int(11) DEFAULT NULL,
  `last_login` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_info`
--

INSERT INTO `login_info` (`user_id`, `last_login`) VALUES
(2, '2018-03-22 01:12 AM'),
(13, '2018-03-20 12:25 AM'),
(15, '2018-03-20 01:17 AM'),
(16, '2018-03-20 01:19 AM'),
(17, '2018-03-23 12:16 AM'),
(18, '2018-03-23 12:58 AM'),
(19, '2018-03-23 01:11 AM'),
(20, '2018-03-23 01:16 AM'),
(21, '2018-03-24 12:47 PM'),
(22, '2018-03-24 01:53 PM'),
(23, '2018-03-24 01:56 PM'),
(24, '2018-03-24 02:29 PM'),
(25, '2018-03-24 02:30 PM'),
(26, '2018-03-24 02:32 PM'),
(27, '2018-03-31 12:30 PM'),
(28, '2018-03-31 01:26 PM');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `noti_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `occasion`
--

CREATE TABLE `occasion` (
  `oca_id` int(11) NOT NULL,
  `oca_name` varchar(40) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `occasion`
--

INSERT INTO `occasion` (`oca_id`, `oca_name`, `created_by`, `created_date`) VALUES
(4, 'zzzzzzzzz', 2, '2018-03-17 07:35 PM'),
(6, 'xvvvvvvvvvvvv', 2, '2018-03-17 07:35 PM'),
(7, 'zzzzzzzzzvv', 16, '2018-03-20 01:18 AM'),
(8, 'Shadi', 28, '2018-03-31 01:27 PM'),
(9, 'Sagai', 28, '2018-03-31 02:56 PM');

-- --------------------------------------------------------

--
-- Stand-in structure for view `occasionview`
-- (See below for the actual view)
--
CREATE TABLE `occasionview` (
`oca_id` int(11)
,`oca_name` varchar(40)
,`created_date` varchar(20)
,`user_name` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `order_item_table`
--

CREATE TABLE `order_item_table` (
  `order_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `rental_price` decimal(10,2) DEFAULT NULL,
  `deposite_per` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `otp_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `otp` varchar(5) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_details_female_attributes`
--

CREATE TABLE `product_details_female_attributes` (
  `attr_id` int(11) NOT NULL,
  `p_details_id` int(11) DEFAULT NULL,
  `size` varchar(5) DEFAULT NULL,
  `bust` varchar(5) DEFAULT NULL,
  `waist` varchar(5) DEFAULT NULL,
  `hip` varchar(5) DEFAULT NULL,
  `height` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_details_female_attributes`
--

INSERT INTO `product_details_female_attributes` (`attr_id`, `p_details_id`, `size`, `bust`, `waist`, `hip`, `height`) VALUES
(1, 2, '40', '20', '30', '10', '6.1'),
(2, 3, '40', '20', '30', '10', '6.1');

-- --------------------------------------------------------

--
-- Table structure for table `product_details_male_attributes`
--

CREATE TABLE `product_details_male_attributes` (
  `attr_id` int(11) NOT NULL,
  `p_details_id` int(11) DEFAULT NULL,
  `top_size` varchar(5) DEFAULT NULL,
  `bottom_size` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_details_male_attributes`
--

INSERT INTO `product_details_male_attributes` (`attr_id`, `p_details_id`, `top_size`, `bottom_size`) VALUES
(1, 1, '10', '20');

-- --------------------------------------------------------

--
-- Table structure for table `product_details_table`
--

CREATE TABLE `product_details_table` (
  `p_details_id` int(11) NOT NULL,
  `title` varchar(70) NOT NULL,
  `description` varchar(300) NOT NULL,
  `custom_fiting_available` int(11) NOT NULL,
  `pr_img1` varchar(200) DEFAULT NULL,
  `pr_img2` varchar(200) DEFAULT NULL,
  `pr_img3` varchar(200) DEFAULT NULL,
  `gender_type` varchar(1) DEFAULT NULL,
  `rent_price` int(11) DEFAULT NULL,
  `deposite_per` int(11) DEFAULT NULL,
  `duration4` varchar(1) DEFAULT NULL,
  `duration6` varchar(1) DEFAULT NULL,
  `duration8` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_details_table`
--

INSERT INTO `product_details_table` (`p_details_id`, `title`, `description`, `custom_fiting_available`, `pr_img1`, `pr_img2`, `pr_img3`, `gender_type`, `rent_price`, `deposite_per`, `duration4`, `duration6`, `duration8`) VALUES
(1, 'SAREE', 'DFFD', 1, NULL, NULL, NULL, 'M', 300, 10, 'Y', 'Y', 'Y'),
(2, 'Soma Saree', 'DFFD', 1, NULL, NULL, NULL, 'F', 300, 10, 'Y', 'Y', 'Y'),
(3, 'Saree dd', 'DFFD', 1, NULL, NULL, NULL, 'F', 300, 10, 'Y', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_list`
-- (See below for the actual view)
--
CREATE TABLE `product_list` (
`product_id` int(11)
,`brand` int(11)
,`category` int(11)
,`color` int(11)
,`occasion` int(11)
,`availability` int(11)
,`create_by` varchar(30)
,`create_date` date
,`title` varchar(70)
,`gender` varchar(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `product_review_table`
--

CREATE TABLE `product_review_table` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `rating` varchar(5) DEFAULT NULL,
  `created_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_table`
--

CREATE TABLE `product_table` (
  `p_id` int(11) NOT NULL,
  `b_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `oca_id` int(11) DEFAULT NULL,
  `isinstock` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `p_details_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_table`
--

INSERT INTO `product_table` (`p_id`, `b_id`, `cat_id`, `color_id`, `oca_id`, `isinstock`, `create_date`, `create_by`, `p_details_id`) VALUES
(1, 51, 7, 19, 8, 1, '2018-04-03', 28, 1),
(2, 51, 7, 19, 8, 1, '2018-04-03', 28, 2),
(3, 51, 7, 19, 8, 1, '2018-04-03', 28, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_mobile_no` varchar(10) NOT NULL,
  `user_role` int(11) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `acc_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_mobile_no`, `user_role`, `password`, `acc_status`) VALUES
(24, 'Chiranjit Jana(Admin)', 'chiranjit.n.jana@gmail.com', '9664335225', 1, '12345', 1),
(27, 'chianjit jana', 'chiranjit.jana19@gmail.com', '9664335228', 2, '12345', 1),
(28, 'chir', 'cjana02@gmail.com', '9664335226', 1, '12345', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_info`
--

CREATE TABLE `users_info` (
  `user_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_info`
--

INSERT INTO `users_info` (`user_id`, `address`) VALUES
(1, 'Ghatkopar, Mumbai'),
(3, 'Thane, Mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `users_role`
--

CREATE TABLE `users_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role`
--

INSERT INTO `users_role` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Superadmin');

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_details`
-- (See below for the actual view)
--
CREATE TABLE `user_details` (
`user_id` int(11)
,`user_email` varchar(30)
,`user_name` varchar(30)
,`user_mobile_no` varchar(10)
,`password` varchar(20)
,`user_role` int(11)
,`role_name` varchar(30)
,`last_login` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `brand_list`
--
DROP TABLE IF EXISTS `brand_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `brand_list`  AS  select `b`.`b_id` AS `b_id`,`b`.`brand_name` AS `brand_name`,`b`.`created_date` AS `created_date`,`u`.`user_name` AS `user_name` from (`users` `u` join `brand` `b`) where (`b`.`created_by` = `u`.`user_id`) order by `b`.`b_id` desc ;

-- --------------------------------------------------------

--
-- Structure for view `categoryview`
--
DROP TABLE IF EXISTS `categoryview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `categoryview`  AS  select `cat`.`cat_id` AS `cat_id`,`cat`.`cat_name` AS `cat_name`,`user`.`user_name` AS `user_name`,`cat`.`created_date` AS `created_date` from (`categories` `cat` join `users` `user`) where (`cat`.`created_by` = `user`.`user_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `colorview`
--
DROP TABLE IF EXISTS `colorview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `colorview`  AS  select `color`.`color_id` AS `color_id`,`color`.`color_code` AS `color_code`,`color`.`color_name` AS `color_name`,`color`.`created_date` AS `created_date`,`user`.`user_name` AS `user_name` from (`colors` `color` join `users` `user`) where (`color`.`created_by` = `user`.`user_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `occasionview`
--
DROP TABLE IF EXISTS `occasionview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `occasionview`  AS  select `o`.`oca_id` AS `oca_id`,`o`.`oca_name` AS `oca_name`,`o`.`created_date` AS `created_date`,`user`.`user_name` AS `user_name` from (`occasion` `o` join `users` `user`) where (`o`.`created_by` = `user`.`user_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `product_list`
--
DROP TABLE IF EXISTS `product_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_list`  AS  select `p`.`p_id` AS `product_id`,`p`.`b_id` AS `brand`,`p`.`cat_id` AS `category`,`p`.`color_id` AS `color`,`p`.`oca_id` AS `occasion`,`p`.`isinstock` AS `availability`,`user`.`user_name` AS `create_by`,`p`.`create_date` AS `create_date`,`d`.`title` AS `title`,`d`.`gender_type` AS `gender` from ((`product_table` `p` join `product_details_table` `d`) join `users` `user`) where ((`p`.`p_details_id` = `d`.`p_details_id`) and (`p`.`create_by` = `user`.`user_id`)) order by `p`.`p_id` desc ;

-- --------------------------------------------------------

--
-- Structure for view `user_details`
--
DROP TABLE IF EXISTS `user_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_details`  AS  select `u`.`user_id` AS `user_id`,`u`.`user_email` AS `user_email`,`u`.`user_name` AS `user_name`,`u`.`user_mobile_no` AS `user_mobile_no`,`u`.`password` AS `password`,`u`.`user_role` AS `user_role`,`ur`.`role_name` AS `role_name`,`info`.`last_login` AS `last_login` from ((`users` `u` join `users_role` `ur`) join `login_info` `info`) where ((`u`.`user_id` = `info`.`user_id`) and (`u`.`user_role` = `ur`.`role_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `cart_items_table`
--
ALTER TABLE `cart_items_table`
  ADD PRIMARY KEY (`cart_item`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `custom_fitting_appointment`
--
ALTER TABLE `custom_fitting_appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`noti_id`);

--
-- Indexes for table `occasion`
--
ALTER TABLE `occasion`
  ADD PRIMARY KEY (`oca_id`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`otp_id`);

--
-- Indexes for table `product_details_female_attributes`
--
ALTER TABLE `product_details_female_attributes`
  ADD PRIMARY KEY (`attr_id`);

--
-- Indexes for table `product_details_male_attributes`
--
ALTER TABLE `product_details_male_attributes`
  ADD PRIMARY KEY (`attr_id`);

--
-- Indexes for table `product_details_table`
--
ALTER TABLE `product_details_table`
  ADD PRIMARY KEY (`p_details_id`);

--
-- Indexes for table `product_review_table`
--
ALTER TABLE `product_review_table`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `product_table`
--
ALTER TABLE `product_table`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_info`
--
ALTER TABLE `users_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_role`
--
ALTER TABLE `users_role`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cart_items_table`
--
ALTER TABLE `cart_items_table`
  MODIFY `cart_item` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `custom_fitting_appointment`
--
ALTER TABLE `custom_fitting_appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `noti_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `occasion`
--
ALTER TABLE `occasion`
  MODIFY `oca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `otp_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_details_female_attributes`
--
ALTER TABLE `product_details_female_attributes`
  MODIFY `attr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product_details_male_attributes`
--
ALTER TABLE `product_details_male_attributes`
  MODIFY `attr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product_details_table`
--
ALTER TABLE `product_details_table`
  MODIFY `p_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `product_review_table`
--
ALTER TABLE `product_review_table`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_table`
--
ALTER TABLE `product_table`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `users_role`
--
ALTER TABLE `users_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
