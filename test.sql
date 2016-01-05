/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-01-05 12:49:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_article`
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `a_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `a_title` varchar(50) NOT NULL,
  `a_cont` text NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_article
-- ----------------------------
INSERT INTO `tb_article` VALUES ('7', '中央农村工作会议25日闭幕 习近平作重要指示', '新华社北京12月25日电中央农村工作会议24日至25日在北京召开。会议全面贯彻落实党的十八大和十八届三中、四中、五中全会以及中央经济工作会议精神，总结“十二五”时期“三农”工作，分析当前农业农村形势，部署2016年和“十三五”时期农业农村工作。\r\n \r\n　　党中央、国务院高度重视这次会议。会前，中共中央政治局会议、中共中央政治局常委会会议和国务院常务会议就开好这次会议，做好农业农村工作提出了明确要求。中共中央总书记、国家主席、中央军委主席习近平对做好“三农”工作作出重要指示。中共中央政治局常委、国务院总理李克强作出批示\r\n');
INSERT INTO `tb_article` VALUES ('8', '农业板块迎来“政策蜜月期', '上海新兰德指出，通过对历年农业板块的主题投资梳理可以发现，每年中央农村工作会议和“一号文件”发布前后，A股都会有一轮农业主题投资行情，当年12月至次年1月都是农业板块的“政策蜜月期”，也是短线的“吃饭行情”。事实上，本月中旬以来，农林牧渔板块已经出现一波拉升行情');
INSERT INTO `tb_article` VALUES ('12', '阿斯顿发送到', '主表insert sql：insert into tb_article values(null,:title,:cont)\r\n本次入库的关键词是：联赛 前往 加盟 球队 邀请 贝克汉姆 每日 消息 格兰 球星 媒体\r\n入库成功');
INSERT INTO `tb_article` VALUES ('13', '你好', '这是一个点击发送了对方 阿里山的减肥拉屎地方 拉萨酒店里发生的按时发生大幅 阿斯顿发送到');
INSERT INTO `tb_article` VALUES ('14', '风扇', '我的电脑里使用了风扇吗，我不知道，当你回眸的时候，我发现\r\n你的眼神里，已没有往日的热情，是累了吗？');

-- ----------------------------
-- Table structure for `tb_article_index`
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_index`;
CREATE TABLE `tb_article_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(200) NOT NULL,
  `a_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_article_index
-- ----------------------------
INSERT INTO `tb_article_index` VALUES ('11', 'e4b8ade5a4ae e4bc9ae8aeae e5b7a5e4bd9c e5869ce69d91 e4b8ade585b1 e5869ce4b89a e694bfe6b2bb e59bbde58aa1e999a2 e697b6e69c9f e4b889e5869c e4b8bbe5b8ad e58c97e4baac e4bd9ce587ba e58d81e585ab e5b7a5e4bd9c', '7');
INSERT INTO `tb_article_index` VALUES ('12', 'e8a18ce68385 e69dbfe59d97 e5869ce4b89a e4b8bbe9a298e68a95e8b584 e5bd93e5b9b4 e79fade7babf e69c88e69c9f e694bfe7ad96 e59083e9a5ad e5b7b2e7bb8f e587bae78eb0 e4bba5e69da5 e69cace69c88 e4ba8be5ae9ee4b88a ', '8');
INSERT INTO `tb_article_index` VALUES ('15', 'e98280e8afb7 e8b49de5858be6b189e5a786 e79083e9989f e6af8fe697a5 e6b688e681af e68890e58a9f e5aa92e4bd93 e79083e6989f e6a0bce585b0 e58aa0e79b9f e88194e8b59b e585b3e994aee8af8d e69cace6aca1 e5898de5be80', '12');
INSERT INTO `tb_article_index` VALUES ('16', 'e58f91e7949f e58f91e98081 e98592e5ba97 e68c89e697b6 e68b89e890a8 e5a4a7e5b985 e5878fe882a5 e782b9e587bb e4b880e4b8aa e5afb9e696b9 e998bfe9878c e8bf99e698af e59cb0e696b9', '13');
INSERT INTO `tb_article_index` VALUES ('17', 'e79cbce7a59e e6b2a1e69c89 e5be80e697a5 e783ade68385 e58f91e78eb0 e697b6e58099 e4bdbfe794a8 e9a38ee68987 e79fa5e98193 e794b5e88491', '14');
