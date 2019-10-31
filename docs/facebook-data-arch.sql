CREATE TABLE `Post` (
  `ID` int,
  `User_ID` int,
  `Title` varchar(15),
  `Description` varchar(500),
  PRIMARY KEY (`ID`),
  KEY `FK` (`User_ID`)
);

CREATE TABLE `Friend` (
  `ID` int,
  `User_ID` int,
  `Friend_ID` int,
  `Status` varchar(10),
  PRIMARY KEY (`ID`),
  KEY `FK` (`User_ID`, `Friend_ID`)
);

CREATE TABLE `User` (
  `ID` int,
  `Username` varchar(10),
  `Email` varchar(25),
  `Password` varchar(25),
  `ImageLink` varchar(100),
  PRIMARY KEY (`ID`)
);

CREATE TABLE `Like` (
  `ID` int,
  `User_ID` int,
  `Post_ID` int,
  PRIMARY KEY (`ID`),
  KEY `FK` (`User_ID`, `Post_ID`)
);

CREATE TABLE `Comment` (
  `ID` int,
  `User_ID` int,
  `Post_ID` int,
  `Text` varchar(200),
  PRIMARY KEY (`ID`),
  KEY `FK` (`User_ID`, `Post_ID`)
);


