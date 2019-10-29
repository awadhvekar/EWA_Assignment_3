-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.27-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for assignment2
DROP DATABASE IF EXISTS `assignment2`;
CREATE DATABASE IF NOT EXISTS `assignment2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `assignment2`;

-- Dumping structure for table assignment2.customerorders
DROP TABLE IF EXISTS `customerorders`;
CREATE TABLE IF NOT EXISTS `customerorders` (
  `OrderId` int(11) NOT NULL,
  `userName` varchar(40) NOT NULL,
  `orderName` varchar(40) NOT NULL,
  `orderPrice` double DEFAULT NULL,
  `userAddress` varchar(40) DEFAULT NULL,
  `creditCardNo` varchar(40) DEFAULT NULL,
  `orderDate` varchar(40) DEFAULT NULL,
  `deliveryDate` varchar(40) DEFAULT NULL,
  `maxOrderCancellationDate` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`OrderId`,`userName`,`orderName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table assignment2.customerorders: ~15 rows (approximately)
DELETE FROM `customerorders`;
/*!40000 ALTER TABLE `customerorders` DISABLE KEYS */;
INSERT INTO `customerorders` (`OrderId`, `userName`, `orderName`, `orderPrice`, `userAddress`, `creditCardNo`, `orderDate`, `deliveryDate`, `maxOrderCancellationDate`) VALUES
	(1, 'AshCustomer', 'Sony Television', 89.99, 'a', '1', '10/02/2019', '10/17/2019', '10/12/2019'),
	(2, 'AshCustomer', 'LG Television', 89.99, 'b', '2', '10/07/2019', '10/21/2019', '10/16/2019'),
	(2, 'AshCustomer', 'Microsoft Television', 89.99, 'b', '2', '10/07/2019', '10/21/2019', '10/16/2019'),
	(2, 'AshCustomer', 'Sony Television', 89.99, 'b', '2', '10/07/2019', '10/21/2019', '10/16/2019'),
	(3, 'AshCustomer', 'Basic Plan', 89.99, 'c', '3', '10/12/2019', '10/26/2019', '10/21/2019'),
	(4, 'AshCustomer', 'LG Headphone', 20.99, 'd', '4', '10/13/2019', '10/27/2019', '10/22/2019'),
	(5, 'AshStoreManager', 'NEW TV', 125, 'Chicago', '6', '10/13/2019', '10/27/2019', '10/22/2019'),
	(6, 'AshCustomer', 'Basic Plan', 22.99, 'chicago', '6', '10/26/2019', '11/09/2019', '11/04/2019'),
	(7, 'AshCustomer', 'Microsoft Television', 150.49, 'chicago', '7', '10/26/2019', '11/09/2019', '11/04/2019'),
	(8, 'AshCustomer', 'Microsoft Television', 150.49, 'chicago', '8', '10/26/2019', '11/09/2019', '11/04/2019'),
	(9, 'AshCustomer', 'Microsoft Television', 150.49, 'asasd', '9', '10/26/2019', '11/09/2019', '11/04/2019'),
	(10, 'AshCustomer', 'Microsoft Television', 150.49, 'chicago', '10', '10/26/2019', '11/09/2019', '11/04/2019'),
	(11, 'AshStoreManager', 'Basic Plan', 22.99, 'Chicago', '675', '10/29/2019', '11/12/2019', '11/07/2019'),
	(12, 'AshStoreManager', 'Sony Television', 119.99, 'Chicago', '65', '10/29/2019', '11/12/2019', '11/07/2019'),
	(13, 'AshStoreManager', 'LG FitnessWatch', 399.99, 'Chicago', '3534', '10/29/2019', '11/12/2019', '11/07/2019');
/*!40000 ALTER TABLE `customerorders` ENABLE KEYS */;

