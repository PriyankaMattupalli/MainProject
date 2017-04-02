
CREATE TABLE `folding_phoropter` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date DEFAULT NULL,
  `age` varchar(5) NOT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `eye_lens` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `currentdate` datetime DEFAULT NULL,
  `left_eye_error_1` float NOT NULL,
  `left_eye_error_2` float NOT NULL,
  `left_eye_error_3` float NOT NULL,
  `left_spherical` float DEFAULT '0',
  `left_cylindrical` float DEFAULT '0',
  `left_axis` float DEFAULT '0',
  `left_remarks` varchar(255) DEFAULT NULL,
  `right_eye_error_1` float NOT NULL,
  `right_eye_error_2` float NOT NULL,
  `right_eye_error_3` float NOT NULL,
  `right_spherical` float DEFAULT NULL,
  `right_cylindrical` float DEFAULT NULL,
  `right_axis` float DEFAULT NULL,
  `right_remarks` varchar(255) DEFAULT NULL,
  `locality` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) 

CREATE TABLE `members` (
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `uname` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `institute` varchar(60) DEFAULT NULL,
  `permissions` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uname`)
) 

CREATE TABLE `patients` (
  `mrnumber` varchar(10) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`mrnumber`)
) 

CREATE TABLE `pediperimain` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `mrnumber` varchar(50) NOT NULL,
  `testnumber` int(11) NOT NULL,
  `testdate` datetime NOT NULL,
  `inserttime` datetime DEFAULT NULL,
  `clientuser` varchar(50) DEFAULT NULL,
  `clientipaddress` varchar(50) DEFAULT NULL,
  `videofilepath` varchar(200) DEFAULT NULL,
  `image1filepath` varchar(200) DEFAULT NULL,
  `image2filepath` varchar(200) DEFAULT NULL,
  `textfile1path` varchar(200) DEFAULT NULL,
  `textfile2path` varchar(200) DEFAULT NULL,
  `textfile3path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) 

CREATE TABLE `permissions` (
  `uname` varchar(45) NOT NULL,
  `fppermission` tinyint(1) DEFAULT NULL,
  `owlpermission` tinyint(1) DEFAULT NULL,
  `pediperipermission` tinyint(1) DEFAULT NULL,
  `pupilpermission` tinyint(1) DEFAULT NULL,
  `lastupdatedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`uname`)
) 

CREATE TABLE `pupilmain` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `mrnumber` varchar(10) NOT NULL,
  `testnumber` int(11) NOT NULL,
  `testdate` datetime NOT NULL,
  `inserttime` datetime DEFAULT NULL,
  `clientuser` varchar(50) DEFAULT NULL,
  `clientipaddress` varchar(50) DEFAULT NULL,
  `videofilepath1` varchar(200) DEFAULT NULL,
  `videofilepath2` varchar(200) DEFAULT NULL,
  `videofilepath3` varchar(200) DEFAULT NULL,
  `excelfile1path` varchar(200) DEFAULT NULL,
  `excelfile2path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) 
