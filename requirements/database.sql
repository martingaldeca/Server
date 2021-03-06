-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 16, 2018 at 10:06 PM
-- Server version: 5.7.23-0ubuntu0.18.04.1
-- PHP Version: 7.2.9-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `a7fh45_a7fh45`
--
--
-- Table structure for table `a7fh46_users`
--

CREATE TABLE `a7fh46_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `floor` int(11) NOT NULL,
  `zone` int(11) NOT NULL,
  `lastSeen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `a7fh46_logins`
--

CREATE TABLE `a7fh46_logins` (
  `id` int(11) NOT NULL,
  `app` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `a7fh46_loginsF`
--

CREATE TABLE `a7fh46_loginsF` (
  `id` int(11) NOT NULL,
  `app` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a7fh46_loginsF`
--

--
-- Table structure for table `a7fh46_settings`
--

CREATE TABLE `a7fh46_settings` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `nluID` int(11) NOT NULL,
  `nluAddress` varchar(255) NOT NULL,
  `tassID` int(11) NOT NULL,
  `tassAddress` varchar(255) NOT NULL,
  `tassDevices` int(11) NOT NULL,
  `jumpwayAPI` varchar(255) NOT NULL,
  `phpmyadmin` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `domainString` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a7fh46_settings`
--

INSERT INTO `a7fh46_settings` (`id`, `version`, `nluID`, `nluAddress`, `tassID`, `tassAddress`, `tassDevices`, `jumpwayAPI`, `phpmyadmin`, `meta_title`, `meta_description`, `meta_keywords`, `domainString`) VALUES
(1, '0.0.3', 0, '', 0, '', 0, 'http://www.iotJumpWay.tech', '', 'GeniSys AI', 'GeniSys AI', 'GeniSys AI', '');

-- --------------------------------------------------------

--
-- Table structure for table `tass_foscam_devices`
--

CREATE TABLE `tass_foscam_devices` (
  `id` int(11) NOT NULL,
  `jid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `RTSPuser` varchar(255) NOT NULL,
  `RTSPpass` varchar(255) NOT NULL,
  `RTSPip` varchar(255) NOT NULL,
  `RTSPport` varchar(255) NOT NULL,
  `RTSPendpoint` varchar(255) NOT NULL,
  `Stream` varchar(255) NOT NULL,
  `StreamAccess` varchar(255) NOT NULL,
  `StreamPort` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `a7fh46_users`
--

CREATE TABLE `a7fh46_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `floor` int(11) NOT NULL,
  `zone` int(11) NOT NULL,
  `lastSeen` datetime NOT NULL DEFAULT '1970-01-02 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a7fh46_users`
--

INSERT INTO `a7fh46_users` (`id`, `name`, `floor`, `zone`, `lastSeen`) VALUES
(1, 'Adam', 0, 98, '2018-09-23 17:07:11');

-- --------------------------------------------------------

--
-- Table structure for table `a7fh46_users_logs`
--

CREATE TABLE `a7fh46_users_logs` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `lid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `zid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `timeSeen` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a7fh46_logins`
--
ALTER TABLE `a7fh46_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app` (`app`),
  ADD KEY `ip` (`ip`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `a7fh46_loginsF`
--
ALTER TABLE `a7fh46_loginsF`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app` (`app`),
  ADD KEY `ip` (`ip`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `a7fh46_settings`
--
ALTER TABLE `a7fh46_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tassDevices` (`tassDevices`),
  ADD KEY `tassID` (`tassID`);

--
-- Indexes for table `tass_foscam_devices`
--
ALTER TABLE `tass_foscam_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jid` (`jid`);

--
-- Indexes for table `a7fh46_users`
--
ALTER TABLE `a7fh46_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a7fh46_users_logs`
--
ALTER TABLE `a7fh46_users_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`,`lid`,`fid`,`zid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a7fh46_logins`
--
ALTER TABLE `a7fh46_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `a7fh46_loginsF`
--
ALTER TABLE `a7fh46_loginsF`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `a7fh46_settings`
--
ALTER TABLE `a7fh46_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tass_foscam_devices`
--
ALTER TABLE `tass_foscam_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
ALTER TABLE `a7fh46_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `a7fh46_users_logs`
--
ALTER TABLE `a7fh46_users_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;