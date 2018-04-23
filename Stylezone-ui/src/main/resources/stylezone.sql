-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2018 at 10:36 PM
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
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `add_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `line_one` varchar(140) DEFAULT NULL,
  `line_two` varchar(140) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `postcode` varchar(8) DEFAULT NULL,
  `created_date` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`add_id`, `user_id`, `line_one`, `line_two`, `city`, `state`, `postcode`, `created_date`) VALUES
(1, 27, 'Room no 2,smt kamla devi chawl', 'Parsiwadi,Ghatkopar (West)', 'Mumbai', 'Maharashtra', '400086', '2018-04-21 10:12 AM'),
(2, 27, 'Mum', 'jsnjsd', 'jnfj', 'Andhra Pradesh', '789641', '2018-04-21 08:53 PM');

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
(1, 'Levi\'s', 28, '2018-04-08 03:22 PM'),
(2, 'Park Avenue', 28, '2018-04-08 03:23 PM'),
(3, 'Allen Solly', 28, '2018-04-08 03:23 PM'),
(4, 'Provogue', 28, '2018-04-08 03:23 PM'),
(5, 'M&S', 28, '2018-04-08 03:24 PM');

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
-- Table structure for table `card_details`
--

CREATE TABLE `card_details` (
  `card_id` int(11) NOT NULL,
  `order_id` varchar(40) NOT NULL,
  `name_on_card` varchar(100) NOT NULL,
  `card_number` varchar(18) NOT NULL,
  `epiry_month` int(11) NOT NULL,
  `epiry_year` int(11) NOT NULL,
  `cvv` int(11) NOT NULL,
  `card_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `card_details`
--

INSERT INTO `card_details` (`card_id`, `order_id`, `name_on_card`, `card_number`, `epiry_month`, `epiry_year`, `cvv`, `card_type`) VALUES
(1, 'BD62E552BF9D4F27BAACE9F90696043A', 'Chiranjit Jana', '4242424242424242', 1, 2018, 896, 'credit'),
(2, '99A6F0B820304F69A12E682AE73980AB', 'fsfsf', '4242424242424242', 1, 2018, 789, 'credit'),
(3, 'E6C956A0033A44B0A49F8F3FA43F4590', 'Chiranjit Jana', '4242424242424242', 2, 2018, 745, 'credit'),
(4, '63F5176B0A7145B3AEE794CB0980D420', 'Chiri', '4242424242424242', 1, 2018, 789, 'credit'),
(5, 'DCEE314FAFAD4F1281573B0216B4215E', 'fafa', '4242424242424242', 1, 2018, 789, 'credit'),
(6, '88541F363932400292F3F520E3F8D461', '145', '4242424242424242', 10, 2018, 234, 'credit'),
(7, 'F3997B9780CC4BD5A5FE259812AD0983', 'ssg', '4242424242424242', 11, 2028, 345, 'credit'),
(8, 'E986BAFEB65C4A889420FAFA7AF4A2D1', 'fafa', '4242424242424242', 11, 2031, 456, 'credit'),
(9, '494BC01D5B194C5E985C0E6CF45E0369', 'sfsfsf', '4242424242424242', 11, 2018, 789, 'credit'),
(10, '94CAEB7403CD49B389013043268A89EC', 'sfsf', '4242424242424242', 11, 2031, 345, 'credit'),
(11, '82F56F37514D4EDAB0323D3461297873', 'adddddd', '4242424242424242', 11, 2027, 234, 'credit'),
(12, '22B12F53262343FB8858C41A2D2E9337', 'Chiranjit Jana', '4242424242424242', 10, 2028, 789, 'credit'),
(13, 'E766226DAC784B0B96FC3A8E0F4173AB', 'Chiranjit Jana', '4716764066722800', 1, 2018, 789, 'credit');

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
  `deposite_per` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
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
(4, 'Suits and Tuxedos', 28, '2018-04-08 03:32 PM'),
(5, 'Blazers', 28, '2018-04-08 03:32 PM'),
(6, 'Indo Western', 28, '2018-04-08 03:32 PM'),
(7, 'Plain Sherwanis', 28, '2018-04-08 03:33 PM'),
(8, 'Lehengas', 28, '2018-04-08 03:33 PM'),
(9, 'Anarkalis', 28, '2018-04-08 03:33 PM'),
(10, 'Sarees', 28, '2018-04-08 03:33 PM'),
(11, 'Kurta Sets', 28, '2018-04-08 03:34 PM'),
(12, 'Saree Gowns', 28, '2018-04-08 03:34 PM'),
(13, 'CROP TOP AND SKIRT SET', 28, '2018-04-08 03:55 PM');

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
(1, 'Green', '008000', 28, '2018-04-08 03:24 PM'),
(2, 'Teal', '008080', 28, '2018-04-08 03:25 PM'),
(3, 'Aqua', '00FFFF', 28, '2018-04-08 03:25 PM'),
(4, 'Yellow', 'FFC300', 28, '2018-04-08 03:26 PM'),
(5, 'Red', 'FF0F0F', 28, '2018-04-08 03:26 PM'),
(6, 'Pink', 'FF3072', 28, '2018-04-08 03:52 PM'),
(7, 'Yellow', 'FFFC54', 28, '2018-04-17 12:08 AM');

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
(27, '2018-04-24 12:39 AM'),
(28, '2018-04-18 09:22 PM');

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
(1, 'Mehendi Ceremony', 28, '2018-04-08 03:28 PM'),
(2, 'Pre Wedding Ceremonies', 28, '2018-04-08 03:28 PM'),
(3, 'Engagement Ceremony', 28, '2018-04-08 03:28 PM'),
(4, 'Sangeet Ceremony', 28, '2018-04-08 03:29 PM'),
(5, 'Vidai Ceremony', 28, '2018-04-08 03:29 PM'),
(6, 'Reception Ceremony', 28, '2018-04-08 03:29 PM');

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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` varchar(40) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rent_total` varchar(10) NOT NULL,
  `deposite_total` varchar(10) NOT NULL,
  `total` varchar(10) NOT NULL,
  `created_date` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `rent_total`, `deposite_total`, `total`, `created_date`) VALUES
