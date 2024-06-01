-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2024 at 06:41 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scm`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(255) NOT NULL,
  `ContactName` varchar(255) DEFAULT NULL,
  `ContactEmail` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`CustomerID`, `CustomerName`, `ContactName`, `ContactEmail`, `PhoneNumber`, `Address`) VALUES
(1, 'ABC Company', 'Michael Johnson', 'michael@abccompany.com', '555-987-6543', '321 Oak St, City, Country'),
(2, 'XYZ Corporation', 'Emily Brown', 'emily@xyzcorp.com', '111-222-3333', '654 Maple St, Town, Country'),
(3, 'GHI Enterprises', 'David Wilson', 'david@ghi-enterprises.com', '777-888-9999', '987 Pine St, Village, Country');

-- --------------------------------------------------------

--
-- Table structure for table `Inventory`
--

CREATE TABLE `Inventory` (
  `InventoryID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `WarehouseID` int(11) DEFAULT NULL,
  `StockQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Inventory`
--

INSERT INTO `Inventory` (`InventoryID`, `ProductID`, `WarehouseID`, `StockQuantity`) VALUES
(1, 1, 1, 50),
(2, 2, 1, 100),
(3, 3, 2, 25),
(4, 4, 3, 75);

-- --------------------------------------------------------

--
-- Table structure for table `OrderDetails`
--

CREATE TABLE `OrderDetails` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `OrderDetails`
--

INSERT INTO `OrderDetails` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `UnitPrice`, `TotalPrice`) VALUES
(1, 1, 3, 2, 149.99, 299.98),
(2, 2, 1, 1, 999.99, 999.99),
(3, 3, 2, 3, 699.99, 2099.97);

--
-- Triggers `OrderDetails`
--
DELIMITER $$
CREATE TRIGGER `calculate_total_price` BEFORE INSERT ON `OrderDetails` FOR EACH ROW BEGIN
    SET NEW.TotalPrice = NEW.Quantity * NEW.UnitPrice;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShippingDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OrderID`, `CustomerID`, `OrderDate`, `ShippingDate`, `TotalAmount`) VALUES
(1, 1, '2024-05-01', '2024-05-05', 299.99),
(2, 2, '2024-05-02', '2024-05-06', 199.99),
(3, 3, '2024-05-03', '2024-05-07', 599.99);

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `StockQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`ProductID`, `ProductName`, `SupplierID`, `Category`, `UnitPrice`, `StockQuantity`) VALUES
(1, 'Laptop', 1, 'Electronics', 999.99, 100),
(2, 'Smartphone', 1, 'Electronics', 699.99, 200),
(3, 'Printer', 2, 'Office Supplies', 299.99, 50),
(4, 'Headphones', 3, 'Electronics', 99.99, 150);

-- --------------------------------------------------------

--
-- Table structure for table `Shipments`
--

CREATE TABLE `Shipments` (
  `ShipmentID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ShipmentDate` date DEFAULT NULL,
  `CarrierName` varchar(255) DEFAULT NULL,
  `TrackingNumber` varchar(255) DEFAULT NULL,
  `ShippingCost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Shipments`
--

INSERT INTO `Shipments` (`ShipmentID`, `OrderID`, `ShipmentDate`, `CarrierName`, `TrackingNumber`, `ShippingCost`) VALUES
(1, 1, '2024-05-05', 'UPS', '1234567890', 10.00),
(2, 2, '2024-05-06', 'FedEx', '9876543210', 15.00),
(3, 3, '2024-05-07', 'DHL', '5555555555', 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `Suppliers`
--

CREATE TABLE `Suppliers` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(255) NOT NULL,
  `ContactName` varchar(255) DEFAULT NULL,
  `ContactEmail` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Suppliers`
--

INSERT INTO `Suppliers` (`SupplierID`, `SupplierName`, `ContactName`, `ContactEmail`, `PhoneNumber`, `Address`) VALUES
(1, 'ABC Electronics', 'John Doe', 'john.doe@abc.com', '123-456-7890', '123 Main St, City, Country'),
(2, 'XYZ Supplies', 'Jane Smith', 'jane.smith@xyz.com', '987-654-3210', '456 Elm St, Town, Country'),
(3, 'GHI Manufacturing', 'Alice Johnson', 'alice.johnson@ghi.com', '555-123-4567', '789 Oak St, Village, Country');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(35) DEFAULT NULL,
  `password` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `Warehouses`
--

CREATE TABLE `Warehouses` (
  `WarehouseID` int(11) NOT NULL,
  `WarehouseName` varchar(255) NOT NULL,
  `Location` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Warehouses`
--

INSERT INTO `Warehouses` (`WarehouseID`, `WarehouseName`, `Location`) VALUES
(1, 'Main Warehouse', '123 Warehouse St, City, Country'),
(2, 'Secondary Warehouse', '456 Warehouse St, Town, Country'),
(3, 'Backup Warehouse', '789 Warehouse St, Village, Country');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD PRIMARY KEY (`InventoryID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `WarehouseID` (`WarehouseID`);

--
-- Indexes for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Indexes for table `Shipments`
--
ALTER TABLE `Shipments`
  ADD PRIMARY KEY (`ShipmentID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `Suppliers`
--
ALTER TABLE `Suppliers`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `Warehouses`
--
ALTER TABLE `Warehouses`
  ADD PRIMARY KEY (`WarehouseID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`WarehouseID`) REFERENCES `Warehouses` (`WarehouseID`);

--
-- Constraints for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`);

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `Suppliers` (`SupplierID`);

--
-- Constraints for table `Shipments`
--
ALTER TABLE `Shipments`
  ADD CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
