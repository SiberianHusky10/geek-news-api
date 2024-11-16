-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: big_event
-- ------------------------------------------------------
-- Server version       5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
                           `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
                           `title` varchar(30) NOT NULL COMMENT '文章标题',
                           `content` varchar(10000) NOT NULL COMMENT '文章内容',
                           `cover_img` varchar(128) NOT NULL COMMENT '文章封面',
                           `state` varchar(3) DEFAULT NULL COMMENT '文章状态: 只能是[已发布] 或者 [草稿]',
                           `category_id` int(10) unsigned DEFAULT NULL COMMENT '文章分类ID',
                           `create_user` int(10) unsigned NOT NULL COMMENT '创建人ID',
                           `create_time` datetime NOT NULL COMMENT '创建时间',
                           `update_time` datetime NOT NULL COMMENT '修改时间',
                           PRIMARY KEY (`id`),
                           KEY `fk_article_category` (`category_id`),
                           KEY `fk_article_user` (`create_user`),
                           CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
                           CONSTRAINT `fk_article_user` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'国庆旅游去哪里','<p>又到了今年的国庆小长假，七天的假期大家都想去哪里呢？</p>','https:husky-big-event.oss-cn-beijing.aliyuncs.com/5e0b3ddf-04e5-4463-84bc-1c6467df7536.jpg','已发布',3,1,'2024-11-02 08:54:39','2024-11-02 08:54:39');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
                            `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
                            `category_name` varchar(32) NOT NULL COMMENT '分类名称',
                            `category_alias` varchar(32) NOT NULL COMMENT '分类别名',
                            `create_user` int(10) unsigned NOT NULL COMMENT '创建人ID',
                            `create_time` datetime NOT NULL COMMENT '创建时间',
                            `update_time` datetime NOT NULL COMMENT '修改时间',
                            PRIMARY KEY (`id`),
                            KEY `fk_category_user` (`create_user`),
                            CONSTRAINT `fk_category_user` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'人文','rw',1,'2024-11-02 08:52:59','2024-11-02 08:52:59'),(2,'历史','ls',1,'2024-11-02 08:53:08','2024-11-02 08:53:08'),(3,'旅游','ly',1,'2024-11-02 08:53:18','2024-11-02 08:53:18'),(4,'生活','sh',1,'2024-11-12 02:22:12','2024-11-12 02:22:12');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
                        `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
                        `username` varchar(20) NOT NULL COMMENT '用户名',
                        `password` varchar(32) DEFAULT NULL COMMENT '密码',
                        `nickname` varchar(10) DEFAULT '' COMMENT '昵称',
                        `email` varchar(128) DEFAULT '' COMMENT '邮箱',
                        `user_pic` varchar(128) DEFAULT '' COMMENT '头像',
                        `create_time` datetime NOT NULL COMMENT '创建时间',
                        `update_time` datetime NOT NULL COMMENT '修改时间',
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-16 12:18:58