('0CB9765AEB524DE9951A8195A68425E3', 27, '5249', '34500', '39749', '2018-04-22'),
('22B12F53262343FB8858C41A2D2E9337', 27, '4000', '14000', '18000', '2018-04-24'),
('2981F25175AE406695E00E03FE1FC29F', 27, '6799', '32500', '39299', '2018-04-22'),
('359F7717636E438BA9022DCAD35BD867', 27, '2299', '17500', '19799', '2018-04-22'),
('494BC01D5B194C5E985C0E6CF45E0369', 27, '2500', '14000', '16500', '2018-04-23'),
('63F5176B0A7145B3AEE794CB0980D420', 27, '4500', '15000', '19500', '2018-04-23'),
('82F56F37514D4EDAB0323D3461297873', 27, '4000', '14000', '18000', '2018-04-23'),
('88541F363932400292F3F520E3F8D461', 27, '2299', '17500', '19799', '2018-04-23'),
('94CAEB7403CD49B389013043268A89EC', 27, '2299', '17500', '19799', '2018-04-23'),
('99A6F0B820304F69A12E682AE73980AB', 27, '2500', '14000', '16500', '2018-04-23'),
('ACF10CD652E24F82A3D772C283397520', 27, '2299', '17500', '19799', '2018-04-22'),
('BD62E552BF9D4F27BAACE9F90696043A', 27, '6799', '32500', '39299', '2018-04-22'),
('BE2690D84B1F4022A59463EF43795331', 27, '6799', '31500', '38299', '2018-04-22'),
('DCEE314FAFAD4F1281573B0216B4215E', 27, '4500', '15000', '19500', '2018-04-23'),
('E6C956A0033A44B0A49F8F3FA43F4590', 27, '4598', '73500', '78098', '2018-04-23'),
('E766226DAC784B0B96FC3A8E0F4173AB', 27, '6299', '31500', '37799', '2018-04-24'),
('E986BAFEB65C4A889420FAFA7AF4A2D1', 27, '2450', '17000', '19450', '2018-04-23'),
('F3997B9780CC4BD5A5FE259812AD0983', 27, '4000', '14000', '18000', '2018-04-23');

