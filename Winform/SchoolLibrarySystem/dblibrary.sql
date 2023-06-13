-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2021 at 06:01 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dblibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblbooknumber`
--

CREATE TABLE `tblbooknumber` (
  `ID` int(11) NOT NULL,
  `BOOKTITLE` varchar(255) NOT NULL,
  `QTY` int(11) NOT NULL,
  `Desc` varchar(90) NOT NULL,
  `Author` varchar(90) NOT NULL,
  `PublishDate` date NOT NULL,
  `Publisher` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooknumber`
--

INSERT INTO `tblbooknumber` (`ID`, `BOOKTITLE`, `QTY`, `Desc`, `Author`, `PublishDate`, `Publisher`) VALUES
(17, 'Life of Jude', 1, 'The Adventure of Jude', 'Unknown', '2021-02-26', 'Unknown'),
(18, 'The Brain of Jude', 1, 'No Brain Programmer', 'Unknown', '2021-02-26', 'Unknown'),
(19, 'The Love of Jude', 1, 'The loving Angel Jude', 'Unknown', '2021-02-26', 'Ubknown');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks`
--

CREATE TABLE `tblbooks` (
  `BookID` int(11) NOT NULL,
  `AccessionNo` varchar(90) NOT NULL,
  `BookTitle` varchar(125) NOT NULL,
  `BookDesc` varchar(255) NOT NULL,
  `Author` varchar(125) NOT NULL,
  `PublishDate` date NOT NULL,
  `BookPublisher` varchar(125) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `BookPrice` double NOT NULL,
  `BookQuantity` int(11) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `BookType` varchar(90) NOT NULL,
  `DeweyDecimal` varchar(90) NOT NULL,
  `OverAllQty` int(11) NOT NULL,
  `Donate` tinyint(1) NOT NULL,
  `Remark` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooks`
--

INSERT INTO `tblbooks` (`BookID`, `AccessionNo`, `BookTitle`, `BookDesc`, `Author`, `PublishDate`, `BookPublisher`, `CategoryId`, `BookPrice`, `BookQuantity`, `Status`, `BookType`, `DeweyDecimal`, `OverAllQty`, `Donate`, `Remark`) VALUES
(22, 'H02262021', 'Life of Jude', 'The Adventure of Jude', 'Unknown', '2021-02-26', 'Unknown', 10, 0, 1, 'Available', 'Non-Fiction', '', 1, 0, 'Donate'),
(23, 'T02262021', 'The Brain of Jude', 'No Brain Programmer', 'Unknown', '2021-02-26', 'Unknown', 1, 0, 1, 'Available', 'Unknown', '', 1, 0, 'Donate'),
(24, 'R02262021', 'The Love of Jude', 'The loving Angel Jude', 'Unknown', '2021-02-26', 'Ubknown', 3, 0, 1, 'Not Available', 'Non-Fiction', '', 1, 0, 'Donate');

-- --------------------------------------------------------

--
-- Table structure for table `tblborrow`
--

