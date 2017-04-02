
CREATE TABLE `owllocal` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `mrnumber` varchar(10) NOT NULL,
  `testnumber` int(11) NOT NULL,
  `currentdate` datetime NOT NULL,
  `leftimage` mediumblob,
  `rightimage` mediumblob,
  PRIMARY KEY (`sno`)
) 

CREATE TABLE `pediperilocal` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `mrnumber` varchar(50) NOT NULL,
  `testnumber` int(11) NOT NULL,
  `nooftextfiles` int(11) NOT NULL,
  `currentdate` datetime NOT NULL,
  `videofile` longblob,
  `imagefile1` mediumblob,
  `imagefile2` mediumblob,
  `textfile1` mediumblob,
  `textfile2` mediumblob,
  `textfile3` mediumblob,
  PRIMARY KEY (`sno`)
) 

CREATE TABLE `pupillocal` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `mrnumber` varchar(10) NOT NULL,
  `testnumber` int(11) NOT NULL,
  `currentdate` datetime NOT NULL,
  `videofile1` longblob,
  `videofile2` longblob,
  `videofile3` longblob,
  `excelfile1` mediumblob,
  `excelfile2` mediumblob,
  PRIMARY KEY (`sno`)
) 
