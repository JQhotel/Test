/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.16 : Database - game
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`game` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `game`;

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_comment` */

/*Table structure for table `t_goods` */

DROP TABLE IF EXISTS `t_goods`;

CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(600) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `goods_kind` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `img_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goods_desc` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_goods` */

insert  into `t_goods`(`id`,`name`,`price`,`goods_kind`,`img_path`,`goods_desc`) values (1,'商品一',22,'LOL','1583229980401.jpg','234243'),(2,'龙龟',234,'LOL','1583230253743.jpg','3423424');

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(600) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `phone_num` varchar(200) DEFAULT NULL,
  `qq_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `buy_num` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `pay_money` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

insert  into `t_order`(`id`,`user_id`,`goods_id`,`create_time`,`phone_num`,`qq_num`,`buy_num`,`price`,`pay_money`,`status`,`reason`,`feedback`) values (1,'1',1,'2020-03-03 10:13:34','1351234234','19868847652',1,NULL,22,1,NULL,NULL),(2,'1',1,'2020-03-03 10:14:00','13522456858','19868847652',1,22,22,1,NULL,NULL);

/*Table structure for table `t_trolley` */

DROP TABLE IF EXISTS `t_trolley`;

CREATE TABLE `t_trolley` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_trolley` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(600) DEFAULT NULL,
  `qq_num` varchar(110) DEFAULT NULL,
  `pass_word` varchar(110) DEFAULT NULL,
  `phone_num` varchar(200) DEFAULT NULL,
  `role_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`login_name`,`qq_num`,`pass_word`,`phone_num`,`role_type`) values (1,'admin','232','123456','234234','0'),(2,'user2','19868847652','123456','13522456858','1'),(3,'user3','19868847652','123456','13522456858','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
