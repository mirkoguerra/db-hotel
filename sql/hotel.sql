-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 13, 2021 at 03:08 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `db-hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--

CREATE TABLE `clienti` (
  `cl_id` int(11) NOT NULL,
  `cl–nome` varchar(30) NOT NULL,
  `cl–cognome` varchar(30) NOT NULL,
  `cl_cod_fiscale` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `pr_id` int(11) NOT NULL,
  `pr_data_inizio` date NOT NULL,
  `pr_data_fine` date NOT NULL,
  `pr_cl_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prenotazioni2stanze`
--

CREATE TABLE `prenotazioni2stanze` (
  `col_pr_id` int(11) DEFAULT NULL,
  `col_st_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stanze`
--

CREATE TABLE `stanze` (
  `st_id` int(11) NOT NULL,
  `st_prezzo_giornaliero` float(7,2) NOT NULL,
  `st_posti_letto` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`cl_id`),
  ADD UNIQUE KEY `cl_id` (`cl_id`),
  ADD UNIQUE KEY `cl_cod_fiscale` (`cl_cod_fiscale`);

--
-- Indexes for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`pr_id`),
  ADD UNIQUE KEY `pr_id` (`pr_id`),
  ADD KEY `pr_cl_id` (`pr_cl_id`);

--
-- Indexes for table `prenotazioni2stanze`
--
ALTER TABLE `prenotazioni2stanze`
  ADD KEY `col_pr_id` (`col_pr_id`),
  ADD KEY `col_st_id` (`col_st_id`);

--
-- Indexes for table `stanze`
--
ALTER TABLE `stanze`
  ADD PRIMARY KEY (`st_id`),
  ADD UNIQUE KEY `st_id` (`st_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clienti`
--
ALTER TABLE `clienti`
  MODIFY `cl_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stanze`
--
ALTER TABLE `stanze`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`pr_cl_id`) REFERENCES `clienti` (`cl_id`);

--
-- Constraints for table `prenotazioni2stanze`
--
ALTER TABLE `prenotazioni2stanze`
  ADD CONSTRAINT `prenotazioni2stanze_ibfk_1` FOREIGN KEY (`col_pr_id`) REFERENCES `prenotazioni` (`pr_id`),
  ADD CONSTRAINT `prenotazioni2stanze_ibfk_2` FOREIGN KEY (`col_st_id`) REFERENCES `stanze` (`st_id`);
