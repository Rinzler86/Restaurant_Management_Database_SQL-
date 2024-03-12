-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2024 at 04:44 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `employeeroles`
--

CREATE TABLE `employeeroles` (
  `EmployeeID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `Wage` decimal(10,2) NOT NULL,
  `TotalWages` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ImageUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeID`, `FirstName`, `LastName`, `RoleID`, `Wage`, `TotalWages`, `ImageUrl`) VALUES
(27, 'Ethan', 'Smith', 1, 25.00, 0.00, 'assets/images/employees/general_manager.jpg'),
(28, 'Olivia ', 'Johnson', 4, 13.00, 0.00, 'assets/images/employees/receptionsist.jpg'),
(29, 'Ava', 'Martinez', 2, 5.00, 0.00, 'assets/images/employees/waitress2.jpg'),
(30, 'Sophia', 'Anderson', 2, 5.00, 0.00, 'assets/images/employees/waitress.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `FoodID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `InStock` tinyint(1) NOT NULL DEFAULT 1,
  `ImageUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`FoodID`, `Name`, `Description`, `Price`, `InStock`, `ImageUrl`) VALUES
(14, 'Meatza', 'its pizza', 22.00, 1, 'assets/images/foods/istockphoto-505981541-612x612.jpg'),
(15, 'Pepperroni Pizza', 'a margerita pizza', 14.99, 1, 'assets/images/foods/istockphoto-1410569092-612x612.jpg'),
(16, 'Garlic Bread', 'garlic bread with butter', 2.99, 1, 'assets/images/foods/garlic_bread.jpg'),
(17, 'Spicy Four Cheese', '4 cheese pizza extravaganza', 24.00, 1, 'assets/images/foods/istockphoto-1137148562-612x612.jpg'),
(18, 'Penne Pasta', 'penne pasta', 17.99, 1, 'assets/images/foods/penne.jpg'),
(19, 'Spaghetti ', 'spaghetti', 15.99, 1, 'assets/images/foods/spaghetti.jpg'),
(24, 'food', 'its a food', 13.00, 1, 'assets/images/foods/istockphoto-547425842-612x612.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `food_toppings`
--

CREATE TABLE `food_toppings` (
  `FoodID` int(11) DEFAULT NULL,
  `ToppingID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `FoodID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `PriceAtTimeOfOrder` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `TableID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `OrderTime` datetime DEFAULT current_timestamp(),
  `DineIn` tinyint(1) NOT NULL DEFAULT 1,
  `Completed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `TableID`, `EmployeeID`, `OrderTime`, `DineIn`, `Completed`) VALUES
(1, 1, 27, '2023-11-18 23:34:38', 1, 1),
(2, 2, 28, '2023-11-19 12:16:47', 1, 1),
(3, 3, 28, '2023-11-19 12:40:45', 1, 1),
(4, NULL, NULL, '2023-11-19 12:42:13', 0, 1),
(5, NULL, NULL, '2023-11-19 12:53:18', 0, 1),
(6, NULL, NULL, '2023-11-19 13:06:08', 0, 1),
(7, NULL, NULL, '2023-11-19 13:06:12', 0, 1),
(8, NULL, NULL, '2023-11-19 13:10:39', 0, 1),
(9, NULL, NULL, '2023-11-19 13:10:43', 0, 1),
(10, NULL, NULL, '2023-11-19 13:11:05', 0, 1),
(11, NULL, NULL, '2023-11-19 13:12:52', 0, 1),
(12, NULL, NULL, '2023-11-19 13:12:56', 0, 1),
(13, NULL, NULL, '2023-11-19 14:35:58', 0, 1),
(14, NULL, NULL, '2023-11-19 14:36:02', 0, 1),
(15, NULL, NULL, '2023-11-19 14:36:29', 0, 1),
(16, NULL, NULL, '2023-11-19 16:02:24', 0, 1),
(17, NULL, NULL, '2023-11-19 16:02:33', 0, 1),
(18, NULL, NULL, '2023-11-19 16:03:04', 0, 1),
(19, NULL, NULL, '2023-11-19 16:03:07', 0, 1),
(20, NULL, NULL, '2023-11-19 16:03:48', 0, 1),
(21, NULL, NULL, '2023-11-19 16:03:51', 0, 1),
(22, NULL, NULL, '2023-11-19 16:06:55', 0, 1),
(23, NULL, NULL, '2023-11-19 16:08:57', 0, 1),
(24, NULL, NULL, '2023-11-19 16:09:02', 0, 1),
(25, NULL, NULL, '2023-11-19 16:14:13', 0, 1),
(26, NULL, NULL, '2023-11-19 16:20:59', 0, 1),
(27, NULL, NULL, '2023-11-19 16:21:09', 0, 1),
(28, NULL, NULL, '2023-11-19 17:40:05', 0, 1),
(29, NULL, NULL, '2023-11-19 23:55:55', 0, 1),
(30, NULL, NULL, '2023-11-20 00:03:27', 0, 1),
(31, NULL, NULL, '2023-11-20 00:03:32', 0, 1),
(32, NULL, NULL, '2023-11-20 23:11:54', 0, 1),
(33, NULL, NULL, '2023-11-20 23:26:52', 0, 1),
(34, NULL, NULL, '2023-11-21 22:52:05', 0, 1),
(35, NULL, NULL, '2023-12-02 17:30:59', 0, 1),
(36, NULL, NULL, '2023-12-04 21:42:45', 0, 1),
(37, NULL, NULL, '2023-12-05 11:31:47', 0, 1),
(38, NULL, NULL, '2023-12-05 11:31:56', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(100) NOT NULL,
  `CanHire` tinyint(1) NOT NULL DEFAULT 0,
  `CanFire` tinyint(1) NOT NULL DEFAULT 0,
  `CanSchedule` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RoleID`, `RoleName`, `CanHire`, `CanFire`, `CanSchedule`) VALUES
