-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2021 at 12:22 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbclientshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `purchase_detail`
--

CREATE TABLE `purchase_detail` (
  `pd_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `pprice` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` date NOT NULL,
  `pinvoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_detail`
--

INSERT INTO `purchase_detail` (`pd_id`, `item_id`, `pprice`, `qty`, `total`, `date`, `pinvoice_id`) VALUES
(1, 1, 1000, 20, 20000, '2021-12-21', 1),
(2, 2, 16000, 5, 80000, '2021-12-25', 2);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoice`
--

CREATE TABLE `purchase_invoice` (
  `pinvoice_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subamount` int(11) NOT NULL,
  `bill` int(11) NOT NULL,
  `date` date NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `received` int(11) NOT NULL,
  `othercharges` int(11) NOT NULL,
  `due` int(11) NOT NULL,
  `paymentmethod` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_invoice`
--

INSERT INTO `purchase_invoice` (`pinvoice_id`, `user_id`, `qty`, `subamount`, `bill`, `date`, `supplier_id`, `received`, `othercharges`, `due`, `paymentmethod`) VALUES
(1, 1, 20, 20000, 20100, '2021-12-21', 1, 20100, 100, 0, 'cash'),
(2, 1, 5, 80000, 80000, '2021-12-25', 1, 80000, 0, 0, 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `sale_detail`
--

CREATE TABLE `sale_detail` (
  `sd_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `sprice` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` date NOT NULL,
  `sinvoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sale_detail`
--

INSERT INTO `sale_detail` (`sd_id`, `item_id`, `sprice`, `qty`, `total`, `date`, `sinvoice_id`) VALUES
(1, 1, 1200, 5, 6000, '2021-12-22', 1),
(2, 1, 1200, 5, 6000, '2021-12-24', 2),
(3, 1, 1100, 5, 5500, '2021-12-25', 3),
(4, 2, 165000, 3, 495000, '2021-12-26', 4);

-- --------------------------------------------------------

--
-- Table structure for table `sale_invoice`
--

CREATE TABLE `sale_invoice` (
  `sinvoice_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `bill` int(11) NOT NULL,
  `date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `received` int(11) NOT NULL,
  `othercharges` int(11) NOT NULL,
  `due` int(11) NOT NULL,
  `paymentmethod` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sale_invoice`
--

INSERT INTO `sale_invoice` (`sinvoice_id`, `user_id`, `qty`, `bill`, `date`, `customer_id`, `received`, `othercharges`, `due`, `paymentmethod`) VALUES
(1, 1, 5, 6020, '2021-12-22', 1, 6020, 0, 0, 'cash'),
(2, 1, 5, 6100, '2021-12-24', 1, 6100, 0, 0, 'cash'),
(3, 1, 5, 5600, '2021-12-25', 1, 5600, 0, 0, 'cash'),
(4, 1, 3, 495000, '2021-12-26', 1, 494000, 0, 1000, 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `tblbranch`
--

CREATE TABLE `tblbranch` (
  `branch_id` int(11) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblbranch`
--

INSERT INTO `tblbranch` (`branch_id`, `branch`, `status`) VALUES
(1, 'Korangi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblbrand`
--

CREATE TABLE `tblbrand` (
  `brand_id` int(11) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `user_id` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblbrand`
--

INSERT INTO `tblbrand` (`brand_id`, `brand`, `description`, `status`, `user_id`, `create_by`, `date`, `branch_id`) VALUES
(1, 'Longines', '', 1, 1, 1, '2021-12-21', 1),
(2, 'HP', '', 1, 1, 1, '2021-12-23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `cat_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `user_id` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`cat_id`, `category`, `description`, `status`, `user_id`, `create_by`, `date`, `branch_id`) VALUES
(1, 'Watch', '', 1, 1, 1, '2021-12-21', 1),
(2, 'Laptop', '', 1, 1, 1, '2021-12-23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gst` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `openbal` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postcode` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`customer_id`, `name`, `phone`, `email`, `gst`, `tax`, `openbal`, `country`, `state`, `city`, `postcode`, `address`, `branch_id`, `user_id`, `date`, `status`) VALUES
(1, 'Ashhar Ahmed', '03201277891', 'ashhar@gmail.com', 390, 258, 5000, '', '', 'Katachi', 20, 'Landhi 6 5C Bilal Masjid', 1, 1, '2021-12-21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblexpense`
--

CREATE TABLE `tblexpense` (
  `exp_id` int(11) NOT NULL,
  `exp_date` date NOT NULL,
  `expense` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `cat_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblitem`
--

CREATE TABLE `tblitem` (
  `item_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `sko` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `lot_no` varchar(50) NOT NULL,
  `hsn` varchar(50) NOT NULL,
  `exp_date` date NOT NULL,
  `barcode` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL,
  `rate` varchar(50) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax_type` varchar(50) NOT NULL,
  `purchase_price` int(11) NOT NULL,
  `final_price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `profit` decimal(10,0) NOT NULL,
  `current_open` int(11) NOT NULL,
  `adjust_stock` int(11) NOT NULL,
  `adjust_note` varchar(1000) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `user_id` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `date` date NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblitem`
--

INSERT INTO `tblitem` (`item_id`, `name`, `brand_id`, `cat_id`, `unit_id`, `sko`, `qty`, `lot_no`, `hsn`, `exp_date`, `barcode`, `description`, `image`, `price`, `rate`, `tax_id`, `tax_type`, `purchase_price`, `final_price`, `sale_price`, `profit`, `current_open`, `adjust_stock`, `adjust_note`, `status`, `user_id`, `create_by`, `date`, `branch_id`) VALUES
(1, 'Longines Steel Watch', 1, 1, 1, '', 20, '', '', '0000-00-00', 0, '', 'R.jpg', 1000, '', 0, '', 0, 0, 0, '0', 0, 5, '', 1, 1, 1, '2021-12-21', 1),
(2, 'HP Laptop', 2, 2, 1, '', 5, '', '', '2021-12-24', 0, '', '', 15000, '', 1, 'Exclusive', 0, 0, 0, '0', 0, 2, '', 1, 1, 1, '2021-12-23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblrole`
--

CREATE TABLE `tblrole` (
  `role_id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblrole`
--

INSERT INTO `tblrole` (`role_id`, `role`, `status`) VALUES
(1, 'Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsupplier`
--

CREATE TABLE `tblsupplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gst` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `openbal` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postcode` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblsupplier`
--

INSERT INTO `tblsupplier` (`supplier_id`, `name`, `phone`, `email`, `gst`, `tax`, `openbal`, `country`, `state`, `city`, `postcode`, `address`, `branch_id`, `user_id`, `date`, `status`) VALUES
(1, 'Muhammad Yousuf', '03122323489', 'm.yousuf@hotmail.com', 640, 209, 30000, '', '', 'Karachi', 90, 'Landhi Khurram Abad Double Road Street 4 House 2', 0, 0, '2021-12-21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbltax`
--

CREATE TABLE `tbltax` (
  `tax_id` int(11) NOT NULL,
  `tax` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `tax_perc` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `date` date NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbltax`
--

INSERT INTO `tbltax` (`tax_id`, `tax`, `status`, `tax_perc`, `user_id`, `create_by`, `date`, `branch_id`) VALUES
(1, 'SGST 9%', 1, '9.00', 1, 1, '2021-09-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblunit`
--

CREATE TABLE `tblunit` (
  `unit_id` int(11) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `description` varchar(1000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `date` date NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblunit`
--

INSERT INTO `tblunit` (`unit_id`, `unit`, `status`, `description`, `user_id`, `create_by`, `date`, `branch_id`) VALUES
(1, 'Pieces', 1, 'Pieces Information', 1, 1, '2021-09-13', 1),
(2, 'LTR', 1, 'LTR Information', 1, 1, '2021-09-20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `role_id` int(11) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`user_id`, `name`, `username`, `password`, `status`, `role_id`, `image`, `email`, `phone`, `date`, `branch_id`) VALUES
(1, 'Rameez Ahmed', 'rameezahmed.rd', '23092309', 1, 1, 'IMG-20180822-WA0018.jpg', 'rameezahmed.rd@gmail.com', '03048936049', '2021-09-13', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `purchase_detail`
--
ALTER TABLE `purchase_detail`
  ADD PRIMARY KEY (`pd_id`);

--
-- Indexes for table `purchase_invoice`
--
ALTER TABLE `purchase_invoice`
  ADD PRIMARY KEY (`pinvoice_id`);

--
-- Indexes for table `sale_detail`
--
ALTER TABLE `sale_detail`
  ADD PRIMARY KEY (`sd_id`);

--
-- Indexes for table `sale_invoice`
--
ALTER TABLE `sale_invoice`
  ADD PRIMARY KEY (`sinvoice_id`);

--
-- Indexes for table `tblbranch`
--
ALTER TABLE `tblbranch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `tblbrand`
--
ALTER TABLE `tblbrand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tblexpense`
--
ALTER TABLE `tblexpense`
  ADD PRIMARY KEY (`exp_id`);

--
-- Indexes for table `tblitem`
--
ALTER TABLE `tblitem`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `tblrole`
--
ALTER TABLE `tblrole`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `tbltax`
--
ALTER TABLE `tbltax`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `tblunit`
--
ALTER TABLE `tblunit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `purchase_detail`
--
ALTER TABLE `purchase_detail`
  MODIFY `pd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_invoice`
--
ALTER TABLE `purchase_invoice`
  MODIFY `pinvoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sale_detail`
--
ALTER TABLE `sale_detail`
  MODIFY `sd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sale_invoice`
--
ALTER TABLE `sale_invoice`
  MODIFY `sinvoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblbranch`
--
ALTER TABLE `tblbranch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbrand`
--
ALTER TABLE `tblbrand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblexpense`
--
ALTER TABLE `tblexpense`
  MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblitem`
--
ALTER TABLE `tblitem`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblrole`
--
ALTER TABLE `tblrole`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbltax`
--
ALTER TABLE `tbltax`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblunit`
--
ALTER TABLE `tblunit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
