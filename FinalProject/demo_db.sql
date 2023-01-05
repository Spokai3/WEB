-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2022 at 04:47 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `image_library`
--

CREATE TABLE `image_library` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image_library`
--

INSERT INTO `image_library` (`id`, `product_id`, `path`, `created_time`, `last_updated`) VALUES
(73, 26, '/uploads/27-03-2022/iphone-13-mini-blue-2-600x600.jpg', 1648410084, 1648410084),
(74, 73, '/uploads/27-03-2022/iphone-13-mini-blue-2-600x600(1).jpg', 1648410101, 1648410101),
(75, 74, '/uploads/27-03-2022/iphone-13-pro-max-gold-1-600x600.jpg', 1648410324, 1648410324),
(76, 75, '/uploads/27-03-2022/iphone-se-128gb-2020-do-600x600(1).jpg', 1648410449, 1648410449),
(77, 76, '/uploads/27-03-2022/Nokia_g10_xanh_duong-600x600.jpg', 1648410572, 1648410572),
(78, 77, '/uploads/27-03-2022/nokia-215-xanh-ngoc-new-600x600-600x600(1).jpg', 1648410606, 1648410606),
(79, 78, '/uploads/27-03-2022/nokia-c20-vang-1-600x600(1).jpg', 1648410648, 1648410648),
(80, 79, '/uploads/27-03-2022/nokia-c30-xanh-la-600x600(1).jpg', 1648410729, 1648410729),
(81, 80, '/uploads/27-03-2022/oppo-a95-4g-bac-2-600x600(1).jpg', 1648410758, 1648410758),
(82, 81, '/uploads/27-03-2022/oppo-find-x3-pro-blue-001-600x600(1).jpg', 1648410843, 1648410843),
(83, 82, '/uploads/27-03-2022/oppo-reno5-5g-thumb-600x600(1).jpg', 1648410898, 1648410898),
(84, 83, '/uploads/27-03-2022/oppo-reno6-5g-black-600x600(1).jpg', 1648410957, 1648410957),
(85, 84, '/uploads/27-03-2022/samsung_galaxy-S22-Black-600x600.jpg', 1648411048, 1648411048),
(86, 85, '/uploads/27-03-2022/samsung-galaxy-a52-8gb-256gb-thumb-blue-600x600-600x600(1).jpg', 1648411119, 1648411119),
(87, 86, '/uploads/27-03-2022/samsung-galaxy-note-20-062220-122200-fix-600x600(1).jpg', 1648411192, 1648411192),
(88, 87, '/uploads/27-03-2022/samsung-galaxy-z-fold-3-silver-1-600x600(1).jpg', 1648411235, 1648411235),
(89, 88, '/uploads/27-03-2022/xiaomi-11-lite-5g-ne-black-600x600(1).jpg', 1648411261, 1648411261),
(90, 89, '/uploads/27-03-2022/Xiaomi-11T-White-1-2-3-600x600.jpg', 1648411312, 1648411312),
(91, 90, '/uploads/27-03-2022/xiaomi-redmi-9c-3gb-xam-600x600(1).jpg', 1648411358, 1648411358),
(92, 91, '/uploads/27-03-2022/Xiaomi-redmi-note-11-black-600x600(1).jpeg', 1648411389, 1648411389);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL,
  `link` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `note` text NOT NULL,
  `total` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone`, `address`, `note`, `total`, `created_time`, `last_updated`) VALUES
