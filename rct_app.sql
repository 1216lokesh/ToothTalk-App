-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2026 at 05:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rct_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `anxiety_scores`
--

CREATE TABLE `anxiety_scores` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `procedure_id` int(11) DEFAULT NULL,
  `timepoint` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anxiety_scores`
--

INSERT INTO `anxiety_scores` (`id`, `patient_id`, `procedure_id`, `timepoint`, `score`, `created_at`) VALUES
(1, 2, 1, 'apt1', 4, '2026-05-04 10:56:44'),
(2, 2, 1, 'apt2', 6, '2026-05-04 11:05:15'),
(3, 2, 1, 'apt3', 7, '2026-05-04 11:05:32');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_adherence`
--

CREATE TABLE `appointment_adherence` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `appointment_no` int(11) DEFAULT NULL,
  `attended` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `apt1` varchar(10) DEFAULT 'absent',
  `apt2` varchar(10) DEFAULT 'absent',
  `apt3` varchar(10) DEFAULT 'absent',
  `apt4` varchar(10) DEFAULT 'absent',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `user_id`, `apt1`, `apt2`, `apt3`, `apt4`, `created_at`) VALUES
(1, 2, 'present', 'present', 'absent', 'absent', '2026-05-04 11:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `baseline_responses`
--

CREATE TABLE `baseline_responses` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `appointment` varchar(20) DEFAULT NULL,
  `q1` varchar(100) DEFAULT NULL,
  `q2` varchar(100) DEFAULT NULL,
  `q3` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consent`
--

CREATE TABLE `consent` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `consent_given` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `consent_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consent`
--

INSERT INTO `consent` (`id`, `user_id`, `consent_given`, `created_at`, `consent_date`) VALUES
(1, 2, 'yes', '2026-05-04 11:04:56', '2026-05-04');

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_scores`
--

CREATE TABLE `knowledge_scores` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `procedure_id` int(11) DEFAULT NULL,
  `timepoint` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_procedure`
--

CREATE TABLE `patient_procedure` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `procedure_id` int(11) DEFAULT NULL,
  `assigned_by` int(11) DEFAULT NULL,
  `group_type` varchar(20) DEFAULT NULL,
  `assigned_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_procedure`
--

INSERT INTO `patient_procedure` (`id`, `patient_id`, `procedure_id`, `assigned_by`, `group_type`, `assigned_date`) VALUES
(1, 2, 1, 3, 'intervention', '2026-05-04');

-- --------------------------------------------------------

--
-- Table structure for table `postop_adherence`
--

CREATE TABLE `postop_adherence` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `q1` varchar(100) DEFAULT NULL,
  `q2` varchar(100) DEFAULT NULL,
  `q3` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `procedures`
--

CREATE TABLE `procedures` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `procedures`
--

INSERT INTO `procedures` (`id`, `name`, `category`, `description`) VALUES
(1, 'Apexification', 'Endodontic', 'Endodontic procedure to treat immature teeth with open apices'),
(2, 'Apexogenesis', 'Endodontic', 'Endodontic procedure to promote root development in vital immature teeth'),
(3, 'Pulpotomy', 'Endodontic', 'Removal of the coronal portion of the dental pulp'),
(4, 'Pulpectomy', 'Endodontic', 'Complete removal of the pulp tissue from the root canal'),
(5, 'Root Canal Treatment - Single Canal', 'Endodontic', 'Root canal treatment for a tooth with one canal'),
(6, 'Root Canal Treatment - Multi Canal', 'Endodontic', 'Root canal treatment for a tooth with multiple canals'),
(7, 'Root Canal Retreatment', 'Endodontic', 'Repeat root canal treatment for a previously treated tooth'),
(8, 'Periapical Surgery', 'Endodontic', 'Surgical removal of the root tip to treat persistent infection'),
(9, 'Direct Pulp Capping', 'Endodontic', 'Placement of material directly over exposed pulp to promote healing'),
(10, 'Indirect Pulp Capping', 'Endodontic', 'Placement of material over nearly exposed pulp to prevent exposure'),
(11, 'Composite Restoration', 'Restorative', 'Tooth coloured filling material to restore decayed or damaged teeth'),
(12, 'GIC Restoration', 'Restorative', 'Glass ionomer cement restoration for decayed teeth'),
(13, 'Amalgam Restoration', 'Restorative', 'Silver alloy filling for posterior tooth restoration'),
(14, 'Crown - PFM', 'Restorative', 'Porcelain fused to metal crown for full tooth coverage'),
(15, 'Crown - Zirconia', 'Restorative', 'Full zirconia crown for strength and natural appearance'),
(16, 'Inlay', 'Restorative', 'Custom restoration fitted within the tooth cusps'),
(17, 'Onlay', 'Restorative', 'Custom restoration covering one or more tooth cusps');

-- --------------------------------------------------------

--
-- Table structure for table `satisfaction_scores`
--

CREATE TABLE `satisfaction_scores` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `procedure_id` int(11) DEFAULT NULL,
  `timepoint` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `satisfaction_scores`
--

INSERT INTO `satisfaction_scores` (`id`, `patient_id`, `procedure_id`, `timepoint`, `score`, `created_at`) VALUES
(1, 2, 1, 'post_counselling', 9, '2026-05-04 11:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quiz1` int(11) DEFAULT NULL,
  `quiz2` int(11) DEFAULT NULL,
  `quiz3` int(11) DEFAULT NULL,
  `followup_1week` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `user_id`, `quiz1`, `quiz2`, `quiz3`, `followup_1week`) VALUES
(1, 2, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'patient',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `role`, `created_at`) VALUES
(2, 'jana', 'jana123@gmail.com', '$2y$10$Kkay3XHVsyVqLnRxqGF72.KMu8jnLwCxhEFCCGIpJWtiUzntpJoHu', '8143190406', 'patient', '2026-05-04 10:56:10'),
(3, 'Admin', 'admin@rct.com', '$2y$10$4tfW48bYZg7y2Ds25duwG.VDMfxNRNSObCzNcoFvCiuv7c8XEpAQm', '0000000000', 'admin', '2026-05-04 11:13:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anxiety_scores`
--
ALTER TABLE `anxiety_scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment_adherence`
--
ALTER TABLE `appointment_adherence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `baseline_responses`
--
ALTER TABLE `baseline_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consent`
--
ALTER TABLE `consent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `knowledge_scores`
--
ALTER TABLE `knowledge_scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_procedure`
--
ALTER TABLE `patient_procedure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postop_adherence`
--
ALTER TABLE `postop_adherence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `procedures`
--
ALTER TABLE `procedures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `satisfaction_scores`
--
ALTER TABLE `satisfaction_scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `anxiety_scores`
--
ALTER TABLE `anxiety_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `appointment_adherence`
--
ALTER TABLE `appointment_adherence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `baseline_responses`
--
ALTER TABLE `baseline_responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consent`
--
ALTER TABLE `consent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `knowledge_scores`
--
ALTER TABLE `knowledge_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_procedure`
--
ALTER TABLE `patient_procedure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `postop_adherence`
--
ALTER TABLE `postop_adherence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `procedures`
--
ALTER TABLE `procedures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `satisfaction_scores`
--
ALTER TABLE `satisfaction_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
