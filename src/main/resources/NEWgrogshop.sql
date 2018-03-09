/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.17-log : Database - grogshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`grogshop` /*!40100 DEFAULT CHARACTER SET utf8 */;


USE grogshop;
/*Table structure for table `attribute` */

DROP TABLE IF EXISTS `attribute`;

CREATE TABLE `attribute` (
  `attributeId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `attributeName` VARCHAR(30) DEFAULT NULL COMMENT '属性名称',
  PRIMARY KEY (`attributeId`)
) ENGINE=INNODB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `attribute` */

insert  into `attribute`(`attributeId`,`attributeName`) values (1,'房态'),(2,'客房等级'),(3,'商品类别'),(4,'支付方式'),(5,'出租方式'),(6,'结账单位'),(7,'旅客类别'),(8,'性别'),(9,'民族'),(10,'证件'),(11,'文化程度'),(12,'事由'),(13,'旅客级别'),(14,'对象类别'),(15,'计量单位'),(16,'预定状态'),(17,'结账');

/*Table structure for table `attributedetails` */

DROP TABLE IF EXISTS `attributedetails`;

CREATE TABLE `attributedetails` (
  `attributedetailsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性明细ID',
  `attributeID` int(11) DEFAULT NULL COMMENT '属性ID',
  `attributeDetailsName` varchar(30) DEFAULT NULL COMMENT '属性明细名称',
  PRIMARY KEY (`attributedetailsId`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

/*Data for the table `attributedetails` */

insert  into `attributedetails`(`attributedetailsId`,`attributeID`,`attributeDetailsName`) values (1,1,'空房'),(2,1,'自用房'),(4,1,'预定'),(5,1,'待清洁'),(6,1,'待维修'),(7,1,'不可用'),(8,2,'单人普通房'),(9,2,'单人标准间'),(10,2,'二人普通房'),(11,2,'二人标准间'),(12,2,'豪华间'),(13,2,'会议室'),(14,2,'总统套房'),(15,3,'餐饮类'),(16,3,'饮料类'),(17,3,'食品类'),(18,3,'烟酒类'),(19,3,'人为损坏类'),(20,3,'其他'),(21,4,'现金'),(22,4,'转账'),(23,4,'信用卡'),(24,999,'其他'),(25,5,'钟点'),(26,5,'全日'),(27,6,'旅客自付'),(28,6,'团队付款'),(29,7,'国内旅客'),(30,7,'国外旅客'),(31,8,'男'),(32,8,'女'),(33,9,'汉'),(34,9,'苗'),(35,9,'壮'),(36,9,'其他'),(37,10,'二代身份证'),(38,10,'护照'),(39,10,'其他'),(40,11,'无'),(41,11,'小学'),(42,11,'初中'),(43,11,'高中'),(44,11,'大专'),(45,11,'本科'),(46,11,'研究生'),(47,11,'硕士'),(48,11,'博士'),(49,11,'其他'),(50,12,'公务出差'),(51,12,'个人旅行'),(52,13,'首次'),(53,13,'熟客'),(54,13,'VIP'),(55,14,'散客'),(56,14,'团队'),(57,15,'瓶'),(58,15,'台'),(59,15,'条'),(60,15,'支'),(61,15,'个'),(62,15,'只'),(63,15,'包'),(65,1,'满'),(66,16,'未安排'),(67,16,'已安排'),(68,17,'未结账'),(69,17,'已结账'),(70,15,'份'),(71,15,'碟'),(72,4,'退房再结'),(73,17,'未退房');

/*Table structure for table `commodity` */

DROP TABLE IF EXISTS `commodity`;

CREATE TABLE `commodity` (
  `commodityId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `commodityTypeID` int(11) DEFAULT NULL COMMENT '商品类别ID',
  `uOMID` int(11) DEFAULT NULL COMMENT '计量单位ID',
  `commodityName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `salePrice` decimal(8,2) DEFAULT NULL COMMENT '销售价格',
  PRIMARY KEY (`commodityId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `commodity` */

insert  into `commodity`(`commodityId`,`commodityTypeID`,`uOMID`,`commodityName`,`salePrice`) values (1,15,62,'北京烤鸭','500.00'),(2,16,57,'雪碧','7.00'),(3,16,57,'可乐','7.00'),(4,19,58,'空调','3000.00'),(5,17,63,'薯片王','21.00'),(6,15,62,'红烧猪蹄','201.00'),(8,16,57,'哇哈哈','5.00'),(9,18,63,'经典双喜','20.00'),(10,15,70,'红色排骨','129.00');

/*Table structure for table `consumptiondetails` */

DROP TABLE IF EXISTS `consumptiondetails`;

CREATE TABLE `consumptiondetails` (
  `consumptiondetailsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '消费明细ID',
  `stayRegisterID` int(11) DEFAULT NULL COMMENT '住宿登记ID',
  `cID` int(11) DEFAULT NULL COMMENT '商品ID',
  `consumptionNumber` varchar(10) DEFAULT NULL COMMENT '消费数量',
  `consumptionMoney` decimal(8,2) DEFAULT NULL COMMENT '消费金额',
  `consumptionTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '消费时间',
  PRIMARY KEY (`consumptiondetailsId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `consumptiondetails` */

insert  into `consumptiondetails`(`consumptiondetailsId`,`stayRegisterID`,`cID`,`consumptionNumber`,`consumptionMoney`,`consumptionTime`) values (6,1,3,'3','21.00','2016-12-05 11:38:21'),(8,6,1,'2','1000.00','2016-12-06 17:02:37'),(9,18,2,'2','14.00','2017-01-10 11:24:40'),(10,18,3,'1','7.00','2017-01-10 11:25:12'),(11,18,8,'1','5.00','2017-01-10 21:22:23'),(13,16,3,'1','7.00','2017-01-10 21:22:50'),(14,16,8,'1','5.00','2017-01-10 21:22:50'),(15,17,2,'2','14.00','2017-01-11 08:40:36'),(16,17,3,'1','7.00','2017-01-11 08:40:36'),(17,22,2,'2','14.00','2017-01-11 21:08:57'),(18,25,2,'2','14.00','2017-02-21 09:12:05'),(20,26,2,'1','7.00','2017-02-21 15:04:26'),(21,26,8,'1','5.00','2017-02-21 15:04:26'),(22,27,2,'1','7.00','2017-02-21 15:08:36'),(23,28,5,'2','42.00','2017-02-21 16:01:09'),(24,31,2,'1','7.00','2017-02-21 16:12:48'),(25,33,2,'1','7.00','2017-02-22 11:23:40'),(26,32,5,'1','21.00','2017-02-22 11:24:02'),(27,34,1,'1','500.00','2017-02-23 11:15:28'),(29,35,2,'1','7.00','2017-02-23 11:21:37'),(30,36,4,'1','3000.00','2017-02-23 11:22:06'),(31,37,5,'1','21.00','2017-02-23 11:30:19'),(32,42,2,'1','7.00','2017-02-27 09:27:38'),(33,42,8,'2','10.00','2017-02-27 09:27:38'),(34,43,2,'1','7.00','2017-02-28 09:44:46'),(35,41,8,'2','10.00','2017-02-28 09:45:00'),(36,40,3,'1','7.00','2017-02-28 09:45:18'),(37,52,4,'5','15000.00','2018-03-07 20:46:07'),(38,52,5,'1','21.00','2018-03-07 20:46:07'),(39,54,9,'1','20.00','2018-03-07 21:13:17'),(40,54,10,'1','129.00','2018-03-07 21:13:17'),(41,55,9,'1','20.00','2018-03-07 21:20:39'),(42,55,10,'1','129.00','2018-03-07 21:20:39'),(43,56,5,'5','105.00','2018-03-07 21:33:44'),(44,58,5,'1','21.00','2018-03-07 22:44:58'),(45,58,6,'1','201.00','2018-03-07 22:44:58');

/*Table structure for table `depoit` */

DROP TABLE IF EXISTS `depoit`;

CREATE TABLE `depoit` (
  `depoitId` int(11) NOT NULL AUTO_INCREMENT,
  `payID` int(11) DEFAULT NULL COMMENT '支付方式ID',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登记时间',
  `depositMoney` decimal(8,2) DEFAULT NULL COMMENT '押金',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`depoitId`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

/*Data for the table `depoit` */

insert  into `depoit`(`depoitId`,`payID`,`registerDate`,`depositMoney`,`remarks`) values (1,21,'2016-12-02 16:44:48','300.00',NULL),(3,21,'2016-12-03 20:12:56','200.00',NULL),(4,NULL,'2016-12-04 11:16:59','0.00',NULL),(5,21,'2016-12-04 11:20:59','145.00',NULL),(6,21,'2016-12-04 11:20:59','2.00',NULL),(7,21,'2016-12-04 11:24:36','22.00',NULL),(8,21,'2016-12-04 11:35:33','2.00',NULL),(9,21,'2016-12-04 14:41:02','32.00',NULL),(10,21,'2016-12-04 14:41:21','2.00',NULL),(11,21,'2016-12-04 14:48:38','33.00',NULL),(12,21,'2016-12-04 15:06:07','99.00',NULL),(13,21,'2016-12-04 15:07:55','88.00',NULL),(14,21,'2016-12-05 15:34:33','200.00',NULL),(15,21,'2016-12-05 16:48:58','100.00',NULL),(16,21,'2016-12-06 16:30:45','2.00',NULL),(17,21,'2016-12-06 16:59:53','200.00',NULL),(18,21,'2016-12-06 17:01:42','10.00',NULL),(19,21,'2018-03-02 21:39:34','220.00',NULL),(20,21,'2017-01-09 16:37:03','100.00',NULL),(21,21,'2017-01-09 16:37:03','100.00',NULL),(22,21,'2017-01-09 16:37:03','100.00',NULL),(23,21,'2017-01-09 16:41:38','100.00',NULL),(24,21,'2017-01-09 16:41:38','100.00',NULL),(25,21,'2018-03-02 22:08:46','4525.00','das'),(26,21,'2017-01-09 16:49:16','100.00',NULL),(27,21,'2017-01-09 20:04:47','100.00',NULL),(28,21,'2017-01-09 20:04:47','100.00',NULL),(29,21,'2017-01-09 20:15:12','20.00',NULL),(30,21,'2017-01-10 10:12:44','200.00',NULL),(31,21,'2017-01-10 11:23:03','100.00',NULL),(32,21,'2017-01-10 11:23:03','100.00',NULL),(33,21,'2017-01-10 11:23:49','50.00',NULL),(34,21,'2017-01-10 11:27:52','1.00',NULL),(35,21,'2017-01-10 21:12:13','1.00',NULL),(36,21,'2017-01-11 09:17:52','1.00',NULL),(37,21,'2017-01-11 09:17:52','1.00',NULL),(38,21,'2017-01-11 15:33:59','100.00',NULL),(39,21,'2017-01-11 21:08:33','2.00',NULL),(40,21,'2017-02-21 08:26:14','100.00',NULL),(41,21,'2017-02-21 08:26:14','100.00',NULL),(42,21,'2017-02-21 09:11:16','200.00',NULL),(43,21,'2017-02-21 15:01:03','200.00',NULL),(44,21,'2017-02-21 15:03:42','100.00',NULL),(45,21,'2017-02-21 15:07:54','1.00',NULL),(46,21,'2017-02-21 15:08:24','1.00',NULL),(47,21,'2017-02-21 15:58:29','33.33',NULL),(48,21,'2017-02-21 15:58:29','33.33',NULL),(49,21,'2017-02-21 15:58:29','33.33',NULL),(50,21,'2017-02-21 16:12:08','200.00',NULL),(51,21,'2017-02-22 11:22:36','100.00',NULL),(52,21,'2017-02-22 11:22:36','100.00',NULL),(53,21,'2017-02-22 11:23:13','1.00',NULL),(54,21,'2017-02-22 11:23:20','2.00',NULL),(55,21,'2017-02-23 11:12:16','100.00',NULL),(56,21,'2017-02-23 11:14:57','1.00',NULL),(57,21,'2017-02-23 11:19:38','100.00',NULL),(58,21,'2017-02-23 11:19:38','100.00',NULL),(59,21,'2017-02-23 11:20:52','1.00',NULL),(60,21,'2017-02-23 11:21:11','2.00',NULL),(61,21,'2017-02-23 11:28:56','100.00',NULL),(62,21,'2017-02-23 11:29:08','100.00',NULL),(63,21,'2017-02-23 11:29:08','100.00',NULL),(64,21,'2017-02-23 11:30:05','10.00',NULL),(65,21,'2017-02-24 15:39:57','100.00',NULL),(66,21,'2017-02-24 15:39:57','100.00',NULL),(67,21,'2017-02-26 21:23:51','100.00',NULL),(68,21,'2017-02-27 11:14:27','2.00',NULL),(69,21,'2017-02-27 20:22:31','100.00',NULL),(70,21,'2017-02-28 09:44:02','2.00',NULL),(71,21,'2017-02-28 09:44:19','2.00',NULL),(72,21,'2017-02-28 09:44:31','3.00',NULL),(73,21,'2017-03-01 08:53:35','200.00',NULL),(74,21,'2018-03-04 22:47:38',NULL,NULL),(75,21,'2018-03-07 17:02:20','200.00',NULL),(76,21,'2018-03-07 17:09:33','200.00',NULL),(77,21,'2018-03-07 17:11:54','200.00',NULL),(78,21,'2018-03-07 17:16:30','200.00',NULL),(79,21,'2018-03-07 17:20:43','200.00',NULL),(80,21,'2018-03-07 17:22:49','200.00',NULL),(81,21,'2018-03-07 17:23:21','200.00',NULL),(82,21,'2018-03-07 17:24:33','200.00',NULL),(83,21,'2018-03-07 18:50:44','200.00',NULL),(84,21,'2018-03-07 18:53:04','200.00',NULL),(85,21,'2018-03-07 19:00:11','200.00',NULL),(86,21,'2018-03-07 19:06:19','200.00',NULL),(87,21,'2018-03-07 19:44:11','200.00',NULL),(88,21,'2018-03-07 19:46:53','200.00',NULL),(89,21,'2018-03-07 20:10:41','200.00',NULL),(90,21,'2018-03-07 20:12:10','200.00',NULL),(91,21,'2018-03-07 20:26:17','200.00',NULL),(92,21,'2018-03-07 20:30:23','200.00',NULL),(93,21,'2018-03-07 20:31:06','200.00',NULL),(94,21,'2018-03-07 20:38:30','200.00',NULL),(95,21,'2018-03-07 20:41:47','200.00',NULL),(96,21,'2018-03-07 20:44:07','200.00',NULL),(97,21,'2018-03-07 20:46:07','200.00',NULL),(98,21,'2018-03-07 20:47:05','200.00',NULL),(99,21,'2018-03-07 21:13:10','200.00',NULL),(100,21,'2018-03-07 21:20:39','200.00',NULL),(101,21,'2018-03-07 21:33:43','200.00',NULL),(102,21,'2018-03-07 22:44:58','200.00',NULL);

/*Table structure for table `passenger` */

DROP TABLE IF EXISTS `passenger`;

CREATE TABLE `passenger` (
  `pId` int(11) NOT NULL AUTO_INCREMENT COMMENT '旅客ID',
  `papersID` int(11) DEFAULT NULL COMMENT '证件ID',
  `genderID` int(11) DEFAULT NULL COMMENT '性别ID',
  `passengerLevelID` int(11) DEFAULT NULL COMMENT '旅客级别ID',
  `nationID` int(11) DEFAULT NULL COMMENT '民族ID',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `papersNumber` varchar(30) DEFAULT NULL COMMENT '证件号码',
  `birthDate` varchar(30) DEFAULT NULL COMMENT '出生日期',
  `PhoneNumber` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `createDate` date DEFAULT NULL COMMENT '登记时间',
  PRIMARY KEY (`pId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `passenger` */

insert  into `passenger`(`pId`,`papersID`,`genderID`,`passengerLevelID`,`nationID`,`name`,`papersNumber`,`birthDate`,`PhoneNumber`,`remarks`,`createDate`) values (1,37,31,52,33,'黄旭林','310103198202080411','1994-05-21','13800138001','哈啊哈','2018-03-04'),(2,37,31,52,33,'黄大海','440981198807214211','1988-07-21','18312636707','哈啊哈','2018-03-03'),(3,39,32,53,36,'刘朝武','310103199202080412','1992-02-08','13800138002','666','2018-03-04'),(4,37,31,52,33,'范伟','440981198809094211','1988-09-09','13800138003','哈啊哈','2018-03-04'),(5,37,31,52,33,'程小伟','440981199212213211','1992-12-21','13800138007','哈啊哈','2018-03-04'),(6,37,31,52,33,'孙阳','440981199405214211','1994-05-21','13800138005','哈啊哈','2018-03-04'),(7,37,32,52,33,'李小萌','440981199506083218','1995-06-08','13800138000','美女一枚','2018-03-04'),(12,39,32,53,36,'周海风','210103196202080411','1962-02-08','13800138009','三无市民','2018-03-04'),(15,37,31,52,33,'黄海涛','440981199509113211','1995-09-11','13800138010','哈啊哈','2018-03-04'),(16,37,31,52,33,'黄海量','440981198803014218','1988-03-01','13800138011','哈啊哈','2018-03-04'),(17,37,32,52,33,'白爱美','440981199505054205','1995-05-05','13800138013','哈啊哈','2018-03-04'),(18,39,31,53,36,'何海林','110103196202080411','1962-02-08','13800138018','好牛','2018-03-04'),(19,37,32,52,33,'黄旭玲','440981199405214211','1994-05-21','13800138015','哈啊哈','2018-03-04'),(20,37,32,52,33,'刘爱爱','440981199202204213','1992-02-20','13800138016','美女','2018-03-04'),(21,37,31,52,33,'周鸿弟','310103196202080411','1962-02-08','13800138019','好老师','2018-03-04'),(22,37,31,52,33,'小美','440981199206080020','1992-06-08',NULL,'','2018-03-04'),(23,37,31,52,33,'胡杰友','440981198809094218','1988-09-09',NULL,'','2018-03-04'),(25,37,32,52,33,'杨思雯','440981199606053214','1996-06-05',NULL,'美女','2018-03-04'),(26,37,32,52,33,'胖妞','440981198807214202','1988-07-21',NULL,'','2018-03-04'),(28,37,31,52,33,'顾伟','440981198307214202','1983-07-21',NULL,'','2018-03-04'),(29,37,31,52,33,'da','454564545484','1998-11-11','185454',NULL,'2018-03-04'),(30,37,31,52,33,'发啥呆','123123','2018-03-04 23:31:26','1231','123123','2018-03-04'),(31,37,31,52,33,'test','123123','2018-03-05 14:31:04','123123','asdas','2018-03-05'),(32,37,31,52,33,'test122','312313','2018-03-05 15:40:54','12313','dasda','2018-03-05'),(33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-07'),(34,37,31,52,33,'防撒旦法','asd','2018-03-07 20:53:27','4545','fsdccs','2018-03-07');

/*Table structure for table `predetermine` */

DROP TABLE IF EXISTS `predetermine`;

CREATE TABLE `predetermine` (
  `predetermineId` int(11) NOT NULL AUTO_INCREMENT COMMENT '预定ID',
  `roomID` int(11) DEFAULT NULL COMMENT '房间ID',
  `predetermineTargetID` int(11) DEFAULT NULL COMMENT '预定对象ID',
  `passengerID` int(11) DEFAULT NULL COMMENT '旅客ID',
  `payWayID` int(11) DEFAULT NULL COMMENT '支付方式 ID',
  `predetermineStateID` int(11) DEFAULT NULL COMMENT '预定状态ID',
  `arriveTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '抵达时间',
  `deposit` decimal(8,2) DEFAULT NULL COMMENT '押金',
  `predetermineDay` varchar(10) DEFAULT NULL COMMENT '预定天数',
  `remind` int(11) DEFAULT '0' COMMENT '到时提示',
  PRIMARY KEY (`predetermineId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `predetermine` */

insert  into `predetermine`(`predetermineId`,`roomID`,`predetermineTargetID`,`passengerID`,`payWayID`,`predetermineStateID`,`arriveTime`,`deposit`,`predetermineDay`,`remind`) values (1,13,1,20,21,67,'2018-03-08 13:25:58','100.00','2',1),(2,14,3,21,21,67,'2018-03-08 13:26:00','100.00','2',1),(3,16,2,23,21,67,'2018-03-08 13:26:01','100.00','2',1),(4,17,4,24,21,67,'2018-03-08 13:26:04','100.00','2',1),(5,18,9,25,21,67,'2018-03-08 13:26:06','100.00','2',1),(6,13,11,26,21,67,'2018-03-08 13:26:09','100.00','1',1),(7,13,12,27,21,67,'2018-03-08 13:26:11','100.00','1',1),(9,19,13,28,21,67,'2018-03-08 13:26:14','200.00','2',1),(10,13,1,29,21,67,'2018-03-08 13:26:18','100.00','2',1),(11,27,3,30,21,67,'2018-03-08 13:26:29','100.00','2',1),(12,18,4,31,21,67,'2018-03-08 13:26:39','200.00','2',1),(13,16,5,32,21,67,'2018-03-08 13:26:40','100.00','1',1),(14,17,9,33,21,67,'2018-03-08 13:26:42','100.00','1',1),(15,13,11,34,21,67,'2018-03-08 13:26:44','200.00','2',1),(18,17,12,15,21,67,'2018-03-08 13:26:48','200.00','1',1),(21,13,13,16,21,67,'2018-03-08 13:26:55','100.00','1',1),(22,14,1,17,21,67,'2018-03-08 13:26:59','100.00','1',1),(23,3,3,18,21,67,'2018-03-08 13:27:02','100.00','1',1),(25,13,4,19,21,67,'2018-03-08 13:27:04','100.00','1',1),(26,27,5,20,21,67,'2018-03-08 13:27:06','100.00','1',1);

/*Table structure for table `receivetarget` */

DROP TABLE IF EXISTS `receivetarget`;

CREATE TABLE `receivetarget` (
  `receivetargetId` int(11) NOT NULL AUTO_INCREMENT COMMENT '接待对象ID',
  `targetTypeID` int(11) DEFAULT NULL COMMENT '对象类别ID',
  `principal` varchar(20) DEFAULT NULL COMMENT '负责人',
  `teamName` varchar(30) DEFAULT NULL COMMENT '团队名称',
  `teamCode` varchar(30) DEFAULT NULL COMMENT '团队编号',
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登记时间',
  `contactPhoneNUmber` varchar(20) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`receivetargetId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `receivetarget` */

insert  into `receivetarget`(`receivetargetId`,`targetTypeID`,`principal`,`teamName`,`teamCode`,`registerTime`,`contactPhoneNUmber`) values (1,56,'李亚伟','深圳市蓝途畅游旅行社有限公司','LTC82952','2016-11-20 20:26:12','13800138111'),(2,55,'颜建军','光大国际','55555','2018-03-01 21:50:01','122'),(3,56,'丽丽','丽人旅游团','LiRen001','2016-11-20 20:26:18','13800138112'),(4,56,'罗斯福','光大国际旅行社','GDGZ001','2016-11-20 20:33:24','13800138222'),(5,56,'周海媚','北京青年旅行社','BJQN005','2016-11-20 20:33:50','13800138223'),(9,56,'周冬梅','香港天宝旅行社有限公司','XGTB0892','2016-11-27 16:58:09','13800138225'),(11,56,'王大卫','深圳美之程旅游服务有限公司','SZM8248','2016-11-27 16:58:59','13800138226'),(12,56,'黄晓敏','丽江旅游团','LJ2088','2017-01-10 10:08:52','13800138000'),(13,56,'海滔','爱海滔滔有限公司','AHTT0058','2017-02-21 14:59:42','18312952952');

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `roomId` int(11) NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `guestRoomLevelID` int(11) DEFAULT NULL COMMENT '客房等级ID',
  `roomStateID` int(11) DEFAULT NULL COMMENT '房态ID',
  `roomNumber` varchar(10) DEFAULT NULL COMMENT '房间号',
  `roomAmount` varchar(10) DEFAULT NULL COMMENT '床位数',
  `standardPriceDay` decimal(8,2) DEFAULT NULL COMMENT '标准房价/天',
  `standardPrice` decimal(8,2) DEFAULT NULL COMMENT '标准房价/小时',
  `maxDuration` varchar(10) DEFAULT NULL COMMENT '时长限制（小时）',
  `firstDuration` varchar(10) DEFAULT NULL COMMENT '首段时长（小时）',
  `firstPrice` decimal(8,2) DEFAULT NULL COMMENT '首段价格',
  PRIMARY KEY (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `room` */

insert  into `room`(`roomId`,`guestRoomLevelID`,`roomStateID`,`roomNumber`,`roomAmount`,`standardPriceDay`,`standardPrice`,`maxDuration`,`firstDuration`,`firstPrice`) values (3,8,65,'101','1','100.00','20.00','5','3','50.00'),(4,14,2,'501','3','10000.00','1800.00','5','3','5000.00'),(5,8,3,'404','1','1.00','1.00','1','1','1.00'),(9,8,4,'102','1','100.00','20.00','5','3','50.00'),(10,8,5,'103','1','100.00','20.00','5','3','50.00'),(11,8,6,'104','1','100.00','20.00','5','3','50.00'),(12,9,7,'105','1','150.00','30.00','5','3','80.00'),(13,8,65,'106','1','150.00','30.00','5','3','80.00'),(14,10,4,'107','2','200.00','40.00','5','3','100.00'),(16,10,1,'201','2','180.00','35.00','5','3','100.00'),(17,10,1,'202','2','180.00','35.00','5','3','100.00'),(18,11,1,'203','2','300.00','50.00','5','3','130.00'),(19,11,1,'204','3','300.00','50.00','5','3','130.00'),(20,13,1,'301','1','800.00','200.00','4','3','500.00'),(21,8,1,'3','23','2.00','2.00','2','2','2.00'),(22,13,1,'302','1','1200.00','99.00','5','3','500.00'),(23,12,1,'401','2','1000.00','88.00','5','3','700.00'),(24,14,1,'502','2','8000.00','1500.00','5','3','5000.00'),(25,8,1,'808','2','800000.00','80000.00','5','3','50000.00'),(26,8,1,'9999','99','999.00','999.00','9','5','99.00'),(27,10,1,'108','2','200.00','35.00','5','3','100.00'),(28,8,1,'109','2','200.00','35.00','5','3','100.00'),(29,11,1,'205','2','500.00','100.00','5','3','300.00'),(30,11,1,'206','2','600.00','99.00','5','3','300.00'),(31,11,1,'207','2','800.00','99.00','5','3','500.00'),(32,8,1,'208','2','800.00','100.00','5','3','500.00'),(34,11,1,'307','2','2000.00','2.00','05','03','888.80');

/*Table structure for table `stayregister` */

DROP TABLE IF EXISTS `stayregister`;

CREATE TABLE `stayregister` (
  `stayregisterId` int(11) NOT NULL AUTO_INCREMENT COMMENT '住宿登记ID',
  `predetermineID` int(11) DEFAULT NULL COMMENT '预定ID',
  `rentOutTypeID` int(11) DEFAULT NULL COMMENT '出租方式ID',
  `roomID` int(11) DEFAULT NULL COMMENT '房间ID',
  `payWayID` int(11) DEFAULT NULL COMMENT '结账方式ID',
  `billUnitID` int(11) DEFAULT NULL COMMENT '结账单位ID',
  `passengerTypeID` int(11) DEFAULT NULL COMMENT '旅客类别ID',
  `receiveTargetID` int(11) DEFAULT NULL COMMENT '接待对象ID',
  `isBillID` int(11) DEFAULT NULL COMMENT '结账否',
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `stayNumber` varchar(20) DEFAULT NULL COMMENT '住店天数/小时',
  `sumConst` decimal(8,2) DEFAULT NULL COMMENT '总费用',
  `ChangingRoomNumber` varchar(10) DEFAULT NULL COMMENT '换房次数',
  `changRoomMoney` decimal(8,2) DEFAULT NULL COMMENT '换房费',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `payTime` timestamp NULL DEFAULT NULL COMMENT '结账时间',
  `changRoomTime` timestamp NULL DEFAULT NULL COMMENT '换房时间',
  `remind` int(11) DEFAULT '0' COMMENT '提醒结账',
  `LvKeLeiXingId` int(11) DEFAULT NULL COMMENT '旅客类型',
  `dpId` int(11) DEFAULT NULL COMMENT '押金',
  PRIMARY KEY (`stayregisterId`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `stayregister` */

insert  into `stayregister`(`stayregisterId`,`predetermineID`,`rentOutTypeID`,`roomID`,`payWayID`,`billUnitID`,`passengerTypeID`,`receiveTargetID`,`isBillID`,`registerTime`,`stayNumber`,`sumConst`,`ChangingRoomNumber`,`changRoomMoney`,`remarks`,`payTime`,`changRoomTime`,`remind`,`LvKeLeiXingId`,`dpId`) values (1,1,26,13,21,27,29,2,69,'2016-11-29 15:06:52','5','3291.00','1','15120.00','','2017-02-21 09:23:36','2017-02-21 09:19:00',0,56,5),(3,1,26,17,21,27,29,2,68,'2016-12-03 20:12:56','2','360.00',NULL,NULL,'你好','2017-01-11 20:55:51',NULL,1,56,6),(4,10,26,3,21,27,29,2,69,'2016-12-05 15:34:33','5','500.00',NULL,NULL,'','2017-01-11 20:55:45',NULL,0,55,7),(5,11,26,18,21,27,29,2,69,'2016-12-06 16:30:45','1','300.00',NULL,NULL,'','2017-01-11 20:55:41',NULL,0,55,8),(6,12,26,20,21,27,29,2,68,'2016-12-06 16:59:53','5','5000.00',NULL,NULL,'','2017-01-11 20:55:36',NULL,1,56,9),(7,NULL,26,13,22,28,29,11,68,'2017-01-09 16:37:03','2','300.00',NULL,NULL,'','2017-01-09 16:42:23',NULL,0,55,10),(8,NULL,26,14,22,28,29,11,68,'2017-01-09 16:37:03','2','400.00',NULL,NULL,'','2017-01-09 16:42:23',NULL,0,55,11),(9,NULL,26,16,22,28,29,11,68,'2017-01-09 16:37:03','2','360.00',NULL,NULL,'','2017-01-09 16:42:23',NULL,0,55,12),(10,NULL,26,17,22,28,29,11,69,'2017-01-09 16:41:38','2','360.00',NULL,NULL,'','2017-01-09 16:42:23',NULL,0,55,13),(11,NULL,26,18,22,28,29,11,69,'2017-01-09 16:41:38','2','600.00',NULL,NULL,'','2017-01-09 16:42:23',NULL,0,55,14),(12,NULL,26,13,21,27,29,2,69,'2017-01-09 16:46:54','1','150.00',NULL,NULL,'','2017-01-09 16:47:06',NULL,0,55,15),(13,7,26,13,21,27,29,2,69,'2017-01-09 16:49:16','1','150.00',NULL,NULL,'','2017-01-09 16:49:28',NULL,0,55,16),(14,NULL,26,13,22,28,29,9,69,'2017-01-09 20:04:47','1','150.00',NULL,NULL,'','2017-01-09 20:43:43',NULL,0,55,17),(15,NULL,26,25,22,28,29,9,69,'2017-01-09 20:04:47','1','200.00',NULL,NULL,'哈哈哈哈哈哈','2018-03-02 00:00:00',NULL,0,55,18),(16,NULL,25,27,22,27,29,11,68,'2017-01-09 20:15:12','4','154.00','1','0.00','','2017-02-22 17:03:48','2017-02-20 20:42:33',1,55,19),(17,9,26,19,22,27,29,13,69,'2017-01-10 10:12:44','2','621.00',NULL,NULL,'','2017-03-01 10:08:05',NULL,0,56,20),(18,10,26,13,22,28,29,12,69,'2017-01-10 11:23:03','2','326.00',NULL,NULL,'','2017-01-11 10:16:27',NULL,0,55,21),(19,11,26,28,22,28,29,12,69,'2017-01-10 11:23:03','2','400.00','1','0.00','','2017-01-11 10:16:27','2017-01-10 11:23:34',0,55,22),(20,NULL,26,27,22,28,29,12,69,'2017-01-11 09:17:52','2','400.00',NULL,NULL,'','2017-01-11 10:16:27',NULL,0,56,23),(21,NULL,26,17,22,28,29,5,69,'2017-01-11 09:17:52','2','360.00',NULL,NULL,'','2017-01-11 10:16:27',NULL,0,55,24),(22,NULL,26,3,21,27,29,2,68,'2017-01-11 15:33:59','1','114.00','1','0.00','','2017-02-21 08:29:07','2017-01-11 21:08:40',1,55,25),(23,13,26,16,22,28,29,3,69,'2017-02-21 08:26:14','1','180.00',NULL,NULL,'','2017-02-21 08:28:37',NULL,0,55,26),(24,14,26,17,22,28,29,3,69,'2017-02-21 08:26:14','1','180.00',NULL,NULL,'','2017-02-21 08:28:37',NULL,0,55,27),(25,15,26,13,22,27,29,4,69,'2017-02-21 09:11:16','2','314.00',NULL,NULL,'','2017-02-21 09:13:53',NULL,0,55,28),(26,NULL,26,32,21,27,29,2,69,'2017-02-21 15:01:03','2','1612.00','1','0.00','','2017-02-21 15:57:34','2017-02-21 15:05:14',0,56,29),(27,NULL,26,13,22,27,29,12,69,'2017-02-21 15:07:54','1','157.00','1','0.00','','2017-02-23 11:24:51','2017-02-21 15:08:14',0,55,30),(28,NULL,26,20,22,28,29,3,69,'2017-02-21 15:58:29','1','842.00','1','0.00','','2017-02-21 16:01:57','2017-02-21 16:01:26',0,56,31),(29,NULL,26,29,22,28,29,3,69,'2017-02-21 15:58:29','1','500.00',NULL,NULL,'','2017-02-21 16:01:57',NULL,0,55,32),(30,NULL,26,30,22,28,29,3,69,'2017-02-21 15:58:29','1','600.00',NULL,NULL,'','2017-02-21 16:01:57',NULL,0,55,33),(31,18,26,17,21,28,29,13,69,'2017-02-21 16:12:08','1','187.00',NULL,NULL,'','2017-02-21 16:13:12',NULL,0,55,34),(32,NULL,26,28,NULL,28,29,2,68,'2017-02-22 11:22:36','1','221.00',NULL,NULL,NULL,NULL,NULL,1,55,35),(33,NULL,26,16,22,28,29,11,69,'2017-02-22 11:22:36','1','187.00',NULL,NULL,'','2017-02-22 16:35:46',NULL,0,55,36),(34,NULL,26,14,23,27,29,2,69,'2017-02-23 11:12:16','1','700.00','1','0.00','可填可不填','2017-02-23 11:17:31','2017-02-23 11:16:01',0,56,37),(35,NULL,26,16,22,28,29,12,69,'2017-02-23 11:19:38','1','187.00',NULL,NULL,'','2017-02-23 11:23:30',NULL,0,55,38),(36,NULL,26,14,22,28,29,12,69,'2017-02-23 11:19:38','1','3200.00','1','0.00','','2017-02-23 11:24:51','2017-02-23 11:22:19',0,55,39),(37,23,26,27,21,27,29,2,69,'2017-02-23 11:28:56','1','221.00','1','0.00','','2017-02-23 11:30:46','2017-02-23 11:30:25',0,55,40),(38,21,26,13,22,28,29,5,69,'2017-02-23 11:29:08','1','150.00',NULL,NULL,'','2017-02-23 11:32:03',NULL,0,55,41),(39,22,26,14,22,28,29,5,69,'2017-02-23 11:29:08','1','200.00',NULL,NULL,'','2017-02-23 11:32:03',NULL,0,55,42),(40,25,26,13,22,28,29,3,69,'2017-02-24 15:39:57','5','757.00',NULL,NULL,'','2017-03-01 08:07:00',NULL,0,55,43),(41,26,26,17,22,28,29,3,69,'2017-02-24 15:39:57','5','990.00','1','800.00','','2017-03-01 08:07:00','2017-02-28 14:46:20',0,56,44),(42,NULL,26,17,21,27,29,2,69,'2017-02-26 21:23:51','1','197.00','1','180.00','','2017-02-27 16:36:56','2017-02-27 15:36:17',0,55,45),(43,NULL,26,3,22,27,29,3,69,'2017-02-27 20:22:31','3','307.00',NULL,NULL,'','2017-03-01 08:07:00',NULL,0,55,46),(44,12,26,18,NULL,27,29,2,68,'2017-03-01 08:53:35','2','600.00',NULL,NULL,NULL,NULL,NULL,0,55,47),(45,NULL,26,21,21,27,29,1,69,'2018-03-07 20:12:11','1','2.00',NULL,NULL,NULL,'2018-03-07 20:12:11',NULL,0,56,90),(46,NULL,26,22,21,27,29,1,69,'2018-03-07 20:12:11','1','1200.00',NULL,NULL,NULL,'2018-03-07 20:12:11',NULL,0,56,91),(47,NULL,26,16,21,27,29,1,69,'2018-03-07 20:26:17','1','180.00',NULL,NULL,NULL,'2018-03-07 20:26:17',NULL,0,56,92),(48,NULL,26,17,21,27,29,1,69,'2018-03-07 20:26:17','1','180.00',NULL,NULL,NULL,'2018-03-07 20:26:17',NULL,0,56,93),(49,NULL,26,23,21,27,29,1,69,'2018-03-07 20:38:30','1','1000.00',NULL,NULL,NULL,'2018-03-07 20:38:30',NULL,0,56,94),(50,NULL,26,24,21,27,29,1,69,'2018-03-07 20:38:30','1','8000.00',NULL,NULL,NULL,'2018-03-07 20:38:30',NULL,0,56,95),(51,NULL,26,25,21,27,29,1,69,'2018-03-07 20:46:07','1','800000.00',NULL,NULL,NULL,'2018-03-07 20:46:07',NULL,0,56,96),(52,NULL,26,26,21,27,29,1,69,'2018-03-07 20:46:07','1','999.00',NULL,NULL,NULL,'2018-03-07 20:46:07',NULL,0,56,97),(53,NULL,26,32,21,27,29,1,69,'2018-03-07 20:47:46','1','800.00',NULL,NULL,NULL,'2018-03-07 20:47:46',NULL,0,56,98),(54,NULL,26,29,21,27,29,1,69,'2018-03-07 21:13:17','1','500.00',NULL,NULL,'asdasd','2018-03-07 21:13:17',NULL,0,55,99),(55,NULL,26,27,21,27,29,11,69,'2018-03-07 21:20:39','1','200.00',NULL,NULL,'teaawe的话','2018-03-07 21:20:39',NULL,0,56,100),(56,NULL,26,34,21,27,29,1,69,'2018-03-07 21:33:43','1','2000.00',NULL,NULL,'ppppp','2018-03-07 21:33:43',NULL,0,55,101),(57,NULL,26,30,21,27,29,1,73,'2018-03-07 22:44:58','1','600.00',NULL,NULL,'hjghjghj','2018-03-07 22:44:58',NULL,0,56,102),(58,NULL,26,31,21,27,29,1,73,'2018-03-07 22:44:58','1','800.00',NULL,NULL,'hjghjghj','2018-03-07 22:44:59',NULL,0,56,102);

/*Table structure for table `stayregisterdetails` */

DROP TABLE IF EXISTS `stayregisterdetails`;

CREATE TABLE `stayregisterdetails` (
  `stayregisterdetailsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '住宿登记明细id',
  `stayRegisterID` int(11) DEFAULT NULL COMMENT '住宿登记id',
  `passengerID` int(11) DEFAULT NULL COMMENT '旅客id',
  PRIMARY KEY (`stayregisterdetailsId`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

/*Data for the table `stayregisterdetails` */

insert  into `stayregisterdetails`(`stayregisterdetailsId`,`stayRegisterID`,`passengerID`) values (1,1,2),(2,3,3),(3,3,18),(4,4,2),(5,5,2),(6,6,2),(7,6,19),(8,10,1),(9,11,3),(10,12,3),(11,13,3),(12,15,1),(13,14,12),(14,16,5),(15,17,3),(16,19,1),(17,18,3),(18,20,3),(19,20,19),(20,21,19),(21,17,1),(22,22,4),(23,23,4),(24,24,22),(25,25,1),(26,1,23),(27,26,1),(28,26,25),(29,27,7),(30,30,2),(31,28,26),(32,29,5),(33,28,12),(34,31,1),(35,33,1),(36,32,3),(37,34,19),(38,34,28),(39,35,5),(40,36,7),(41,37,1),(42,38,17),(43,39,12),(44,42,1),(45,41,16),(46,40,18),(47,43,1),(48,41,6),(49,7,5),(50,8,16),(51,9,18),(52,44,25),(53,45,31),(54,45,31),(55,46,29),(56,46,29),(57,47,31),(58,47,32),(59,48,29),(60,48,30),(61,49,31),(62,49,32),(63,50,29),(64,50,30),(65,51,31),(66,51,32),(67,52,29),(68,52,30),(69,53,29),(70,53,30),(71,53,31),(72,54,34),(73,55,22),(74,55,6),(75,56,28),(76,57,32),(77,57,34),(78,58,22),(79,58,30);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`userId`,`userName`,`password`) values (1,'sa','123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
