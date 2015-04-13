/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50542
Source Host           : localhost:3306
Source Database       : lyshuxiang.com

Target Server Type    : MYSQL
Target Server Version : 50542
File Encoding         : 65001

Date: 2015-04-13 18:58:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dx_admanage`
-- ----------------------------
DROP TABLE IF EXISTS `dx_admanage`;
CREATE TABLE `dx_admanage` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `classid` smallint(5) unsigned NOT NULL COMMENT '投放范围(广告位)',
  `parentid` smallint(5) unsigned NOT NULL COMMENT '所属广告位父id',
  `parentstr` varchar(80) NOT NULL COMMENT '所属广告位父id字符串',
  `title` varchar(30) NOT NULL COMMENT '广告标识',
  `admode` char(10) NOT NULL COMMENT '展示模式',
  `picurl` varchar(100) NOT NULL COMMENT '上传内容地址',
  `adtext` text NOT NULL COMMENT '展示内容',
  `linkurl` varchar(255) NOT NULL COMMENT '跳转链接',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  `posttime` int(10) unsigned NOT NULL COMMENT '提交时间',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_admanage
-- ----------------------------
INSERT INTO `dx_admanage` VALUES ('1', '1', '2', '0', '0,', '首页当季热门 侧栏 test', 'image', 'uploads/image/20150318/1426692587.jpg', '', '', '1', '1426690887', 'true');
INSERT INTO `dx_admanage` VALUES ('2', '1', '3', '0', '0,', '首页周末去哪儿 侧栏 test', 'image', 'uploads/image/20150318/1426693827.jpg', '', '', '2', '1426692389', 'true');
INSERT INTO `dx_admanage` VALUES ('3', '1', '4', '0', '0,', '首页特价旅游 test1', 'image', 'uploads/image/20150318/1426697774.jpg', '', '', '3', '1426692613', 'true');
INSERT INTO `dx_admanage` VALUES ('4', '1', '4', '0', '0,', '首页特价旅游 test2', 'image', 'uploads/image/20150318/1426696300.jpg', '', '', '4', '1426692680', 'true');
INSERT INTO `dx_admanage` VALUES ('5', '1', '4', '0', '0,', '首页特价旅游 test3', 'image', 'uploads/image/20150318/1426696402.jpg', '', '', '5', '1426692706', 'true');
INSERT INTO `dx_admanage` VALUES ('6', '1', '1', '0', '0,', '1', 'image', 'uploads/image/20150319/1426729254.jpg', '', '', '6', '1426719513', 'true');
INSERT INTO `dx_admanage` VALUES ('7', '1', '5', '0', '0,', '1', 'image', 'uploads/image/20150323/1427114525.jpg', '', 'http://127.0.0.1/business/lyshuxiang.com/Home-Line-info-id-6.html', '7', '1427107570', 'true');
INSERT INTO `dx_admanage` VALUES ('8', '1', '6', '0', '0,', '3', 'image', 'uploads/image/20150330/1427698846.jpg', '', '', '8', '1427693150', 'true');

-- ----------------------------
-- Table structure for `dx_admin`
-- ----------------------------
DROP TABLE IF EXISTS `dx_admin`;
CREATE TABLE `dx_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `nickname` char(32) NOT NULL COMMENT '昵称',
  `question` tinyint(1) unsigned NOT NULL COMMENT '登录提问',
  `answer` varchar(50) NOT NULL COMMENT '登录回答',
  `levelname` tinyint(1) unsigned NOT NULL COMMENT '级别',
  `checkadmin` enum('true','false') NOT NULL COMMENT '审核',
  `loginip` char(20) NOT NULL COMMENT '登录IP',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_admin
-- ----------------------------
INSERT INTO `dx_admin` VALUES ('1', 'admin', '0c909a141f1f2c0a1cb602b0b2d7d050', '', '0', '', '1', 'true', '127.0.0.1', '1428768985');

-- ----------------------------
-- Table structure for `dx_admingroup`
-- ----------------------------
DROP TABLE IF EXISTS `dx_admingroup`;
CREATE TABLE `dx_admingroup` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理组id',
  `groupname` varchar(30) NOT NULL COMMENT '管理组名称',
  `description` text NOT NULL COMMENT '管理组描述',
  `groupsite` varchar(30) NOT NULL COMMENT '默认进入站',
  `checkinfo` set('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_admingroup
-- ----------------------------
INSERT INTO `dx_admingroup` VALUES ('1', '超级管理员', '超级管理员组', '1', 'true');
INSERT INTO `dx_admingroup` VALUES ('2', '站点管理员', '站点管理员组', '1', 'true');
INSERT INTO `dx_admingroup` VALUES ('3', '文章发布员', '文章发布员组', '1', 'true');

-- ----------------------------
-- Table structure for `dx_adminnotes`
-- ----------------------------
DROP TABLE IF EXISTS `dx_adminnotes`;
CREATE TABLE `dx_adminnotes` (
  `uname` varchar(30) NOT NULL COMMENT '用户名',
  `body` mediumtext NOT NULL COMMENT '便签内容',
  `posttime` int(10) unsigned NOT NULL COMMENT '提交时间',
  `postip` varchar(30) NOT NULL COMMENT '提交IP',
  PRIMARY KEY (`uname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_adminnotes
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_adminprivacy`
-- ----------------------------
DROP TABLE IF EXISTS `dx_adminprivacy`;
CREATE TABLE `dx_adminprivacy` (
  `groupid` tinyint(3) unsigned NOT NULL COMMENT '所属管理组id',
  `siteid` tinyint(1) unsigned NOT NULL COMMENT '站点id',
  `model` varchar(30) NOT NULL COMMENT '管理模块',
  `classid` int(10) NOT NULL COMMENT '类型id',
  `action` varchar(10) NOT NULL COMMENT '可执行操作'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_adminprivacy
-- ----------------------------
INSERT INTO `dx_adminprivacy` VALUES ('2', '0', 'upload_filemgr_sql', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('2', '0', 'web_config', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('2', '0', 'admin', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('2', '1', 'category', '1', 'del');
INSERT INTO `dx_adminprivacy` VALUES ('2', '1', 'category', '1', 'update');
INSERT INTO `dx_adminprivacy` VALUES ('2', '1', 'category', '1', 'add');
INSERT INTO `dx_adminprivacy` VALUES ('2', '1', 'category', '1', 'list');
INSERT INTO `dx_adminprivacy` VALUES ('3', '0', 'infoclass', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('3', '0', 'info', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('3', '0', 'infolist', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('3', '0', 'infoimg', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('3', '0', 'soft', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('3', '0', 'goodstype', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('3', '0', 'goods', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('2', '0', 'database_backup', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('2', '0', 'infoclass', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('2', '0', 'info', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('2', '0', 'infolist', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('2', '0', 'infoimg', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('2', '0', 'soft', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('2', '0', 'goodstype', '0', 'all');
INSERT INTO `dx_adminprivacy` VALUES ('2', '0', 'goods', '0', 'all');

-- ----------------------------
-- Table structure for `dx_adtype`
-- ----------------------------
DROP TABLE IF EXISTS `dx_adtype`;
CREATE TABLE `dx_adtype` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `parentid` smallint(5) unsigned NOT NULL COMMENT '上级id',
  `parentstr` varchar(50) NOT NULL COMMENT '上级id字符串',
  `classname` varchar(30) NOT NULL COMMENT '广告位名称',
  `width` smallint(5) unsigned NOT NULL COMMENT '广告位宽度',
  `height` smallint(5) unsigned NOT NULL COMMENT '广告位高度',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列顺序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_adtype
-- ----------------------------
INSERT INTO `dx_adtype` VALUES ('1', '1', '0', '0,', '首页轮播图', '724', '415', '1', 'true');
INSERT INTO `dx_adtype` VALUES ('2', '1', '0', '0,', '首页当季热门 侧栏', '245', '506', '2', 'true');
INSERT INTO `dx_adtype` VALUES ('3', '1', '0', '0,', '首页周末去哪儿 侧栏', '245', '506', '3', 'true');
INSERT INTO `dx_adtype` VALUES ('4', '1', '0', '0,', '首页特价旅游 三个', '240', '380', '4', 'true');
INSERT INTO `dx_adtype` VALUES ('5', '1', '0', '0,', '旅游线路 内页 侧栏 广告位', '236', '361', '5', 'true');
INSERT INTO `dx_adtype` VALUES ('6', '1', '0', '0,', '旅游线路 内页 大图 广告位', '954', '280', '6', 'true');

-- ----------------------------
-- Table structure for `dx_cascade`
-- ----------------------------
DROP TABLE IF EXISTS `dx_cascade`;
CREATE TABLE `dx_cascade` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '级联组id',
  `groupname` varchar(30) NOT NULL COMMENT '级联组名称',
  `groupsign` varchar(30) NOT NULL COMMENT '级联组标识',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_cascade
-- ----------------------------
INSERT INTO `dx_cascade` VALUES ('1', '地区', 'area', '1');
INSERT INTO `dx_cascade` VALUES ('2', '星座', 'astro', '2');
INSERT INTO `dx_cascade` VALUES ('3', '血型', 'bloodtype', '3');
INSERT INTO `dx_cascade` VALUES ('4', '证件类型', 'cardtype', '4');
INSERT INTO `dx_cascade` VALUES ('5', '安全问题', 'question', '5');
INSERT INTO `dx_cascade` VALUES ('6', '行业分布', 'trade', '6');
INSERT INTO `dx_cascade` VALUES ('8', '当季热门', 'remen', '7');
INSERT INTO `dx_cascade` VALUES ('9', '洛阳周边', 'zhoubian', '8');
INSERT INTO `dx_cascade` VALUES ('10', '国内旅游', 'guonei', '9');
INSERT INTO `dx_cascade` VALUES ('11', '出境旅游', 'chujing', '10');
INSERT INTO `dx_cascade` VALUES ('12', '特价旅游', 'tejia', '11');

-- ----------------------------
-- Table structure for `dx_cascadedata`
-- ----------------------------
DROP TABLE IF EXISTS `dx_cascadedata`;
CREATE TABLE `dx_cascadedata` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '级联数据id',
  `dataname` char(30) NOT NULL COMMENT '级联数据名称',
  `datavalue` char(20) NOT NULL COMMENT '级联数据值',
  `datagroup` char(20) NOT NULL COMMENT '所属级联组',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  `level` tinyint(1) unsigned NOT NULL COMMENT '级联数据层次',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20031 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_cascadedata
-- ----------------------------
INSERT INTO `dx_cascadedata` VALUES ('20019', '澳门特别行政区', '17500', 'area', '17500', '0');
INSERT INTO `dx_cascadedata` VALUES ('20018', '香港特别行政区', '17000', 'area', '17000', '0');
INSERT INTO `dx_cascadedata` VALUES ('20017', '台湾省', '16500', 'area', '16500', '0');
INSERT INTO `dx_cascadedata` VALUES ('20016', '图木舒克市', '16015.3', 'area', '16015', '2');
INSERT INTO `dx_cascadedata` VALUES ('20015', '阿拉尔市', '16015.2', 'area', '16015', '2');
INSERT INTO `dx_cascadedata` VALUES ('20014', '石河子市', '16015.1', 'area', '16015', '2');
INSERT INTO `dx_cascadedata` VALUES ('20013', '省直辖行政单位', '16015', 'area', '16015', '1');
INSERT INTO `dx_cascadedata` VALUES ('20012', '吉木乃县', '16014.7', 'area', '16015', '2');
INSERT INTO `dx_cascadedata` VALUES ('20011', '青河县', '16014.6', 'area', '16015', '2');
INSERT INTO `dx_cascadedata` VALUES ('20010', '哈巴河县', '16014.5', 'area', '16015', '2');
INSERT INTO `dx_cascadedata` VALUES ('20009', '福海县', '16014.4', 'area', '16014', '2');
INSERT INTO `dx_cascadedata` VALUES ('20008', '富蕴县', '16014.3', 'area', '16014', '2');
INSERT INTO `dx_cascadedata` VALUES ('20007', '布尔津县', '16014.2', 'area', '16014', '2');
INSERT INTO `dx_cascadedata` VALUES ('20006', '阿勒泰市', '16014.1', 'area', '16014', '2');
INSERT INTO `dx_cascadedata` VALUES ('20005', '阿勒泰地区', '16014', 'area', '16014', '1');
INSERT INTO `dx_cascadedata` VALUES ('20004', '和布克赛尔蒙古自治县', '16013.7', 'area', '16014', '2');
INSERT INTO `dx_cascadedata` VALUES ('20003', '裕民县', '16013.6', 'area', '16014', '2');
INSERT INTO `dx_cascadedata` VALUES ('20002', '托里县', '16013.5', 'area', '16014', '2');
INSERT INTO `dx_cascadedata` VALUES ('20001', '沙湾县', '16013.4', 'area', '16013', '2');
INSERT INTO `dx_cascadedata` VALUES ('20000', '额敏县', '16013.3', 'area', '16013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19999', '乌苏市', '16013.2', 'area', '16013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19998', '塔城市', '16013.1', 'area', '16013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19997', '塔城地区', '16013', 'area', '16013', '1');
INSERT INTO `dx_cascadedata` VALUES ('19996', '尼勒克县', '16012.10', 'area', '16012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19995', '特克斯县', '16012.9', 'area', '16013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19994', '昭苏县', '16012.8', 'area', '16013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19993', '新源县', '16012.7', 'area', '16013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19992', '巩留县', '16012.6', 'area', '16013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19991', '霍城县', '16012.5', 'area', '16013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19990', '察布查尔锡伯自治县', '16012.4', 'area', '16012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19989', '伊宁县', '16012.3', 'area', '16012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19988', '奎屯市', '16012.2', 'area', '16012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19987', '伊宁市', '16012.1', 'area', '16012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19986', '伊犁哈萨克自治州', '16012', 'area', '16012', '1');
INSERT INTO `dx_cascadedata` VALUES ('19985', '民丰县', '16011.8', 'area', '16012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19984', '于田县', '16011.7', 'area', '16012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19983', '策勒县', '16011.6', 'area', '16012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19982', '洛浦县', '16011.5', 'area', '16012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19981', '皮山县', '16011.4', 'area', '16011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19980', '墨玉县', '16011.3', 'area', '16011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19979', '和田县', '16011.2', 'area', '16011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19978', '和田市', '16011.1', 'area', '16011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19977', '和田地区', '16011', 'area', '16011', '1');
INSERT INTO `dx_cascadedata` VALUES ('19976', '塔什库尔干塔吉克自治县', '16010.12', 'area', '16010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19975', '巴楚县', '16010.11', 'area', '16010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19974', '伽师县', '16010.10', 'area', '16010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19973', '岳普湖县', '16010.9', 'area', '16011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19972', '麦盖提县', '16010.8', 'area', '16011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19971', '叶城县', '16010.7', 'area', '16011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19970', '莎车县', '16010.6', 'area', '16011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19969', '泽普县', '16010.5', 'area', '16011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19968', '英吉沙县', '16010.4', 'area', '16010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19967', '疏勒县', '16010.3', 'area', '16010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19966', '疏附县', '16010.2', 'area', '16010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19965', '喀什市', '16010.1', 'area', '16010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19964', '喀什地区', '16010', 'area', '16010', '1');
INSERT INTO `dx_cascadedata` VALUES ('19963', '乌恰县', '16009.4', 'area', '16009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19962', '阿合奇县', '16009.3', 'area', '16009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19961', '阿克陶县', '16009.2', 'area', '16009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19960', '阿图什市', '16009.1', 'area', '16009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19959', '克孜勒苏柯尔克孜自治州', '16009', 'area', '16009', '1');
INSERT INTO `dx_cascadedata` VALUES ('19958', '柯坪县', '16008.9', 'area', '16009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19957', '阿瓦提县', '16008.8', 'area', '16009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19956', '乌什县', '16008.7', 'area', '16009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19955', '拜城县', '16008.6', 'area', '16009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19954', '新和县', '16008.5', 'area', '16009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19953', '沙雅县', '16008.4', 'area', '16008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19952', '库车县', '16008.3', 'area', '16008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19951', '温宿县', '16008.2', 'area', '16008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19950', '阿克苏市', '16008.1', 'area', '16008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19949', '阿克苏地区', '16008', 'area', '16008', '1');
INSERT INTO `dx_cascadedata` VALUES ('19948', '博湖县', '16007.9', 'area', '16008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19947', '和硕县', '16007.8', 'area', '16008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19946', '和静县', '16007.7', 'area', '16008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19945', '焉耆回族自治县', '16007.6', 'area', '16008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19944', '且末县', '16007.5', 'area', '16008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19943', '若羌县', '16007.4', 'area', '16007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19942', '尉犁县', '16007.3', 'area', '16007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19941', '轮台县', '16007.2', 'area', '16007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19940', '库尔勒市', '16007.1', 'area', '16007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19939', '巴音郭楞蒙古自治州', '16007', 'area', '16007', '1');
INSERT INTO `dx_cascadedata` VALUES ('19938', '温泉县', '16006.3', 'area', '16006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19937', '精河县', '16006.2', 'area', '16006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19936', '博乐市', '16006.1', 'area', '16006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19935', '博尔塔拉蒙古自治州', '16006', 'area', '16006', '1');
INSERT INTO `dx_cascadedata` VALUES ('19934', '木垒哈萨克自治县', '16005.8', 'area', '16006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19933', '吉木萨尔县', '16005.7', 'area', '16006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19932', '奇台县', '16005.6', 'area', '16006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19931', '玛纳斯县', '16005.5', 'area', '16006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19930', '呼图壁县', '16005.4', 'area', '16005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19929', '米泉市', '16005.3', 'area', '16005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19928', '阜康市', '16005.2', 'area', '16005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19927', '昌吉市', '16005.1', 'area', '16005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19926', '昌吉回族自治州', '16005', 'area', '16005', '1');
INSERT INTO `dx_cascadedata` VALUES ('19925', '伊吾县', '16004.3', 'area', '16004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19924', '巴里坤哈萨克自治县', '16004.2', 'area', '16004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19923', '哈密市', '16004.1', 'area', '16004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19922', '哈密地区', '16004', 'area', '16004', '1');
INSERT INTO `dx_cascadedata` VALUES ('19921', '托克逊县', '16003.3', 'area', '16003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19920', '鄯善县', '16003.2', 'area', '16003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19919', '吐鲁番市', '16003.1', 'area', '16003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19918', '吐鲁番地区', '16003', 'area', '16003', '1');
INSERT INTO `dx_cascadedata` VALUES ('19917', '乌尔禾区', '16002.4', 'area', '16002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19916', '白碱滩区', '16002.3', 'area', '16002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19915', '克拉玛依区', '16002.2', 'area', '16002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19914', '独山子区', '16002.1', 'area', '16002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19913', '克拉玛依市', '16002', 'area', '16002', '1');
INSERT INTO `dx_cascadedata` VALUES ('19912', '乌鲁木齐县', '16001.8', 'area', '16002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19911', '东山区', '16001.7', 'area', '16002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19910', '达坂城区', '16001.6', 'area', '16002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19909', '头屯河区', '16001.5', 'area', '16002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19908', '水磨沟区', '16001.4', 'area', '16001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19907', '新市区', '16001.3', 'area', '16001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19906', '沙依巴克区', '16001.2', 'area', '16001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19905', '天山区', '16001.1', 'area', '16001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19904', '乌鲁木齐市', '16001', 'area', '16001', '1');
INSERT INTO `dx_cascadedata` VALUES ('19903', '新疆维吾尔自治区', '16000', 'area', '16000', '0');
INSERT INTO `dx_cascadedata` VALUES ('19902', '海原县', '15505.3', 'area', '15505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19901', '中宁县', '15505.2', 'area', '15505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19900', '沙坡头区', '15505.1', 'area', '15505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19899', '中卫市', '15505', 'area', '15505', '1');
INSERT INTO `dx_cascadedata` VALUES ('19898', '彭阳县', '15504.5', 'area', '15505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19897', '泾源县', '15504.4', 'area', '15504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19896', '隆德县', '15504.3', 'area', '15504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19895', '西吉县', '15504.2', 'area', '15504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19894', '原州区', '15504.1', 'area', '15504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19893', '固原市', '15504', 'area', '15504', '1');
INSERT INTO `dx_cascadedata` VALUES ('19892', '青铜峡市', '15503.4', 'area', '15503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19891', '同心县', '15503.3', 'area', '15503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19890', '盐池县', '15503.2', 'area', '15503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19889', '利通区', '15503.1', 'area', '15503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19888', '吴忠市', '15503', 'area', '15503', '1');
INSERT INTO `dx_cascadedata` VALUES ('19887', '平罗县', '15502.3', 'area', '15502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19886', '惠农区', '15502.2', 'area', '15502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19885', '大武口区', '15502.1', 'area', '15502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19884', '石嘴山市', '15502', 'area', '15502', '1');
INSERT INTO `dx_cascadedata` VALUES ('19883', '灵武市', '15501.6', 'area', '15502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19882', '贺兰县', '15501.5', 'area', '15502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19881', '永宁县', '15501.4', 'area', '15501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19880', '金凤区', '15501.3', 'area', '15501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19879', '西夏区', '15501.2', 'area', '15501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19878', '兴庆区', '15501.1', 'area', '15501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19877', '银川市', '15501', 'area', '15501', '1');
INSERT INTO `dx_cascadedata` VALUES ('19876', '宁夏回族自治区', '15500', 'area', '15500', '0');
INSERT INTO `dx_cascadedata` VALUES ('19875', '天峻县', '15008.5', 'area', '15009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19874', '都兰县', '15008.4', 'area', '15008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19873', '乌兰县', '15008.3', 'area', '15008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19872', '德令哈市', '15008.2', 'area', '15008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19871', '格尔木市', '15008.1', 'area', '15008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19870', '海西蒙古族藏族自治州', '15008', 'area', '15008', '1');
INSERT INTO `dx_cascadedata` VALUES ('19869', '曲麻莱县', '15007.6', 'area', '15008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19868', '囊谦县', '15007.5', 'area', '15008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19867', '治多县', '15007.4', 'area', '15007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19866', '称多县', '15007.3', 'area', '15007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19865', '杂多县', '15007.2', 'area', '15007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19864', '玉树县', '15007.1', 'area', '15007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19863', '玉树藏族自治州', '15007', 'area', '15007', '1');
INSERT INTO `dx_cascadedata` VALUES ('19862', '玛多县', '15006.6', 'area', '15007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19861', '久治县', '15006.5', 'area', '15007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19860', '达日县', '15006.4', 'area', '15006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19859', '甘德县', '15006.3', 'area', '15006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19858', '班玛县', '15006.2', 'area', '15006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19857', '玛沁县', '15006.1', 'area', '15006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19856', '果洛藏族自治州', '15006', 'area', '15006', '1');
INSERT INTO `dx_cascadedata` VALUES ('19855', '贵南县', '15005.5', 'area', '15006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19854', '兴海县', '15005.4', 'area', '15005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19853', '贵德县', '15005.3', 'area', '15005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19852', '同德县', '15005.2', 'area', '15005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19851', '共和县', '15005.1', 'area', '15005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19850', '海南藏族自治州', '15005', 'area', '15005', '1');
INSERT INTO `dx_cascadedata` VALUES ('19849', '河南蒙古族自治县', '15004.4', 'area', '15004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19848', '泽库县', '15004.3', 'area', '15004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19847', '尖扎县', '15004.2', 'area', '15004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19846', '同仁县', '15004.1', 'area', '15004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19845', '黄南藏族自治州', '15004', 'area', '15004', '1');
INSERT INTO `dx_cascadedata` VALUES ('19844', '刚察县', '15003.4', 'area', '15003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19843', '海晏县', '15003.3', 'area', '15003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19842', '祁连县', '15003.2', 'area', '15003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19841', '门源回族自治县', '15003.1', 'area', '15003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19840', '海北藏族自治州', '15003', 'area', '15003', '1');
INSERT INTO `dx_cascadedata` VALUES ('19839', '循化撒拉族自治县', '15002.6', 'area', '15003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19838', '化隆回族自治县', '15002.5', 'area', '15003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19837', '互助土族自治县', '15002.4', 'area', '15002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19836', '乐都县', '15002.3', 'area', '15002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19835', '民和回族土族自治县', '15002.2', 'area', '15002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19834', '平安县', '15002.1', 'area', '15002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19833', '海东地区', '15002', 'area', '15002', '1');
INSERT INTO `dx_cascadedata` VALUES ('19832', '湟源县', '15001.7', 'area', '15002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19831', '湟中县', '15001.6', 'area', '15002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19830', '大通回族土族自治县', '15001.5', 'area', '15002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19829', '城北区', '15001.4', 'area', '15001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19828', '城西区', '15001.3', 'area', '15001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19827', '城中区', '15001.2', 'area', '15001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19826', '城东区', '15001.1', 'area', '15001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19825', '西宁市', '15001', 'area', '15001', '1');
INSERT INTO `dx_cascadedata` VALUES ('19824', '青海省', '15000', 'area', '15000', '0');
INSERT INTO `dx_cascadedata` VALUES ('19823', '夏河县', '14514.8', 'area', '14515', '2');
INSERT INTO `dx_cascadedata` VALUES ('19822', '碌曲县', '14514.7', 'area', '14515', '2');
INSERT INTO `dx_cascadedata` VALUES ('19821', '玛曲县', '14514.6', 'area', '14515', '2');
INSERT INTO `dx_cascadedata` VALUES ('19820', '迭部县', '14514.5', 'area', '14515', '2');
INSERT INTO `dx_cascadedata` VALUES ('19819', '舟曲县', '14514.4', 'area', '14514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19818', '卓尼县', '14514.3', 'area', '14514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19817', '临潭县', '14514.2', 'area', '14514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19816', '合作市', '14514.1', 'area', '14514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19815', '甘南藏族自治州', '14514', 'area', '14514', '1');
INSERT INTO `dx_cascadedata` VALUES ('19814', '积石山保安族东乡族撒拉族自治县', '14513.8', 'area', '14514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19813', '东乡族自治县', '14513.7', 'area', '14514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19812', '和政县', '14513.6', 'area', '14514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19811', '广河县', '14513.5', 'area', '14514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19810', '永靖县', '14513.4', 'area', '14513', '2');
INSERT INTO `dx_cascadedata` VALUES ('19809', '康乐县', '14513.3', 'area', '14513', '2');
INSERT INTO `dx_cascadedata` VALUES ('19808', '临夏县', '14513.2', 'area', '14513', '2');
INSERT INTO `dx_cascadedata` VALUES ('19807', '临夏市', '14513.1', 'area', '14513', '2');
INSERT INTO `dx_cascadedata` VALUES ('19806', '临夏回族自治州', '14513', 'area', '14513', '1');
INSERT INTO `dx_cascadedata` VALUES ('19805', '两当县', '14512.9', 'area', '14513', '2');
INSERT INTO `dx_cascadedata` VALUES ('19804', '徽　县', '14512.8', 'area', '14513', '2');
INSERT INTO `dx_cascadedata` VALUES ('19803', '礼　县', '14512.7', 'area', '14513', '2');
INSERT INTO `dx_cascadedata` VALUES ('19802', '西和县', '14512.6', 'area', '14513', '2');
INSERT INTO `dx_cascadedata` VALUES ('19801', '康　县', '14512.5', 'area', '14513', '2');
INSERT INTO `dx_cascadedata` VALUES ('19800', '宕昌县', '14512.4', 'area', '14512', '2');
INSERT INTO `dx_cascadedata` VALUES ('19799', '文　县', '14512.3', 'area', '14512', '2');
INSERT INTO `dx_cascadedata` VALUES ('19798', '成　县', '14512.2', 'area', '14512', '2');
INSERT INTO `dx_cascadedata` VALUES ('19797', '武都区', '14512.1', 'area', '14512', '2');
INSERT INTO `dx_cascadedata` VALUES ('19796', '陇南市', '14512', 'area', '14512', '1');
INSERT INTO `dx_cascadedata` VALUES ('19795', '岷　县', '14511.7', 'area', '14512', '2');
INSERT INTO `dx_cascadedata` VALUES ('19794', '漳　县', '14511.6', 'area', '14512', '2');
INSERT INTO `dx_cascadedata` VALUES ('19793', '临洮县', '14511.5', 'area', '14512', '2');
INSERT INTO `dx_cascadedata` VALUES ('19792', '渭源县', '14511.4', 'area', '14511', '2');
INSERT INTO `dx_cascadedata` VALUES ('19791', '陇西县', '14511.3', 'area', '14511', '2');
INSERT INTO `dx_cascadedata` VALUES ('19790', '通渭县', '14511.2', 'area', '14511', '2');
INSERT INTO `dx_cascadedata` VALUES ('19789', '安定区', '14511.1', 'area', '14511', '2');
INSERT INTO `dx_cascadedata` VALUES ('19788', '定西市', '14511', 'area', '14511', '1');
INSERT INTO `dx_cascadedata` VALUES ('19787', '镇原县', '14510.8', 'area', '14511', '2');
INSERT INTO `dx_cascadedata` VALUES ('19786', '宁　县', '14510.7', 'area', '14511', '2');
INSERT INTO `dx_cascadedata` VALUES ('19785', '正宁县', '14510.6', 'area', '14511', '2');
INSERT INTO `dx_cascadedata` VALUES ('19784', '合水县', '14510.5', 'area', '14511', '2');
INSERT INTO `dx_cascadedata` VALUES ('19783', '华池县', '14510.4', 'area', '14510', '2');
INSERT INTO `dx_cascadedata` VALUES ('19782', '环　县', '14510.3', 'area', '14510', '2');
INSERT INTO `dx_cascadedata` VALUES ('19781', '庆城县', '14510.2', 'area', '14510', '2');
INSERT INTO `dx_cascadedata` VALUES ('19780', '西峰区', '14510.1', 'area', '14510', '2');
INSERT INTO `dx_cascadedata` VALUES ('19779', '庆阳市', '14510', 'area', '14510', '1');
INSERT INTO `dx_cascadedata` VALUES ('19778', '敦煌市', '14509.7', 'area', '14510', '2');
INSERT INTO `dx_cascadedata` VALUES ('19777', '玉门市', '14509.6', 'area', '14510', '2');
INSERT INTO `dx_cascadedata` VALUES ('19776', '阿克塞哈萨克族自治县', '14509.5', 'area', '14510', '2');
INSERT INTO `dx_cascadedata` VALUES ('19775', '肃北蒙古族自治县', '14509.4', 'area', '14509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19774', '安西县', '14509.3', 'area', '14509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19773', '金塔县', '14509.2', 'area', '14509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19772', '肃州区', '14509.1', 'area', '14509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19771', '酒泉市', '14509', 'area', '14509', '1');
INSERT INTO `dx_cascadedata` VALUES ('19770', '静宁县', '14508.7', 'area', '14509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19769', '庄浪县', '14508.6', 'area', '14509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19768', '华亭县', '14508.5', 'area', '14509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19767', '崇信县', '14508.4', 'area', '14508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19766', '灵台县', '14508.3', 'area', '14508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19765', '泾川县', '14508.2', 'area', '14508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19764', '崆峒区', '14508.1', 'area', '14508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19763', '平凉市', '14508', 'area', '14508', '1');
INSERT INTO `dx_cascadedata` VALUES ('19762', '山丹县', '14507.6', 'area', '14508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19761', '高台县', '14507.5', 'area', '14508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19760', '临泽县', '14507.4', 'area', '14507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19759', '民乐县', '14507.3', 'area', '14507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19758', '肃南裕固族自治县', '14507.2', 'area', '14507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19757', '甘州区', '14507.1', 'area', '14507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19756', '张掖市', '14507', 'area', '14507', '1');
INSERT INTO `dx_cascadedata` VALUES ('19755', '天祝藏族自治县', '14506.4', 'area', '14506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19754', '古浪县', '14506.3', 'area', '14506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19753', '民勤县', '14506.2', 'area', '14506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19752', '凉州区', '14506.1', 'area', '14506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19751', '武威市', '14506', 'area', '14506', '1');
INSERT INTO `dx_cascadedata` VALUES ('19750', '张家川回族自治县', '14505.7', 'area', '14506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19749', '武山县', '14505.6', 'area', '14506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19748', '甘谷县', '14505.5', 'area', '14506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19747', '秦安县', '14505.4', 'area', '14505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19746', '清水县', '14505.3', 'area', '14505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19745', '北道区', '14505.2', 'area', '14505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19744', '秦城区', '14505.1', 'area', '14505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19743', '天水市', '14505', 'area', '14505', '1');
INSERT INTO `dx_cascadedata` VALUES ('19742', '景泰县', '14504.5', 'area', '14505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19741', '会宁县', '14504.4', 'area', '14504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19740', '靖远县', '14504.3', 'area', '14504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19739', '平川区', '14504.2', 'area', '14504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19738', '白银区', '14504.1', 'area', '14504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19737', '白银市', '14504', 'area', '14504', '1');
INSERT INTO `dx_cascadedata` VALUES ('19736', '永昌县', '14503.2', 'area', '14503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19735', '金川区', '14503.1', 'area', '14503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19734', '金昌市', '14503', 'area', '14503', '1');
INSERT INTO `dx_cascadedata` VALUES ('19733', '嘉峪关市', '14502', 'area', '14502', '1');
INSERT INTO `dx_cascadedata` VALUES ('19732', '榆中县', '14501.8', 'area', '14502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19731', '皋兰县', '14501.7', 'area', '14502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19730', '永登县', '14501.6', 'area', '14502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19729', '红古区', '14501.5', 'area', '14502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19728', '安宁区', '14501.4', 'area', '14501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19727', '西固区', '14501.3', 'area', '14501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19726', '七里河区', '14501.2', 'area', '14501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19725', '城关区', '14501.1', 'area', '14501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19724', '兰州市', '14501', 'area', '14501', '1');
INSERT INTO `dx_cascadedata` VALUES ('19723', '甘肃省', '14500', 'area', '14500', '0');
INSERT INTO `dx_cascadedata` VALUES ('19722', '柞水县', '14010.7', 'area', '14011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19721', '镇安县', '14010.6', 'area', '14011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19720', '山阳县', '14010.5', 'area', '14011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19719', '商南县', '14010.4', 'area', '14010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19718', '丹凤县', '14010.3', 'area', '14010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19717', '洛南县', '14010.2', 'area', '14010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19716', '商州区', '14010.1', 'area', '14010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19715', '商洛市', '14010', 'area', '14010', '1');
INSERT INTO `dx_cascadedata` VALUES ('19714', '白河县', '14009.10', 'area', '14009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19713', '旬阳县', '14009.9', 'area', '14010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19712', '镇坪县', '14009.8', 'area', '14010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19711', '平利县', '14009.7', 'area', '14010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19710', '岚皋县', '14009.6', 'area', '14010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19709', '紫阳县', '14009.5', 'area', '14010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19708', '宁陕县', '14009.4', 'area', '14009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19707', '石泉县', '14009.3', 'area', '14009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19706', '汉阴县', '14009.2', 'area', '14009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19705', '汉滨区', '14009.1', 'area', '14009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19704', '安康市', '14009', 'area', '14009', '1');
INSERT INTO `dx_cascadedata` VALUES ('19703', '子洲县', '14008.12', 'area', '14008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19702', '清涧县', '14008.11', 'area', '14008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19701', '吴堡县', '14008.10', 'area', '14008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19700', '佳　县', '14008.9', 'area', '14009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19699', '米脂县', '14008.8', 'area', '14009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19698', '绥德县', '14008.7', 'area', '14009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19697', '定边县', '14008.6', 'area', '14009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19696', '靖边县', '14008.5', 'area', '14009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19695', '横山县', '14008.4', 'area', '14008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19694', '府谷县', '14008.3', 'area', '14008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19693', '神木县', '14008.2', 'area', '14008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19692', '榆阳区', '14008.1', 'area', '14008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19691', '榆林市', '14008', 'area', '14008', '1');
INSERT INTO `dx_cascadedata` VALUES ('19690', '佛坪县', '14007.11', 'area', '14007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19689', '留坝县', '14007.10', 'area', '14007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19688', '镇巴县', '14007.9', 'area', '14008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19687', '略阳县', '14007.8', 'area', '14008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19686', '宁强县', '14007.7', 'area', '14008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19685', '勉　县', '14007.6', 'area', '14008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19684', '西乡县', '14007.5', 'area', '14008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19683', '洋　县', '14007.4', 'area', '14007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19682', '城固县', '14007.3', 'area', '14007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19681', '南郑县', '14007.2', 'area', '14007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19680', '汉台区', '14007.1', 'area', '14007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19679', '汉中市', '14007', 'area', '14007', '1');
INSERT INTO `dx_cascadedata` VALUES ('19678', '黄陵县', '14006.13', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19677', '黄龙县', '14006.12', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19676', '宜川县', '14006.11', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19675', '洛川县', '14006.10', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19674', '富　县', '14006.9', 'area', '14007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19673', '甘泉县', '14006.8', 'area', '14007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19672', '吴旗县', '14006.7', 'area', '14007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19671', '志丹县', '14006.6', 'area', '14007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19670', '安塞县', '14006.5', 'area', '14007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19669', '子长县', '14006.4', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19668', '延川县', '14006.3', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19667', '延长县', '14006.2', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19666', '宝塔区', '14006.1', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19665', '延安市', '14006', 'area', '14006', '1');
INSERT INTO `dx_cascadedata` VALUES ('19664', '华阴市', '14005.11', 'area', '14005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19663', '韩城市', '14005.10', 'area', '14005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19662', '富平县', '14005.9', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19661', '白水县', '14005.8', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19660', '蒲城县', '14005.7', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19659', '澄城县', '14005.6', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19658', '合阳县', '14005.5', 'area', '14006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19657', '大荔县', '14005.4', 'area', '14005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19656', '潼关县', '14005.3', 'area', '14005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19655', '华　县', '14005.2', 'area', '14005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19654', '临渭区', '14005.1', 'area', '14005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19653', '渭南市', '14005', 'area', '14005', '1');
INSERT INTO `dx_cascadedata` VALUES ('19652', '兴平市', '14004.14', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19651', '武功县', '14004.13', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19650', '淳化县', '14004.12', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19649', '旬邑县', '14004.11', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19648', '长武县', '14004.10', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19647', '彬　县', '14004.9', 'area', '14005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19646', '永寿县', '14004.8', 'area', '14005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19645', '礼泉县', '14004.7', 'area', '14005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19644', '乾　县', '14004.6', 'area', '14005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19643', '泾阳县', '14004.5', 'area', '14005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19642', '三原县', '14004.4', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19641', '渭城区', '14004.3', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19640', '杨凌区', '14004.2', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19639', '秦都区', '14004.1', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19638', '咸阳市', '14004', 'area', '14004', '1');
INSERT INTO `dx_cascadedata` VALUES ('19637', '太白县', '14003.12', 'area', '14003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19636', '凤　县', '14003.11', 'area', '14003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19635', '麟游县', '14003.10', 'area', '14003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19634', '千阳县', '14003.9', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19633', '陇　县', '14003.8', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19632', '眉　县', '14003.7', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19631', '扶风县', '14003.6', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19630', '岐山县', '14003.5', 'area', '14004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19629', '凤翔县', '14003.4', 'area', '14003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19628', '陈仓区', '14003.3', 'area', '14003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19627', '金台区', '14003.2', 'area', '14003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19626', '滨区', '14003.1', 'area', '14003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19625', '宝鸡市', '14003', 'area', '14003', '1');
INSERT INTO `dx_cascadedata` VALUES ('19624', '宜君县', '14002.4', 'area', '14002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19623', '耀州区', '14002.3', 'area', '14002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19622', '印台区', '14002.2', 'area', '14002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19621', '王益区', '14002.1', 'area', '14002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19620', '铜川市', '14002', 'area', '14002', '1');
INSERT INTO `dx_cascadedata` VALUES ('19619', '高陵县', '14001.13', 'area', '14001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19618', '户　县', '14001.12', 'area', '14001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19617', '周至县', '14001.11', 'area', '14001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19616', '蓝田县', '14001.10', 'area', '14001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19615', '长安区', '14001.9', 'area', '14002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19614', '临潼区', '14001.8', 'area', '14002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19613', '阎良区', '14001.7', 'area', '14002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19612', '雁塔区', '14001.6', 'area', '14002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19611', '未央区', '14001.5', 'area', '14002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19610', '灞桥区', '14001.4', 'area', '14001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19609', '莲湖区', '14001.3', 'area', '14001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19608', '碑林区', '14001.2', 'area', '14001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19607', '新城区', '14001.1', 'area', '14001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19606', '西安市', '14001', 'area', '14001', '1');
INSERT INTO `dx_cascadedata` VALUES ('19605', '陕西省', '14000', 'area', '14000', '0');
INSERT INTO `dx_cascadedata` VALUES ('19604', '朗　县', '13507.7', 'area', '13508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19603', '察隅县', '13507.6', 'area', '13508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19602', '波密县', '13507.5', 'area', '13508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19601', '墨脱县', '13507.4', 'area', '13507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19600', '米林县', '13507.3', 'area', '13507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19599', '工布江达县', '13507.2', 'area', '13507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19598', '林芝县', '13507.1', 'area', '13507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19597', '林芝地区', '13507', 'area', '13507', '1');
INSERT INTO `dx_cascadedata` VALUES ('19596', '措勤县', '13506.7', 'area', '13507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19595', '改则县', '13506.6', 'area', '13507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19594', '革吉县', '13506.5', 'area', '13507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19593', '日土县', '13506.4', 'area', '13506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19592', '噶尔县', '13506.3', 'area', '13506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19591', '札达县', '13506.2', 'area', '13506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19590', '普兰县', '13506.1', 'area', '13506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19589', '阿里地区', '13506', 'area', '13506', '1');
INSERT INTO `dx_cascadedata` VALUES ('19588', '尼玛县', '13505.10', 'area', '13505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19587', '巴青县', '13505.9', 'area', '13506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19586', '班戈县', '13505.8', 'area', '13506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19585', '索　县', '13505.7', 'area', '13506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19584', '申扎县', '13505.6', 'area', '13506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19583', '安多县', '13505.5', 'area', '13506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19582', '聂荣县', '13505.4', 'area', '13505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19581', '比如县', '13505.3', 'area', '13505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19580', '嘉黎县', '13505.2', 'area', '13505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19579', '那曲县', '13505.1', 'area', '13505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19578', '那曲地区', '13505', 'area', '13505', '1');
INSERT INTO `dx_cascadedata` VALUES ('19577', '岗巴县', '13504.18', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19576', '萨嘎县', '13504.17', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19575', '聂拉木县', '13504.16', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19574', '吉隆县', '13504.15', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19573', '亚东县', '13504.14', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19572', '仲巴县', '13504.13', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19571', '定结县', '13504.12', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19570', '康马县', '13504.11', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19569', '仁布县', '13504.10', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19568', '白朗县', '13504.9', 'area', '13505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19567', '谢通门县', '13504.8', 'area', '13505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19566', '昂仁县', '13504.7', 'area', '13505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19565', '拉孜县', '13504.6', 'area', '13505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19564', '萨迦县', '13504.5', 'area', '13505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19563', '定日县', '13504.4', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19562', '江孜县', '13504.3', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19561', '南木林县', '13504.2', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19560', '日喀则市', '13504.1', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19559', '日喀则地区', '13504', 'area', '13504', '1');
INSERT INTO `dx_cascadedata` VALUES ('19558', '浪卡子县', '13503.12', 'area', '13503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19557', '错那县', '13503.11', 'area', '13503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19556', '隆子县', '13503.10', 'area', '13503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19555', '加查县', '13503.9', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19554', '洛扎县', '13503.8', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19553', '措美县', '13503.7', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19552', '曲松县', '13503.6', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19551', '琼结县', '13503.5', 'area', '13504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19550', '桑日县', '13503.4', 'area', '13503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19549', '贡嘎县', '13503.3', 'area', '13503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19548', '扎囊县', '13503.2', 'area', '13503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19547', '乃东县', '13503.1', 'area', '13503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19546', '山南地区', '13503', 'area', '13503', '1');
INSERT INTO `dx_cascadedata` VALUES ('19545', '边坝县', '13502.11', 'area', '13502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19544', '洛隆县', '13502.10', 'area', '13502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19543', '芒康县', '13502.9', 'area', '13503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19542', '左贡县', '13502.8', 'area', '13503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19541', '八宿县', '13502.7', 'area', '13503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19540', '察雅县', '13502.6', 'area', '13503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19539', '丁青县', '13502.5', 'area', '13503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19538', '类乌齐县', '13502.4', 'area', '13502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19537', '贡觉县', '13502.3', 'area', '13502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19536', '江达县', '13502.2', 'area', '13502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19535', '昌都县', '13502.1', 'area', '13502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19534', '昌都地区', '13502', 'area', '13502', '1');
INSERT INTO `dx_cascadedata` VALUES ('19533', '墨竹工卡县', '13501.8', 'area', '13502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19532', '达孜县', '13501.7', 'area', '13502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19531', '堆龙德庆县', '13501.6', 'area', '13502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19530', '曲水县', '13501.5', 'area', '13502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19529', '尼木县', '13501.4', 'area', '13501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19528', '当雄县', '13501.3', 'area', '13501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19527', '林周县', '13501.2', 'area', '13501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19526', '城关区', '13501.1', 'area', '13501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19525', '拉萨市', '13501', 'area', '13501', '1');
INSERT INTO `dx_cascadedata` VALUES ('19524', '西藏自治区', '13500', 'area', '13500', '0');
INSERT INTO `dx_cascadedata` VALUES ('19523', '维西傈僳族自治县', '13016.3', 'area', '13016', '2');
INSERT INTO `dx_cascadedata` VALUES ('19522', '德钦县', '13016.2', 'area', '13016', '2');
INSERT INTO `dx_cascadedata` VALUES ('19521', '香格里拉县', '13016.1', 'area', '13016', '2');
INSERT INTO `dx_cascadedata` VALUES ('19520', '迪庆藏族自治州', '13016', 'area', '13016', '1');
INSERT INTO `dx_cascadedata` VALUES ('19519', '兰坪白族普米族自治县', '13015.4', 'area', '13015', '2');
INSERT INTO `dx_cascadedata` VALUES ('19518', '贡山独龙族怒族自治县', '13015.3', 'area', '13015', '2');
INSERT INTO `dx_cascadedata` VALUES ('19517', '福贡县', '13015.2', 'area', '13015', '2');
INSERT INTO `dx_cascadedata` VALUES ('19516', '泸水县', '13015.1', 'area', '13015', '2');
INSERT INTO `dx_cascadedata` VALUES ('19515', '怒江傈僳族自治州', '13015', 'area', '13015', '1');
INSERT INTO `dx_cascadedata` VALUES ('19514', '陇川县', '13014.5', 'area', '13015', '2');
INSERT INTO `dx_cascadedata` VALUES ('19513', '盈江县', '13014.4', 'area', '13014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19512', '梁河县', '13014.3', 'area', '13014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19511', '潞西市', '13014.2', 'area', '13014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19510', '瑞丽市', '13014.1', 'area', '13014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19509', '德宏傣族景颇族自治州', '13014', 'area', '13014', '1');
INSERT INTO `dx_cascadedata` VALUES ('19508', '鹤庆县', '13013.12', 'area', '13013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19507', '剑川县', '13013.11', 'area', '13013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19506', '洱源县', '13013.10', 'area', '13013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19505', '云龙县', '13013.9', 'area', '13014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19504', '永平县', '13013.8', 'area', '13014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19503', '巍山彝族回族自治县', '13013.7', 'area', '13014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19502', '南涧彝族自治县', '13013.6', 'area', '13014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19501', '弥渡县', '13013.5', 'area', '13014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19500', '宾川县', '13013.4', 'area', '13013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19499', '祥云县', '13013.3', 'area', '13013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19498', '漾濞彝族自治县', '13013.2', 'area', '13013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19497', '大理市', '13013.1', 'area', '13013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19496', '大理白族自治州', '13013', 'area', '13013', '1');
INSERT INTO `dx_cascadedata` VALUES ('19495', '勐腊县', '13012.3', 'area', '13012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19494', '勐海县', '13012.2', 'area', '13012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19493', '景洪市', '13012.1', 'area', '13012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19492', '西双版纳傣族自治州', '13012', 'area', '13012', '1');
INSERT INTO `dx_cascadedata` VALUES ('19491', '富宁县', '13011.8', 'area', '13012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19490', '广南县', '13011.7', 'area', '13012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19489', '丘北县', '13011.6', 'area', '13012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19488', '马关县', '13011.5', 'area', '13012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19487', '麻栗坡县', '13011.4', 'area', '13011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19486', '西畴县', '13011.3', 'area', '13011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19485', '砚山县', '13011.2', 'area', '13011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19484', '文山县', '13011.1', 'area', '13011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19483', '文山壮族苗族自治州', '13011', 'area', '13011', '1');
INSERT INTO `dx_cascadedata` VALUES ('19482', '河口瑶族自治县', '13010.12', 'area', '13010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19481', '绿春县', '13010.11', 'area', '13010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19480', '金平苗族瑶族傣族自治县', '13010.10', 'area', '13010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19479', '元阳县', '13010.9', 'area', '13011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19478', '泸西县', '13010.8', 'area', '13011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19477', '弥勒县', '13010.7', 'area', '13011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19476', '石屏县', '13010.6', 'area', '13011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19475', '建水县', '13010.5', 'area', '13011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19474', '屏边苗族自治县', '13010.4', 'area', '13010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19473', '蒙自县', '13010.3', 'area', '13010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19472', '开远市', '13010.2', 'area', '13010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19471', '个旧市', '13010.1', 'area', '13010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19470', '红河哈尼族彝族自治州', '13010', 'area', '13010', '1');
INSERT INTO `dx_cascadedata` VALUES ('19469', '禄丰县', '13009.10', 'area', '13009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19468', '武定县', '13009.9', 'area', '13010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19467', '元谋县', '13009.8', 'area', '13010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19466', '永仁县', '13009.7', 'area', '13010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19465', '大姚县', '13009.6', 'area', '13010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19464', '姚安县', '13009.5', 'area', '13010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19463', '南华县', '13009.4', 'area', '13009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19462', '牟定县', '13009.3', 'area', '13009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19461', '双柏县', '13009.2', 'area', '13009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19460', '楚雄市', '13009.1', 'area', '13009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19459', '楚雄彝族自治州', '13009', 'area', '13009', '1');
INSERT INTO `dx_cascadedata` VALUES ('19458', '沧源佤族自治县', '13008.8', 'area', '13009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19457', '耿马傣族佤族自治县', '13008.7', 'area', '13009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19456', '双江拉祜族佤族布朗族傣族自治县', '13008.6', 'area', '13009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19455', '镇康县', '13008.5', 'area', '13009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19454', '永德县', '13008.4', 'area', '13008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19453', '云　县', '13008.3', 'area', '13008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19452', '凤庆县', '13008.2', 'area', '13008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19451', '临翔区', '13008.1', 'area', '13008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19450', '临沧市', '13008', 'area', '13008', '1');
INSERT INTO `dx_cascadedata` VALUES ('19449', '西盟佤族自治县', '13007.10', 'area', '13007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19448', '澜沧拉祜族自治县', '13007.9', 'area', '13008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19447', '孟连傣族拉祜族佤族自治县', '13007.8', 'area', '13008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19446', '江城哈尼族彝族自治县', '13007.7', 'area', '13008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19445', '镇沅彝族哈尼族拉祜族自治县', '13007.6', 'area', '13008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19444', '景谷傣族彝族自治县', '13007.5', 'area', '13008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19443', '景东彝族自治县', '13007.4', 'area', '13007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19442', '墨江哈尼族自治县', '13007.3', 'area', '13007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19441', '普洱哈尼族彝族自治县', '13007.2', 'area', '13007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19440', '翠云区', '13007.1', 'area', '13007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19439', '思茅市', '13007', 'area', '13007', '1');
INSERT INTO `dx_cascadedata` VALUES ('19438', '宁蒗彝族自治县', '13006.5', 'area', '13007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19437', '华坪县', '13006.4', 'area', '13006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19436', '永胜县', '13006.3', 'area', '13006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19435', '玉龙纳西族自治县', '13006.2', 'area', '13006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19434', '古城区', '13006.1', 'area', '13006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19433', '丽江市', '13006', 'area', '13006', '1');
INSERT INTO `dx_cascadedata` VALUES ('19432', '水富县', '13005.11', 'area', '13005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19431', '威信县', '13005.10', 'area', '13005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19430', '彝良县', '13005.9', 'area', '13006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19429', '镇雄县', '13005.8', 'area', '13006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19428', '绥江县', '13005.7', 'area', '13006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19427', '永善县', '13005.6', 'area', '13006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19426', '大关县', '13005.5', 'area', '13006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19425', '盐津县', '13005.4', 'area', '13005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19424', '巧家县', '13005.3', 'area', '13005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19423', '鲁甸县', '13005.2', 'area', '13005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19422', '昭阳区', '13005.1', 'area', '13005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19421', '昭通市', '13005', 'area', '13005', '1');
INSERT INTO `dx_cascadedata` VALUES ('19420', '昌宁县', '13004.5', 'area', '13005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19419', '龙陵县', '13004.4', 'area', '13004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19418', '腾冲县', '13004.3', 'area', '13004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19417', '施甸县', '13004.2', 'area', '13004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19416', '隆阳区', '13004.1', 'area', '13004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19415', '保山市', '13004', 'area', '13004', '1');
INSERT INTO `dx_cascadedata` VALUES ('19414', '元江哈尼族彝族傣族自治县', '13003.9', 'area', '13004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19413', '新平彝族傣族自治县', '13003.8', 'area', '13004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19412', '峨山彝族自治县', '13003.7', 'area', '13004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19411', '易门县', '13003.6', 'area', '13004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19410', '华宁县', '13003.5', 'area', '13004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19409', '通海县', '13003.4', 'area', '13003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19408', '澄江县', '13003.3', 'area', '13003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19407', '江川县', '13003.2', 'area', '13003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19406', '红塔区', '13003.1', 'area', '13003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19405', '玉溪市', '13003', 'area', '13003', '1');
INSERT INTO `dx_cascadedata` VALUES ('19404', '宣威市', '13002.9', 'area', '13003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19403', '沾益县', '13002.8', 'area', '13003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19402', '会泽县', '13002.7', 'area', '13003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19401', '富源县', '13002.6', 'area', '13003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19400', '罗平县', '13002.5', 'area', '13003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19399', '师宗县', '13002.4', 'area', '13002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19398', '陆良县', '13002.3', 'area', '13002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19397', '马龙县', '13002.2', 'area', '13002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19396', '麒麟区', '13002.1', 'area', '13002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19395', '曲靖市', '13002', 'area', '13002', '1');
INSERT INTO `dx_cascadedata` VALUES ('19394', '安宁市', '13001.14', 'area', '13001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19393', '寻甸回族彝族自治县', '13001.13', 'area', '13001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19392', '禄劝彝族苗族自治县', '13001.12', 'area', '13001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19391', '嵩明县', '13001.11', 'area', '13001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19390', '石林彝族自治县', '13001.10', 'area', '13001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19389', '宜良县', '13001.9', 'area', '13002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19388', '富民县', '13001.8', 'area', '13002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19387', '晋宁县', '13001.7', 'area', '13002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19386', '呈贡县', '13001.6', 'area', '13002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19385', '东川区', '13001.5', 'area', '13002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19384', '西山区', '13001.4', 'area', '13001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19383', '官渡区', '13001.3', 'area', '13001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19382', '盘龙区', '13001.2', 'area', '13001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19381', '五华区', '13001.1', 'area', '13001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19380', '昆明市', '13001', 'area', '13001', '1');
INSERT INTO `dx_cascadedata` VALUES ('19379', '云南省', '13000', 'area', '13000', '0');
INSERT INTO `dx_cascadedata` VALUES ('19378', '三都水族自治县', '12509.12', 'area', '12509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19377', '惠水县', '12509.11', 'area', '12509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19376', '龙里县', '12509.10', 'area', '12509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19375', '长顺县', '12509.9', 'area', '12510', '2');
INSERT INTO `dx_cascadedata` VALUES ('19374', '罗甸县', '12509.8', 'area', '12510', '2');
INSERT INTO `dx_cascadedata` VALUES ('19373', '平塘县', '12509.7', 'area', '12510', '2');
INSERT INTO `dx_cascadedata` VALUES ('19372', '独山县', '12509.6', 'area', '12510', '2');
INSERT INTO `dx_cascadedata` VALUES ('19371', '瓮安县', '12509.5', 'area', '12510', '2');
INSERT INTO `dx_cascadedata` VALUES ('19370', '贵定县', '12509.4', 'area', '12509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19369', '荔波县', '12509.3', 'area', '12509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19368', '福泉市', '12509.2', 'area', '12509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19367', '都匀市', '12509.1', 'area', '12509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19366', '黔南布依族苗族自治州', '12509', 'area', '12509', '1');
INSERT INTO `dx_cascadedata` VALUES ('19365', '麻江县', '12508.15', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19364', '雷山县', '12508.14', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19363', '从江县', '12508.13', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19362', '榕江县', '12508.12', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19361', '黎平县', '12508.11', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19360', '台江县', '12508.10', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19359', '剑河县', '12508.9', 'area', '12509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19358', '锦屏县', '12508.8', 'area', '12509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19357', '天柱县', '12508.7', 'area', '12509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19356', '岑巩县', '12508.6', 'area', '12509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19355', '镇远县', '12508.5', 'area', '12509', '2');
INSERT INTO `dx_cascadedata` VALUES ('19354', '三穗县', '12508.4', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19353', '施秉县', '12508.3', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19352', '黄平县', '12508.2', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19351', '凯里市', '12508.1', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19350', '黔东南苗族侗族自治州', '12508', 'area', '12508', '1');
INSERT INTO `dx_cascadedata` VALUES ('19349', '赫章县', '12507.8', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19348', '威宁彝族回族苗族自治县', '12507.7', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19347', '纳雍县', '12507.6', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19346', '织金县', '12507.5', 'area', '12508', '2');
INSERT INTO `dx_cascadedata` VALUES ('19345', '金沙县', '12507.4', 'area', '12507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19344', '黔西县', '12507.3', 'area', '12507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19343', '大方县', '12507.2', 'area', '12507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19342', '毕节市', '12507.1', 'area', '12507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19341', '毕节地区', '12507', 'area', '12507', '1');
INSERT INTO `dx_cascadedata` VALUES ('19340', '安龙县', '12506.8', 'area', '12507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19339', '册亨县', '12506.7', 'area', '12507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19338', '望谟县', '12506.6', 'area', '12507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19337', '贞丰县', '12506.5', 'area', '12507', '2');
INSERT INTO `dx_cascadedata` VALUES ('19336', '晴隆县', '12506.4', 'area', '12506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19335', '普安县', '12506.3', 'area', '12506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19334', '兴仁县', '12506.2', 'area', '12506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19333', '兴义市', '12506.1', 'area', '12506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19332', '黔西南布依族苗族自治州', '12506', 'area', '12506', '1');
INSERT INTO `dx_cascadedata` VALUES ('19331', '万山特区', '12505.10', 'area', '12505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19330', '松桃苗族自治县', '12505.9', 'area', '12506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19329', '沿河土家族自治县', '12505.8', 'area', '12506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19328', '德江县', '12505.7', 'area', '12506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19327', '印江土家族苗族自治县', '12505.6', 'area', '12506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19326', '思南县', '12505.5', 'area', '12506', '2');
INSERT INTO `dx_cascadedata` VALUES ('19325', '石阡县', '12505.4', 'area', '12505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19324', '玉屏侗族自治县', '12505.3', 'area', '12505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19323', '江口县', '12505.2', 'area', '12505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19322', '铜仁市', '12505.1', 'area', '12505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19321', '铜仁地区', '12505', 'area', '12505', '1');
INSERT INTO `dx_cascadedata` VALUES ('19320', '紫云苗族布依族自治县', '12504.6', 'area', '12505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19319', '关岭布依族苗族自治县', '12504.5', 'area', '12505', '2');
INSERT INTO `dx_cascadedata` VALUES ('19318', '镇宁布依族苗族自治县', '12504.4', 'area', '12504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19317', '普定县', '12504.3', 'area', '12504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19316', '平坝县', '12504.2', 'area', '12504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19315', '西秀区', '12504.1', 'area', '12504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19314', '安顺市', '12504', 'area', '12504', '1');
INSERT INTO `dx_cascadedata` VALUES ('19313', '仁怀市', '12503.14', 'area', '12503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19312', '赤水市', '12503.13', 'area', '12503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19311', '习水县', '12503.12', 'area', '12503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19310', '余庆县', '12503.11', 'area', '12503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19309', '湄潭县', '12503.10', 'area', '12503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19308', '凤冈县', '12503.9', 'area', '12504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19307', '务川仡佬族苗族自治县', '12503.8', 'area', '12504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19306', '道真仡佬族苗族自治县', '12503.7', 'area', '12504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19305', '正安县', '12503.6', 'area', '12504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19304', '绥阳县', '12503.5', 'area', '12504', '2');
INSERT INTO `dx_cascadedata` VALUES ('19303', '桐梓县', '12503.4', 'area', '12503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19302', '遵义县', '12503.3', 'area', '12503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19301', '汇川区', '12503.2', 'area', '12503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19300', '红花岗区', '12503.1', 'area', '12503', '2');
INSERT INTO `dx_cascadedata` VALUES ('19299', '遵义市', '12503', 'area', '12503', '1');
INSERT INTO `dx_cascadedata` VALUES ('19298', '盘　县', '12502.4', 'area', '12502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19297', '水城县', '12502.3', 'area', '12502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19296', '六枝特区', '12502.2', 'area', '12502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19295', '钟山区', '12502.1', 'area', '12502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19294', '六盘水市', '12502', 'area', '12502', '1');
INSERT INTO `dx_cascadedata` VALUES ('19293', '清镇市', '12501.10', 'area', '12501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19292', '修文县', '12501.9', 'area', '12502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19291', '息烽县', '12501.8', 'area', '12502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19290', '开阳县', '12501.7', 'area', '12502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19289', '小河区', '12501.6', 'area', '12502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19288', '白云区', '12501.5', 'area', '12502', '2');
INSERT INTO `dx_cascadedata` VALUES ('19287', '乌当区', '12501.4', 'area', '12501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19286', '花溪区', '12501.3', 'area', '12501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19285', '云岩区', '12501.2', 'area', '12501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19284', '南明区', '12501.1', 'area', '12501', '2');
INSERT INTO `dx_cascadedata` VALUES ('19283', '贵阳市', '12501', 'area', '12501', '1');
INSERT INTO `dx_cascadedata` VALUES ('19282', '贵州省', '12500', 'area', '12500', '0');
INSERT INTO `dx_cascadedata` VALUES ('19281', '雷波县', '12021.17', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19280', '美姑县', '12021.16', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19279', '甘洛县', '12021.15', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19278', '越西县', '12021.14', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19277', '冕宁县', '12021.13', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19276', '喜德县', '12021.12', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19275', '昭觉县', '12021.11', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19274', '金阳县', '12021.10', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19273', '布拖县', '12021.9', 'area', '12022', '2');
INSERT INTO `dx_cascadedata` VALUES ('19272', '普格县', '12021.8', 'area', '12022', '2');
INSERT INTO `dx_cascadedata` VALUES ('19271', '宁南县', '12021.7', 'area', '12022', '2');
INSERT INTO `dx_cascadedata` VALUES ('19270', '会东县', '12021.6', 'area', '12022', '2');
INSERT INTO `dx_cascadedata` VALUES ('19269', '会理县', '12021.5', 'area', '12022', '2');
INSERT INTO `dx_cascadedata` VALUES ('19268', '德昌县', '12021.4', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19267', '盐源县', '12021.3', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19266', '木里藏族自治县', '12021.2', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19265', '西昌市', '12021.1', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19264', '凉山彝族自治州', '12021', 'area', '12021', '1');
INSERT INTO `dx_cascadedata` VALUES ('19263', '得荣县', '12020.18', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19262', '稻城县', '12020.17', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19261', '乡城县', '12020.16', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19260', '巴塘县', '12020.15', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19259', '理塘县', '12020.14', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19258', '色达县', '12020.13', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19257', '石渠县', '12020.12', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19256', '白玉县', '12020.11', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19255', '德格县', '12020.10', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19254', '新龙县', '12020.9', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19253', '甘孜县', '12020.8', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19252', '炉霍县', '12020.7', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19251', '道孚县', '12020.6', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19250', '雅江县', '12020.5', 'area', '12021', '2');
INSERT INTO `dx_cascadedata` VALUES ('19249', '九龙县', '12020.4', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19248', '丹巴县', '12020.3', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19247', '泸定县', '12020.2', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19246', '康定县', '12020.1', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19245', '甘孜藏族自治州', '12020', 'area', '12020', '1');
INSERT INTO `dx_cascadedata` VALUES ('19244', '红原县', '12019.13', 'area', '12019', '2');
INSERT INTO `dx_cascadedata` VALUES ('19243', '若尔盖县', '12019.12', 'area', '12019', '2');
INSERT INTO `dx_cascadedata` VALUES ('19242', '阿坝县', '12019.11', 'area', '12019', '2');
INSERT INTO `dx_cascadedata` VALUES ('19241', '壤塘县', '12019.10', 'area', '12019', '2');
INSERT INTO `dx_cascadedata` VALUES ('19240', '马尔康县', '12019.9', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19239', '黑水县', '12019.8', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19238', '小金县', '12019.7', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19237', '金川县', '12019.6', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19236', '九寨沟县', '12019.5', 'area', '12020', '2');
INSERT INTO `dx_cascadedata` VALUES ('19235', '松潘县', '12019.4', 'area', '12019', '2');
INSERT INTO `dx_cascadedata` VALUES ('19234', '茂　县', '12019.3', 'area', '12019', '2');
INSERT INTO `dx_cascadedata` VALUES ('19233', '理　县', '12019.2', 'area', '12019', '2');
INSERT INTO `dx_cascadedata` VALUES ('19232', '汶川县', '12019.1', 'area', '12019', '2');
INSERT INTO `dx_cascadedata` VALUES ('19231', '阿坝藏族羌族自治州', '12019', 'area', '12019', '1');
INSERT INTO `dx_cascadedata` VALUES ('19230', '简阳市', '12018.4', 'area', '12018', '2');
INSERT INTO `dx_cascadedata` VALUES ('19229', '乐至县', '12018.3', 'area', '12018', '2');
INSERT INTO `dx_cascadedata` VALUES ('19228', '安岳县', '12018.2', 'area', '12018', '2');
INSERT INTO `dx_cascadedata` VALUES ('19227', '雁江区', '12018.1', 'area', '12018', '2');
INSERT INTO `dx_cascadedata` VALUES ('19226', '资阳市', '12018', 'area', '12018', '1');
INSERT INTO `dx_cascadedata` VALUES ('19225', '平昌县', '12017.4', 'area', '12017', '2');
INSERT INTO `dx_cascadedata` VALUES ('19224', '南江县', '12017.3', 'area', '12017', '2');
INSERT INTO `dx_cascadedata` VALUES ('19223', '通江县', '12017.2', 'area', '12017', '2');
INSERT INTO `dx_cascadedata` VALUES ('19222', '巴州区', '12017.1', 'area', '12017', '2');
INSERT INTO `dx_cascadedata` VALUES ('19221', '巴中市', '12017', 'area', '12017', '1');
INSERT INTO `dx_cascadedata` VALUES ('19220', '宝兴县', '12016.8', 'area', '12017', '2');
INSERT INTO `dx_cascadedata` VALUES ('19219', '芦山县', '12016.7', 'area', '12017', '2');
INSERT INTO `dx_cascadedata` VALUES ('19218', '天全县', '12016.6', 'area', '12017', '2');
INSERT INTO `dx_cascadedata` VALUES ('19217', '石棉县', '12016.5', 'area', '12017', '2');
INSERT INTO `dx_cascadedata` VALUES ('19216', '汉源县', '12016.4', 'area', '12016', '2');
INSERT INTO `dx_cascadedata` VALUES ('19215', '荥经县', '12016.3', 'area', '12016', '2');
INSERT INTO `dx_cascadedata` VALUES ('19214', '名山县', '12016.2', 'area', '12016', '2');
INSERT INTO `dx_cascadedata` VALUES ('19213', '雨城区', '12016.1', 'area', '12016', '2');
INSERT INTO `dx_cascadedata` VALUES ('19212', '雅安市', '12016', 'area', '12016', '1');
INSERT INTO `dx_cascadedata` VALUES ('19211', '万源市', '12015.7', 'area', '12016', '2');
INSERT INTO `dx_cascadedata` VALUES ('19210', '渠　县', '12015.6', 'area', '12016', '2');
INSERT INTO `dx_cascadedata` VALUES ('19209', '大竹县', '12015.5', 'area', '12016', '2');
INSERT INTO `dx_cascadedata` VALUES ('19208', '开江县', '12015.4', 'area', '12015', '2');
INSERT INTO `dx_cascadedata` VALUES ('19207', '宣汉县', '12015.3', 'area', '12015', '2');
INSERT INTO `dx_cascadedata` VALUES ('19206', '达　县', '12015.2', 'area', '12015', '2');
INSERT INTO `dx_cascadedata` VALUES ('19205', '通川区', '12015.1', 'area', '12015', '2');
INSERT INTO `dx_cascadedata` VALUES ('19204', '达州市', '12015', 'area', '12015', '1');
INSERT INTO `dx_cascadedata` VALUES ('19203', '华莹市', '12014.5', 'area', '12015', '2');
INSERT INTO `dx_cascadedata` VALUES ('19202', '邻水县', '12014.4', 'area', '12014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19201', '武胜县', '12014.3', 'area', '12014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19200', '岳池县', '12014.2', 'area', '12014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19199', '广安区', '12014.1', 'area', '12014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19198', '广安市', '12014', 'area', '12014', '1');
INSERT INTO `dx_cascadedata` VALUES ('19197', '屏山县', '12013.10', 'area', '12013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19196', '兴文县', '12013.9', 'area', '12014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19195', '筠连县', '12013.8', 'area', '12014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19194', '珙　县', '12013.7', 'area', '12014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19193', '高　县', '12013.6', 'area', '12014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19192', '长宁县', '12013.5', 'area', '12014', '2');
INSERT INTO `dx_cascadedata` VALUES ('19191', '江安县', '12013.4', 'area', '12013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19190', '南溪县', '12013.3', 'area', '12013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19189', '宜宾县', '12013.2', 'area', '12013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19188', '翠屏区', '12013.1', 'area', '12013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19187', '宜宾市', '12013', 'area', '12013', '1');
INSERT INTO `dx_cascadedata` VALUES ('19186', '青神县', '12012.6', 'area', '12013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19185', '丹棱县', '12012.5', 'area', '12013', '2');
INSERT INTO `dx_cascadedata` VALUES ('19184', '洪雅县', '12012.4', 'area', '12012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19183', '彭山县', '12012.3', 'area', '12012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19182', '仁寿县', '12012.2', 'area', '12012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19181', '东坡区', '12012.1', 'area', '12012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19180', '眉山市', '12012', 'area', '12012', '1');
INSERT INTO `dx_cascadedata` VALUES ('19179', '阆中市', '12011.9', 'area', '12012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19178', '西充县', '12011.8', 'area', '12012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19177', '仪陇县', '12011.7', 'area', '12012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19176', '蓬安县', '12011.6', 'area', '12012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19175', '营山县', '12011.5', 'area', '12012', '2');
INSERT INTO `dx_cascadedata` VALUES ('19174', '南部县', '12011.4', 'area', '12011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19173', '嘉陵区', '12011.3', 'area', '12011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19172', '高坪区', '12011.2', 'area', '12011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19171', '顺庆区', '12011.1', 'area', '12011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19170', '南充市', '12011', 'area', '12011', '1');
INSERT INTO `dx_cascadedata` VALUES ('19169', '峨眉山市', '12010.11', 'area', '12010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19168', '马边彝族自治县', '12010.10', 'area', '12010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19167', '峨边彝族自治县', '12010.9', 'area', '12011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19166', '沐川县', '12010.8', 'area', '12011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19165', '夹江县', '12010.7', 'area', '12011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19164', '井研县', '12010.6', 'area', '12011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19163', '犍为县', '12010.5', 'area', '12011', '2');
INSERT INTO `dx_cascadedata` VALUES ('19162', '金口河区', '12010.4', 'area', '12010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19161', '五通桥区', '12010.3', 'area', '12010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19160', '沙湾区', '12010.2', 'area', '12010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19159', '市中区', '12010.1', 'area', '12010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19158', '乐山市', '12010', 'area', '12010', '1');
INSERT INTO `dx_cascadedata` VALUES ('19157', '隆昌县', '12009.5', 'area', '12010', '2');
INSERT INTO `dx_cascadedata` VALUES ('19156', '资中县', '12009.4', 'area', '12009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19155', '威远县', '12009.3', 'area', '12009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19154', '东兴区', '12009.2', 'area', '12009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19153', '市中区', '12009.1', 'area', '12009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19152', '内江市', '12009', 'area', '12009', '1');
INSERT INTO `dx_cascadedata` VALUES ('19151', '大英县', '12008.5', 'area', '12009', '2');
INSERT INTO `dx_cascadedata` VALUES ('19150', '射洪县', '12008.4', 'area', '12008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19149', '蓬溪县', '12008.3', 'area', '12008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19148', '安居区', '12008.2', 'area', '12008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19147', '船山区', '12008.1', 'area', '12008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19146', '遂宁市', '12008', 'area', '12008', '1');
INSERT INTO `dx_cascadedata` VALUES ('19145', '苍溪县', '12007.7', 'area', '12008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19144', '剑阁县', '12007.6', 'area', '12008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19143', '青川县', '12007.5', 'area', '12008', '2');
INSERT INTO `dx_cascadedata` VALUES ('19142', '旺苍县', '12007.4', 'area', '12007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19141', '朝天区', '12007.3', 'area', '12007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19140', '元坝区', '12007.2', 'area', '12007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19139', '市中区', '12007.1', 'area', '12007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19138', '广元市', '12007', 'area', '12007', '1');
INSERT INTO `dx_cascadedata` VALUES ('19137', '江油市', '12006.9', 'area', '12007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19136', '平武县', '12006.8', 'area', '12007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19135', '北川羌族自治县', '12006.7', 'area', '12007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19134', '梓潼县', '12006.6', 'area', '12007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19133', '安　县', '12006.5', 'area', '12007', '2');
INSERT INTO `dx_cascadedata` VALUES ('19132', '盐亭县', '12006.4', 'area', '12006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19131', '三台县', '12006.3', 'area', '12006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19130', '游仙区', '12006.2', 'area', '12006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19129', '涪城区', '12006.1', 'area', '12006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19128', '绵阳市', '12006', 'area', '12006', '1');
INSERT INTO `dx_cascadedata` VALUES ('19127', '绵竹市', '12005.6', 'area', '12006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19126', '什邡市', '12005.5', 'area', '12006', '2');
INSERT INTO `dx_cascadedata` VALUES ('19125', '广汉市', '12005.4', 'area', '12005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19124', '罗江县', '12005.3', 'area', '12005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19123', '中江县', '12005.2', 'area', '12005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19122', '旌阳区', '12005.1', 'area', '12005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19121', '德阳市', '12005', 'area', '12005', '1');
INSERT INTO `dx_cascadedata` VALUES ('19120', '古蔺县', '12004.7', 'area', '12005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19119', '叙永县', '12004.6', 'area', '12005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19118', '合江县', '12004.5', 'area', '12005', '2');
INSERT INTO `dx_cascadedata` VALUES ('19117', '泸　县', '12004.4', 'area', '12004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19116', '龙马潭区', '12004.3', 'area', '12004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19115', '纳溪区', '12004.2', 'area', '12004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19114', '江阳区', '12004.1', 'area', '12004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19113', '泸州市', '12004', 'area', '12004', '1');
INSERT INTO `dx_cascadedata` VALUES ('19112', '盐边县', '12003.5', 'area', '12004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19111', '米易县', '12003.4', 'area', '12003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19110', '仁和区', '12003.3', 'area', '12003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19109', '西　区', '12003.2', 'area', '12003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19108', '东　区', '12003.1', 'area', '12003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19107', '攀枝花市', '12003', 'area', '12003', '1');
INSERT INTO `dx_cascadedata` VALUES ('19106', '富顺县', '12002.6', 'area', '12003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19105', '荣　县', '12002.5', 'area', '12003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19104', '沿滩区', '12002.4', 'area', '12002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19103', '大安区', '12002.3', 'area', '12002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19102', '贡井区', '12002.2', 'area', '12002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19101', '自流井区', '12002.1', 'area', '12002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19100', '自贡市', '12002', 'area', '12002', '1');
INSERT INTO `dx_cascadedata` VALUES ('19099', '崇州市', '12001.19', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19098', '邛崃市', '12001.18', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19097', '彭州市', '12001.17', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19096', '都江堰市', '12001.16', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19095', '新津县', '12001.15', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19094', '蒲江县', '12001.14', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19093', '大邑县', '12001.13', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19092', '郫　县', '12001.12', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19091', '双流县', '12001.11', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19090', '金堂县', '12001.10', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19089', '温江区', '12001.9', 'area', '12002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19088', '新都区', '12001.8', 'area', '12002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19087', '青白江区', '12001.7', 'area', '12002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19086', '龙泉驿区', '12001.6', 'area', '12002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19085', '成华区', '12001.5', 'area', '12002', '2');
INSERT INTO `dx_cascadedata` VALUES ('19084', '武侯区', '12001.4', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19083', '金牛区', '12001.3', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19082', '青羊区', '12001.2', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19081', '锦江区', '12001.1', 'area', '12001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19080', '成都市', '12001', 'area', '12001', '1');
INSERT INTO `dx_cascadedata` VALUES ('19079', '四川省', '12000', 'area', '12000', '0');
INSERT INTO `dx_cascadedata` VALUES ('19078', '南川市', '11540', 'area', '11540', '1');
INSERT INTO `dx_cascadedata` VALUES ('19077', '永川市', '11539', 'area', '11539', '1');
INSERT INTO `dx_cascadedata` VALUES ('19076', '合川市', '11538', 'area', '11538', '1');
INSERT INTO `dx_cascadedata` VALUES ('19075', '江津市', '11537', 'area', '11537', '1');
INSERT INTO `dx_cascadedata` VALUES ('19074', '彭水苗族土家族自治县', '11536', 'area', '11536', '1');
INSERT INTO `dx_cascadedata` VALUES ('19073', '酉阳土家族苗族自治县', '11535', 'area', '11535', '1');
INSERT INTO `dx_cascadedata` VALUES ('19072', '秀山土家族苗族自治县', '11534', 'area', '11534', '1');
INSERT INTO `dx_cascadedata` VALUES ('19071', '石柱土家族自治县', '11533', 'area', '11533', '1');
INSERT INTO `dx_cascadedata` VALUES ('19070', '巫溪县', '11532', 'area', '11532', '1');
INSERT INTO `dx_cascadedata` VALUES ('19069', '巫山县', '11531', 'area', '11531', '1');
INSERT INTO `dx_cascadedata` VALUES ('19068', '奉节县', '11530', 'area', '11530', '1');
INSERT INTO `dx_cascadedata` VALUES ('19067', '云阳县', '11529', 'area', '11529', '1');
INSERT INTO `dx_cascadedata` VALUES ('19066', '开　县', '11528', 'area', '11528', '1');
INSERT INTO `dx_cascadedata` VALUES ('19065', '忠　县', '11527', 'area', '11527', '1');
INSERT INTO `dx_cascadedata` VALUES ('19064', '武隆县', '11526', 'area', '11526', '1');
INSERT INTO `dx_cascadedata` VALUES ('19063', '垫江县', '11525', 'area', '11525', '1');
INSERT INTO `dx_cascadedata` VALUES ('19062', '丰都县', '11524', 'area', '11524', '1');
INSERT INTO `dx_cascadedata` VALUES ('19061', '城口县', '11523', 'area', '11523', '1');
INSERT INTO `dx_cascadedata` VALUES ('19060', '梁平县', '11522', 'area', '11522', '1');
INSERT INTO `dx_cascadedata` VALUES ('19059', '璧山县', '11521', 'area', '11521', '1');
INSERT INTO `dx_cascadedata` VALUES ('19058', '荣昌县', '11520', 'area', '11520', '1');
INSERT INTO `dx_cascadedata` VALUES ('19057', '大足县', '11519', 'area', '11519', '1');
INSERT INTO `dx_cascadedata` VALUES ('19056', '铜梁县', '11518', 'area', '11518', '1');
INSERT INTO `dx_cascadedata` VALUES ('19055', '潼南县', '11517', 'area', '11517', '1');
INSERT INTO `dx_cascadedata` VALUES ('19054', '綦江县', '11516', 'area', '11516', '1');
INSERT INTO `dx_cascadedata` VALUES ('19053', '长寿区', '11515', 'area', '11515', '1');
INSERT INTO `dx_cascadedata` VALUES ('19052', '黔江区', '11514', 'area', '11514', '1');
INSERT INTO `dx_cascadedata` VALUES ('19051', '巴南区', '11513', 'area', '11513', '1');
INSERT INTO `dx_cascadedata` VALUES ('19050', '渝北区', '11512', 'area', '11512', '1');
INSERT INTO `dx_cascadedata` VALUES ('19049', '双桥区', '11511', 'area', '11511', '1');
INSERT INTO `dx_cascadedata` VALUES ('19048', '万盛区', '11510', 'area', '11510', '1');
INSERT INTO `dx_cascadedata` VALUES ('19047', '北碚区', '11509', 'area', '11509', '1');
INSERT INTO `dx_cascadedata` VALUES ('19046', '南岸区', '11508', 'area', '11508', '1');
INSERT INTO `dx_cascadedata` VALUES ('19045', '九龙坡区', '11507', 'area', '11507', '1');
INSERT INTO `dx_cascadedata` VALUES ('19044', '沙坪坝区', '11506', 'area', '11506', '1');
INSERT INTO `dx_cascadedata` VALUES ('19043', '江北区', '11505', 'area', '11505', '1');
INSERT INTO `dx_cascadedata` VALUES ('19042', '大渡口区', '11504', 'area', '11504', '1');
INSERT INTO `dx_cascadedata` VALUES ('19041', '渝中区', '11503', 'area', '11503', '1');
INSERT INTO `dx_cascadedata` VALUES ('19040', '涪陵区', '11502', 'area', '11502', '1');
INSERT INTO `dx_cascadedata` VALUES ('19039', '万州区', '11501', 'area', '11501', '1');
INSERT INTO `dx_cascadedata` VALUES ('19038', '重庆市', '11500', 'area', '11500', '0');
INSERT INTO `dx_cascadedata` VALUES ('19037', '中沙群岛的岛礁及其海域', '11003.19', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19036', '南沙群岛', '11003.18', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19035', '西沙群岛', '11003.17', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19034', '琼中黎族苗族自治县', '11003.16', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19033', '保亭黎族苗族自治县', '11003.15', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19032', '陵水黎族自治县', '11003.14', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19031', '乐东黎族自治县', '11003.13', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19030', '昌江黎族自治县', '11003.12', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19029', '白沙黎族自治县', '11003.11', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19028', '临高县', '11003.10', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19027', '澄迈县', '11003.9', 'area', '11004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19026', '屯昌县', '11003.8', 'area', '11004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19025', '定安县', '11003.7', 'area', '11004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19024', '东方市', '11003.6', 'area', '11004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19023', '万宁市', '11003.5', 'area', '11004', '2');
INSERT INTO `dx_cascadedata` VALUES ('19022', '文昌市', '11003.4', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19021', '儋州市', '11003.3', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19020', '琼海市', '11003.2', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19019', '五指山市', '11003.1', 'area', '11003', '2');
INSERT INTO `dx_cascadedata` VALUES ('19018', '省直辖县级行政单位', '11003', 'area', '11003', '1');
INSERT INTO `dx_cascadedata` VALUES ('19017', '三亚市', '11002', 'area', '11002', '1');
INSERT INTO `dx_cascadedata` VALUES ('19016', '美兰区', '11001.4', 'area', '11001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19015', '琼山区', '11001.3', 'area', '11001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19014', '龙华区', '11001.2', 'area', '11001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19013', '秀英区', '11001.1', 'area', '11001', '2');
INSERT INTO `dx_cascadedata` VALUES ('19012', '海口市', '11001', 'area', '11001', '1');
INSERT INTO `dx_cascadedata` VALUES ('19011', '海南省', '11000', 'area', '11000', '0');
INSERT INTO `dx_cascadedata` VALUES ('19010', '凭祥市', '10514.7', 'area', '10515', '2');
INSERT INTO `dx_cascadedata` VALUES ('19009', '天等县', '10514.6', 'area', '10515', '2');
INSERT INTO `dx_cascadedata` VALUES ('19008', '大新县', '10514.5', 'area', '10515', '2');
INSERT INTO `dx_cascadedata` VALUES ('19007', '龙州县', '10514.4', 'area', '10514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19006', '宁明县', '10514.3', 'area', '10514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19005', '扶绥县', '10514.2', 'area', '10514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19004', '江洲区', '10514.1', 'area', '10514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19003', '崇左市', '10514', 'area', '10514', '1');
INSERT INTO `dx_cascadedata` VALUES ('19002', '合山市', '10513.6', 'area', '10514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19001', '金秀瑶族自治县', '10513.5', 'area', '10514', '2');
INSERT INTO `dx_cascadedata` VALUES ('19000', '武宣县', '10513.4', 'area', '10513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18999', '象州县', '10513.3', 'area', '10513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18998', '忻城县', '10513.2', 'area', '10513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18997', '兴宾区', '10513.1', 'area', '10513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18996', '来宾市', '10513', 'area', '10513', '1');
INSERT INTO `dx_cascadedata` VALUES ('18995', '宜州市', '10512.11', 'area', '10512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18994', '大化瑶族自治县', '10512.10', 'area', '10512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18993', '都安瑶族自治县', '10512.9', 'area', '10513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18992', '巴马瑶族自治县', '10512.8', 'area', '10513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18991', '环江毛南族自治县', '10512.7', 'area', '10513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18990', '罗城仫佬族自治县', '10512.6', 'area', '10513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18989', '东兰县', '10512.5', 'area', '10513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18988', '凤山县', '10512.4', 'area', '10512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18987', '天峨县', '10512.3', 'area', '10512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18986', '南丹县', '10512.2', 'area', '10512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18985', '金城江区', '10512.1', 'area', '10512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18984', '河池市', '10512', 'area', '10512', '1');
INSERT INTO `dx_cascadedata` VALUES ('18983', '富川瑶族自治县', '10511.4', 'area', '10511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18982', '钟山县', '10511.3', 'area', '10511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18981', '昭平县', '10511.2', 'area', '10511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18980', '八步区', '10511.1', 'area', '10511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18979', '贺州市', '10511', 'area', '10511', '1');
INSERT INTO `dx_cascadedata` VALUES ('18978', '隆林各族自治县', '10510.12', 'area', '10510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18977', '西林县', '10510.11', 'area', '10510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18976', '田林县', '10510.10', 'area', '10510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18975', '乐业县', '10510.9', 'area', '10511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18974', '凌云县', '10510.8', 'area', '10511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18973', '那坡县', '10510.7', 'area', '10511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18972', '靖西县', '10510.6', 'area', '10511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18971', '德保县', '10510.5', 'area', '10511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18970', '平果县', '10510.4', 'area', '10510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18969', '田东县', '10510.3', 'area', '10510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18968', '田阳县', '10510.2', 'area', '10510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18967', '右江区', '10510.1', 'area', '10510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18966', '百色市', '10510', 'area', '10510', '1');
INSERT INTO `dx_cascadedata` VALUES ('18965', '北流市', '10509.6', 'area', '10510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18964', '兴业县', '10509.5', 'area', '10510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18963', '博白县', '10509.4', 'area', '10509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18962', '陆川县', '10509.3', 'area', '10509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18961', '容　县', '10509.2', 'area', '10509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18960', '玉州区', '10509.1', 'area', '10509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18959', '玉林市', '10509', 'area', '10509', '1');
INSERT INTO `dx_cascadedata` VALUES ('18958', '桂平市', '10508.5', 'area', '10509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18957', '平南县', '10508.4', 'area', '10508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18956', '覃塘区', '10508.3', 'area', '10508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18955', '港南区', '10508.2', 'area', '10508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18954', '港北区', '10508.1', 'area', '10508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18953', '贵港市', '10508', 'area', '10508', '1');
INSERT INTO `dx_cascadedata` VALUES ('18952', '浦北县', '10507.4', 'area', '10507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18951', '灵山县', '10507.3', 'area', '10507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18950', '钦北区', '10507.2', 'area', '10507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18949', '钦南区', '10507.1', 'area', '10507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18948', '钦州市', '10507', 'area', '10507', '1');
INSERT INTO `dx_cascadedata` VALUES ('18947', '东兴市', '10506.4', 'area', '10506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18946', '上思县', '10506.3', 'area', '10506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18945', '防城区', '10506.2', 'area', '10506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18944', '港口区', '10506.1', 'area', '10506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18943', '防城港市', '10506', 'area', '10506', '1');
INSERT INTO `dx_cascadedata` VALUES ('18942', '合浦县', '10505.4', 'area', '10505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18941', '铁山港区', '10505.3', 'area', '10505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18940', '银海区', '10505.2', 'area', '10505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18939', '海城区', '10505.1', 'area', '10505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18938', '北海市', '10505', 'area', '10505', '1');
INSERT INTO `dx_cascadedata` VALUES ('18937', '岑溪市', '10504.7', 'area', '10505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18936', '蒙山县', '10504.6', 'area', '10505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18935', '藤　县', '10504.5', 'area', '10505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18934', '苍梧县', '10504.4', 'area', '10504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18933', '长洲区', '10504.3', 'area', '10504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18932', '蝶山区', '10504.2', 'area', '10504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18931', '万秀区', '10504.1', 'area', '10504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18930', '梧州市', '10504', 'area', '10504', '1');
INSERT INTO `dx_cascadedata` VALUES ('18929', '恭城瑶族自治县', '10503.17', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18928', '荔蒲县', '10503.16', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18927', '平乐县', '10503.15', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18926', '资源县', '10503.14', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18925', '龙胜各族自治县', '10503.13', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18924', '灌阳县', '10503.12', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18923', '永福县', '10503.11', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18922', '兴安县', '10503.10', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18921', '全州县', '10503.9', 'area', '10504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18920', '灵川县', '10503.8', 'area', '10504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18919', '临桂县', '10503.7', 'area', '10504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18918', '阳朔县', '10503.6', 'area', '10504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18917', '雁山区', '10503.5', 'area', '10504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18916', '七星区', '10503.4', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18915', '象山区', '10503.3', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18914', '叠彩区', '10503.2', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18913', '秀峰区', '10503.1', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18912', '桂林市', '10503', 'area', '10503', '1');
INSERT INTO `dx_cascadedata` VALUES ('18911', '三江侗族自治县', '10502.10', 'area', '10502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18910', '融水苗族自治县', '10502.9', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18909', '融安县', '10502.8', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18908', '鹿寨县', '10502.7', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18907', '柳城县', '10502.6', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18906', '柳江县', '10502.5', 'area', '10503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18905', '柳北区', '10502.4', 'area', '10502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18904', '柳南区', '10502.3', 'area', '10502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18903', '鱼峰区', '10502.2', 'area', '10502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18902', '城中区', '10502.1', 'area', '10502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18901', '柳州市', '10502', 'area', '10502', '1');
INSERT INTO `dx_cascadedata` VALUES ('18900', '横　县', '10501.12', 'area', '10501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18899', '宾阳县', '10501.11', 'area', '10501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18898', '上林县', '10501.10', 'area', '10501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18897', '马山县', '10501.9', 'area', '10502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18896', '隆安县', '10501.8', 'area', '10502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18895', '武鸣县', '10501.7', 'area', '10502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18894', '邕宁区', '10501.6', 'area', '10502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18893', '良庆区', '10501.5', 'area', '10502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18892', '西乡塘区', '10501.4', 'area', '10501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18891', '江南区', '10501.3', 'area', '10501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18890', '青秀区', '10501.2', 'area', '10501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18889', '兴宁区', '10501.1', 'area', '10501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18888', '南宁市', '10501', 'area', '10501', '1');
INSERT INTO `dx_cascadedata` VALUES ('18887', '广西壮族自治区', '10500', 'area', '10500', '0');
INSERT INTO `dx_cascadedata` VALUES ('18886', '罗定市', '10021.5', 'area', '10022', '2');
INSERT INTO `dx_cascadedata` VALUES ('18885', '云安县', '10021.4', 'area', '10021', '2');
INSERT INTO `dx_cascadedata` VALUES ('18884', '郁南县', '10021.3', 'area', '10021', '2');
INSERT INTO `dx_cascadedata` VALUES ('18883', '新兴县', '10021.2', 'area', '10021', '2');
INSERT INTO `dx_cascadedata` VALUES ('18882', '云城区', '10021.1', 'area', '10021', '2');
INSERT INTO `dx_cascadedata` VALUES ('18881', '云浮市', '10021', 'area', '10021', '1');
INSERT INTO `dx_cascadedata` VALUES ('18880', '普宁市', '10020.5', 'area', '10021', '2');
INSERT INTO `dx_cascadedata` VALUES ('18879', '惠来县', '10020.4', 'area', '10020', '2');
INSERT INTO `dx_cascadedata` VALUES ('18878', '揭西县', '10020.3', 'area', '10020', '2');
INSERT INTO `dx_cascadedata` VALUES ('18877', '揭东县', '10020.2', 'area', '10020', '2');
INSERT INTO `dx_cascadedata` VALUES ('18876', '榕城区', '10020.1', 'area', '10020', '2');
INSERT INTO `dx_cascadedata` VALUES ('18875', '揭阳市', '10020', 'area', '10020', '1');
INSERT INTO `dx_cascadedata` VALUES ('18874', '饶平县', '10019.2', 'area', '10019', '2');
INSERT INTO `dx_cascadedata` VALUES ('18873', '潮安县', '10019.1', 'area', '10019', '2');
INSERT INTO `dx_cascadedata` VALUES ('18872', '潮州市', '10019', 'area', '10019', '1');
INSERT INTO `dx_cascadedata` VALUES ('18871', '中山市', '10018', 'area', '10018', '1');
INSERT INTO `dx_cascadedata` VALUES ('18870', '东莞市', '10017', 'area', '10017', '1');
INSERT INTO `dx_cascadedata` VALUES ('18869', '连州市', '10016.8', 'area', '10017', '2');
INSERT INTO `dx_cascadedata` VALUES ('18868', '英德市', '10016.7', 'area', '10017', '2');
INSERT INTO `dx_cascadedata` VALUES ('18867', '清新县', '10016.6', 'area', '10017', '2');
INSERT INTO `dx_cascadedata` VALUES ('18866', '连南瑶族自治县', '10016.5', 'area', '10017', '2');
INSERT INTO `dx_cascadedata` VALUES ('18865', '连山壮族瑶族自治县', '10016.4', 'area', '10016', '2');
INSERT INTO `dx_cascadedata` VALUES ('18864', '阳山县', '10016.3', 'area', '10016', '2');
INSERT INTO `dx_cascadedata` VALUES ('18863', '佛冈县', '10016.2', 'area', '10016', '2');
INSERT INTO `dx_cascadedata` VALUES ('18862', '清城区', '10016.1', 'area', '10016', '2');
INSERT INTO `dx_cascadedata` VALUES ('18861', '清远市', '10016', 'area', '10016', '1');
INSERT INTO `dx_cascadedata` VALUES ('18860', '阳春市', '10015.4', 'area', '10015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18859', '阳东县', '10015.3', 'area', '10015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18858', '阳西县', '10015.2', 'area', '10015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18857', '江城区', '10015.1', 'area', '10015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18856', '阳江市', '10015', 'area', '10015', '1');
INSERT INTO `dx_cascadedata` VALUES ('18855', '东源县', '10014.6', 'area', '10015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18854', '和平县', '10014.5', 'area', '10015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18853', '连平县', '10014.4', 'area', '10014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18852', '龙川县', '10014.3', 'area', '10014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18851', '紫金县', '10014.2', 'area', '10014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18850', '源城区', '10014.1', 'area', '10014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18849', '河源市', '10014', 'area', '10014', '1');
INSERT INTO `dx_cascadedata` VALUES ('18848', '陆丰市', '10013.4', 'area', '10013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18847', '陆河县', '10013.3', 'area', '10013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18846', '海丰县', '10013.2', 'area', '10013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18845', '城　区', '10013.1', 'area', '10013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18844', '汕尾市', '10013', 'area', '10013', '1');
INSERT INTO `dx_cascadedata` VALUES ('18843', '兴宁市', '10012.8', 'area', '10013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18842', '蕉岭县', '10012.7', 'area', '10013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18841', '平远县', '10012.6', 'area', '10013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18840', '五华县', '10012.5', 'area', '10013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18839', '丰顺县', '10012.4', 'area', '10012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18838', '大埔县', '10012.3', 'area', '10012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18837', '梅　县', '10012.2', 'area', '10012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18836', '梅江区', '10012.1', 'area', '10012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18835', '梅州市', '10012', 'area', '10012', '1');
INSERT INTO `dx_cascadedata` VALUES ('18834', '龙门县', '10011.5', 'area', '10012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18833', '惠东县', '10011.4', 'area', '10011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18832', '博罗县', '10011.3', 'area', '10011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18831', '惠阳区', '10011.2', 'area', '10011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18830', '惠城区', '10011.1', 'area', '10011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18829', '惠州市', '10011', 'area', '10011', '1');
INSERT INTO `dx_cascadedata` VALUES ('18828', '四会市', '10010.8', 'area', '10011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18827', '高要市', '10010.7', 'area', '10011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18826', '德庆县', '10010.6', 'area', '10011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18825', '封开县', '10010.5', 'area', '10011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18824', '怀集县', '10010.4', 'area', '10010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18823', '广宁县', '10010.3', 'area', '10010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18822', '鼎湖区', '10010.2', 'area', '10010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18821', '端州区', '10010.1', 'area', '10010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18820', '肇庆市', '10010', 'area', '10010', '1');
INSERT INTO `dx_cascadedata` VALUES ('18819', '信宜市', '10009.6', 'area', '10010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18818', '化州市', '10009.5', 'area', '10010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18817', '高州市', '10009.4', 'area', '10009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18816', '电白县', '10009.3', 'area', '10009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18815', '茂港区', '10009.2', 'area', '10009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18814', '茂南区', '10009.1', 'area', '10009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18813', '茂名市', '10009', 'area', '10009', '1');
INSERT INTO `dx_cascadedata` VALUES ('18812', '吴川市', '10008.9', 'area', '10009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18811', '雷州市', '10008.8', 'area', '10009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18810', '廉江市', '10008.7', 'area', '10009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18809', '徐闻县', '10008.6', 'area', '10009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18808', '遂溪县', '10008.5', 'area', '10009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18807', '麻章区', '10008.4', 'area', '10008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18806', '坡头区', '10008.3', 'area', '10008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18805', '霞山区', '10008.2', 'area', '10008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18804', '赤坎区', '10008.1', 'area', '10008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18803', '湛江市', '10008', 'area', '10008', '1');
INSERT INTO `dx_cascadedata` VALUES ('18802', '恩平市', '10007.7', 'area', '10008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18801', '鹤山市', '10007.6', 'area', '10008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18800', '开平市', '10007.5', 'area', '10008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18799', '台山市', '10007.4', 'area', '10007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18798', '新会区', '10007.3', 'area', '10007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18797', '江海区', '10007.2', 'area', '10007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18796', '蓬江区', '10007.1', 'area', '10007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18795', '江门市', '10007', 'area', '10007', '1');
INSERT INTO `dx_cascadedata` VALUES ('18794', '高明区', '10006.5', 'area', '10007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18793', '三水区', '10006.4', 'area', '10006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18792', '顺德区', '10006.3', 'area', '10006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18791', '南海区', '10006.2', 'area', '10006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18790', '禅城区', '10006.1', 'area', '10006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18789', '佛山市', '10006', 'area', '10006', '1');
INSERT INTO `dx_cascadedata` VALUES ('18788', '南澳县', '10005.7', 'area', '10006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18787', '澄海区', '10005.6', 'area', '10006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18786', '潮南区', '10005.5', 'area', '10006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18785', '潮阳区', '10005.4', 'area', '10005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18784', '濠江区', '10005.3', 'area', '10005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18783', '金平区', '10005.2', 'area', '10005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18782', '龙湖区', '10005.1', 'area', '10005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18781', '汕头市', '10005', 'area', '10005', '1');
INSERT INTO `dx_cascadedata` VALUES ('18780', '金湾区', '10004.3', 'area', '10004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18779', '斗门区', '10004.2', 'area', '10004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18778', '洲区', '10004.1', 'area', '10004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18777', '珠海市', '10004', 'area', '10004', '1');
INSERT INTO `dx_cascadedata` VALUES ('18776', '盐田区', '10003.6', 'area', '10004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18775', '龙岗区', '10003.5', 'area', '10004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18774', '宝安区', '10003.4', 'area', '10003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18773', '南山区', '10003.3', 'area', '10003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18772', '福田区', '10003.2', 'area', '10003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18771', '罗湖区', '10003.1', 'area', '10003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18770', '深圳市', '10003', 'area', '10003', '1');
INSERT INTO `dx_cascadedata` VALUES ('18769', '南雄市', '10002.10', 'area', '10002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18768', '乐昌市', '10002.9', 'area', '10003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18767', '新丰县', '10002.8', 'area', '10003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18766', '乳源瑶族自治县', '10002.7', 'area', '10003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18765', '翁源县', '10002.6', 'area', '10003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18764', '仁化县', '10002.5', 'area', '10003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18763', '始兴县', '10002.4', 'area', '10002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18762', '曲江区', '10002.3', 'area', '10002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18761', '浈江区', '10002.2', 'area', '10002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18760', '武江区', '10002.1', 'area', '10002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18759', '韶关市', '10002', 'area', '10002', '1');
INSERT INTO `dx_cascadedata` VALUES ('18758', '从化市', '10001.12', 'area', '10001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18757', '增城市', '10001.11', 'area', '10001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18756', '花都区', '10001.10', 'area', '10001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18755', '番禺区', '10001.9', 'area', '10002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18754', '黄埔区', '10001.8', 'area', '10002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18753', '白云区', '10001.7', 'area', '10002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18752', '芳村区', '10001.6', 'area', '10002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18751', '天河区', '10001.5', 'area', '10002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18750', '海珠区', '10001.4', 'area', '10001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18749', '越秀区', '10001.3', 'area', '10001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18748', '荔湾区', '10001.2', 'area', '10001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18747', '东山区', '10001.1', 'area', '10001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18746', '广州市', '10001', 'area', '10001', '1');
INSERT INTO `dx_cascadedata` VALUES ('18745', '广东省', '10000', 'area', '10000', '0');
INSERT INTO `dx_cascadedata` VALUES ('18744', '龙山县', '9514.8', 'area', '9515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18743', '永顺县', '9514.7', 'area', '9515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18742', '古丈县', '9514.6', 'area', '9515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18741', '保靖县', '9514.5', 'area', '9515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18740', '花垣县', '9514.4', 'area', '9514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18739', '凤凰县', '9514.3', 'area', '9514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18738', '泸溪县', '9514.2', 'area', '9514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18737', '吉首市', '9514.1', 'area', '9514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18736', '湘西土家族苗族自治州', '9514', 'area', '9514', '1');
INSERT INTO `dx_cascadedata` VALUES ('18735', '涟源市', '9513.5', 'area', '9514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18734', '冷水江市', '9513.4', 'area', '9513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18733', '新化县', '9513.3', 'area', '9513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18732', '双峰县', '9513.2', 'area', '9513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18731', '娄星区', '9513.1', 'area', '9513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18730', '娄底市', '9513', 'area', '9513', '1');
INSERT INTO `dx_cascadedata` VALUES ('18729', '洪江市', '9512.12', 'area', '9512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18728', '通道侗族自治县', '9512.11', 'area', '9512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18727', '靖州苗族侗族自治县', '9512.10', 'area', '9512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18726', '芷江侗族自治县', '9512.9', 'area', '9513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18725', '新晃侗族自治县', '9512.8', 'area', '9513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18724', '麻阳苗族自治县', '9512.7', 'area', '9513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18723', '会同县', '9512.6', 'area', '9513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18722', '溆浦县', '9512.5', 'area', '9513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18721', '辰溪县', '9512.4', 'area', '9512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18720', '沅陵县', '9512.3', 'area', '9512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18719', '中方县', '9512.2', 'area', '9512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18718', '鹤城区', '9512.1', 'area', '9512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18717', '怀化市', '9512', 'area', '9512', '1');
INSERT INTO `dx_cascadedata` VALUES ('18716', '江华瑶族自治县', '9511.11', 'area', '9511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18715', '新田县', '9511.10', 'area', '9511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18714', '蓝山县', '9511.9', 'area', '9512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18713', '宁远县', '9511.8', 'area', '9512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18712', '江永县', '9511.7', 'area', '9512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18711', '道　县', '9511.6', 'area', '9512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18710', '双牌县', '9511.5', 'area', '9512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18709', '东安县', '9511.4', 'area', '9511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18708', '祁阳县', '9511.3', 'area', '9511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18707', '冷水滩区', '9511.2', 'area', '9511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18706', '芝山区', '9511.1', 'area', '9511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18705', '永州市', '9511', 'area', '9511', '1');
INSERT INTO `dx_cascadedata` VALUES ('18704', '资兴市', '9510.11', 'area', '9510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18703', '安仁县', '9510.10', 'area', '9510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18702', '桂东县', '9510.9', 'area', '9511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18701', '汝城县', '9510.8', 'area', '9511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18700', '临武县', '9510.7', 'area', '9511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18699', '嘉禾县', '9510.6', 'area', '9511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18698', '永兴县', '9510.5', 'area', '9511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18697', '宜章县', '9510.4', 'area', '9510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18696', '桂阳县', '9510.3', 'area', '9510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18695', '苏仙区', '9510.2', 'area', '9510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18694', '北湖区', '9510.1', 'area', '9510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18693', '郴州市', '9510', 'area', '9510', '1');
INSERT INTO `dx_cascadedata` VALUES ('18692', '沅江市', '9509.6', 'area', '9510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18691', '安化县', '9509.5', 'area', '9510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18690', '桃江县', '9509.4', 'area', '9509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18689', '南　县', '9509.3', 'area', '9509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18688', '赫山区', '9509.2', 'area', '9509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18687', '资阳区', '9509.1', 'area', '9509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18686', '益阳市', '9509', 'area', '9509', '1');
INSERT INTO `dx_cascadedata` VALUES ('18685', '桑植县', '9508.4', 'area', '9508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18684', '慈利县', '9508.3', 'area', '9508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18683', '武陵源区', '9508.2', 'area', '9508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18682', '永定区', '9508.1', 'area', '9508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18681', '张家界市', '9508', 'area', '9508', '1');
INSERT INTO `dx_cascadedata` VALUES ('18680', '津市市', '9507.9', 'area', '9508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18679', '石门县', '9507.8', 'area', '9508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18678', '桃源县', '9507.7', 'area', '9508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18677', '临澧县', '9507.6', 'area', '9508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18676', '澧　县', '9507.5', 'area', '9508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18675', '汉寿县', '9507.4', 'area', '9507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18674', '安乡县', '9507.3', 'area', '9507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18673', '鼎城区', '9507.2', 'area', '9507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18672', '武陵区', '9507.1', 'area', '9507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18671', '常德市', '9507', 'area', '9507', '1');
INSERT INTO `dx_cascadedata` VALUES ('18670', '临湘市', '9506.9', 'area', '9507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18669', '汨罗市', '9506.8', 'area', '9507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18668', '平江县', '9506.7', 'area', '9507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18667', '湘阴县', '9506.6', 'area', '9507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18666', '华容县', '9506.5', 'area', '9507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18665', '岳阳县', '9506.4', 'area', '9506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18664', '君山区', '9506.3', 'area', '9506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18663', '云溪区', '9506.2', 'area', '9506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18662', '岳阳楼区', '9506.1', 'area', '9506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18661', '岳阳市', '9506', 'area', '9506', '1');
INSERT INTO `dx_cascadedata` VALUES ('18660', '武冈市', '9505.12', 'area', '9505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18659', '城步苗族自治县', '9505.11', 'area', '9505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18658', '新宁县', '9505.10', 'area', '9505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18657', '绥宁县', '9505.9', 'area', '9506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18656', '洞口县', '9505.8', 'area', '9506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18655', '隆回县', '9505.7', 'area', '9506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18654', '邵阳县', '9505.6', 'area', '9506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18653', '新邵县', '9505.5', 'area', '9506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18652', '邵东县', '9505.4', 'area', '9505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18651', '北塔区', '9505.3', 'area', '9505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18650', '大祥区', '9505.2', 'area', '9505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18649', '双清区', '9505.1', 'area', '9505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18648', '邵阳市', '9505', 'area', '9505', '1');
INSERT INTO `dx_cascadedata` VALUES ('18647', '常宁市', '9504.12', 'area', '9504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18646', '耒阳市', '9504.11', 'area', '9504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18645', '祁东县', '9504.10', 'area', '9504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18644', '衡东县', '9504.9', 'area', '9505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18643', '衡山县', '9504.8', 'area', '9505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18642', '衡南县', '9504.7', 'area', '9505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18641', '衡阳县', '9504.6', 'area', '9505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18640', '南岳区', '9504.5', 'area', '9505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18639', '蒸湘区', '9504.4', 'area', '9504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18638', '石鼓区', '9504.3', 'area', '9504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18637', '雁峰区', '9504.2', 'area', '9504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18636', '珠晖区', '9504.1', 'area', '9504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18635', '衡阳市', '9504', 'area', '9504', '1');
INSERT INTO `dx_cascadedata` VALUES ('18634', '韶山市', '9503.5', 'area', '9504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18633', '湘乡市', '9503.4', 'area', '9503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18632', '湘潭县', '9503.3', 'area', '9503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18631', '岳塘区', '9503.2', 'area', '9503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18630', '雨湖区', '9503.1', 'area', '9503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18629', '湘潭市', '9503', 'area', '9503', '1');
INSERT INTO `dx_cascadedata` VALUES ('18628', '醴陵市', '9502.9', 'area', '9503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18627', '炎陵县', '9502.8', 'area', '9503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18626', '茶陵县', '9502.7', 'area', '9503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18625', '攸　县', '9502.6', 'area', '9503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18624', '株洲县', '9502.5', 'area', '9503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18623', '天元区', '9502.4', 'area', '9502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18622', '石峰区', '9502.3', 'area', '9502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18621', '芦淞区', '9502.2', 'area', '9502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18620', '荷塘区', '9502.1', 'area', '9502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18619', '株洲市', '9502', 'area', '9502', '1');
INSERT INTO `dx_cascadedata` VALUES ('18618', '浏阳市', '9501.9', 'area', '9502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18617', '宁乡县', '9501.8', 'area', '9502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18616', '望城县', '9501.7', 'area', '9502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18615', '长沙县', '9501.6', 'area', '9502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18614', '雨花区', '9501.5', 'area', '9502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18613', '开福区', '9501.4', 'area', '9501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18612', '岳麓区', '9501.3', 'area', '9501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18611', '天心区', '9501.2', 'area', '9501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18610', '芙蓉区', '9501.1', 'area', '9501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18609', '长沙市', '9501', 'area', '9501', '1');
INSERT INTO `dx_cascadedata` VALUES ('18608', '湖南省', '9500', 'area', '9500', '0');
INSERT INTO `dx_cascadedata` VALUES ('18607', '神农架林区', '9014.4', 'area', '9014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18606', '天门市', '9014.3', 'area', '9014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18605', '潜江市', '9014.2', 'area', '9014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18604', '仙桃市', '9014.1', 'area', '9014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18603', '省直辖行政单位', '9014', 'area', '9014', '1');
INSERT INTO `dx_cascadedata` VALUES ('18602', '鹤峰县', '9013.8', 'area', '9014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18601', '来凤县', '9013.7', 'area', '9014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18600', '咸丰县', '9013.6', 'area', '9014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18599', '宣恩县', '9013.5', 'area', '9014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18598', '巴东县', '9013.4', 'area', '9013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18597', '建始县', '9013.3', 'area', '9013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18596', '利川市', '9013.2', 'area', '9013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18595', '恩施市', '9013.1', 'area', '9013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18594', '恩施土家族苗族自治州', '9013', 'area', '9013', '1');
INSERT INTO `dx_cascadedata` VALUES ('18593', '广水市', '9012.2', 'area', '9012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18592', '曾都区', '9012.1', 'area', '9012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18591', '随州市', '9012', 'area', '9012', '1');
INSERT INTO `dx_cascadedata` VALUES ('18590', '赤壁市', '9011.6', 'area', '9012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18589', '通山县', '9011.5', 'area', '9012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18588', '崇阳县', '9011.4', 'area', '9011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18587', '通城县', '9011.3', 'area', '9011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18586', '嘉鱼县', '9011.2', 'area', '9011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18585', '咸安区', '9011.1', 'area', '9011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18584', '咸宁市', '9011', 'area', '9011', '1');
INSERT INTO `dx_cascadedata` VALUES ('18583', '武穴市', '9010.10', 'area', '9010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18582', '麻城市', '9010.9', 'area', '9011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18581', '黄梅县', '9010.8', 'area', '9011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18580', '蕲春县', '9010.7', 'area', '9011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18579', '浠水县', '9010.6', 'area', '9011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18578', '英山县', '9010.5', 'area', '9011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18577', '罗田县', '9010.4', 'area', '9010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18576', '红安县', '9010.3', 'area', '9010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18575', '团风县', '9010.2', 'area', '9010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18574', '州区', '9010.1', 'area', '9010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18573', '黄冈市', '9010', 'area', '9010', '1');
INSERT INTO `dx_cascadedata` VALUES ('18572', '松滋市', '9009.8', 'area', '9010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18571', '洪湖市', '9009.7', 'area', '9010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18570', '石首市', '9009.6', 'area', '9010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18569', '江陵县', '9009.5', 'area', '9010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18568', '监利县', '9009.4', 'area', '9009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18567', '公安县', '9009.3', 'area', '9009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18566', '荆州区', '9009.2', 'area', '9009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18565', '沙市区', '9009.1', 'area', '9009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18564', '荆州市', '9009', 'area', '9009', '1');
INSERT INTO `dx_cascadedata` VALUES ('18563', '汉川市', '9008.7', 'area', '9009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18562', '孝南区', '9008.6', 'area', '9009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18561', '孝昌县', '9008.5', 'area', '9009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18560', '大悟县', '9008.4', 'area', '9008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18559', '云梦县', '9008.3', 'area', '9008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18558', '应城市', '9008.2', 'area', '9008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18557', '安陆市', '9008.1', 'area', '9008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18556', '孝感市', '9008', 'area', '9008', '1');
INSERT INTO `dx_cascadedata` VALUES ('18555', '东宝区', '9007.5', 'area', '9008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18554', '掇刀区', '9007.4', 'area', '9007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18553', '京山县', '9007.3', 'area', '9007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18552', '沙洋县', '9007.2', 'area', '9007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18551', '钟祥市', '9007.1', 'area', '9007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18550', '荆门市', '9007', 'area', '9007', '1');
INSERT INTO `dx_cascadedata` VALUES ('18549', '鄂城区', '9006.3', 'area', '9006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18548', '华容区', '9006.2', 'area', '9006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18547', '梁子湖区', '9006.1', 'area', '9006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18546', '鄂州市', '9006', 'area', '9006', '1');
INSERT INTO `dx_cascadedata` VALUES ('18545', '宜城市', '9005.9', 'area', '9006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18544', '枣阳市', '9005.8', 'area', '9006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18543', '老河口市', '9005.7', 'area', '9006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18542', '保康县', '9005.6', 'area', '9006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18541', '谷城县', '9005.5', 'area', '9006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18540', '南漳县', '9005.4', 'area', '9005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18539', '襄阳区', '9005.3', 'area', '9005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18538', '樊城区', '9005.2', 'area', '9005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18537', '襄城区', '9005.1', 'area', '9005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18536', '襄樊市', '9005', 'area', '9005', '1');
INSERT INTO `dx_cascadedata` VALUES ('18535', '枝江市', '9004.13', 'area', '9004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18534', '当阳市', '9004.12', 'area', '9004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18533', '宜都市', '9004.11', 'area', '9004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18532', '五峰土家族自治县', '9004.10', 'area', '9004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18531', '长阳土家族自治县', '9004.9', 'area', '9005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18530', '秭归县', '9004.8', 'area', '9005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18529', '兴山县', '9004.7', 'area', '9005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18528', '远安县', '9004.6', 'area', '9005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18527', '夷陵区', '9004.5', 'area', '9005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18526', '猇亭区', '9004.4', 'area', '9004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18525', '点军区', '9004.3', 'area', '9004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18524', '伍家岗区', '9004.2', 'area', '9004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18523', '西陵区', '9004.1', 'area', '9004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18522', '宜昌市', '9004', 'area', '9004', '1');
INSERT INTO `dx_cascadedata` VALUES ('18521', '丹江口市', '9003.8', 'area', '9004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18520', '房　县', '9003.7', 'area', '9004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18519', '竹溪县', '9003.6', 'area', '9004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18518', '竹山县', '9003.5', 'area', '9004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18517', '郧西县', '9003.4', 'area', '9003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18516', '郧　县', '9003.3', 'area', '9003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18515', '张湾区', '9003.2', 'area', '9003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18514', '茅箭区', '9003.1', 'area', '9003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18513', '十堰市', '9003', 'area', '9003', '1');
INSERT INTO `dx_cascadedata` VALUES ('18512', '大冶市', '9002.6', 'area', '9003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18511', '阳新县', '9002.5', 'area', '9003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18510', '铁山区', '9002.4', 'area', '9002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18509', '下陆区', '9002.3', 'area', '9002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18508', '西塞山区', '9002.2', 'area', '9002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18507', '黄石港区', '9002.1', 'area', '9002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18506', '黄石市', '9002', 'area', '9002', '1');
INSERT INTO `dx_cascadedata` VALUES ('18505', '新洲区', '9001.13', 'area', '9001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18504', '黄陂区', '9001.12', 'area', '9001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18503', '江夏区', '9001.11', 'area', '9001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18502', '蔡甸区', '9001.10', 'area', '9001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18501', '汉南区', '9001.9', 'area', '9002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18500', '东西湖区', '9001.8', 'area', '9002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18499', '洪山区', '9001.7', 'area', '9002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18498', '青山区', '9001.6', 'area', '9002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18497', '武昌区', '9001.5', 'area', '9002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18496', '汉阳区', '9001.4', 'area', '9001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18495', '乔口区', '9001.3', 'area', '9001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18494', '江汉区', '9001.2', 'area', '9001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18493', '江岸区', '9001.1', 'area', '9001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18492', '武汉市', '9001', 'area', '9001', '1');
INSERT INTO `dx_cascadedata` VALUES ('18491', '湖北省', '9000', 'area', '9000', '0');
INSERT INTO `dx_cascadedata` VALUES ('18490', '新蔡县', '8517.10', 'area', '8517', '2');
INSERT INTO `dx_cascadedata` VALUES ('18489', '遂平县', '8517.9', 'area', '8518', '2');
INSERT INTO `dx_cascadedata` VALUES ('18488', '汝南县', '8517.8', 'area', '8518', '2');
INSERT INTO `dx_cascadedata` VALUES ('18487', '泌阳县', '8517.7', 'area', '8518', '2');
INSERT INTO `dx_cascadedata` VALUES ('18486', '确山县', '8517.6', 'area', '8518', '2');
INSERT INTO `dx_cascadedata` VALUES ('18485', '正阳县', '8517.5', 'area', '8518', '2');
INSERT INTO `dx_cascadedata` VALUES ('18484', '平舆县', '8517.4', 'area', '8517', '2');
INSERT INTO `dx_cascadedata` VALUES ('18483', '上蔡县', '8517.3', 'area', '8517', '2');
INSERT INTO `dx_cascadedata` VALUES ('18482', '西平县', '8517.2', 'area', '8517', '2');
INSERT INTO `dx_cascadedata` VALUES ('18481', '驿城区', '8517.1', 'area', '8517', '2');
INSERT INTO `dx_cascadedata` VALUES ('18480', '驻马店市', '8517', 'area', '8517', '1');
INSERT INTO `dx_cascadedata` VALUES ('18479', '项城市', '8516.10', 'area', '8516', '2');
INSERT INTO `dx_cascadedata` VALUES ('18478', '鹿邑县', '8516.9', 'area', '8517', '2');
INSERT INTO `dx_cascadedata` VALUES ('18477', '太康县', '8516.8', 'area', '8517', '2');
INSERT INTO `dx_cascadedata` VALUES ('18476', '淮阳县', '8516.7', 'area', '8517', '2');
INSERT INTO `dx_cascadedata` VALUES ('18475', '郸城县', '8516.6', 'area', '8517', '2');
INSERT INTO `dx_cascadedata` VALUES ('18474', '沈丘县', '8516.5', 'area', '8517', '2');
INSERT INTO `dx_cascadedata` VALUES ('18473', '商水县', '8516.4', 'area', '8516', '2');
INSERT INTO `dx_cascadedata` VALUES ('18472', '西华县', '8516.3', 'area', '8516', '2');
INSERT INTO `dx_cascadedata` VALUES ('18471', '扶沟县', '8516.2', 'area', '8516', '2');
INSERT INTO `dx_cascadedata` VALUES ('18470', '川汇区', '8516.1', 'area', '8516', '2');
INSERT INTO `dx_cascadedata` VALUES ('18469', '周口市', '8516', 'area', '8516', '1');
INSERT INTO `dx_cascadedata` VALUES ('18468', '息　县', '8515.10', 'area', '8515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18467', '淮滨县', '8515.9', 'area', '8516', '2');
INSERT INTO `dx_cascadedata` VALUES ('18466', '潢川县', '8515.8', 'area', '8516', '2');
INSERT INTO `dx_cascadedata` VALUES ('18465', '固始县', '8515.7', 'area', '8516', '2');
INSERT INTO `dx_cascadedata` VALUES ('18464', '商城县', '8515.6', 'area', '8516', '2');
INSERT INTO `dx_cascadedata` VALUES ('18463', '新　县', '8515.5', 'area', '8516', '2');
INSERT INTO `dx_cascadedata` VALUES ('18462', '光山县', '8515.4', 'area', '8515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18461', '罗山县', '8515.3', 'area', '8515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18460', '平桥区', '8515.2', 'area', '8515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18459', '师河区', '8515.1', 'area', '8515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18458', '信阳市', '8515', 'area', '8515', '1');
INSERT INTO `dx_cascadedata` VALUES ('18457', '永城市', '8514.9', 'area', '8515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18456', '夏邑县', '8514.8', 'area', '8515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18455', '虞城县', '8514.7', 'area', '8515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18454', '柘城县', '8514.6', 'area', '8515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18453', '宁陵县', '8514.5', 'area', '8515', '2');
INSERT INTO `dx_cascadedata` VALUES ('18452', '睢　县', '8514.4', 'area', '8514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18451', '民权县', '8514.3', 'area', '8514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18450', '睢阳区', '8514.2', 'area', '8514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18449', '梁园区', '8514.1', 'area', '8514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18448', '商丘市', '8514', 'area', '8514', '1');
INSERT INTO `dx_cascadedata` VALUES ('18447', '邓州市', '8513.13', 'area', '8513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18446', '桐柏县', '8513.12', 'area', '8513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18445', '新野县', '8513.11', 'area', '8513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18444', '唐河县', '8513.10', 'area', '8513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18443', '社旗县', '8513.9', 'area', '8514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18442', '淅川县', '8513.8', 'area', '8514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18441', '内乡县', '8513.7', 'area', '8514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18440', '镇平县', '8513.6', 'area', '8514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18439', '西峡县', '8513.5', 'area', '8514', '2');
INSERT INTO `dx_cascadedata` VALUES ('18438', '方城县', '8513.4', 'area', '8513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18437', '南召县', '8513.3', 'area', '8513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18436', '卧龙区', '8513.2', 'area', '8513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18435', '宛城区', '8513.1', 'area', '8513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18434', '南阳市', '8513', 'area', '8513', '1');
INSERT INTO `dx_cascadedata` VALUES ('18433', '灵宝市', '8512.6', 'area', '8513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18432', '义马市', '8512.5', 'area', '8513', '2');
INSERT INTO `dx_cascadedata` VALUES ('18431', '卢氏县', '8512.4', 'area', '8512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18430', '陕　县', '8512.3', 'area', '8512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18429', '渑池县', '8512.2', 'area', '8512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18428', '湖滨区', '8512.1', 'area', '8512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18427', '三门峡市', '8512', 'area', '8512', '1');
INSERT INTO `dx_cascadedata` VALUES ('18426', '临颍县', '8511.5', 'area', '8512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18425', '舞阳县', '8511.4', 'area', '8511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18424', '召陵区', '8511.3', 'area', '8511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18423', '郾城区', '8511.2', 'area', '8511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18422', '源汇区', '8511.1', 'area', '8511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18421', '漯河市', '8511', 'area', '8511', '1');
INSERT INTO `dx_cascadedata` VALUES ('18420', '长葛市', '8510.6', 'area', '8511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18419', '禹州市', '8510.5', 'area', '8511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18418', '襄城县', '8510.4', 'area', '8510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18417', '鄢陵县', '8510.3', 'area', '8510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18416', '许昌县', '8510.2', 'area', '8510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18415', '魏都区', '8510.1', 'area', '8510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18414', '许昌市', '8510', 'area', '8510', '1');
INSERT INTO `dx_cascadedata` VALUES ('18413', '濮阳县', '8509.6', 'area', '8510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18412', '台前县', '8509.5', 'area', '8510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18411', '范　县', '8509.4', 'area', '8509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18410', '南乐县', '8509.3', 'area', '8509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18409', '清丰县', '8509.2', 'area', '8509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18408', '华龙区', '8509.1', 'area', '8509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18407', '濮阳市', '8509', 'area', '8509', '1');
INSERT INTO `dx_cascadedata` VALUES ('18406', '孟州市', '8508.11', 'area', '8508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18405', '沁阳市', '8508.10', 'area', '8508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18404', '济源市', '8508.9', 'area', '8509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18403', '温　县', '8508.8', 'area', '8509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18402', '武陟县', '8508.7', 'area', '8509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18401', '博爱县', '8508.6', 'area', '8509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18400', '修武县', '8508.5', 'area', '8509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18399', '山阳区', '8508.4', 'area', '8508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18398', '马村区', '8508.3', 'area', '8508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18397', '中站区', '8508.2', 'area', '8508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18396', '解放区', '8508.1', 'area', '8508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18395', '焦作市', '8508', 'area', '8508', '1');
INSERT INTO `dx_cascadedata` VALUES ('18394', '辉县市', '8507.12', 'area', '8507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18393', '卫辉市', '8507.11', 'area', '8507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18392', '长垣县', '8507.10', 'area', '8507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18391', '封丘县', '8507.9', 'area', '8508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18390', '延津县', '8507.8', 'area', '8508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18389', '原阳县', '8507.7', 'area', '8508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18388', '获嘉县', '8507.6', 'area', '8508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18387', '新乡县', '8507.5', 'area', '8508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18386', '牧野区', '8507.4', 'area', '8507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18385', '凤泉区', '8507.3', 'area', '8507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18384', '卫滨区', '8507.2', 'area', '8507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18383', '红旗区', '8507.1', 'area', '8507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18382', '新乡市', '8507', 'area', '8507', '1');
INSERT INTO `dx_cascadedata` VALUES ('18381', '淇　县', '8506.5', 'area', '8507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18380', '浚　县', '8506.4', 'area', '8506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18379', '淇滨区', '8506.3', 'area', '8506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18378', '山城区', '8506.2', 'area', '8506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18377', '鹤山区', '8506.1', 'area', '8506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18376', '鹤壁市', '8506', 'area', '8506', '1');
INSERT INTO `dx_cascadedata` VALUES ('18375', '林州市', '8505.9', 'area', '8506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18374', '内黄县', '8505.8', 'area', '8506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18373', '滑　县', '8505.7', 'area', '8506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18372', '汤阴县', '8505.6', 'area', '8506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18371', '安阳县', '8505.5', 'area', '8506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18370', '龙安区', '8505.4', 'area', '8505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18369', '殷都区', '8505.3', 'area', '8505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18368', '北关区', '8505.2', 'area', '8505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18367', '文峰区', '8505.1', 'area', '8505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18366', '安阳市', '8505', 'area', '8505', '1');
INSERT INTO `dx_cascadedata` VALUES ('18365', '汝州市', '8504.10', 'area', '8504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18364', '舞钢市', '8504.9', 'area', '8505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18363', '郏　县', '8504.8', 'area', '8505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18362', '鲁山县', '8504.7', 'area', '8505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18361', '叶　县', '8504.6', 'area', '8505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18360', '宝丰县', '8504.5', 'area', '8505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18359', '湛河区', '8504.4', 'area', '8504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18358', '石龙区', '8504.3', 'area', '8504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18357', '卫东区', '8504.2', 'area', '8504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18356', '新华区', '8504.1', 'area', '8504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18355', '平顶山市', '8504', 'area', '8504', '1');
INSERT INTO `dx_cascadedata` VALUES ('18354', '偃师市', '8503.15', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18353', '伊川县', '8503.14', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18352', '洛宁县', '8503.13', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18351', '宜阳县', '8503.12', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18350', '汝阳县', '8503.11', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18349', '嵩　县', '8503.10', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18348', '栾川县', '8503.9', 'area', '8504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18347', '新安县', '8503.8', 'area', '8504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18346', '孟津县', '8503.7', 'area', '8504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18345', '洛龙区', '8503.6', 'area', '8504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18344', '吉利区', '8503.5', 'area', '8504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18343', '涧西区', '8503.4', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18342', '廛河回族区', '8503.3', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18341', '西工区', '8503.2', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18340', '老城区', '8503.1', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18339', '洛阳市', '8503', 'area', '8503', '1');
INSERT INTO `dx_cascadedata` VALUES ('18338', '兰考县', '8502.10', 'area', '8502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18337', '开封县', '8502.9', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18336', '尉氏县', '8502.8', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18335', '通许县', '8502.7', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18334', '杞　县', '8502.6', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18333', '郊　区', '8502.5', 'area', '8503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18332', '南关区', '8502.4', 'area', '8502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18331', '鼓楼区', '8502.3', 'area', '8502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18330', '顺河回族区', '8502.2', 'area', '8502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18329', '龙亭区', '8502.1', 'area', '8502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18328', '开封市', '8502', 'area', '8502', '1');
INSERT INTO `dx_cascadedata` VALUES ('18327', '登封市', '8501.12', 'area', '8501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18326', '新郑市', '8501.11', 'area', '8501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18325', '新密市', '8501.10', 'area', '8501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18324', '荥阳市', '8501.9', 'area', '8502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18323', '巩义市', '8501.8', 'area', '8502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18322', '中牟县', '8501.7', 'area', '8502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18321', '邙山区', '8501.6', 'area', '8502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18320', '上街区', '8501.5', 'area', '8502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18319', '金水区', '8501.4', 'area', '8501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18318', '管城回族区', '8501.3', 'area', '8501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18317', '二七区', '8501.2', 'area', '8501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18316', '中原区', '8501.1', 'area', '8501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18315', '郑州市', '8501', 'area', '8501', '1');
INSERT INTO `dx_cascadedata` VALUES ('18314', '河南省', '8500', 'area', '8500', '0');
INSERT INTO `dx_cascadedata` VALUES ('18313', '东明县', '8016.9', 'area', '8017', '2');
INSERT INTO `dx_cascadedata` VALUES ('18312', '定陶县', '8016.8', 'area', '8017', '2');
INSERT INTO `dx_cascadedata` VALUES ('18311', '鄄城县', '8016.7', 'area', '8017', '2');
INSERT INTO `dx_cascadedata` VALUES ('18310', '郓城县', '8016.6', 'area', '8017', '2');
INSERT INTO `dx_cascadedata` VALUES ('18309', '巨野县', '8016.5', 'area', '8017', '2');
INSERT INTO `dx_cascadedata` VALUES ('18308', '成武县', '8016.4', 'area', '8016', '2');
INSERT INTO `dx_cascadedata` VALUES ('18307', '单　县', '8016.3', 'area', '8016', '2');
INSERT INTO `dx_cascadedata` VALUES ('18306', '曹　县', '8016.2', 'area', '8016', '2');
INSERT INTO `dx_cascadedata` VALUES ('18305', '牡丹区', '8016.1', 'area', '8016', '2');
INSERT INTO `dx_cascadedata` VALUES ('18304', '荷泽市', '8016', 'area', '8016', '1');
INSERT INTO `dx_cascadedata` VALUES ('18303', '邹平县', '8015.7', 'area', '8016', '2');
INSERT INTO `dx_cascadedata` VALUES ('18302', '博兴县', '8015.6', 'area', '8016', '2');
INSERT INTO `dx_cascadedata` VALUES ('18301', '沾化县', '8015.5', 'area', '8016', '2');
INSERT INTO `dx_cascadedata` VALUES ('18300', '无棣县', '8015.4', 'area', '8015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18299', '阳信县', '8015.3', 'area', '8015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18298', '惠民县', '8015.2', 'area', '8015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18297', '滨城区', '8015.1', 'area', '8015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18296', '滨州市', '8015', 'area', '8015', '1');
INSERT INTO `dx_cascadedata` VALUES ('18295', '临清市', '8014.8', 'area', '8015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18294', '高唐县', '8014.7', 'area', '8015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18293', '冠　县', '8014.6', 'area', '8015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18292', '东阿县', '8014.5', 'area', '8015', '2');
INSERT INTO `dx_cascadedata` VALUES ('18291', '茌平县', '8014.4', 'area', '8014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18290', '莘　县', '8014.3', 'area', '8014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18289', '阳谷县', '8014.2', 'area', '8014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18288', '东昌府区', '8014.1', 'area', '8014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18287', '聊城市', '8014', 'area', '8014', '1');
INSERT INTO `dx_cascadedata` VALUES ('18286', '禹城市', '8013.11', 'area', '8013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18285', '乐陵市', '8013.10', 'area', '8013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18284', '武城县', '8013.9', 'area', '8014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18283', '夏津县', '8013.8', 'area', '8014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18282', '平原县', '8013.7', 'area', '8014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18281', '齐河县', '8013.6', 'area', '8014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18280', '临邑县', '8013.5', 'area', '8014', '2');
INSERT INTO `dx_cascadedata` VALUES ('18279', '庆云县', '8013.4', 'area', '8013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18278', '宁津县', '8013.3', 'area', '8013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18277', '陵　县', '8013.2', 'area', '8013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18276', '德城区', '8013.1', 'area', '8013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18275', '德州市', '8013', 'area', '8013', '1');
INSERT INTO `dx_cascadedata` VALUES ('18274', '临沭县', '8012.12', 'area', '8012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18273', '蒙阴县', '8012.11', 'area', '8012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18272', '莒南县', '8012.10', 'area', '8012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18271', '平邑县', '8012.9', 'area', '8013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18270', '费　县', '8012.8', 'area', '8013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18269', '苍山县', '8012.7', 'area', '8013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18268', '沂水县', '8012.6', 'area', '8013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18267', '郯城县', '8012.5', 'area', '8013', '2');
INSERT INTO `dx_cascadedata` VALUES ('18266', '沂南县', '8012.4', 'area', '8012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18265', '河东区', '8012.3', 'area', '8012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18264', '罗庄区', '8012.2', 'area', '8012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18263', '兰山区', '8012.1', 'area', '8012', '2');
INSERT INTO `dx_cascadedata` VALUES ('18262', '临沂市', '8012', 'area', '8012', '1');
INSERT INTO `dx_cascadedata` VALUES ('18261', '钢城区', '8011.2', 'area', '8011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18260', '莱城区', '8011.1', 'area', '8011', '2');
INSERT INTO `dx_cascadedata` VALUES ('18259', '莱芜市', '8011', 'area', '8011', '1');
INSERT INTO `dx_cascadedata` VALUES ('18258', '莒　县', '8010.4', 'area', '8010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18257', '五莲县', '8010.3', 'area', '8010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18256', '岚山区', '8010.2', 'area', '8010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18255', '东港区', '8010.1', 'area', '8010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18254', '日照市', '8010', 'area', '8010', '1');
INSERT INTO `dx_cascadedata` VALUES ('18253', '乳山市', '8009.4', 'area', '8009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18252', '荣成市', '8009.3', 'area', '8009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18251', '文登市', '8009.2', 'area', '8009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18250', '环翠区', '8009.1', 'area', '8009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18249', '威海市', '8009', 'area', '8009', '1');
INSERT INTO `dx_cascadedata` VALUES ('18248', '肥城市', '8008.6', 'area', '8009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18247', '新泰市', '8008.5', 'area', '8009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18246', '东平县', '8008.4', 'area', '8008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18245', '宁阳县', '8008.3', 'area', '8008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18244', '岱岳区', '8008.2', 'area', '8008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18243', '泰山区', '8008.1', 'area', '8008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18242', '泰安市', '8008', 'area', '8008', '1');
INSERT INTO `dx_cascadedata` VALUES ('18241', '邹城市', '8007.12', 'area', '8007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18240', '兖州市', '8007.11', 'area', '8007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18239', '曲阜市', '8007.10', 'area', '8007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18238', '梁山县', '8007.9', 'area', '8008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18237', '泗水县', '8007.8', 'area', '8008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18236', '汶上县', '8007.7', 'area', '8008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18235', '嘉祥县', '8007.6', 'area', '8008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18234', '金乡县', '8007.5', 'area', '8008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18233', '鱼台县', '8007.4', 'area', '8007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18232', '微山县', '8007.3', 'area', '8007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18231', '任城区', '8007.2', 'area', '8007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18230', '市中区', '8007.1', 'area', '8007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18229', '济宁市', '8007', 'area', '8007', '1');
INSERT INTO `dx_cascadedata` VALUES ('18228', '昌邑市', '8006.12', 'area', '8006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18227', '高密市', '8006.11', 'area', '8006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18226', '安丘市', '8006.10', 'area', '8006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18225', '寿光市', '8006.9', 'area', '8007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18224', '诸城市', '8006.8', 'area', '8007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18223', '青州市', '8006.7', 'area', '8007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18222', '昌乐县', '8006.6', 'area', '8007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18221', '临朐县', '8006.5', 'area', '8007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18220', '奎文区', '8006.4', 'area', '8006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18219', '坊子区', '8006.3', 'area', '8006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18218', '寒亭区', '8006.2', 'area', '8006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18217', '潍城区', '8006.1', 'area', '8006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18216', '潍坊市', '8006', 'area', '8006', '1');
INSERT INTO `dx_cascadedata` VALUES ('18215', '海阳市', '8005.12', 'area', '8005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18214', '栖霞市', '8005.11', 'area', '8005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18213', '招远市', '8005.10', 'area', '8005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18212', '蓬莱市', '8005.9', 'area', '8006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18211', '莱州市', '8005.8', 'area', '8006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18210', '莱阳市', '8005.7', 'area', '8006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18209', '龙口市', '8005.6', 'area', '8006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18208', '长岛县', '8005.5', 'area', '8006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18207', '莱山区', '8005.4', 'area', '8005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18206', '牟平区', '8005.3', 'area', '8005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18205', '福山区', '8005.2', 'area', '8005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18204', '芝罘区', '8005.1', 'area', '8005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18203', '烟台市', '8005', 'area', '8005', '1');
INSERT INTO `dx_cascadedata` VALUES ('18202', '滕州市', '8004.6', 'area', '8005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18201', '山亭区', '8004.5', 'area', '8005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18200', '台儿庄区', '8004.4', 'area', '8004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18199', '峄城区', '8004.3', 'area', '8004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18198', '薛城区', '8004.2', 'area', '8004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18197', '市中区', '8004.1', 'area', '8004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18196', '枣庄市', '8004', 'area', '8004', '1');
INSERT INTO `dx_cascadedata` VALUES ('18195', '沂源县', '8003.8', 'area', '8004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18194', '高青县', '8003.7', 'area', '8004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18193', '桓台县', '8003.6', 'area', '8004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18192', '周村区', '8003.5', 'area', '8004', '2');
INSERT INTO `dx_cascadedata` VALUES ('18191', '临淄区', '8003.4', 'area', '8003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18190', '博山区', '8003.3', 'area', '8003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18189', '张店区', '8003.2', 'area', '8003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18188', '淄川区', '8003.1', 'area', '8003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18187', '淄博市', '8003', 'area', '8003', '1');
INSERT INTO `dx_cascadedata` VALUES ('18186', '莱西市', '8002.12', 'area', '8002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18185', '胶南市', '8002.11', 'area', '8002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18184', '平度市', '8002.10', 'area', '8002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18183', '即墨市', '8002.9', 'area', '8003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18182', '胶州市', '8002.8', 'area', '8003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18181', '城阳区', '8002.7', 'area', '8003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18180', '李沧区', '8002.6', 'area', '8003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18179', '崂山区', '8002.5', 'area', '8003', '2');
INSERT INTO `dx_cascadedata` VALUES ('18178', '黄岛区', '8002.4', 'area', '8002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18177', '四方区', '8002.3', 'area', '8002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18176', '市北区', '8002.2', 'area', '8002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18175', '市南区', '8002.1', 'area', '8002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18174', '青岛市', '8002', 'area', '8002', '1');
INSERT INTO `dx_cascadedata` VALUES ('18173', '章丘市', '8001.10', 'area', '8001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18172', '商河县', '8001.9', 'area', '8002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18171', '济阳县', '8001.8', 'area', '8002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18170', '平阴县', '8001.7', 'area', '8002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18169', '长清区', '8001.6', 'area', '8002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18168', '历城区', '8001.5', 'area', '8002', '2');
INSERT INTO `dx_cascadedata` VALUES ('18167', '天桥区', '8001.4', 'area', '8001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18166', '槐荫区', '8001.3', 'area', '8001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18165', '市中区', '8001.2', 'area', '8001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18164', '历下区', '8001.1', 'area', '8001', '2');
INSERT INTO `dx_cascadedata` VALUES ('18163', '济南市', '8001', 'area', '8001', '1');
INSERT INTO `dx_cascadedata` VALUES ('18162', '山东省', '8000', 'area', '8000', '0');
INSERT INTO `dx_cascadedata` VALUES ('18161', '德兴市', '7511.12', 'area', '7511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18160', '婺源县', '7511.11', 'area', '7511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18159', '万年县', '7511.10', 'area', '7511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18158', '鄱阳县', '7511.9', 'area', '7512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18157', '余干县', '7511.8', 'area', '7512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18156', '弋阳县', '7511.7', 'area', '7512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18155', '横峰县', '7511.6', 'area', '7512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18154', '铅山县', '7511.5', 'area', '7512', '2');
INSERT INTO `dx_cascadedata` VALUES ('18153', '玉山县', '7511.4', 'area', '7511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18152', '广丰县', '7511.3', 'area', '7511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18151', '上饶县', '7511.2', 'area', '7511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18150', '信州区', '7511.1', 'area', '7511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18149', '上饶市', '7511', 'area', '7511', '1');
INSERT INTO `dx_cascadedata` VALUES ('18148', '广昌县', '7510.11', 'area', '7510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18147', '东乡县', '7510.10', 'area', '7510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18146', '资溪县', '7510.9', 'area', '7511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18145', '金溪县', '7510.8', 'area', '7511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18144', '宜黄县', '7510.7', 'area', '7511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18143', '乐安县', '7510.6', 'area', '7511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18142', '崇仁县', '7510.5', 'area', '7511', '2');
INSERT INTO `dx_cascadedata` VALUES ('18141', '南丰县', '7510.4', 'area', '7510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18140', '黎川县', '7510.3', 'area', '7510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18139', '南城县', '7510.2', 'area', '7510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18138', '临川区', '7510.1', 'area', '7510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18137', '抚州市', '7510', 'area', '7510', '1');
INSERT INTO `dx_cascadedata` VALUES ('18136', '高安市', '7509.10', 'area', '7509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18135', '樟树市', '7509.9', 'area', '7510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18134', '丰城市', '7509.8', 'area', '7510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18133', '铜鼓县', '7509.7', 'area', '7510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18132', '靖安县', '7509.6', 'area', '7510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18131', '宜丰县', '7509.5', 'area', '7510', '2');
INSERT INTO `dx_cascadedata` VALUES ('18130', '上高县', '7509.4', 'area', '7509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18129', '万载县', '7509.3', 'area', '7509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18128', '奉新县', '7509.2', 'area', '7509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18127', '袁州区', '7509.1', 'area', '7509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18126', '宜春市', '7509', 'area', '7509', '1');
INSERT INTO `dx_cascadedata` VALUES ('18125', '井冈山市', '7508.13', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18124', '永新县', '7508.12', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18123', '安福县', '7508.11', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18122', '万安县', '7508.10', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18121', '遂川县', '7508.9', 'area', '7509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18120', '泰和县', '7508.8', 'area', '7509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18119', '永丰县', '7508.7', 'area', '7509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18118', '新干县', '7508.6', 'area', '7509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18117', '峡江县', '7508.5', 'area', '7509', '2');
INSERT INTO `dx_cascadedata` VALUES ('18116', '吉水县', '7508.4', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18115', '吉安县', '7508.3', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18114', '青原区', '7508.2', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18113', '吉州区', '7508.1', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18112', '吉安市', '7508', 'area', '7508', '1');
INSERT INTO `dx_cascadedata` VALUES ('18111', '南康市', '7507.18', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18110', '瑞金市', '7507.17', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18109', '石城县', '7507.16', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18108', '寻乌县', '7507.15', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18107', '会昌县', '7507.14', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18106', '兴国县', '7507.13', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18105', '于都县', '7507.12', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18104', '宁都县', '7507.11', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18103', '全南县', '7507.10', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18102', '定南县', '7507.9', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18101', '龙南县', '7507.8', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18100', '安远县', '7507.7', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18099', '崇义县', '7507.6', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18098', '上犹县', '7507.5', 'area', '7508', '2');
INSERT INTO `dx_cascadedata` VALUES ('18097', '大余县', '7507.4', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18096', '信丰县', '7507.3', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18095', '赣　县', '7507.2', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18094', '章贡区', '7507.1', 'area', '7507', '2');
INSERT INTO `dx_cascadedata` VALUES ('18093', '赣州市', '7507', 'area', '7507', '1');
INSERT INTO `dx_cascadedata` VALUES ('18092', '贵溪市', '7506.3', 'area', '7506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18091', '余江县', '7506.2', 'area', '7506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18090', '月湖区', '7506.1', 'area', '7506', '2');
INSERT INTO `dx_cascadedata` VALUES ('18089', '鹰潭市', '7506', 'area', '7506', '1');
INSERT INTO `dx_cascadedata` VALUES ('18088', '分宜县', '7505.2', 'area', '7505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18087', '渝水区', '7505.1', 'area', '7505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18086', '新余市', '7505', 'area', '7505', '1');
INSERT INTO `dx_cascadedata` VALUES ('18085', '瑞昌市', '7504.12', 'area', '7504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18084', '彭泽县', '7504.11', 'area', '7504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18083', '湖口县', '7504.10', 'area', '7504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18082', '都昌县', '7504.9', 'area', '7505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18081', '星子县', '7504.8', 'area', '7505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18080', '德安县', '7504.7', 'area', '7505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18079', '永修县', '7504.6', 'area', '7505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18078', '修水县', '7504.5', 'area', '7505', '2');
INSERT INTO `dx_cascadedata` VALUES ('18077', '武宁县', '7504.4', 'area', '7504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18076', '九江县', '7504.3', 'area', '7504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18075', '浔阳区', '7504.2', 'area', '7504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18074', '庐山区', '7504.1', 'area', '7504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18073', '九江市', '7504', 'area', '7504', '1');
INSERT INTO `dx_cascadedata` VALUES ('18072', '芦溪县', '7503.5', 'area', '7504', '2');
INSERT INTO `dx_cascadedata` VALUES ('18071', '上栗县', '7503.4', 'area', '7503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18070', '莲花县', '7503.3', 'area', '7503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18069', '湘东区', '7503.2', 'area', '7503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18068', '安源区', '7503.1', 'area', '7503', '2');
INSERT INTO `dx_cascadedata` VALUES ('18067', '萍乡市', '7503', 'area', '7503', '1');
INSERT INTO `dx_cascadedata` VALUES ('18066', '乐平市', '7502.4', 'area', '7502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18065', '浮梁县', '7502.3', 'area', '7502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18064', '珠山区', '7502.2', 'area', '7502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18063', '昌江区', '7502.1', 'area', '7502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18062', '景德镇市', '7502', 'area', '7502', '1');
INSERT INTO `dx_cascadedata` VALUES ('18061', '进贤县', '7501.9', 'area', '7502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18060', '安义县', '7501.8', 'area', '7502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18059', '新建县', '7501.7', 'area', '7502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18058', '南昌县', '7501.6', 'area', '7502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18057', '青山湖区', '7501.5', 'area', '7502', '2');
INSERT INTO `dx_cascadedata` VALUES ('18056', '湾里区', '7501.4', 'area', '7501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18055', '青云谱区', '7501.3', 'area', '7501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18054', '西湖区', '7501.2', 'area', '7501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18053', '东湖区', '7501.1', 'area', '7501', '2');
INSERT INTO `dx_cascadedata` VALUES ('18052', '南昌市', '7501', 'area', '7501', '1');
INSERT INTO `dx_cascadedata` VALUES ('18051', '江西省', '7500', 'area', '7500', '0');
INSERT INTO `dx_cascadedata` VALUES ('18050', '福鼎市', '7009.9', 'area', '7010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18049', '福安市', '7009.8', 'area', '7010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18048', '柘荣县', '7009.7', 'area', '7010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18047', '周宁县', '7009.6', 'area', '7010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18046', '寿宁县', '7009.5', 'area', '7010', '2');
INSERT INTO `dx_cascadedata` VALUES ('18045', '屏南县', '7009.4', 'area', '7009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18044', '古田县', '7009.3', 'area', '7009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18043', '霞浦县', '7009.2', 'area', '7009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18042', '蕉城区', '7009.1', 'area', '7009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18041', '宁德市', '7009', 'area', '7009', '1');
INSERT INTO `dx_cascadedata` VALUES ('18040', '漳平市', '7008.7', 'area', '7009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18039', '连城县', '7008.6', 'area', '7009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18038', '武平县', '7008.5', 'area', '7009', '2');
INSERT INTO `dx_cascadedata` VALUES ('18037', '上杭县', '7008.4', 'area', '7008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18036', '永定县', '7008.3', 'area', '7008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18035', '长汀县', '7008.2', 'area', '7008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18034', '新罗区', '7008.1', 'area', '7008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18033', '龙岩市', '7008', 'area', '7008', '1');
INSERT INTO `dx_cascadedata` VALUES ('18032', '建阳市', '7007.10', 'area', '7007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18031', '建瓯市', '7007.9', 'area', '7008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18030', '武夷山市', '7007.8', 'area', '7008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18029', '邵武市', '7007.7', 'area', '7008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18028', '政和县', '7007.6', 'area', '7008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18027', '松溪县', '7007.5', 'area', '7008', '2');
INSERT INTO `dx_cascadedata` VALUES ('18026', '光泽县', '7007.4', 'area', '7007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18025', '浦城县', '7007.3', 'area', '7007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18024', '顺昌县', '7007.2', 'area', '7007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18023', '延平区', '7007.1', 'area', '7007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18022', '南平市', '7007', 'area', '7007', '1');
INSERT INTO `dx_cascadedata` VALUES ('18021', '龙海市', '7006.11', 'area', '7006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18020', '华安县', '7006.10', 'area', '7006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18019', '平和县', '7006.9', 'area', '7007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18018', '南靖县', '7006.8', 'area', '7007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18017', '东山县', '7006.7', 'area', '7007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18016', '长泰县', '7006.6', 'area', '7007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18015', '诏安县', '7006.5', 'area', '7007', '2');
INSERT INTO `dx_cascadedata` VALUES ('18014', '漳浦县', '7006.4', 'area', '7006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18013', '云霄县', '7006.3', 'area', '7006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18012', '龙文区', '7006.2', 'area', '7006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18011', '芗城区', '7006.1', 'area', '7006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18010', '漳州市', '7006', 'area', '7006', '1');
INSERT INTO `dx_cascadedata` VALUES ('18009', '南安市', '7005.12', 'area', '7005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18008', '晋江市', '7005.11', 'area', '7005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18007', '石狮市', '7005.10', 'area', '7005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18006', '金门县', '7005.9', 'area', '7006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18005', '德化县', '7005.8', 'area', '7006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18004', '永春县', '7005.7', 'area', '7006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18003', '安溪县', '7005.6', 'area', '7006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18002', '惠安县', '7005.5', 'area', '7006', '2');
INSERT INTO `dx_cascadedata` VALUES ('18001', '泉港区', '7005.4', 'area', '7005', '2');
INSERT INTO `dx_cascadedata` VALUES ('18000', '洛江区', '7005.3', 'area', '7005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17999', '丰泽区', '7005.2', 'area', '7005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17998', '鲤城区', '7005.1', 'area', '7005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17997', '泉州市', '7005', 'area', '7005', '1');
INSERT INTO `dx_cascadedata` VALUES ('17996', '永安市', '7004.12', 'area', '7004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17995', '建宁县', '7004.11', 'area', '7004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17994', '泰宁县', '7004.10', 'area', '7004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17993', '将乐县', '7004.9', 'area', '7005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17992', '沙　县', '7004.8', 'area', '7005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17991', '尤溪县', '7004.7', 'area', '7005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17990', '大田县', '7004.6', 'area', '7005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17989', '宁化县', '7004.5', 'area', '7005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17988', '清流县', '7004.4', 'area', '7004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17987', '明溪县', '7004.3', 'area', '7004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17986', '三元区', '7004.2', 'area', '7004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17985', '梅列区', '7004.1', 'area', '7004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17984', '三明市', '7004', 'area', '7004', '1');
INSERT INTO `dx_cascadedata` VALUES ('17983', '仙游县', '7003.5', 'area', '7004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17982', '秀屿区', '7003.4', 'area', '7003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17981', '荔城区', '7003.3', 'area', '7003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17980', '涵江区', '7003.2', 'area', '7003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17979', '城厢区', '7003.1', 'area', '7003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17978', '莆田市', '7003', 'area', '7003', '1');
INSERT INTO `dx_cascadedata` VALUES ('17977', '翔安区', '7002.6', 'area', '7003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17976', '同安区', '7002.5', 'area', '7003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17975', '集美区', '7002.4', 'area', '7002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17974', '湖里区', '7002.3', 'area', '7002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17973', '海沧区', '7002.2', 'area', '7002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17972', '思明区', '7002.1', 'area', '7002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17971', '厦门市', '7002', 'area', '7002', '1');
INSERT INTO `dx_cascadedata` VALUES ('17970', '长乐市', '7001.13', 'area', '7001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17969', '福清市', '7001.12', 'area', '7001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17968', '平潭县', '7001.11', 'area', '7001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17967', '永泰县', '7001.10', 'area', '7001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17966', '闽清县', '7001.9', 'area', '7002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17965', '罗源县', '7001.8', 'area', '7002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17964', '连江县', '7001.7', 'area', '7002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17963', '闽侯县', '7001.6', 'area', '7002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17962', '晋安区', '7001.5', 'area', '7002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17961', '马尾区', '7001.4', 'area', '7001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17960', '仓山区', '7001.3', 'area', '7001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17959', '台江区', '7001.2', 'area', '7001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17958', '鼓楼区', '7001.1', 'area', '7001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17957', '福州市', '7001', 'area', '7001', '1');
INSERT INTO `dx_cascadedata` VALUES ('17956', '福建省', '7000', 'area', '7000', '0');
INSERT INTO `dx_cascadedata` VALUES ('17955', '宁国市', '6517.7', 'area', '6518', '2');
INSERT INTO `dx_cascadedata` VALUES ('17954', '旌德县', '6517.6', 'area', '6518', '2');
INSERT INTO `dx_cascadedata` VALUES ('17953', '绩溪县', '6517.5', 'area', '6518', '2');
INSERT INTO `dx_cascadedata` VALUES ('17952', '泾　县', '6517.4', 'area', '6517', '2');
INSERT INTO `dx_cascadedata` VALUES ('17951', '广德县', '6517.3', 'area', '6517', '2');
INSERT INTO `dx_cascadedata` VALUES ('17950', '郎溪县', '6517.2', 'area', '6517', '2');
INSERT INTO `dx_cascadedata` VALUES ('17949', '宣州区', '6517.1', 'area', '6517', '2');
INSERT INTO `dx_cascadedata` VALUES ('17948', '宣城市', '6517', 'area', '6517', '1');
INSERT INTO `dx_cascadedata` VALUES ('17947', '青阳县', '6516.4', 'area', '6516', '2');
INSERT INTO `dx_cascadedata` VALUES ('17946', '石台县', '6516.3', 'area', '6516', '2');
INSERT INTO `dx_cascadedata` VALUES ('17945', '东至县', '6516.2', 'area', '6516', '2');
INSERT INTO `dx_cascadedata` VALUES ('17944', '贵池区', '6516.1', 'area', '6516', '2');
INSERT INTO `dx_cascadedata` VALUES ('17943', '池州市', '6516', 'area', '6516', '1');
INSERT INTO `dx_cascadedata` VALUES ('17942', '利辛县', '6515.4', 'area', '6515', '2');
INSERT INTO `dx_cascadedata` VALUES ('17941', '蒙城县', '6515.3', 'area', '6515', '2');
INSERT INTO `dx_cascadedata` VALUES ('17940', '涡阳县', '6515.2', 'area', '6515', '2');
INSERT INTO `dx_cascadedata` VALUES ('17939', '谯城区', '6515.1', 'area', '6515', '2');
INSERT INTO `dx_cascadedata` VALUES ('17938', '亳州市', '6515', 'area', '6515', '1');
INSERT INTO `dx_cascadedata` VALUES ('17937', '霍山县', '6514.7', 'area', '6515', '2');
INSERT INTO `dx_cascadedata` VALUES ('17936', '金寨县', '6514.6', 'area', '6515', '2');
INSERT INTO `dx_cascadedata` VALUES ('17935', '舒城县', '6514.5', 'area', '6515', '2');
INSERT INTO `dx_cascadedata` VALUES ('17934', '霍邱县', '6514.4', 'area', '6514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17933', '寿　县', '6514.3', 'area', '6514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17932', '裕安区', '6514.2', 'area', '6514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17931', '金安区', '6514.1', 'area', '6514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17930', '六安市', '6514', 'area', '6514', '1');
INSERT INTO `dx_cascadedata` VALUES ('17929', '和　县', '6513.5', 'area', '6514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17928', '含山县', '6513.4', 'area', '6513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17927', '无为县', '6513.3', 'area', '6513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17926', '庐江县', '6513.2', 'area', '6513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17925', '居巢区', '6513.1', 'area', '6513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17924', '巢湖市', '6513', 'area', '6513', '1');
INSERT INTO `dx_cascadedata` VALUES ('17923', '泗　县', '6512.5', 'area', '6513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17922', '灵璧县', '6512.4', 'area', '6512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17921', '萧　县', '6512.3', 'area', '6512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17920', '砀山县', '6512.2', 'area', '6512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17919', '墉桥区', '6512.1', 'area', '6512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17918', '宿州市', '6512', 'area', '6512', '1');
INSERT INTO `dx_cascadedata` VALUES ('17917', '界首市', '6511.8', 'area', '6512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17916', '颍上县', '6511.7', 'area', '6512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17915', '阜南县', '6511.6', 'area', '6512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17914', '太和县', '6511.5', 'area', '6512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17913', '临泉县', '6511.4', 'area', '6511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17912', '颍泉区', '6511.3', 'area', '6511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17911', '颍东区', '6511.2', 'area', '6511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17910', '颍州区', '6511.1', 'area', '6511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17909', '阜阳市', '6511', 'area', '6511', '1');
INSERT INTO `dx_cascadedata` VALUES ('17908', '明光市', '6510.8', 'area', '6511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17907', '天长市', '6510.7', 'area', '6511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17906', '凤阳县', '6510.6', 'area', '6511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17905', '定远县', '6510.5', 'area', '6511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17904', '全椒县', '6510.4', 'area', '6510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17903', '来安县', '6510.3', 'area', '6510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17902', '南谯区', '6510.2', 'area', '6510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17901', '琅琊区', '6510.1', 'area', '6510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17900', '滁州市', '6510', 'area', '6510', '1');
INSERT INTO `dx_cascadedata` VALUES ('17899', '祁门县', '6509.7', 'area', '6510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17898', '黟　县', '6509.6', 'area', '6510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17897', '休宁县', '6509.5', 'area', '6510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17896', '歙　县', '6509.4', 'area', '6509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17895', '徽州区', '6509.3', 'area', '6509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17894', '黄山区', '6509.2', 'area', '6509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17893', '屯溪区', '6509.1', 'area', '6509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17892', '黄山市', '6509', 'area', '6509', '1');
INSERT INTO `dx_cascadedata` VALUES ('17891', '桐城市', '6508.11', 'area', '6508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17890', '岳西县', '6508.10', 'area', '6508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17889', '望江县', '6508.9', 'area', '6509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17888', '宿松县', '6508.8', 'area', '6509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17887', '太湖县', '6508.7', 'area', '6509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17886', '潜山县', '6508.6', 'area', '6509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17885', '枞阳县', '6508.5', 'area', '6509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17884', '怀宁县', '6508.4', 'area', '6508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17883', '郊　区', '6508.3', 'area', '6508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17882', '大观区', '6508.2', 'area', '6508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17881', '迎江区', '6508.1', 'area', '6508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17880', '安庆市', '6508', 'area', '6508', '1');
INSERT INTO `dx_cascadedata` VALUES ('17879', '铜陵县', '6507.4', 'area', '6507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17878', '郊　区', '6507.3', 'area', '6507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17877', '狮子山区', '6507.2', 'area', '6507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17876', '铜官山区', '6507.1', 'area', '6507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17875', '铜陵市', '6507', 'area', '6507', '1');
INSERT INTO `dx_cascadedata` VALUES ('17874', '濉溪县', '6506.4', 'area', '6506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17873', '烈山区', '6506.3', 'area', '6506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17872', '相山区', '6506.2', 'area', '6506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17871', '杜集区', '6506.1', 'area', '6506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17870', '淮北市', '6506', 'area', '6506', '1');
INSERT INTO `dx_cascadedata` VALUES ('17869', '当涂县', '6505.4', 'area', '6505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17868', '雨山区', '6505.3', 'area', '6505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17867', '花山区', '6505.2', 'area', '6505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17866', '金家庄区', '6505.1', 'area', '6505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17865', '马鞍山市', '6505', 'area', '6505', '1');
INSERT INTO `dx_cascadedata` VALUES ('17864', '凤台县', '6504.6', 'area', '6505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17863', '潘集区', '6504.5', 'area', '6505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17862', '八公山区', '6504.4', 'area', '6504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17861', '谢家集区', '6504.3', 'area', '6504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17860', '田家庵区', '6504.2', 'area', '6504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17859', '大通区', '6504.1', 'area', '6504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17858', '淮南市', '6504', 'area', '6504', '1');
INSERT INTO `dx_cascadedata` VALUES ('17857', '固镇县', '6503.7', 'area', '6504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17856', '五河县', '6503.6', 'area', '6504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17855', '怀远县', '6503.5', 'area', '6504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17854', '淮上区', '6503.4', 'area', '6503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17853', '禹会区', '6503.3', 'area', '6503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17852', '蚌山区', '6503.2', 'area', '6503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17851', '龙子湖区', '6503.1', 'area', '6503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17850', '蚌埠市', '6503', 'area', '6503', '1');
INSERT INTO `dx_cascadedata` VALUES ('17849', '南陵县', '6502.7', 'area', '6503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17848', '繁昌县', '6502.6', 'area', '6503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17847', '芜湖县', '6502.5', 'area', '6503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17846', '鸠江区', '6502.4', 'area', '6502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17845', '新芜区', '6502.3', 'area', '6502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17844', '马塘区', '6502.2', 'area', '6502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17843', '镜湖区', '6502.1', 'area', '6502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17842', '芜湖市', '6502', 'area', '6502', '1');
INSERT INTO `dx_cascadedata` VALUES ('17841', '肥西县', '6501.7', 'area', '6502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17840', '肥东县', '6501.6', 'area', '6502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17839', '长丰县', '6501.5', 'area', '6502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17838', '包河区', '6501.4', 'area', '6501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17837', '蜀山区', '6501.3', 'area', '6501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17836', '庐阳区', '6501.2', 'area', '6501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17835', '瑶海区', '6501.1', 'area', '6501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17834', '合肥市', '6501', 'area', '6501', '1');
INSERT INTO `dx_cascadedata` VALUES ('17833', '安徽省', '6500', 'area', '6500', '0');
INSERT INTO `dx_cascadedata` VALUES ('17832', '龙泉市', '6011.9', 'area', '6012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17831', '景宁畲族自治县', '6011.8', 'area', '6012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17830', '庆元县', '6011.7', 'area', '6012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17829', '云和县', '6011.6', 'area', '6012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17828', '松阳县', '6011.5', 'area', '6012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17827', '遂昌县', '6011.4', 'area', '6011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17826', '缙云县', '6011.3', 'area', '6011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17825', '青田县', '6011.2', 'area', '6011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17824', '莲都区', '6011.1', 'area', '6011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17823', '丽水市', '6011', 'area', '6011', '1');
INSERT INTO `dx_cascadedata` VALUES ('17822', '临海市', '6010.9', 'area', '6011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17821', '温岭市', '6010.8', 'area', '6011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17820', '仙居县', '6010.7', 'area', '6011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17819', '天台县', '6010.6', 'area', '6011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17818', '三门县', '6010.5', 'area', '6011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17817', '玉环县', '6010.4', 'area', '6010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17816', '路桥区', '6010.3', 'area', '6010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17815', '黄岩区', '6010.2', 'area', '6010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17814', '椒江区', '6010.1', 'area', '6010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17813', '台州市', '6010', 'area', '6010', '1');
INSERT INTO `dx_cascadedata` VALUES ('17812', '嵊泗县', '6009.4', 'area', '6009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17811', '岱山县', '6009.3', 'area', '6009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17810', '普陀区', '6009.2', 'area', '6009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17809', '定海区', '6009.1', 'area', '6009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17808', '舟山市', '6009', 'area', '6009', '1');
INSERT INTO `dx_cascadedata` VALUES ('17807', '江山市', '6008.6', 'area', '6009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17806', '龙游县', '6008.5', 'area', '6009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17805', '开化县', '6008.4', 'area', '6008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17804', '常山县', '6008.3', 'area', '6008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17803', '衢江区', '6008.2', 'area', '6008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17802', '柯城区', '6008.1', 'area', '6008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17801', '衢州市', '6008', 'area', '6008', '1');
INSERT INTO `dx_cascadedata` VALUES ('17800', '永康市', '6007.9', 'area', '6008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17799', '东阳市', '6007.8', 'area', '6008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17798', '义乌市', '6007.7', 'area', '6008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17797', '兰溪市', '6007.6', 'area', '6008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17796', '磐安县', '6007.5', 'area', '6008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17795', '浦江县', '6007.4', 'area', '6007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17794', '武义县', '6007.3', 'area', '6007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17793', '金东区', '6007.2', 'area', '6007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17792', '婺城区', '6007.1', 'area', '6007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17791', '金华市', '6007', 'area', '6007', '1');
INSERT INTO `dx_cascadedata` VALUES ('17790', '嵊州市', '6006.6', 'area', '6007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17789', '上虞市', '6006.5', 'area', '6007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17788', '诸暨市', '6006.4', 'area', '6006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17787', '新昌县', '6006.3', 'area', '6006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17786', '绍兴县', '6006.2', 'area', '6006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17785', '越城区', '6006.1', 'area', '6006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17784', '绍兴市', '6006', 'area', '6006', '1');
INSERT INTO `dx_cascadedata` VALUES ('17783', '安吉县', '6005.5', 'area', '6006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17782', '长兴县', '6005.4', 'area', '6005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17781', '德清县', '6005.3', 'area', '6005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17780', '南浔区', '6005.2', 'area', '6005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17779', '吴兴区', '6005.1', 'area', '6005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17778', '湖州市', '6005', 'area', '6005', '1');
INSERT INTO `dx_cascadedata` VALUES ('17777', '桐乡市', '6004.7', 'area', '6005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17776', '平湖市', '6004.6', 'area', '6005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17775', '海宁市', '6004.5', 'area', '6005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17774', '海盐县', '6004.4', 'area', '6004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17773', '嘉善县', '6004.3', 'area', '6004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17772', '秀洲区', '6004.2', 'area', '6004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17771', '秀城区', '6004.1', 'area', '6004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17770', '嘉兴市', '6004', 'area', '6004', '1');
INSERT INTO `dx_cascadedata` VALUES ('17769', '乐清市', '6003.11', 'area', '6003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17768', '瑞安市', '6003.10', 'area', '6003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17767', '泰顺县', '6003.9', 'area', '6004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17766', '文成县', '6003.8', 'area', '6004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17765', '苍南县', '6003.7', 'area', '6004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17764', '平阳县', '6003.6', 'area', '6004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17763', '永嘉县', '6003.5', 'area', '6004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17762', '洞头县', '6003.4', 'area', '6003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17761', '瓯海区', '6003.3', 'area', '6003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17760', '龙湾区', '6003.2', 'area', '6003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17759', '鹿城区', '6003.1', 'area', '6003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17758', '温州市', '6003', 'area', '6003', '1');
INSERT INTO `dx_cascadedata` VALUES ('17757', '奉化市', '6002.11', 'area', '6002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17756', '慈溪市', '6002.10', 'area', '6002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17755', '余姚市', '6002.9', 'area', '6003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17754', '宁海县', '6002.8', 'area', '6003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17753', '象山县', '6002.7', 'area', '6003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17752', '鄞州区', '6002.6', 'area', '6003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17751', '镇海区', '6002.5', 'area', '6003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17750', '北仑区', '6002.4', 'area', '6002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17749', '江北区', '6002.3', 'area', '6002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17748', '江东区', '6002.2', 'area', '6002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17747', '海曙区', '6002.1', 'area', '6002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17746', '宁波市', '6002', 'area', '6002', '1');
INSERT INTO `dx_cascadedata` VALUES ('17745', '临安市', '6001.13', 'area', '6001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17744', '富阳市', '6001.12', 'area', '6001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17743', '建德市', '6001.11', 'area', '6001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17742', '淳安县', '6001.10', 'area', '6001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17741', '桐庐县', '6001.9', 'area', '6002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17740', '余杭区', '6001.8', 'area', '6002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17739', '萧山区', '6001.7', 'area', '6002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17738', '滨江区', '6001.6', 'area', '6002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17737', '西湖区', '6001.5', 'area', '6002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17736', '拱墅区', '6001.4', 'area', '6001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17735', '江干区', '6001.3', 'area', '6001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17734', '下城区', '6001.2', 'area', '6001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17733', '上城区', '6001.1', 'area', '6001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17732', '杭州市', '6001', 'area', '6001', '1');
INSERT INTO `dx_cascadedata` VALUES ('17731', '浙江省', '6000', 'area', '6000', '0');
INSERT INTO `dx_cascadedata` VALUES ('17730', '泗洪县', '5513.5', 'area', '5514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17729', '泗阳县', '5513.4', 'area', '5513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17728', '沭阳县', '5513.3', 'area', '5513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17727', '宿豫区', '5513.2', 'area', '5513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17726', '宿城区', '5513.1', 'area', '5513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17725', '宿迁市', '5513', 'area', '5513', '1');
INSERT INTO `dx_cascadedata` VALUES ('17724', '姜堰市', '5512.6', 'area', '5513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17723', '泰兴市', '5512.5', 'area', '5513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17722', '靖江市', '5512.4', 'area', '5512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17721', '兴化市', '5512.3', 'area', '5512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17720', '高港区', '5512.2', 'area', '5512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17719', '海陵区', '5512.1', 'area', '5512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17718', '泰州市', '5512', 'area', '5512', '1');
INSERT INTO `dx_cascadedata` VALUES ('17717', '句容市', '5511.6', 'area', '5512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17716', '扬中市', '5511.5', 'area', '5512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17715', '丹阳市', '5511.4', 'area', '5511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17714', '丹徒区', '5511.3', 'area', '5511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17713', '润州区', '5511.2', 'area', '5511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17712', '京口区', '5511.1', 'area', '5511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17711', '镇江市', '5511', 'area', '5511', '1');
INSERT INTO `dx_cascadedata` VALUES ('17710', '江都市', '5510.7', 'area', '5511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17709', '高邮市', '5510.6', 'area', '5511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17708', '仪征市', '5510.5', 'area', '5511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17707', '宝应县', '5510.4', 'area', '5510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17706', '郊　区', '5510.3', 'area', '5510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17705', '邗江区', '5510.2', 'area', '5510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17704', '广陵区', '5510.1', 'area', '5510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17703', '扬州市', '5510', 'area', '5510', '1');
INSERT INTO `dx_cascadedata` VALUES ('17702', '大丰市', '5509.9', 'area', '5510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17701', '东台市', '5509.8', 'area', '5510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17700', '建湖县', '5509.7', 'area', '5510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17699', '射阳县', '5509.6', 'area', '5510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17698', '阜宁县', '5509.5', 'area', '5510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17697', '滨海县', '5509.4', 'area', '5509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17696', '响水县', '5509.3', 'area', '5509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17695', '盐都区', '5509.2', 'area', '5509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17694', '亭湖区', '5509.1', 'area', '5509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17693', '盐城市', '5509', 'area', '5509', '1');
INSERT INTO `dx_cascadedata` VALUES ('17692', '金湖县', '5508.8', 'area', '5509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17691', '盱眙县', '5508.7', 'area', '5509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17690', '洪泽县', '5508.6', 'area', '5509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17689', '涟水县', '5508.5', 'area', '5509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17688', '清浦区', '5508.4', 'area', '5508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17687', '淮阴区', '5508.3', 'area', '5508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17686', '楚州区', '5508.2', 'area', '5508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17685', '清河区', '5508.1', 'area', '5508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17684', '淮安市', '5508', 'area', '5508', '1');
INSERT INTO `dx_cascadedata` VALUES ('17683', '灌南县', '5507.7', 'area', '5508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17682', '灌云县', '5507.6', 'area', '5508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17681', '东海县', '5507.5', 'area', '5508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17680', '赣榆县', '5507.4', 'area', '5507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17679', '海州区', '5507.3', 'area', '5507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17678', '新浦区', '5507.2', 'area', '5507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17677', '连云区', '5507.1', 'area', '5507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17676', '连云港市', '5507', 'area', '5507', '1');
INSERT INTO `dx_cascadedata` VALUES ('17675', '海门市', '5506.8', 'area', '5507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17674', '通州市', '5506.7', 'area', '5507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17673', '如皋市', '5506.6', 'area', '5507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17672', '启东市', '5506.5', 'area', '5507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17671', '如东县', '5506.4', 'area', '5506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17670', '海安县', '5506.3', 'area', '5506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17669', '港闸区', '5506.2', 'area', '5506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17668', '崇川区', '5506.1', 'area', '5506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17667', '南通市', '5506', 'area', '5506', '1');
INSERT INTO `dx_cascadedata` VALUES ('17666', '太仓市', '5505.11', 'area', '5505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17665', '吴江市', '5505.10', 'area', '5505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17664', '昆山市', '5505.9', 'area', '5506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17663', '张家港市', '5505.8', 'area', '5506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17662', '常熟市', '5505.7', 'area', '5506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17661', '相城区', '5505.6', 'area', '5506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17660', '吴中区', '5505.5', 'area', '5506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17659', '虎丘区', '5505.4', 'area', '5505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17658', '金阊区', '5505.3', 'area', '5505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17657', '平江区', '5505.2', 'area', '5505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17656', '沧浪区', '5505.1', 'area', '5505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17655', '苏州市', '5505', 'area', '5505', '1');
INSERT INTO `dx_cascadedata` VALUES ('17654', '金坛市', '5504.7', 'area', '5505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17653', '溧阳市', '5504.6', 'area', '5505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17652', '武进区', '5504.5', 'area', '5505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17651', '新北区', '5504.4', 'area', '5504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17650', '戚墅堰区', '5504.3', 'area', '5504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17649', '钟楼区', '5504.2', 'area', '5504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17648', '天宁区', '5504.1', 'area', '5504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17647', '常州市', '5504', 'area', '5504', '1');
INSERT INTO `dx_cascadedata` VALUES ('17646', '邳州市', '5503.11', 'area', '5503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17645', '新沂市', '5503.10', 'area', '5503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17644', '睢宁县', '5503.9', 'area', '5504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17643', '铜山县', '5503.8', 'area', '5504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17642', '沛　县', '5503.7', 'area', '5504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17641', '丰　县', '5503.6', 'area', '5504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17640', '泉山区', '5503.5', 'area', '5504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17639', '贾汪区', '5503.4', 'area', '5503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17638', '九里区', '5503.3', 'area', '5503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17637', '云龙区', '5503.2', 'area', '5503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17636', '鼓楼区', '5503.1', 'area', '5503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17635', '徐州市', '5503', 'area', '5503', '1');
INSERT INTO `dx_cascadedata` VALUES ('17634', '宜兴市', '5502.8', 'area', '5503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17633', '江阴市', '5502.7', 'area', '5503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17632', '滨湖区', '5502.6', 'area', '5503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17631', '惠山区', '5502.5', 'area', '5503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17630', '锡山区', '5502.4', 'area', '5502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17629', '北塘区', '5502.3', 'area', '5502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17628', '南长区', '5502.2', 'area', '5502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17627', '崇安区', '5502.1', 'area', '5502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17626', '无锡市', '5502', 'area', '5502', '1');
INSERT INTO `dx_cascadedata` VALUES ('17625', '高淳县', '5501.13', 'area', '5501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17624', '溧水县', '5501.12', 'area', '5501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17623', '六合区', '5501.11', 'area', '5501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17622', '江宁区', '5501.10', 'area', '5501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17621', '雨花台区', '5501.9', 'area', '5502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17620', '栖霞区', '5501.8', 'area', '5502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17619', '浦口区', '5501.7', 'area', '5502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17618', '下关区', '5501.6', 'area', '5502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17617', '鼓楼区', '5501.5', 'area', '5502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17616', '建邺区', '5501.4', 'area', '5501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17615', '秦淮区', '5501.3', 'area', '5501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17614', '白下区', '5501.2', 'area', '5501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17613', '武区', '5501.1', 'area', '5501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17612', '南京市', '5501', 'area', '5501', '1');
INSERT INTO `dx_cascadedata` VALUES ('17611', '江苏省', '5500', 'area', '5500', '0');
INSERT INTO `dx_cascadedata` VALUES ('17610', '崇明县', '5019', 'area', '5019', '1');
INSERT INTO `dx_cascadedata` VALUES ('17609', '奉贤区', '5018', 'area', '5018', '1');
INSERT INTO `dx_cascadedata` VALUES ('17608', '南汇区', '5017', 'area', '5017', '1');
INSERT INTO `dx_cascadedata` VALUES ('17607', '青浦区', '5016', 'area', '5016', '1');
INSERT INTO `dx_cascadedata` VALUES ('17606', '松江区', '5015', 'area', '5015', '1');
INSERT INTO `dx_cascadedata` VALUES ('17605', '金山区', '5014', 'area', '5014', '1');
INSERT INTO `dx_cascadedata` VALUES ('17604', '浦东新区', '5013', 'area', '5013', '1');
INSERT INTO `dx_cascadedata` VALUES ('17603', '嘉定区', '5012', 'area', '5012', '1');
INSERT INTO `dx_cascadedata` VALUES ('17602', '宝山区', '5011', 'area', '5011', '1');
INSERT INTO `dx_cascadedata` VALUES ('17601', '闵行区', '5010', 'area', '5010', '1');
INSERT INTO `dx_cascadedata` VALUES ('17600', '杨浦区', '5009', 'area', '5009', '1');
INSERT INTO `dx_cascadedata` VALUES ('17599', '虹口区', '5008', 'area', '5008', '1');
INSERT INTO `dx_cascadedata` VALUES ('17598', '闸北区', '5007', 'area', '5007', '1');
INSERT INTO `dx_cascadedata` VALUES ('17597', '普陀区', '5006', 'area', '5006', '1');
INSERT INTO `dx_cascadedata` VALUES ('17596', '静安区', '5005', 'area', '5005', '1');
INSERT INTO `dx_cascadedata` VALUES ('17595', '长宁区', '5004', 'area', '5004', '1');
INSERT INTO `dx_cascadedata` VALUES ('17594', '徐汇区', '5003', 'area', '5003', '1');
INSERT INTO `dx_cascadedata` VALUES ('17593', '卢湾区', '5002', 'area', '5002', '1');
INSERT INTO `dx_cascadedata` VALUES ('17592', '黄浦区', '5001', 'area', '5001', '1');
INSERT INTO `dx_cascadedata` VALUES ('17591', '上海市', '5000', 'area', '5000', '0');
INSERT INTO `dx_cascadedata` VALUES ('17590', '漠河县', '4513.3', 'area', '4513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17589', '塔河县', '4513.2', 'area', '4513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17588', '呼玛县', '4513.1', 'area', '4513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17587', '大兴安岭地区', '4513', 'area', '4513', '1');
INSERT INTO `dx_cascadedata` VALUES ('17586', '海伦市', '4512.10', 'area', '4512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17585', '肇东市', '4512.9', 'area', '4513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17584', '安达市', '4512.8', 'area', '4513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17583', '绥棱县', '4512.7', 'area', '4513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17582', '明水县', '4512.6', 'area', '4513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17581', '庆安县', '4512.5', 'area', '4513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17580', '青冈县', '4512.4', 'area', '4512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17579', '兰西县', '4512.3', 'area', '4512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17578', '望奎县', '4512.2', 'area', '4512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17577', '北林区', '4512.1', 'area', '4512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17576', '绥化市', '4512', 'area', '4512', '1');
INSERT INTO `dx_cascadedata` VALUES ('17575', '五大连池市', '4511.6', 'area', '4512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17574', '北安市', '4511.5', 'area', '4512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17573', '孙吴县', '4511.4', 'area', '4511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17572', '逊克县', '4511.3', 'area', '4511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17571', '嫩江县', '4511.2', 'area', '4511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17570', '爱辉区', '4511.1', 'area', '4511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17569', '黑河市', '4511', 'area', '4511', '1');
INSERT INTO `dx_cascadedata` VALUES ('17568', '穆棱市', '4510.10', 'area', '4510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17567', '宁安市', '4510.9', 'area', '4511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17566', '海林市', '4510.8', 'area', '4511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17565', '绥芬河市', '4510.7', 'area', '4511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17564', '林口县', '4510.6', 'area', '4511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17563', '东宁县', '4510.5', 'area', '4511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17562', '西安区', '4510.4', 'area', '4510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17561', '爱民区', '4510.3', 'area', '4510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17560', '阳明区', '4510.2', 'area', '4510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17559', '东安区', '4510.1', 'area', '4510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17558', '牡丹江市', '4510', 'area', '4510', '1');
INSERT INTO `dx_cascadedata` VALUES ('17557', '勃利县', '4509.4', 'area', '4509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17556', '茄子河区', '4509.3', 'area', '4509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17555', '桃山区', '4509.2', 'area', '4509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17554', '新兴区', '4509.1', 'area', '4509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17553', '七台河市', '4509', 'area', '4509', '1');
INSERT INTO `dx_cascadedata` VALUES ('17552', '富锦市', '4508.11', 'area', '4508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17551', '同江市', '4508.10', 'area', '4508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17550', '抚远县', '4508.9', 'area', '4509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17549', '汤原县', '4508.8', 'area', '4509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17548', '桦川县', '4508.7', 'area', '4509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17547', '桦南县', '4508.6', 'area', '4509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17546', '郊　区', '4508.5', 'area', '4509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17545', '东风区', '4508.4', 'area', '4508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17544', '前进区', '4508.3', 'area', '4508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17543', '向阳区', '4508.2', 'area', '4508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17542', '永红区', '4508.1', 'area', '4508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17541', '佳木斯市', '4508', 'area', '4508', '1');
INSERT INTO `dx_cascadedata` VALUES ('17540', '铁力市', '4507.17', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17539', '嘉荫县', '4507.16', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17538', '上甘岭区', '4507.15', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17537', '红星区', '4507.14', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17536', '乌伊岭区', '4507.13', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17535', '带岭区', '4507.12', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17534', '汤旺河区', '4507.11', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17533', '乌马河区', '4507.10', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17532', '五营区', '4507.9', 'area', '4508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17531', '金山屯区', '4507.8', 'area', '4508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17530', '美溪区', '4507.7', 'area', '4508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17529', '新青区', '4507.6', 'area', '4508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17528', '翠峦区', '4507.5', 'area', '4508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17527', '西林区', '4507.4', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17526', '友好区', '4507.3', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17525', '南岔区', '4507.2', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17524', '伊春区', '4507.1', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17523', '伊春市', '4507', 'area', '4507', '1');
INSERT INTO `dx_cascadedata` VALUES ('17522', '杜尔伯特蒙古族自治县', '4506.9', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17521', '林甸县', '4506.8', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17520', '肇源县', '4506.7', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17519', '肇州县', '4506.6', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17518', '大同区', '4506.5', 'area', '4507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17517', '红岗区', '4506.4', 'area', '4506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17516', '让胡路区', '4506.3', 'area', '4506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17515', '龙凤区', '4506.2', 'area', '4506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17514', '萨尔图区', '4506.1', 'area', '4506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17513', '大庆市', '4506', 'area', '4506', '1');
INSERT INTO `dx_cascadedata` VALUES ('17512', '饶河县', '4505.8', 'area', '4506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17511', '宝清县', '4505.7', 'area', '4506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17510', '友谊县', '4505.6', 'area', '4506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17509', '集贤县', '4505.5', 'area', '4506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17508', '宝山区', '4505.4', 'area', '4505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17507', '四方台区', '4505.3', 'area', '4505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17506', '岭东区', '4505.2', 'area', '4505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17505', '尖山区', '4505.1', 'area', '4505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17504', '双鸭山市', '4505', 'area', '4505', '1');
INSERT INTO `dx_cascadedata` VALUES ('17503', '绥滨县', '4504.8', 'area', '4505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17502', '萝北县', '4504.7', 'area', '4505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17501', '兴山区', '4504.6', 'area', '4505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17500', '东山区', '4504.5', 'area', '4505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17499', '兴安区', '4504.4', 'area', '4504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17498', '南山区', '4504.3', 'area', '4504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17497', '工农区', '4504.2', 'area', '4504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17496', '向阳区', '4504.1', 'area', '4504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17495', '鹤岗市', '4504', 'area', '4504', '1');
INSERT INTO `dx_cascadedata` VALUES ('17494', '密山市', '4503.9', 'area', '4504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17493', '虎林市', '4503.8', 'area', '4504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17492', '鸡东县', '4503.7', 'area', '4504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17491', '麻山区', '4503.6', 'area', '4504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17490', '城子河区', '4503.5', 'area', '4504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17489', '梨树区', '4503.4', 'area', '4503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17488', '滴道区', '4503.3', 'area', '4503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17487', '恒山区', '4503.2', 'area', '4503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17486', '鸡冠区', '4503.1', 'area', '4503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17485', '鸡西市', '4503', 'area', '4503', '1');
INSERT INTO `dx_cascadedata` VALUES ('17484', '讷河市', '4502.15', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17483', '拜泉县', '4502.14', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17482', '克东县', '4502.13', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17481', '克山县', '4502.12', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17480', '富裕县', '4502.11', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17479', '甘南县', '4502.10', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17478', '泰来县', '4502.9', 'area', '4503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17477', '龙江县 依安县', '4502.8', 'area', '4503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17476', '梅里斯达斡尔族区', '4502.7', 'area', '4503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17475', '碾子山区', '4502.6', 'area', '4503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17474', '富拉尔基区', '4502.5', 'area', '4503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17473', '昂昂溪区', '4502.4', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17472', '铁锋区', '4502.3', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17471', '建华区', '4502.2', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17470', '龙沙区', '4502.1', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17469', '齐齐哈尔市', '4502', 'area', '4502', '1');
INSERT INTO `dx_cascadedata` VALUES ('17468', '五常市', '4501.19', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17467', '尚志市', '4501.18', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17466', '双城市', '4501.17', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17465', '阿城市', '4501.16', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17464', '延寿县', '4501.15', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17463', '通河县', '4501.14', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17462', '木兰县', '4501.13', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17461', '巴彦县', '4501.12', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17460', '宾　县', '4501.11', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17459', '方正县', '4501.10', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17458', '依兰县', '4501.9', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17457', '呼兰区', '4501.8', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17456', '松北区', '4501.7', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17455', '平房区', '4501.6', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17454', '动力区', '4501.5', 'area', '4502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17453', '香坊区', '4501.4', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17452', '道外区', '4501.3', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17451', '南岗区', '4501.2', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17450', '道里区', '4501.1', 'area', '4501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17449', '哈尔滨市', '4501', 'area', '4501', '1');
INSERT INTO `dx_cascadedata` VALUES ('17448', '黑龙江省', '4500', 'area', '4500', '0');
INSERT INTO `dx_cascadedata` VALUES ('17447', '安图县', '4009.8', 'area', '4010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17446', '汪清县', '4009.7', 'area', '4010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17445', '和龙市', '4009.6', 'area', '4010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17444', '龙井市', '4009.5', 'area', '4010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17443', '珲春市', '4009.4', 'area', '4009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17442', '敦化市', '4009.3', 'area', '4009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17441', '图们市', '4009.2', 'area', '4009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17440', '延吉市', '4009.1', 'area', '4009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17439', '延边朝鲜族自治州', '4009', 'area', '4009', '1');
INSERT INTO `dx_cascadedata` VALUES ('17438', '大安市', '4008.5', 'area', '4009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17437', '洮南市', '4008.4', 'area', '4008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17436', '通榆县', '4008.3', 'area', '4008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17435', '镇赉县', '4008.2', 'area', '4008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17434', '洮北区', '4008.1', 'area', '4008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17433', '白城市', '4008', 'area', '4008', '1');
INSERT INTO `dx_cascadedata` VALUES ('17432', '扶余县', '4007.5', 'area', '4008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17431', '乾安县', '4007.4', 'area', '4007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17430', '长岭县', '4007.3', 'area', '4007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17429', '前郭尔罗斯蒙古族自治县', '4007.2', 'area', '4007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17428', '宁江区', '4007.1', 'area', '4007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17427', '松原市', '4007', 'area', '4007', '1');
INSERT INTO `dx_cascadedata` VALUES ('17426', '临江市', '4006.6', 'area', '4007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17425', '江源县', '4006.5', 'area', '4007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17424', '长白朝鲜族自治县', '4006.4', 'area', '4006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17423', '靖宇县', '4006.3', 'area', '4006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17422', '抚松县', '4006.2', 'area', '4006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17421', '八道江区', '4006.1', 'area', '4006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17420', '白山市', '4006', 'area', '4006', '1');
INSERT INTO `dx_cascadedata` VALUES ('17419', '集安市', '4005.7', 'area', '4006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17418', '梅河口市', '4005.6', 'area', '4006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17417', '柳河县', '4005.5', 'area', '4006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17416', '辉南县', '4005.4', 'area', '4005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17415', '通化县', '4005.3', 'area', '4005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17414', '二道江区', '4005.2', 'area', '4005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17413', '东昌区', '4005.1', 'area', '4005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17412', '通化市', '4005', 'area', '4005', '1');
INSERT INTO `dx_cascadedata` VALUES ('17411', '东辽县', '4004.4', 'area', '4004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17410', '东丰县', '4004.3', 'area', '4004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17409', '西安区', '4004.2', 'area', '4004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17408', '龙山区', '4004.1', 'area', '4004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17407', '辽源市', '4004', 'area', '4004', '1');
INSERT INTO `dx_cascadedata` VALUES ('17406', '双辽市', '4003.6', 'area', '4004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17405', '公主岭市', '4003.5', 'area', '4004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17404', '伊通满族自治县', '4003.4', 'area', '4003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17403', '梨树县', '4003.3', 'area', '4003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17402', '铁东区', '4003.2', 'area', '4003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17401', '铁西区', '4003.1', 'area', '4003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17400', '四平市', '4003', 'area', '4003', '1');
INSERT INTO `dx_cascadedata` VALUES ('17399', '磐石市', '4002.9', 'area', '4003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17398', '舒兰市', '4002.8', 'area', '4003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17397', '桦甸市', '4002.7', 'area', '4003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17396', '蛟河市', '4002.6', 'area', '4003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17395', '永吉县', '4002.5', 'area', '4003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17394', '丰满区', '4002.4', 'area', '4002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17393', '船营区', '4002.3', 'area', '4002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17392', '龙潭区', '4002.2', 'area', '4002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17391', '昌邑区', '4002.1', 'area', '4002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17390', '吉林市', '4002', 'area', '4002', '1');
INSERT INTO `dx_cascadedata` VALUES ('17389', '德惠市', '4001.10', 'area', '4001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17388', '榆树市', '4001.9', 'area', '4002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17387', '九台市', '4001.8', 'area', '4002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17386', '农安县', '4001.7', 'area', '4002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17385', '双阳区', '4001.6', 'area', '4002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17384', '绿园区', '4001.5', 'area', '4002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17383', '二道区', '4001.4', 'area', '4001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17382', '朝阳区', '4001.3', 'area', '4001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17381', '宽城区', '4001.2', 'area', '4001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17380', '南关区', '4001.1', 'area', '4001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17379', '长春市', '4001', 'area', '4001', '1');
INSERT INTO `dx_cascadedata` VALUES ('17378', '吉林省', '4000', 'area', '4000', '0');
INSERT INTO `dx_cascadedata` VALUES ('17377', '兴城市', '3514.6', 'area', '3515', '2');
INSERT INTO `dx_cascadedata` VALUES ('17376', '建昌县', '3514.5', 'area', '3515', '2');
INSERT INTO `dx_cascadedata` VALUES ('17375', '绥中县', '3514.4', 'area', '3514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17374', '南票区', '3514.3', 'area', '3514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17373', '龙港区', '3514.2', 'area', '3514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17372', '连山区', '3514.1', 'area', '3514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17371', '葫芦岛市', '3514', 'area', '3514', '1');
INSERT INTO `dx_cascadedata` VALUES ('17370', '凌源市', '3513.7', 'area', '3514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17369', '北票市', '3513.6', 'area', '3514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17368', '喀喇沁左翼蒙古族自治县', '3513.5', 'area', '3514', '2');
INSERT INTO `dx_cascadedata` VALUES ('17367', '建平县', '3513.4', 'area', '3513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17366', '朝阳县', '3513.3', 'area', '3513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17365', '龙城区', '3513.2', 'area', '3513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17364', '双塔区', '3513.1', 'area', '3513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17363', '朝阳市', '3513', 'area', '3513', '1');
INSERT INTO `dx_cascadedata` VALUES ('17362', '开原市', '3512.7', 'area', '3513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17361', '调兵山市', '3512.6', 'area', '3513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17360', '昌图县', '3512.5', 'area', '3513', '2');
INSERT INTO `dx_cascadedata` VALUES ('17359', '西丰县', '3512.4', 'area', '3512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17358', '铁岭县', '3512.3', 'area', '3512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17357', '清河区', '3512.2', 'area', '3512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17356', '银州区', '3512.1', 'area', '3512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17355', '铁岭市', '3512', 'area', '3512', '1');
INSERT INTO `dx_cascadedata` VALUES ('17354', '盘山县', '3511.4', 'area', '3511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17353', '大洼县', '3511.3', 'area', '3511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17352', '兴隆台区', '3511.2', 'area', '3511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17351', '双台子区', '3511.1', 'area', '3511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17350', '盘锦市', '3511', 'area', '3511', '1');
INSERT INTO `dx_cascadedata` VALUES ('17349', '灯塔市', '3510.7', 'area', '3511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17348', '辽阳县', '3510.6', 'area', '3511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17347', '太子河区', '3510.5', 'area', '3511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17346', '弓长岭区', '3510.4', 'area', '3510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17345', '宏伟区', '3510.3', 'area', '3510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17344', '文圣区', '3510.2', 'area', '3510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17343', '白塔区', '3510.1', 'area', '3510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17342', '辽阳市', '3510', 'area', '3510', '1');
INSERT INTO `dx_cascadedata` VALUES ('17341', '彰武县', '3509.7', 'area', '3510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17340', '阜新蒙古族自治县', '3509.6', 'area', '3510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17339', '细河区', '3509.5', 'area', '3510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17338', '清河门区', '3509.4', 'area', '3509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17337', '太平区', '3509.3', 'area', '3509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17336', '新邱区', '3509.2', 'area', '3509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17335', '海州区', '3509.1', 'area', '3509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17334', '阜新市', '3509', 'area', '3509', '1');
INSERT INTO `dx_cascadedata` VALUES ('17333', '大石桥市', '3508.6', 'area', '3509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17332', '盖州市', '3508.5', 'area', '3509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17331', '老边区', '3508.4', 'area', '3508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17330', '鲅鱼圈区', '3508.3', 'area', '3508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17329', '西市区', '3508.2', 'area', '3508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17328', '站前区', '3508.1', 'area', '3508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17327', '营口市', '3508', 'area', '3508', '1');
INSERT INTO `dx_cascadedata` VALUES ('17326', '北宁市', '3507.7', 'area', '3508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17325', '凌海市', '3507.6', 'area', '3508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17324', '义　县', '3507.5', 'area', '3508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17323', '黑山县', '3507.4', 'area', '3507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17322', '太和区', '3507.3', 'area', '3507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17321', '凌河区', '3507.2', 'area', '3507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17320', '古塔区', '3507.1', 'area', '3507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17319', '锦州市', '3507', 'area', '3507', '1');
INSERT INTO `dx_cascadedata` VALUES ('17318', '凤城市', '3506.6', 'area', '3507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17317', '东港市', '3506.5', 'area', '3507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17316', '宽甸满族自治县', '3506.4', 'area', '3506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17315', '振安区', '3506.3', 'area', '3506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17314', '振兴区', '3506.2', 'area', '3506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17313', '元宝区', '3506.1', 'area', '3506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17312', '丹东市', '3506', 'area', '3506', '1');
INSERT INTO `dx_cascadedata` VALUES ('17311', '桓仁满族自治县', '3505.6', 'area', '3506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17310', '本溪满族自治县', '3505.5', 'area', '3506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17309', '南芬区', '3505.4', 'area', '3505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17308', '明山区', '3505.3', 'area', '3505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17307', '溪湖区', '3505.2', 'area', '3505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17306', '平山区', '3505.1', 'area', '3505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17305', '本溪市', '3505', 'area', '3505', '1');
INSERT INTO `dx_cascadedata` VALUES ('17304', '清原满族自治县', '3504.7', 'area', '3505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17303', '新宾满族自治县', '3504.6', 'area', '3505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17302', '抚顺县', '3504.5', 'area', '3505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17301', '顺城区', '3504.4', 'area', '3504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17300', '望花区', '3504.3', 'area', '3504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17299', '东洲区', '3504.2', 'area', '3504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17298', '新抚区', '3504.1', 'area', '3504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17297', '抚顺市', '3504', 'area', '3504', '1');
INSERT INTO `dx_cascadedata` VALUES ('17296', '海城市', '3503.7', 'area', '3504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17295', '岫岩满族自治县', '3503.6', 'area', '3504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17294', '台安县', '3503.5', 'area', '3504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17293', '千山区', '3503.4', 'area', '3503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17292', '立山区', '3503.3', 'area', '3503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17291', '铁西区', '3503.2', 'area', '3503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17290', '铁东区', '3503.1', 'area', '3503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17289', '鞍山市', '3503', 'area', '3503', '1');
INSERT INTO `dx_cascadedata` VALUES ('17288', '庄河市', '3502.10', 'area', '3502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17287', '普兰店市', '3502.9', 'area', '3503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17286', '瓦房店市', '3502.8', 'area', '3503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17285', '长海县', '3502.7', 'area', '3503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17284', '金州区', '3502.6', 'area', '3503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17283', '旅顺口区', '3502.5', 'area', '3503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17282', '甘井子区', '3502.4', 'area', '3502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17281', '沙河口区', '3502.3', 'area', '3502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17280', '西岗区', '3502.2', 'area', '3502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17279', '中山区', '3502.1', 'area', '3502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17278', '大连市', '3502', 'area', '3502', '1');
INSERT INTO `dx_cascadedata` VALUES ('17277', '新民市', '3501.13', 'area', '3501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17276', '法库县', '3501.12', 'area', '3501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17275', '康平县', '3501.11', 'area', '3501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17274', '辽中县', '3501.10', 'area', '3501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17273', '于洪区', '3501.9', 'area', '3502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17272', '新城子区', '3501.8', 'area', '3502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17271', '东陵区', '3501.7', 'area', '3502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17270', '苏家屯区', '3501.6', 'area', '3502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17269', '铁西区', '3501.5', 'area', '3502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17268', '皇姑区', '3501.4', 'area', '3501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17267', '大东区', '3501.3', 'area', '3501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17266', '沈河区', '3501.2', 'area', '3501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17265', '和平区', '3501.1', 'area', '3501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17264', '沈阳市', '3501', 'area', '3501', '1');
INSERT INTO `dx_cascadedata` VALUES ('17263', '辽宁省', '3500', 'area', '3500', '0');
INSERT INTO `dx_cascadedata` VALUES ('17262', '额济纳旗', '3012.3', 'area', '3012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17261', '阿拉善右旗', '3012.2', 'area', '3012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17260', '阿拉善左旗', '3012.1', 'area', '3012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17259', '阿拉善盟', '3012', 'area', '3012', '1');
INSERT INTO `dx_cascadedata` VALUES ('17258', '多伦县', '3011.12', 'area', '3011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17257', '正蓝旗', '3011.11', 'area', '3011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17256', '正镶白旗', '3011.10', 'area', '3011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17255', '镶黄旗', '3011.9', 'area', '3012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17254', '太仆寺旗', '3011.8', 'area', '3012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17253', '西乌珠穆沁旗', '3011.7', 'area', '3012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17252', '东乌珠穆沁旗', '3011.6', 'area', '3012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17251', '苏尼特右旗', '3011.5', 'area', '3012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17250', '苏尼特左旗', '3011.4', 'area', '3011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17249', '阿巴嘎旗', '3011.3', 'area', '3011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17248', '锡林浩特市', '3011.2', 'area', '3011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17247', '二连浩特市', '3011.1', 'area', '3011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17246', '锡林郭勒盟', '3011', 'area', '3011', '1');
INSERT INTO `dx_cascadedata` VALUES ('17245', '突泉县', '3010.6', 'area', '3011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17244', '扎赉特旗', '3010.5', 'area', '3011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17243', '科尔沁右翼中旗', '3010.4', 'area', '3010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17242', '科尔沁右翼前旗', '3010.3', 'area', '3010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17241', '阿尔山市', '3010.2', 'area', '3010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17240', '乌兰浩特市', '3010.1', 'area', '3010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17239', '兴安盟', '3010', 'area', '3010', '1');
INSERT INTO `dx_cascadedata` VALUES ('17238', '丰镇市', '3009.11', 'area', '3009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17237', '四子王旗', '3009.10', 'area', '3009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17236', '察哈尔右翼后旗', '3009.9', 'area', '3010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17235', '察哈尔右翼中旗', '3009.8', 'area', '3010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17234', '察哈尔右翼前旗', '3009.7', 'area', '3010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17233', '凉城县', '3009.6', 'area', '3010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17232', '兴和县', '3009.5', 'area', '3010', '2');
INSERT INTO `dx_cascadedata` VALUES ('17231', '商都县', '3009.4', 'area', '3009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17230', '化德县', '3009.3', 'area', '3009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17229', '卓资县', '3009.2', 'area', '3009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17228', '集宁区', '3009.1', 'area', '3009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17227', '乌兰察布市', '3009', 'area', '3009', '1');
INSERT INTO `dx_cascadedata` VALUES ('17226', '杭锦后旗', '3008.7', 'area', '3009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17225', '乌拉特后旗', '3008.6', 'area', '3009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17224', '乌拉特中旗', '3008.5', 'area', '3009', '2');
INSERT INTO `dx_cascadedata` VALUES ('17223', '乌拉特前旗', '3008.4', 'area', '3008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17222', '磴口县', '3008.3', 'area', '3008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17221', '五原县', '3008.2', 'area', '3008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17220', '临河区', '3008.1', 'area', '3008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17219', '巴彦淖尔市', '3008', 'area', '3008', '1');
INSERT INTO `dx_cascadedata` VALUES ('17218', '根河市', '3007.13', 'area', '3007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17217', '额尔古纳市', '3007.12', 'area', '3007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17216', '扎兰屯市', '3007.11', 'area', '3007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17215', '牙克石市', '3007.10', 'area', '3007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17214', '满洲里市', '3007.9', 'area', '3008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17213', '新巴尔虎右旗', '3007.8', 'area', '3008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17212', '新巴尔虎左旗', '3007.7', 'area', '3008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17211', '陈巴尔虎旗', '3007.6', 'area', '3008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17210', '鄂温克族自治旗', '3007.5', 'area', '3008', '2');
INSERT INTO `dx_cascadedata` VALUES ('17209', '鄂伦春自治旗', '3007.4', 'area', '3007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17208', '莫力达瓦达斡尔族自治旗', '3007.3', 'area', '3007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17207', '阿荣旗', '3007.2', 'area', '3007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17206', '海拉尔区', '3007.1', 'area', '3007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17205', '呼伦贝尔市', '3007', 'area', '3007', '1');
INSERT INTO `dx_cascadedata` VALUES ('17204', '伊金霍洛旗', '3006.8', 'area', '3007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17203', '乌审旗', '3006.7', 'area', '3007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17202', '杭锦旗', '3006.6', 'area', '3007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17201', '鄂托克旗', '3006.5', 'area', '3007', '2');
INSERT INTO `dx_cascadedata` VALUES ('17200', '鄂托克前旗', '3006.4', 'area', '3006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17199', '准格尔旗', '3006.3', 'area', '3006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17198', '达拉特旗', '3006.2', 'area', '3006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17197', '东胜区', '3006.1', 'area', '3006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17196', '鄂尔多斯市', '3006', 'area', '3006', '1');
INSERT INTO `dx_cascadedata` VALUES ('17195', '霍林郭勒市', '3005.8', 'area', '3006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17194', '扎鲁特旗', '3005.7', 'area', '3006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17193', '奈曼旗', '3005.6', 'area', '3006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17192', '库伦旗', '3005.5', 'area', '3006', '2');
INSERT INTO `dx_cascadedata` VALUES ('17191', '开鲁县', '3005.4', 'area', '3005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17190', '科尔沁左翼后旗', '3005.3', 'area', '3005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17189', '科尔沁左翼中旗', '3005.2', 'area', '3005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17188', '科尔沁区', '3005.1', 'area', '3005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17187', '通辽市', '3005', 'area', '3005', '1');
INSERT INTO `dx_cascadedata` VALUES ('17186', '敖汉旗', '3004.12', 'area', '3004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17185', '宁城县', '3004.11', 'area', '3004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17184', '喀喇沁旗', '3004.10', 'area', '3004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17183', '翁牛特旗', '3004.9', 'area', '3005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17182', '克什克腾旗', '3004.8', 'area', '3005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17181', '林西县', '3004.7', 'area', '3005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17180', '巴林右旗', '3004.6', 'area', '3005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17179', '巴林左旗', '3004.5', 'area', '3005', '2');
INSERT INTO `dx_cascadedata` VALUES ('17178', '阿鲁科尔沁旗', '3004.4', 'area', '3004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17177', '松山区', '3004.3', 'area', '3004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17176', '元宝山区', '3004.2', 'area', '3004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17175', '红山区', '3004.1', 'area', '3004', '2');
INSERT INTO `dx_cascadedata` VALUES ('17174', '赤峰市', '3004', 'area', '3004', '1');
INSERT INTO `dx_cascadedata` VALUES ('17173', '乌达区', '3003.3', 'area', '3003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17172', '海南区', '3003.2', 'area', '3003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17171', '海勃湾区', '3003.1', 'area', '3003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17170', '乌海市', '3003', 'area', '3003', '1');
INSERT INTO `dx_cascadedata` VALUES ('17169', '达尔罕茂明安联合旗', '3002.9', 'area', '3003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17168', '固阳县', '3002.8', 'area', '3003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17167', '土默特右旗', '3002.7', 'area', '3003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17166', '九原区', '3002.6', 'area', '3003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17165', '白云矿区', '3002.5', 'area', '3003', '2');
INSERT INTO `dx_cascadedata` VALUES ('17164', '石拐区', '3002.4', 'area', '3002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17163', '青山区', '3002.3', 'area', '3002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17162', '昆都仑区', '3002.2', 'area', '3002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17161', '东河区', '3002.1', 'area', '3002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17160', '包头市', '3002', 'area', '3002', '1');
INSERT INTO `dx_cascadedata` VALUES ('17159', '武川县', '3001.9', 'area', '3002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17158', '清水河县', '3001.8', 'area', '3002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17157', '和林格尔县', '3001.7', 'area', '3002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17156', '托克托县', '3001.6', 'area', '3002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17155', '土默特左旗', '3001.5', 'area', '3002', '2');
INSERT INTO `dx_cascadedata` VALUES ('17154', '赛罕区', '3001.4', 'area', '3001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17153', '玉泉区', '3001.3', 'area', '3001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17152', '回民区', '3001.2', 'area', '3001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17151', '新城区', '3001.1', 'area', '3001', '2');
INSERT INTO `dx_cascadedata` VALUES ('17150', '呼和浩特市', '3001', 'area', '3001', '1');
INSERT INTO `dx_cascadedata` VALUES ('17149', '内蒙古自治区', '3000', 'area', '3000', '0');
INSERT INTO `dx_cascadedata` VALUES ('17148', '汾阳市', '2511.13', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17147', '孝义市', '2511.12', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17146', '交口县', '2511.11', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17145', '中阳县', '2511.10', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17144', '方山县', '2511.9', 'area', '2512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17143', '岚　县', '2511.8', 'area', '2512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17142', '石楼县', '2511.7', 'area', '2512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17141', '柳林县', '2511.6', 'area', '2512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17140', '临　县', '2511.5', 'area', '2512', '2');
INSERT INTO `dx_cascadedata` VALUES ('17139', '兴　县', '2511.4', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17138', '交城县', '2511.3', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17137', '文水县', '2511.2', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17136', '离石区', '2511.1', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17135', '吕梁市', '2511', 'area', '2511', '1');
INSERT INTO `dx_cascadedata` VALUES ('17134', '霍州市', '2510.17', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17133', '侯马市', '2510.16', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17132', '汾西县', '2510.15', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17131', '蒲　县', '2510.14', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17130', '永和县', '2510.13', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17129', '隰　县', '2510.12', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17128', '大宁县', '2510.11', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17127', '乡宁县', '2510.10', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17126', '吉　县', '2510.9', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17125', '浮山县', '2510.8', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17124', '安泽县', '2510.7', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17123', '古　县', '2510.6', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17122', '洪洞县', '2510.5', 'area', '2511', '2');
INSERT INTO `dx_cascadedata` VALUES ('17121', '襄汾县', '2510.4', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17120', '翼城县', '2510.3', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17119', '曲沃县', '2510.2', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17118', '尧都区', '2510.1', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17117', '临汾市', '2510', 'area', '2510', '1');
INSERT INTO `dx_cascadedata` VALUES ('17116', '原平市', '2509.14', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17115', '偏关县', '2509.13', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17114', '保德县', '2509.12', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17113', '河曲县', '2509.11', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17112', '岢岚县', '2509.10', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17111', '五寨县', '2509.9', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17110', '神池县', '2509.8', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17109', '静乐县', '2509.7', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17108', '宁武县', '2509.6', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17107', '繁峙县', '2509.5', 'area', '2510', '2');
INSERT INTO `dx_cascadedata` VALUES ('17106', '代　县', '2509.4', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17105', '五台县', '2509.3', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17104', '定襄县', '2509.2', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17103', '忻府区', '2509.1', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17102', '忻州市', '2509', 'area', '2509', '1');
INSERT INTO `dx_cascadedata` VALUES ('17101', '河津市', '2508.13', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17100', '永济市', '2508.12', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17099', '芮城县', '2508.11', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17098', '平陆县', '2508.10', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17097', '夏　县', '2508.9', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17096', '垣曲县', '2508.8', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17095', '绛　县', '2508.7', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17094', '新绛县', '2508.6', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17093', '稷山县', '2508.5', 'area', '2509', '2');
INSERT INTO `dx_cascadedata` VALUES ('17092', '闻喜县', '2508.4', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17091', '万荣县', '2508.3', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17090', '临猗县', '2508.2', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17089', '盐湖区', '2508.1', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17088', '运城市', '2508', 'area', '2508', '1');
INSERT INTO `dx_cascadedata` VALUES ('17087', '介休市', '2507.11', 'area', '2507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17086', '灵石县', '2507.10', 'area', '2507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17085', '平遥县', '2507.9', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17084', '祁　县', '2507.8', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17083', '太谷县', '2507.7', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17082', '寿阳县', '2507.6', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17081', '昔阳县', '2507.5', 'area', '2508', '2');
INSERT INTO `dx_cascadedata` VALUES ('17080', '和顺县', '2507.4', 'area', '2507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17079', '左权县', '2507.3', 'area', '2507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17078', '榆社县', '2507.2', 'area', '2507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17077', '榆次区', '2507.1', 'area', '2507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17076', '晋中市', '2507', 'area', '2507', '1');
INSERT INTO `dx_cascadedata` VALUES ('17075', '怀仁县', '2506.6', 'area', '2507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17074', '右玉县', '2506.5', 'area', '2507', '2');
INSERT INTO `dx_cascadedata` VALUES ('17073', '应　县', '2506.4', 'area', '2506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17072', '山阴县', '2506.3', 'area', '2506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17071', '平鲁区', '2506.2', 'area', '2506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17070', '朔城区', '2506.1', 'area', '2506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17069', '朔州市', '2506', 'area', '2506', '1');
INSERT INTO `dx_cascadedata` VALUES ('17068', '高平市', '2505.6', 'area', '2506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17067', '泽州县', '2505.5', 'area', '2506', '2');
INSERT INTO `dx_cascadedata` VALUES ('17066', '陵川县', '2505.4', 'area', '2505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17065', '阳城县', '2505.3', 'area', '2505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17064', '沁水县', '2505.2', 'area', '2505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17063', '城　区', '2505.1', 'area', '2505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17062', '晋城市', '2505', 'area', '2505', '1');
INSERT INTO `dx_cascadedata` VALUES ('17061', '潞城市', '2504.13', 'area', '2504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17060', '沁源县', '2504.12', 'area', '2504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17059', '沁　县', '2504.11', 'area', '2504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17058', '武乡县', '2504.10', 'area', '2504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17057', '长子县', '2504.9', 'area', '2505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17056', '壶关县', '2504.8', 'area', '2505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17055', '黎城县', '2504.7', 'area', '2505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17054', '平顺县', '2504.6', 'area', '2505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17053', '屯留县', '2504.5', 'area', '2505', '2');
INSERT INTO `dx_cascadedata` VALUES ('17052', '襄垣县', '2504.4', 'area', '2504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17051', '长治县', '2504.3', 'area', '2504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17050', '郊　区', '2504.2', 'area', '2504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17049', '城　区', '2504.1', 'area', '2504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17048', '长治市', '2504', 'area', '2504', '1');
INSERT INTO `dx_cascadedata` VALUES ('17047', '盂　县', '2503.5', 'area', '2504', '2');
INSERT INTO `dx_cascadedata` VALUES ('17046', '平定县', '2503.4', 'area', '2503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17045', '郊　区', '2503.3', 'area', '2503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17044', '矿　区', '2503.2', 'area', '2503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17043', '城　区', '2503.1', 'area', '2503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17042', '阳泉市', '2503', 'area', '2503', '1');
INSERT INTO `dx_cascadedata` VALUES ('17041', '南郊区', '2502.12', 'area', '2502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17040', '矿　区', '2502.11', 'area', '2502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17039', '城　区', '2502.10', 'area', '2502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17038', '大同县', '2502.9', 'area', '2503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17037', '左云县', '2502.8', 'area', '2503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17036', '浑源县', '2502.7', 'area', '2503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17035', '灵丘县', '2502.6', 'area', '2503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17034', '广灵县', '2502.5', 'area', '2503', '2');
INSERT INTO `dx_cascadedata` VALUES ('17033', '天镇县', '2502.4', 'area', '2502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17032', '阳高县', '2502.3', 'area', '2502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17031', '新荣区', '2502.2', 'area', '2502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17030', '南郊区', '2502.1', 'area', '2502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17029', '大同市', '2502', 'area', '2502', '1');
INSERT INTO `dx_cascadedata` VALUES ('17028', '古交市', '2501.10', 'area', '2501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17027', '娄烦县', '2501.9', 'area', '2502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17026', '阳曲县', '2501.8', 'area', '2502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17025', '清徐县', '2501.7', 'area', '2502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17024', '晋源区', '2501.6', 'area', '2502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17023', '万柏林区', '2501.5', 'area', '2502', '2');
INSERT INTO `dx_cascadedata` VALUES ('17022', '尖草坪区', '2501.4', 'area', '2501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17021', '杏花岭区', '2501.3', 'area', '2501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17020', '迎泽区', '2501.2', 'area', '2501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17019', '小店区', '2501.1', 'area', '2501', '2');
INSERT INTO `dx_cascadedata` VALUES ('17018', '太原市', '2501', 'area', '2501', '1');
INSERT INTO `dx_cascadedata` VALUES ('17017', '山西省', '2500', 'area', '2500', '0');
INSERT INTO `dx_cascadedata` VALUES ('17016', '河间市', '2011.16', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17015', '黄骅市', '2011.15', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17014', '任丘市', '2011.14', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17013', '泊头市', '2011.13', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17012', '孟村回族自治县', '2011.12', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17011', '献　县', '2011.11', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17010', '吴桥县', '2011.10', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17009', '南皮县', '2011.9', 'area', '2012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17008', '肃宁县', '2011.8', 'area', '2012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17007', '盐山县', '2011.7', 'area', '2012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17006', '海兴县', '2011.6', 'area', '2012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17005', '东光县', '2011.5', 'area', '2012', '2');
INSERT INTO `dx_cascadedata` VALUES ('17004', '青　县', '2011.4', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17003', '沧　县', '2011.3', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17002', '运河区', '2011.2', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17001', '新华区', '2011.1', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('17000', '沧州市', '2011', 'area', '2011', '1');
INSERT INTO `dx_cascadedata` VALUES ('16999', '深州市', '2010.11', 'area', '2010', '2');
INSERT INTO `dx_cascadedata` VALUES ('16998', '冀州市', '2010.10', 'area', '2010', '2');
INSERT INTO `dx_cascadedata` VALUES ('16997', '阜城县', '2010.9', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('16996', '景　县', '2010.8', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('16995', '故城县', '2010.7', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('16994', '安平县', '2010.6', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('16993', '饶阳县', '2010.5', 'area', '2011', '2');
INSERT INTO `dx_cascadedata` VALUES ('16992', '武强县', '2010.4', 'area', '2010', '2');
INSERT INTO `dx_cascadedata` VALUES ('16991', '武邑县', '2010.3', 'area', '2010', '2');
INSERT INTO `dx_cascadedata` VALUES ('16990', '枣强县', '2010.2', 'area', '2010', '2');
INSERT INTO `dx_cascadedata` VALUES ('16989', '桃城区', '2010.1', 'area', '2010', '2');
INSERT INTO `dx_cascadedata` VALUES ('16988', '衡水市', '2010', 'area', '2010', '1');
INSERT INTO `dx_cascadedata` VALUES ('16987', '三河市', '2009.10', 'area', '2009', '2');
INSERT INTO `dx_cascadedata` VALUES ('16986', '霸州市', '2009.9', 'area', '2010', '2');
INSERT INTO `dx_cascadedata` VALUES ('16985', '大厂回族自治县', '2009.8', 'area', '2010', '2');
INSERT INTO `dx_cascadedata` VALUES ('16984', '文安县', '2009.7', 'area', '2010', '2');
INSERT INTO `dx_cascadedata` VALUES ('16983', '大城县', '2009.6', 'area', '2010', '2');
INSERT INTO `dx_cascadedata` VALUES ('16982', '香河县', '2009.5', 'area', '2010', '2');
INSERT INTO `dx_cascadedata` VALUES ('16981', '永清县', '2009.4', 'area', '2009', '2');
INSERT INTO `dx_cascadedata` VALUES ('16980', '固安县', '2009.3', 'area', '2009', '2');
INSERT INTO `dx_cascadedata` VALUES ('16979', '广阳区', '2009.2', 'area', '2009', '2');
INSERT INTO `dx_cascadedata` VALUES ('16978', '安次区', '2009.1', 'area', '2009', '2');
INSERT INTO `dx_cascadedata` VALUES ('16977', '廊坊市', '2009', 'area', '2009', '1');
INSERT INTO `dx_cascadedata` VALUES ('16976', ' 围场满族蒙古族自治县', '2008.11', 'area', '2008', '2');
INSERT INTO `dx_cascadedata` VALUES ('16975', '宽城满族自治', '2008.10', 'area', '2008', '2');
INSERT INTO `dx_cascadedata` VALUES ('16974', '丰宁满族自治县', '2008.9', 'area', '2009', '2');
INSERT INTO `dx_cascadedata` VALUES ('16973', '隆化县', '2008.8', 'area', '2009', '2');
INSERT INTO `dx_cascadedata` VALUES ('16972', '滦平县', '2008.7', 'area', '2009', '2');
INSERT INTO `dx_cascadedata` VALUES ('16971', '平泉县', '2008.6', 'area', '2009', '2');
INSERT INTO `dx_cascadedata` VALUES ('16970', '兴隆县', '2008.5', 'area', '2009', '2');
INSERT INTO `dx_cascadedata` VALUES ('16969', '承德县', '2008.4', 'area', '2008', '2');
INSERT INTO `dx_cascadedata` VALUES ('16968', '鹰手营子矿区', '2008.3', 'area', '2008', '2');
INSERT INTO `dx_cascadedata` VALUES ('16967', '双滦区', '2008.2', 'area', '2008', '2');
INSERT INTO `dx_cascadedata` VALUES ('16966', '双桥区', '2008.1', 'area', '2008', '2');
INSERT INTO `dx_cascadedata` VALUES ('16965', '承德市', '2008', 'area', '2008', '1');
INSERT INTO `dx_cascadedata` VALUES ('16964', '崇礼县', '2007.17', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16963', '赤城县', '2007.16', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16962', '涿鹿县', '2007.15', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16961', '怀来县', '2007.14', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16960', '万全县', '2007.13', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16959', '怀安县', '2007.12', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16958', '阳原县', '2007.11', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16957', '蔚　县', '2007.10', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16956', '尚义县', '2007.9', 'area', '2008', '2');
INSERT INTO `dx_cascadedata` VALUES ('16955', '沽源县', '2007.8', 'area', '2008', '2');
INSERT INTO `dx_cascadedata` VALUES ('16954', '康保县', '2007.7', 'area', '2008', '2');
INSERT INTO `dx_cascadedata` VALUES ('16953', '张北县', '2007.6', 'area', '2008', '2');
INSERT INTO `dx_cascadedata` VALUES ('16952', '宣化县', '2007.5', 'area', '2008', '2');
INSERT INTO `dx_cascadedata` VALUES ('16951', '下花园区', '2007.4', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16950', '宣化区', '2007.3', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16949', '桥西区', '2007.2', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16948', '桥东区', '2007.1', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16947', '张家口市', '2007', 'area', '2007', '1');
INSERT INTO `dx_cascadedata` VALUES ('16946', '高碑店市', '2006.25', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16945', '安国市', '2006.24', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16944', '定州市', '2006.23', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16943', '涿州市', '2006.22', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16942', '雄　县', '2006.21', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16941', '博野县', '2006.20', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16940', '顺平县', '2006.19', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16939', '蠡　县', '2006.18', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16938', '曲阳县', '2006.17', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16937', '易县', '2006.16', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16936', '安新县', '2006.15', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16935', '望都县', '2006.14', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16934', '涞源县', '2006.13', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16933', '容城县', '2006.12', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16932', '高阳县', '2006.11', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16931', '唐　县', '2006.10', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16930', '定兴县', '2006.9', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16929', '徐水县', '2006.8', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16928', '阜平县', '2006.7', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16927', '涞水县', '2006.6', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16926', '清苑县', '2006.5', 'area', '2007', '2');
INSERT INTO `dx_cascadedata` VALUES ('16925', '满城县', '2006.4', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16924', '南市区', '2006.3', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16923', '北市区', '2006.2', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16922', '新市区', '2006.1', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16921', '保定市', '2006', 'area', '2006', '1');
INSERT INTO `dx_cascadedata` VALUES ('16920', '沙河市', '2005.19', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16919', '南宫市', '2005.18', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16918', '临西县', '2005.17', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16917', '清河县', '2005.16', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16916', '威　县', '2005.15', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16915', '平乡县', '2005.14', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16914', '广宗县', '2005.13', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16913', '新河县', '2005.12', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16912', '巨鹿县', '2005.11', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16911', '宁晋县', '2005.10', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16910', '南和县', '2005.9', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16909', '任　县', '2005.8', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16908', '隆尧县', '2005.7', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16907', '柏乡县', '2005.6', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16906', '内丘县', '2005.5', 'area', '2006', '2');
INSERT INTO `dx_cascadedata` VALUES ('16905', '临城县', '2005.4', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16904', '邢台县', '2005.3', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16903', '桥西区', '2005.2', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16902', '桥东区', '2005.1', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16901', '邢台市', '2005', 'area', '2005', '1');
INSERT INTO `dx_cascadedata` VALUES ('16900', '武安市', '2004.20', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16899', '曲周县', '2004.19', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16898', '魏县', '2004.18', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16897', '馆陶县', '2004.17', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16896', '广平县', '2004.16', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16895', '鸡泽县', '2004.15', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16894', '邱　县', '2004.14', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16893', '永年县', '2004.13', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16892', '肥乡县', '2004.12', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16891', '磁　县', '2004.11', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16890', '涉　县', '2004.10', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16889', '大名县', '2004.9', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16888', '成安县', '2004.8', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16887', '临漳县', '2004.7', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16886', '邯郸县', '2004.6', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16885', '峰峰矿区', '2004.5', 'area', '2005', '2');
INSERT INTO `dx_cascadedata` VALUES ('16884', '复兴区', '2004.4', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16883', '丛台区', '2004.3', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16882', '邯山区', '2004.2', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16881', '市辖区', '2004.1', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16880', '邯郸市', '2004', 'area', '2004', '1');
INSERT INTO `dx_cascadedata` VALUES ('16879', '卢龙县', '2003.7', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16878', '抚宁县', '2003.6', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16877', '昌黎县', '2003.5', 'area', '2004', '2');
INSERT INTO `dx_cascadedata` VALUES ('16876', '青龙满族自治县', '2003.4', 'area', '2003', '2');
INSERT INTO `dx_cascadedata` VALUES ('16875', '北戴河区', '2003.3', 'area', '2003', '2');
INSERT INTO `dx_cascadedata` VALUES ('16874', '山海关区', '2003.2', 'area', '2003', '2');
INSERT INTO `dx_cascadedata` VALUES ('16873', '海港区', '2003.1', 'area', '2003', '2');
INSERT INTO `dx_cascadedata` VALUES ('16872', '秦皇岛市', '2003', 'area', '2003', '1');
INSERT INTO `dx_cascadedata` VALUES ('16871', '迁安市', '2002.14', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16870', '遵化市', '2002.13', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16869', '唐海县', '2002.12', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16868', '玉田县', '2002.11', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16867', '迁西县', '2002.10', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16866', '乐亭县', '2002.9', 'area', '2003', '2');
INSERT INTO `dx_cascadedata` VALUES ('16865', '滦南县', '2002.8', 'area', '2003', '2');
INSERT INTO `dx_cascadedata` VALUES ('16864', '滦　县', '2002.7', 'area', '2003', '2');
INSERT INTO `dx_cascadedata` VALUES ('16863', '丰润区', '2002.6', 'area', '2003', '2');
INSERT INTO `dx_cascadedata` VALUES ('16862', '丰南区', '2002.5', 'area', '2003', '2');
INSERT INTO `dx_cascadedata` VALUES ('16861', '开平区', '2002.4', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16860', '古冶区', '2002.3', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16859', '路北区', '2002.2', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16858', '路南区', '2002.1', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16857', '唐山市', '2002', 'area', '2002', '1');
INSERT INTO `dx_cascadedata` VALUES ('16856', '鹿泉市', '2001.23', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16855', '新乐市', '2001.22', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16854', '晋州市', '2001.21', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16853', '藁城市', '2001.20', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16852', '辛集市', '2001.19', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16851', '赵　县', '2001.18', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16850', '元氏县', '2001.17', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16849', '平山县', '2001.16', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16848', '无极县', '2001.15', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16847', '赞皇县', '2001.14', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16846', '深泽县', '2001.13', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16845', '高邑县', '2001.12', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16844', '灵寿县', '2001.11', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16843', '行唐县', '2001.10', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16842', '栾城县', '2001.9', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16841', '正定县', '2001.8', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16840', '井陉县', '2001.7', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16839', '裕华区', '2001.6', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16838', '井陉矿区', '2001.5', 'area', '2002', '2');
INSERT INTO `dx_cascadedata` VALUES ('16837', '新华区', '2001.4', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16836', '桥西区', '2001.3', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16835', '桥东区', '2001.2', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16834', '长安区', '2001.1', 'area', '2001', '2');
INSERT INTO `dx_cascadedata` VALUES ('16833', '石家庄市', '2001', 'area', '2001', '1');
INSERT INTO `dx_cascadedata` VALUES ('16832', '河北省', '2000', 'area', '2000', '0');
INSERT INTO `dx_cascadedata` VALUES ('16831', '蓟　县', '1518', 'area', '1518', '1');
INSERT INTO `dx_cascadedata` VALUES ('16830', '静海县', '1517', 'area', '1517', '1');
INSERT INTO `dx_cascadedata` VALUES ('16829', '宁河县', '1516', 'area', '1516', '1');
INSERT INTO `dx_cascadedata` VALUES ('16828', '宝坻区', '1515', 'area', '1515', '1');
INSERT INTO `dx_cascadedata` VALUES ('16827', '武清区', '1514', 'area', '1514', '1');
INSERT INTO `dx_cascadedata` VALUES ('16826', '北辰区', '1513', 'area', '1513', '1');
INSERT INTO `dx_cascadedata` VALUES ('16825', '津南区', '1512', 'area', '1512', '1');
INSERT INTO `dx_cascadedata` VALUES ('16824', '西青区', '1511', 'area', '1511', '1');
INSERT INTO `dx_cascadedata` VALUES ('16823', '东丽区', '1510', 'area', '1510', '1');
INSERT INTO `dx_cascadedata` VALUES ('16822', '大港区', '1509', 'area', '1509', '1');
INSERT INTO `dx_cascadedata` VALUES ('16821', '汉沽区', '1508', 'area', '1508', '1');
INSERT INTO `dx_cascadedata` VALUES ('16820', '塘沽区', '1507', 'area', '1507', '1');
INSERT INTO `dx_cascadedata` VALUES ('16819', '红桥区', '1506', 'area', '1506', '1');
INSERT INTO `dx_cascadedata` VALUES ('16818', '河北区', '1505', 'area', '1505', '1');
INSERT INTO `dx_cascadedata` VALUES ('16817', '南开区', '1504', 'area', '1504', '1');
INSERT INTO `dx_cascadedata` VALUES ('16816', '河西区', '1503', 'area', '1503', '1');
INSERT INTO `dx_cascadedata` VALUES ('16815', '河东区', '1502', 'area', '1502', '1');
INSERT INTO `dx_cascadedata` VALUES ('16814', '和平区', '1501', 'area', '1501', '1');
INSERT INTO `dx_cascadedata` VALUES ('16813', '天津市', '1500', 'area', '1500', '0');
INSERT INTO `dx_cascadedata` VALUES ('16812', '延庆县', '1018', 'area', '1018', '1');
INSERT INTO `dx_cascadedata` VALUES ('16811', '密云县', '1017', 'area', '1017', '1');
INSERT INTO `dx_cascadedata` VALUES ('16810', '平谷区', '1016', 'area', '1016', '1');
INSERT INTO `dx_cascadedata` VALUES ('16809', '怀柔区', '1015', 'area', '1015', '1');
INSERT INTO `dx_cascadedata` VALUES ('16808', '大兴区', '1014', 'area', '1014', '1');
INSERT INTO `dx_cascadedata` VALUES ('16807', '昌平区', '1013', 'area', '1013', '1');
INSERT INTO `dx_cascadedata` VALUES ('16806', '顺义区', '1012', 'area', '1012', '1');
INSERT INTO `dx_cascadedata` VALUES ('16805', '通州区', '1011', 'area', '1011', '1');
INSERT INTO `dx_cascadedata` VALUES ('16804', '房山区', '1010', 'area', '1010', '1');
INSERT INTO `dx_cascadedata` VALUES ('16803', '门头沟区', '1009', 'area', '1009', '1');
INSERT INTO `dx_cascadedata` VALUES ('16802', '海淀区', '1008', 'area', '1008', '1');
INSERT INTO `dx_cascadedata` VALUES ('16801', '石景山区', '1007', 'area', '1007', '1');
INSERT INTO `dx_cascadedata` VALUES ('16800', '丰台区', '1006', 'area', '1006', '1');
INSERT INTO `dx_cascadedata` VALUES ('16799', '朝阳区', '1005', 'area', '1005', '1');
INSERT INTO `dx_cascadedata` VALUES ('16798', '宣武区', '1004', 'area', '1004', '1');
INSERT INTO `dx_cascadedata` VALUES ('16797', '崇文区', '1003', 'area', '1003', '1');
INSERT INTO `dx_cascadedata` VALUES ('16796', '西城区', '1002', 'area', '1002', '1');
INSERT INTO `dx_cascadedata` VALUES ('16795', '东城区', '1001', 'area', '1001', '1');
INSERT INTO `dx_cascadedata` VALUES ('16794', '北京市', '1000', 'area', '1000', '0');
INSERT INTO `dx_cascadedata` VALUES ('1', '白羊座', '1', 'astro', '1', '0');
INSERT INTO `dx_cascadedata` VALUES ('2', '金牛座', '2', 'astro', '2', '0');
INSERT INTO `dx_cascadedata` VALUES ('3', '双子座', '3', 'astro', '3', '0');
INSERT INTO `dx_cascadedata` VALUES ('4', '巨蟹座', '4', 'astro', '4', '0');
INSERT INTO `dx_cascadedata` VALUES ('5', '狮子座', '5', 'astro', '5', '0');
INSERT INTO `dx_cascadedata` VALUES ('6', '处女座', '6', 'astro', '6', '0');
INSERT INTO `dx_cascadedata` VALUES ('7', '天枰座', '7', 'astro', '7', '0');
INSERT INTO `dx_cascadedata` VALUES ('8', '天蝎座', '8', 'astro', '8', '0');
INSERT INTO `dx_cascadedata` VALUES ('9', '射手座', '9', 'astro', '9', '0');
INSERT INTO `dx_cascadedata` VALUES ('10', '摩羯座', '10', 'astro', '10', '0');
INSERT INTO `dx_cascadedata` VALUES ('11', '水瓶座', '11', 'astro', '11', '0');
INSERT INTO `dx_cascadedata` VALUES ('12', '双鱼座', '12', 'astro', '12', '0');
INSERT INTO `dx_cascadedata` VALUES ('13', 'A型', '1', 'bloodtype', '1', '0');
INSERT INTO `dx_cascadedata` VALUES ('14', 'B型', '2', 'bloodtype', '2', '0');
INSERT INTO `dx_cascadedata` VALUES ('15', 'O型', '3', 'bloodtype', '3', '0');
INSERT INTO `dx_cascadedata` VALUES ('16', 'AB型', '4', 'bloodtype', '4', '0');
INSERT INTO `dx_cascadedata` VALUES ('17', '其他', '5', 'bloodtype', '5', '0');
INSERT INTO `dx_cascadedata` VALUES ('18', '身份证', '1', 'cardtype', '1', '0');
INSERT INTO `dx_cascadedata` VALUES ('19', '护照', '2', 'cardtype', '2', '0');
INSERT INTO `dx_cascadedata` VALUES ('20', '驾驶证', '3', 'cardtype', '3', '0');
INSERT INTO `dx_cascadedata` VALUES ('21', '无安全提问', '0', 'question', '1', '0');
INSERT INTO `dx_cascadedata` VALUES ('22', '母亲的名字', '1', 'question', '2', '0');
INSERT INTO `dx_cascadedata` VALUES ('23', '爷爷的名字', '2', 'question', '3', '0');
INSERT INTO `dx_cascadedata` VALUES ('24', '父亲出生的城市', '3', 'question', '4', '0');
INSERT INTO `dx_cascadedata` VALUES ('25', '你其中一位老师的名字', '4', 'question', '5', '0');
INSERT INTO `dx_cascadedata` VALUES ('26', '你个人计算机的型号', '5', 'question', '6', '0');
INSERT INTO `dx_cascadedata` VALUES ('27', '你最喜欢的餐馆名称', '6', 'question', '7', '0');
INSERT INTO `dx_cascadedata` VALUES ('28', '驾驶执照最后四位数字', '7', 'question', '8', '0');
INSERT INTO `dx_cascadedata` VALUES ('29', 'IT信息技术', '1', 'trade', '1', '0');
INSERT INTO `dx_cascadedata` VALUES ('30', '金融', '2', 'trade', '2', '0');
INSERT INTO `dx_cascadedata` VALUES ('31', '互联网', '3', 'trade', '3', '0');
INSERT INTO `dx_cascadedata` VALUES ('32', '广告传媒', '4', 'trade', '4', '0');
INSERT INTO `dx_cascadedata` VALUES ('33', '贸易零售', '5', 'trade', '5', '0');
INSERT INTO `dx_cascadedata` VALUES ('34', '交通物流', '6', 'trade', '6', '0');
INSERT INTO `dx_cascadedata` VALUES ('35', '房地产', '7', 'trade', '7', '0');
INSERT INTO `dx_cascadedata` VALUES ('36', '旅游餐饮', '8', 'trade', '8', '0');
INSERT INTO `dx_cascadedata` VALUES ('37', '加工制造业', '9', 'trade', '9', '0');
INSERT INTO `dx_cascadedata` VALUES ('38', '石化采掘', '10', 'trade', '10', '0');
INSERT INTO `dx_cascadedata` VALUES ('39', '农林牧渔', '11', 'trade', '11', '0');
INSERT INTO `dx_cascadedata` VALUES ('40', '社会服务', '12', 'trade', '12', '0');
INSERT INTO `dx_cascadedata` VALUES ('41', '医药生物', '13', 'trade', '13', '0');
INSERT INTO `dx_cascadedata` VALUES ('42', '教育培训科研', '14', 'trade', '14', '0');
INSERT INTO `dx_cascadedata` VALUES ('20021', '西安', '1', 'remen', '1', '0');
INSERT INTO `dx_cascadedata` VALUES ('20022', '韩国', '2', 'remen', '2', '0');
INSERT INTO `dx_cascadedata` VALUES ('20023', '泰国', '3', 'remen', '3', '0');
INSERT INTO `dx_cascadedata` VALUES ('20024', '凤凰', '4', 'remen', '4', '0');
INSERT INTO `dx_cascadedata` VALUES ('20025', '九寨', '5', 'remen', '5', '0');
INSERT INTO `dx_cascadedata` VALUES ('20026', '苏沪杭', '6', 'remen', '6', '0');
INSERT INTO `dx_cascadedata` VALUES ('20027', '云台山', '7', 'remen', '7', '0');
INSERT INTO `dx_cascadedata` VALUES ('20028', '马尔代夫', '8', 'remen', '8', '0');
INSERT INTO `dx_cascadedata` VALUES ('20029', '世纪欢乐园', '9', 'remen', '9', '0');
INSERT INTO `dx_cascadedata` VALUES ('20030', '港澳', '10', 'remen', '10', '0');

-- ----------------------------
-- Table structure for `dx_diyfield`
-- ----------------------------
DROP TABLE IF EXISTS `dx_diyfield`;
CREATE TABLE `dx_diyfield` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '自定义字段id',
  `infotype` tinyint(1) unsigned NOT NULL COMMENT '所属模型',
  `catepriv` varchar(255) NOT NULL COMMENT '所属栏目',
  `fieldname` varchar(30) NOT NULL COMMENT '字段名称',
  `fieldtitle` varchar(30) NOT NULL COMMENT '字段标题',
  `fielddesc` varchar(255) NOT NULL COMMENT '字段提示',
  `fieldtype` varchar(30) NOT NULL COMMENT '字段类型',
  `fieldlong` varchar(10) NOT NULL COMMENT '字段长度',
  `fieldsel` varchar(255) NOT NULL COMMENT '字段选项值',
  `fieldcheck` varchar(80) NOT NULL COMMENT '校验正则',
  `fieldcback` varchar(30) NOT NULL COMMENT '未通过提示',
  `orderid` smallint(6) NOT NULL COMMENT '排列排序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_diyfield
-- ----------------------------
INSERT INTO `dx_diyfield` VALUES ('1', '2', '2,16,3,4,5,17,18,19,20,21,22,23,24,25,26,27', 'price', '价格', '每人单价, 单位元', 'decimal', '10,2', '', '', '', '1', 'true');
INSERT INTO `dx_diyfield` VALUES ('2', '0', '6,7', 'hits', '点击次数', '', 'int', '8', '', '', '', '2', 'true');

-- ----------------------------
-- Table structure for `dx_diymenu`
-- ----------------------------
DROP TABLE IF EXISTS `dx_diymenu`;
CREATE TABLE `dx_diymenu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自定义菜单id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `parentid` smallint(5) unsigned NOT NULL COMMENT '所属菜单id',
  `classname` varchar(30) NOT NULL COMMENT '菜单项名称',
  `linkurl` varchar(255) NOT NULL COMMENT '跳转链接',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_diymenu
-- ----------------------------
INSERT INTO `dx_diymenu` VALUES ('1', '1', '0', '旅游线路', '', '1', 'true');
INSERT INTO `dx_diymenu` VALUES ('2', '1', '1', '洛阳周边', 'modeldata_add.php?m=lvyou&cid=1', '2', 'true');

-- ----------------------------
-- Table structure for `dx_diymodel`
-- ----------------------------
DROP TABLE IF EXISTS `dx_diymodel`;
CREATE TABLE `dx_diymodel` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '自定义模型id',
  `modeltitle` varchar(30) NOT NULL COMMENT '模型标题',
  `modelname` varchar(30) NOT NULL COMMENT '模型名称',
  `modeltbname` varchar(30) NOT NULL COMMENT '模型表名',
  `defaultfield` varchar(80) NOT NULL COMMENT '预设栏目',
  `orderid` smallint(6) NOT NULL COMMENT '排列排序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_diymodel
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_failedlogin`
-- ----------------------------
DROP TABLE IF EXISTS `dx_failedlogin`;
CREATE TABLE `dx_failedlogin` (
  `username` char(30) NOT NULL COMMENT '用户名',
  `ip` char(15) NOT NULL COMMENT '登录IP',
  `time` int(10) unsigned NOT NULL COMMENT '登录时间',
  `num` tinyint(1) NOT NULL COMMENT '失败次数',
  `isadmin` tinyint(1) NOT NULL COMMENT '是否是管理员',
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_failedlogin
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_fragment`
-- ----------------------------
DROP TABLE IF EXISTS `dx_fragment`;
CREATE TABLE `dx_fragment` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '碎片数据id',
  `title` varchar(30) NOT NULL COMMENT '碎片数据名称',
  `picurl` varchar(80) NOT NULL COMMENT '碎片数据缩略图',
  `linkurl` varchar(80) NOT NULL COMMENT '碎片数据连接',
  `content` mediumtext NOT NULL COMMENT '碎片数据内容',
  `posttime` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_fragment
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_getmode`
-- ----------------------------
DROP TABLE IF EXISTS `dx_getmode`;
CREATE TABLE `dx_getmode` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '货到方式id',
  `classname` varchar(30) NOT NULL COMMENT '货到方式名称',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_getmode
-- ----------------------------
INSERT INTO `dx_getmode` VALUES ('1', '送货上门', '1', 'true');
INSERT INTO `dx_getmode` VALUES ('2', '用户自取', '2', 'true');

-- ----------------------------
-- Table structure for `dx_goods`
-- ----------------------------
DROP TABLE IF EXISTS `dx_goods`;
CREATE TABLE `dx_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `classid` smallint(5) unsigned NOT NULL COMMENT '所属栏目',
  `parentid` smallint(5) unsigned NOT NULL COMMENT '所属栏目父id',
  `parentstr` varchar(80) NOT NULL COMMENT '所属栏目父id字符串',
  `typeid` smallint(5) unsigned NOT NULL COMMENT '商品分类',
  `typepid` smallint(5) unsigned NOT NULL COMMENT '商品分类父id',
  `typepstr` varchar(80) NOT NULL COMMENT '商品分类父id字符串',
  `brandid` smallint(5) NOT NULL COMMENT '商品品牌id',
  `brandpid` smallint(5) NOT NULL COMMENT '品牌上级id',
  `brandpstr` varchar(80) NOT NULL COMMENT '品牌上级id字符串',
  `title` varchar(80) NOT NULL COMMENT '商品名称',
  `colorval` char(10) NOT NULL COMMENT '标题颜色',
  `boldval` char(10) NOT NULL COMMENT '标题加粗',
  `flag` varchar(30) NOT NULL COMMENT '属性',
  `goodsid` varchar(30) NOT NULL COMMENT '货号',
  `payfreight` enum('0','1') NOT NULL COMMENT '运费承担',
  `weight` varchar(10) NOT NULL COMMENT '重量',
  `attrstr` text NOT NULL COMMENT '属性字符串',
  `marketprice` char(10) NOT NULL COMMENT '市场价格',
  `salesprice` char(10) NOT NULL COMMENT '销售价格',
  `housenum` smallint(5) unsigned NOT NULL COMMENT '库存数量',
  `housewarn` enum('true','false') NOT NULL COMMENT '库存警告',
  `warnnum` smallint(5) unsigned NOT NULL COMMENT '警告数量',
  `integral` char(10) NOT NULL COMMENT '积分点数',
  `source` varchar(50) NOT NULL COMMENT '文章来源',
  `author` varchar(50) NOT NULL COMMENT '作者编辑',
  `linkurl` varchar(255) NOT NULL COMMENT '跳转链接',
  `keywords` varchar(30) NOT NULL COMMENT '关键词',
  `description` varchar(255) NOT NULL COMMENT '摘要',
  `content` mediumtext NOT NULL COMMENT '详细内容',
  `picurl` varchar(100) NOT NULL COMMENT '缩略图片',
  `picarr` text NOT NULL COMMENT '组图',
  `hits` int(10) unsigned NOT NULL COMMENT '点击次数',
  `orderid` int(10) unsigned NOT NULL COMMENT '排列排序',
  `posttime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  `delstate` set('true') NOT NULL COMMENT '删除状态',
  `deltime` int(10) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_goodsattr`
-- ----------------------------
DROP TABLE IF EXISTS `dx_goodsattr`;
CREATE TABLE `dx_goodsattr` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品属性id',
  `goodsid` smallint(5) unsigned NOT NULL COMMENT '所属分类',
  `attrname` varchar(30) NOT NULL COMMENT '属性名称',
  `orderid` mediumint(8) unsigned NOT NULL COMMENT '排列排序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_goodsattr
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_goodsbrand`
-- ----------------------------
DROP TABLE IF EXISTS `dx_goodsbrand`;
CREATE TABLE `dx_goodsbrand` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品品牌id',
  `parentid` mediumint(8) unsigned NOT NULL COMMENT '品牌上级id',
  `parentstr` varchar(50) NOT NULL COMMENT '品牌上级id字符串',
  `classname` varchar(30) NOT NULL COMMENT '品牌名称',
  `picurl` varchar(100) NOT NULL COMMENT '缩略图片',
  `linkurl` varchar(255) NOT NULL COMMENT '跳转链接',
  `orderid` mediumint(10) unsigned NOT NULL COMMENT '排列排序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_goodsbrand
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_goodsflag`
-- ----------------------------
DROP TABLE IF EXISTS `dx_goodsflag`;
CREATE TABLE `dx_goodsflag` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品标记id',
  `flag` varchar(30) NOT NULL COMMENT '标记名称',
  `flagname` varchar(30) NOT NULL COMMENT '标记标识',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_goodsflag
-- ----------------------------
INSERT INTO `dx_goodsflag` VALUES ('1', 'c', '推荐', '1');
INSERT INTO `dx_goodsflag` VALUES ('2', 'f', '幻灯', '2');
INSERT INTO `dx_goodsflag` VALUES ('3', 'a', '特推', '3');
INSERT INTO `dx_goodsflag` VALUES ('4', 't', '特价', '4');
INSERT INTO `dx_goodsflag` VALUES ('5', 'h', '热卖', '5');

-- ----------------------------
-- Table structure for `dx_goodsorder`
-- ----------------------------
DROP TABLE IF EXISTS `dx_goodsorder`;
CREATE TABLE `dx_goodsorder` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品订单id',
  `username` varchar(30) NOT NULL COMMENT '会员用户名',
  `attrstr` text NOT NULL COMMENT '商品列表',
  `truename` varchar(30) NOT NULL COMMENT '收货人姓名',
  `telephone` varchar(30) NOT NULL COMMENT '电话',
  `idcard` varchar(30) NOT NULL COMMENT '证件号码',
  `zipcode` varchar(30) NOT NULL COMMENT '邮编',
  `postarea_prov` varchar(10) NOT NULL COMMENT '配送地区_省',
  `postarea_city` varchar(10) NOT NULL COMMENT '配送地区_市',
  `postarea_country` varchar(10) NOT NULL COMMENT '配送地区_县',
  `address` varchar(80) NOT NULL COMMENT '地址',
  `postmode` smallint(5) NOT NULL COMMENT '配送方式',
  `paymode` smallint(5) NOT NULL COMMENT '支付方式',
  `getmode` smallint(5) NOT NULL COMMENT '货到方式',
  `ordernum` varchar(30) NOT NULL COMMENT '订单号',
  `postid` varchar(30) NOT NULL COMMENT '运单号',
  `weight` varchar(10) NOT NULL COMMENT '物品重量',
  `cost` varchar(10) NOT NULL COMMENT '商品运费',
  `amount` varchar(10) NOT NULL COMMENT '订单金额',
  `integral` smallint(5) unsigned NOT NULL COMMENT '积分点数',
  `buyremark` text NOT NULL COMMENT '购物备注',
  `sendremark` text NOT NULL COMMENT '发货方备注',
  `posttime` int(10) unsigned NOT NULL COMMENT '订单时间',
  `orderid` mediumint(10) unsigned NOT NULL COMMENT '排列排序',
  `checkinfo` varchar(255) NOT NULL COMMENT '审核状态',
  `core` set('true') NOT NULL COMMENT '是否加星',
  `delstate` set('true') NOT NULL COMMENT '删除状态',
  `deltime` int(10) unsigned NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_goodsorder
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_goodstype`
-- ----------------------------
DROP TABLE IF EXISTS `dx_goodstype`;
CREATE TABLE `dx_goodstype` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品类型id',
  `parentid` mediumint(8) unsigned NOT NULL COMMENT '类型上级id',
  `parentstr` varchar(50) NOT NULL COMMENT '类型上级id字符串',
  `classname` varchar(30) NOT NULL COMMENT '类别名称',
  `picurl` varchar(255) DEFAULT NULL COMMENT '缩略图片',
  `linkurl` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `orderid` mediumint(8) unsigned NOT NULL COMMENT '排列顺序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '隐藏类别',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_goodstype
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_info`
-- ----------------------------
DROP TABLE IF EXISTS `dx_info`;
CREATE TABLE `dx_info` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '单页id',
  `classid` smallint(5) unsigned NOT NULL COMMENT '所属栏目id',
  `mainid` smallint(5) NOT NULL COMMENT '二级类别id',
  `picurl` varchar(100) NOT NULL COMMENT '缩略图片',
  `content` mediumtext NOT NULL COMMENT '内容',
  `posttime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `hits` int(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_info
-- ----------------------------
INSERT INTO `dx_info` VALUES ('1', '6', '-1', '', '<strong style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;white-space:normal;\">护照签证</strong><strong style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;white-space:normal;\">护照签证</strong><strong style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;white-space:normal;\">护照签证</strong><strong style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;white-space:normal;\">护照签证</strong>', '1426672650', '16');
INSERT INTO `dx_info` VALUES ('2', '28', '-1', 'uploads/image/20150320/1426830570.jpg', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n洛阳舒翔假期旅行社有限公司成立于2012年，目前是中国旅游协会（CTA）、中国旅行社协会（CATS）。国际航空运输协会（IATA）的正式会员。公司成立以来，坚持以优质的服务、卓越的信誉和赖以强大的综合实力，赢得了越来越多客户的信任，成功地在业界中脱颖而出，成为洛阳地区旅游行业的一支新秀。\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n公司主要经营项目包括：招揽、接待外国旅行者、海外华侨、港澳台同胞到中国旅游观光、考察；组织和接待中国公民出境及国内观光旅游业务；接受订机、车票、订房等各类单项委托业务；同事可为大型国际、国内会议提供接待及租车服务。公司与国内外数百家实力雄厚的旅游公司的密切关系是我社迅猛发展的有力保证。年轻、精干、诚实、团结的业务队伍，踏实、谦虚、勤奋、负责的敬业精神是我社发展壮大的基础条件和资本；训练有素、经验丰富的各种翻译导游队伍是我社提供一流服务，赢得良好信誉的前提和保障。在各位同行及广大游客的支持下，洛阳舒翔假期旅行社正在蓬勃发展中，我们期待能为您服务！\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n企业宗旨：认真服务好每一位客人<br />\r\n<br />\r\n企业精神：认真做好每一件事<br />\r\n<br />\r\n座 右 铭：细节决定成败<br />\r\n<br />\r\n行为准则：团结友善、忠诚企业、勇于创新、诚实守信；\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n工作作风：认真、主动、高效、负责；<br />\r\n<br />\r\n团队意识：团结、宽容、拼搏、奉献；\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n核心价值观：为游客提供优质、完美的旅游服务\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"color:#800080;\"><span style=\"font-size:18px;\"><strong>我不能给您最低的价格</strong></span></span> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"color:#800080;\"><span style=\"font-size:18px;\"><strong>只能给您最高的品质</strong></span></span> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"color:#800080;\"><span style=\"font-size:18px;\"><strong>我宁可为价格解释一阵子</strong></span></span> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"color:#800080;\"><span style=\"font-size:18px;\"><strong>也不愿为质量道歉一辈子</strong></span></span> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<strong>联系方式：</strong> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n电话：0379-65296860 65297860\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n传真：0379-65596008\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\nQQ：团队83895613 &nbsp; &nbsp;545167822\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n散客1019127158\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n24小时监督热线：18736322037 &nbsp;18613798628 &nbsp;秦振伟\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n地址：洛阳市西工区七一路九州大厦1019室\r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"font-size:18px;\"><strong>公司部分直营店地址：</strong></span> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"font-size:20px;\"><strong><span style=\"color:#FF0000;\">孟津部</span></strong></span> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"color:#000000;\"><span style=\"font-size:18px;\"><span style=\"font-size:14px;\"><span style=\"font-size:16px;\">孟津桂花大道中段黄河宾馆2楼</span></span></span></span> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"color:#000000;\">传真：0379-67913793</span> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"color:#000000;\">负责人：姚经理 15137996860</span> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"color:#FF0000;\"><strong><span style=\"font-size:20px;\">吉利部</span></strong></span> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"color:#000000;\"><span style=\"font-size:18px;\">吉利区河阳路中段供销社一楼舒翔假期</span></span> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"color:#000000;\">负责人：13803796078</span> \r\n</p>\r\n<br />\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:14px;line-height:24px;color:#333333;font-family:宋体, arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<span style=\"color:#000000;\"> <br />\r\n	<iframe src=\"http://0379sx.demo.dx623.com/mgr/editor/plugins/baidumap/index.html?center=112.456727%2C34.673808&zoom=19&width=558&height=360&markers=112.456727%2C34.673808&markerStyles=l%2CA\" frameborder=\"0\" style=\"width:560px;height:362px;\">\r\n		&lt;br /&gt;\r\n	</iframe>\r\n<br />\r\n<br />\r\n<br />\r\n</span> \r\n</p>\r\n<br />', '1426840207', '9');

-- ----------------------------
-- Table structure for `dx_infoclass`
-- ----------------------------
DROP TABLE IF EXISTS `dx_infoclass`;
CREATE TABLE `dx_infoclass` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `parentid` smallint(5) unsigned NOT NULL COMMENT '栏目上级id',
  `parentstr` varchar(50) NOT NULL COMMENT '栏目上级id字符串',
  `infotype` tinyint(1) unsigned NOT NULL COMMENT '栏目类型',
  `classname` varchar(30) NOT NULL COMMENT '栏目名称',
  `linkurl` varchar(255) NOT NULL COMMENT '跳转链接',
  `picurl` varchar(100) NOT NULL COMMENT '缩略图片',
  `picwidth` varchar(5) NOT NULL COMMENT '缩略图宽度',
  `picheight` varchar(5) NOT NULL COMMENT '缩略图高度',
  `seotitle` varchar(80) NOT NULL COMMENT 'SEO标题',
  `keywords` varchar(50) NOT NULL COMMENT '关键词',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_infoclass
-- ----------------------------
INSERT INTO `dx_infoclass` VALUES ('2', '1', '0', '0,', '2', '旅游线路', '', '', '', '', '', '', '', '1', 'true');
INSERT INTO `dx_infoclass` VALUES ('3', '1', '2', '0,2,', '2', '洛阳周边', '', '', '', '', '', '', '', '3', 'true');
INSERT INTO `dx_infoclass` VALUES ('4', '1', '2', '0,2,', '2', '国内旅游', '', '', '', '', '', '', '', '4', 'true');
INSERT INTO `dx_infoclass` VALUES ('5', '1', '2', '0,2,', '2', '出境旅游', '', '', '', '', '', '', '', '5', 'true');
INSERT INTO `dx_infoclass` VALUES ('6', '1', '0', '0,', '0', '护照签证', '', '', '', '', '', '', '', '7', 'true');
INSERT INTO `dx_infoclass` VALUES ('7', '1', '0', '0,', '0', '旅游租车', '', '', '', '', '', '', '', '8', 'true');
INSERT INTO `dx_infoclass` VALUES ('8', '1', '0', '0,', '1', '旅游攻略', '', '', '', '', '', '', '', '9', 'true');
INSERT INTO `dx_infoclass` VALUES ('9', '1', '0', '0,', '1', '关于我们', '', '', '', '', '', '', '', '10', 'true');
INSERT INTO `dx_infoclass` VALUES ('10', '1', '0', '0,', '1', '帮助', '', '', '', '', '', '', '', '11', 'true');
INSERT INTO `dx_infoclass` VALUES ('11', '1', '0', '0,', '1', '网站公告', '', '', '', '', '', '', '', '12', 'true');
INSERT INTO `dx_infoclass` VALUES ('12', '1', '10', '0,10,', '1', '预定常见问题', '', '', '', '', '', '', '', '13', 'true');
INSERT INTO `dx_infoclass` VALUES ('13', '1', '10', '0,10,', '1', '付款和发票', '', '', '', '', '', '', '', '14', 'true');
INSERT INTO `dx_infoclass` VALUES ('14', '1', '10', '0,10,', '1', '签署旅游合同', '', '', '', '', '', '', '', '15', 'true');
INSERT INTO `dx_infoclass` VALUES ('15', '1', '10', '0,10,', '1', '其它事项', '', '', '', '', '', '', '', '16', 'true');
INSERT INTO `dx_infoclass` VALUES ('16', '1', '2', '0,2,', '2', '当季热门', '', '', '', '', '', '', '', '2', 'true');
INSERT INTO `dx_infoclass` VALUES ('17', '1', '2', '0,2,', '2', '特价旅游', '', '', '', '', '', '', '', '6', 'true');
INSERT INTO `dx_infoclass` VALUES ('18', '1', '3', '0,2,3,', '2', '少林', '', '', '', '', '', '', '', '17', 'true');
INSERT INTO `dx_infoclass` VALUES ('19', '1', '3', '0,2,3,', '2', '白马寺', '', '', '', '', '', '', '', '18', 'true');
INSERT INTO `dx_infoclass` VALUES ('20', '1', '3', '0,2,3,', '2', '牡丹园', '', '', '', '', '', '', '', '19', 'true');
INSERT INTO `dx_infoclass` VALUES ('21', '1', '3', '0,2,3,', '2', '龙门', '', '', '', '', '', '', '', '20', 'true');
INSERT INTO `dx_infoclass` VALUES ('22', '1', '3', '0,2,3,', '2', '龙潭峡', '', '', '', '', '', '', '', '21', 'true');
INSERT INTO `dx_infoclass` VALUES ('23', '1', '3', '0,2,3,', '2', '小浪底', '', '', '', '', '', '', '', '22', 'true');
INSERT INTO `dx_infoclass` VALUES ('24', '1', '16', '0,2,16,', '2', '新马泰', '', '', '', '', '', '', '', '23', 'true');
INSERT INTO `dx_infoclass` VALUES ('25', '1', '16', '0,2,16,', '2', '欧洲', '', '', '', '', '', '', '', '24', 'true');
INSERT INTO `dx_infoclass` VALUES ('26', '1', '16', '0,2,16,', '2', '香港', '', '', '', '', '', '', '', '25', 'true');
INSERT INTO `dx_infoclass` VALUES ('27', '1', '16', '0,2,16,', '2', '丽江', '', '', '', '', '', '', '', '26', 'true');
INSERT INTO `dx_infoclass` VALUES ('28', '1', '0', '0,', '0', '关于我们', '', '', '', '', '', '', '', '27', 'true');
INSERT INTO `dx_infoclass` VALUES ('29', '1', '0', '0,', '2', '团队风采', '', '', '', '', '', '', '', '28', 'true');

-- ----------------------------
-- Table structure for `dx_infoflag`
-- ----------------------------
DROP TABLE IF EXISTS `dx_infoflag`;
CREATE TABLE `dx_infoflag` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '信息标记id',
  `flag` varchar(30) NOT NULL COMMENT '标记名称',
  `flagname` varchar(30) NOT NULL COMMENT '标记标识',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_infoflag
-- ----------------------------
INSERT INTO `dx_infoflag` VALUES ('1', 'r', '热门旅游', '1');
INSERT INTO `dx_infoflag` VALUES ('2', 'z', '周末去哪儿', '2');

-- ----------------------------
-- Table structure for `dx_infoimg`
-- ----------------------------
DROP TABLE IF EXISTS `dx_infoimg`;
CREATE TABLE `dx_infoimg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片信息id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `classid` smallint(5) unsigned NOT NULL COMMENT '所属栏目id',
  `parentid` smallint(5) unsigned NOT NULL COMMENT '所属栏目上级id',
  `parentstr` varchar(80) NOT NULL COMMENT '所属栏目上级id字符串',
  `mainid` smallint(5) NOT NULL COMMENT '二级类别id',
  `mainpid` smallint(5) NOT NULL COMMENT '二级类别父id',
  `mainpstr` varchar(80) NOT NULL COMMENT '二级累呗父id字符串',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `colorval` char(10) NOT NULL COMMENT '字体颜色',
  `boldval` char(10) NOT NULL COMMENT '字体加粗',
  `flag` varchar(30) NOT NULL COMMENT '属性',
  `source` varchar(50) NOT NULL COMMENT '文章来源',
  `author` varchar(50) NOT NULL COMMENT '作者编辑',
  `linkurl` varchar(255) NOT NULL COMMENT '跳转链接',
  `keywords` varchar(50) NOT NULL COMMENT '关键词',
  `description` varchar(255) NOT NULL COMMENT '摘要',
  `content` mediumtext NOT NULL COMMENT '详细内容',
  `picurl` varchar(100) NOT NULL COMMENT '缩略图片',
  `picarr` text NOT NULL COMMENT '组图',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击次数',
  `orderid` int(10) unsigned NOT NULL COMMENT '排列排序',
  `posttime` int(10) NOT NULL COMMENT '更新时间',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  `delstate` set('true') NOT NULL COMMENT '删除状态',
  `deltime` int(10) unsigned NOT NULL COMMENT '删除时间',
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_infoimg
-- ----------------------------
INSERT INTO `dx_infoimg` VALUES ('1', '1', '18', '3', '0,2,3,', '-1', '-1', '', '少林寺+白马寺+牡丹一日游', '', '', 'r', '', 'admin', '', '', '', '<p style=\"text-align:center;\">\r\n	<img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426691819.png\" width=\"228\" height=\"231\" alt=\"\" style=\"line-height:1.5;\" /><img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426692285.png\" alt=\"\" width=\"226\" height=\"231\" title=\"\" align=\"\" style=\"line-height:1.5;\" /><img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426693567.png\" alt=\"\" width=\"237\" height=\"231\" title=\"\" align=\"\" style=\"line-height:1.5;\" /><span style=\"line-height:1.5;\"></span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"line-height:1.5;\"> </span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-size:15.0pt;font-family:宋体;color:#3333FF;\">行程安排：</span></b><b><span style=\"font-size:15.0pt;color:#3333FF;\"></span></b> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:29.5pt;\">\r\n	<b><span style=\"font-size:15.0pt;line-height:150%;font-family:宋体;color:blue;\">早<span>8</span>；<span>00</span>乘车赴少林寺景区游览，包括：（少林寺、 功夫表演、 塔林、），中餐后乘车赴中国第一座官办寺院——白马寺，参观结束后游览神州牡丹园国色天香的牡丹花，下午<span>6:30</span>左右返回古都洛阳。结束愉快旅程。</span></b><b><span style=\"font-size:15.0pt;line-height:150%;color:#1F497D;\"> <span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-size:15.0pt;color:red;\"> </span></b><b><span style=\"font-size:18.0pt;color:red;\"></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">服务标准：<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">门票：景点首道大门票<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">导游：全程优秀导游服务<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">餐：不含餐<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">交通：往返空调旅游车<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">保险：旅行社责任险<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">特别提醒：导游将在前一天晚上<span>19</span>：<span>00</span>前打电话给客人，告知集合时间，地点，车牌号！<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<u><span style=\"font-family:宋体;\">备注：</span></u><u><span>1.4</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">上儿童未持学生证的按成人收费；</span></u><u><span>1.2</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">至</span></u><u><span>1.4</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">儿童占车、保险费收取</span></u><u><span>60</span></u><u><span style=\"font-family:宋体;\">元</span></u><u><span>/</span></u><u><span style=\"font-family:宋体;\">人；</span></u><u><span>1.2</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">以下儿童每人收取</span></u><u><span>20</span></u><u><span style=\"font-family:宋体;\">元保险综合费。</span></u><u><span>70</span></u><u><span style=\"font-family:宋体;\">岁以上老年人</span></u><u><span>240</span></u><u><span style=\"font-family:宋体;\">元，</span></u><u><span>60-70</span></u><u><span style=\"font-family:宋体;\">岁老年人</span></u><u><span>290</span></u><u><span style=\"font-family:宋体;\">元！（儿童若虚报身高，产生一切费用由家长自理）</span></u><u><span></span></u> \r\n</p>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>', 'uploads/image/20150318/1426695729.jpg', '', '62', '1', '1426686273', 'true', '', '0', '340.00');
INSERT INTO `dx_infoimg` VALUES ('2', '1', '21', '3', '0,2,3,', '-1', '-1', '', '龙门石窟 + 白马寺一日游', '', '', 'r,z', '', 'admin', '', '', '', '<p style=\"text-align:center;\">\r\n	<img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426689029.png\" alt=\"\" width=\"276\" height=\"260\" title=\"\" align=\"\" style=\"line-height:1.5;\" /><img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426693567.png\" width=\"237\" height=\"231\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-size:15.0pt;font-family:宋体;\">早</span><span style=\"font-size:15.0pt;\">8:00</span><span style=\"font-size:15.0pt;font-family:宋体;\">乘车前往世界文化遗产之称的——龙门石窟参观，含（龙门石窟、香山寺、白园）。午餐后（餐费自理），乘车赴中国的第一个官办寺院白马寺，下午</span><span style=\"font-size:15.0pt;\">5:00</span><span style=\"font-size:15.0pt;font-family:宋体;\">左右返回古都洛阳，结束一天愉快旅程。</span><span style=\"font-size:15.0pt;\"> </span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-indent:308.7pt;\">\r\n	<b><span style=\"font-size:15.0pt;\"></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">服务标准：<span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">门票：景点首道大门票<span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">导游：全程优秀导游服务<span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">餐：不含餐<span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">交通：往返空调旅游车<span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">保险：旅行社责任险<span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">特别提醒：导游将在前一天晚上<span>19</span>：<span>00</span>前打电话给客人，告知集合时间，地点，车牌号！<span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><u><span style=\"font-size:12pt;font-family:宋体;\">备注：</span></u></b><b><u><span style=\"font-size:12pt;\">1.4</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">米</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">上儿童未持学生证的按成人收费；</span></u></b><b><u><span style=\"font-size:12pt;\">1.2</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">米</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">至</span></u></b><b><u><span style=\"font-size:12pt;\">1.4</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">米</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">儿童占车、保险费收取</span></u></b><b><u><span style=\"font-size:12pt;\">60</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">元</span></u></b><b><u><span style=\"font-size:12pt;\">/</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">人；</span></u></b><b><u><span style=\"font-size:12pt;\">1.2</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">米</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">以下儿童每人收取</span></u></b><b><u><span style=\"font-size:12pt;\">20</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">元保险综合费。</span></u></b><b><u><span style=\"font-size:12pt;\">70</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">岁以上老年人</span></u></b><b><u><span style=\"font-size:12pt;\">190</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">元，</span></u></b><b><u><span style=\"font-size:12pt;\">60-70</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">岁老年人</span></u></b><b><u><span style=\"font-size:12pt;\">260</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">元！（儿童若虚报身高，产生一切费用由家长自理</span></u></b><u><span style=\"font-size:12pt;font-family:宋体;\">）</span></u><u><span style=\"font-size:12pt;\"></span></u> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'uploads/image/20150318/1426689094.jpg', '', '91', '2', '1426686674', 'true', '', '0', '330.00');
INSERT INTO `dx_infoimg` VALUES ('3', '1', '18', '3', '0,2,3,', '-1', '-1', '', '嵩山少林寺一日游 高品团天天发', '', '', 'r,z', '', 'admin', '', '', '', '<p style=\"text-align:center;\">\r\n	<img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426695538.jpg\" width=\"500\" height=\"350\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-size:22.0pt;font-family:宋体;color:#3333FF;\">行程安排：<span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:31.5pt;\">\r\n	<b><span style=\"font-size:16.0pt;line-height:150%;font-family:宋体;color:blue;\">早<span>8:00</span>乘车赴嵩山少林寺景区游览，包括：（少林寺、 功夫表演、 塔林、会善寺、嵩阳书院），下午返回洛阳途中如果时间允许参观结束后可以游览中国第一座官办寺院——白马寺（可自由选择费用不包含），下午<span>6:30</span>左右返回洛阳。结束愉快旅程。<span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-size:18.0pt;color:red;\"></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">服务标准：<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">门票：景点首道大门票<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">导游：全程优秀导游服务<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">餐：不含餐<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">交通：往返空调旅游车<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">保险：旅行社责任险<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">特别提醒：导游将在前一天晚上<span>19</span>：<span>00</span>前打电话给客人，告知集合时间，地点，车牌号！<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<u><span style=\"font-family:宋体;\">备注：</span></u><u><span>1.4</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">上儿童未持学生证的按成人收费；</span></u><u><span>1.2</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">至</span></u><u><span>1.4</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">儿童占车、保险费收取</span></u><u><span>60</span></u><u><span style=\"font-family:宋体;\">元</span></u><u><span>/</span></u><u><span style=\"font-family:宋体;\">人；</span></u><u><span>1.2</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">以下儿童每人收取</span></u><u><span>20</span></u><u><span style=\"font-family:宋体;\">元保险综合费。</span></u><u><span>70</span></u><u><span style=\"font-family:宋体;\">岁以上老年人</span></u><u><span>160</span></u><u><span style=\"font-family:宋体;\">元，</span></u><u><span>60-70</span></u><u><span style=\"font-family:宋体;\">岁老年人</span></u><u><span>220</span></u><u><span style=\"font-family:宋体;\">元！（儿童若虚报身高，产生一切费用由家长自理）</span></u><u><span></span></u> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'uploads/image/20150318/1426695538.jpg', '', '157', '3', '1426687153', 'true', '', '0', '290.00');
INSERT INTO `dx_infoimg` VALUES ('4', '1', '23', '3', '0,2,3,', '-1', '-1', '', '小浪底 + 龙门石窟 一日游 天天发车', '', '', 'r,z', '', 'admin', '', '', '', '<p style=\"text-align:center;\">\r\n	<img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426690042.jpg\" width=\"300\" height=\"210\" alt=\"\" title=\"\" align=\"\" style=\"line-height:1.5;\" /><img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426689094.jpg\" width=\"300\" height=\"210\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:30.1pt;\">\r\n	<b><span style=\"font-size:15.0pt;line-height:150%;font-family:宋体;color:blue;\">早<span>8:00</span>乘车赴黄河上最大的水利枢纽工程——小浪底（门票<span>+</span>豪华游艇<span>120</span>元<span>/</span>人），中餐后（餐费自理，可自费品尝黄河大鲤鱼）参观世界文化遗产——龙门石窟、香山寺、白园。下午<span>6:00</span>左右返回古都洛阳。<span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"right\" style=\"text-align:right;\">\r\n	<b><span style=\"font-size:15.0pt;line-height:150%;color:red;\"> </span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">服务标准：<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">门票：景点首道大门票<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">导游：全程优秀导游服务<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">餐：不含餐<span> <b></b></span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">交通：往返空调旅游车<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">保险：旅行社责任险<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">特别提醒：导游将在前一天晚上<span>19</span>：<span>00</span>前打电话给客人，告知集合时间，地点，车牌号！<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<u><span style=\"font-family:宋体;\">备注：</span></u><u><span>1.4</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">上儿童未持学生证的按成人收费；</span></u><u><span>1.2</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">至</span></u><u><span>1.4</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">儿童占车、保险费收取</span></u><u><span>60</span></u><u><span style=\"font-family:宋体;\">元</span></u><u><span>/</span></u><u><span style=\"font-family:宋体;\">人；</span></u><u><span>1.2</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">以下儿童每人收取</span></u><u><span>20</span></u><u><span style=\"font-family:宋体;\">元保险综合费。</span></u><u><span>70</span></u><u><span style=\"font-family:宋体;\">岁以上老年人</span></u><u><span>200</span></u><u><span style=\"font-family:宋体;\">元，</span></u><u><span>60-70</span></u><u><span style=\"font-family:宋体;\">岁老年人</span></u><u><span>275</span></u><u><span style=\"font-family:宋体;\">元！（儿童若虚报身高，产生一切费用由家长自理）</span></u><u><span></span></u> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'uploads/image/20150318/1426690042.jpg', '', '79', '4', '1426687589', 'true', '', '0', '330.00');
INSERT INTO `dx_infoimg` VALUES ('5', '1', '22', '3', '0,2,3,', '-1', '-1', '', '龙潭大峡谷一日游', '', '', 'r,z', '', 'admin', '', '', '', '<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:19.5pt;\">\r\n	<span style=\"font-size:9pt;font-family:Arial, sans-serif;\">2006</span><span style=\"font-size:9pt;font-family:宋体;\">年</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">8</span><span style=\"font-size:9pt;font-family:宋体;\">月</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">18</span><span style=\"font-size:9pt;font-family:宋体;\">日</span><span style=\"font-size:9pt;font-family:宋体;\">，龙潭大峡谷接受联合国教科文组织世界地质公园评审专家的验收，被库穆博士盛赞为</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">“</span><span style=\"font-size:9pt;font-family:宋体;\">世界上最美的峡谷</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">”</span><span style=\"font-size:9pt;font-family:宋体;\">；</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">9</span><span style=\"font-size:9pt;font-family:宋体;\">月</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">18</span><span style=\"font-size:9pt;font-family:宋体;\">日</span><span style=\"font-size:9pt;font-family:宋体;\">被正式命名为</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">“</span><span style=\"font-size:9pt;font-family:宋体;\">世界地质公园</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">”</span><span style=\"font-size:9pt;font-family:宋体;\">；</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">2006</span><span style=\"font-size:9pt;font-family:宋体;\">年</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">9</span><span style=\"font-size:9pt;font-family:宋体;\">月</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">29</span><span style=\"font-size:9pt;font-family:宋体;\">日</span><span style=\"font-size:9pt;font-family:宋体;\">，龙潭大峡谷景区顺利通过了</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">“</span><span style=\"font-size:9pt;font-family:宋体;\">质量、环境、职业健康安全</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">”</span><span style=\"font-size:9pt;font-family:宋体;\">三项国际性标准管理体系认证；</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">2006</span><span style=\"font-size:9pt;font-family:宋体;\">年</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">11</span><span style=\"font-size:9pt;font-family:宋体;\">月又被评选为</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">“</span><span style=\"font-size:9pt;font-family:宋体;\">洛阳市新八大景</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">”</span><span style=\"font-size:9pt;font-family:宋体;\">之一。</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">2007</span><span style=\"font-size:9pt;font-family:宋体;\">年</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">9</span><span style=\"font-size:9pt;font-family:宋体;\">月</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">28</span><span style=\"font-size:9pt;font-family:宋体;\">日</span><span style=\"font-size:9pt;font-family:宋体;\">顺利通过国家旅游局</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">AAAA</span><span style=\"font-size:9pt;font-family:宋体;\">级景区验收。</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">2009</span><span style=\"font-size:9pt;font-family:宋体;\">年公司积极申报</span><span style=\"font-size:9pt;font-family:Arial, sans-serif;\">5A</span><span style=\"font-size:9pt;font-family:宋体;\">级景区。龙潭峡谷就是这黛眉山峡谷群地质公园中的典型代表。</span><span style=\"font-size:9.0pt;font-family:宋体;color:blue;\"> <span></span></span>\r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:19.5pt;\">\r\n	<span style=\"font-size:9pt;font-family:Arial, sans-serif;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-size:14pt;font-family:宋体;\">简单行程：</span><span style=\"font-size:14pt;font-family:宋体;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-size:14.0pt;font-family:宋体;\">洛阳早上七点半火车站集合，后乘车赴新安县（</span><span style=\"font-size:14.0pt;\">1.5</span><span style=\"font-size:14.0pt;font-family:宋体;\">小时）游览世界地质公园，山水画廊——<b><span style=\"color:red;\">龙潭大峡谷</span></b></span><b><span style=\"font-size:14.0pt;color:red;\">70</span></b><b><span style=\"font-size:14.0pt;font-family:宋体;color:red;\">元</span></b><span style=\"font-size:14.0pt;font-family:宋体;\">（</span><span style=\"font-size:14.0pt;\">4</span><span style=\"font-size:14.0pt;font-family:宋体;\">小时）黛眉山峡谷群地质公园中的典型代表被库穆博士盛赞为“世界上最美的峡谷”下午四点左右乘车返回洛阳，结束愉快的行程！</span><span style=\"font-size:14.0pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-size:14.0pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><b><span style=\"font-size:15.0pt;\"></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">服务标准：<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">门票：景点首道大门票<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">导游：全程优秀导游服务<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">餐：不含餐<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">交通：往返空调旅游车<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">保险：旅行社责任险<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">特别提醒：导游将在前一天晚上<span>8</span>：<span>00</span>前打电话给客人，告知集合时间，地点，车牌号！<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><u><span style=\"font-size:12pt;font-family:宋体;\">备注：</span></u></b><b><u><span style=\"font-size:12pt;\">1.4</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">米</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">上儿童按成人收费；</span></u></b><b><u><span style=\"font-size:12pt;\">1.2</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">米</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">至</span></u></b><b><u><span style=\"font-size:12pt;\">1.4</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">米</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">儿童占车、保险费收取</span></u></b><b><u><span style=\"font-size:12pt;\">60</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">元</span></u></b><b><u><span style=\"font-size:12pt;\">/</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">人；</span></u></b><b><u><span style=\"font-size:12pt;\">1.2</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">米</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">以下儿童每人收取</span></u></b><b><u><span style=\"font-size:12pt;\">20</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">元保险综合费。</span></u></b><b><u><span style=\"font-size:12pt;\">70</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">岁以上老年人</span></u></b><b><u><span style=\"font-size:12pt;\">78</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">元，</span></u></b><b><u><span style=\"font-size:12pt;\">60-70</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">岁老年人</span></u></b><b><u><span style=\"font-size:12pt;\">103</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">元！（儿童若虚报身高，产生一切费用由家长自理</span></u></b><u><span style=\"font-size:12pt;font-family:宋体;\">）</span></u><u><span style=\"font-size:12pt;\"></span></u>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"color:red;\">&nbsp;</span></b><b><span style=\"font-family:宋体;color:red;\">火车站天香饭店</span><span style=\"color:red;\">8</span></b><b><span style=\"font-family:宋体;color:red;\">：</span><span style=\"color:red;\">00</span></b><b><span style=\"font-family:宋体;color:red;\">出发。如果在洛阳市区</span><span style=\"color:red;\"> </span></b><b><span style=\"font-family:宋体;color:red;\">我们车可以考虑去接</span><span style=\"color:red;\"></span></b>\r\n</p>', 'uploads/image/20150318/1426694191.jpg', '', '165', '5', '1426687867', 'true', '', '0', '138.00');
INSERT INTO `dx_infoimg` VALUES ('6', '1', '20', '3', '0,2,3,', '-1', '-1', '', '龙门石窟、白马寺、牡丹园一日游', '', '', 'r,z', '', 'admin', '', '', '', '<p style=\"text-align:center;\">\r\n	<img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426689094.jpg\" width=\"300\" height=\"210\" alt=\"\" style=\"line-height:1.5;\" /><img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426693567.png\" width=\"237\" height=\"231\" alt=\"\" style=\"line-height:1.5;\" /><img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426692342.jpg\" width=\"300\" height=\"210\" alt=\"\" style=\"line-height:1.5;\" />\r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-size:16.0pt;font-family:宋体;color:#3333FF;\">行程安排：</span></b><b><span style=\"font-size:16.0pt;color:#3333FF;\"></span></b>\r\n</p>\r\n<p class=\"MsoNormal\" style=\"margin-left:31.9pt;\">\r\n	<span style=\"font-size:14.0pt;font-family:宋体;color:#3333FF;\">早</span><span style=\"font-size:14.0pt;color:#3333FF;\">8:00</span><span style=\"font-size:14.0pt;font-family:宋体;color:#3333FF;\">乘车前往世界文化遗产——龙门石窟，参观龙门石窟、卢舍那大佛、香山寺、白园等。中餐后（餐费自理），乘车赴中国第一个官办寺院</span><span style=\"font-size:14.0pt;color:#3333FF;\">---</span><span style=\"font-size:14.0pt;font-family:宋体;color:#3333FF;\">白马寺，后赴神州牡丹园参观国色天香的牡丹，下午</span><span style=\"font-size:14.0pt;color:#3333FF;\">5:00</span><span style=\"font-size:14.0pt;font-family:宋体;color:#3333FF;\">左右返回古都洛阳，结束一天愉快旅程。</span><span style=\"font-size:14.0pt;color:#3333FF;\">&nbsp; </span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-size:14.0pt;color:#3333FF;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">服务标准：<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">门票：景点首道大门票<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">导游：全程优秀导游服务<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">餐<span>&nbsp; </span>： 不含餐<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">交通：往返空调旅游车<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">保险：旅行社责任险<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-family:宋体;\">特别提醒：导游将在前一天晚上<span>19</span>：<span>00</span>前打电话给客人，告知集合时间，地点，车牌号！<span></span></span></b>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><u><span style=\"font-size:12pt;font-family:宋体;\">备注：</span></u></b><b><u><span style=\"font-size:12pt;\">1.4</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">米</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">上儿童未持学生证的按成人收费；</span></u></b><b><u><span style=\"font-size:12pt;\">1.2</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">米</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">至</span></u></b><b><u><span style=\"font-size:12pt;\">1.4</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">米</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">儿童占车、保险费收取</span></u></b><b><u><span style=\"font-size:12pt;\">60</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">元</span></u></b><b><u><span style=\"font-size:12pt;\">/</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">人；</span></u></b><b><u><span style=\"font-size:12pt;\">1.2</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">米</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">以下儿童每人收取</span></u></b><b><u><span style=\"font-size:12pt;\">20</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">元</span></u></b><b><u><span style=\"font-size:12pt;\">/</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">人保险综合费。</span></u></b><b><u><span style=\"font-size:12pt;\">70</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">岁以上老年人退门票差价，</span></u></b><b><u><span style=\"font-size:12pt;\">60-70</span></u></b><b><u><span style=\"font-size:12pt;font-family:宋体;\">岁老年人退门票半价差价！（儿童若虚报身高，产生一切费用由家长自理</span></u></b><u><span style=\"font-size:12pt;font-family:宋体;\">）</span></u><u><span style=\"font-size:12pt;\"></span></u>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'uploads/image/20150318/1426692342.jpg', '', '117', '6', '1426688086', 'true', '', '0', '350.00');
INSERT INTO `dx_infoimg` VALUES ('7', '1', '16', '2', '0,2,', '-1', '-1', '', '少林寺 + 牡丹 一日游', '', '', 'z', '', 'admin', '', '', '', '<p style=\"text-align:center;\">\r\n	<img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426695538.jpg\" width=\"300\" height=\"210\" alt=\"\" style=\"line-height:1.5;\" /><img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426692342.jpg\" width=\"300\" height=\"210\" alt=\"\" style=\"line-height:1.5;\" />\r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:23.6pt;\">\r\n		<b><span style=\"font-size:12.0pt;line-height:150%;font-family:宋体;color:blue;\">早<span>8</span>；<span>00</span>乘车赴少林寺景区游览，包括：（少林寺、 功夫表演、 塔林、），下午去神州牡丹园参观国色天香的牡丹，如果时间允许参观结束后可以游览中国第一座官办寺院——白马寺（可自由选择费用不包含），下午<span>6:30</span>左右返回洛阳。结束愉快旅程。<span></span></span></b>\r\n	</p>\r\n	<p class=\"MsoNormal\" align=\"right\" style=\"text-align:right;\">\r\n		<b><span style=\"font-size:18.0pt;color:#1F497D;\"></span></b>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<span style=\"font-family:宋体;\">服务标准：<b><span></span></b></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<span style=\"font-family:宋体;\">门票：景点首道大门票<b><span></span></b></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<span style=\"font-family:宋体;\">导游：全程优秀导游服务<b><span></span></b></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<span style=\"font-family:宋体;\">餐：不含餐<b><span></span></b></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<span style=\"font-family:宋体;\">交通：往返空调旅游车<b><span></span></b></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<span style=\"font-family:宋体;\">保险：旅行社责任险<b><span></span></b></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<span style=\"font-family:宋体;\">特别提醒：导游将在前一天晚上<span>19</span>：<span>00</span>前打电话给客人，告知集合时间，地点，车牌号！<b><span></span></b></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<u><span style=\"font-family:宋体;\">备注：</span></u><u><span>1.4</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">上儿童未持学生证的按成人收费；</span></u><u><span>1.2</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">至</span></u><u><span>1.4</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">儿童占车、保险费收取</span></u><u><span>60</span></u><u><span style=\"font-family:宋体;\">元</span></u><u><span>/</span></u><u><span style=\"font-family:宋体;\">人；</span></u><u><span>1.2</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">以下儿童每人收取</span></u><u><span>20</span></u><u><span style=\"font-family:宋体;\">元保险综合费。</span></u><u><span>70</span></u><u><span style=\"font-family:宋体;\">岁以上老年人</span></u><u><span>160</span></u><u><span style=\"font-family:宋体;\">元，</span></u><u><span>60-70</span></u><u><span style=\"font-family:宋体;\">岁老年人</span></u><u><span>220</span></u><u><span style=\"font-family:宋体;\">元！（儿童若虚报身高，产生一切费用由家长自理）</span></u><u><span></span></u>\r\n	</p>\r\n</p>', 'uploads/image/20150318/1426695538.jpg', '', '169', '7', '1426689522', 'true', '', '0', '260.00');
INSERT INTO `dx_infoimg` VALUES ('8', '1', '16', '2', '0,2,', '-1', '-1', '', '少林寺 一日游', '', '', '', '', 'admin', '', '', '', '<p style=\"text-align:center;\">\r\n	<img src=\"/business/lyshuxiang.com/uploads/image/20150318/1426695538.jpg\" width=\"500\" height=\"350\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b><span style=\"font-size:14.0pt;font-family:宋体;color:#3333FF;\">行程安排：<span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-indent:27.55pt;\">\r\n	<b><span style=\"font-size:14.0pt;line-height:150%;font-family:宋体;color:blue;\">早<span>8:00</span>乘车赴少林寺景区游览，包括：（少林寺、 功夫表演、 塔林、会善寺、），下午返回洛阳途中如果时间允许参观结束后可以游览中国第一座官办寺院——白马寺（可自由选择费用不包含），下午<span>6:30</span>左右返回洛阳。结束愉快旅程。<span></span></span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\"> </span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">服务标准：<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">门票：景点首道大门票<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">导游：全程优秀导游服务<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">餐：不含餐<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">交通：往返空调旅游车<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">保险：旅行社责任险<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;\">特别提醒：导游将在前一天晚上<span>19</span>：<span>00</span>前打电话给客人，告知集合时间，地点，车牌号！<b><span></span></b></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<u><span style=\"font-family:宋体;\">备注：</span></u><u><span>1.4</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">上儿童未持学生证的按成人收费；</span></u><u><span>1.2</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">至</span></u><u><span>1.4</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">儿童占车、保险费收取</span></u><u><span>60</span></u><u><span style=\"font-family:宋体;\">元</span></u><u><span>/</span></u><u><span style=\"font-family:宋体;\">人；</span></u><u><span>1.2</span></u><u><span style=\"font-family:宋体;\">米</span></u><u><span style=\"font-family:宋体;\">以下儿童每人收取</span></u><u><span>20</span></u><u><span style=\"font-family:宋体;\">元保险综合费。</span></u><u><span>70</span></u><u><span style=\"font-family:宋体;\">岁以上老年人</span></u><u><span>150</span></u><u><span style=\"font-family:宋体;\">元，</span></u><u><span>60-70</span></u><u><span style=\"font-family:宋体;\">岁老年人</span></u><u><span>200</span></u><u><span style=\"font-family:宋体;\">元！（儿童若虚报身高，产生一切费用由家长自理）</span></u><u><span></span></u> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'uploads/image/20150318/1426695538.jpg', '', '140', '8', '1426689800', 'true', '', '0', '240.00');

-- ----------------------------
-- Table structure for `dx_infolist`
-- ----------------------------
DROP TABLE IF EXISTS `dx_infolist`;
CREATE TABLE `dx_infolist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '列表信息id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `classid` smallint(5) unsigned NOT NULL COMMENT '所属栏目id',
  `parentid` smallint(5) unsigned NOT NULL COMMENT '所属栏目上级id',
  `parentstr` varchar(80) NOT NULL COMMENT '所属栏目上级id字符串',
  `mainid` smallint(5) NOT NULL COMMENT '二级类别id',
  `mainpid` smallint(5) NOT NULL COMMENT '二级类别上级id',
  `mainpstr` varchar(80) NOT NULL COMMENT '二级类别上级id字符串',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `colorval` char(10) NOT NULL COMMENT '字体颜色',
  `boldval` char(10) NOT NULL COMMENT '字体加粗',
  `flag` varchar(30) NOT NULL COMMENT '属性',
  `source` varchar(50) NOT NULL COMMENT '文章来源',
  `author` varchar(50) NOT NULL COMMENT '作者编辑',
  `linkurl` varchar(255) NOT NULL COMMENT '跳转链接',
  `keywords` varchar(50) NOT NULL COMMENT '关键词',
  `description` varchar(255) NOT NULL COMMENT '摘要',
  `content` mediumtext NOT NULL COMMENT '详细内容',
  `picurl` varchar(100) NOT NULL COMMENT '缩略图片',
  `picarr` text NOT NULL COMMENT '组图',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击次数',
  `orderid` int(10) unsigned NOT NULL COMMENT '排列排序',
  `posttime` int(10) NOT NULL COMMENT '更新时间',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  `delstate` set('true') NOT NULL COMMENT '删除状态',
  `deltime` int(10) unsigned NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_infolist
-- ----------------------------
INSERT INTO `dx_infolist` VALUES ('1', '1', '11', '0', '0,', '-1', '-1', '', '庆祝改版', '', '', '', '', 'admin', '', '', '', '<p>\r\n	洛阳舒翔假期旅行社网站改版新上线~~!\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\">洛阳舒翔假期旅行社网站改版新上线~~!</span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"><span style=\"white-space:normal;\">洛阳舒翔假期旅行社网站改版新上线~~!</span><br />\r\n</span>\r\n</p>', '', '', '118', '1', '1426671458', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('2', '1', '8', '0', '0,', '-1', '-1', '', '哈哈', '', '', '', '', 'admin', '', '', '', '<p>\r\n	<span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><span style=\"white-space:normal;\">啊啊</span><br />\r\n</span>\r\n</p>', '', '', '164', '2', '1426723246', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('3', '1', '12', '10', '0,10,', '-1', '-1', '', '纯玩是什么意思？', '', '', '', '', 'admin', '', '', '', '纯玩是什么意思？纯玩是什么意思？纯玩是什么意思？纯玩是什么意思？纯玩是什么意思？纯玩是什么意思？纯玩是什么意思？纯玩是什么意思？', '', '', '91', '3', '1426725442', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('4', '1', '12', '10', '0,10,', '-1', '-1', '', '单房差是什么？', '', '', '', '', 'admin', '', '', '', '单房差是什么？单房差是什么？单房差是什么？单房差是什么？单房差是什么？单房差是什么？单房差是什么？单房差是什么？单房差是什么？单房差是什么？单房差是什么？单房差是什么？单房差是什么？单房差是什么？', '', '', '174', '4', '1426725487', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('5', '1', '12', '10', '0,10,', '-1', '-1', '', '双飞、双卧都是什么意思？', '', '', '', '', 'admin', '', '', '', '双飞、双卧都是什么意思？双飞、双卧都是什么意思？双飞、双卧都是什么意思？双飞、双卧都是什么意思？双飞、双卧都是什么意思？双飞、双卧都是什么意思？双飞、双卧都是什么意思？', '', '', '195', '5', '1426725650', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('6', '1', '12', '10', '0,10,', '-1', '-1', '', '满意度是怎么计算的？', '', '', '', '', 'admin', '', '', '', '满意度是怎么计算的？满意度是怎么计算的？满意度是怎么计算的？满意度是怎么计算的？满意度是怎么计算的？满意度是怎么计算的？', '', '', '87', '6', '1426725678', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('7', '1', '13', '10', '0,10,', '-1', '-1', '', '签约可以刷卡吗？', '', '', '', '', 'admin', '', '', '', '签约可以刷卡吗？签约可以刷卡吗？签约可以刷卡吗？签约可以刷卡吗？签约可以刷卡吗？签约可以刷卡吗？签约可以刷卡吗？签约可以刷卡吗？', '', '', '98', '7', '1426725692', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('8', '1', '13', '10', '0,10,', '-1', '-1', '', '付款方式有哪些？', '', '', '', '', 'admin', '', '', '', '付款方式有哪些？付款方式有哪些？付款方式有哪些？付款方式有哪些？付款方式有哪些？付款方式有哪些？付款方式有哪些？', '', '', '112', '8', '1426725707', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('9', '1', '13', '10', '0,10,', '-1', '-1', '', '怎么网上支付？', '', '', '', '', 'admin', '', '', '', '怎么网上支付？怎么网上支付？怎么网上支付？怎么网上支付？怎么网上支付？怎么网上支付？怎么网上支付？怎么网上支付？', '', '', '169', '9', '1426725720', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('10', '1', '13', '10', '0,10,', '-1', '-1', '', '如何获取发票？', '', '', '', '', 'admin', '', '', '', '如何获取发票？如何获取发票？如何获取发票？如何获取发票？如何获取发票？如何获取发票？如何获取发票？如何获取发票？如何获取发票？如何获取发票？如何获取发票？如何获取发票？如何获取发票？如何获取发票？', '', '', '50', '10', '1426725734', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('11', '1', '14', '10', '0,10,', '-1', '-1', '', '有旅游合同范本下载吗？', '', '', '', '', 'admin', '', '', '', '有旅游合同范本下载吗？有旅游合同范本下载吗？有旅游合同范本下载吗？有旅游合同范本下载吗？有旅游合同范本下载吗？有旅游合同范本下载吗？有旅游合同范本下载吗？有旅游合同范本下载吗？有旅游合同范本下载吗？有旅游合同范本下载吗？有旅游合同范本下载吗？', '', '', '117', '11', '1426725798', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('12', '1', '14', '10', '0,10,', '-1', '-1', '', '门市地址在哪里？', '', '', '', '', 'admin', '', '', '', '门市地址在哪里？门市地址在哪里？门市地址在哪里？门市地址在哪里？门市地址在哪里？门市地址在哪里？门市地址在哪里？门市地址在哪里？门市地址在哪里？门市地址在哪里？门市地址在哪里？', '', '', '118', '12', '1426725813', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('13', '1', '14', '10', '0,10,', '-1', '-1', '', '能传真签合同吗？', '', '', '', '', 'admin', '', '', '', '能传真签合同吗？能传真签合同吗？能传真签合同吗？能传真签合同吗？能传真签合同吗？能传真签合同吗？能传真签合同吗？能传真签合同吗？', '', '', '155', '13', '1426725826', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('14', '1', '14', '10', '0,10,', '-1', '-1', '', '可以不签合同吗？', '', '', '', '', 'admin', '', '', '', '可以不签合同吗？可以不签合同吗？可以不签合同吗？可以不签合同吗？可以不签合同吗？可以不签合同吗？可以不签合同吗？可以不签合同吗？可以不签合同吗？可以不签合同吗？可以不签合同吗？', '', '', '120', '14', '1426725838', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('15', '1', '15', '10', '0,10,', '-1', '-1', '', '签证相关问题解答', '', '', '', '', 'admin', '', '', '', '签证相关问题解答签证相关问题解答签证相关问题解答签证相关问题解答签证相关问题解答签证相关问题解答签证相关问题解答签证相关问题解答签证相关问题解答签证相关问题解答签证相关问题解答签证相关问题解答', '', '', '130', '15', '1426725852', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('16', '1', '15', '10', '0,10,', '-1', '-1', '', '旅游保险问题解答', '', '', '', '', 'admin', '', '', '', '旅游保险问题解答旅游保险问题解答旅游保险问题解答旅游保险问题解答旅游保险问题解答旅游保险问题解答旅游保险问题解答旅游保险问题解答旅游保险问题解答旅游保险问题解答旅游保险问题解答旅游保险问题解答旅游保险问题解答', '', '', '132', '16', '1426725864', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('17', '1', '15', '10', '0,10,', '-1', '-1', '', '退款问题解答', '', '', '', '', 'admin', '', '', '', '退款问题解答退款问题解答退款问题解答退款问题解答退款问题解答退款问题解答退款问题解答退款问题解答退款问题解答退款问题解答退款问题解答退款问题解答', '', '', '183', '17', '1426725878', 'true', '', '0');
INSERT INTO `dx_infolist` VALUES ('18', '1', '15', '10', '0,10,', '-1', '-1', '', '旅途中的问题', '', '', '', '', 'admin', '', '', '', '旅途中的问题旅途中的问题旅途中的问题旅途中的问题旅途中的问题旅途中的问题旅途中的问题旅途中的问题旅途中的问题旅途中的问题旅途中的问题旅途中的问题', '', '', '103', '18', '1426725889', 'true', '', '0');

-- ----------------------------
-- Table structure for `dx_infosrc`
-- ----------------------------
DROP TABLE IF EXISTS `dx_infosrc`;
CREATE TABLE `dx_infosrc` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '来源id',
  `srcname` varchar(30) NOT NULL COMMENT '来源名称',
  `linkurl` varchar(80) NOT NULL COMMENT '来源地址',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '来源排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_infosrc
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_job`
-- ----------------------------
DROP TABLE IF EXISTS `dx_job`;
CREATE TABLE `dx_job` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '招聘信息id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `title` varchar(50) NOT NULL COMMENT '位岗名称',
  `jobplace` varchar(80) NOT NULL COMMENT '工作地点',
  `jobdescription` varchar(50) NOT NULL COMMENT '工作性质',
  `employ` smallint(5) unsigned NOT NULL COMMENT '招聘人数',
  `jobsex` enum('0','1','2') NOT NULL COMMENT '性别要求',
  `treatment` varchar(50) NOT NULL COMMENT '工资待遇',
  `usefullife` varchar(50) NOT NULL COMMENT '有效期',
  `experience` varchar(50) NOT NULL COMMENT '工作经验',
  `education` varchar(80) NOT NULL COMMENT '学历要求',
  `joblang` varchar(50) NOT NULL COMMENT '言语能力',
  `workdesc` mediumtext NOT NULL COMMENT '职位描述',
  `content` mediumtext NOT NULL COMMENT '职位要求',
  `orderid` mediumint(8) unsigned NOT NULL COMMENT '排列排序',
  `posttime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_job
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_lnk`
-- ----------------------------
DROP TABLE IF EXISTS `dx_lnk`;
CREATE TABLE `dx_lnk` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '快捷方式id',
  `lnkname` varchar(30) NOT NULL COMMENT '快捷方式名称',
  `lnklink` varchar(50) NOT NULL COMMENT '跳转链接',
  `lnkico` varchar(50) NOT NULL COMMENT 'ico地址',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_lnk
-- ----------------------------
INSERT INTO `dx_lnk` VALUES ('1', '栏目管理', 'infoclass.php', 'templates/images/lnkBg01.png', '1');
INSERT INTO `dx_lnk` VALUES ('2', '列表管理', 'infolist.php', 'templates/images/lnkBg02.png', '2');
INSERT INTO `dx_lnk` VALUES ('3', '图片管理', 'infoimg.php', 'templates/images/lnkBg03.png', '3');
INSERT INTO `dx_lnk` VALUES ('4', '商品管理', 'goods.php', 'templates/images/lnkBg04.png', '4');

-- ----------------------------
-- Table structure for `dx_maintype`
-- ----------------------------
DROP TABLE IF EXISTS `dx_maintype`;
CREATE TABLE `dx_maintype` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '二级类别id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `parentid` smallint(5) unsigned NOT NULL COMMENT '类别上级id',
  `parentstr` varchar(50) NOT NULL COMMENT '类别上级id字符串',
  `classname` varchar(30) NOT NULL COMMENT '类别名称',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_maintype
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_member`
-- ----------------------------
DROP TABLE IF EXISTS `dx_member`;
CREATE TABLE `dx_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `question` varchar(50) NOT NULL COMMENT '提问',
  `answer` varchar(50) NOT NULL COMMENT '回答',
  `cnname` varchar(10) NOT NULL COMMENT '姓名',
  `enname` varchar(20) NOT NULL COMMENT '英文名',
  `avatar` varchar(100) NOT NULL COMMENT '头像',
  `sex` tinyint(1) unsigned NOT NULL COMMENT '性别',
  `birthtype` tinyint(1) unsigned NOT NULL COMMENT '生日类型',
  `birth_year` varchar(10) NOT NULL DEFAULT '-1' COMMENT '生日_年',
  `birth_month` varchar(10) NOT NULL DEFAULT '-1' COMMENT '生日_月',
  `birth_day` varchar(10) NOT NULL DEFAULT '-1' COMMENT '生日_日',
  `astro` varchar(10) NOT NULL DEFAULT '-1' COMMENT '星座',
  `bloodtype` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '血型',
  `trade` varchar(10) NOT NULL DEFAULT '-1' COMMENT '行业',
  `live_prov` varchar(10) NOT NULL DEFAULT '-1' COMMENT '现居地_省',
  `live_city` varchar(10) NOT NULL DEFAULT '-1' COMMENT '现居地_市',
  `live_country` varchar(15) NOT NULL DEFAULT '-1' COMMENT '现居地_区',
  `home_prov` varchar(10) NOT NULL DEFAULT '-1' COMMENT '故乡_省',
  `home_city` varchar(10) NOT NULL DEFAULT '-1' COMMENT '故乡_市',
  `home_country` varchar(15) NOT NULL DEFAULT '-1' COMMENT '故乡_区',
  `cardtype` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '证件类型',
  `cardnum` varchar(32) NOT NULL COMMENT '证件号码',
  `intro` text NOT NULL COMMENT '个人说明',
  `email` varchar(40) NOT NULL COMMENT '电子邮件',
  `qqnum` varchar(20) NOT NULL COMMENT 'QQ号码',
  `mobile` varchar(20) NOT NULL COMMENT '手机',
  `telephone` varchar(20) NOT NULL COMMENT '固定电话',
  `address_prov` varchar(10) NOT NULL DEFAULT '-1' COMMENT '通信地址_省',
  `address_city` varchar(10) NOT NULL DEFAULT '-1' COMMENT '通信地址_市',
  `address_country` varchar(15) NOT NULL DEFAULT '-1' COMMENT '通信地址_区',
  `address` varchar(100) NOT NULL COMMENT '通信地址',
  `zipcode` varchar(10) NOT NULL COMMENT '邮编',
  `enteruser` set('1') NOT NULL COMMENT '认证',
  `expval` int(10) NOT NULL COMMENT '经验值',
  `integral` int(10) unsigned NOT NULL COMMENT '积分',
  `regtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `regip` varchar(20) NOT NULL COMMENT '注册IP',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `loginip` varchar(20) NOT NULL COMMENT '登录IP',
  `qqid` varchar(32) NOT NULL COMMENT '绑定QQ',
  `weiboid` varchar(32) NOT NULL COMMENT '绑定微博',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_member
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_message`
-- ----------------------------
DROP TABLE IF EXISTS `dx_message`;
CREATE TABLE `dx_message` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `nickname` varchar(30) NOT NULL COMMENT '昵称',
  `contact` varchar(50) NOT NULL COMMENT '联系方式',
  `content` text NOT NULL COMMENT '留言内容',
  `htop` set('true') NOT NULL COMMENT '置顶',
  `rtop` set('true') NOT NULL COMMENT '推荐',
  `ip` char(20) NOT NULL COMMENT '留言IP',
  `recont` text NOT NULL COMMENT '回复内容',
  `retime` int(10) unsigned NOT NULL COMMENT '回复时间',
  `orderid` mediumint(8) unsigned NOT NULL COMMENT '排列排序',
  `posttime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_message
-- ----------------------------
INSERT INTO `dx_message` VALUES ('1', '1', '1111', '1111', '11', '', '', '127.0.0.1', '', '0', '1', '1428772276', 'true');

-- ----------------------------
-- Table structure for `dx_nav`
-- ----------------------------
DROP TABLE IF EXISTS `dx_nav`;
CREATE TABLE `dx_nav` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `parentid` smallint(5) unsigned NOT NULL COMMENT '导航分类',
  `parentstr` varchar(50) NOT NULL COMMENT '导航分类父id字符串',
  `classname` varchar(30) NOT NULL COMMENT '导航名称',
  `linkurl` varchar(255) NOT NULL COMMENT '跳转链接',
  `relinkurl` varchar(255) NOT NULL COMMENT '重写地址',
  `picurl` varchar(100) NOT NULL COMMENT '导航图片',
  `target` varchar(30) NOT NULL COMMENT '打开方式',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '隐藏导航',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_nav
-- ----------------------------
INSERT INTO `dx_nav` VALUES ('1', '1', '0', '0,', 'menu', '#', '', '', '', '1', 'true');
INSERT INTO `dx_nav` VALUES ('2', '1', '0', '0,', 'category', '#', '', '', '', '2', 'true');
INSERT INTO `dx_nav` VALUES ('3', '1', '1', '0,1,', '首页', 'Index/index', '', '', '', '3', 'true');
INSERT INTO `dx_nav` VALUES ('4', '1', '1', '0,1,', '出境', 'Line/lists?cid=5', '', '', '', '4', 'true');
INSERT INTO `dx_nav` VALUES ('5', '1', '1', '0,1,', '国内', 'Line/lists?cid=4', '', '', '', '5', 'true');
INSERT INTO `dx_nav` VALUES ('6', '1', '1', '0,1,', '洛阳周边', 'Line/lists?cid=3', '', '', '', '6', 'true');
INSERT INTO `dx_nav` VALUES ('7', '1', '1', '0,1,', '护照签证', 'Article/one?id=6', '', '', '', '7', 'true');
INSERT INTO `dx_nav` VALUES ('8', '1', '1', '0,1,', '旅游租车', 'Article/one?id=7', '', '', '', '8', 'true');
INSERT INTO `dx_nav` VALUES ('9', '1', '1', '0,1,', '旅游攻略', 'Article/lists?cid=8', '', '', '', '9', 'true');
INSERT INTO `dx_nav` VALUES ('10', '1', '1', '0,1,', '客户留言', 'Index/message', '', '', '', '10', 'true');
INSERT INTO `dx_nav` VALUES ('11', '1', '1', '0,1,', '关于我们', 'Article/one?id=28&tpl=about', '', '', '', '11', 'true');

-- ----------------------------
-- Table structure for `dx_paymode`
-- ----------------------------
DROP TABLE IF EXISTS `dx_paymode`;
CREATE TABLE `dx_paymode` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '支付方式id',
  `classname` varchar(30) NOT NULL COMMENT '支付方式名称',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_paymode
-- ----------------------------
INSERT INTO `dx_paymode` VALUES ('1', '在线支付', '1', 'true');
INSERT INTO `dx_paymode` VALUES ('2', '货到付款', '2', 'true');

-- ----------------------------
-- Table structure for `dx_postmode`
-- ----------------------------
DROP TABLE IF EXISTS `dx_postmode`;
CREATE TABLE `dx_postmode` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '配送方式id',
  `classname` varchar(30) NOT NULL COMMENT '配送方式',
  `postprice` varchar(10) NOT NULL COMMENT '配送价格',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_postmode
-- ----------------------------
INSERT INTO `dx_postmode` VALUES ('1', '申通', '15', '1', 'true');
INSERT INTO `dx_postmode` VALUES ('2', '中通', '15', '2', 'true');
INSERT INTO `dx_postmode` VALUES ('3', '圆通', '15', '3', 'true');
INSERT INTO `dx_postmode` VALUES ('4', '顺丰', '22', '4', 'true');
INSERT INTO `dx_postmode` VALUES ('5', 'EMS', '20', '5', 'true');

-- ----------------------------
-- Table structure for `dx_site`
-- ----------------------------
DROP TABLE IF EXISTS `dx_site`;
CREATE TABLE `dx_site` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '站点ID',
  `sitename` varchar(30) NOT NULL COMMENT '站点名称',
  `sitekey` varchar(30) NOT NULL COMMENT '站点标识',
  `sitelang` varchar(50) NOT NULL COMMENT '站点语言包',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_site
-- ----------------------------
INSERT INTO `dx_site` VALUES ('1', '默认站点', 'zh_CN', 'zh_CN');

-- ----------------------------
-- Table structure for `dx_soft`
-- ----------------------------
DROP TABLE IF EXISTS `dx_soft`;
CREATE TABLE `dx_soft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '软件信息id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `classid` smallint(5) unsigned NOT NULL COMMENT '所属栏目id',
  `parentid` smallint(5) unsigned NOT NULL COMMENT '所属栏目上级id',
  `parentstr` varchar(80) NOT NULL COMMENT '所属栏目上级id字符串',
  `mainid` smallint(5) NOT NULL COMMENT '二级类别id',
  `mainpid` smallint(5) NOT NULL COMMENT '二级类别父id',
  `mainpstr` varchar(80) NOT NULL COMMENT '二级累呗父id字符串',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `colorval` char(10) NOT NULL COMMENT '字体颜色',
  `boldval` char(10) NOT NULL COMMENT '字体加粗',
  `flag` varchar(30) NOT NULL COMMENT '属性',
  `filetype` char(4) NOT NULL COMMENT '文件类型',
  `softtype` char(10) NOT NULL COMMENT '软件类型',
  `language` char(10) NOT NULL COMMENT '界面语言',
  `accredit` char(10) NOT NULL COMMENT '授权方式',
  `softsize` varchar(10) NOT NULL COMMENT '软件大小',
  `unit` char(4) NOT NULL COMMENT '软件大小单位',
  `runos` varchar(50) NOT NULL COMMENT '运行环境',
  `website` varchar(255) NOT NULL COMMENT '官方网站',
  `demourl` varchar(255) NOT NULL COMMENT '演示地址',
  `dlurl` varchar(255) NOT NULL COMMENT '下载地址',
  `source` varchar(50) NOT NULL COMMENT '文章来源',
  `author` varchar(50) NOT NULL COMMENT '作者编辑',
  `linkurl` varchar(255) NOT NULL COMMENT '跳转链接',
  `keywords` varchar(50) NOT NULL COMMENT '关键字',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `content` mediumtext NOT NULL COMMENT '内容',
  `picurl` varchar(100) NOT NULL COMMENT '缩略图片',
  `picarr` text NOT NULL COMMENT '组图',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击次数',
  `orderid` int(10) unsigned NOT NULL COMMENT '排列排序',
  `posttime` int(10) NOT NULL COMMENT '更新时间',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  `delstate` set('true') NOT NULL COMMENT '删除状态',
  `deltime` int(10) unsigned NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_soft
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_sysevent`
-- ----------------------------
DROP TABLE IF EXISTS `dx_sysevent`;
CREATE TABLE `dx_sysevent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `uname` varchar(30) NOT NULL COMMENT '用户名',
  `siteid` tinyint(1) unsigned NOT NULL COMMENT '站点id',
  `model` varchar(30) NOT NULL COMMENT '操作模块',
  `classid` int(10) unsigned NOT NULL COMMENT '栏目id',
  `action` varchar(10) NOT NULL COMMENT '执行操作',
  `posttime` int(10) NOT NULL COMMENT '操作时间',
  `ip` varchar(20) NOT NULL COMMENT '操作ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=343 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_sysevent
-- ----------------------------
INSERT INTO `dx_sysevent` VALUES ('1', 'admin', '1', 'login', '0', '', '1425280927', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('2', 'admin', '1', 'infoclass', '0', 'all', '1425280935', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('3', 'admin', '1', 'infoclass', '0', 'all', '1425281080', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('4', 'admin', '1', 'goods', '0', 'all', '1425281127', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('5', 'admin', '1', 'goodsflag', '0', 'all', '1425281129', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('6', 'admin', '1', 'goodstype', '0', 'all', '1425281152', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('7', 'admin', '1', 'goodsbrand', '0', 'all', '1425281171', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('8', 'admin', '1', 'paymode', '0', 'all', '1425281175', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('9', 'admin', '1', 'getmode', '0', 'all', '1425281177', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('10', 'admin', '1', 'postmode', '0', 'all', '1425281179', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('11', 'admin', '1', 'goods', '0', 'all', '1425281193', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('12', 'admin', '1', 'infoclass', '0', 'all', '1425281522', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('13', 'admin', '1', 'infoimg', '0', 'all', '1425281525', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('14', 'admin', '1', 'diymodel', '0', 'all', '1425281542', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('15', 'admin', '1', 'infoclass', '0', 'all', '1425281589', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('16', 'admin', '1', 'infoclass', '0', 'all', '1425281719', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('17', 'admin', '1', 'infoimg', '0', 'all', '1425281723', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('18', 'admin', '1', 'infolist', '0', 'all', '1425281729', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('19', 'admin', '1', 'diymodel', '0', 'all', '1425281760', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('20', 'admin', '1', 'infoclass', '0', 'all', '1425281801', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('21', 'admin', '1', 'diymenu', '0', 'all', '1425281830', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('22', 'admin', '1', 'infoclass', '0', 'all', '1425281882', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('23', 'admin', '1', 'admin', '0', 'all', '1425281925', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('24', 'admin', '1', 'admingroup', '0', 'all', '1425281928', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('25', 'admin', '1', 'infoclass', '0', 'all', '1425282010', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('26', 'admin', '1', 'diymodel', '0', 'all', '1425282015', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('27', 'admin', '1', 'diyfield', '0', 'all', '1425282021', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('28', 'admin', '1', 'diymodel', '0', 'all', '1425282280', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('29', 'admin', '1', 'infoclass', '0', 'all', '1425282291', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('30', 'admin', '1', 'lvyou', '1', 'del', '1425282294', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('31', 'admin', '1', 'maintype', '0', 'all', '1425282302', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('32', 'admin', '1', 'infosrc', '0', 'all', '1425282457', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('33', 'admin', '1', 'infoimg', '0', 'all', '1425282460', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('34', 'admin', '1', 'infoclass', '0', 'all', '1425282579', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('35', 'admin', '1', 'infoimg', '2', 'add', '1425282626', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('36', 'admin', '1', 'infoclass', '0', 'all', '1425282643', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('37', 'admin', '1', 'login', '0', '', '1425283534', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('38', 'admin', '1', 'infoclass', '0', 'all', '1425283643', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('39', 'admin', '1', 'diyfield', '0', 'all', '1425284158', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('40', 'admin', '1', 'cascade', '0', 'all', '1425284321', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('41', 'admin', '1', 'infosrc', '0', 'all', '1425284333', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('42', 'admin', '1', 'infoimg', '0', 'all', '1425284363', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('43', 'admin', '1', 'diymenu', '0', 'all', '1425284402', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('44', 'admin', '1', 'nav', '0', 'all', '1425284404', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('45', 'admin', '1', 'infoclass', '0', 'all', '1425284527', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('46', 'admin', '1', 'infoimg', '0', 'all', '1425284556', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('47', 'admin', '1', 'infoclass', '0', 'all', '1425284671', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('48', 'admin', '1', 'web_config', '0', 'all', '1425284685', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('49', 'admin', '1', 'goodstype', '0', 'all', '1425284866', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('50', 'admin', '1', 'database_backup', '0', 'all', '1425284899', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('51', 'admin', '1', 'upload_filemgr_sql', '0', 'all', '1425284901', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('52', 'admin', '1', 'web_config', '0', 'all', '1425284903', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('53', 'admin', '1', 'infoimg', '0', 'all', '1425284958', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('54', 'admin', '1', 'goodsbrand', '0', 'all', '1425285002', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('55', 'admin', '1', 'goodstype', '0', 'all', '1425285004', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('56', 'admin', '1', 'goodsflag', '0', 'all', '1425285007', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('57', 'admin', '1', 'infoimg', '0', 'all', '1425285052', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('58', 'admin', '1', 'fragment', '0', 'all', '1425285078', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('59', 'admin', '1', 'infoflag', '0', 'all', '1425285193', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('60', 'admin', '1', 'infoflag', '0', 'all', '1425285303', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('61', 'admin', '1', 'infoflag', '0', 'all', '1425285374', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('62', 'admin', '1', 'infoclass', '0', 'all', '1425285380', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('63', 'admin', '1', 'infoimg', '0', 'all', '1425285383', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('64', 'admin', '1', 'cascade', '0', 'all', '1425285413', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('65', 'admin', '1', 'diyfield', '0', 'all', '1425285482', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('66', 'admin', '1', 'infoimg', '0', 'all', '1425285485', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('67', 'admin', '1', 'cascade', '0', 'all', '1425285503', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('68', 'admin', '1', 'infoclass', '0', 'all', '1425285786', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('69', 'admin', '1', 'diymodel', '0', 'all', '1425285839', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('70', 'admin', '1', 'infoclass', '0', 'all', '1425285879', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('71', 'admin', '1', 'infolist', '0', 'all', '1425286146', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('72', 'admin', '1', 'infoimg', '0', 'all', '1425286392', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('73', 'admin', '1', 'infolist', '0', 'all', '1425286395', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('74', 'admin', '1', 'cascade', '0', 'all', '1425289004', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('75', 'admin', '1', 'infoclass', '0', 'all', '1425289980', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('76', 'admin', '1', 'infoclass', '0', 'all', '1425290078', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('77', 'admin', '1', 'infoclass', '0', 'all', '1425290151', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('78', 'admin', '1', 'infoclass', '0', 'all', '1425290236', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('79', 'admin', '1', 'infoclass', '0', 'all', '1425290435', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('80', 'admin', '1', 'infolist', '10', 'add', '1425290454', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('81', 'admin', '1', 'infoclass', '0', 'all', '1425290504', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('82', 'admin', '1', 'infolist', '10', 'add', '1425290532', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('83', 'admin', '1', 'site', '0', 'all', '1425290572', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('84', 'admin', '1', 'web_config', '0', 'all', '1425290579', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('85', 'admin', '1', 'web_config', '0', 'all', '1425290845', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('86', 'admin', '1', 'upload_filemgr_sql', '0', 'all', '1425290917', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('87', 'admin', '1', 'site', '0', 'all', '1425290921', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('88', 'admin', '1', 'web_config', '0', 'all', '1425290923', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('89', 'admin', '1', 'goods', '0', 'all', '1425291225', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('90', 'admin', '1', 'infoclass', '0', 'all', '1425291277', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('91', 'admin', '1', 'infoimg', '2', 'update', '1425291304', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('92', 'admin', '1', 'goodstype', '0', 'all', '1425291340', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('93', 'admin', '1', 'goods', '0', 'all', '1425291342', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('94', 'admin', '1', 'login', '0', '', '1425353066', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('95', 'admin', '1', 'infoclass', '0', 'all', '1425353088', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('96', 'admin', '1', 'login', '0', '', '1425364920', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('97', 'admin', '1', 'site', '0', 'all', '1425364926', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('98', 'admin', '1', 'web_config', '0', 'all', '1425364927', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('99', 'admin', '1', 'login', '0', '', '1425365952', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('100', 'admin', '1', 'login', '0', '', '1425369450', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('101', 'admin', '1', 'site', '0', 'all', '1425372030', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('102', 'admin', '1', 'web_config', '0', 'all', '1425372033', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('103', 'admin', '1', 'web_config', '0', 'all', '1425376269', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('104', 'admin', '1', 'site', '0', 'all', '1425376288', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('105', 'admin', '1', 'web_config', '0', 'all', '1425376331', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('106', 'admin', '1', 'site', '0', 'all', '1425379180', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('107', 'admin', '1', 'web_config', '0', 'all', '1425379188', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('108', 'admin', '1', 'login', '0', '', '1426590640', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('109', 'admin', '1', 'infoimg', '0', 'all', '1426590647', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('110', 'admin', '1', 'infoclass', '0', 'all', '1426590670', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('111', 'admin', '1', 'goods', '0', 'all', '1426590673', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('112', 'admin', '1', 'login', '0', '', '1426661180', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('113', 'admin', '1', 'infoclass', '0', 'all', '1426661785', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('114', 'admin', '1', 'goods', '2', 'update', '1426661794', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('115', 'admin', '1', 'infoclass', '0', 'all', '1426661972', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('116', 'admin', '1', 'goods', '5', 'update', '1426661977', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('117', 'admin', '1', 'infoclass', '0', 'all', '1426662056', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('118', 'admin', '1', 'infoimg', '2', 'add', '1426662073', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('119', 'admin', '1', 'infoclass', '0', 'all', '1426662592', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('120', 'admin', '1', 'nav', '0', 'all', '1426662827', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('121', 'admin', '1', 'diymenu', '0', 'all', '1426662830', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('122', 'admin', '1', 'nav', '0', 'all', '1426662903', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('123', 'admin', '1', 'nav', '0', 'all', '1426665106', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('124', 'admin', '1', 'nav', '0', 'all', '1426665167', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('125', 'admin', '1', 'infoclass', '0', 'all', '1426665231', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('126', 'admin', '1', 'nav', '0', 'all', '1426665265', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('127', 'admin', '1', 'nav', '0', 'all', '1426668034', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('128', 'admin', '1', 'infoclass', '0', 'all', '1426670891', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('129', 'admin', '1', 'nav', '0', 'all', '1426670894', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('130', 'admin', '1', 'infolist', '0', 'all', '1426671131', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('131', 'admin', '1', 'infoclass', '0', 'all', '1426671140', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('132', 'admin', '1', 'nav', '0', 'all', '1426671156', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('133', 'admin', '1', 'diymenu', '0', 'all', '1426671158', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('134', 'admin', '1', 'maintype', '0', 'all', '1426671194', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('135', 'admin', '1', 'infoclass', '0', 'all', '1426671201', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('136', 'admin', '1', 'infoimg', '0', 'all', '1426671216', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('137', 'admin', '1', 'infosrc', '0', 'all', '1426671239', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('138', 'admin', '1', 'web_config', '0', 'all', '1426671289', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('139', 'admin', '1', 'fragment', '0', 'all', '1426671304', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('140', 'admin', '1', 'diymodel', '0', 'all', '1426671306', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('141', 'admin', '1', 'site', '0', 'all', '1426671321', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('142', 'admin', '1', 'infoclass', '0', 'all', '1426671325', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('143', 'admin', '1', 'infoclass', '0', 'all', '1426671394', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('144', 'admin', '1', 'infolist', '0', 'all', '1426671395', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('145', 'admin', '1', 'infosrc', '0', 'all', '1426671426', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('146', 'admin', '1', 'infoflag', '0', 'all', '1426671429', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('147', 'admin', '1', 'infoimg', '0', 'all', '1426671440', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('148', 'admin', '1', 'infolist', '0', 'all', '1426671458', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('149', 'admin', '1', 'infolist', '11', 'add', '1426671498', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('150', 'admin', '1', 'infolist', '0', 'all', '1426671851', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('151', 'admin', '1', 'infolist', '11', 'update', '1426671866', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('152', 'admin', '1', 'infolist', '0', 'all', '1426671913', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('153', 'admin', '1', 'infoclass', '0', 'all', '1426672647', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('154', 'admin', '1', 'info', '0', 'all', '1426672650', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('155', 'admin', '1', 'info', '6', 'update', '1426672656', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('156', 'admin', '1', 'login', '0', '', '1426685452', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('157', 'admin', '1', 'infoflag', '0', 'all', '1426685458', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('158', 'admin', '1', 'infoimg', '0', 'all', '1426685520', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('159', 'admin', '1', 'infoclass', '0', 'all', '1426685536', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('160', 'admin', '1', 'infoclass', '0', 'all', '1426685600', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('161', 'admin', '1', 'infoimg', '3', 'add', '1426685600', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('162', 'admin', '1', 'infoclass', '0', 'all', '1426685681', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('163', 'admin', '1', 'infoimg', '3', 'add', '1426685686', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('164', 'admin', '1', 'infoimg', '0', 'all', '1426685700', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('165', 'admin', '1', 'infoimg', '0', 'all', '1426686273', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('166', 'admin', '1', 'infoimg', '0', 'all', '1426686371', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('167', 'admin', '1', 'infoimg', '18', 'add', '1426686371', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('168', 'admin', '1', 'diyfield', '0', 'all', '1426686383', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('169', 'admin', '1', 'diyfield', '0', 'all', '1426686488', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('170', 'admin', '1', 'infoimg', '0', 'all', '1426686493', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('171', 'admin', '1', 'diyfield', '0', 'all', '1426686549', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('172', 'admin', '1', 'infoimg', '0', 'all', '1426686555', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('173', 'admin', '1', 'infoclass', '0', 'all', '1426686557', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('174', 'admin', '1', 'infoimg', '0', 'all', '1426686617', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('175', 'admin', '1', 'infoimg', '18', 'update', '1426686617', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('176', 'admin', '1', 'infoimg', '0', 'all', '1426687138', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('177', 'admin', '1', 'infoimg', '21', 'add', '1426687138', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('178', 'admin', '1', 'infoimg', '0', 'all', '1426687425', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('179', 'admin', '1', 'infoimg', '18', 'add', '1426687425', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('180', 'admin', '1', 'infoimg', '0', 'all', '1426687589', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('181', 'admin', '1', 'infoclass', '0', 'all', '1426687679', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('182', 'admin', '1', 'infoimg', '0', 'all', '1426687692', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('183', 'admin', '1', 'infoimg', '0', 'all', '1426687823', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('184', 'admin', '1', 'infoimg', '23', 'add', '1426687823', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('185', 'admin', '1', 'infoimg', '23', 'update', '1426687833', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('186', 'admin', '1', 'infoimg', '0', 'all', '1426688028', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('187', 'admin', '1', 'infoimg', '22', 'add', '1426688028', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('188', 'admin', '1', 'infoclass', '0', 'all', '1426688070', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('189', 'admin', '1', 'infoimg', '20', 'update', '1426688081', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('190', 'admin', '1', 'infoimg', '0', 'all', '1426688319', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('191', 'admin', '1', 'infoimg', '20', 'add', '1426688319', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('192', 'admin', '1', 'infoclass', '0', 'all', '1426689297', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('193', 'admin', '1', 'infoclass', '0', 'all', '1426689382', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('194', 'admin', '1', 'infoimg', '16', 'add', '1426689392', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('195', 'admin', '1', 'infoflag', '0', 'all', '1426689426', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('196', 'admin', '1', 'diyfield', '0', 'all', '1426689480', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('197', 'admin', '1', 'infoimg', '0', 'all', '1426689497', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('198', 'admin', '1', 'infoimg', '0', 'all', '1426689562', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('199', 'admin', '1', 'infoimg', '0', 'all', '1426689695', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('200', 'admin', '1', 'infoimg', '16', 'add', '1426689695', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('201', 'admin', '1', 'infoimg', '0', 'all', '1426689757', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('202', 'admin', '1', 'infoimg', '18', 'update', '1426689793', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('203', 'admin', '1', 'infoimg', '0', 'all', '1426689855', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('204', 'admin', '1', 'infoimg', '16', 'add', '1426689855', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('205', 'admin', '1', 'infoclass', '0', 'all', '1426689948', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('206', 'admin', '1', 'infoimg', '0', 'all', '1426690578', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('207', 'admin', '1', 'infoimg', '16', 'update', '1426690583', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('208', 'admin', '1', 'admanage', '0', 'all', '1426690723', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('209', 'admin', '1', 'adtype', '0', 'all', '1426690744', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('210', 'admin', '1', 'adtype', '0', 'all', '1426690829', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('211', 'admin', '1', 'admanage', '0', 'all', '1426690885', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('212', 'admin', '1', 'admanage', '0', 'all', '1426690973', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('213', 'admin', '1', 'admanage', '0', 'all', '1426691806', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('214', 'admin', '1', 'adtype', '0', 'all', '1426692120', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('215', 'admin', '1', 'admanage', '0', 'all', '1426692387', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('216', 'admin', '1', 'adtype', '0', 'all', '1426692484', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('217', 'admin', '1', 'admanage', '0', 'all', '1426692611', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('218', 'admin', '1', 'admanage', '0', 'all', '1426692674', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('219', 'admin', '1', 'admanage', '0', 'all', '1426692871', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('220', 'admin', '1', 'infoimg', '0', 'all', '1426693059', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('221', 'admin', '1', 'infoimg', '23', 'update', '1426693075', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('222', 'admin', '1', 'goodsorder', '0', 'all', '1426713202', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('223', 'admin', '1', 'usercomment', '0', 'all', '1426713237', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('224', 'admin', '1', 'message', '0', 'all', '1426713249', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('225', 'admin', '1', 'goodstype', '0', 'all', '1426713273', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('226', 'admin', '1', 'goods', '0', 'all', '1426713274', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('227', 'admin', '1', 'message', '0', 'all', '1426713328', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('228', 'admin', '1', 'vote', '0', 'all', '1426713343', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('229', 'admin', '1', 'mobile', '0', 'all', '1426713357', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('230', 'admin', '1', 'upload_file', '0', 'all', '1426713370', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('231', 'admin', '1', 'syscount', '0', 'all', '1426713385', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('232', 'admin', '1', 'infoimg', '0', 'all', '1426713730', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('233', 'admin', '1', 'web_config', '0', 'all', '1426717942', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('234', 'admin', '1', 'diymenu', '0', 'all', '1426718798', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('235', 'admin', '1', 'nav', '0', 'all', '1426718800', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('236', 'admin', '1', 'admanage', '0', 'all', '1426719509', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('237', 'admin', '1', 'infoclass', '0', 'all', '1426720597', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('238', 'admin', '1', 'infolist', '10', 'update', '1426720622', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('239', 'admin', '1', 'diymenu', '0', 'all', '1426720715', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('240', 'admin', '1', 'nav', '0', 'all', '1426720722', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('241', 'admin', '1', 'nav', '0', 'all', '1426720785', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('242', 'admin', '1', 'nav', '0', 'all', '1426720931', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('243', 'admin', '1', 'info', '0', 'all', '1426721532', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('244', 'admin', '1', 'info', '0', 'all', '1426721847', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('245', 'admin', '1', 'diyfield', '0', 'all', '1426721855', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('246', 'admin', '1', 'info', '0', 'all', '1426721908', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('247', 'admin', '1', 'infoclass', '0', 'all', '1426722576', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('248', 'admin', '1', 'infolist', '11', 'update', '1426722632', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('249', 'admin', '1', 'infolist', '0', 'all', '1426723246', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('250', 'admin', '1', 'infolist', '8', 'add', '1426723260', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('251', 'admin', '1', 'infolist', '0', 'all', '1426724047', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('252', 'admin', '1', 'infolist', '8', 'update', '1426724059', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('253', 'admin', '1', 'infolist', '0', 'all', '1426725442', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('254', 'admin', '1', 'infolist', '12', 'add', '1426725471', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('255', 'admin', '1', 'infolist', '0', 'all', '1426725650', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('256', 'admin', '1', 'infolist', '12', 'add', '1426725666', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('257', 'admin', '1', 'infolist', '0', 'all', '1426725715', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('258', 'admin', '1', 'infolist', '13', 'add', '1426725729', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('259', 'admin', '1', 'site', '0', 'all', '1426725777', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('260', 'admin', '1', 'web_config', '0', 'all', '1426725780', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('261', 'admin', '1', 'infolist', '0', 'all', '1426725793', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('262', 'admin', '1', 'infolist', '14', 'add', '1426725807', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('263', 'admin', '1', 'infolist', '0', 'all', '1426725859', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('264', 'admin', '1', 'infolist', '15', 'add', '1426725871', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('265', 'admin', '1', 'infoclass', '0', 'all', '1426726336', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('266', 'admin', '1', 'login', '0', '', '1426832738', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('267', 'admin', '1', 'nav', '0', 'all', '1426832746', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('268', 'admin', '1', 'infoclass', '0', 'all', '1426832751', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('269', 'admin', '1', 'nav', '0', 'all', '1426832890', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('270', 'admin', '1', 'infoimg', '0', 'all', '1426833268', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('271', 'admin', '1', 'login', '0', '', '1426840101', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('272', 'admin', '1', 'info', '0', 'all', '1426840204', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('273', 'admin', '1', 'info', '28', 'update', '1426840219', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('274', 'admin', '1', 'info', '0', 'all', '1426840265', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('275', 'admin', '1', 'infoclass', '0', 'all', '1426840481', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('276', 'admin', '1', 'cascade', '0', 'all', '1426843216', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('277', 'admin', '1', 'cascade', '0', 'all', '1426843298', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('278', 'admin', '1', 'admanage', '0', 'all', '1426843913', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('279', 'admin', '1', 'adtype', '0', 'all', '1426843960', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('280', 'admin', '1', 'login', '0', '', '1427082229', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('281', 'admin', '1', 'info', '0', 'all', '1427082419', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('282', 'admin', '1', 'web_config', '0', 'all', '1427084368', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('283', 'admin', '1', 'web_config', '0', 'all', '1427084433', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('284', 'admin', '1', 'cascade', '0', 'all', '1427091051', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('285', 'admin', '1', 'cascade', '0', 'all', '1427101304', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('286', 'admin', '1', 'cascade', '0', 'all', '1427101377', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('287', 'admin', '1', 'cascade', '0', 'all', '1427102691', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('288', 'admin', '1', 'adtype', '0', 'all', '1427107546', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('289', 'admin', '1', 'admanage', '0', 'all', '1427107568', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('290', 'admin', '1', 'admanage', '0', 'all', '1427107647', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('291', 'admin', '1', 'login', '0', '', '1427439768', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('292', 'admin', '1', 'infoclass', '0', 'all', '1427439774', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('293', 'admin', '1', 'infoimg', '0', 'all', '1427442264', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('294', 'admin', '1', 'login', '0', '', '1427693114', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('295', 'admin', '1', 'admanage', '0', 'all', '1427693121', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('296', 'admin', '1', 'adtype', '0', 'all', '1427693124', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('297', 'admin', '1', 'admanage', '0', 'all', '1427693224', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('298', 'admin', '1', 'login', '0', '', '1428738713', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('299', 'admin', '1', 'web_config', '0', 'all', '1428738735', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('300', 'admin', '1', 'login', '0', '', '1428768985', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('301', 'admin', '1', 'upload_filemgr_sql', '0', 'all', '1428768989', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('302', 'admin', '1', 'web_config', '0', 'all', '1428768993', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('303', 'admin', '1', 'infoimg', '0', 'all', '1428769078', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('304', 'admin', '1', 'upload_filemgr_sql', '0', 'all', '1428769133', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('305', 'admin', '1', 'diymodel', '0', 'all', '1428771923', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('306', 'admin', '1', 'job', '0', 'all', '1428771952', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('307', 'admin', '1', 'vote', '0', 'all', '1428771956', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('308', 'admin', '1', 'message', '0', 'all', '1428771961', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('309', 'admin', '1', 'diymodel', '0', 'all', '1428771993', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('310', 'admin', '1', 'infolist', '0', 'all', '1428772048', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('311', 'admin', '1', 'diymodel', '0', 'all', '1428772054', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('312', 'admin', '1', 'usercomment', '0', 'all', '1428772101', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('313', 'admin', '1', 'mobile', '0', 'all', '1428772174', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('314', 'admin', '1', 'editfile', '0', 'all', '1428772189', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('315', 'admin', '1', 'message', '0', 'all', '1428772264', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('316', 'admin', '1', 'message', '0', 'all', '1428772327', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('317', 'admin', '1', 'infoimg', '0', 'all', '1428772548', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('318', 'admin', '1', 'diymodel', '0', 'all', '1428772822', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('319', 'admin', '1', 'site', '0', 'all', '1428773571', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('320', 'admin', '1', 'admin', '0', 'all', '1428773574', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('321', 'admin', '1', 'admingroup', '0', 'all', '1428773575', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('322', 'admin', '1', 'admingroup', '0', 'all', '1428773728', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('323', 'admin', '1', 'admingroup', '0', 'all', '1428773885', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('324', 'admin', '1', 'yuding', '0', 'all', '1428774041', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('325', 'admin', '1', 'message', '0', 'all', '1428774213', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('326', 'admin', '1', 'yuding', '0', 'all', '1428774787', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('327', 'admin', '1', 'yuding', '0', 'all', '1428774851', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('328', 'admin', '1', 'yuding', '0', 'all', '1428774920', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('329', 'admin', '1', 'message', '0', 'all', '1428774933', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('330', 'admin', '1', 'yuding', '0', 'all', '1428774984', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('331', 'admin', '1', 'yuding', '0', 'all', '1428775667', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('332', 'admin', '1', 'yuding', '0', 'all', '1428775737', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('333', 'admin', '1', 'yuding', '0', 'all', '1428775823', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('334', 'admin', '1', 'yuding', '0', 'all', '1428775894', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('335', 'admin', '1', 'yuding', '0', 'all', '1428775962', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('336', 'admin', '1', 'yuding', '0', 'all', '1428776041', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('337', 'admin', '1', 'yuding', '0', 'all', '1428776111', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('338', 'admin', '1', 'yuding', '0', 'all', '1428776189', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('339', 'admin', '1', 'yuding', '0', 'all', '1428776364', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('340', 'admin', '1', 'yuding', '0', 'all', '1428779179', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('341', 'admin', '1', 'nav', '0', 'all', '1428921706', '127.0.0.1');
INSERT INTO `dx_sysevent` VALUES ('342', 'admin', '1', 'yuding', '0', 'all', '1428922396', '127.0.0.1');

-- ----------------------------
-- Table structure for `dx_uploads`
-- ----------------------------
DROP TABLE IF EXISTS `dx_uploads`;
CREATE TABLE `dx_uploads` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '上传信息id',
  `name` varchar(30) NOT NULL COMMENT '文件名称',
  `path` varchar(100) NOT NULL COMMENT '文件路径',
  `size` int(10) NOT NULL COMMENT '文件大小',
  `type` enum('image','soft','media') NOT NULL COMMENT '文件类型',
  `posttime` int(10) NOT NULL COMMENT '上传日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_uploads
-- ----------------------------
INSERT INTO `dx_uploads` VALUES ('1', '1426695729.jpg', 'uploads/image/20150318/1426695729.jpg', '13079', 'image', '1426685950');
INSERT INTO `dx_uploads` VALUES ('2', '1426691819.png', 'uploads/image/20150318/1426691819.png', '81627', 'image', '1426686246');
INSERT INTO `dx_uploads` VALUES ('3', '1426692285.png', 'uploads/image/20150318/1426692285.png', '103043', 'image', '1426686323');
INSERT INTO `dx_uploads` VALUES ('4', '1426693567.png', 'uploads/image/20150318/1426693567.png', '84576', 'image', '1426686324');
INSERT INTO `dx_uploads` VALUES ('5', '1426689029.png', 'uploads/image/20150318/1426689029.png', '137831', 'image', '1426686707');
INSERT INTO `dx_uploads` VALUES ('6', '1426689094.jpg', 'uploads/image/20150318/1426689094.jpg', '22032', 'image', '1426687130');
INSERT INTO `dx_uploads` VALUES ('7', '1426695538.jpg', 'uploads/image/20150318/1426695538.jpg', '28732', 'image', '1426687387');
INSERT INTO `dx_uploads` VALUES ('8', '1426690042.jpg', 'uploads/image/20150318/1426690042.jpg', '24272', 'image', '1426687599');
INSERT INTO `dx_uploads` VALUES ('9', '1426694191.jpg', 'uploads/image/20150318/1426694191.jpg', '29993', 'image', '1426688001');
INSERT INTO `dx_uploads` VALUES ('10', '1426692342.jpg', 'uploads/image/20150318/1426692342.jpg', '38780', 'image', '1426688219');
INSERT INTO `dx_uploads` VALUES ('11', '1426692587.jpg', 'uploads/image/20150318/1426692587.jpg', '34733', 'image', '1426690940');
INSERT INTO `dx_uploads` VALUES ('12', '1426693827.jpg', 'uploads/image/20150318/1426693827.jpg', '34230', 'image', '1426692400');
INSERT INTO `dx_uploads` VALUES ('13', '1426697774.jpg', 'uploads/image/20150318/1426697774.jpg', '21303', 'image', '1426692638');
INSERT INTO `dx_uploads` VALUES ('14', '1426696300.jpg', 'uploads/image/20150318/1426696300.jpg', '41374', 'image', '1426692698');
INSERT INTO `dx_uploads` VALUES ('15', '1426696402.jpg', 'uploads/image/20150318/1426696402.jpg', '32573', 'image', '1426692716');
INSERT INTO `dx_uploads` VALUES ('16', '1426729254.jpg', 'uploads/image/20150319/1426729254.jpg', '50038', 'image', '1426719537');
INSERT INTO `dx_uploads` VALUES ('17', '1427114525.jpg', 'uploads/image/20150323/1427114525.jpg', '16006', 'image', '1427107582');
INSERT INTO `dx_uploads` VALUES ('18', '1427698846.jpg', 'uploads/image/20150330/1427698846.jpg', '37691', 'image', '1427693162');
INSERT INTO `dx_uploads` VALUES ('19', '1427695172.png', 'uploads/image/20150330/1427695172.png', '12147', 'image', '1427693234');

-- ----------------------------
-- Table structure for `dx_usercomment`
-- ----------------------------
DROP TABLE IF EXISTS `dx_usercomment`;
CREATE TABLE `dx_usercomment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `aid` int(10) unsigned NOT NULL COMMENT '信息id',
  `molds` tinyint(1) unsigned NOT NULL COMMENT '信息类型',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `uname` varchar(20) NOT NULL COMMENT '用户名',
  `body` text NOT NULL COMMENT '评论内容',
  `reply` text NOT NULL COMMENT '回复内容',
  `link` varchar(200) NOT NULL COMMENT '评论网址',
  `time` int(10) unsigned NOT NULL COMMENT '评论时间',
  `ip` varchar(30) NOT NULL COMMENT '评论ip',
  `isshow` tinyint(1) unsigned NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_usercomment
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_userfavorite`
-- ----------------------------
DROP TABLE IF EXISTS `dx_userfavorite`;
CREATE TABLE `dx_userfavorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `aid` int(10) unsigned NOT NULL COMMENT '信息id',
  `molds` tinyint(1) unsigned NOT NULL COMMENT '信息类型',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `uname` varchar(20) NOT NULL COMMENT '用户名',
  `link` varchar(200) NOT NULL COMMENT '收藏网址',
  `time` int(10) unsigned NOT NULL COMMENT '评论时间',
  `ip` varchar(30) NOT NULL COMMENT '评论ip',
  `isshow` tinyint(1) unsigned NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_userfavorite
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_usergroup`
-- ----------------------------
DROP TABLE IF EXISTS `dx_usergroup`;
CREATE TABLE `dx_usergroup` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id',
  `groupname` varchar(30) NOT NULL COMMENT '用户组名称',
  `expvala` int(11) NOT NULL COMMENT '用户组经验介于a',
  `expvalb` int(11) NOT NULL COMMENT '用户组经验介于b',
  `stars` int(10) unsigned NOT NULL COMMENT '星星数',
  `color` varchar(10) NOT NULL COMMENT '头衔颜色',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_usergroup
-- ----------------------------
INSERT INTO `dx_usergroup` VALUES ('1', '禁止访问', '-99999', '0', '0', '');
INSERT INTO `dx_usergroup` VALUES ('2', '新手会员', '1', '50', '1', '');
INSERT INTO `dx_usergroup` VALUES ('3', '初级会员', '51', '200', '4', '');
INSERT INTO `dx_usergroup` VALUES ('4', '中级会员', '201', '500', '8', '');
INSERT INTO `dx_usergroup` VALUES ('5', '高级会员', '501', '1000', '12', '');
INSERT INTO `dx_usergroup` VALUES ('6', '金牌会员', '1001', '3000', '16', '');

-- ----------------------------
-- Table structure for `dx_vote`
-- ----------------------------
DROP TABLE IF EXISTS `dx_vote`;
CREATE TABLE `dx_vote` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '投票id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `title` varchar(30) NOT NULL COMMENT '投票标题',
  `content` text NOT NULL COMMENT '投票描述',
  `starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `isguest` enum('true','false') NOT NULL COMMENT '游客投票',
  `isview` enum('true','false') NOT NULL COMMENT '查看投票',
  `intval` int(10) unsigned NOT NULL COMMENT '投票间隔',
  `isradio` tinyint(1) unsigned NOT NULL COMMENT '是否多选',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  `posttime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_vote
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_votedata`
-- ----------------------------
DROP TABLE IF EXISTS `dx_votedata`;
CREATE TABLE `dx_votedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '投票数据id',
  `voteid` smallint(6) unsigned NOT NULL COMMENT '投票id',
  `optionid` text NOT NULL COMMENT '选票id',
  `userid` int(10) unsigned NOT NULL COMMENT '投票人id',
  `posttime` int(10) unsigned NOT NULL COMMENT '投票时间',
  `ip` varchar(30) NOT NULL COMMENT '投票ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_votedata
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_voteoption`
-- ----------------------------
DROP TABLE IF EXISTS `dx_voteoption`;
CREATE TABLE `dx_voteoption` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '投票选项id',
  `voteid` smallint(6) unsigned NOT NULL COMMENT '投票id',
  `options` varchar(30) NOT NULL COMMENT '投票选项',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_voteoption
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_webconfig`
-- ----------------------------
DROP TABLE IF EXISTS `dx_webconfig`;
CREATE TABLE `dx_webconfig` (
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `varname` varchar(50) NOT NULL COMMENT '变量名称',
  `varinfo` varchar(80) NOT NULL COMMENT '参数说明',
  `vargroup` smallint(5) unsigned NOT NULL COMMENT '所属组',
  `vartype` char(10) NOT NULL COMMENT '变量类型',
  `varvalue` text NOT NULL COMMENT '变量值',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  PRIMARY KEY (`varname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_webconfig
-- ----------------------------
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_webname', '网站名称', '0', 'string', '我的网站', '1');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_weburl', '网站地址', '0', 'string', 'http://127.0.0.1', '2');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_webpath', '网站目录', '0', 'string', '/business/lyshuxiang.com', '3');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_author', '网站作者', '0', 'string', '', '4');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_generator', '程序引擎', '0', 'string', '', '5');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_seotitle', 'SEO标题', '0', 'string', '洛阳舒翔假期国际旅行社', '6');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_keyword', '关键字设置', '0', 'string', '洛阳旅行社、洛阳旅游、旅游线路、云台山', '7');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_description', '网站描述', '0', 'bstring', '洛阳十佳旅行社，洛阳读者最受欢迎旅行社，洛阳最具实力旅行社', '8');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_copyright', '版权信息', '0', 'bstring', 'Copyright © 2014-2015 lyshuxiang.com 洛阳舒翔假期旅行社 All Rights Reserved', '9');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_hotline', '客服热线', '0', 'string', '0379-65297860', '10');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_icp', '备案编号', '0', 'string', '豫ICP备13007962号-1', '11');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_webswitch', '启用站点', '0', 'bool', 'Y', '12');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_switchshow', '关闭说明', '0', 'bstring', '对不起，网站维护，请稍后登录。<br />网站维护期间对您造成的不便，请谅解！', '13');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_upload_img_type', '上传图片类型', '1', 'string', 'gif|png|jpg|bmp', '23');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_upload_soft_type', '上传软件类型', '1', 'string', 'zip|gz|rar|iso|doc|xls|ppt|wps|txt', '24');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_upload_media_type', '上传媒体类型', '1', 'string', 'swf|flv|mpg|mp3|rm|rmvb|wmv|wma|wav', '25');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_max_file_size', '上传文件大小', '1', 'string', '2097152', '26');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_imgresize', '自动缩略图方式　<br />(是\"裁切\",否\"填充\")', '1', 'bool', 'Y', '27');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_countcode', '流量统计代码', '1', 'bstring', '', '28');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_qqcode', '在线QQ　<br />(多个用\",\"分隔)', '1', 'bstring', '', '29');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_mysql_type', '数据库类型(支持mysql和mysqli)', '2', 'string', 'mysqli', '40');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_pagenum', '每页显示记录数', '2', 'string', '20', '41');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_timezone', '服务器时区设置', '2', 'string', '8', '42');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_mobile', '自动跳转手机版', '2', 'bool', 'N', '43');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_member', '开启会员功能', '2', 'bool', 'N', '44');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_oauth', '开启一键登录', '2', 'bool', 'N', '45');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_comment', '开启文章评论', '2', 'bool', 'N', '46');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_maintype', '开启二级类别', '2', 'bool', 'N', '47');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_typefold', '类别默认折叠', '2', 'bool', 'N', '48');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_quicktool', '管理页工具条', '2', 'bool', 'Y', '49');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_diserror', 'PHP错误显示', '2', 'bool', 'Y', '50');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_isreurl', '是否启用伪静态', '3', 'bool', 'N', '60');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_index', '首页规则', '3', 'string', 'index.html', '61');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_about', '关于我们页', '3', 'string', '{about}-{cid}-{page}.html', '62');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_news', '新闻中心页', '3', 'string', '{news}-{cid}-{page}.html', '63');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_newsshow', '新闻内容页', '3', 'string', '{newsshow}-{cid}-{id}-{page}.html', '64');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_product', '产品展示页', '3', 'string', '{product}-{cid}-{page}.html', '65');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_productshow', '产品内容页', '3', 'string', '{productshow}-{cid}-{id}-{page}.html', '66');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_case', '案例展示页', '3', 'string', '{case}-{cid}-{page}.html', '67');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_caseshow', '案例内容页', '3', 'string', '{caseshow}-{cid}-{id}-{page}.html', '68');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_join', '人才招聘页', '3', 'string', '{join}-{page}.html', '69');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_joinshow', '招聘内容页', '3', 'string', '{joinshow}-{id}.html', '70');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_message', '客户留言页', '3', 'string', '{message}-{page}.html', '71');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_contact', '联系我们页', '3', 'string', '{contact}-{cid}-{page}.html', '72');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_soft', '软件下载页', '3', 'string', '{soft}-{cid}-{page}.html', '73');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_softshow', '软件内容页', '3', 'string', '{softshow}-{cid}-{id}-{page}.html', '74');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_goods', '商品展示页', '3', 'string', '{goods}-{cid}-{tid}-{page}.html', '75');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_goodsshow', '商品内容页', '3', 'string', '{goodsshow}-{cid}-{tid}-{id}-{page}.html', '76');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_vote', '投票内容页', '3', 'string', '{vote}-{id}.html', '77');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_reurl_custom', '自定义规则', '3', 'string', '{file}.html', '78');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_auth_key', '网站标识码', '4', 'string', '69YPYS1dPAZG1K2b', '90');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_alipay_uname', '支付宝帐户', '4', 'string', '', '91');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_alipay_partner', '支付宝合作身份者ID', '4', 'string', '', '92');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_alipay_key', '支付宝安全检验码', '4', 'string', '', '93');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_qq_appid', 'QQ登录组件AppID', '4', 'string', '', '94');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_qq_appkey', 'QQ登录组件AppKey', '4', 'string', '', '95');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_weibo_appid', '微博登录组件AppID', '4', 'string', '', '96');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_weibo_appkey', '微博登录组件AppKey', '4', 'string', '', '97');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_welcome', '欢迎语', '0', 'string', '您好，欢迎来到舒翔假期！轻松旅行，完美生活。', '98');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_linerows', '线路列表每页数量', '2', 'number', '10', '99');
INSERT INTO `dx_webconfig` VALUES ('1', 'cfg_company_address', '公司地址', '0', 'string', '洛阳市西工区七一路九州大厦1019', '100');

-- ----------------------------
-- Table structure for `dx_weblink`
-- ----------------------------
DROP TABLE IF EXISTS `dx_weblink`;
CREATE TABLE `dx_weblink` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '友情链接id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `classid` smallint(5) unsigned NOT NULL COMMENT '所属类别id',
  `parentid` smallint(5) unsigned NOT NULL COMMENT '所属类别父id',
  `parentstr` varchar(80) NOT NULL COMMENT '所属类别父id字符串',
  `webname` varchar(30) NOT NULL COMMENT '网站名称',
  `webnote` varchar(200) NOT NULL COMMENT '网站描述',
  `picurl` varchar(100) NOT NULL COMMENT '缩略图片',
  `linkurl` varchar(255) NOT NULL COMMENT '跳转链接',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列排序',
  `posttime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_weblink
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_weblinktype`
-- ----------------------------
DROP TABLE IF EXISTS `dx_weblinktype`;
CREATE TABLE `dx_weblinktype` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '友情链接类型id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `parentid` smallint(5) unsigned NOT NULL COMMENT '类别父id',
  `parentstr` varchar(50) NOT NULL COMMENT '类别父id字符串',
  `classname` varchar(30) NOT NULL COMMENT '类别名称',
  `orderid` smallint(5) unsigned NOT NULL COMMENT '排列顺序',
  `checkinfo` enum('true','false') NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_weblinktype
-- ----------------------------

-- ----------------------------
-- Table structure for `dx_yuding`
-- ----------------------------
DROP TABLE IF EXISTS `dx_yuding`;
CREATE TABLE `dx_yuding` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '站点id',
  `linename` varchar(255) NOT NULL COMMENT '线路名称',
  `customer` varchar(30) NOT NULL COMMENT '联系人',
  `contact` varchar(50) NOT NULL COMMENT '联系方式',
  `content` text COMMENT '预订留言',
  `remark` text COMMENT '跟进备注',
  `retime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '跟进时间',
  `orderid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '排列排序',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dx_yuding
-- ----------------------------
INSERT INTO `dx_yuding` VALUES ('2', '1', '1123', '1232323', '1333333333', '<span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span>预订留言<span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span><span style=\"color:#333333;font-family:微软雅黑, Arial, 宋体;line-height:normal;text-align:-webkit-right;white-space:normal;\">预订留言</span>', '11', '0', '1', '1428775827');
INSERT INTO `dx_yuding` VALUES ('4', '1', '龙门石窟、白马寺、牡丹园一日游', '斯蒂芬', '2323', '', '', '0', '0', '1428779146');
INSERT INTO `dx_yuding` VALUES ('5', '1', '龙门石窟、白马寺、牡丹园一日游', '斯蒂芬', '2323', '', '', '0', '0', '1428779168');
INSERT INTO `dx_yuding` VALUES ('6', '1', '龙门石窟、白马寺、牡丹园一日游', '11', '11', '11', null, '0', '0', '1428921163');
INSERT INTO `dx_yuding` VALUES ('7', '1', '龙潭大峡谷一日游', '111', '13333333333', 'ceshi', null, '0', '0', '1428922376');
