-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2021 at 05:48 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_vaccination`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(15) NOT NULL,
  `lastname` varchar(15) DEFAULT NULL,
  `gender` varchar(8) NOT NULL,
  `city` varchar(30) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `pass` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `lastname`, `gender`, `city`, `birth`, `type`, `email`, `pass`) VALUES
('maitri', 'Dhorajiya', 'Female', 'Ahmedabad', '2021-04-18', 'Admin', '19BCE508@nirmauni.ac.in', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE `child` (
  `c_name` varchar(15) NOT NULL,
  `c_gender` varchar(8) DEFAULT NULL,
  `c_city` varchar(30) DEFAULT NULL,
  `c_birth` date DEFAULT NULL,
  `c_age` int(3) DEFAULT NULL,
  `c_weight` int(5) DEFAULT NULL,
  `c_height` int(5) DEFAULT NULL,
  `c_vaccine` varchar(100) DEFAULT NULL,
  `p_username` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `child`
--

INSERT INTO `child` (`c_name`, `c_gender`, `c_city`, `c_birth`, `c_age`, `c_weight`, `c_height`, `c_vaccine`, `p_username`) VALUES
('rishi', 'Male', 'Ahmadabad', '2021-03-31', 3, 10, 40, 'BCG,Hepatitis B Birth dose', 'aesa'),
('misha', 'Female', 'Surat', '2020-12-01', 1, 6, 40, 'BCG,Hepatitis B Birth dose,OPV Birth dose', 'mansi');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `p_username` varchar(15) NOT NULL,
  `p_lastname` varchar(15) DEFAULT NULL,
  `p_gender` varchar(8) NOT NULL,
  `p_city` varchar(30) DEFAULT NULL,
  `p_birth` date DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `p_email` varchar(30) DEFAULT NULL,
  `p_pass` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`p_username`, `p_lastname`, `p_gender`, `p_city`, `p_birth`, `type`, `p_email`, `p_pass`) VALUES
('aesa', 'malani', 'Female', 'Ahmedabad', '2020-02-29', 'Parent', 'Jenu.dhorajiya@gmail.com', '456'),
('mansi', 'jodhani', 'Female', 'Surat', '1991-10-18', 'Parent', 'Jenu.dhorajiya@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

CREATE TABLE `vaccine` (
  `name` varchar(50) NOT NULL,
  `timing` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vaccine`
--

INSERT INTO `vaccine` (`name`, `timing`) VALUES
('BCG', '+6 month'),
('Hepatitis B Birth dose', '+1 day'),
('OPV Birth dose', '+10 day'),
('IPV (inactivated Polio Vaccine)', '+3 month'),
('Pentavelant', '+2 month');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_dates`
--

CREATE TABLE `vaccine_dates` (
  `name` varchar(50) NOT NULL,
  `v_date` date DEFAULT NULL,
  `timing` varchar(20) NOT NULL,
  `c_name` varchar(15) DEFAULT NULL,
  `p_username` varchar(15) DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vaccine_dates`
--

INSERT INTO `vaccine_dates` (`name`, `v_date`, `timing`, `c_name`, `p_username`, `status`) VALUES
('Hepatitis B Birth dose', '2021-04-25', '2021-04-26', 'rishi', 'aesa', 'true'),
('BCG', '2021-04-25', '2021-10-25', 'rishi', 'aesa', 'false'),
('BCG', '2021-04-25', '2021-10-25', 'misha', 'mansi', 'true'),
('Hepatitis B Birth dose', '2021-04-25', '2021-04-26', 'misha', 'mansi', 'false'),
('OPV Birth dose', '2021-04-25', '2021-05-05', 'misha', 'mansi', 'true');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD KEY `p_username` (`p_username`);

--
-- Indexes for table `vaccine_dates`
--
ALTER TABLE `vaccine_dates`
  ADD KEY `p_username` (`p_username`),
  ADD KEY `c_name` (`c_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