CREATE TABLE `tblborrow` (
  `BorrowId` int(11) NOT NULL,
  `AccessionNo` varchar(90) NOT NULL,
  `NoCopies` int(11) NOT NULL,
  `DateBorrowed` datetime NOT NULL,
  `Purpose` varchar(90) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `DueDate` datetime NOT NULL,
  `BorrowerId` varchar(30) NOT NULL,
  `Due` tinyint(1) NOT NULL,
  `Remarks` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblborrower`
--

CREATE TABLE `tblborrower` (
  `IDNO` int(11) NOT NULL,
  `BorrowerId` varchar(90) NOT NULL,
  `Firstname` varchar(125) NOT NULL,
  `Lastname` varchar(125) NOT NULL,
  `MiddleName` varchar(125) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Sex` varchar(11) NOT NULL,
  `ContactNo` varchar(125) NOT NULL,
  `CourseYear` varchar(125) NOT NULL,
  `BorrowerPhoto` varchar(255) NOT NULL,
  `BorrowerType` varchar(35) NOT NULL,
  `Stats` varchar(36) NOT NULL,
  `IMGBLOB` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblborrower`
--

INSERT INTO `tblborrower` (`IDNO`, `BorrowerId`, `Firstname`, `Lastname`, `MiddleName`, `Address`, `Sex`, `ContactNo`, `CourseYear`, `BorrowerPhoto`, `BorrowerType`, `Stats`, `IMGBLOB`) VALUES
(10, 'Mar', 'Nikko', 'Curaza', 'Arroyo', 'Bacolod', 'Male', '09989878669', 'BSIT IV-2', '', 'Student', 'NotActive', ''),
(11, 'CNA110', 'Nikko', 'Curaza', 'Reyes', 'Bacolod', 'Male', '09098765436', 'BSIT IV-2', '', 'Student', 'Active', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `CategoryId` int(11) NOT NULL,
  `Category` varchar(125) NOT NULL,
  `DDecimal` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`CategoryId`, `Category`, `DDecimal`) VALUES
(1, 'Computers, Information and General Reference', '000'),
(2, 'Philosophy and Psychology', '100'),
(3, 'Religion', '200'),
(4, 'Social Science', '300'),
(5, 'Language', '400'),
(6, 'Science', '500'),
(7, 'Technology', '600'),
(8, 'Arts and Recreation', '700'),
(9, 'Literature', '800'),
(10, 'History and Geography', '900'),
(12, 'ALL', 'ALL');

-- --------------------------------------------------------

--
-- Table structure for table `tbllogs`
--

CREATE TABLE `tbllogs` (
  `LogId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `LogDate` datetime NOT NULL,
  `LogMode` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpayment`
--

CREATE TABLE `tblpayment` (
  `PaymentId` int(11) NOT NULL,
  `BorrowId` int(11) NOT NULL,
  `Payment` double NOT NULL,
  `Change` double NOT NULL,
  `DatePayed` date NOT NULL,
  `BorrowerId` int(11) NOT NULL,
  `Remarks` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblreturn`
--

CREATE TABLE `tblreturn` (
  `ReturnId` int(11) NOT NULL,
  `BorrowId` int(11) NOT NULL,
  `NoCopies` int(11) NOT NULL,
  `DateReturned` datetime NOT NULL,
  `Remarks` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `UserId` int(11) NOT NULL,
  `Fullname` varchar(124) NOT NULL,
  `User_name` varchar(125) NOT NULL,
  `Pass` varchar(125) NOT NULL,
  `UserRole` varchar(125) NOT NULL,
  `Status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserId`, `Fullname`, `User_name`, `Pass`, `UserRole`, `Status`) VALUES
(3, 'Ad Merc', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Librarian', 'Active'),
(4, 'Angel Reyes', 'librarian', '93c768d0152f72bc8d5e782c0b585acc35fb0442', 'Librarian', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblbooknumber`
--
ALTER TABLE `tblbooknumber`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`BookID`);

--
-- Indexes for table `tblborrow`
--
ALTER TABLE `tblborrow`
  ADD PRIMARY KEY (`BorrowId`);

--
-- Indexes for table `tblborrower`
--
ALTER TABLE `tblborrower`
  ADD PRIMARY KEY (`IDNO`),
  ADD UNIQUE KEY `BorrowerId` (`BorrowerId`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `tbllogs`
--
ALTER TABLE `tbllogs`
  ADD PRIMARY KEY (`LogId`);

--
-- Indexes for table `tblpayment`
--
ALTER TABLE `tblpayment`
  ADD PRIMARY KEY (`PaymentId`);

--
-- Indexes for table `tblreturn`
--
ALTER TABLE `tblreturn`
  ADD PRIMARY KEY (`ReturnId`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblbooknumber`
--
ALTER TABLE `tblbooknumber`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `tblborrow`
--
ALTER TABLE `tblborrow`
  MODIFY `BorrowId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `tblborrower`
--
ALTER TABLE `tblborrower`
  MODIFY `IDNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbllogs`
--
ALTER TABLE `tbllogs`
  MODIFY `LogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=483;
--
-- AUTO_INCREMENT for table `tblpayment`
--
ALTER TABLE `tblpayment`
  MODIFY `PaymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tblreturn`
--
ALTER TABLE `tblreturn`
  MODIFY `ReturnId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
