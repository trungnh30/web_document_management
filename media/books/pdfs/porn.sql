-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2019 at 11:21 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `myscc3`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add danh muc loi', 7, 'add_danhmucloi'),
(26, 'Can change danh muc loi', 7, 'change_danhmucloi'),
(27, 'Can delete danh muc loi', 7, 'delete_danhmucloi'),
(28, 'Can view danh muc loi', 7, 'view_danhmucloi'),
(29, 'Can add document now', 8, 'add_documentnow'),
(30, 'Can change document now', 8, 'change_documentnow'),
(31, 'Can delete document now', 8, 'delete_documentnow'),
(32, 'Can view document now', 8, 'view_documentnow'),
(33, 'Can add mang', 9, 'add_mang'),
(34, 'Can change mang', 9, 'change_mang'),
(35, 'Can delete mang', 9, 'delete_mang'),
(36, 'Can view mang', 9, 'view_mang'),
(37, 'Can add voip', 10, 'add_voip'),
(38, 'Can change voip', 10, 'change_voip'),
(39, 'Can delete voip', 10, 'delete_voip'),
(40, 'Can view voip', 10, 'view_voip'),
(41, 'Can add train', 11, 'add_train'),
(42, 'Can change train', 11, 'change_train'),
(43, 'Can delete train', 11, 'delete_train'),
(44, 'Can view train', 11, 'view_train'),
(45, 'Can add supervise', 12, 'add_supervise'),
(46, 'Can change supervise', 12, 'change_supervise'),
(47, 'Can delete supervise', 12, 'delete_supervise'),
(48, 'Can view supervise', 12, 'view_supervise'),
(49, 'Can add restore', 13, 'add_restore'),
(50, 'Can change restore', 13, 'change_restore'),
(51, 'Can delete restore', 13, 'delete_restore'),
(52, 'Can view restore', 13, 'view_restore'),
(53, 'Can add quality', 14, 'add_quality'),
(54, 'Can change quality', 14, 'change_quality'),
(55, 'Can delete quality', 14, 'delete_quality'),
(56, 'Can view quality', 14, 'view_quality'),
(57, 'Can add hr', 15, 'add_hr'),
(58, 'Can change hr', 15, 'change_hr'),
(59, 'Can delete hr', 15, 'delete_hr'),
(60, 'Can view hr', 15, 'view_hr'),
(61, 'Can add hdcv', 16, 'add_hdcv'),
(62, 'Can change hdcv', 16, 'change_hdcv'),
(63, 'Can delete hdcv', 16, 'delete_hdcv'),
(64, 'Can view hdcv', 16, 'view_hdcv'),
(65, 'Can add develop', 17, 'add_develop'),
(66, 'Can change develop', 17, 'change_develop'),
(67, 'Can delete develop', 17, 'delete_develop'),
(68, 'Can view develop', 17, 'view_develop'),
(69, 'Can add deploy', 18, 'add_deploy'),
(70, 'Can change deploy', 18, 'change_deploy'),
(71, 'Can delete deploy', 18, 'delete_deploy'),
(72, 'Can view deploy', 18, 'view_deploy'),
(73, 'Can add hdc v_ quality', 19, 'add_hdcv_quality'),
(74, 'Can change hdc v_ quality', 19, 'change_hdcv_quality'),
(75, 'Can delete hdc v_ quality', 19, 'delete_hdcv_quality'),
(76, 'Can view hdc v_ quality', 19, 'view_hdcv_quality'),
(77, 'Can add hdcv quality', 19, 'add_hdcvquality'),
(78, 'Can change hdcv quality', 19, 'change_hdcvquality'),
(79, 'Can delete hdcv quality', 19, 'delete_hdcvquality'),
(80, 'Can view hdcv quality', 19, 'view_hdcvquality'),
(81, 'Can add hdcv voip', 20, 'add_hdcvvoip'),
(82, 'Can change hdcv voip', 20, 'change_hdcvvoip'),
(83, 'Can delete hdcv voip', 20, 'delete_hdcvvoip'),
(84, 'Can view hdcv voip', 20, 'view_hdcvvoip'),
(85, 'Can add hdcv train', 21, 'add_hdcvtrain'),
(86, 'Can change hdcv train', 21, 'change_hdcvtrain'),
(87, 'Can delete hdcv train', 21, 'delete_hdcvtrain'),
(88, 'Can view hdcv train', 21, 'view_hdcvtrain'),
(89, 'Can add hdcv restore', 22, 'add_hdcvrestore'),
(90, 'Can change hdcv restore', 22, 'change_hdcvrestore'),
(91, 'Can delete hdcv restore', 22, 'delete_hdcvrestore'),
(92, 'Can view hdcv restore', 22, 'view_hdcvrestore'),
(93, 'Can add hdcvhr', 23, 'add_hdcvhr'),
(94, 'Can change hdcvhr', 23, 'change_hdcvhr'),
(95, 'Can delete hdcvhr', 23, 'delete_hdcvhr'),
(96, 'Can view hdcvhr', 23, 'view_hdcvhr'),
(97, 'Can add hdcv develop', 24, 'add_hdcvdevelop'),
(98, 'Can change hdcv develop', 24, 'change_hdcvdevelop'),
(99, 'Can delete hdcv develop', 24, 'delete_hdcvdevelop'),
(100, 'Can view hdcv develop', 24, 'view_hdcvdevelop'),
(101, 'Can add hdcv deploy', 25, 'add_hdcvdeploy'),
(102, 'Can change hdcv deploy', 25, 'change_hdcvdeploy'),
(103, 'Can delete hdcv deploy', 25, 'delete_hdcvdeploy'),
(104, 'Can view hdcv deploy', 25, 'view_hdcvdeploy');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'testlist', 'danhmucloi'),
(18, 'testlist', 'deploy'),
(17, 'testlist', 'develop'),
(8, 'testlist', 'documentnow'),
(16, 'testlist', 'hdcv'),
(25, 'testlist', 'hdcvdeploy'),
(24, 'testlist', 'hdcvdevelop'),
(23, 'testlist', 'hdcvhr'),
(19, 'testlist', 'hdcvquality'),
(22, 'testlist', 'hdcvrestore'),
(21, 'testlist', 'hdcvtrain'),
(20, 'testlist', 'hdcvvoip'),
(15, 'testlist', 'hr'),
(9, 'testlist', 'mang'),
(14, 'testlist', 'quality'),
(13, 'testlist', 'restore'),
(12, 'testlist', 'supervise'),
(11, 'testlist', 'train'),
(10, 'testlist', 'voip');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-09-10 16:43:16.854926'),
(2, 'auth', '0001_initial', '2019-09-10 16:43:17.222187'),
(3, 'admin', '0001_initial', '2019-09-10 16:43:18.354881'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-09-10 16:43:18.588052'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-09-10 16:43:18.606849'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-09-10 16:43:18.837135'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-09-10 16:43:19.133241'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-09-10 16:43:19.268435'),
(9, 'auth', '0004_alter_user_username_opts', '2019-09-10 16:43:19.286388'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-09-10 16:43:19.393102'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-09-10 16:43:19.400084'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-09-10 16:43:19.419400'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-09-10 16:43:19.598032'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-09-10 16:43:19.727061'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-09-10 16:43:19.855188'),
(16, 'auth', '0011_update_proxy_permissions', '2019-09-10 16:43:19.873211'),
(17, 'sessions', '0001_initial', '2019-09-10 16:43:19.956907'),
(18, 'testlist', '0001_initial', '2019-09-10 16:43:20.929089'),
(19, 'testlist', '0002_auto_20190911_0918', '2019-09-11 02:19:06.530162'),
(20, 'testlist', '0003_auto_20190911_0929', '2019-09-11 02:29:52.267415'),
(21, 'testlist', '0004_auto_20190911_1103', '2019-09-11 04:03:53.695434');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlist_danhmucloi`
--

CREATE TABLE IF NOT EXISTS `testlist_danhmucloi` (
  `id` int(11) NOT NULL,
  `DanhMucLoi` varchar(200) NOT NULL,
  `ID_id` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testlist_danhmucloi`
--

INSERT INTO `testlist_danhmucloi` (`id`, `DanhMucLoi`, `ID_id`) VALUES
(1, 'Cảnh báo FAN', 'ACCESS'),
(2, 'CPU Process trên HW', 'ACCESS'),
(3, 'CPU Process trên OLT', 'ACCESS'),
(4, 'CRC', 'ACCESS'),
(5, 'Lỗi nguồn', 'ACCESS'),
(6, 'Nghẽn B2B trên thiết bị Bras', 'CORE'),
(7, 'Lỗi card RE', 'CORE'),
(8, 'Kibana', 'CORE'),
(9, 'CPU Process', 'CORE'),
(10, 'Lỗi nguồn', 'CORE');

-- --------------------------------------------------------

--
-- Table structure for table `testlist_deploy`
--

CREATE TABLE IF NOT EXISTS `testlist_deploy` (
  `DP` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlist_develop`
--

CREATE TABLE IF NOT EXISTS `testlist_develop` (
  `DV` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlist_documentnow`
--

CREATE TABLE IF NOT EXISTS `testlist_documentnow` (
  `Document` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testlist_documentnow`
--

INSERT INTO `testlist_documentnow` (`Document`) VALUES
('STQT Chất lượng'),
('STQT Giám sát hệ thống'),
('STQT Khôi phục dịch vụ'),
('STQT Nhân sự'),
('STQT Phát triển công cụ'),
('STQT Triển khai dịch vụ'),
('STQT VOIP'),
('STQT Đào tạo');

-- --------------------------------------------------------

--
-- Table structure for table `testlist_hdcv`
--

CREATE TABLE IF NOT EXISTS `testlist_hdcv` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `banhanh` datetime(6) DEFAULT NULL,
  `toihan` datetime(6) NOT NULL,
  `version` decimal(3,1) DEFAULT NULL,
  `ID_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testlist_hdcv`
--

INSERT INTO `testlist_hdcv` (`id`, `title`, `pdf`, `author`, `banhanh`, `toihan`, `version`, `ID_id`) VALUES
(1, '15hdgs11-HDCV phát hiện và kiểm tra cảnh báo lỗi ACCESS CRC', '15hdgs11-HDCV phát hiện và kiểm tra cảnh báo lỗi ACCESS CRC', 'Tùng Phạm', '2019-09-01 00:00:00.000000', '2019-09-30 00:00:00.000000', '1.1', 1),
(2, '25hdgs11-HDCV Phát hiện và kiểm tra cảnh báo CPU Process trên Switch Huawei', '25hdgs11-HDCV Phát hiện và kiểm tra cảnh báo CPU Process trên Switch Huawei', 'Minh Nguyễn', '2019-09-02 00:00:00.000000', '2019-09-29 00:00:00.000000', '1.1', 2),
(3, '31hdgs11-HDCV Phát hiện và kiểm tra cảnh báo lỗi CPU process với OLT', '31hdgs11-HDCV Phát hiện và kiểm tra cảnh báo lỗi CPU process với OLT', 'Đức Trần', '2019-09-03 00:00:00.000000', '2019-09-28 00:00:00.000000', '1.2', 6),
(4, '26hdgs11-HDCV Phát hiện và kiểm tra cảnh báo full traffic trên Switch Huawei', '26hdgs11-HDCV Phát hiện và kiểm tra cảnh báo full traffic trên Switch Huawei', 'Anh Phạm', '2019-09-04 00:00:00.000000', '2019-09-27 00:00:00.000000', '1.2', 7);

-- --------------------------------------------------------

--
-- Table structure for table `testlist_hdcvdeploy`
--

CREATE TABLE IF NOT EXISTS `testlist_hdcvdeploy` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `banhanh` datetime(6) DEFAULT NULL,
  `version` decimal(3,1) DEFAULT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlist_hdcvdevelop`
--

CREATE TABLE IF NOT EXISTS `testlist_hdcvdevelop` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `banhanh` datetime(6) DEFAULT NULL,
  `version` decimal(3,1) DEFAULT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlist_hdcvhr`
--

CREATE TABLE IF NOT EXISTS `testlist_hdcvhr` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `banhanh` datetime(6) DEFAULT NULL,
  `version` decimal(3,1) DEFAULT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlist_hdcvquality`
--

CREATE TABLE IF NOT EXISTS `testlist_hdcvquality` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `banhanh` datetime(6) DEFAULT NULL,
  `version` decimal(3,1) DEFAULT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testlist_hdcvquality`
--

INSERT INTO `testlist_hdcvquality` (`id`, `title`, `pdf`, `author`, `banhanh`, `version`, `ID_id`) VALUES
(1, '01hdcl11-HDCV Bao cao ca truc', '01hdcl11-HDCV Bao cao ca truc', 'Tùng Phạm', '2019-09-18 00:00:00.000000', '1.1', 'Hướng dẫn công việc'),
(2, '04.1bmcl10-Bieu mau Phieu thong tin cong viec ban giao', '04.1bmcl10-Bieu mau Phieu thong tin cong viec ban giao', 'Tùng Phạm', '2019-09-01 00:00:00.000000', '1.2', 'Biểu mẫu'),
(3, '01qtcl10-MTQT Kiem soat thuc hien ke hoach bao tri', '01qtcl10-MTQT Kiem soat thuc hien ke hoach bao tri', 'Tùng Phạm', '2019-09-06 00:00:00.000000', '1.2', 'Quy trình'),
(4, '01qdcl10-Quy dinh Ghi ma so tai lieu noi bo SCC', '01qdcl10-Quy dinh Ghi ma so tai lieu noi bo SCC', 'Tùng Phạm', '2019-09-03 00:00:00.000000', '1.2', 'Quy định'),
(5, '03hdcl10-HDCV Cap quyen cau hinh thiet bi Core', '03hdcl10-HDCV Cap quyen cau hinh thiet bi Core', 'Tùng Phạm', '2019-09-01 00:00:00.000000', '1.2', 'Hướng dẫn công việc');

-- --------------------------------------------------------

--
-- Table structure for table `testlist_hdcvrestore`
--

CREATE TABLE IF NOT EXISTS `testlist_hdcvrestore` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `banhanh` datetime(6) DEFAULT NULL,
  `version` decimal(3,1) DEFAULT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlist_hdcvtrain`
--

CREATE TABLE IF NOT EXISTS `testlist_hdcvtrain` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `banhanh` datetime(6) DEFAULT NULL,
  `version` decimal(3,1) DEFAULT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlist_hdcvvoip`
--

CREATE TABLE IF NOT EXISTS `testlist_hdcvvoip` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `banhanh` datetime(6) DEFAULT NULL,
  `version` decimal(3,1) DEFAULT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlist_hr`
--

CREATE TABLE IF NOT EXISTS `testlist_hr` (
  `HR` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlist_mang`
--

CREATE TABLE IF NOT EXISTS `testlist_mang` (
  `Mang` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testlist_mang`
--

INSERT INTO `testlist_mang` (`Mang`) VALUES
('ACCESS'),
('CORE'),
('FCAM'),
('FPT PLAY'),
('PAYTV'),
('SIS'),
('TRUYỀN DẪN'),
('VOICE');

-- --------------------------------------------------------

--
-- Table structure for table `testlist_quality`
--

CREATE TABLE IF NOT EXISTS `testlist_quality` (
  `Q` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testlist_quality`
--

INSERT INTO `testlist_quality` (`Q`, `Name`, `ID_id`) VALUES
('Biểu mẫu', 'BieuMau_Quality', 'STQT Chất lượng'),
('Hướng dẫn công việc', 'HDCV_Quality', 'STQT Chất lượng'),
('Quy trình', 'QuyTrinh_Quality', 'STQT Chất lượng'),
('Quy định', 'QuyDinh_Quality', 'STQT Chất lượng');

-- --------------------------------------------------------

--
-- Table structure for table `testlist_restore`
--

CREATE TABLE IF NOT EXISTS `testlist_restore` (
  `R` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlist_supervise`
--

CREATE TABLE IF NOT EXISTS `testlist_supervise` (
  `S` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testlist_supervise`
--

INSERT INTO `testlist_supervise` (`S`, `Name`, `ID_id`) VALUES
('Biểu mẫu', 'BieuMau_Supervise', 'STQT Giám sát hệ thống'),
('Danh Mục', 'DanhMuc_Supervise', 'STQT Giám sát hệ thống'),
('Hướng dẫn công việc', 'HDCV_Supervise', 'STQT Giám sát hệ thống'),
('Mô tả công việc', 'MTCV_Supervise', 'STQT Giám sát hệ thống'),
('Quy trình', 'QuyTrinh_Supervise', 'STQT Giám sát hệ thống'),
('Tài liệu chưa ban hành', 'TLCBH_Supervise', 'STQT Giám sát hệ thống');

-- --------------------------------------------------------

--
-- Table structure for table `testlist_train`
--

CREATE TABLE IF NOT EXISTS `testlist_train` (
  `T` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlist_voip`
--

CREATE TABLE IF NOT EXISTS `testlist_voip` (
  `V` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ID_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`), ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`), ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`), ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`), ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`), ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`), ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `testlist_danhmucloi`
--
ALTER TABLE `testlist_danhmucloi`
  ADD PRIMARY KEY (`id`), ADD KEY `testlist_danhmucloi_ID_id_e72a3b57_fk_testlist_mang_Mang` (`ID_id`);

--
-- Indexes for table `testlist_deploy`
--
ALTER TABLE `testlist_deploy`
  ADD PRIMARY KEY (`DP`), ADD KEY `testlist_deploy_ID_id_6153bbc0_fk_testlist_documentnow_Document` (`ID_id`);

--
-- Indexes for table `testlist_develop`
--
ALTER TABLE `testlist_develop`
  ADD PRIMARY KEY (`DV`), ADD KEY `testlist_develop_ID_id_2ab7b84e_fk_testlist_documentnow_Document` (`ID_id`);

--
-- Indexes for table `testlist_documentnow`
--
ALTER TABLE `testlist_documentnow`
  ADD PRIMARY KEY (`Document`);

--
-- Indexes for table `testlist_hdcv`
--
ALTER TABLE `testlist_hdcv`
  ADD PRIMARY KEY (`id`), ADD KEY `testlist_hdcv_ID_id_cc5e615c_fk_testlist_danhmucloi_id` (`ID_id`);

--
-- Indexes for table `testlist_hdcvdeploy`
--
ALTER TABLE `testlist_hdcvdeploy`
  ADD PRIMARY KEY (`id`), ADD KEY `testlist_hdcvdeploy_ID_id_0f0e1351_fk_testlist_deploy_DP` (`ID_id`);

--
-- Indexes for table `testlist_hdcvdevelop`
--
ALTER TABLE `testlist_hdcvdevelop`
  ADD PRIMARY KEY (`id`), ADD KEY `testlist_hdcvdevelop_ID_id_f511a1e3_fk_testlist_develop_DV` (`ID_id`);

--
-- Indexes for table `testlist_hdcvhr`
--
ALTER TABLE `testlist_hdcvhr`
  ADD PRIMARY KEY (`id`), ADD KEY `testlist_hdcvhr_ID_id_b0a43196_fk_testlist_hr_HR` (`ID_id`);

--
-- Indexes for table `testlist_hdcvquality`
--
ALTER TABLE `testlist_hdcvquality`
  ADD PRIMARY KEY (`id`), ADD KEY `testlist_hdcv_quality_ID_id_83ebaa04_fk_testlist_quality_Q` (`ID_id`);

--
-- Indexes for table `testlist_hdcvrestore`
--
ALTER TABLE `testlist_hdcvrestore`
  ADD PRIMARY KEY (`id`), ADD KEY `testlist_hdcvrestore_ID_id_82425378_fk_testlist_restore_R` (`ID_id`);

--
-- Indexes for table `testlist_hdcvtrain`
--
ALTER TABLE `testlist_hdcvtrain`
  ADD PRIMARY KEY (`id`), ADD KEY `testlist_hdcvtrain_ID_id_e3122309_fk_testlist_train_T` (`ID_id`);

--
-- Indexes for table `testlist_hdcvvoip`
--
ALTER TABLE `testlist_hdcvvoip`
  ADD PRIMARY KEY (`id`), ADD KEY `testlist_hdcvvoip_ID_id_3f9a1385_fk_testlist_voip_V` (`ID_id`);

--
-- Indexes for table `testlist_hr`
--
ALTER TABLE `testlist_hr`
  ADD PRIMARY KEY (`HR`), ADD KEY `testlist_hr_ID_id_b0a3d0e8_fk_testlist_documentnow_Document` (`ID_id`);

--
-- Indexes for table `testlist_mang`
--
ALTER TABLE `testlist_mang`
  ADD PRIMARY KEY (`Mang`);

--
-- Indexes for table `testlist_quality`
--
ALTER TABLE `testlist_quality`
  ADD PRIMARY KEY (`Q`), ADD KEY `testlist_quality_ID_id_69e4fdcd_fk_testlist_documentnow_Document` (`ID_id`);

--
-- Indexes for table `testlist_restore`
--
ALTER TABLE `testlist_restore`
  ADD PRIMARY KEY (`R`), ADD KEY `testlist_restore_ID_id_75dcd926_fk_testlist_documentnow_Document` (`ID_id`);

--
-- Indexes for table `testlist_supervise`
--
ALTER TABLE `testlist_supervise`
  ADD PRIMARY KEY (`S`), ADD KEY `testlist_supervise_ID_id_15870f31_fk_testlist_` (`ID_id`);

--
-- Indexes for table `testlist_train`
--
ALTER TABLE `testlist_train`
  ADD PRIMARY KEY (`T`), ADD KEY `testlist_train_ID_id_8d9e58ee_fk_testlist_documentnow_Document` (`ID_id`);

--
-- Indexes for table `testlist_voip`
--
ALTER TABLE `testlist_voip`
  ADD PRIMARY KEY (`V`), ADD KEY `testlist_voip_ID_id_4e164206_fk_testlist_documentnow_Document` (`ID_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `testlist_danhmucloi`
--
ALTER TABLE `testlist_danhmucloi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `testlist_hdcv`
--
ALTER TABLE `testlist_hdcv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `testlist_hdcvdeploy`
--
ALTER TABLE `testlist_hdcvdeploy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `testlist_hdcvdevelop`
--
ALTER TABLE `testlist_hdcvdevelop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `testlist_hdcvhr`
--
ALTER TABLE `testlist_hdcvhr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `testlist_hdcvquality`
--
ALTER TABLE `testlist_hdcvquality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `testlist_hdcvrestore`
--
ALTER TABLE `testlist_hdcvrestore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `testlist_hdcvtrain`
--
ALTER TABLE `testlist_hdcvtrain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `testlist_hdcvvoip`
--
ALTER TABLE `testlist_hdcvvoip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `testlist_danhmucloi`
--
ALTER TABLE `testlist_danhmucloi`
ADD CONSTRAINT `testlist_danhmucloi_ID_id_e72a3b57_fk_testlist_mang_Mang` FOREIGN KEY (`ID_id`) REFERENCES `testlist_mang` (`Mang`);

--
-- Constraints for table `testlist_deploy`
--
ALTER TABLE `testlist_deploy`
ADD CONSTRAINT `testlist_deploy_ID_id_6153bbc0_fk_testlist_documentnow_Document` FOREIGN KEY (`ID_id`) REFERENCES `testlist_documentnow` (`Document`);

--
-- Constraints for table `testlist_develop`
--
ALTER TABLE `testlist_develop`
ADD CONSTRAINT `testlist_develop_ID_id_2ab7b84e_fk_testlist_documentnow_Document` FOREIGN KEY (`ID_id`) REFERENCES `testlist_documentnow` (`Document`);

--
-- Constraints for table `testlist_hdcv`
--
ALTER TABLE `testlist_hdcv`
ADD CONSTRAINT `testlist_hdcv_ID_id_cc5e615c_fk_testlist_danhmucloi_id` FOREIGN KEY (`ID_id`) REFERENCES `testlist_danhmucloi` (`id`);

--
-- Constraints for table `testlist_hdcvdeploy`
--
ALTER TABLE `testlist_hdcvdeploy`
ADD CONSTRAINT `testlist_hdcvdeploy_ID_id_0f0e1351_fk_testlist_deploy_DP` FOREIGN KEY (`ID_id`) REFERENCES `testlist_deploy` (`DP`);

--
-- Constraints for table `testlist_hdcvdevelop`
--
ALTER TABLE `testlist_hdcvdevelop`
ADD CONSTRAINT `testlist_hdcvdevelop_ID_id_f511a1e3_fk_testlist_develop_DV` FOREIGN KEY (`ID_id`) REFERENCES `testlist_develop` (`DV`);

--
-- Constraints for table `testlist_hdcvhr`
--
ALTER TABLE `testlist_hdcvhr`
ADD CONSTRAINT `testlist_hdcvhr_ID_id_b0a43196_fk_testlist_hr_HR` FOREIGN KEY (`ID_id`) REFERENCES `testlist_hr` (`HR`);

--
-- Constraints for table `testlist_hdcvquality`
--
ALTER TABLE `testlist_hdcvquality`
ADD CONSTRAINT `testlist_hdcv_quality_ID_id_83ebaa04_fk_testlist_quality_Q` FOREIGN KEY (`ID_id`) REFERENCES `testlist_quality` (`Q`);

--
-- Constraints for table `testlist_hdcvrestore`
--
ALTER TABLE `testlist_hdcvrestore`
ADD CONSTRAINT `testlist_hdcvrestore_ID_id_82425378_fk_testlist_restore_R` FOREIGN KEY (`ID_id`) REFERENCES `testlist_restore` (`R`);

--
-- Constraints for table `testlist_hdcvtrain`
--
ALTER TABLE `testlist_hdcvtrain`
ADD CONSTRAINT `testlist_hdcvtrain_ID_id_e3122309_fk_testlist_train_T` FOREIGN KEY (`ID_id`) REFERENCES `testlist_train` (`T`);

--
-- Constraints for table `testlist_hdcvvoip`
--
ALTER TABLE `testlist_hdcvvoip`
ADD CONSTRAINT `testlist_hdcvvoip_ID_id_3f9a1385_fk_testlist_voip_V` FOREIGN KEY (`ID_id`) REFERENCES `testlist_voip` (`V`);

--
-- Constraints for table `testlist_hr`
--
ALTER TABLE `testlist_hr`
ADD CONSTRAINT `testlist_hr_ID_id_b0a3d0e8_fk_testlist_documentnow_Document` FOREIGN KEY (`ID_id`) REFERENCES `testlist_documentnow` (`Document`);

--
-- Constraints for table `testlist_quality`
--
ALTER TABLE `testlist_quality`
ADD CONSTRAINT `testlist_quality_ID_id_69e4fdcd_fk_testlist_documentnow_Document` FOREIGN KEY (`ID_id`) REFERENCES `testlist_documentnow` (`Document`);

--
-- Constraints for table `testlist_restore`
--
ALTER TABLE `testlist_restore`
ADD CONSTRAINT `testlist_restore_ID_id_75dcd926_fk_testlist_documentnow_Document` FOREIGN KEY (`ID_id`) REFERENCES `testlist_documentnow` (`Document`);

--
-- Constraints for table `testlist_supervise`
--
ALTER TABLE `testlist_supervise`
ADD CONSTRAINT `testlist_supervise_ID_id_15870f31_fk_testlist_` FOREIGN KEY (`ID_id`) REFERENCES `testlist_documentnow` (`Document`);

--
-- Constraints for table `testlist_train`
--
ALTER TABLE `testlist_train`
ADD CONSTRAINT `testlist_train_ID_id_8d9e58ee_fk_testlist_documentnow_Document` FOREIGN KEY (`ID_id`) REFERENCES `testlist_documentnow` (`Document`);

--
-- Constraints for table `testlist_voip`
--
ALTER TABLE `testlist_voip`
ADD CONSTRAINT `testlist_voip_ID_id_4e164206_fk_testlist_documentnow_Document` FOREIGN KEY (`ID_id`) REFERENCES `testlist_documentnow` (`Document`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
