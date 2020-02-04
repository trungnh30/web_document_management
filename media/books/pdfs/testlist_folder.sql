-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2019 at 03:12 PM
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
-- Table structure for table `testlist_folder`
--

CREATE TABLE `testlist_folder` (
  `id` int(11) NOT NULL,
  `ten_Folder` varchar(255) NOT NULL,
  `parent_ID_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testlist_folder`
--

INSERT INTO `testlist_folder` (`id`, `ten_Folder`, `parent_ID_id`) VALUES
(1, 'STQT Chất lượng', NULL),
(2, 'STQT Đào tạo', NULL),
(3, 'STQT Giám sát hệ thống', NULL),
(4, 'STQT Khôi phục dịch vụ', NULL),
(5, 'STQT Phát triển công cụ', NULL),
(6, 'STQT Triển khai dịch vụ', NULL),
(7, 'STQT VOIP', NULL),
(8, 'Khác', NULL),
(9, 'Hướng dẫn công việc', 1),
(10, 'Quy định', 1),
(11, 'Quy trình', 1),
(12, 'Biểu mẩu', 1),
(13, 'Quy định', 2),
(14, 'MTQT', 2),
(15, 'Hướng dẫn công việc', 2),
(16, 'Biểu mẫu', 2),
(17, 'Tài liệu đào tạo', 2),
(18, 'Khác', 2),
(19, 'Quy trình', 3),
(20, 'Hướng dẫn công việc', 3),
(21, 'Biểu mẫu', 3),
(22, 'Danh mục', 3),
(23, 'Mô tả công việc', 3),
(24, 'Tài liệu chưa ban hành', 3),
(25, 'Khác', 3),
(26, 'Quy trình', 4),
(27, 'Hướng dẫn công việc', 4),
(28, 'Biểu mẫu', 4),
(29, 'Quy trình', 4),
(30, 'Mô tả công việc', 4),
(31, 'Tài liệu chưa ban hành', 4),
(32, 'Biểu mẫu', 5),
(33, 'Quy định', 5),
(34, 'Quy trình', 5),
(35, 'Hướng dẫn công việc', 5),
(36, 'Khác', 5),
(37, 'Hướng dẫn công việc', 6),
(38, 'Quy trình', 7),
(39, 'Hướng dẫn công việc', 7),
(40, 'Biểu mẫu', 7),
(41, 'Core', 20),
(42, 'Access', 20),
(43, 'Truyền dẫn', 20),
(44, 'PayTV', 20),
(45, 'FPlay', 20),
(46, 'FCAM', 20),
(47, 'Voice', 20),
(48, 'SIS', 20),
(49, 'AAG', 41),
(50, 'CPU FPC', 41),
(51, 'CPU Process', 41),
(52, 'CRC', 41),
(53, 'DDOS', 41),
(54, 'Down ISIS', 41),
(55, 'Down port', 41),
(56, 'Kibana', 41),
(57, 'Lỗi card RE', 41),
(58, 'Lỗi công suất', 41),
(59, 'Lỗi CRC interface B2B trên thiết bị BRAS', 41),
(60, 'Lỗi nguồn', 41),
(61, 'Memory', 41),
(62, 'Nghẽn B2B trên thiết bị BRAS', 41),
(63, 'Nghẽn trên thiết bị CORE', 41),
(64, 'Nhiệt độ', 41),
(65, 'Nhóm thiết bị cisco', 41),
(66, 'Pool', 41),
(67, 'Thiết bị MX down', 41),
(68, 'Access Card DSLAM Down', 42),
(69, 'Access Down', 42),
(70, 'Access Power', 42),
(71, 'Cảnh báo FAN', 42),
(72, 'Card FPC nhiệt độ cao', 42),
(73, 'Chất lượng kết nối Internet', 42),
(74, 'Chất lượng kế nối truyền hình', 42),
(75, 'Công suất phát', 42),
(76, 'CPU', 42),
(77, 'CPU FPC', 42),
(78, 'CPU Process trên HW', 42),
(79, 'CPU Process trên MX104', 42),
(80, 'CPU Process trên OLT', 42),
(81, 'CRC', 42),
(82, 'DNS', 42),
(83, 'DOWN BG', 42),
(84, 'Full traffic trên HW', 42),
(85, 'IPMS', 42),
(86, 'Kết nối Internet', 42),
(87, 'Kết nối nhầm core switch Huawei', 42),
(88, 'Lỗi nguồn', 42),
(89, 'Lỗi nguồn Enatel và Eaton', 42),
(90, 'Memory', 42),
(91, 'Module PON TX Power Low trên OLT', 42),
(92, 'Module power fail trên HW', 42),
(93, 'Module power trên OLT', 42),
(94, 'Nghẽn traffic', 42),
(95, 'Nguồn down', 42),
(96, 'Nhiệt độ', 42),
(97, 'Port CRC down trên HW', 42),
(98, 'Port CRC down trên OLT', 42),
(99, 'Port down', 42),
(100, 'Port suy hao', 42),
(101, 'RE_Linecard status', 42),
(102, 'TEMP trên MX104', 42),
(103, 'Traffic full trên OLT', 42),
(104, 'AC warning', 46),
(105, 'Card downs', 46),
(106, 'Card high temperature', 46),
(107, 'CPU', 46),
(108, 'CPU Process', 46),
(109, 'CRC', 46),
(110, 'CRC or Down port', 46),
(111, 'Device down', 46),
(112, 'Fan', 46),
(113, 'FULL traffic', 46),
(114, 'GCOM OLT', 46),
(115, 'High temperature', 46),
(116, 'OLT card', 46),
(117, 'OLT full traffic', 46),
(118, 'OLT PON', 46),
(119, 'POP AC power', 46),
(120, 'Power module', 46),
(121, 'Power module fail', 46),
(122, 'Transmission site', 46),
(123, 'TX power', 46),
(124, 'Giám sát kênh truyền hình', 45),
(125, 'Lỗi kênh truyền hình OTT', 45),
(126, 'Port kết nối đến server', 45),
(127, 'Truyền dẫn FPLAY', 45),
(129, 'Network', 44),
(130, 'PayTV-GPKT', 44),
(131, 'Switch Juniper EX2300', 44),
(132, 'Giám sát hệ thống SIS', 48),
(133, 'CONT/ VP tuyến trục', 43),
(134, 'Control plane', 43),
(135, 'DWDM trục chính', 43),
(136, 'Ring AAG', 43),
(137, 'Ring China', 43),
(138, 'Ring Miền Tây - FCAM', 43),
(139, 'SDH', 43),
(140, 'Suy hao cáp', 43),
(141, 'TDMOIP', 43),
(142, 'Tuyến trục đồng thiết bị BKE3', 43),
(143, 'Cisco Call Center', 47),
(144, 'Core tổng đài', 47),
(145, 'Cuộc gọi tăng đột ngột', 47),
(146, 'End2End', 47),
(147, 'Gateway', 47),
(148, 'GW3845', 47),
(149, 'SBC', 47),
(150, 'SS7', 47),
(151, 'Switch', 47);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `testlist_folder`
--
ALTER TABLE `testlist_folder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testlist_folder_parent_ID_id_10cfcaa5_fk_testlist_folder_id` (`parent_ID_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `testlist_folder`
--
ALTER TABLE `testlist_folder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `testlist_folder`
--
ALTER TABLE `testlist_folder`
  ADD CONSTRAINT `testlist_folder_parent_ID_id_10cfcaa5_fk_testlist_folder_id` FOREIGN KEY (`parent_ID_id`) REFERENCES `testlist_folder` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
