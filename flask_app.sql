-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2024 at 08:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flask_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `registeruser`
--

CREATE TABLE `registeruser` (
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `mailid` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `registeruser`
--

INSERT INTO `registeruser` (`fullname`, `username`, `password`, `phone`, `mailid`, `gender`, `id`) VALUES
('rahul pawar', 'rahul', 'Rahulecs@123', '9850202777', 'rahulpawar9766@gmail.com', 'Male', 1),
('Namrata Shinde', 'Namrata', 'Namrata@88', '7774927171', 'namratashinde055@gmail.com', 'Female', 2),
('Namrata Shinde', 'Namrata', 'Namrata@88', '7774927171', 'namratashinde055@gmail.com', 'Female', 3),
('Namrata', 'Namshinde', 'Namrata@22', '7774817171', 'namratashinde@gmail.com', 'Female', 4),
('Namrata Shinde', 'Namrata', 'Namrata@123', '7774927171', 'namratashinde@gmail.com', 'Female', 5),
('Namrata Shinde', 'Namrata', 'Namrata@1234', '7774937171', 'namratashinde@gmail.com', 'Female', 6),
('rahul', 'rahul', 'Rahulecs@123', '9850202777', 'rahulpawar9766@gmail.com', 'Male', 7),
('rahul', 'rahul', 'Rahulecs@123', '9850202777', 'rahulpawar9766@gmail.com', 'Male', 8),
('rahul', 'rahul', 'Rahulecs@123', '9850202777', 'rahulpawar9766@gmail.com', 'Male', 9),
('anita', 'anita', 'Anitaecs@123', '9850202777', 'rahul@gmail.com', 'Male', 10),
('rahul', 'rahul', 'Rahulecs@123', '9850202777', 'rahulpawar9766@gmail.com', 'Male', 11),
('rahul', 'rahul', 'Rahulecs@123', '9850202777', 'rahulpawar9766@gmail.com', 'Female', 12),
('rahul', 'rahul', 'Rahulecs@123', '9850202777', 'rahulpawar9766@gmail.com', 'Male', 13),
('rahul', 'rahul', 'Rahulecs@123', '9850202777', 'rahulpawar9766@gmail.com', 'Male', 14),
('rahul', 'rahulecs', 'Rahulecs@123', '9850202777', 'rahulecs@gmail.com', 'Male', 15);

-- --------------------------------------------------------

--
-- Table structure for table `typemudra`
--

CREATE TABLE `typemudra` (
  `id` int(11) NOT NULL,
  `type` varchar(1000) NOT NULL,
  `Benefits` varchar(1000) NOT NULL,
  `MudraName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `typemudra`
--

INSERT INTO `typemudra` (`id`, `type`, `Benefits`, `MudraName`) VALUES
(1, 'psychological disorders like', 'Increases memory power and sharpens the brain.\r\nEnhances concentration and prevents Insomnia.\r\n', 'Gyan Mudra'),
(2, 'Weakness and skin related issues.', 'It helps to increase the weight for weak people It improves the complexion of skin and makes the skin to glow', 'Prithvi Mudra'),
(3, 'Stomach pain, hormonal imbalance, mental illness.', 'retains clarity in blood by balancing water content in the body Prevents the pains of Gastroenteritis and Muscle Shrinkage', 'Varun Mudra'),
(4, 'Gases in stomach, Parkinson\'s disease.', 'It cures Rheumatism, Arthritis, Gout, Parkinson\'s disease and paralysis without any medicine.\r\n It is useful for Cervical Spondilytis, paralysis to face and catching of nerve in neck.\r\n', 'Vayu Mudra'),
(5, 'Feeling dizzy, numb in body and body parts like head, chest, abdomen.\r\nEar infection\r\nVata overdose.\r\n', 'It relieves an earache within 4 or 5 minutes.\r\n It is useful for the deaf and mentally challenged.\r\n', 'Shunya Mudra'),
(6, 'Acidity, boils in the body, dizziness, headache, dry skin, warm body, piles.', 'It reduces cholesterol in body and helps in reducing weight.\r\n It reduces anxiety.\r\n It corrects indigestion problems.\r\n', 'Surya Mudra'),
(7, 'Not able to focus properly, not having feeling of well being.', 'It improves immunity. Improves the power of eyes and reduces eye related diseases.\r\n It removes the vitamin deficiency and fatigue.\r\n', 'Prana Mudra'),
(8, 'Feeling of Vomiting, ', 'It regulates diabetes.\r\n It cures constipation and piles.\r\nHelps in smooth child birth for pregnant women.\r\n', 'Apana Mudra'),
(9, 'Mood swings, high blood pressure, rapid heartbeat, sweating, stress, bone pain.', 'Helps student in balancing emotions, live with nature in hormones', 'Lotus Mudra'),
(10, 'Cough, cold, fever and asthma.', 'Helps in generating warmth in body.', 'Linga Mudra');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `mobile`, `email`, `gender`, `created_at`) VALUES
(1, 'Namrata', 'namu', '', '', '', 'male', '2024-10-07 07:32:57'),
(2, 'Aish', '121', '', '', '', 'male', '2024-10-07 07:32:57'),
(3, 'rr', '12', '', '', '', 'male', '2024-10-07 07:32:57'),
(4, 'a', 'a', '', '', '', 'male', '2024-10-07 07:32:57'),
(5, 'aa', 'aa', '', '', '', 'male', '2024-10-07 07:32:57'),
(6, 'bb', 'bb', '', '', '', 'male', '2024-10-07 07:32:57'),
(7, 'bd', 'bd', '', '', '', 'male', '2024-10-07 07:32:57'),
(8, 'daud', 'daud', 'daud', '7676454532', 'daud@32gmail.com', 'male', '2024-10-07 07:53:46'),
(9, 'vipul', 'vipul', 'vipul', '7656432345', 'vipul@gmail.com', 'male', '2024-10-07 08:03:34'),
(10, 'rahul', 'rahul', 'rahul', '7654436578', 'adminrahul@gmail.com', 'male', '2024-10-07 08:05:44'),
(11, 'ss', 'ss', 'ss', '76564232345', 'ssss@32gmail.com', 'female', '2024-10-07 09:32:20'),
(12, 'as', 'as', 'asas', '7634542332', 'as@32gmail.com', 'female', '2024-10-07 09:36:50'),
(13, 'namuuu', 'namuuu', 'namuuu', '7676232323', 'namuuu@gmail.com', 'female', '2024-10-07 09:46:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `registeruser`
--
ALTER TABLE `registeruser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typemudra`
--
ALTER TABLE `typemudra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `registeruser`
--
ALTER TABLE `registeruser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `typemudra`
--
ALTER TABLE `typemudra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
