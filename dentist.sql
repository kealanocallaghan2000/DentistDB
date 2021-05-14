SET default_storage_engine=InnoDB;
DROP DATABASE IF EXISTS `dentistdb`;

CREATE DATABASE `dentistdb`;

USE `dentistdb`;

/* Patient Table*/

DROP TABLE IF EXISTS `patient_table`;

CREATE TABLE `patient_table` (
  `pid` int(11) unsigned not null auto_increment,
  `specialist` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `patient_table` WRITE;
INSERT INTO `patient_table` VALUES (1,'y'),(2,'y'),(3,'n'),(4,'n'),(5,'y'),(6,'n'),(7,'y');
UNLOCK TABLES;

/* Info Table*/

DROP TABLE IF EXISTS `info_table`;

CREATE TABLE `info_table` (
  `pid` int(11) unsigned not null auto_increment,
  `pname` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `pNumber` int(11) DEFAULT NULL, 
  KEY `pname` (`pname`),
  PRIMARY KEY (`pid`),
  CONSTRAINT `info_table_constraint` FOREIGN KEY (`pid`) REFERENCES `patient_table` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_table`
--

LOCK TABLES `info_table` WRITE;
INSERT INTO `info_table` VALUES (1,'Fred','2000-12-06',0838101439),(2,'Tom','1976-07-12',0853861439),(3,'Darragh','2007-01-05',0873958422),(4,'Sean','1991-10-10',0833955847),(5,'Sarah','2005-01-16',0855676847),(6,'Eoghan','1998-12-02',0859374634),(7,'Laura','2002-02-20',0874958334);
UNLOCK TABLES;

/* Appointment Table*/

DROP TABLE IF EXISTS `appointment_table`;

CREATE TABLE `appointment_table` (
  `pid` int(11) unsigned not null auto_increment,
  `pname` varchar(20) DEFAULT NULL,
  `app_date` date DEFAULT NULL,
  `paid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `paid` (`paid`),
  CONSTRAINT `appointment_table_constraint` FOREIGN KEY (`pid`) REFERENCES `patient_table` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `appointment_table` WRITE;
INSERT INTO `appointment_table` VALUES (1,'Fred','2021-02-10', 'y'),(2,'Tom','2021-04-15', 'y'),(3,'Darragh','2021-02-28', 'n'),(4,'Sean','2021-03-02', 'y'),(5,'Sarah','2021-01-16', 'y'),(6,'Eoghan','2021-12-01', 'n'),(7,'Laura','2021-02-13', 'n');
UNLOCK TABLES;


/* Payment Table*/

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `pid` int(11) unsigned not null auto_increment,
  `price` double(8,2) DEFAULT NULL,
  `paid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient_table` (`pid`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`paid`) REFERENCES `appointment_table` (`paid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `payment` WRITE;
INSERT INTO `payment` VALUES (1,410.0,'y'),(2,90.0,'y'),(3,4750.0,'n'),(4,110.0,'y'),(5,50.0,'y'),(6,670.0,'n'),(7,200.0,'n');
UNLOCK TABLES;

/* Bill Table*/

DROP TABLE IF EXISTS `bill`;

CREATE TABLE `bill` (
  `pid` int(11) unsigned not null auto_increment,
  `price` double(8,2) DEFAULT NULL,
  `payment_due` date DEFAULT NULL,
  `paid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient_table` (`pid`),
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`paid`) REFERENCES `appointment_table` (`paid`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `bill` WRITE;
INSERT INTO `bill` VALUES (1,410.0,'2021-03-10','y'),(2,90.0,'2021-05-15','y'),(3,4750.0,'2021-01-28','n'),(4,110.0,'2021-04-02','y'),(5,50.0,'2021-04-04','y'),(6,670.0,'2021-01-01','n'),(7,200.0,'2021-01-15','n');
UNLOCK TABLES;

/* Specialists Table*/

DROP TABLE IF EXISTS `specialist_table`;

CREATE TABLE `specialist_table` (
  `sid` int(11) unsigned not null auto_increment,
  `sname` varchar(20) DEFAULT NULL,
  `sNumber` int(11) DEFAULT NULL, 
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `specialist_table` WRITE;
INSERT INTO `specialist_table` VALUES (1,'Mary McD',0838101365),(2,'Luke McHugh',085386347),(3,'James OShea',087393856),(4,'Louise McS',083322956);
UNLOCK TABLES;

/* Treatment Table*/

DROP TABLE IF EXISTS `treatment_table`;

CREATE TABLE `treatment_table` (
  `pid` int(11) unsigned not null auto_increment,
  `pname` varchar(20) DEFAULT NULL,
  `treatment` varchar(20) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient_table` (`pid`),
  CONSTRAINT `treatment_ibfk_2` FOREIGN KEY (`pname`) REFERENCES `info_table` (`pname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `treatment_table` WRITE;
INSERT INTO `treatment_table` VALUES (1,'Fred','Root Canal',410.0),(2,'Tom','Filling',90.0),(3,'Darragh','Braces',4750.0),(4,'Sean','Clean',110.0),(5,'Sarah','Checkup',50.0),(6,'Eoghan','Root Canal',670.0),(7,'Laura','Fillings',200.0);
UNLOCK TABLES;