(36, 'Bồ Anh Kiệt', '0932726034', '36 tran ke xuong ', 'hahaha', 18290000, 1648282923, 1648282923);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_time`, `last_updated`) VALUES
(28, 36, 26, 1, 18290000, 1648282923, 1648282923);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `content` text NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `content`, `created_time`, `last_updated`) VALUES
(26, 'Iphone 13 Mini Blue', '/uploads/27-03-2022/iphone-13-mini-blue-2-600x600(1).jpg', 18990000, '<p>Iphone 13 Mini Blue 128GB</p>\r\n', 1620986043, 1648410209),
(74, 'Iphone 13 Promax Gold', '/uploads/27-03-2022/iphone-13-pro-max-gold-1-600x600(1).jpg', 29790000, '', 1648410324, 1648410376),
(75, 'iphone SE 2020', '/uploads/27-03-2022/iphone-se-128gb-2020-do-600x600.jpg', 6390000, '', 1648410449, 1648410509),
(76, 'NOKIA G10 5G', '/uploads/27-03-2022/Nokia_g10_xanh_duong-600x600.jpg', 3190000, '', 1648410572, 1648410684),
(77, 'NOKIA 215 4G', '/uploads/27-03-2022/nokia-215-xanh-ngoc-new-600x600-600x600.jpg', 900000, '', 1648410606, 1648410663),
(78, 'NOKIA C20 2G', '/uploads/27-03-2022/nokia-c20-vang-1-600x600.jpg', 1879000, '', 1648410648, 1648410648),
(79, 'NOKIA C30', '/uploads/27-03-2022/nokia-c30-xanh-la-600x600.jpg', 2900000, '', 1648410729, 1648410729),
(80, 'OPPO A95', '/uploads/27-03-2022/oppo-a95-4g-bac-2-600x600.jpg', 5590000, '', 1648410758, 1648410758),
(81, 'OPPO FIND X3 PRO 5G', '/uploads/27-03-2022/oppo-find-x3-pro-blue-001-600x600.jpg', 18990000, '', 1648410843, 1648410843),
(82, 'OPPO RENO5 5G', '/uploads/27-03-2022/oppo-reno5-5g-thumb-600x600.jpg', 4290000, '', 1648410898, 1648410966),
(83, 'OPPO RENO6 5G', '/uploads/27-03-2022/oppo-reno6-5g-black-600x600.jpg', 11390000, '', 1648410957, 1648410957),
(84, 'Samsung Galaxy S22', '/uploads/27-03-2022/samsung_galaxy-S22-Black-600x600.jpg', 21990000, '', 1648411048, 1648411048),
(85, 'Samsung Galaxy A52', '/uploads/27-03-2022/samsung-galaxy-a52-8gb-256gb-thumb-blue-600x600-600x600.jpg', 7390000, '', 1648411119, 1648411119),
(86, 'Samsung Galaxy Note 20', '/uploads/27-03-2022/samsung-galaxy-note-20-062220-122200-fix-600x600.jpg', 15990000, '', 1648411192, 1648411192),
(87, 'Samsung Galaxy Z Fold3', '/uploads/27-03-2022/samsung-galaxy-z-fold-3-silver-1-600x600.jpg', 33990000, '', 1648411235, 1648411235),
(88, 'Xiaomi Mi 11 Lite', '/uploads/27-03-2022/xiaomi-11-lite-5g-ne-black-600x600.jpg', 7790000, '', 1648411261, 1648411261),
(89, 'Xiaomi 11T ', '/uploads/27-03-2022/Xiaomi-11T-White-1-2-3-600x600(1).jpg', 8990000, '', 1648411312, 1648411321),
(90, 'Xiaomi Redmi 9C', '/uploads/27-03-2022/xiaomi-redmi-9c-3gb-xam-600x600.jpg', 2900000, '', 1648411358, 1648411358),
(91, 'Xiaomi Redmi Note 11', '/uploads/27-03-2022/Xiaomi-redmi-note-11-black-600x600.jpeg', 5490000, '', 1648411389, 1648411389);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `birthday` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `fullname`, `password`, `birthday`, `created_time`, `last_updated`) VALUES
(2, 'admin', 'haongthien', 'e807f1fcf82d132f9bb018ca6738a19f', 0, 0, 0),
(3, 'admin1', 'AnhKiet', 'e10adc3949ba59abbe56e057f20f883e', 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `image_library`
--
ALTER TABLE `image_library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `image_library`
--
ALTER TABLE `image_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
