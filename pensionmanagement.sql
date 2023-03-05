/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - pensionmanagement
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pensionmanagement` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pensionmanagement`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `userid` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`userid`,`username`,`password`,`age`,`sex`) values ('admin','管理员','123',22,'男');

/*Table structure for table `berth` */

DROP TABLE IF EXISTS `berth`;

CREATE TABLE `berth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `olderid` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `ridgepole` varchar(32) DEFAULT NULL,
  `floor` varchar(32) DEFAULT NULL,
  `building` varchar(32) DEFAULT NULL,
  `berth` varchar(32) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `berth` */

insert  into `berth`(`id`,`olderid`,`name`,`ridgepole`,`floor`,`building`,`berth`,`create_time`) values (3,2,'小李','43','4','403','2','2023-03-04'),(4,1,'张三','43','4','401','3','2023-03-04');

/*Table structure for table `complain` */

DROP TABLE IF EXISTS `complain`;

CREATE TABLE `complain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `data` varchar(128) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `complain` */

insert  into `complain`(`id`,`type`,`data`,`create_time`) values (1,'关于老人','服务态度差','2023-03-04');

/*Table structure for table `cost` */

DROP TABLE IF EXISTS `cost`;

CREATE TABLE `cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `olderid` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `cost` */

insert  into `cost`(`id`,`olderid`,`name`,`cost`,`create_time`) values (1,1,'张三',433,'2023-03-04'),(2,4,'赵6',400,'2023-03-04');

/*Table structure for table `malfunction` */

DROP TABLE IF EXISTS `malfunction`;

CREATE TABLE `malfunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `data` varchar(128) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `malfunction` */

insert  into `malfunction`(`id`,`type`,`data`,`create_time`) values (1,'起火','某位老人吸烟,没有把烟屁股熄灭！','2023-03-04'),(2,'打架斗殴','某位老人与另外一位老人发生冲突。','2023-03-02');

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `data` varchar(128) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

insert  into `notice`(`id`,`type`,`data`,`create_time`) values (1,'关于老人的','对于在本院的所有老人都能享受到体检的服务,免费的哦！','2023-03-04'),(5,'日常','lalaland','2023-02-25');

/*Table structure for table `older` */

DROP TABLE IF EXISTS `older`;

CREATE TABLE `older` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `addr` varchar(32) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `older` */

insert  into `older`(`id`,`name`,`sex`,`age`,`addr`,`tel`) values (1,'张三','女',66,'湖南长沙','123456'),(2,'小李','女',65,'湖南湘潭','123456'),(4,'赵6','男',78,'纽约','123098'),(5,'王五','男',65,'湖南常德','12345678');

/*Table structure for table `older_status` */

DROP TABLE IF EXISTS `older_status`;

CREATE TABLE `older_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `olderid` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `blood_type` varchar(10) DEFAULT NULL,
  `allergy` varchar(64) DEFAULT NULL,
  `heart_rate` double DEFAULT NULL,
  `blood_pressure` double DEFAULT NULL,
  `blood_sugar` double DEFAULT NULL,
  `smoke` varchar(10) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `older_status` */

insert  into `older_status`(`id`,`olderid`,`name`,`height`,`weight`,`blood_type`,`allergy`,`heart_rate`,`blood_pressure`,`blood_sugar`,`smoke`,`create_time`) values (1,1,'张三',165.5,56.8,'O型','阿司匹林',76,101,4.5,'吸烟','2023-03-04'),(3,2,'小李',166,66,'AB型','无',100,123,222,'不吸烟','2023-02-26'),(4,4,'赵6',170,20,'O型','无',98,123,243,'吸烟','2023-02-26');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