-- Dumping structure for table assignment2.productdetails
DROP TABLE IF EXISTS `productdetails`;
CREATE TABLE IF NOT EXISTS `productdetails` (
  `ProductType` varchar(20) DEFAULT NULL,
  `Id` varchar(30) NOT NULL,
  `productName` varchar(40) DEFAULT NULL,
  `productPrice` double DEFAULT NULL,
  `productImage` varchar(40) DEFAULT NULL,
  `productManufacturer` varchar(40) DEFAULT NULL,
  `productCondition` varchar(40) DEFAULT 'New',
  `productDiscount` double DEFAULT NULL,
  `numberOfAvailableProducts` int(11) DEFAULT '10',
  `numberOfItemsSold` int(11) DEFAULT '2',
  `manufacturerRebate` int(11) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table assignment2.productdetails: ~43 rows (approximately)
DELETE FROM `productdetails`;
/*!40000 ALTER TABLE `productdetails` DISABLE KEYS */;
INSERT INTO `productdetails` (`ProductType`, `Id`, `productName`, `productPrice`, `productImage`, `productManufacturer`, `productCondition`, `productDiscount`, `numberOfAvailableProducts`, `numberOfItemsSold`, `manufacturerRebate`) VALUES
	('wirelessPlan', 'basic', 'Basic Plan', 22.99, 'basicwp.jpg', 'Basic', 'New', 2.99, 8, 4, 0),
	('fitnessWatch', 'lg_fitness_watch', 'LG FitnessWatch', 399.99, 'lgfw.jpg', 'LG', 'New', 0.99, 9, 3, 0),
	('headphone', 'lg_headphone', 'LG Headphone', 20.99, 'lghp.jpg', 'LG', 'New', 1.99, 4, 2, 0),
	('laptop', 'lg_laptop', 'LG Laptop', 689.99, 'lglap.jpg', 'LG', 'New', 89.99, 7, 2, 0),
	('phone', 'lg_phone', 'LG Phone', 389.99, 'lgph.jpg', 'LG', 'New', 19.99, 5, 2, 100),
	('smartWatch', 'lg_smart_watch', 'LG SmartWatch', 289.99, 'lgsw.jpg', 'LG', 'New', 9.99, 8, 2, 0),
	('soundSystem', 'lg_sound_system', 'LG SoundSystem', 72.99, 'lgss.jpg', 'LG', 'Refurbished', 2.99, 2, 2, 0),
	('television', 'lg_tv', 'LG Television', 87.99, 'lgtv.jpg', 'LG', 'New', 2.99, 10, 2, 0),
	('voiceAssistant', 'lg_voice_assistant', 'LG VoiceAssistant', 199.99, 'lgva.jpg', 'LG', 'New', 9.99, 3, 2, 0),
	('fitnessWatch', 'microsoft_fitness_watch', 'Microsoft FitnessWatch', 40.99, 'msfw.jpg', 'Microsoft', 'New', 0, 10, 2, 0),
	('headphone', 'microsoft_headphone', 'Microsoft Headphone', 149.99, 'mshp.jpg', 'Microsoft', 'New', 20, 10, 2, 0),
	('laptop', 'microsoft_laptop', 'Microsoft Laptop', 849.99, 'mslap.jpg', 'Microsoft', 'New', 0, 10, 2, 51),
	('phone', 'microsoft_phone', 'Microsoft Phone', 589.99, 'msph.jpg', 'Microsoft', 'New', 19.99, 6, 2, 0),
	('smartWatch', 'microsoft_smart_watch', 'Microsoft SmartWatch', 389.99, 'mssw.jpg', 'Microsoft', 'New', 50, 10, 2, 0),
	('soundSystem', 'microsoft_sound_system', 'Microsoft SoundSystem', 50.99, 'msss.jpg', 'Microsoft', 'New', 15.99, 7, 2, 0),
	('television', 'microsoft_tv', 'Microsoft Television', 150.49, 'mstv.jpg', 'Microsoft', 'New', 0, 9, 3, 10),
	('voiceAssistant', 'microsoft_voice_assistant', 'Microsoft VoiceAssistant', 150.99, 'msva.jpg', 'Microsoft', 'New', 0.99, 10, 2, 0),
	('fitnessWatch', 'onida_fitness_watch', 'Onida FitnessWatch', 289.99, 'onidafw.jpg', 'Onida', 'New', 0, 5, 2, 13),
	('headphone', 'onida_headphone', 'Onida Headphone', 89.99, 'onidahp.jpg', 'Onida', 'New', 0, 10, 2, 0),
	('laptop', 'onida_laptop', 'Onida Laptop', 489.99, 'onidalap.jpg', 'Onida', 'New', 0, 7, 2, 0),
	('phone', 'onida_phone', 'Onida Phone', 300.99, 'onidaph.jpg', 'Onida', 'New', 0.99, 10, 2, 11),
	('smartWatch', 'onida_smart_watch', 'Onida SmartWatch', 149.99, 'onidasw.jpg', 'Microsoft', 'New', 40, 10, 2, 0),
	('soundSystem', 'onida_sound_system', 'Onida SoundSystem', 59.99, 'onidass.jpg', 'Onida', 'New', 15, 3, 2, 10),
	('television', 'onida_tv', 'Onida Television', 75.99, 'onidatv.jpg', 'Onida', 'New', 5.99, 10, 2, 0),
	('voiceAssistant', 'onida_voice_assistant', 'Onida VoiceAssistant', 149.99, 'onidava.jpg', 'Onida', 'New', 9.99, 10, 2, 0),
	('wirelessPlan', 'premium', 'Premium Plan', 32.99, 'premiumwp.jpg', 'Premium', 'New', 7.99, 2, 2, 0),
	('fitnessWatch', 'samsung_fitness_watch', 'Samsung FitnessWatch', 499.99, 'samsungfw.jpg', 'Samsung', 'New', 99.99, 5, 2, 0),
	('headphone', 'samsung_headphone', 'Samsung Headphone ', 89.99, 'samsunghp.jpg', 'Samsung', 'New', 0, 10, 2, 12),
	('laptop', 'samsung_laptop', 'Samsung Laptop', 520.99, 'samsunglap.jpg', 'Samsung', 'New', 20.99, 6, 2, 0),
	('phone', 'samsung_phone', 'Samsung Phone', 489.99, 'samsungph.jpg', 'Samsung', 'Used', 39.99, 4, 2, 0),
	('smartWatch', 'samsung_smart_watch', 'Samsung SmartWatch', 280.99, 'samsungsw.jpg', 'Samsung', 'New', 30.99, 10, 2, 10),
	('soundSystem', 'samsung_sound_system', 'Samsung SoundSystem', 200.99, 'samsungss.jpg', 'Samsung', 'New', 0, 10, 2, 0),
	('television', 'samsung_tv', 'Samsung Television', 99.99, 'samsungtv.jpg ', 'Samsung', 'New', 4.99, 10, 2, 5),
	('voiceAssistant', 'samsung_voice_assistant', 'Samsung VoiceAssistant', 50.99, 'samsungva.jpg', 'Samsung', 'New', 0.99, 9, 2, 1),
	('fitnessWatch', 'sony_fitness_watch', 'Sony FitnessWatch', 289.99, 'sonyfw.jpg', 'Sony', 'New', 9.99, 10, 2, 11),
	('headphone', 'sony_headphone', 'Sony Headphone', 189.99, 'sonyhp.jpg', 'Sony', 'New', 9.99, 10, 2, 0),
	('laptop', 'sony_laptop', 'Sony Laptop', 549.99, 'sonylap.jpg', 'Sony', 'New', 19.99, 1, 2, 0),
	('phone', 'sony_phone', 'Sony Phone', 189.99, 'sonyph.jpg', 'Sony', 'New', 40, 10, 2, 13),
	('smartWatch', 'sony_smart_watch', 'Sony SmartWatch', 389.99, 'sonysw.jpg', 'Sony', 'New', 29.99, 10, 2, 13),
	('soundSystem', 'sony_sound_system', 'Sony SoundSystem', 112.99, 'sonyss.jpg', 'Sony', 'New', 12.99, 4, 2, 0),
	('television', 'sony_tv', 'Sony Television', 119.99, 'sonytv.jpg', 'Sony', 'New', 9.99, 9, 3, 0),
	('voiceAssistant', 'sony_voice_assistant', 'Sony VoiceAssistant', 149.99, 'sonyva.jpg', 'Sony', 'New', 4.99, 5, 2, 0),
	('wirelessPlan', 'ultimate', 'Ultimate Plan', 42.99, 'ultimatewp.jpg', 'Ultimate', 'New', 12.99, 10, 2, 2);
/*!40000 ALTER TABLE `productdetails` ENABLE KEYS */;

-- Dumping structure for table assignment2.product_accessories
DROP TABLE IF EXISTS `product_accessories`;
CREATE TABLE IF NOT EXISTS `product_accessories` (
  `productName` varchar(20) DEFAULT NULL,
  `accessoriesName` varchar(20) DEFAULT NULL,
  KEY `productName` (`productName`),
  KEY `accessoriesName` (`accessoriesName`),
  CONSTRAINT `product_accessories_ibfk_1` FOREIGN KEY (`productName`) REFERENCES `productdetails` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_accessories_ibfk_2` FOREIGN KEY (`accessoriesName`) REFERENCES `productdetails` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table assignment2.product_accessories: ~0 rows (approximately)
DELETE FROM `product_accessories`;
/*!40000 ALTER TABLE `product_accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_accessories` ENABLE KEYS */;

-- Dumping structure for table assignment2.registration
DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `repassword` varchar(40) DEFAULT NULL,
  `usertype` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table assignment2.registration: ~6 rows (approximately)
DELETE FROM `registration`;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` (`username`, `password`, `repassword`, `usertype`) VALUES
	('AshCustomer', 'AshCustomer', 'AshCustomer', 'customer'),
	('AshStoreManager', 'AshStoreManager', 'AshStoreManager', 'storeManager'),
	('AshSalesman', 'AshSalesman', 'AshSalesman', 'salesman'),
	('Customer1', 'Customer1', 'Customer1', 'customer'),
	('Customer2', 'Customer2', 'Customer2', 'customer'),
	('Customer3', 'Customer3', 'Customer3', 'customer'),
	('Customer4', 'Customer4', 'Customer4', 'customer');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;

-- Dumping structure for procedure assignment2.SP_UpdateProductCatalogCount
DROP PROCEDURE IF EXISTS `SP_UpdateProductCatalogCount`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpdateProductCatalogCount`(
	IN `IN_productName` VARCHAR(50)

)
    COMMENT 'After successful payment, decrement numberOfAvailableProducts by 1 and increment numberOfItemsSold by 1'
BEGIN
	declare v_numberOfAvailableProducts_old int;
	declare v_numberOfItemsSold_old int;
	declare v_numberOfAvailableProducts_new int;
	declare v_numberOfItemsSold_new int;
	
	START TRANSACTION;
	SELECT numberOfAvailableProducts into v_numberOfAvailableProducts_old FROM productdetails WHERE productName=IN_productName;
	SELECT numberOfItemsSold into v_numberOfItemsSold_old FROM productdetails WHERE productName=IN_productName;
	
	SET v_numberOfAvailableProducts_new = v_numberOfAvailableProducts_old - 1;
	-- SELECT v_numberOfAvailableProducts_new;
	
	SET v_numberOfItemsSold_new = v_numberOfItemsSold_old + 1;
	-- SELECT v_numberOfItemsSold_new,v_numberOfAvailableProducts_new;
	
	UPDATE productdetails
		SET
			numberOfAvailableProducts = v_numberOfAvailableProducts_new,
			numberOfItemsSold = v_numberOfItemsSold_new
		WHERE
			productName=IN_productName;
	
	COMMIT;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
