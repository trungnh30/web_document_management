-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2019 at 03:49 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `main_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `testlist_document`
--

CREATE TABLE `testlist_document` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `banhanh` datetime(6) DEFAULT NULL,
  `toihan` datetime(6) NOT NULL,
  `version` decimal(3,1) DEFAULT NULL,
  `id_folder_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testlist_document`
--

INSERT INTO `testlist_document` (`id`, `title`, `pdf`, `author`, `banhanh`, `toihan`, `version`, `id_folder_id`) VALUES
(1, '15hdgs11-HDCV phát hiện và kiểm tra cảnh báo lỗi ACCESS CRC', '15hdgs11-HDCV phát hiện và kiểm tra cảnh báo lỗi ACCESS CRC', 'Tùng Phạm', '2019-09-01 00:00:00.000000', '2019-09-30 00:00:00.000000', '1.1', 9),
(2, '25hdgs11-HDCV Phát hiện và kiểm tra cảnh báo CPU Process trên Switch Huawei', '25hdgs11-HDCV Phát hiện và kiểm tra cảnh báo CPU Process trên Switch Huawei', 'Minh Nguyễn', '2019-09-02 00:00:00.000000', '2019-09-29 00:00:00.000000', '1.1', 13),
(3, '31hdgs11-HDCV Phát hiện và kiểm tra cảnh báo lỗi CPU process với OLT', '31hdgs11-HDCV Phát hiện và kiểm tra cảnh báo lỗi CPU process với OLT', 'Đức Trần', '2019-09-03 00:00:00.000000', '2019-09-28 00:00:00.000000', '1.2', 18),
(4, '26hdgs11-HDCV Phát hiện và kiểm tra cảnh báo full traffic trên Switch Huawei', '26hdgs11-HDCV Phát hiện và kiểm tra cảnh báo full traffic trên Switch Huawei', 'Anh Phạm', '2019-09-04 00:00:00.000000', '2019-09-27 00:00:00.000000', '1.2', 21),
(5, '01hdcl11-HDCV Bao cao ca truc', '01hdcl11-HDCV Bao cao ca truc', 'Minh Nguyễn', '2019-09-02 00:00:00.000000', '2019-09-29 00:00:00.000000', '1.1', 19),
(6, '22hdgs10-HDCV phát hiện và kiểm tra cảnh báo lỗi nguồn trên UPE Juniper MX104', '22hdgs10-HDCV phát hiện và kiểm tra cảnh báo lỗi nguồn trên UPE Juniper MX104', 'Minh Nguyễn', '2019-09-02 00:00:00.000000', '2019-09-29 00:00:00.000000', '1.1', 26),
(7, '25hdgs11-HDCV Phát hiện và kiểm tra cảnh báo CPU Process trên Switch Huawei', '25hdgs11-HDCV Phát hiện và kiểm tra cảnh báo CPU Process trên Switch Huawei', 'Minh Nguyễn', '2019-09-02 00:00:00.000000', '2019-09-29 00:00:00.000000', '1.1', 32),
(8, '23hdgs10-HDCV phát hiện và kiểm tra cảnh báo FAN trên thiết bị Access', '23hdgs10-HDCV phát hiện và kiểm tra cảnh báo FAN trên thiết bị Access', 'Minh Nguyễn', '2019-09-02 00:00:00.000000', '2019-09-29 00:00:00.000000', '1.1', 37),
(9, '30hdgs11-HDCV Phát hiện và kiểm tra cảnh báo lỗi  Port CRC,Down trên OLT', '30hdgs11-HDCV Phát hiện và kiểm tra cảnh báo lỗi  Port CRC,Down trên OLT', 'Minh Nguyễn', '2019-09-02 00:00:00.000000', '2019-09-29 00:00:00.000000', '1.1', 38);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `testlist_document`
--
ALTER TABLE `testlist_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testlist_document_id_folder_id_920d5058_fk_testlist_folder_id` (`id_folder_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `testlist_document`
--
ALTER TABLE `testlist_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `testlist_document`
--
ALTER TABLE `testlist_document`
  ADD CONSTRAINT `testlist_document_id_folder_id_920d5058_fk_testlist_folder_id` FOREIGN KEY (`id_folder_id`) REFERENCES `testlist_folder` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
