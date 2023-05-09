-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2023 at 07:26 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baschet`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(15) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_desc` varchar(255) NOT NULL,
  `price` int(10) NOT NULL,
  `units` int(5) NOT NULL,
  `total` int(15) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_code`, `product_name`, `product_desc`, `price`, `units`, `total`, `date`, `email`) VALUES
(23, 'Spalding3', 'STRANGER THINGS GREETINGS', 'We are not in Hawkins anymore! This Spalding x Stranger Things Greetings Basketball is designed to transport you to SoCal and have you Cali Dreaming, ready to tackle the Upside Down yet again.', 85, 1, 85, '2023-01-11 22:13:37', 'admin@admin.com'),
(22, 'Spalding2', 'THE BEAST PORTABLE BASKETBALL HOOP', 'The only portable system of its size, The Beast Portable Basketball Hoop gives you the stability of an in-ground, but with a wheeled base that makes it easy to move. The 72\" backboard gives you the true rebound.', 1800, 1, 1800, '2023-01-11 22:13:37', 'admin@admin.com'),
(21, 'Spalding1', 'LEGACY TF-1000 BASKETBALL', 'Built for the most clutch moments, the Spalding LEGACY TF-1000 has no equal. It s NFHS approved and used by some of the top college and high school programs in the country. From tip off to buzzer, the game is in your hands.', 40, 1, 40, '2023-01-03 14:05:28', 'admin@admin.com'),
(20, 'Spalding1', 'LEGACY TF-1000 BASKETBALL', 'Built for the most clutch moments, the Spalding LEGACY TF-1000 has no equal. It s NFHS approved and used by some of the top college and high school programs in the country. From tip off to buzzer, the game is in your hands.', 40, 3, 120, '2022-12-14 17:35:43', 'cristi.calinescu31@gmail.com'),
(19, 'Spalding2', 'THE BEAST PORTABLE BASKETBALL HOOP', 'The only portable system of its size, The Beast Portable Basketball Hoop gives you the stability of an in-ground, but with a wheeled base that makes it easy to move. The 72\" backboard gives you the true rebound.', 1800, 1, 1800, '2022-12-14 17:35:43', 'cristi.calinescu31@gmail.com'),
(18, 'Spalding3', 'STRANGER THINGS GREETINGS', 'We are not in Hawkins anymore! This Spalding x Stranger Things Greetings Basketball is designed to transport you to SoCal and have you Cali Dreaming, ready to tackle the Upside Down yet again.', 85, 1, 85, '2022-12-14 17:35:43', 'cristi.calinescu31@gmail.com'),
(24, 'Spalding1', 'LEGACY TF-1000 BASKETBALL', 'Built for the most clutch moments, the Spalding LEGACY TF-1000 has no equal. It s NFHS approved and used by some of the top college and high school programs in the country. From tip off to buzzer, the game is in your hands.', 40, 1, 40, '2023-05-09 17:19:10', 'admin@admin.com');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_code` varchar(60) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_desc` tinytext NOT NULL,
  `product_img_name` varchar(60) NOT NULL,
  `qty` int(5) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_desc`, `product_img_name`, `qty`, `price`) VALUES
(1, 'Spalding1', 'LEGACY TF-1000 BASKETBALL', 'Built for the most clutch moments, the Spalding LEGACY TF-1000 has no equal. It s NFHS approved and used by some of the top college and high school programs in the country. From tip off to buzzer, the game is in your hands.', 'minge_baschet.jpg', 57, '40.00'),
(2, 'Spalding2', 'THE BEAST PORTABLE BASKETBALL HOOP', 'The only portable system of its size, The Beast Portable Basketball Hoop gives you the stability of an in-ground, but with a wheeled base that makes it easy to move. The 72\" backboard gives you the true rebound.', 'cos_baschet.jpg', 10, '1800.00'),
(3, 'Spalding3', 'STRANGER THINGS GREETINGS', 'We are not in Hawkins anymore! This Spalding x Stranger Things Greetings Basketball is designed to transport you to SoCal and have you Cali Dreaming, ready to tackle the Upside Down yet again.', 'minge_baschet2.jpg', 34, '85.00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pin` int(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(15) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `address`, `city`, `pin`, `email`, `password`, `type`) VALUES
(1, 'Admin', 'Admin', 'Adresa mea', 'Orasul meu', 0, 'admin@admin.com', 'admin', 'admin'),
(6, 'Cristi', 'Calinescu', 'Strada Gib MihÄƒescu 3, bl.A, sc.D, ap.1', 'DrÄƒgÄƒÈ™ani', 245700, 'cristi.calinescu31@gmail.com', '123456', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`product_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