-- --------------------------------------------------------

--
-- Table structure for table `ordertracker`
--

CREATE TABLE `ordertracker` (
  `tracker_id` int(11) NOT NULL,
  `order_id` varchar(40) NOT NULL,
  `order_status` int(11) NOT NULL,
  `created_date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertracker`
--

INSERT INTO `ordertracker` (`tracker_id`, `order_id`, `order_status`, `created_date`) VALUES
(1, 'E766226DAC784B0B96FC3A8E0F4173AB', 1, '2018-04-24 01:40 AM');

-- --------------------------------------------------------

--
-- Table structure for table `order_address`
--

CREATE TABLE `order_address` (
  `add_id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `address` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_address`
--

INSERT INTO `order_address` (`add_id`, `order_id`, `address`) VALUES
(1, 'BD62E552BF9D4F27BAACE9F90696043A', 'Room no 2,smt kamla devi chawl, Parsiwadi,Ghatkopar (West)Mumbai,Maharashtra ,400086'),
(2, '99A6F0B820304F69A12E682AE73980AB', 'Room no 2,smt kamla devi chawl, Parsiwadi,Ghatkopar (West)Mumbai,Maharashtra ,400086'),
(3, 'E6C956A0033A44B0A49F8F3FA43F4590', 'Mum, jsnjsdjnfj,Andhra Pradesh ,789641'),
(4, '63F5176B0A7145B3AEE794CB0980D420', 'Room no 2,smt kamla devi chawl, Parsiwadi,Ghatkopar (West)Mumbai,Maharashtra ,400086'),
(5, 'DCEE314FAFAD4F1281573B0216B4215E', 'Room no 2,smt kamla devi chawl, Parsiwadi,Ghatkopar (West)Mumbai,Maharashtra ,400086'),
(6, '88541F363932400292F3F520E3F8D461', 'Room no 2,smt kamla devi chawl, Parsiwadi,Ghatkopar (West)Mumbai,Maharashtra ,400086'),
(7, 'F3997B9780CC4BD5A5FE259812AD0983', 'Mum, jsnjsdjnfj,Andhra Pradesh ,789641'),
(8, 'E986BAFEB65C4A889420FAFA7AF4A2D1', 'Room no 2,smt kamla devi chawl, Parsiwadi,Ghatkopar (West)Mumbai,Maharashtra ,400086'),
(9, '494BC01D5B194C5E985C0E6CF45E0369', 'Room no 2,smt kamla devi chawl, Parsiwadi,Ghatkopar (West)Mumbai,Maharashtra ,400086'),
(10, '94CAEB7403CD49B389013043268A89EC', 'Room no 2,smt kamla devi chawl, Parsiwadi,Ghatkopar (West)Mumbai,Maharashtra ,400086'),
(11, '82F56F37514D4EDAB0323D3461297873', 'Room no 2,smt kamla devi chawl, Parsiwadi,Ghatkopar (West)Mumbai,Maharashtra ,400086'),
(12, '22B12F53262343FB8858C41A2D2E9337', 'Mum, jsnjsdjnfj,Andhra Pradesh ,789641'),
(13, 'E766226DAC784B0B96FC3A8E0F4173AB', 'Room no 2,smt kamla devi chawl, Parsiwadi,Ghatkopar (West)Mumbai,Maharashtra ,400086');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` varchar(40) NOT NULL,
  `product_id` int(11) NOT NULL,
  `custom_fitting_available` varchar(3) DEFAULT NULL,
  `custom_fitting_app_date` date DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `duration` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `deposite_price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `order_id`, `product_id`, `custom_fitting_available`, `custom_fitting_app_date`, `start_date`, `end_date`, `duration`, `rent_price`, `deposite_price`, `total_price`) VALUES
(1, 'BE2690D84B1F4022A59463EF43795331', 1, 'Y', '2018-04-24', '2018-04-25', '2018-04-29', 4, 2299, 17500, 19799),
(2, 'BE2690D84B1F4022A59463EF43795331', 7, 'N', NULL, '2018-04-24', '2018-04-30', 6, 4500, 14000, 18500),
(3, '0CB9765AEB524DE9951A8195A68425E3', 1, 'Y', '2018-04-24', '2018-04-25', '2018-04-29', 4, 2299, 17500, 19799),
(4, '0CB9765AEB524DE9951A8195A68425E3', 2, 'N', NULL, '2018-04-30', '2018-05-06', 6, 2950, 17000, 19950),
(5, 'BD62E552BF9D4F27BAACE9F90696043A', 1, 'Y', '2018-04-24', '2018-04-25', '2018-04-29', 4, 2299, 17500, 19799),
(6, 'BD62E552BF9D4F27BAACE9F90696043A', 4, 'Y', '2018-04-25', '2018-04-27', '2018-05-03', 6, 4500, 15000, 19500),
(7, '99A6F0B820304F69A12E682AE73980AB', 6, 'N', NULL, '2018-04-26', '2018-05-02', 6, 2500, 14000, 16500),
(8, 'E6C956A0033A44B0A49F8F3FA43F4590', 5, 'N', NULL, '2018-04-27', '2018-05-01', 4, 2299, 56000, 58299),
(9, 'E6C956A0033A44B0A49F8F3FA43F4590', 1, 'Y', '2018-04-26', '2018-04-27', '2018-05-01', 4, 2299, 17500, 19799),
(10, '63F5176B0A7145B3AEE794CB0980D420', 4, 'Y', NULL, '2018-04-26', '2018-05-02', 6, 4500, 15000, 19500),
(11, 'DCEE314FAFAD4F1281573B0216B4215E', 4, 'Y', NULL, '2018-04-25', '2018-05-01', 6, 4500, 15000, 19500),
(12, '88541F363932400292F3F520E3F8D461', 1, 'Y', NULL, '2018-04-26', '2018-04-30', 4, 2299, 17500, 19799),
(13, 'F3997B9780CC4BD5A5FE259812AD0983', 7, 'N', NULL, '2018-04-26', '2018-04-30', 4, 4000, 14000, 18000),
(14, 'E986BAFEB65C4A889420FAFA7AF4A2D1', 2, 'N', NULL, '2018-04-26', '2018-04-30', 4, 2450, 17000, 19450),
(15, '494BC01D5B194C5E985C0E6CF45E0369', 6, 'N', NULL, '2018-04-27', '2018-05-03', 6, 2500, 14000, 16500),
(16, '94CAEB7403CD49B389013043268A89EC', 1, 'Y', NULL, '2018-04-27', '2018-05-01', 4, 2299, 17500, 19799),
(17, '82F56F37514D4EDAB0323D3461297873', 7, 'N', NULL, '2018-04-28', '2018-05-02', 4, 4000, 14000, 18000),
(18, '22B12F53262343FB8858C41A2D2E9337', 7, 'N', NULL, '2018-04-26', '2018-04-30', 4, 4000, 14000, 18000),
(19, 'E766226DAC784B0B96FC3A8E0F4173AB', 7, 'N', NULL, '2018-04-27', '2018-05-01', 4, 4000, 14000, 18000),
(20, 'E766226DAC784B0B96FC3A8E0F4173AB', 1, 'Y', '2018-04-26', '2018-04-28', '2018-05-02', 4, 2299, 17500, 19799);

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

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`otp_id`, `user_id`, `otp`, `created_date`, `expiry_date`) VALUES
(1, 27, '87255', '2018-04-12 00:10:45', '2018-04-12 00:20:45');

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
(2, 1, '32', '33', '28', '42', '42'),
(3, 2, '30', '32', '20', '30', '40'),
(4, 4, '32', '35', '36', '38', '40'),
(5, 5, '32', '42', '32', '32', '40'),
(6, 6, '32', '30', '35', '38', '60');

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
(2, 7, '32', '32');

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
(1, 'DOREE', 'Red And Gold Lehenga Set', 1, 'D://upload//180408034159459ba7b55746cc34aa68818abf49e9d6ec8.jpg', 'D://upload//1804080341594598c176d429dfd4a25ba6b27b2be0494cf.jpg', 'D://upload//18040803415945984330f6f1f1249f385621880a0b73b5c.jpg', 'F', 2299, 17500, 'Y', 'Y', 'Y'),
(2, 'AJD', 'Blue And Peach Lehenga Set', 2, 'D://upload//180408034454454300de26ba99446a985de5ea9ff1e8469.jpg', 'D://upload//1804080344544547010236f259249c483046ad5a3387393.jpg', 'D://upload//18040803445445430e27b331a2f4abdada20b3a861c887c.jpg', 'F', 2450, 17000, 'Y', 'Y', 'N'),
(4, 'ABHILASHA', 'Peach Embriodered Gown with Drape', 1, 'D://upload//1804080354284287304b23c83f94d799bbc745592a864bd.jpg', 'D://upload//180408035428428a577bb3cb58548a7a7c3a7122a356f9f.jpg', 'D://upload//180408035428428afcf3bdbda4846eea6dd5e45598a6955.jpg', 'F', 4500, 15000, 'N', 'Y', 'N'),
(5, 'BENAZIR LABEL', 'Yellow And Wine Embroidered Crop Top And Skirt', 2, 'D://upload//18040803580545e11b4db87475498988a9613fefcdaec2.jpg', 'D://upload//18040803580545f933a67f746a4eb0b628f355dd83f7b4.jpg', 'D://upload//1804080358054526c3ecc9e22046c78f3a05ae34b1f3c5.jpg', 'F', 2299, 56000, 'Y', 'Y', 'N'),
(6, 'ZAYAH', 'Pink And Red Ombre Shaded Sari', 2, 'D://upload//18041512081341385ec3e72df9e4f0fba2e529390fa7099.jpg', 'D://upload//180415120813413f71aee3f24ca41fcb6d2acceae8804a0.jpg', 'D://upload//180415120813413c021825713214e33a7c888de0bd6792a.jpg', 'F', 2500, 14000, 'N', 'Y', 'N'),
(7, 'Teal Blazers', 'For men', 2, 'D://upload//180415010544444def29bc91b6841bca99adb4bb7b78e0e.jpg', 'D://upload//1804150105444441d083ff4691f4a3687b59ed0f2abcbcc.jpg', 'D://upload//180415010544444505b49b19617489dbaf175cc8eccea3b.jpg', 'M', 4000, 14000, 'Y', 'Y', 'N');

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
(1, 5, 8, 5, 4, 1, '2018-04-08', 28, 1),
(2, 2, 8, 3, 1, 1, '2018-04-08', 28, 2),
(4, 2, 12, 6, 6, 1, '2018-04-08', 28, 4),
(5, 5, 13, 6, 5, 1, '2018-04-08', 28, 5),
(6, 3, 10, 6, 3, 1, '2018-04-15', 28, 6),
(7, 2, 5, 2, 6, 1, '2018-04-15', 28, 7);

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
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`add_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `card_details`
--
ALTER TABLE `card_details`
  ADD PRIMARY KEY (`card_id`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `ordertracker`
--
ALTER TABLE `ordertracker`
  ADD PRIMARY KEY (`tracker_id`);

--
-- Indexes for table `order_address`
--
ALTER TABLE `order_address`
  ADD PRIMARY KEY (`add_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`);

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
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `add_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `card_details`
--
ALTER TABLE `card_details`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  MODIFY `oca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ordertracker`
--
ALTER TABLE `ordertracker`
  MODIFY `tracker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `order_address`
--
ALTER TABLE `order_address`
  MODIFY `add_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `otp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product_details_female_attributes`
--
ALTER TABLE `product_details_female_attributes`
  MODIFY `attr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `product_details_male_attributes`
--
ALTER TABLE `product_details_male_attributes`
  MODIFY `attr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product_details_table`
--
ALTER TABLE `product_details_table`
  MODIFY `p_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `product_review_table`
--
ALTER TABLE `product_review_table`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_table`
--
ALTER TABLE `product_table`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