(1, 'Manager', 0, 0, 0),
(2, 'Waiter', 0, 0, 0),
(3, 'Chef', 0, 0, 0),
(4, 'Receptionist', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `ScheduleID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `WorkDate` date NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `TableID` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Available` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`TableID`, `Capacity`, `Available`) VALUES
(1, 2, 1),
(2, 4, 1),
(3, 4, 1),
(4, 4, 1),
(5, 6, 1),
(6, 6, 1),
(7, 8, 1),
(8, 8, 1),
(9, 10, 1),
(10, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `toppings`
--

CREATE TABLE `toppings` (
  `ToppingID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `toppings`
--

INSERT INTO `toppings` (`ToppingID`, `Name`, `Price`) VALUES
(1, 'Pepperoni', 0.50),
(2, 'Mushrooms', 0.30),
(3, 'Onions', 0.25),
(4, 'Sausage', 0.50),
(5, 'Bacon', 0.50),
(6, 'Extra Cheese', 0.40),
(7, 'Black Olives', 0.30),
(8, 'Green Peppers', 0.25),
(9, 'Pineapple', 0.35),
(10, 'Spinach', 0.30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employeeroles`
--
ALTER TABLE `employeeroles`
  ADD PRIMARY KEY (`EmployeeID`,`RoleID`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`FoodID`);

--
-- Indexes for table `food_toppings`
--
ALTER TABLE `food_toppings`
  ADD KEY `FoodID` (`FoodID`),
  ADD KEY `ToppingID` (`ToppingID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `FoodID` (`FoodID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `TableID` (`TableID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`ScheduleID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`TableID`);

--
-- Indexes for table `toppings`
--
ALTER TABLE `toppings`
  ADD PRIMARY KEY (`ToppingID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `FoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `ScheduleID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `TableID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `toppings`
--
ALTER TABLE `toppings`
  MODIFY `ToppingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employeeroles`
--
ALTER TABLE `employeeroles`
  ADD CONSTRAINT `employeeroles_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE,
  ADD CONSTRAINT `employeeroles_ibfk_2` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`) ON DELETE SET NULL;

--
-- Constraints for table `food_toppings`
--
ALTER TABLE `food_toppings`
  ADD CONSTRAINT `food_toppings_ibfk_1` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`),
  ADD CONSTRAINT `food_toppings_ibfk_2` FOREIGN KEY (`ToppingID`) REFERENCES `toppings` (`ToppingID`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`TableID`) REFERENCES `tables` (`TableID`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE SET NULL;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
