/*
Navicat MySQL Data Transfer

Source Server         : longye
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : orchard

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-03-09 17:41:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bigtype
-- ----------------------------
DROP TABLE IF EXISTS `bigtype`;
CREATE TABLE `bigtype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bigtype
-- ----------------------------
INSERT INTO `bigtype` VALUES ('1', '果园优选', '2017-05-07 00:00:00');
INSERT INTO `bigtype` VALUES ('2', '新鲜水果', '2017-05-08 00:00:00');
INSERT INTO `bigtype` VALUES ('3', '水产海鲜', '2017-05-09 00:00:00');
INSERT INTO `bigtype` VALUES ('4', '肉禽蛋类', '2017-05-10 00:00:00');
INSERT INTO `bigtype` VALUES ('5', '乳品速食', '2017-05-11 00:00:00');
INSERT INTO `bigtype` VALUES ('6', '时令鲜蔬', '2017-05-12 00:00:00');
INSERT INTO `bigtype` VALUES ('7', '粮油干货', '2017-05-13 00:00:00');
INSERT INTO `bigtype` VALUES ('8', '休闲食品', '2017-05-14 00:00:00');
INSERT INTO `bigtype` VALUES ('9', '冲调保健', '2017-05-15 00:00:00');
INSERT INTO `bigtype` VALUES ('10', '礼盒券卡', '2017-05-16 00:00:00');
INSERT INTO `bigtype` VALUES ('11', '果园周边', '2017-05-17 00:00:00');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('21', '1', '4', '2', '2018-03-08 16:11:27');
INSERT INTO `cart` VALUES ('20', '1', '3', '1', '2018-03-08 10:17:27');
INSERT INTO `cart` VALUES ('9', '3', '2', '1', '2018-03-07 14:53:05');
INSERT INTO `cart` VALUES ('8', '2', '2', '1', '2018-03-07 14:52:57');
INSERT INTO `cart` VALUES ('19', '1', '2', '3', '2018-03-08 10:17:22');
INSERT INTO `cart` VALUES ('18', '1', '1', '1', '2018-03-08 10:17:14');
INSERT INTO `cart` VALUES ('13', '2', '3', '2', '2018-03-07 14:53:42');
INSERT INTO `cart` VALUES ('14', '2', '5', '2', '2018-03-07 14:53:49');
INSERT INTO `cart` VALUES ('17', '1', '7', '1', '2018-03-08 10:17:09');
INSERT INTO `cart` VALUES ('22', '6', '1', '10', '2018-03-09 11:46:13');
INSERT INTO `cart` VALUES ('25', '6', '2', '1', '2018-03-09 10:59:40');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bigtypeid` int(11) DEFAULT NULL,
  `smalltypeid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `describes` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '描述',
  `price` decimal(10,2) DEFAULT NULL,
  `saleprice` decimal(10,2) DEFAULT NULL,
  `saleqty` int(11) DEFAULT NULL,
  `hot` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mainimg` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `detailsimg` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=254 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '1', '1', '佳沛意大利金奇异果 12个', '当季金果 甜滋水润', '100.00', '88.00', '200', 'y', 'https://imgqn8.fruitday.com/images/product_pic/4449/1/1-270x270-4449-XP99U2K9.jpg', 'https://imgqn8.fruitday.com/images/product_pic/4449/1/1-270x270-4449-XP99U2K9.jpg,https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg,https://imgqn8.fruitday.com/images/product_pic/36/1/1-270x270-36-PWFA3B5F.jpg', '13', '2018-03-02 12:11:00');
INSERT INTO `goods` VALUES ('2', '1', '1', '佳沛意大利金奇异果 6个', '当季金果 甜滋水润', '101.00', '89.00', '200', 'y', 'https://imgjd4.fruitday.com/images/product_pic/4449/1/1-270x270-4449-XP99U2K9.jpg', 'https://imgqn8.fruitday.com/images/product_pic/4449/1/1-270x270-4449-XP99U2K9.jpg,https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg,https://imgqn8.fruitday.com/images/product_pic/36/1/1-270x270-36-PWFA3B5F.jpg', '14', '2018-03-03 12:11:00');
INSERT INTO `goods` VALUES ('3', '1', '1', '佳沛意大利绿奇异果（原箱） 36个', '细嫩绿芯 酸甜爽口', '102.00', '90.00', '300', 'n', 'https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg', 'https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg,https://imgqn8.fruitday.com/images/product_pic/4449/1/1-270x270-4449-XP99U2K9.jpg', '15', '2018-03-09 17:39:53');
INSERT INTO `goods` VALUES ('4', '1', '1', '佳沛意大利绿奇异果 12个', '细嫩绿芯 酸甜爽口', '103.00', '91.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/36/1/1-270x270-36-PWFA3B5F.jpg', 'https://imgqn8.fruitday.com/images/product_pic/36/1/1-270x270-36-PWFA3B5F.jpg,https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg,https://imgqn8.fruitday.com/images/product_pic/4449/1/1-270x270-4449-XP99U2K9.jpg', '16', '2018-03-05 12:11:00');
INSERT INTO `goods` VALUES ('5', '1', '1', '佳沛意大利绿奇异果 6个', '细嫩绿芯 酸甜爽口', '104.00', '92.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/36/1/1-270x270-36-PWFA3B5F.jpg', 'https://imgjd7.fruitday.com/images/product_pic/36/1/1-270x270-36-PWFA3B5F.jpg,https://imgjd7.fruitday.com/images/product_pic/36/1/1-270x270-36-PWFA3B5F.jpg', '17', '2018-03-06 12:11:00');
INSERT INTO `goods` VALUES ('6', '1', '2', '美国华盛顿甜脆红地厘蛇果 6个', '经典红果 甜脆出众', '105.00', '93.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/52/1/1-270x270-52-HF73PYWP.jpg', 'https://imgqn9.fruitday.com/images/product_pic/52/1/1-270x270-52-HF73PYWP.jpg,https://imgjd3.fruitday.com/images/product_pic/46/1/1-270x270-46-CUDTC1KY.jpg', '18', '2018-03-07 12:11:00');
INSERT INTO `goods` VALUES ('7', '1', '2', '新疆富士苹果 2.5kg', '节气后采摘 应季冰糖心', '106.00', '94.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/46/1/1-270x270-46-CUDTC1KY.jpg', 'https://imgjd3.fruitday.com/images/product_pic/46/1/1-270x270-46-CUDTC1KY.jpg,https://imgjd2.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg', '19', '2018-03-08 12:11:00');
INSERT INTO `goods` VALUES ('8', '1', '2', '静宁富士苹果 2.5kg', '从云端摘下的苹果 太甜脆', '107.00', '95.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg', 'https://imgjd2.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg,https://imgjd2.fruitday.com/images/product_pic/49/1/1-270x270-49-D6PKH6S9.jpg', '20', '2018-03-09 12:11:00');
INSERT INTO `goods` VALUES ('9', '1', '2', '新疆富士苹果 1kg', '节气后采摘 应季冰糖心', '108.00', '96.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/46/1/1-270x270-46-CUDTC1KY.jpg', 'https://imgjd5.fruitday.com/images/product_pic/46/1/1-270x270-46-CUDTC1KY.jpg,https://imgjd3.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg', '21', '2018-03-10 12:11:00');
INSERT INTO `goods` VALUES ('10', '1', '2', '静宁富士苹果 1kg', '从云端摘下的苹果 太甜脆', '109.00', '97.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg', 'https://imgjd3.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg,https://imgjd2.fruitday.com/images/product_pic/49/1/1-270x270-49-D6PKH6S9.jpg', '22', '2018-03-11 12:11:00');
INSERT INTO `goods` VALUES ('11', '1', '2', '美国青苹果 3个', '青皮白肉 酸甜清新', '110.00', '98.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/586/1/1-270x270-586-645CDU4F.jpg', 'https://imgjd3.fruitday.com/images/product_pic/586/1/1-270x270-586-645CDU4F.jpg,https://imgjd3.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg', '23', '2018-03-12 12:11:00');
INSERT INTO `goods` VALUES ('12', '1', '2', '优选美国爱妃苹果 6个', '优选钻石颜值 甜脆嚼多汁', '111.00', '99.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/49/1/1-270x270-49-D6PKH6S9.jpg', 'https://imgjd2.fruitday.com/images/product_pic/49/1/1-270x270-49-D6PKH6S9.jpg,https://imgjd2.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg', '24', '2018-03-13 12:11:00');
INSERT INTO `goods` VALUES ('13', '1', '3', '新奇士美国脐橙 20个', '阳光脐橙 饱满多汁', '112.00', '100.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg', 'https://imgjd5.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg,https://imgjd5.fruitday.com/images/product_pic/4196/1/1-270x270-4196-DA598TP7.jpg', '25', '2018-03-14 12:11:00');
INSERT INTO `goods` VALUES ('14', '1', '3', '以色列白心青柚 2个', '只有多汁 不要苦涩', '113.00', '101.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/4196/1/1-270x270-4196-DA598TP7.jpg', 'https://imgjd5.fruitday.com/images/product_pic/4196/1/1-270x270-4196-DA598TP7.jpg,https://imgjd5.fruitday.com/images/product_pic/4196/1/1-270x270-4196-DA598TP7.jpg', '26', '2018-03-15 12:11:00');
INSERT INTO `goods` VALUES ('15', '1', '3', '新奇士美国脐橙 6个', '阳光脐橙 饱满多汁', '114.00', '102.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg', 'https://imgjd1.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg,https://imgjd5.fruitday.com/images/product_pic/4196/1/1-270x270-4196-DA598TP7.jpg', '27', '2018-03-16 12:11:00');
INSERT INTO `goods` VALUES ('16', '1', '3', '台湾茂谷柑 500g', '浓甜无渣 瓣瓣多汁', '115.00', '103.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/500/1/1-270x270-500-3A4YF743.jpg', 'https://imgjd6.fruitday.com/images/product_pic/500/1/1-270x270-500-3A4YF743.jpg,https://imgjd5.fruitday.com/images/product_pic/4196/1/1-270x270-4196-DA598TP7.jpg', '28', '2018-03-17 12:11:00');
INSERT INTO `goods` VALUES ('17', '1', '3', '台湾茂谷柑 1kg', '浓甜无渣 瓣瓣多汁', '116.00', '104.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/500/1/1-270x270-500-3A4YF743.jpg', 'https://imgjd5.fruitday.com/images/product_pic/500/1/1-270x270-500-3A4YF743.jpg,https://imgjd5.fruitday.com/images/product_pic/4196/1/1-270x270-4196-DA598TP7.jpg', '29', '2018-03-18 12:11:00');
INSERT INTO `goods` VALUES ('18', '1', '3', '新奇士美国柠檬 4个', '满满vc 每天一杯柠檬水', '117.00', '105.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg', 'https://imgqn8.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg,https://imgjd5.fruitday.com/images/product_pic/4196/1/1-270x270-4196-DA598TP7.jpg', '30', '2018-03-19 12:11:00');
INSERT INTO `goods` VALUES ('19', '1', '3', '新奇士美国柠檬 8个', '满满vc 每天一杯柠檬水', '118.00', '106.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg', 'https://imgqn9.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg,https://imgjd5.fruitday.com/images/product_pic/4196/1/1-270x270-4196-DA598TP7.jpg', '31', '2018-03-20 12:11:00');
INSERT INTO `goods` VALUES ('20', '1', '5', '澳洲菲力牛排(谷饲120天) 180g', '低脂肉香 嫩而多', '119.00', '107.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/2301/1/1-270x270-2301-376XWY3T.jpg', 'https://imgjd5.fruitday.com/images/product_pic/2301/1/1-270x270-2301-376XWY3T.jpg,https://imgqn9.fruitday.com/images/product_pic/2299/1/1-270x270-2299-Y7XAKPBP.jpg', '32', '2018-03-21 12:11:00');
INSERT INTO `goods` VALUES ('21', '1', '5', '澳洲西冷牛排(谷饲120天) 200g', '齿间厮磨的西冷香', '120.00', '108.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/2299/1/1-270x270-2299-Y7XAKPBP.jpg', 'https://imgqn9.fruitday.com/images/product_pic/2299/1/1-270x270-2299-Y7XAKPBP.jpg,https://imgjd5.fruitday.com/images/product_pic/2301/1/1-270x270-2301-376XWY3T.jpg', '23', '2018-03-22 12:11:00');
INSERT INTO `goods` VALUES ('22', '1', '5', '澳洲眼肉牛排(谷饲120天) 200g', '肉质嫩而多汁', '121.00', '109.00', '200', 'n', 'https://imgjd4.fruitday.com/images/product_pic/2300/1/1-270x270-2300-DBTF53KW.jpg', 'https://imgjd4.fruitday.com/images/product_pic/2300/1/1-270x270-2300-DBTF53KW.jpg,https://imgjd5.fruitday.com/images/product_pic/2301/1/1-270x270-2301-376XWY3T.jpg', '24', '2018-03-23 12:11:00');
INSERT INTO `goods` VALUES ('23', '1', '5', '澳洲牛肋条(谷饲120天) 500g', '肥瘦均匀 肉嫩鲜美', '122.00', '110.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/2305/1/1-270x270-2305-3XU8D5Y2.jpg', 'https://imgqn9.fruitday.com/images/product_pic/2305/1/1-270x270-2305-3XU8D5Y2.jpg,https://imgqn9.fruitday.com/images/product_pic/2299/1/1-270x270-2299-Y7XAKPBP.jpg', '25', '2018-03-24 12:11:00');
INSERT INTO `goods` VALUES ('24', '1', '4', '爱尔兰海螯虾（刺身级） 500g', '刺身圈的小香风', '123.00', '111.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/2039/1/1-270x270-2039-WD7R42A8.jpg', 'https://imgjd3.fruitday.com/images/product_pic/2039/1/1-270x270-2039-WD7R42A8.jpg,https://imgjd5.fruitday.com/images/product_pic/2032/1/1-270x270-2032-H9AHA87X.jpg', '26', '2018-03-25 12:11:00');
INSERT INTO `goods` VALUES ('25', '1', '4', '原装南美白对虾 500g', '皮脆肉嫩还弹牙', '124.00', '112.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/488/1/1-270x270-488-W6UA4ST1.jpg', 'https://imgqn8.fruitday.com/images/product_pic/488/1/1-270x270-488-W6UA4ST1.jpg,https://imgjd3.fruitday.com/images/product_pic/2039/1/1-270x270-2039-WD7R42A8.jpg', '27', '2018-03-26 12:11:00');
INSERT INTO `goods` VALUES ('26', '1', '4', '熟冻泰国黑虎虾 400g', '鲜甜弹润 嚼劲十足', '125.00', '113.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/486/1/1-270x270-486-39U7CTX2.jpg', 'https://imgjd3.fruitday.com/images/product_pic/486/1/1-270x270-486-39U7CTX2.jpg,https://imgjd3.fruitday.com/images/product_pic/2039/1/1-270x270-2039-WD7R42A8.jpg', '28', '2018-03-27 12:11:00');
INSERT INTO `goods` VALUES ('27', '1', '4', '冻南美白对虾 250g', '壳薄肉肥 大快朵颐吃虾', '126.00', '114.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/2783/1/1-270x270-2783-KS5BSTAX.jpg', 'https://imgqn9.fruitday.com/images/product_pic/2783/1/1-270x270-2783-KS5BSTAX.jpg,https://imgjd5.fruitday.com/images/product_pic/2032/1/1-270x270-2032-H9AHA87X.jpg', '29', '2018-03-28 12:11:00');
INSERT INTO `goods` VALUES ('28', '1', '4', '越南黑虎虾仁（大） 200g', '大颗才过瘾', '127.00', '115.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/2032/1/1-270x270-2032-H9AHA87X.jpg', 'https://imgjd5.fruitday.com/images/product_pic/2032/1/1-270x270-2032-H9AHA87X.jpg,https://imgjd5.fruitday.com/images/product_pic/2032/1/1-270x270-2032-H9AHA87X.jpg', '30', '2018-03-29 12:11:00');
INSERT INTO `goods` VALUES ('29', '1', '6', '雪花牛肉粒（草原和牛） 300g', '粒粒鲜嫩才牛气', '128.00', '116.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/312/1/1-270x270-312-HWRXFCF1.jpg', 'https://imgjd7.fruitday.com/images/product_pic/312/1/1-270x270-312-HWRXFCF1.jpg,https://imgjd7.fruitday.com/images/product_pic/2296/1/1-270x270-2296-CDBY921D.jpg', '31', '2018-03-30 12:11:00');
INSERT INTO `goods` VALUES ('30', '1', '6', '草原和牛牛蹄筋 300g', '煮久不烂 整块厚实', '129.00', '117.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/313/1/1-270x270-313-89X63C77.jpg', 'https://imgqn9.fruitday.com/images/product_pic/313/1/1-270x270-313-89X63C77.jpg,https://imgjd7.fruitday.com/images/product_pic/312/1/1-270x270-312-HWRXFCF1.jpg', '32', '2018-03-31 12:11:00');
INSERT INTO `goods` VALUES ('31', '1', '6', '澳洲草饲牛腱子(S级) 1000g', '筋肉交错 弹力十足', '130.00', '118.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/2296/1/1-270x270-2296-CDBY921D.jpg', 'https://imgjd7.fruitday.com/images/product_pic/2296/1/1-270x270-2296-CDBY921D.jpg,https://imgjd7.fruitday.com/images/product_pic/312/1/1-270x270-312-HWRXFCF1.jpg', '33', '2018-04-01 12:11:00');
INSERT INTO `goods` VALUES ('32', '1', '7', '卡士原味鲜酪乳 三联杯*2', '经典原味 口感顺滑', '131.00', '119.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/161/1/1-270x270-161-TAW9WCYP.jpg', 'https://imgjd2.fruitday.com/images/product_pic/161/1/1-270x270-161-TAW9WCYP.jpg,https://imgjd6.fruitday.com/images/product_pic/3418/1/1-270x270-3418-2YXKBTXP.jpg', '13', '2018-04-02 12:11:00');
INSERT INTO `goods` VALUES ('33', '1', '7', '卡士原味鲜酪乳 三联杯*1', '经典原味 口感顺滑', '132.00', '120.00', '200', 'y', 'https://imgqn9.fruitday.com/images/product_pic/161/1/1-270x270-161-TAW9WCYP.jpg', 'https://imgqn9.fruitday.com/images/product_pic/161/1/1-270x270-161-TAW9WCYP.jpg,https://imgjd6.fruitday.com/images/product_pic/3418/1/1-270x270-3418-2YXKBTXP.jpg', '14', '2018-04-03 12:11:00');
INSERT INTO `goods` VALUES ('34', '1', '7', '卡士发酵乳（餐后一小时） 250g*3', '100亿双歧杆菌 更活力', '133.00', '121.00', '200', 'y', 'https://imgqn9.fruitday.com/images/product_pic/2401/1/1-270x270-2401-WP4T1KYS.jpg', 'https://imgqn9.fruitday.com/images/product_pic/2401/1/1-270x270-2401-WP4T1KYS.jpg,https://imgjd6.fruitday.com/images/product_pic/3418/1/1-270x270-3418-2YXKBTXP.jpg', '15', '2018-04-04 12:11:00');
INSERT INTO `goods` VALUES ('35', '1', '7', '卡士鲜酪乳（蓝莓） 100g*3', '醇厚丝滑 蓝莓嚼得到', '134.00', '122.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/3418/1/1-270x270-3418-2YXKBTXP.jpg', 'https://imgjd6.fruitday.com/images/product_pic/3418/1/1-270x270-3418-2YXKBTXP.jpg,https://imgqn9.fruitday.com/images/product_pic/161/1/1-270x270-161-TAW9WCYP.jpg', '16', '2018-04-05 12:11:00');
INSERT INTO `goods` VALUES ('36', '1', '7', '卡士原态酪乳三联杯 375g', '香浓细腻 入口柔滑', '135.00', '123.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/164/1/1-270x270-164-8K3AHH13.jpg', 'https://imgjd3.fruitday.com/images/product_pic/164/1/1-270x270-164-8K3AHH13.jpg,https://imgqn9.fruitday.com/images/product_pic/161/1/1-270x270-161-TAW9WCYP.jpg', '17', '2018-04-06 12:11:00');
INSERT INTO `goods` VALUES ('37', '1', '7', '卡士鲜酪乳（黄桃） 100g*3', '桃味浓郁 口感幼滑', '136.00', '124.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/3420/1/1-270x270-3420-TY48F1KD.jpg', 'https://imgjd7.fruitday.com/images/product_pic/3420/1/1-270x270-3420-TY48F1KD.jpg,https://imgqn9.fruitday.com/images/product_pic/161/1/1-270x270-161-TAW9WCYP.jpg', '18', '2018-04-07 12:11:00');
INSERT INTO `goods` VALUES ('38', '1', '8', '甜玉米（2个装） 500g', '粗粮搭配 膳食均衡', '137.00', '125.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/237/1/1-270x270-237-APD4YYHR.jpg', 'https://imgjd3.fruitday.com/images/product_pic/237/1/1-270x270-237-APD4YYHR.jpg,https://imgqn8.fruitday.com/images/product_pic/157/1/1-270x270-157-DBKXB6HF.jpg', '19', '2018-04-08 12:11:00');
INSERT INTO `goods` VALUES ('39', '1', '8', '鲜食水果玉米（即食） 2份', '免煮即食 一口喷汁', '138.00', '126.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/2359/1/1-270x270-2359-SHWTK77K.jpg', 'https://imgjd3.fruitday.com/images/product_pic/2359/1/1-270x270-2359-SHWTK77K.jpg,https://imgqn8.fruitday.com/images/product_pic/157/1/1-270x270-157-DBKXB6HF.jpg', '20', '2018-04-09 12:11:00');
INSERT INTO `goods` VALUES ('40', '1', '8', '鲜食水果玉米（即食） 1份', '免煮即食 一口喷汁', '139.00', '127.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/2359/1/1-270x270-2359-SHWTK77K.jpg', 'https://imgjd5.fruitday.com/images/product_pic/2359/1/1-270x270-2359-SHWTK77K.jpg,https://imgqn8.fruitday.com/images/product_pic/157/1/1-270x270-157-DBKXB6HF.jpg', '21', '2018-04-10 12:11:00');
INSERT INTO `goods` VALUES ('41', '1', '8', '海南秋葵 200g', '适宜三高人群的健康美味', '140.00', '128.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/239/1/1-270x270-239-SDKR3PBD.jpg', 'https://imgqn8.fruitday.com/images/product_pic/239/1/1-270x270-239-SDKR3PBD.jpg,https://imgqn8.fruitday.com/images/product_pic/157/1/1-270x270-157-DBKXB6HF.jpg', '22', '2018-04-11 12:11:00');
INSERT INTO `goods` VALUES ('42', '1', '8', '浙江白萝卜（单个） 500g', '人称”土人参“ 健康多滋润', '141.00', '129.00', '200', 'y', 'https://imgjd2.fruitday.com/images/product_pic/117/1/1-270x270-117-RRK82K82.jpg', 'https://imgjd2.fruitday.com/images/product_pic/117/1/1-270x270-117-RRK82K82.jpg,https://imgqn8.fruitday.com/images/product_pic/157/1/1-270x270-157-DBKXB6HF.jpg', '23', '2018-04-12 12:11:00');
INSERT INTO `goods` VALUES ('43', '1', '8', '金华芋艿 300g', '炖汤香酥 白煮香糯', '142.00', '130.00', '200', 'y', 'https://imgqn9.fruitday.com/images/product_pic/283/1/1-270x270-283-312H31Y2.jpg', 'https://imgqn9.fruitday.com/images/product_pic/283/1/1-270x270-283-312H31Y2.jpg,https://imgqn8.fruitday.com/images/product_pic/157/1/1-270x270-157-DBKXB6HF.jpg', '24', '2018-03-03 14:24:37');
INSERT INTO `goods` VALUES ('44', '1', '8', '山东迷你土豆 500g', 'Q版迷你小土豆', '143.00', '131.00', '200', 'y', 'https://imgjd6.fruitday.com/images/product_pic/110/1/1-270x270-110-HYKTS858.jpg', 'https://imgjd6.fruitday.com/images/product_pic/110/1/1-270x270-110-HYKTS858.jpg,https://imgqn8.fruitday.com/images/product_pic/157/1/1-270x270-157-DBKXB6HF.jpg', '25', '2018-03-03 14:24:39');
INSERT INTO `goods` VALUES ('45', '1', '8', '山东黄心大土豆 500g', '肉厚皮薄 简单也美味', '144.00', '132.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/106/1/1-270x270-106-W65K5SA2.jpg', 'https://imgjd2.fruitday.com/images/product_pic/106/1/1-270x270-106-W65K5SA2.jpg,https://imgqn8.fruitday.com/images/product_pic/157/1/1-270x270-157-DBKXB6HF.jpg', '26', '2018-04-15 12:11:00');
INSERT INTO `goods` VALUES ('46', '1', '8', '焦作铁棍山药 250g', '营养多元 长寿因子', '145.00', '133.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/135/1/1-270x270-135-BRU25YUR.jpg', 'https://imgjd5.fruitday.com/images/product_pic/135/1/1-270x270-135-BRU25YUR.jpg,https://imgjd1.fruitday.com/images/product_pic/127/1/1-270x270-127-K2HDKBHW.jpg', '27', '2018-04-16 12:11:00');
INSERT INTO `goods` VALUES ('47', '1', '8', '越南紫薯 500g', '甜糯好滋味', '146.00', '134.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/104/1/1-270x270-104-XYHBS5UW.jpg', 'https://imgjd7.fruitday.com/images/product_pic/104/1/1-270x270-104-XYHBS5UW.jpg,https://imgjd5.fruitday.com/images/product_pic/135/1/1-270x270-135-BRU25YUR.jpg', '28', '2018-04-17 12:11:00');
INSERT INTO `goods` VALUES ('48', '1', '8', '安徽胡萝卜 400g', '新鲜清脆 炖汤甜酥', '147.00', '135.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/127/1/1-270x270-127-K2HDKBHW.jpg', 'https://imgjd1.fruitday.com/images/product_pic/127/1/1-270x270-127-K2HDKBHW.jpg,https://imgjd5.fruitday.com/images/product_pic/135/1/1-270x270-135-BRU25YUR.jpg', '29', '2018-04-18 12:11:00');
INSERT INTO `goods` VALUES ('49', '1', '8', '浙江西兰花 350g', '西餐料理好搭档 点缀就靠它', '148.00', '136.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/263/1/1-270x270-263-AH3DD6B8.jpg', 'https://imgqn8.fruitday.com/images/product_pic/263/1/1-270x270-263-AH3DD6B8.jpg,https://imgjd5.fruitday.com/images/product_pic/135/1/1-270x270-135-BRU25YUR.jpg', '30', '2018-04-19 12:11:00');
INSERT INTO `goods` VALUES ('50', '1', '8', '红薯 500g', '细腻甜糯，香味浓郁', '149.00', '137.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/157/1/1-270x270-157-DBKXB6HF.jpg', 'https://imgqn8.fruitday.com/images/product_pic/157/1/1-270x270-157-DBKXB6HF.jpg,https://imgjd5.fruitday.com/images/product_pic/135/1/1-270x270-135-BRU25YUR.jpg', '31', '2018-04-20 12:11:00');
INSERT INTO `goods` VALUES ('51', '2', '9', '佳沛意大利金奇异果 12个', '当季金果 甜滋水润', '23.00', '15.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/4449/1/1-270x270-4449-XP99U2K9.jpg', 'https://imgqn8.fruitday.com/images/product_pic/4449/1/1-270x270-4449-XP99U2K9.jpg,https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg', '32', '2018-04-21 12:11:00');
INSERT INTO `goods` VALUES ('52', '2', '9', '佳沛意大利金奇异果 6个', '当季金果 甜滋水润', '24.00', '16.00', '200', 'n', 'https://imgjd4.fruitday.com/images/product_pic/4449/1/1-270x270-4449-XP99U2K9.jpg', 'https://imgjd4.fruitday.com/images/product_pic/4449/1/1-270x270-4449-XP99U2K9.jpg,https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg', '23', '2018-04-22 12:11:00');
INSERT INTO `goods` VALUES ('53', '2', '9', '佳沛意大利绿奇异果（原箱） 36个', '细嫩绿芯 酸甜爽口', '25.00', '17.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg', 'https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg,https://imgjd7.fruitday.com/images/product_pic/36/1/1-270x270-36-PWFA3B5F.jpg', '24', '2018-04-23 12:11:00');
INSERT INTO `goods` VALUES ('54', '2', '9', '佳沛意大利绿奇异果 12个', '细嫩绿芯 酸甜爽口', '26.00', '18.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/36/1/1-270x270-36-PWFA3B5F.jpg', 'https://imgqn8.fruitday.com/images/product_pic/36/1/1-270x270-36-PWFA3B5F.jpg,https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg', '25', '2018-04-24 12:11:00');
INSERT INTO `goods` VALUES ('55', '2', '9', '佳沛意大利绿奇异果 6个', '细嫩绿芯 酸甜爽口', '27.00', '19.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/36/1/1-270x270-36-PWFA3B5F.jpg', 'https://imgjd7.fruitday.com/images/product_pic/36/1/1-270x270-36-PWFA3B5F.jpg,https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg', '26', '2018-04-25 12:11:00');
INSERT INTO `goods` VALUES ('56', '2', '10', '美国华盛顿甜脆红地厘蛇果 6个', '经典红果 甜脆出众', '28.00', '20.00', '300', 'n', 'https://imgqn9.fruitday.com/images/product_pic/52/1/1-270x270-52-HF73PYWP.jpg', 'https://imgqn9.fruitday.com/images/product_pic/52/1/1-270x270-52-HF73PYWP.jpg,https://imgjd3.fruitday.com/images/product_pic/46/1/1-270x270-46-CUDTC1KY.jpg', '27', '2018-03-09 17:39:46');
INSERT INTO `goods` VALUES ('57', '2', '10', '新疆富士苹果 2.5kg', '节气后采摘 应季冰糖心', '29.00', '21.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/46/1/1-270x270-46-CUDTC1KY.jpg', 'https://imgjd3.fruitday.com/images/product_pic/46/1/1-270x270-46-CUDTC1KY.jpg,https://imgjd2.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg', '28', '2018-04-27 12:11:00');
INSERT INTO `goods` VALUES ('58', '2', '10', '静宁富士苹果 2.5kg', '从云端摘下的苹果 太甜脆', '30.00', '22.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg', 'https://imgjd2.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg,https://imgjd3.fruitday.com/images/product_pic/586/1/1-270x270-586-645CDU4F.jpg', '29', '2018-04-28 12:11:00');
INSERT INTO `goods` VALUES ('59', '2', '10', '新疆富士苹果 1kg', '节气后采摘 应季冰糖心', '31.00', '23.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/46/1/1-270x270-46-CUDTC1KY.jpg', 'https://imgjd5.fruitday.com/images/product_pic/46/1/1-270x270-46-CUDTC1KY.jpg,https://imgjd3.fruitday.com/images/product_pic/586/1/1-270x270-586-645CDU4F.jpg', '30', '2018-04-29 12:11:00');
INSERT INTO `goods` VALUES ('60', '2', '10', '静宁富士苹果 1kg', '从云端摘下的苹果 太甜脆', '32.00', '24.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg', 'https://imgjd3.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg,https://imgjd3.fruitday.com/images/product_pic/586/1/1-270x270-586-645CDU4F.jpg', '31', '2018-04-30 12:11:00');
INSERT INTO `goods` VALUES ('61', '2', '10', '美国青苹果 3个', '青皮白肉 酸甜清新', '33.00', '25.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/586/1/1-270x270-586-645CDU4F.jpg', 'https://imgjd3.fruitday.com/images/product_pic/586/1/1-270x270-586-645CDU4F.jpg,https://imgjd2.fruitday.com/images/product_pic/2169/1/1-270x270-2169-YR8PTW67.jpg', '32', '2018-05-01 12:11:00');
INSERT INTO `goods` VALUES ('62', '2', '10', '优选美国爱妃苹果 6个', '优选钻石颜值 甜脆嚼多汁', '34.00', '26.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/49/1/1-270x270-49-D6PKH6S9.jpg', 'https://imgjd2.fruitday.com/images/product_pic/49/1/1-270x270-49-D6PKH6S9.jpg,https://imgjd3.fruitday.com/images/product_pic/46/1/1-270x270-46-CUDTC1KY.jpg', '33', '2018-05-02 12:11:00');
INSERT INTO `goods` VALUES ('63', '2', '11', '新奇士美国脐橙 20个', '阳光脐橙 饱满多汁', '35.00', '27.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg', 'https://imgjd5.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg,https://imgqn9.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg', '13', '2018-05-03 12:11:00');
INSERT INTO `goods` VALUES ('64', '2', '11', '以色列白心青柚 2个', '只有多汁 不要苦涩', '36.00', '28.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/4196/1/1-270x270-4196-DA598TP7.jpg', 'https://imgjd5.fruitday.com/images/product_pic/4196/1/1-270x270-4196-DA598TP7.jpg,https://imgqn9.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg', '14', '2018-05-04 12:11:00');
INSERT INTO `goods` VALUES ('65', '2', '11', '新奇士美国脐橙 6个', '阳光脐橙 饱满多汁', '37.00', '29.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg', 'https://imgjd1.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg,https://imgqn9.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg', '15', '2018-05-05 12:11:00');
INSERT INTO `goods` VALUES ('66', '2', '11', '砂糖桔 1kg', '砂糖跟我比 你猜谁更甜​', '38.00', '30.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/4485/1/1-270x270-4485-BT7UPR7U.jpg', 'https://imgqn8.fruitday.com/images/product_pic/4485/1/1-270x270-4485-BT7UPR7U.jpg,https://imgqn9.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg', '16', '2018-05-06 12:11:00');
INSERT INTO `goods` VALUES ('67', '2', '11', '台湾茂谷柑 500g', '浓甜无渣 瓣瓣多汁', '39.00', '31.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/500/1/1-270x270-500-3A4YF743.jpg', 'https://imgjd6.fruitday.com/images/product_pic/500/1/1-270x270-500-3A4YF743.jpg,https://imgqn9.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg', '17', '2018-05-07 12:11:00');
INSERT INTO `goods` VALUES ('68', '2', '11', '新奇士美国双橙组合 12个', '双色橙味 惊艳味蕾', '40.00', '32.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/4809/1/1-270x270-4809-S78AHD4X.jpg', 'https://imgjd5.fruitday.com/images/product_pic/4809/1/1-270x270-4809-S78AHD4X.jpg,https://imgqn9.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg', '18', '2018-05-08 12:11:00');
INSERT INTO `goods` VALUES ('69', '2', '11', '台湾茂谷柑 1kg', '浓甜无渣 瓣瓣多汁', '41.00', '33.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/500/1/1-270x270-500-3A4YF743.jpg', 'https://imgjd5.fruitday.com/images/product_pic/500/1/1-270x270-500-3A4YF743.jpg,https://imgjd5.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg', '19', '2018-05-09 12:11:00');
INSERT INTO `goods` VALUES ('70', '2', '11', '卡萨布兰卡蜜桔 2kg', '尝过你的浓 从此味蕾都是你', '42.00', '34.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/4945/1/1-270x270-4945-H337D66F.jpg', 'https://imgqn9.fruitday.com/images/product_pic/4945/1/1-270x270-4945-H337D66F.jpg,https://imgjd5.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg', '20', '2018-05-10 12:11:00');
INSERT INTO `goods` VALUES ('71', '2', '11', '卡萨布兰卡蜜桔 1kg', '尝过你的浓 从此味蕾都是你', '43.00', '35.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/4945/1/1-270x270-4945-H337D66F.jpg', 'https://imgqn8.fruitday.com/images/product_pic/4945/1/1-270x270-4945-H337D66F.jpg,https://imgjd5.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg', '21', '2018-05-11 12:11:00');
INSERT INTO `goods` VALUES ('72', '2', '11', '新奇士美国柠檬 4个', '满满vc 每天一杯柠檬水', '44.00', '36.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg', 'https://imgqn8.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg,https://imgjd5.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg', '22', '2018-05-12 12:11:00');
INSERT INTO `goods` VALUES ('73', '2', '11', '新奇士美国柠檬 8个', '满满vc 每天一杯柠檬水', '45.00', '37.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg', 'https://imgqn9.fruitday.com/images/product_pic/32/1/1-270x270-32-DBR4THAT.jpg,https://imgjd5.fruitday.com/images/product_pic/44/1/1-270x270-44-W2XX948K.jpg', '23', '2018-05-13 12:11:00');
INSERT INTO `goods` VALUES ('74', '2', '12', '优选新疆库尔勒香梨 2.5kg', '酥甜水嫩 回购率超高', '46.00', '38.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/4748/1/1-270x270-4748-BS8HX1CC.jpg', 'https://imgjd1.fruitday.com/images/product_pic/4748/1/1-270x270-4748-BS8HX1CC.jpg,https://imgqn8.fruitday.com/images/product_pic/68/1/1-270x270-68-US4RD9CC.jpg', '24', '2018-05-14 12:11:00');
INSERT INTO `goods` VALUES ('75', '2', '12', '优选新疆库尔勒香梨 1kg', '酥甜水嫩 回购率超高', '47.00', '39.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/68/1/1-270x270-68-US4RD9CC.jpg', 'https://imgqn8.fruitday.com/images/product_pic/68/1/1-270x270-68-US4RD9CC.jpg,https://imgjd1.fruitday.com/images/product_pic/4748/1/1-270x270-4748-BS8HX1CC.jpg', '25', '2018-05-15 12:11:00');
INSERT INTO `goods` VALUES ('76', '2', '13', '秘鲁红提 2kg', '水嫩又多汁 新年果盘更甜蜜', '48.00', '40.00', '200', 'y', 'https://imgqn9.fruitday.com/images/product_pic/21/1/1-270x270-21-5K774C5A.jpg', 'https://imgqn9.fruitday.com/images/product_pic/21/1/1-270x270-21-5K774C5A.jpg,https://imgjd5.fruitday.com/images/product_pic/21/1/1-270x270-21-5K774C5A.jpg', '26', '2018-05-16 12:11:00');
INSERT INTO `goods` VALUES ('77', '2', '13', '秘鲁红提 1kg', '水嫩又多汁 新年果盘更甜蜜', '49.00', '41.00', '200', 'y', 'https://imgjd5.fruitday.com/images/product_pic/21/1/1-270x270-21-5K774C5A.jpg', 'https://imgjd5.fruitday.com/images/product_pic/21/1/1-270x270-21-5K774C5A.jpg,https://imgqn9.fruitday.com/images/product_pic/21/1/1-270x270-21-5K774C5A.jpg', '27', '2018-05-17 12:11:00');
INSERT INTO `goods` VALUES ('78', '2', '14', '越南青皮香芒果 2kg', '青皮厚肉 清甜软糯', '50.00', '42.00', '200', 'y', 'https://imgqn9.fruitday.com/images/product_pic/39/1/1-270x270-39-BST4TS1Y.jpg', 'https://imgqn9.fruitday.com/images/product_pic/39/1/1-270x270-39-BST4TS1Y.jpg,https://imgqn9.fruitday.com/images/product_pic/2654/1/1-270x270-2654-P568PWC2.jpg', '28', '2018-05-18 12:11:00');
INSERT INTO `goods` VALUES ('79', '2', '14', '越南红心火龙果 2.5kg', '每天都要很健康', '51.00', '43.00', '200', 'y', 'https://imgjd6.fruitday.com/images/product_pic/5/1/1-270x270-5-HRHCPAH9.jpg', 'https://imgjd6.fruitday.com/images/product_pic/5/1/1-270x270-5-HRHCPAH9.jpg,https://imgqn9.fruitday.com/images/product_pic/2654/1/1-270x270-2654-P568PWC2.jpg', '29', '2018-05-19 12:11:00');
INSERT INTO `goods` VALUES ('80', '2', '14', '进口凤梨 2个', '清甜滋味无需盐水', '52.00', '44.00', '200', 'y', 'https://imgjd1.fruitday.com/images/product_pic/9/1/1-270x270-9-426T698K.jpg', 'https://imgjd1.fruitday.com/images/product_pic/9/1/1-270x270-9-426T698K.jpg,https://imgqn9.fruitday.com/images/product_pic/2654/1/1-270x270-2654-P568PWC2.jpg', '30', '2018-05-20 12:11:00');
INSERT INTO `goods` VALUES ('81', '2', '14', '越南青皮香芒果 1kg', '青皮厚肉 清甜软糯', '53.00', '45.00', '200', 'y', 'https://imgqn8.fruitday.com/images/product_pic/39/1/1-270x270-39-BST4TS1Y.jpg', 'https://imgqn8.fruitday.com/images/product_pic/39/1/1-270x270-39-BST4TS1Y.jpg,https://imgjd1.fruitday.com/images/product_pic/465/1/1-270x270-465-F2W8R6A6.jpg', '31', '2018-05-21 12:11:00');
INSERT INTO `goods` VALUES ('82', '2', '14', '进口香蕉 1kg', '独立包装 携带方便', '54.00', '46.00', '300', 'y', 'https://imgqn8.fruitday.com/images/product_pic/19/1/1-270x270-19-YATB7835.jpg', 'https://imgqn8.fruitday.com/images/product_pic/19/1/1-270x270-19-YATB7835.jpg,https://imgjd1.fruitday.com/images/product_pic/465/1/1-270x270-465-F2W8R6A6.jpg', '32', '2018-03-09 17:39:41');
INSERT INTO `goods` VALUES ('83', '2', '14', '进口凤梨 1个', '清甜滋味无需盐水', '55.00', '47.00', '200', 'y', 'https://imgjd5.fruitday.com/images/product_pic/9/1/1-270x270-9-426T698K.jpg', 'https://imgjd5.fruitday.com/images/product_pic/9/1/1-270x270-9-426T698K.jpg,https://imgjd1.fruitday.com/images/product_pic/465/1/1-270x270-465-F2W8R6A6.jpg', '23', '2018-05-23 12:11:00');
INSERT INTO `goods` VALUES ('84', '2', '14', '越南火龙果 2.5kg', '清甜爽口 果盘必备', '56.00', '48.00', '200', 'y', 'https://imgjd7.fruitday.com/images/product_pic/6/1/1-270x270-6-DHBW63R4.jpg', 'https://imgjd7.fruitday.com/images/product_pic/6/1/1-270x270-6-DHBW63R4.jpg,https://imgjd1.fruitday.com/images/product_pic/465/1/1-270x270-465-F2W8R6A6.jpg', '24', '2018-05-24 12:11:00');
INSERT INTO `goods` VALUES ('85', '2', '14', '越南红心火龙果 1kg', '每天都要很健康', '57.00', '49.00', '200', 'y', 'https://imgjd6.fruitday.com/images/product_pic/5/1/1-270x270-5-HRHCPAH9.jpg', 'https://imgjd6.fruitday.com/images/product_pic/5/1/1-270x270-5-HRHCPAH9.jpg,https://imgjd1.fruitday.com/images/product_pic/465/1/1-270x270-465-F2W8R6A6.jpg', '25', '2018-05-25 12:11:00');
INSERT INTO `goods` VALUES ('86', '2', '14', '越南火龙果 2个', '清甜爽口 果盘必备', '58.00', '50.00', '200', 'y', 'https://imgjd4.fruitday.com/images/product_pic/6/1/1-270x270-6-DHBW63R4.jpg', 'https://imgjd4.fruitday.com/images/product_pic/6/1/1-270x270-6-DHBW63R4.jpg,https://imgjd1.fruitday.com/images/product_pic/465/1/1-270x270-465-F2W8R6A6.jpg', '26', '2018-05-26 12:11:00');
INSERT INTO `goods` VALUES ('87', '2', '14', '深井冰椰青 2个 2个', '低糖低卡 躺着喝也不长肉', '59.00', '51.00', '200', 'y', 'https://imgqn9.fruitday.com/images/product_pic/2654/1/1-270x270-2654-P568PWC2.jpg', 'https://imgqn9.fruitday.com/images/product_pic/2654/1/1-270x270-2654-P568PWC2.jpg,https://imgqn8.fruitday.com/images/product_pic/19/1/1-270x270-19-YATB7835.jpg', '27', '2018-05-27 12:11:00');
INSERT INTO `goods` VALUES ('88', '2', '14', '海南金煌芒果 1kg', '薄核厚肉超满足', '60.00', '52.00', '200', 'y', 'https://imgjd7.fruitday.com/images/product_pic/2076/1/1-270x270-2076-PUYKHRXD.jpg', 'https://imgjd7.fruitday.com/images/product_pic/2076/1/1-270x270-2076-PUYKHRXD.jpg,https://imgqn8.fruitday.com/images/product_pic/19/1/1-270x270-19-YATB7835.jpg', '28', '2018-05-28 12:11:00');
INSERT INTO `goods` VALUES ('89', '2', '14', '海南金煌芒果 2kg', '薄核厚肉超满足', '61.00', '53.00', '200', 'y', 'https://imgjd6.fruitday.com/images/product_pic/2076/1/1-270x270-2076-PUYKHRXD.jpg', 'https://imgjd6.fruitday.com/images/product_pic/2076/1/1-270x270-2076-PUYKHRXD.jpg,https://imgqn8.fruitday.com/images/product_pic/19/1/1-270x270-19-YATB7835.jpg', '29', '2018-05-29 12:11:00');
INSERT INTO `goods` VALUES ('90', '2', '14', '泰国龙眼 1kg', '浓甜厚肉 果冻般Q', '62.00', '54.00', '200', 'y', 'https://imgjd2.fruitday.com/images/product_pic/465/1/1-270x270-465-F2W8R6A6.jpg', 'https://imgjd2.fruitday.com/images/product_pic/465/1/1-270x270-465-F2W8R6A6.jpg,https://imgqn8.fruitday.com/images/product_pic/19/1/1-270x270-19-YATB7835.jpg', '30', '2018-05-30 12:11:00');
INSERT INTO `goods` VALUES ('91', '2', '14', '泰国龙眼 2kg', '浓甜厚肉 果冻般Q', '63.00', '55.00', '200', 'y', 'https://imgjd1.fruitday.com/images/product_pic/465/1/1-270x270-465-F2W8R6A6.jpg', 'https://imgjd1.fruitday.com/images/product_pic/465/1/1-270x270-465-F2W8R6A6.jpg,https://imgjd6.fruitday.com/images/product_pic/5/1/1-270x270-5-HRHCPAH9.jpg', '31', '2018-05-31 12:11:00');
INSERT INTO `goods` VALUES ('92', '2', '14', '深井冰椰青 1个', '低糖低卡 躺着喝也不长肉', '64.00', '56.00', '200', 'y', 'https://imgjd2.fruitday.com/images/product_pic/2654/1/1-270x270-2654-P568PWC2.jpg', 'https://imgjd2.fruitday.com/images/product_pic/2654/1/1-270x270-2654-P568PWC2.jpg,https://imgjd6.fruitday.com/images/product_pic/5/1/1-270x270-5-HRHCPAH9.jpg', '32', '2018-06-01 12:11:00');
INSERT INTO `goods` VALUES ('93', '2', '14', '深井冰椰青 4个', '低糖低卡 躺着喝也不长肉', '65.00', '57.00', '200', 'y', 'https://imgjd7.fruitday.com/images/product_pic/2654/1/1-270x270-2654-P568PWC2.jpg', 'https://imgjd7.fruitday.com/images/product_pic/2654/1/1-270x270-2654-P568PWC2.jpg,https://imgjd6.fruitday.com/images/product_pic/5/1/1-270x270-5-HRHCPAH9.jpg', '33', '2018-06-02 12:11:00');
INSERT INTO `goods` VALUES ('94', '2', '15', '海南西州蜜瓜 1个', '咔擦一口 甜脆爽快', '66.00', '58.00', '200', 'y', 'https://imgjd6.fruitday.com/images/product_pic/2166/1/1-270x270-2166-WT1XWC35.jpg', 'https://imgjd6.fruitday.com/images/product_pic/2166/1/1-270x270-2166-WT1XWC35.jpg,https://imgjd5.fruitday.com/images/product_pic/20/1/1-270x270-20-XCP49U34.jpg', '13', '2018-06-03 12:11:00');
INSERT INTO `goods` VALUES ('95', '2', '15', '海南木瓜 2个', '肉厚多汁 绵软无渣', '67.00', '59.00', '200', 'y', 'https://imgjd5.fruitday.com/images/product_pic/20/1/1-270x270-20-XCP49U34.jpg', 'https://imgjd5.fruitday.com/images/product_pic/20/1/1-270x270-20-XCP49U34.jpg,https://imgjd6.fruitday.com/images/product_pic/2166/1/1-270x270-2166-WT1XWC35.jpg', '14', '2018-06-04 12:11:00');
INSERT INTO `goods` VALUES ('96', '2', '16', '精选百香果 3+3个', '酸甜百花香 水果茶必备', '68.00', '60.00', '200', 'y', 'https://imgqn8.fruitday.com/images/product_pic/602/1/1-270x270-602-8K21Y6YK.jpg', 'https://imgqn8.fruitday.com/images/product_pic/602/1/1-270x270-602-8K21Y6YK.jpg,https://imgjd3.fruitday.com/images/product_pic/2423/1/1-270x270-2423-WXFS6776.jpg', '15', '2018-06-05 12:11:00');
INSERT INTO `goods` VALUES ('97', '2', '16', '火山番茄（混色） 380g', '高颜三色茄 营养口感都满足', '69.00', '61.00', '200', 'y', 'https://imgjd7.fruitday.com/images/product_pic/28/1/1-270x270-28-TRYU8W1W.jpg', 'https://imgjd7.fruitday.com/images/product_pic/28/1/1-270x270-28-TRYU8W1W.jpg,https://imgqn8.fruitday.com/images/product_pic/602/1/1-270x270-602-8K21Y6YK.jpg', '16', '2018-06-06 12:11:00');
INSERT INTO `goods` VALUES ('98', '2', '16', '拇指青桔 200g', '果汁量≥70% 水果茶必备', '70.00', '23.00', '200', 'y', 'https://imgqn8.fruitday.com/images/product_pic/2031/1/1-270x270-2031-5HB8XY1D.jpg', 'https://imgqn8.fruitday.com/images/product_pic/2031/1/1-270x270-2031-5HB8XY1D.jpg,https://imgqn8.fruitday.com/images/product_pic/602/1/1-270x270-602-8K21Y6YK.jpg', '17', '2018-06-07 12:11:00');
INSERT INTO `goods` VALUES ('99', '2', '16', '拇指青桔 500g', '果汁量≥70% 水果茶必备', '71.00', '24.00', '200', 'y', 'https://imgjd6.fruitday.com/images/product_pic/2031/1/1-270x270-2031-5HB8XY1D.jpg', 'https://imgjd6.fruitday.com/images/product_pic/2031/1/1-270x270-2031-5HB8XY1D.jpg,https://imgqn8.fruitday.com/images/product_pic/602/1/1-270x270-602-8K21Y6YK.jpg', '18', '2018-06-08 12:11:00');
INSERT INTO `goods` VALUES ('100', '2', '16', '海南樱桃番茄 1kg', '爆汁甜蜜 健康小零嘴', '72.00', '25.00', '200', 'y', 'https://imgjd1.fruitday.com/images/product_pic/25/1/1-270x270-25-S8C5SA74.jpg', 'https://imgjd1.fruitday.com/images/product_pic/25/1/1-270x270-25-S8C5SA74.jpg,https://imgqn8.fruitday.com/images/product_pic/602/1/1-270x270-602-8K21Y6YK.jpg', '19', '2018-06-09 12:11:00');
INSERT INTO `goods` VALUES ('101', '2', '16', '海南樱桃番茄 500g', '爆汁甜蜜 健康小零嘴', '73.00', '26.00', '200', 'y', 'https://imgqn8.fruitday.com/images/product_pic/25/1/1-270x270-25-S8C5SA74.jpg', 'https://imgqn8.fruitday.com/images/product_pic/25/1/1-270x270-25-S8C5SA74.jpg,https://imgqn8.fruitday.com/images/product_pic/602/1/1-270x270-602-8K21Y6YK.jpg', '20', '2018-06-10 12:11:00');
INSERT INTO `goods` VALUES ('102', '2', '16', '南非柠檬 4个', 'VC仓库 酸爽迷人', '74.00', '27.00', '200', 'y', 'https://imgjd3.fruitday.com/images/product_pic/2423/1/1-270x270-2423-WXFS6776.jpg', 'https://imgjd3.fruitday.com/images/product_pic/2423/1/1-270x270-2423-WXFS6776.jpg,https://imgjd3.fruitday.com/images/product_pic/2423/1/1-270x270-2423-WXFS6776.jpg', '21', '2018-06-11 12:11:00');
INSERT INTO `goods` VALUES ('103', '3', '17', '爱尔兰海螯虾（刺身级） 500g', '刺身圈的小香风', '75.00', '28.00', '200', 'y', 'https://imgjd3.fruitday.com/images/product_pic/2039/1/1-270x270-2039-WD7R42A8.jpg', 'https://imgjd3.fruitday.com/images/product_pic/2039/1/1-270x270-2039-WD7R42A8.jpg', '22', '2018-06-12 12:11:00');
INSERT INTO `goods` VALUES ('104', '3', '17', '原装南美白对虾 500g', '皮脆肉嫩还弹牙', '76.00', '29.00', '200', 'y', 'https://imgqn8.fruitday.com/images/product_pic/488/1/1-270x270-488-W6UA4ST1.jpg', 'https://imgqn8.fruitday.com/images/product_pic/488/1/1-270x270-488-W6UA4ST1.jpg', '23', '2018-06-13 12:11:00');
INSERT INTO `goods` VALUES ('105', '3', '17', '熟冻泰国黑虎虾 400g', '鲜甜弹润 嚼劲十足', '77.00', '30.00', '300', 'y', 'https://imgjd3.fruitday.com/images/product_pic/486/1/1-270x270-486-39U7CTX2.jpg', 'https://imgjd3.fruitday.com/images/product_pic/486/1/1-270x270-486-39U7CTX2.jpg', '24', '2018-03-09 17:39:35');
INSERT INTO `goods` VALUES ('106', '3', '17', '冻南美白对虾 250g', '壳薄肉肥 大快朵颐吃虾', '78.00', '31.00', '200', 'y', 'https://imgqn9.fruitday.com/images/product_pic/2783/1/1-270x270-2783-KS5BSTAX.jpg', 'https://imgqn9.fruitday.com/images/product_pic/2783/1/1-270x270-2783-KS5BSTAX.jpg', '25', '2018-06-15 12:11:00');
INSERT INTO `goods` VALUES ('107', '3', '17', '越南黑虎虾仁（中） 200g', '手剥虾仁 颗颗弹力十足', '79.00', '32.00', '200', 'y', 'https://imgjd2.fruitday.com/images/product_pic/3475/1/1-270x270-3475-P974WF6D.jpg', 'https://imgjd2.fruitday.com/images/product_pic/3475/1/1-270x270-3475-P974WF6D.jpg', '26', '2018-06-16 12:11:00');
INSERT INTO `goods` VALUES ('108', '3', '17', '越南黑虎虾仁（大） 200g', '大颗才过瘾', '80.00', '33.00', '200', 'y', 'https://imgjd5.fruitday.com/images/product_pic/2032/1/1-270x270-2032-H9AHA87X.jpg', 'https://imgjd5.fruitday.com/images/product_pic/2032/1/1-270x270-2032-H9AHA87X.jpg', '27', '2018-06-17 12:11:00');
INSERT INTO `goods` VALUES ('109', '3', '17', '海鲜团圆家宴礼盒（8种）3430g 礼盒', '八珍荟萃 团聚正当时', '81.00', '34.00', '200', 'y', 'https://imgjd6.fruitday.com/images/product_pic/4694/1/1-270x270-4694-3RSU6YKT.jpg', 'https://imgjd6.fruitday.com/images/product_pic/4694/1/1-270x270-4694-3RSU6YKT.jpg', '28', '2018-06-18 12:11:00');
INSERT INTO `goods` VALUES ('110', '3', '17', '海鲜团圆家宴礼盒（12种）5700g 礼盒', '一桌团圆宴 全家齐分享', '82.00', '35.00', '200', 'y', 'https://imgqn9.fruitday.com/images/product_pic/4697/1/1-270x270-4697-D881R2H8.jpg', 'https://imgqn9.fruitday.com/images/product_pic/4697/1/1-270x270-4697-D881R2H8.jpg', '29', '2018-06-19 12:11:00');
INSERT INTO `goods` VALUES ('111', '3', '17', '海鲜团圆家宴礼盒（12种）5350g 礼盒', '海味相伴 共享团聚时光', '83.00', '36.00', '200', 'y', 'https://imgqn8.fruitday.com/images/product_pic/4696/1/1-270x270-4696-9P6XXW25.jpg', 'https://imgqn8.fruitday.com/images/product_pic/4696/1/1-270x270-4696-9P6XXW25.jpg', '30', '2018-06-20 12:11:00');
INSERT INTO `goods` VALUES ('112', '3', '17', '海鲜团圆家宴礼盒（10种）4500g 礼盒', '海鲜大集合 献给爱的家', '84.00', '37.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/4695/1/1-270x270-4695-S8ADYX9P.jpg', 'https://imgjd7.fruitday.com/images/product_pic/4695/1/1-270x270-4695-S8ADYX9P.jpg', '31', '2018-06-21 12:11:00');
INSERT INTO `goods` VALUES ('113', '3', '17', '海鲜团圆家宴礼盒（12种）6200g 礼盒', '品海鲜盛宴 享欢聚时刻 ​', '85.00', '38.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/4698/1/1-270x270-4698-41B9PTR8.jpg', 'https://imgjd1.fruitday.com/images/product_pic/4698/1/1-270x270-4698-41B9PTR8.jpg', '32', '2018-06-22 12:11:00');
INSERT INTO `goods` VALUES ('114', '3', '18', '薄盐三文鱼 240g', '无需再调味 煎出深海原香', '86.00', '39.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/3576/1/1-270x270-3576-RBXBHBD9.jpg', 'https://imgjd5.fruitday.com/images/product_pic/3576/1/1-270x270-3576-RBXBHBD9.jpg', '23', '2018-06-23 12:11:00');
INSERT INTO `goods` VALUES ('115', '3', '18', '东海白鲳鱼（100-150g/条）（2条装） 250g', '让宝贝爱上大口吃鱼', '87.00', '40.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/745/1/1-270x270-745-8FWR74R9.jpg', 'https://imgjd5.fruitday.com/images/product_pic/745/1/1-270x270-745-8FWR74R9.jpg', '24', '2018-06-24 12:11:00');
INSERT INTO `goods` VALUES ('116', '3', '18', '精选鸦片鱼头（格陵兰比目鱼鱼头） 300-400g', '鲜而不腥，嫩滑无比', '88.00', '41.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/654/1/1-270x270-654-5YBXB9TS.jpg', 'https://imgjd6.fruitday.com/images/product_pic/654/1/1-270x270-654-5YBXB9TS.jpg', '25', '2018-06-25 12:11:00');
INSERT INTO `goods` VALUES ('117', '3', '18', '三文鱼刺身 100g', '厚切细腻 肥嫩鲜甜', '89.00', '42.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/192/1/1-270x270-192-151U8P73.jpg', 'https://imgjd1.fruitday.com/images/product_pic/192/1/1-270x270-192-151U8P73.jpg', '26', '2018-06-26 12:11:00');
INSERT INTO `goods` VALUES ('118', '3', '18', '鸦片鱼切段（格陵兰比目鱼） 400g', '限量捕捞 厚无小刺', '90.00', '43.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/218/1/1-270x270-218-ADXRKP86.jpg', 'https://imgjd5.fruitday.com/images/product_pic/218/1/1-270x270-218-ADXRKP86.jpg', '27', '2018-06-27 12:11:00');
INSERT INTO `goods` VALUES ('119', '3', '18', '烟熏三文鱼 100g', '古法烟熏 片片鲜香', '91.00', '44.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/207/1/1-270x270-207-FK6WPDTP.jpg', 'https://imgqn9.fruitday.com/images/product_pic/207/1/1-270x270-207-FK6WPDTP.jpg', '28', '2018-06-28 12:11:00');
INSERT INTO `goods` VALUES ('120', '3', '18', '优选东海带鱼段 400g', '鲜、香、嫩，红烧清蒸都好吃', '92.00', '45.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/186/1/1-270x270-186-59YY8SA2.jpg', 'https://imgqn9.fruitday.com/images/product_pic/186/1/1-270x270-186-59YY8SA2.jpg', '29', '2018-06-29 12:11:00');
INSERT INTO `goods` VALUES ('121', '3', '18', '海鲜团圆家宴礼盒（8种）3430g 礼盒', '八珍荟萃 团聚正当时', '93.00', '46.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/4694/1/1-270x270-4694-3RSU6YKT.jpg', 'https://imgjd6.fruitday.com/images/product_pic/4694/1/1-270x270-4694-3RSU6YKT.jpg', '30', '2018-06-30 12:11:00');
INSERT INTO `goods` VALUES ('122', '3', '18', '海鲜团圆家宴礼盒（12种）5700g 礼盒', '一桌团圆宴 全家齐分享', '94.00', '47.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/4697/1/1-270x270-4697-D881R2H8.jpg', 'https://imgqn9.fruitday.com/images/product_pic/4697/1/1-270x270-4697-D881R2H8.jpg', '31', '2018-07-01 12:11:00');
INSERT INTO `goods` VALUES ('123', '3', '18', '海鲜团圆家宴礼盒（12种）5350g 礼盒', '海味相伴 共享团聚时光', '95.00', '48.00', '300', 'n', 'https://imgqn8.fruitday.com/images/product_pic/4696/1/1-270x270-4696-9P6XXW25.jpg', 'https://imgqn8.fruitday.com/images/product_pic/4696/1/1-270x270-4696-9P6XXW25.jpg', '32', '2018-03-09 17:39:13');
INSERT INTO `goods` VALUES ('124', '3', '18', '海鲜团圆家宴礼盒（10种）4500g 礼盒', '海鲜大集合 献给爱的家', '96.00', '49.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/4695/1/1-270x270-4695-S8ADYX9P.jpg', 'https://imgjd7.fruitday.com/images/product_pic/4695/1/1-270x270-4695-S8ADYX9P.jpg', '33', '2018-07-03 12:11:00');
INSERT INTO `goods` VALUES ('125', '3', '18', '海鲜团圆家宴礼盒（12种）6200g 礼盒', '品海鲜盛宴 享欢聚时刻 ​', '97.00', '50.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/4698/1/1-270x270-4698-41B9PTR8.jpg', 'https://imgjd1.fruitday.com/images/product_pic/4698/1/1-270x270-4698-41B9PTR8.jpg', '13', '2018-07-04 12:11:00');
INSERT INTO `goods` VALUES ('126', '3', '18', '阿拉斯加黑鳕鱼（美国） 400g', '宝宝也爱吃的“长寿鱼”', '98.00', '51.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/212/1/1-270x270-212-KAXX6URT.jpg', 'https://imgjd7.fruitday.com/images/product_pic/212/1/1-270x270-212-KAXX6URT.jpg', '14', '2018-07-05 12:11:00');
INSERT INTO `goods` VALUES ('127', '3', '19', '智利蓝贻贝 500g', '嚼劲多汁，回味甘甜', '99.00', '52.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/483/1/1-270x270-483-P78TX57K.jpg', 'https://imgjd6.fruitday.com/images/product_pic/483/1/1-270x270-483-P78TX57K.jpg', '15', '2018-07-06 12:11:00');
INSERT INTO `goods` VALUES ('128', '3', '19', '加拿大北极贝（刺身级） 350g', '柔韧多汁 回味甘甜', '100.00', '53.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/2102/1/1-270x270-2102-36RH79D8.jpg', 'https://imgjd6.fruitday.com/images/product_pic/2102/1/1-270x270-2102-36RH79D8.jpg', '16', '2018-07-07 12:11:00');
INSERT INTO `goods` VALUES ('129', '3', '19', '渤海鲜贝 200g', '去壳贝肉 解冻后就能炒', '101.00', '54.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/3435/1/1-270x270-3435-ACB57BCB.jpg', 'https://imgjd1.fruitday.com/images/product_pic/3435/1/1-270x270-3435-ACB57BCB.jpg', '17', '2018-07-08 12:11:00');
INSERT INTO `goods` VALUES ('130', '3', '19', '爱尔兰北蛾螺（熟冻全壳） 500g', '大口扎实的肉感', '102.00', '55.00', '200', 'n', 'https://imgjd4.fruitday.com/images/product_pic/2042/1/1-270x270-2042-FU5CRSC7.jpg', 'https://imgjd4.fruitday.com/images/product_pic/2042/1/1-270x270-2042-FU5CRSC7.jpg', '18', '2018-07-09 12:11:00');
INSERT INTO `goods` VALUES ('131', '3', '19', '加拿大北极贝 150g', '柔韧多汁 回味甘甜', '103.00', '56.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/482/1/1-270x270-482-XUD9XW89.jpg', 'https://imgqn9.fruitday.com/images/product_pic/482/1/1-270x270-482-XUD9XW89.jpg', '19', '2018-07-10 12:11:00');
INSERT INTO `goods` VALUES ('132', '3', '19', '海鲜团圆家宴礼盒（8种）3430g 礼盒', '八珍荟萃 团聚正当时', '104.00', '57.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/4694/1/1-270x270-4694-3RSU6YKT.jpg', 'https://imgjd6.fruitday.com/images/product_pic/4694/1/1-270x270-4694-3RSU6YKT.jpg', '20', '2018-07-11 12:11:00');
INSERT INTO `goods` VALUES ('133', '3', '19', '海鲜团圆家宴礼盒（12种）5700g 礼盒', '一桌团圆宴 全家齐分享', '105.00', '58.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/4697/1/1-270x270-4697-D881R2H8.jpg', 'https://imgqn9.fruitday.com/images/product_pic/4697/1/1-270x270-4697-D881R2H8.jpg', '21', '2018-07-12 12:11:00');
INSERT INTO `goods` VALUES ('134', '3', '19', '海鲜团圆家宴礼盒（12种）5350g 礼盒', '海味相伴 共享团聚时光', '106.00', '59.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/4696/1/1-270x270-4696-9P6XXW25.jpg', 'https://imgqn8.fruitday.com/images/product_pic/4696/1/1-270x270-4696-9P6XXW25.jpg', '22', '2018-07-13 12:11:00');
INSERT INTO `goods` VALUES ('135', '3', '19', '海鲜团圆家宴礼盒（10种）4500g 礼盒', '海鲜大集合 献给爱的家', '211.00', '156.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/4695/1/1-270x270-4695-S8ADYX9P.jpg', 'https://imgjd7.fruitday.com/images/product_pic/4695/1/1-270x270-4695-S8ADYX9P.jpg', '23', '2018-07-14 12:11:00');
INSERT INTO `goods` VALUES ('136', '3', '19', '海鲜团圆家宴礼盒（12种）6200g 礼盒', '品海鲜盛宴 享欢聚时刻 ​', '212.00', '157.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/4698/1/1-270x270-4698-41B9PTR8.jpg', 'https://imgjd1.fruitday.com/images/product_pic/4698/1/1-270x270-4698-41B9PTR8.jpg', '24', '2018-07-15 12:11:00');
INSERT INTO `goods` VALUES ('137', '3', '20', '泰国软壳蟹 500g', '连壳都能吃', '213.00', '158.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/2040/1/1-270x270-2040-484TT2HP.jpg', 'https://imgjd7.fruitday.com/images/product_pic/2040/1/1-270x270-2040-484TT2HP.jpg', '25', '2018-07-16 12:11:00');
INSERT INTO `goods` VALUES ('138', '3', '20', '海鲜团圆家宴礼盒（8种）3430g 礼盒', '八珍荟萃 团聚正当时', '214.00', '159.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/4694/1/1-270x270-4694-3RSU6YKT.jpg', 'https://imgjd6.fruitday.com/images/product_pic/4694/1/1-270x270-4694-3RSU6YKT.jpg', '26', '2018-07-17 12:11:00');
INSERT INTO `goods` VALUES ('139', '3', '20', '海鲜团圆家宴礼盒（12种）5700g 礼盒', '一桌团圆宴 全家齐分享', '215.00', '160.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/4697/1/1-270x270-4697-D881R2H8.jpg', 'https://imgqn9.fruitday.com/images/product_pic/4697/1/1-270x270-4697-D881R2H8.jpg', '27', '2018-07-18 12:11:00');
INSERT INTO `goods` VALUES ('140', '3', '20', '海鲜团圆家宴礼盒（12种）5350g 礼盒', '海味相伴 共享团聚时光', '216.00', '161.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/4696/1/1-270x270-4696-9P6XXW25.jpg', 'https://imgqn8.fruitday.com/images/product_pic/4696/1/1-270x270-4696-9P6XXW25.jpg', '28', '2018-07-19 12:11:00');
INSERT INTO `goods` VALUES ('141', '3', '20', '海鲜团圆家宴礼盒（10种）4500g 礼盒', '海鲜大集合 献给爱的家', '217.00', '162.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/4695/1/1-270x270-4695-S8ADYX9P.jpg', 'https://imgjd7.fruitday.com/images/product_pic/4695/1/1-270x270-4695-S8ADYX9P.jpg', '29', '2018-07-20 12:11:00');
INSERT INTO `goods` VALUES ('142', '3', '20', '海鲜团圆家宴礼盒（12种）6200g 礼盒', '品海鲜盛宴 享欢聚时刻 ​', '218.00', '163.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/4698/1/1-270x270-4698-41B9PTR8.jpg', 'https://imgjd1.fruitday.com/images/product_pic/4698/1/1-270x270-4698-41B9PTR8.jpg', '30', '2018-07-21 12:11:00');
INSERT INTO `goods` VALUES ('143', '4', '21', '雪花牛肉粒（草原和牛） 300g', '粒粒鲜嫩才牛气', '219.00', '164.00', '200', 'y', 'https://imgjd7.fruitday.com/images/product_pic/312/1/1-270x270-312-HWRXFCF1.jpg', 'https://imgjd7.fruitday.com/images/product_pic/312/1/1-270x270-312-HWRXFCF1.jpg', '31', '2018-03-09 17:37:22');
INSERT INTO `goods` VALUES ('144', '4', '21', '草原和牛牛蹄筋 300g', '煮久不烂 整块厚实', '220.00', '165.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/313/1/1-270x270-313-89X63C77.jpg', 'https://imgqn9.fruitday.com/images/product_pic/313/1/1-270x270-313-89X63C77.jpg', '32', '2018-07-23 12:11:00');
INSERT INTO `goods` VALUES ('145', '4', '21', '澳洲草饲牛腱子(S级) 1000g', '筋肉交错 弹力十足', '221.00', '166.00', '200', 'y', 'https://imgjd7.fruitday.com/images/product_pic/2296/1/1-270x270-2296-CDBY921D.jpg', 'https://imgjd7.fruitday.com/images/product_pic/2296/1/1-270x270-2296-CDBY921D.jpg', '23', '2018-03-09 17:37:23');
INSERT INTO `goods` VALUES ('146', '4', '22', '澳洲菲力牛排(谷饲120天) 180g', '低脂肉香 嫩而多', '222.00', '167.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/2301/1/1-270x270-2301-376XWY3T.jpg', 'https://imgjd5.fruitday.com/images/product_pic/2301/1/1-270x270-2301-376XWY3T.jpg', '24', '2018-07-25 12:11:00');
INSERT INTO `goods` VALUES ('147', '4', '22', '澳洲西冷牛排(谷饲120天) 200g', '齿间厮磨的西冷香', '223.00', '168.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/2299/1/1-270x270-2299-Y7XAKPBP.jpg', 'https://imgqn9.fruitday.com/images/product_pic/2299/1/1-270x270-2299-Y7XAKPBP.jpg', '25', '2018-07-26 12:11:00');
INSERT INTO `goods` VALUES ('148', '4', '22', '澳洲眼肉牛排(谷饲120天) 200g', '肉质嫩而多汁', '224.00', '169.00', '200', 'y', 'https://imgjd4.fruitday.com/images/product_pic/2300/1/1-270x270-2300-DBTF53KW.jpg', 'https://imgjd4.fruitday.com/images/product_pic/2300/1/1-270x270-2300-DBTF53KW.jpg', '26', '2018-03-09 17:37:26');
INSERT INTO `goods` VALUES ('149', '4', '22', '澳洲牛肋条(谷饲120天) 500g', '肥瘦均匀 肉嫩鲜美', '225.00', '170.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/2305/1/1-270x270-2305-3XU8D5Y2.jpg', 'https://imgqn9.fruitday.com/images/product_pic/2305/1/1-270x270-2305-3XU8D5Y2.jpg', '27', '2018-07-28 12:11:00');
INSERT INTO `goods` VALUES ('150', '4', '22', '澳洲安格斯西冷牛排 150g*4', '比牛排馆更好品质 在家享用', '226.00', '171.00', '200', 'y', 'https://imgjd4.fruitday.com/images/product_pic/3566/1/1-270x270-3566-TKK51RA9.jpg', 'https://imgjd4.fruitday.com/images/product_pic/3566/1/1-270x270-3566-TKK51RA9.jpg', '28', '2018-03-09 17:37:29');
INSERT INTO `goods` VALUES ('151', '4', '23', '太行山散养土鸡 1150g', '生态散养有肉感，煲汤红烧两相宜', '227.00', '172.00', '200', 'y', 'https://imgjd7.fruitday.com/images/product_pic/616/1/1-270x270-616-21Y3D2WX.jpg', 'https://imgjd7.fruitday.com/images/product_pic/616/1/1-270x270-616-21Y3D2WX.jpg', '29', '2018-03-09 17:37:31');
INSERT INTO `goods` VALUES ('152', '4', '23', '苏食草公鸡 1kg', '散养草鸡，红烧更鲜香', '228.00', '173.00', '200', 'n', 'https://imgjd4.fruitday.com/images/product_pic/570/1/1-270x270-570-T2CR8THX.jpg', 'https://imgjd4.fruitday.com/images/product_pic/570/1/1-270x270-570-T2CR8THX.jpg', '30', '2018-07-31 12:11:00');
INSERT INTO `goods` VALUES ('153', '5', '24', '卡士原味鲜酪乳 三联杯*2', '经典原味 口感顺滑', '229.00', '174.00', '200', 'y', 'https://imgjd2.fruitday.com/images/product_pic/161/1/1-270x270-161-TAW9WCYP.jpg', 'https://imgjd2.fruitday.com/images/product_pic/161/1/1-270x270-161-TAW9WCYP.jpg', '31', '2018-03-09 17:37:40');
INSERT INTO `goods` VALUES ('154', '5', '24', '卡士原味鲜酪乳 三联杯*1', '经典原味 口感顺滑', '230.00', '175.00', '200', 'y', 'https://imgqn9.fruitday.com/images/product_pic/161/1/1-270x270-161-TAW9WCYP.jpg', 'https://imgqn9.fruitday.com/images/product_pic/161/1/1-270x270-161-TAW9WCYP.jpg', '32', '2018-03-09 17:37:42');
INSERT INTO `goods` VALUES ('155', '5', '24', '卡士发酵乳（餐后一小时） 250g*3', '100亿双歧杆菌 更活力', '231.00', '176.00', '200', 'y', 'https://imgqn9.fruitday.com/images/product_pic/2401/1/1-270x270-2401-WP4T1KYS.jpg', 'https://imgqn9.fruitday.com/images/product_pic/2401/1/1-270x270-2401-WP4T1KYS.jpg', '33', '2018-03-09 17:37:44');
INSERT INTO `goods` VALUES ('156', '5', '24', '卡士鲜酪乳（蓝莓） 100g*3', '醇厚丝滑 蓝莓嚼得到', '232.00', '177.00', '200', 'y', 'https://imgjd6.fruitday.com/images/product_pic/3418/1/1-270x270-3418-2YXKBTXP.jpg', 'https://imgjd6.fruitday.com/images/product_pic/3418/1/1-270x270-3418-2YXKBTXP.jpg', '13', '2018-03-09 17:37:48');
INSERT INTO `goods` VALUES ('157', '5', '24', '卡士鲜酪乳（黄桃） 100g*3', '桃味浓郁 口感幼滑', '233.00', '178.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/3420/1/1-270x270-3420-TY48F1KD.jpg', 'https://imgjd7.fruitday.com/images/product_pic/3420/1/1-270x270-3420-TY48F1KD.jpg', '14', '2018-08-05 12:11:00');
INSERT INTO `goods` VALUES ('158', '5', '24', '卡士原态酪乳三联杯 375g', '香浓细腻 入口柔滑', '234.00', '179.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/164/1/1-270x270-164-8K3AHH13.jpg', 'https://imgjd3.fruitday.com/images/product_pic/164/1/1-270x270-164-8K3AHH13.jpg', '15', '2018-08-06 12:11:00');
INSERT INTO `goods` VALUES ('159', '6', '25', '甜玉米（2个装） 500g', '粗粮搭配 膳食均衡', '235.00', '180.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/237/1/1-270x270-237-APD4YYHR.jpg', 'https://imgjd3.fruitday.com/images/product_pic/237/1/1-270x270-237-APD4YYHR.jpg', '16', '2018-08-07 12:11:00');
INSERT INTO `goods` VALUES ('160', '6', '25', '鲜食水果玉米（即食） 2份', '免煮即食 一口喷汁', '236.00', '181.00', '300', 'n', 'https://imgjd3.fruitday.com/images/product_pic/2359/1/1-270x270-2359-SHWTK77K.jpg', 'https://imgjd3.fruitday.com/images/product_pic/2359/1/1-270x270-2359-SHWTK77K.jpg', '17', '2018-03-09 17:39:08');
INSERT INTO `goods` VALUES ('161', '6', '25', '鲜食水果玉米（即食） 1份', '免煮即食 一口喷汁', '237.00', '182.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/2359/1/1-270x270-2359-SHWTK77K.jpg', 'https://imgjd5.fruitday.com/images/product_pic/2359/1/1-270x270-2359-SHWTK77K.jpg', '18', '2018-08-09 12:11:00');
INSERT INTO `goods` VALUES ('162', '6', '25', '海南秋葵 200g', '适宜三高人群的健康美味', '238.00', '183.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/239/1/1-270x270-239-SDKR3PBD.jpg', 'https://imgqn8.fruitday.com/images/product_pic/239/1/1-270x270-239-SDKR3PBD.jpg', '19', '2018-08-10 12:11:00');
INSERT INTO `goods` VALUES ('163', '6', '25', '浙江白萝卜（单个） 500g', '人称”土人参“ 健康多滋润', '239.00', '184.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/117/1/1-270x270-117-RRK82K82.jpg', 'https://imgjd2.fruitday.com/images/product_pic/117/1/1-270x270-117-RRK82K82.jpg', '20', '2018-08-11 12:11:00');
INSERT INTO `goods` VALUES ('164', '6', '25', '金华芋艿 300g', '炖汤香酥 白煮香糯', '240.00', '185.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/283/1/1-270x270-283-312H31Y2.jpg', 'https://imgqn9.fruitday.com/images/product_pic/283/1/1-270x270-283-312H31Y2.jpg', '21', '2018-08-12 12:11:00');
INSERT INTO `goods` VALUES ('165', '6', '25', '山东迷你土豆 500g', 'Q版迷你小土豆', '241.00', '186.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/110/1/1-270x270-110-HYKTS858.jpg', 'https://imgjd6.fruitday.com/images/product_pic/110/1/1-270x270-110-HYKTS858.jpg', '22', '2018-08-13 12:11:00');
INSERT INTO `goods` VALUES ('166', '6', '25', '山东黄心大土豆 500g', '肉厚皮薄 简单也美味', '242.00', '187.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/106/1/1-270x270-106-W65K5SA2.jpg', 'https://imgjd2.fruitday.com/images/product_pic/106/1/1-270x270-106-W65K5SA2.jpg', '23', '2018-08-14 12:11:00');
INSERT INTO `goods` VALUES ('167', '6', '25', '焦作铁棍山药 250g', '营养多元 长寿因子', '243.00', '188.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/135/1/1-270x270-135-BRU25YUR.jpg', 'https://imgjd5.fruitday.com/images/product_pic/135/1/1-270x270-135-BRU25YUR.jpg', '24', '2018-08-15 12:11:00');
INSERT INTO `goods` VALUES ('168', '6', '25', '越南紫薯 500g', '甜糯好滋味', '244.00', '189.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/104/1/1-270x270-104-XYHBS5UW.jpg', 'https://imgjd7.fruitday.com/images/product_pic/104/1/1-270x270-104-XYHBS5UW.jpg', '25', '2018-08-16 12:11:00');
INSERT INTO `goods` VALUES ('169', '6', '25', '安徽胡萝卜 400g', '新鲜清脆 炖汤甜酥', '245.00', '190.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/127/1/1-270x270-127-K2HDKBHW.jpg', 'https://imgjd1.fruitday.com/images/product_pic/127/1/1-270x270-127-K2HDKBHW.jpg', '26', '2018-08-17 12:11:00');
INSERT INTO `goods` VALUES ('170', '6', '25', '浙江西兰花 350g', '西餐料理好搭档 点缀就靠它', '246.00', '191.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/263/1/1-270x270-263-AH3DD6B8.jpg', 'https://imgqn8.fruitday.com/images/product_pic/263/1/1-270x270-263-AH3DD6B8.jpg', '27', '2018-08-18 12:11:00');
INSERT INTO `goods` VALUES ('171', '6', '25', '红薯 500g', '细腻甜糯，香味浓郁', '247.00', '192.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/157/1/1-270x270-157-DBKXB6HF.jpg', 'https://imgqn8.fruitday.com/images/product_pic/157/1/1-270x270-157-DBKXB6HF.jpg', '28', '2018-08-19 12:11:00');
INSERT INTO `goods` VALUES ('172', '6', '26', '番茄 300g', '肉厚沙甜 汁多爽口', '248.00', '193.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/227/1/1-270x270-227-35CP8C5F.jpg', 'https://imgjd1.fruitday.com/images/product_pic/227/1/1-270x270-227-35CP8C5F.jpg', '29', '2018-08-20 12:11:00');
INSERT INTO `goods` VALUES ('173', '6', '27', '山东水果黄瓜 250g', '亦蔬亦果 清新爽脆', '249.00', '194.00', '200', 'y', 'https://imgqn8.fruitday.com/images/product_pic/232/1/1-270x270-232-DFY6CP49.jpg', 'https://imgqn8.fruitday.com/images/product_pic/232/1/1-270x270-232-DFY6CP49.jpg', '30', '2018-03-09 17:37:56');
INSERT INTO `goods` VALUES ('174', '6', '27', '新西兰进口小南瓜 800g', '小南瓜', '250.00', '195.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/4757/1/1-270x270-4757-AD2K7RP9.jpg', 'https://imgjd7.fruitday.com/images/product_pic/4757/1/1-270x270-4757-AD2K7RP9.jpg', '31', '2018-08-22 12:11:00');
INSERT INTO `goods` VALUES ('175', '6', '27', '山东西葫芦 700g', '搭配肉炒 清新解腻', '251.00', '196.00', '200', 'y', 'https://imgjd5.fruitday.com/images/product_pic/251/1/1-270x270-251-8AB3B2T5.jpg', 'https://imgjd5.fruitday.com/images/product_pic/251/1/1-270x270-251-8AB3B2T5.jpg', '32', '2018-03-09 17:37:58');
INSERT INTO `goods` VALUES ('176', '6', '28', '山东大蒜头 180g', '蒜香浓郁 微辛不辣', '252.00', '197.00', '200', 'n', 'https://imgjd4.fruitday.com/images/product_pic/154/1/1-270x270-154-81DUKW19.jpg', 'https://imgjd4.fruitday.com/images/product_pic/154/1/1-270x270-154-81DUKW19.jpg', '23', '2018-08-24 12:11:00');
INSERT INTO `goods` VALUES ('177', '6', '28', '厦门小米椒 80g', '标致辣妹子', '253.00', '198.00', '200', 'y', 'https://imgjd5.fruitday.com/images/product_pic/246/1/1-270x270-246-P2P5S45P.jpg', 'https://imgjd5.fruitday.com/images/product_pic/246/1/1-270x270-246-P2P5S45P.jpg', '24', '2018-03-09 17:38:00');
INSERT INTO `goods` VALUES ('178', '6', '28', '甘肃红洋葱 400g', '健康绿色 无污染', '254.00', '199.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/284/1/1-270x270-284-RHPYH99W.jpg', 'https://imgjd5.fruitday.com/images/product_pic/284/1/1-270x270-284-RHPYH99W.jpg', '25', '2018-08-26 12:11:00');
INSERT INTO `goods` VALUES ('179', '6', '28', '山东生姜 150g', '去腥好帮手', '255.00', '200.00', '200', 'y', 'https://imgjd2.fruitday.com/images/product_pic/124/1/1-270x270-124-PK39P6KW.jpg', 'https://imgjd2.fruitday.com/images/product_pic/124/1/1-270x270-124-PK39P6KW.jpg', '26', '2018-03-09 17:38:02');
INSERT INTO `goods` VALUES ('180', '6', '28', '淮安大红椒 200g', '肉厚紧实 脆嫩清甜', '256.00', '201.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/255/1/1-270x270-255-FRD6RTTD.jpg', 'https://imgqn8.fruitday.com/images/product_pic/255/1/1-270x270-255-FRD6RTTD.jpg', '27', '2018-08-28 12:11:00');
INSERT INTO `goods` VALUES ('181', '6', '29', '荷兰豆 200g', '遇上腊肠美味加倍', '257.00', '202.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/249/1/1-270x270-249-RTWPD18H.jpg', 'https://imgjd3.fruitday.com/images/product_pic/249/1/1-270x270-249-RTWPD18H.jpg', '28', '2018-08-29 12:11:00');
INSERT INTO `goods` VALUES ('182', '6', '30', '杏鲍菇 200g', '鲜香肥厚，西餐搭档', '258.00', '203.00', '200', 'y', 'https://imgjd6.fruitday.com/images/product_pic/226/1/1-270x270-226-WS3BT38T.jpg', 'https://imgjd6.fruitday.com/images/product_pic/226/1/1-270x270-226-WS3BT38T.jpg', '29', '2018-03-09 17:38:04');
INSERT INTO `goods` VALUES ('183', '6', '30', '香菇 200g', '嫩滑爽口，鲜香四溢', '259.00', '204.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/213/1/1-270x270-213-86ABS26P.jpg', 'https://imgqn8.fruitday.com/images/product_pic/213/1/1-270x270-213-86ABS26P.jpg', '30', '2018-08-31 12:11:00');
INSERT INTO `goods` VALUES ('184', '6', '31', '青甘蓝 600g', '生来圆滚滚 天然清脆甜', '260.00', '205.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/328/1/1-270x270-328-8F2CAFUW.jpg', 'https://imgjd7.fruitday.com/images/product_pic/328/1/1-270x270-328-8F2CAFUW.jpg', '31', '2018-09-01 12:11:00');
INSERT INTO `goods` VALUES ('185', '6', '31', '紫甘蓝 500g', '生来圆滚滚 天然清脆甜', '261.00', '206.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/2227/1/1-270x270-2227-PC4BWACW.jpg', 'https://imgjd7.fruitday.com/images/product_pic/2227/1/1-270x270-2227-PC4BWACW.jpg', '32', '2018-09-02 12:11:00');
INSERT INTO `goods` VALUES ('186', '6', '31', '云南娃娃菜 500g', '健康绿色 无污染', '262.00', '207.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/333/1/1-270x270-333-4W3BPYPT.jpg', 'https://imgjd7.fruitday.com/images/product_pic/333/1/1-270x270-333-4W3BPYPT.jpg', '33', '2018-09-03 12:11:00');
INSERT INTO `goods` VALUES ('187', '7', '32', '淡干紫菜 50g', '头水紫菜更鲜嫩', '263.00', '208.00', '330', 'n', 'https://imgjd3.fruitday.com/images/product_pic/2121/1/1-270x270-2121-7UW6XCXS.jpg', 'https://imgjd3.fruitday.com/images/product_pic/2121/1/1-270x270-2121-7UW6XCXS.jpg', '13', '2018-03-08 18:55:43');
INSERT INTO `goods` VALUES ('188', '7', '32', '禾煜桂圆皇 550g', '颗颗饱满 甜而不腻', '264.00', '209.00', '200', 'y', 'https://imgjd7.fruitday.com/images/product_pic/4091/1/1-270x270-4091-7W7CD62F.jpg', 'https://imgjd7.fruitday.com/images/product_pic/4091/1/1-270x270-4091-7W7CD62F.jpg', '14', '2018-03-09 17:38:11');
INSERT INTO `goods` VALUES ('189', '7', '32', '开洋 250g', '海中蛋白 营养更全面', '265.00', '210.00', '200', 'y', 'https://imgjd5.fruitday.com/images/product_pic/93/1/1-270x270-93-P5US7K46.jpg', 'https://imgjd5.fruitday.com/images/product_pic/93/1/1-270x270-93-P5US7K46.jpg', '15', '2018-03-09 17:38:14');
INSERT INTO `goods` VALUES ('190', '7', '32', '新疆灰枣 500g', '核小肉厚 雪水孕育的浓甜', '266.00', '211.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/92/1/1-270x270-92-KRSW8UB9.jpg', 'https://imgjd2.fruitday.com/images/product_pic/92/1/1-270x270-92-KRSW8UB9.jpg', '16', '2018-09-07 12:11:00');
INSERT INTO `goods` VALUES ('191', '7', '32', '大连速发干海参 60g', '深海野生海参 精致礼盒装', '267.00', '212.00', '200', 'y', 'https://imgjd6.fruitday.com/images/product_pic/4838/1/1-270x270-4838-79C31WAK.jpg', 'https://imgjd6.fruitday.com/images/product_pic/4838/1/1-270x270-4838-79C31WAK.jpg', '17', '2018-03-09 17:38:16');
INSERT INTO `goods` VALUES ('192', '7', '33', '精选有机薏仁米 300g', '熬出一碗谷物香', '268.00', '213.00', '200', 'y', 'https://imgjd3.fruitday.com/images/product_pic/618/1/1-270x270-618-6APR9S6D.jpg', 'https://imgjd3.fruitday.com/images/product_pic/618/1/1-270x270-618-6APR9S6D.jpg', '18', '2018-03-09 17:38:18');
INSERT INTO `goods` VALUES ('193', '8', '34', '桂发祥十八街多味麻花 500g', '地道天津味 香酥多味都齐全', '269.00', '214.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/4944/1/1-270x270-4944-25BT5C76.jpg', 'https://imgqn9.fruitday.com/images/product_pic/4944/1/1-270x270-4944-25BT5C76.jpg', '19', '2018-09-10 12:11:00');
INSERT INTO `goods` VALUES ('194', '8', '34', '来伊份南枣核桃糕250g 250g', '养身小零食 低糖又软糯', '270.00', '215.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/4905/1/1-270x270-4905-4KBFP6K5.jpg', 'https://imgjd6.fruitday.com/images/product_pic/4905/1/1-270x270-4905-4KBFP6K5.jpg', '20', '2018-09-11 12:11:00');
INSERT INTO `goods` VALUES ('195', '9', '35', '秦岭生态蜂蜜 200g', '集花草精华 酿造出的甜', '271.00', '216.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/3461/1/1-270x270-3461-D7Y6FCUW.jpg', 'https://imgjd1.fruitday.com/images/product_pic/3461/1/1-270x270-3461-D7Y6FCUW.jpg', '21', '2018-09-12 12:11:00');
INSERT INTO `goods` VALUES ('196', '10', '36', '心晴DIY果茶礼盒 礼盒', '心晴DIY果茶礼盒（6.19起发货）', '272.00', '217.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/2560/1/1-270x270-2560-AAA9YX9A.jpg', 'https://imgjd6.fruitday.com/images/product_pic/2560/1/1-270x270-2560-AAA9YX9A.jpg', '22', '2018-09-13 12:11:00');
INSERT INTO `goods` VALUES ('197', '10', '36', '佳沛意大利绿奇异果（原箱） 36个', '细嫩绿芯 酸甜爽口', '273.00', '218.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg', 'https://imgjd1.fruitday.com/images/product_pic/2066/1/1-270x270-2066-55F664F8.jpg', '23', '2018-09-14 12:11:00');
INSERT INTO `goods` VALUES ('198', '10', '36', '1841桑格利亚水果礼盒 礼盒', '1841桑格利亚水果礼盒', '274.00', '219.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/3167/1/1-270x270-3167-UCX85CP4.jpg', 'https://imgqn9.fruitday.com/images/product_pic/3167/1/1-270x270-3167-UCX85CP4.jpg', '24', '2018-09-15 12:11:00');
INSERT INTO `goods` VALUES ('199', '10', '36', '诚心诚意礼盒 1盒', '送“礼”就要“诚心诚意”', '275.00', '220.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/432/1/1-270x270-432-HT4AYU3F.jpg', 'https://imgjd7.fruitday.com/images/product_pic/432/1/1-270x270-432-HT4AYU3F.jpg', '25', '2018-09-16 12:11:00');
INSERT INTO `goods` VALUES ('200', '10', '36', '万事如意礼盒 1盒', '万事如意 健康新鲜', '276.00', '221.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/435/1/1-270x270-435-6RCCRDWH.jpg', 'https://imgjd5.fruitday.com/images/product_pic/435/1/1-270x270-435-6RCCRDWH.jpg', '26', '2018-09-17 12:11:00');
INSERT INTO `goods` VALUES ('201', '10', '36', '暖人心《美》礼盒 1盒', '送上水果 暖人心田', '277.00', '222.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/448/1/1-270x270-448-DUB2SUHK.jpg', 'https://imgqn8.fruitday.com/images/product_pic/448/1/1-270x270-448-DUB2SUHK.jpg', '27', '2018-09-18 12:11:00');
INSERT INTO `goods` VALUES ('202', '10', '36', '低糖礼盒 1盒', '减肥人群也能大口吃', '278.00', '223.00', '200', 'n', 'https://imgjd4.fruitday.com/images/product_pic/424/1/1-270x270-424-91Y8SWH8.jpg', 'https://imgjd4.fruitday.com/images/product_pic/424/1/1-270x270-424-91Y8SWH8.jpg', '28', '2018-09-19 12:11:00');
INSERT INTO `goods` VALUES ('203', '10', '36', '欢乐孕期水果礼盒B 1盒', '精选水果 孕妇也能放心吃', '279.00', '224.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/443/1/1-270x270-443-T25KKW49.jpg', 'https://imgjd2.fruitday.com/images/product_pic/443/1/1-270x270-443-T25KKW49.jpg', '29', '2018-09-20 12:11:00');
INSERT INTO `goods` VALUES ('204', '10', '36', '别克英朗节气水果礼盒 盒', '懂，让彼此更近', '280.00', '225.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/449/1/1-270x270-449-52HXSH7F.jpg', 'https://imgqn9.fruitday.com/images/product_pic/449/1/1-270x270-449-52HXSH7F.jpg', '30', '2018-09-21 12:11:00');
INSERT INTO `goods` VALUES ('205', '10', '36', 'Mom\'s Love 1盒', '鲜果礼盒犒劳妈妈', '281.00', '226.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/452/1/1-270x270-452-9S1WYW7D.jpg', 'https://imgjd5.fruitday.com/images/product_pic/452/1/1-270x270-452-9S1WYW7D.jpg', '31', '2018-09-22 12:11:00');
INSERT INTO `goods` VALUES ('206', '10', '36', '缤纷营养水果礼盒 1份', '多种时令水果随心享', '282.00', '227.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/3322/1/1-270x270-3322-6PXS7W13.jpg', 'https://imgjd2.fruitday.com/images/product_pic/3322/1/1-270x270-3322-6PXS7W13.jpg', '32', '2018-09-23 12:11:00');
INSERT INTO `goods` VALUES ('207', '10', '36', '阳光普照B礼盒 礼盒', '有“礼”的日子 阳光明媚(包装随机)', '283.00', '228.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/410/1/1-270x270-410-7P7PDCBU.jpg', 'https://imgjd6.fruitday.com/images/product_pic/410/1/1-270x270-410-7P7PDCBU.jpg', '23', '2018-09-24 12:11:00');
INSERT INTO `goods` VALUES ('208', '10', '36', '爱的回报礼盒 1盒', '把特别的爱回报给家人', '284.00', '229.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/427/1/1-270x270-427-XPX2SP2D.jpg', 'https://imgjd1.fruitday.com/images/product_pic/427/1/1-270x270-427-XPX2SP2D.jpg', '24', '2018-09-25 12:11:00');
INSERT INTO `goods` VALUES ('209', '10', '36', '心扉水果礼盒 礼盒', '备上缤纷水果 敞开温暖心扉', '285.00', '230.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/4610/1/1-270x270-4610-1C6AHXHT.jpg', 'https://imgjd1.fruitday.com/images/product_pic/4610/1/1-270x270-4610-1C6AHXHT.jpg', '25', '2018-09-26 12:11:00');
INSERT INTO `goods` VALUES ('210', '10', '36', '心悦水果礼盒 礼盒', '随心所享 缤纷果悦每一天', '286.00', '231.00', '510', 'n', 'https://imgjd3.fruitday.com/images/product_pic/4614/1/1-270x270-4614-32X2XC9B.jpg', 'https://imgjd3.fruitday.com/images/product_pic/4614/1/1-270x270-4614-32X2XC9B.jpg', '26', '2018-03-08 18:55:36');
INSERT INTO `goods` VALUES ('211', '10', '36', '玉兔追月.美满礼 礼盒', '鲜果如满月 玉兔乐成双', '287.00', '232.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/3353/1/1-270x270-3353-2TXDBC8C.jpg', 'https://imgqn9.fruitday.com/images/product_pic/3353/1/1-270x270-3353-2TXDBC8C.jpg', '27', '2018-09-28 12:11:00');
INSERT INTO `goods` VALUES ('212', '10', '36', '优选美国爱妃苹果礼盒 15个', '优选钻石颜值 甜脆嚼多汁', '288.00', '233.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/4550/1/1-270x270-4550-HDDCC1WH.jpg', 'https://imgjd3.fruitday.com/images/product_pic/4550/1/1-270x270-4550-HDDCC1WH.jpg', '28', '2018-09-29 12:11:00');
INSERT INTO `goods` VALUES ('213', '10', '36', '与众不同礼盒 1盒', '鲜果好礼 相赠有个性的你', '289.00', '234.00', '200', 'n', 'https://imgjd7.fruitday.com/images/product_pic/3356/1/1-270x270-3356-5D1F2KDU.jpg', 'https://imgjd7.fruitday.com/images/product_pic/3356/1/1-270x270-3356-5D1F2KDU.jpg', '29', '2018-09-30 12:11:00');
INSERT INTO `goods` VALUES ('214', '10', '36', '纵情分享礼盒 礼盒', '端午送礼首选', '290.00', '235.00', '200', 'y', 'https://imgjd5.fruitday.com/images/product_pic/2288/1/1-270x270-2288-8TU8XPWA.jpg', 'https://imgjd5.fruitday.com/images/product_pic/2288/1/1-270x270-2288-8TU8XPWA.jpg', '30', '2018-03-09 17:38:23');
INSERT INTO `goods` VALUES ('215', '10', '36', '广发五星尊享礼盒 礼盒', '进口鲜果 尊享品质生活', '291.00', '236.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/2613/1/1-270x270-2613-36X3CYP9.jpg', 'https://imgjd3.fruitday.com/images/product_pic/2613/1/1-270x270-2613-36X3CYP9.jpg', '31', '2018-10-02 12:11:00');
INSERT INTO `goods` VALUES ('216', '10', '36', '广发元气活力礼盒 1盒', '能量鲜果 送活力满满的你', '292.00', '237.00', '200', 'y', 'https://imgqn8.fruitday.com/images/product_pic/3166/1/1-270x270-3166-81YTX3AS.jpg', 'https://imgqn8.fruitday.com/images/product_pic/3166/1/1-270x270-3166-81YTX3AS.jpg', '32', '2018-03-09 17:38:25');
INSERT INTO `goods` VALUES ('217', '10', '36', '广发发现精彩礼盒 礼盒', '缤纷水果 精彩生活', '293.00', '238.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/2612/1/1-270x270-2612-HWRRTTBX.jpg', 'https://imgjd2.fruitday.com/images/product_pic/2612/1/1-270x270-2612-HWRRTTBX.jpg', '33', '2018-10-04 12:11:00');
INSERT INTO `goods` VALUES ('218', '10', '36', '团聚礼盒 1盒', '家族团聚 馈赠亲朋好友', '294.00', '239.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/2163/1/1-270x270-2163-4UD934CS.jpg', 'https://imgjd6.fruitday.com/images/product_pic/2163/1/1-270x270-2163-4UD934CS.jpg', '13', '2018-10-05 12:11:00');
INSERT INTO `goods` VALUES ('219', '10', '36', '仪式感专题礼盒 礼盒', '每天一个水果 吃出仪式感', '295.00', '240.00', '200', 'y', 'https://imgqn8.fruitday.com/images/product_pic/3416/1/1-270x270-3416-CT1UKDK5.jpg', 'https://imgqn8.fruitday.com/images/product_pic/3416/1/1-270x270-3416-CT1UKDK5.jpg', '14', '2018-03-09 17:38:26');
INSERT INTO `goods` VALUES ('220', '10', '36', '佳人柚约 1个', '有“礼”的日子 浪漫而优雅', '296.00', '241.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/629/1/1-270x270-629-A7A6K1X6.jpg', 'https://imgjd2.fruitday.com/images/product_pic/629/1/1-270x270-629-A7A6K1X6.jpg', '15', '2018-10-07 12:11:00');
INSERT INTO `goods` VALUES ('221', '10', '36', '玫丽人生 1盒', '缤纷鲜果 献礼玫丽女神', '297.00', '242.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/4894/1/1-270x270-4894-13TWHXBH.jpg', 'https://imgjd3.fruitday.com/images/product_pic/4894/1/1-270x270-4894-13TWHXBH.jpg', '16', '2018-10-08 12:11:00');
INSERT INTO `goods` VALUES ('222', '10', '36', '玫丽心情 1个', '有“礼”的日子 浪漫而优雅', '298.00', '243.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/621/1/1-270x270-621-HTAAU3D1.jpg', 'https://imgjd3.fruitday.com/images/product_pic/621/1/1-270x270-621-HTAAU3D1.jpg', '17', '2018-10-09 12:11:00');
INSERT INTO `goods` VALUES ('223', '10', '37', '心悦水果果干礼盒 礼盒', '醇甜美味 伴你愉悦时刻', '299.00', '244.00', '200', 'n', 'https://imgjd5.fruitday.com/images/product_pic/4612/1/1-270x270-4612-95F796WB.jpg', 'https://imgjd5.fruitday.com/images/product_pic/4612/1/1-270x270-4612-95F796WB.jpg', '18', '2018-10-10 12:11:00');
INSERT INTO `goods` VALUES ('224', '10', '38', '窈窕俏佳人套餐 1份', '新鲜健康吃出窈窕美丽', '300.00', '245.00', '420', 'n', 'https://imgjd7.fruitday.com/images/product_pic/417/1/1-270x270-417-H75679F4.jpg', 'https://imgjd7.fruitday.com/images/product_pic/417/1/1-270x270-417-H75679F4.jpg', '19', '2018-03-08 18:55:30');
INSERT INTO `goods` VALUES ('225', '10', '38', '养颜组合套餐 组合', '养颜佳选 营养健康', '301.00', '246.00', '200', 'n', 'https://imgjd4.fruitday.com/images/product_pic/2335/1/1-270x270-2335-7Y86T12R.jpg', 'https://imgjd4.fruitday.com/images/product_pic/2335/1/1-270x270-2335-7Y86T12R.jpg', '20', '2018-10-12 12:11:00');
INSERT INTO `goods` VALUES ('226', '10', '38', '薄荷轻食专享套餐 1份', '精挑细选 只为宠爱的人', '302.00', '247.00', '200', 'n', 'https://imgjd4.fruitday.com/images/product_pic/420/1/1-270x270-420-TT6BRSFW.jpg', 'https://imgjd4.fruitday.com/images/product_pic/420/1/1-270x270-420-TT6BRSFW.jpg', '21', '2018-10-13 12:11:00');
INSERT INTO `goods` VALUES ('227', '10', '38', '智慧baby套餐 1份', '宝宝从此更健康', '303.00', '248.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/415/1/1-270x270-415-FWXWB6A8.jpg', 'https://imgjd3.fruitday.com/images/product_pic/415/1/1-270x270-415-FWXWB6A8.jpg', '22', '2018-10-14 12:11:00');
INSERT INTO `goods` VALUES ('228', '10', '39', '五彩秋日提货券 1张', '缤纷秋色 乐享健康鲜果', '304.00', '249.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/836/1/1-270x270-836-HK839SD6.jpg', 'https://imgjd2.fruitday.com/images/product_pic/836/1/1-270x270-836-HK839SD6.jpg', '23', '2018-10-15 12:11:00');
INSERT INTO `goods` VALUES ('229', '10', '39', '心喜礼盒三选一提货券 1张', '用心选礼 献给爱的TA', '305.00', '250.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/4621/1/1-270x270-4621-5K9U14TX.jpg', 'https://imgjd1.fruitday.com/images/product_pic/4621/1/1-270x270-4621-5K9U14TX.jpg', '24', '2018-10-16 12:11:00');
INSERT INTO `goods` VALUES ('230', '10', '39', '心意礼盒三选一提货券 1张', '满满心意 送给珍视的TA', '306.00', '251.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/4616/1/1-270x270-4616-XHF863Y6.jpg', 'https://imgqn9.fruitday.com/images/product_pic/4616/1/1-270x270-4616-XHF863Y6.jpg', '25', '2018-10-17 12:11:00');
INSERT INTO `goods` VALUES ('231', '10', '39', '心愿礼盒二选一提货券 1张', '美好心愿 好礼来实现', '307.00', '252.00', '200', 'n', 'https://imgjd4.fruitday.com/images/product_pic/4627/1/1-270x270-4627-69TK3W19.jpg', 'https://imgjd4.fruitday.com/images/product_pic/4627/1/1-270x270-4627-69TK3W19.jpg', '26', '2018-10-18 12:11:00');
INSERT INTO `goods` VALUES ('232', '10', '39', '万事如意礼盒提货券 1张', '万事如意 健康新鲜', '308.00', '253.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/837/1/1-270x270-837-C4826SHS.jpg', 'https://imgqn9.fruitday.com/images/product_pic/837/1/1-270x270-837-C4826SHS.jpg', '27', '2018-10-19 12:11:00');
INSERT INTO `goods` VALUES ('233', '10', '39', '天天果园100元充值卡 1张', '用卡享新鲜 幸福享不停', '309.00', '254.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/695/1/1-270x270-695-F2BSB4DC.jpg', 'https://imgqn8.fruitday.com/images/product_pic/695/1/1-270x270-695-F2BSB4DC.jpg', '28', '2018-10-20 12:11:00');
INSERT INTO `goods` VALUES ('234', '10', '39', '天天果园500元充值卡 1张', '用卡享新鲜，幸福生活不会卡', '310.00', '255.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/701/1/1-270x270-701-CB41CHUW.jpg', 'https://imgqn9.fruitday.com/images/product_pic/701/1/1-270x270-701-CB41CHUW.jpg', '29', '2018-10-21 12:11:00');
INSERT INTO `goods` VALUES ('235', '10', '39', '天天果园200元充值卡 1张', '送礼的上佳选择', '311.00', '256.00', '200', 'y', 'https://imgjd7.fruitday.com/images/product_pic/699/1/1-270x270-699-HK24HDC9.jpg', 'https://imgjd7.fruitday.com/images/product_pic/699/1/1-270x270-699-HK24HDC9.jpg', '30', '2018-03-09 17:38:34');
INSERT INTO `goods` VALUES ('236', '10', '39', '天天果园1000元充值卡 1张', '用卡享新鲜 幸福享不停', '312.00', '257.00', '200', 'y', 'https://imgjd1.fruitday.com/images/product_pic/703/1/1-270x270-703-YHSKFR65.jpg', 'https://imgjd1.fruitday.com/images/product_pic/703/1/1-270x270-703-YHSKFR65.jpg', '31', '2018-03-09 17:38:36');
INSERT INTO `goods` VALUES ('237', '10', '39', '惠心礼盒提货券 1张', '实惠鲜果 送礼体面', '313.00', '258.00', '250', 'y', 'https://imgjd6.fruitday.com/images/product_pic/3875/1/1-270x270-3875-C738U918.jpg', 'https://imgjd6.fruitday.com/images/product_pic/3875/1/1-270x270-3875-C738U918.jpg', '32', '2018-03-09 17:38:38');
INSERT INTO `goods` VALUES ('238', '10', '39', '心悦礼盒二选一提货券 1张', '甜蜜喜悦 从唇舌开始', '314.00', '259.00', '200', 'n', 'https://imgjd6.fruitday.com/images/product_pic/4611/1/1-270x270-4611-KYRWRPH9.jpg', 'https://imgjd6.fruitday.com/images/product_pic/4611/1/1-270x270-4611-KYRWRPH9.jpg', '23', '2018-10-25 12:11:00');
INSERT INTO `goods` VALUES ('239', '10', '39', '天天果园300元充值卡 1张', '用卡享新鲜，幸福生活不会卡', '315.00', '260.00', '200', 'n', 'https://imgjd1.fruitday.com/images/product_pic/3302/1/1-270x270-3302-R1AFWTC2.jpg', 'https://imgjd1.fruitday.com/images/product_pic/3302/1/1-270x270-3302-R1AFWTC2.jpg', '24', '2018-10-26 12:11:00');
INSERT INTO `goods` VALUES ('240', '10', '39', '心扉礼盒提货券 1张', '水果的蜜语 把爱说出来', '316.00', '261.00', '200', 'n', 'https://imgjd2.fruitday.com/images/product_pic/4609/1/1-270x270-4609-T2482YRR.jpg', 'https://imgjd2.fruitday.com/images/product_pic/4609/1/1-270x270-4609-T2482YRR.jpg', '25', '2018-10-27 12:11:00');
INSERT INTO `goods` VALUES ('241', '10', '39', '海陆家宴提货券 1张', '海陆家宴提货券', '317.00', '262.00', '300', 'n', 'https://imgqn9.fruitday.com/images/product_pic/3195/1/1-270x270-3195-UUTDWTW6.jpg', 'https://imgqn9.fruitday.com/images/product_pic/3195/1/1-270x270-3195-UUTDWTW6.jpg', '26', '2018-03-09 17:38:57');
INSERT INTO `goods` VALUES ('242', '11', '40', '鹿小天玩偶 1个', '呆萌高个子 时刻等你回家', '318.00', '263.00', '200', 'n', 'https://imgqn8.fruitday.com/images/product_pic/644/1/1-270x270-644-S8RR25W3.jpg', 'https://imgqn8.fruitday.com/images/product_pic/644/1/1-270x270-644-S8RR25W3.jpg', '27', '2018-10-29 12:11:00');
INSERT INTO `goods` VALUES ('243', '11', '40', '折叠加固遮阳晴雨伞 1个', '4000积分兑换，随单领取', '319.00', '264.00', '200', 'y', 'https://imgjd6.fruitday.com/images/product_pic/657/1/1-270x270-657-52BWTCHB.jpg', 'https://imgjd6.fruitday.com/images/product_pic/657/1/1-270x270-657-52BWTCHB.jpg', '28', '2018-03-09 17:38:42');
INSERT INTO `goods` VALUES ('244', '11', '40', '天天果园-方形牛油果抱枕 1个', '手感顺滑 挤压不变形', '320.00', '265.00', '200', 'n', 'https://imgqn9.fruitday.com/images/product_pic/649/1/1-270x270-649-S39CC1RA.jpg', 'https://imgqn9.fruitday.com/images/product_pic/649/1/1-270x270-649-S39CC1RA.jpg', '29', '2018-10-31 12:11:00');
INSERT INTO `goods` VALUES ('245', '11', '40', '单词卡套装', '英语卡片 带宝宝学单词', '321.00', '266.00', '200', 'y', 'https://imgjd7.fruitday.com/images/product_pic/2992/1/1-270x270-2992-74R6HSR9.jpg', 'https://imgjd7.fruitday.com/images/product_pic/2992/1/1-270x270-2992-74R6HSR9.jpg', '30', '2018-03-09 17:38:43');
INSERT INTO `goods` VALUES ('246', '11', '40', '鹿小天抱枕 1个', '可爱鹿小天', '322.00', '267.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/641/1/1-270x270-641-57U7FK8P.jpg', 'https://imgjd3.fruitday.com/images/product_pic/641/1/1-270x270-641-57U7FK8P.jpg', '31', '2018-11-02 12:11:00');
INSERT INTO `goods` VALUES ('247', '11', '40', '鹿小天小公仔 1个', '造型乖巧 贴心陪伴每一天', '323.00', '268.00', '200', 'n', 'https://imgjd3.fruitday.com/images/product_pic/4683/1/1-270x270-4683-RTR519X8.jpg', 'https://imgjd3.fruitday.com/images/product_pic/4683/1/1-270x270-4683-RTR519X8.jpg', '32', '2018-11-03 12:11:00');
INSERT INTO `goods` VALUES ('248', '11', '40', '方形牛油果抱枕 1个', '手感顺滑 挤压不变形', '324.00', '269.00', '200', 'y', 'https://imgjd4.fruitday.com/images/product_pic/649/1/1-270x270-649-S39CC1RA.jpg', 'https://imgjd4.fruitday.com/images/product_pic/649/1/1-270x270-649-S39CC1RA.jpg', '33', '2018-03-09 17:38:45');
INSERT INTO `goods` VALUES ('249', '11', '40', '鹿小天玩偶 1个', '呆萌高个子 时刻等你回家', '325.00', '270.00', '200', 'n', 'https://imgjd4.fruitday.com/images/product_pic/644/1/1-270x270-644-S8RR25W3.jpg', 'https://imgjd4.fruitday.com/images/product_pic/644/1/1-270x270-644-S8RR25W3.jpg', '34', '2018-11-05 12:11:00');
INSERT INTO `goods` VALUES ('250', '11', '40', '橙先生抱枕 1个', '暖手抱枕 冬天不怕冷', '326.00', '271.00', '200', 'y', 'https://imgjd6.fruitday.com/images/product_pic/663/1/1-270x270-663-963D7CWH.jpg', 'https://imgjd6.fruitday.com/images/product_pic/663/1/1-270x270-663-963D7CWH.jpg', '35', '2018-03-09 17:38:47');
INSERT INTO `goods` VALUES ('251', '11', '40', '旺年精制红包封 3个', '喜迎新年 旺年会GO旺​', '327.00', '272.00', '200', 'yy', 'https://imgjd3.fruitday.com/images/product_pic/4804/1/1-270x270-4804-PD9BRDBA.jpg', 'https://imgjd3.fruitday.com/images/product_pic/4804/1/1-270x270-4804-PD9BRDBA.jpg', '36', '2018-03-09 17:38:53');
INSERT INTO `goods` VALUES ('252', '11', '40', '旺年精制窗花 1张', '喜迎新年 旺年会GO旺​', '328.00', '273.00', '200', 'n', 'https://imgjd4.fruitday.com/images/product_pic/4803/1/1-270x270-4803-KTSC5F69.jpg', 'https://imgjd4.fruitday.com/images/product_pic/4803/1/1-270x270-4803-KTSC5F69.jpg', '37', '2018-11-08 12:11:00');
INSERT INTO `goods` VALUES ('253', '11', '40', '天天果园-U型枕 1个', '支撑颈部 缓解肩部压力', '329.00', '274.00', '300', 'n', 'https://imgjd3.fruitday.com/images/product_pic/652/1/1-270x270-652-PW777TC5.jpg', 'https://imgjd3.fruitday.com/images/product_pic/652/1/1-270x270-652-PW777TC5.jpg', '38', '2018-03-08 18:55:18');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `contant` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '1', '1', '2', '挺新鲜', '2018-03-08 19:32:23');
INSERT INTO `grade` VALUES ('2', '2', '2', '4', '好看又好吃，下次再来关顾', '2018-03-08 19:32:25');
INSERT INTO `grade` VALUES ('3', '1', '3', '5', '5555,太好吃了', '2018-03-08 19:33:13');
INSERT INTO `grade` VALUES ('4', '1', '4', '4', '很新鲜，味道很赞，支持！', '2018-03-08 19:36:43');
INSERT INTO `grade` VALUES ('5', '3', '5', '3', '还行，没有那么想象的好', '2018-03-08 19:38:04');
INSERT INTO `grade` VALUES ('6', '4', '2', '5', '第一次买，还不错哦！', '2018-03-08 19:38:33');
INSERT INTO `grade` VALUES ('7', '5', '1', '4', '挺新鲜的', '2018-03-08 19:40:04');
INSERT INTO `grade` VALUES ('8', '6', '2', '5', '挺新鲜，好吃', '2018-03-08 19:40:10');
INSERT INTO `grade` VALUES ('9', '7', '2', '5', '好吃', '2018-03-08 19:40:28');

-- ----------------------------
-- Table structure for orderproduct
-- ----------------------------
DROP TABLE IF EXISTS `orderproduct`;
CREATE TABLE `orderproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of orderproduct
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `total` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for smalltype
-- ----------------------------
DROP TABLE IF EXISTS `smalltype`;
CREATE TABLE `smalltype` (
  `id` int(10) NOT NULL,
  `bigtypeid` int(10) DEFAULT NULL,
  `imgurl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of smalltype
-- ----------------------------
INSERT INTO `smalltype` VALUES ('1', '1', 'https://imgjd5.fruitday.com/images/2017-09-19/2e7463ed7ab392af0fd3370586cad765.png', '奇异果', '2018-03-02 10:20:00');
INSERT INTO `smalltype` VALUES ('2', '1', 'https://imgjd6.fruitday.com/images/2017-09-19/315492971f93b7c3be196e3a7607dfae.png', '苹果', '2018-03-03 10:20:00');
INSERT INTO `smalltype` VALUES ('3', '1', 'https://imgjd7.fruitday.com/images/2017-09-19/c24ec3729633a5a5ede075ebcb12fb7b.png', '橙柑橘柚', '2018-03-04 10:20:00');
INSERT INTO `smalltype` VALUES ('4', '1', 'https://imgjd1.fruitday.com/images/2017-09-19/c244ee074affb7df9596265b85f7f522.png', '冷冻虾类', '2018-03-05 10:20:00');
INSERT INTO `smalltype` VALUES ('5', '1', 'https://imgjd4.fruitday.com/images/2017-09-19/150cac7bb274ff768f58e10ce8838de7.png', '牛排', '2018-03-06 10:20:00');
INSERT INTO `smalltype` VALUES ('6', '1', 'https://imgjd3.fruitday.com/images/2017-09-19/f9910592199add9c473eb005163b0014.png', '牛肉类', '2018-03-07 10:20:00');
INSERT INTO `smalltype` VALUES ('7', '1', 'https://imgjd6.fruitday.com/images/2017-09-19/3f231620aeb8c67c7221315808976a17.png', '冷藏酸奶', '2018-03-08 10:20:00');
INSERT INTO `smalltype` VALUES ('8', '1', 'https://imgjd7.fruitday.com/images/2017-09-19/d754853f15db126bee0dd8169deb9515.png', '根茎类', '2018-03-09 10:20:00');
INSERT INTO `smalltype` VALUES ('9', '2', 'https://imgjd4.fruitday.com/images/2017-02-22/705779849c2aabccf1d7e510fa8d5448.png', '奇异果', '2018-03-10 10:20:00');
INSERT INTO `smalltype` VALUES ('10', '2', 'https://imgjd6.fruitday.com/images/2017-02-22/6acde94832ff2960bd5edc976a55726a.png', '苹果', '2018-03-11 10:20:00');
INSERT INTO `smalltype` VALUES ('11', '2', 'https://imgjd7.fruitday.com/images/2017-02-22/407d7f1578d10ece68ead3a774d430fe.png', '橙柑橘柚', '2018-03-12 10:20:00');
INSERT INTO `smalltype` VALUES ('12', '2', 'https://imgqn8.fruitday.com/images/2017-02-22/2546d06bd900bb52af756cc8449d0d5a.png', '梨', '2018-03-13 10:20:00');
INSERT INTO `smalltype` VALUES ('13', '2', 'https://imgjd3.fruitday.com/images/2017-02-22/10767fb3becfc37100ea62d2ded5c9af.png', '葡萄/提子', '2018-03-14 10:20:00');
INSERT INTO `smalltype` VALUES ('14', '2', 'https://imgjd4.fruitday.com/images/2017-02-22/e2d0a1a8bef94a00b968b21539b01b95.png', '热带水果', '2018-03-15 10:20:00');
INSERT INTO `smalltype` VALUES ('15', '2', 'https://imgjd2.fruitday.com/images/2017-02-22/29b6970e8817746bfee8daab24f5cf96.png', '瓜类', '2018-03-16 10:20:00');
INSERT INTO `smalltype` VALUES ('16', '2', 'https://imgqn9.fruitday.com/images/2017-03-04/3fc525e4eb1f27622f2d59b75ea69bd7.jpg', '特色鲜果', '2018-03-17 10:20:00');
INSERT INTO `smalltype` VALUES ('17', '3', 'https://imgjd2.fruitday.com/images/2017-02-22/7ceee0b318aeef8c8a15143df51c7d62.png', '冷冻虾类', '2018-03-18 10:20:00');
INSERT INTO `smalltype` VALUES ('18', '3', 'https://imgjd1.fruitday.com/images/2017-02-22/b04f99297c25b5296fe4a49ba86dfc40.png', '冷冻鱼类', '2018-03-19 10:20:00');
INSERT INTO `smalltype` VALUES ('19', '3', 'https://imgjd4.fruitday.com/images/2017-02-22/8e3971e3ccc08b2d6a3ea708a000433b.png', '冷冻贝类', '2018-03-20 10:20:00');
INSERT INTO `smalltype` VALUES ('20', '3', 'https://imgjd3.fruitday.com/images/2017-02-22/7852415760e974623a5a631fd32f416a.png', '冷冻蟹类', '2018-03-21 10:20:00');
INSERT INTO `smalltype` VALUES ('21', '4', 'https://imgjd6.fruitday.com/images/2017-02-22/d9f4786bcd7d9d01a508ddeb10b52d60.png', '牛肉类', '2018-03-22 10:20:00');
INSERT INTO `smalltype` VALUES ('22', '4', 'https://imgjd5.fruitday.com/images/2017-02-22/73ff8b6768778a917bc37f47c5dc5870.png', '牛排', '2018-03-23 10:20:00');
INSERT INTO `smalltype` VALUES ('23', '4', 'https://imgjd1.fruitday.com/images/2017-02-22/126b978ea53657c523f10095e9aa7d29.png', '鸡鸭禽肉', '2018-03-24 10:20:00');
INSERT INTO `smalltype` VALUES ('24', '5', 'https://imgjd1.fruitday.com/images/2017-02-22/b4162b40b4f6530071b23c530d828487.png', '冷藏酸奶', '2018-03-25 10:20:00');
INSERT INTO `smalltype` VALUES ('25', '6', 'https://imgjd4.fruitday.com/images/2017-02-22/0d1da9fe2db88e865317e6aad0b24b24.png', '根茎类', '2018-03-26 10:20:00');
INSERT INTO `smalltype` VALUES ('26', '6', 'https://imgjd5.fruitday.com/images/2017-02-22/f008a334ae0364060b850a13ec24d38d.png', '茄果类', '2018-03-27 10:20:00');
INSERT INTO `smalltype` VALUES ('27', '6', 'https://imgjd6.fruitday.com/images/2017-06-22/dbe5cc56b3f8e9e823861f78fecaa2c4.png', '瓜类', '2018-03-28 10:20:00');
INSERT INTO `smalltype` VALUES ('28', '6', 'https://imgqn9.fruitday.com/images/2017-06-22/4fb3bd8e189be96820acfeae52b68d2e.png', '调味蔬菜', '2018-03-29 10:20:00');
INSERT INTO `smalltype` VALUES ('29', '6', 'https://imgjd2.fruitday.com/images/2017-09-15/292ecd334056f907b79e273809ef454d.png', '豆类', '2018-03-30 10:20:00');
INSERT INTO `smalltype` VALUES ('30', '6', 'https://imgqn8.fruitday.com/images/2017-02-22/113920fae6891218f8fc53cc2e558f78.png', '菌菇类', '2018-03-31 10:20:00');
INSERT INTO `smalltype` VALUES ('31', '6', 'https://imgjd2.fruitday.com/images/2017-02-22/454fe5b9b7847f06066f9f7e395a6cfe.png', '叶菜', '2018-04-01 10:20:00');
INSERT INTO `smalltype` VALUES ('32', '7', 'https://imgqn8.fruitday.com/images/2017-02-22/4bf8f83f4cce396a43d3623142276a76.png', '南北干货', '2018-04-02 10:20:00');
INSERT INTO `smalltype` VALUES ('33', '7', 'https://imgjd4.fruitday.com/images/2017-03-09/0577e2356d1dedbfef905e1fe97e53e6.jpg', '五谷杂粮', '2018-04-03 10:20:00');
INSERT INTO `smalltype` VALUES ('34', '8', 'https://imgjd1.fruitday.com/images/2018-01-13/432e10e11b347a61006e0fbf90623357.jpg', '零食', '2018-04-04 10:20:00');
INSERT INTO `smalltype` VALUES ('35', '9', 'https://imgqn9.fruitday.com/images/2018-02-24/8adcc153fff4a74710352faef26510fa.jpg', '冲调', '2018-04-05 10:20:00');
INSERT INTO `smalltype` VALUES ('36', '10', 'https://imgjd6.fruitday.com/images/2017-02-22/a3574ecf1be3335670b2f4adf2505e5f.png', '水果礼盒', '2018-04-06 10:20:00');
INSERT INTO `smalltype` VALUES ('37', '10', 'https://imgjd7.fruitday.com/images/2017-02-22/2a23b82eb05bb7983eb5fc6e2f212ad0.png', '生鲜礼盒', '2018-04-07 10:20:00');
INSERT INTO `smalltype` VALUES ('38', '10', 'https://imgqn8.fruitday.com/images/2017-02-22/0ae6677c9212a93b1b96b7a952106d00.png', '组合套餐', '2018-04-08 10:20:00');
INSERT INTO `smalltype` VALUES ('39', '10', 'https://imgjd6.fruitday.com/images/2017-03-02/04f0353ca9b26daba77fb1cc45067814.jpg', '充值券卡', '2018-04-09 10:20:00');
INSERT INTO `smalltype` VALUES ('40', '11', 'https://imgjd3.fruitday.com/images/2017-03-02/5045d8b2620f030fe1e734a515e26eae.png', '果园周边', '2018-04-10 10:20:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `birthday` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'LQX', 'lqx', '17665119545', '1576216769@qq.com', 'gilr', 'Evlyn', null, null, null, '2018-03-05 20:10:55');
INSERT INTO `user` VALUES ('2', 'nini', 'nini', '18888888888', '1576216769@qq.com', 'boy', 'ff', null, null, null, '2018-03-06 11:49:35');
INSERT INTO `user` VALUES ('3', null, '7119', '17888888888', null, null, null, null, null, null, '2018-03-06 20:50:45');
INSERT INTO `user` VALUES ('4', null, '2565', '17888888880', null, null, null, null, null, null, '2018-03-08 10:16:06');
INSERT INTO `user` VALUES ('5', null, '4770', '17200000000', null, null, null, null, null, null, '2018-03-08 11:53:22');
INSERT INTO `user` VALUES ('6', null, '8778', '18520017756', null, null, null, null, null, null, '2018-03-08 21:26:11');

-- ----------------------------
-- Table structure for useraddress
-- ----------------------------
DROP TABLE IF EXISTS `useraddress`;
CREATE TABLE `useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '收货人名字',
  `phone` varchar(255) NOT NULL COMMENT '收货人电话',
  `city` varchar(255) NOT NULL COMMENT '收货人省市区/县',
  `road` varchar(255) NOT NULL COMMENT '路小区楼号',
  `room` varchar(255) DEFAULT NULL COMMENT '门号',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useraddress
-- ----------------------------
INSERT INTO `useraddress` VALUES ('1', '张三', '18600001111', '湖北省武汉市汉阳区', '汉阳大道江汉小区E6楼', '6楼666号', '2018-03-08 18:53:13');
SET FOREIGN_KEY_CHECKS=1;
