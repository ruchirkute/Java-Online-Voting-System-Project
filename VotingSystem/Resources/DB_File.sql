create schema votingDatabase;

CREATE TABLE `devlang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `votes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


  
CREATE TABLE `studentdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


  
CREATE USER 'votingDatabase'@'localhost' IDENTIFIED BY 'vote12457';


GRANT ALL PRIVILEGES ON votingdatabase.* TO 'votingDatabase'@'localhost' WITH GRANT OPTION;


SHOW GRANTS FOR 'votingDatabase'@'localhost';