# Host: 127.0.0.1  (Version: 5.5.28)
# Date: 2018-02-27 21:17:10
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "category"
#

CREATE TABLE `category` (
  `vCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `vCategoryTitle` varchar(255) DEFAULT NULL,
  `vBigCategoryId` int(11) DEFAULT NULL,
  `vBigCategoryTitle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "category"
#

INSERT INTO `category` VALUES (1,'粮油米面\t',1,'农副产品'),(2,'地域特色\t',1,'农副产品'),(3,'药食同源\t',1,'农副产品'),(4,'零副食品\t',1,'农副产品'),(5,'俄货专区\t',1,'农副产品'),(7,'清凉解暑\t',4,'水类'),(10,'花果茶\t',6,'茶类');

#
# Structure for table "goods"
#

CREATE TABLE `goods` (
  `vGoodsId` int(11) NOT NULL AUTO_INCREMENT,
  `vGoodsTitle` varchar(255) DEFAULT NULL,
  `vSpec` varchar(255) DEFAULT NULL,
  `vUnit` varchar(255) DEFAULT NULL,
  `vCategoryId` int(11) DEFAULT NULL,
  `vCategoryTitle` varchar(255) DEFAULT NULL,
  `vSupplierId` int(11) DEFAULT NULL,
  `vSupplierTitle` varchar(255) DEFAULT NULL,
  `mPriceS` int(11) DEFAULT NULL,
  `mPriceP` int(11) DEFAULT NULL,
  `mCost` int(11) DEFAULT NULL,
  `mLimit` int(11) DEFAULT NULL,
  `vState` varchar(255) DEFAULT NULL,
  `vProperty` varchar(255) DEFAULT NULL,
  `vMemo` varchar(255) DEFAULT NULL,
  `vImage` varchar(255) DEFAULT NULL,
  `vUrl` varchar(255) DEFAULT NULL,
  `mAmount` int(11) DEFAULT NULL,
  PRIMARY KEY (`vGoodsId`),
  KEY `vCategoryId` (`vCategoryId`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`vCategoryId`) REFERENCES `category` (`vCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

#
# Data for table "goods"
#

INSERT INTO `goods` VALUES (1,'源生河大米','2.5kg/袋','袋',1,'粮油米面',1,'源生河集团',52,45,40,1,'启用','新品','111','img/goods/YSHDM-001.jpg','html/YSHDM-001.html',0),(2,'王老宝黄小米\t\t\t','1kg/袋\t\t','袋\t\t',1,'粮油米面\t\t',3,'王老宝杂粮\t',18,15,12,1,'启用\t','新品\t','','\t\t\t\timg/goods/WLBXM-FM.jpg\t\t','html/WLBZL-XM.html\t\t\t',0),(3,'王老宝黄豆\t\t\t','1kg/袋\t\t','袋\t\t',1,'粮油米面\t\t',3,'王老宝杂粮\t',18,15,12,1,'启用\t','新品\t','','\t\t\t\timg/goods/WLBZLHD-001.jpg\t','html/WLBZL-HD-001.html\t\t',0),(4,'金海粮胚芽米\t\t\t','5kg/盒\t\t','盒\t\t',1,'粮油米面\t\t',6,'金海粮米业\t',90,75,65,1,'启用\t','新品\t','','\t\t\t\timg/goods/JHLDM-001.jpg\t\t','html/JHL-DM-001.html\t\t\t',0),(5,'玄武岩香米\t\t\t','5kg/盒\t\t','盒\t\t',1,'粮油米面\t\t',8,'渤海米业\t',165,135,110,1,'启用\t','新品\t','','\t\t\t\timg/goods/BHMY-XM-01.jpg\t','html/BHMY-XM-001.html\t\t',0),(6,'米兰山大米\t\t\t','4kg/袋\t\t','袋\t\t',1,'粮油米面\t\t',12,'米库农业\t',580,544,500,1,'启用\t','新品\t','','\t\t\t\timg/goods/MLS-DM-01.jpg\t\t','html/MLS-DM-001.html\t\t\t',0),(9,'蜂格椴树蜜\t\t\t','600g/瓶\t\t','瓶\t\t',3,'药食同源\t\t',4,'蜂格蜜业\t',60,48,40,1,'启用\t','新品\t','','\t\t\t\timg/goods/FGFM-002.jpg\t\t','html/FGMY-001.html\t\t\t',0),(10,'蜂格原生态椴树蜜\t\t','15g×20袋/盒\t\t','盒\t\t',3,'药食同源\t\t',4,'蜂格蜜业\t',36,30,23,1,'启用\t','新品\t','','\t\t\t\timg/goods/FGMY-02.jpg\t\t','html/FGMY-002.html\t\t\t',0),(11,'蜂格椴树原蜜\t\t\t','1kg/盒\t\t','盒\t\t',3,'药食同源\t\t',4,'蜂格蜜业\t',99,90,85,1,'启用\t','新品\t','','\t\t\t\timg/goods/FGMY-03.jpg\t\t','html/FGMY-003.html\t\t\t',0),(12,'刺五加木耳\t\t\t','500g/袋\t\t','袋\t\t',3,'药食同源\t\t',9,'黑土国誉\t',242,216,200,1,'启用\t','新品\t','','\t\t\t\timg/goods/HTGY-ME-01.jpg\t','html/HTGY-ME-001.html\t\t',0),(13,'独头黑蒜\t\t\t','300g/盒\t\t','盒\t\t',3,'药食同源\t\t',11,'唯信食品\t',46,40,35,1,'启用\t','新品\t','','\t\t\t\timg/goods/DTHS-01.jpg\t\t','html/DTHS-001.html\t\t\t',0),(14,'多瓣黑蒜\t\t\t','260g/盒\t\t','盒\t\t',3,'药食同源\t\t',11,'唯信食品\t',28,24,20,1,'启用\t','新品\t','','\t\t\t\timg/goods/DBHS-01.jpg\t\t','html/DBHS-001.html\t\t\t',0),(15,'枣夹核桃\t\t\t','500g/袋\t\t','袋\t\t',3,'药食同源\t\t',14,'农淘惠自营\t',56,47,40,1,'停用\t','新品\t','','\t\t\t\timg/goods/ZJHT-01.jpg\t\t','html/ZJHT-001.html\t\t\t',0),(16,'香冠黑糖—暖身老姜\t\t','268g/盒\t\t','盒\t\t',3,'药食同源\t\t',15,'香冠\t\t',15,10,8,1,'启用\t','新品\t','','\t\t\t\timg/goods/HT-01.jpg\t\t','html/HT-001.html\t\t\t',0),(17,'香冠黑糖—玫瑰\t\t','268g/盒\t\t','盒\t\t',3,'药食同源\t\t',15,'香冠\t\t',15,10,8,1,'启用\t','新品\t','','\t\t\t\timg/goods/HT-02.jpg\t\t','html/HT-002.htm\t\t\t',0),(18,'香冠黑糖—桂圆红枣\t\t','268g/盒\t\t','盒\t\t',3,'药食同源\t\t',15,'香冠\t\t',15,10,8,1,'启用\t','新品\t','','\t\t\t\timg/goods/HT-03.jpg\t\t','html/HT-003.html\t\t\t',0),(19,'黑芝麻小磨香油\t\t','250ml×4瓶/盒\t','盒\t\t',1,'粮油米面\t\t',10,'天志油脂\t',102,95,90,1,'启用\t','新品\t','','\t\t\t\timg/goods/XMXY-01.jpg\t\t','html/XMXY-001.html\t\t\t',0),(21,'福格农家酱\t\t\t','100g/袋\t\t','袋\t\t',1,'粮油米面\t\t',2,'福格酱菜\t',2,1,1,1,'启用\t','新品\t','','\t\t\t\timg/goods/FG-001.jpg\t\t','html/FG-001.html\t\t\t',0),(24,'佳宏煎饼\t\t\t','200g/袋\t\t','袋\t\t',4,'零副食品\t\t',5,'佳宏煎饼\t',10,8,6,1,'启用\t','新品\t','','\t\t\t\timg/goods/AJBJB-001.jpg\t\t','html/AJB-JB-001.html\t\t\t',0),(25,'北极森林蓝莓果干\t\t','80g/盒\t\t','盒\t\t',4,'零副食品\t\t',7,'山源山产品\t',20,15,12,1,'启用\t','新品\t','','\t\t\t\timg/goods/BJSL-LM.jpg\t\t','html/BJSL-LM-001.html\t\t',0),(26,'龙湖熏鱼\t\t\t','150g×6袋/盒\t\t','盒\t\t',2,'地域特色\t\t',10,'天志油脂\t',105,90,80,1,'启用\t','新品\t','','\t\t\t\timg/goods/TZ-LHXY-01.jpg\t','html/TZ-LHXY-001.html\t\t',0),(27,'干豆角\t\t\t','200g×4袋/盒\t\t','盒\t\t',2,'地域特色\t\t',10,'天志油脂\t',83,75,65,1,'启用\t','新品\t','','\t\t\t\timg/goods/TZ-GDJ-01.jpg\t\t','html/TZ-GDJ-001.html\t\t\t',0),(28,'瓜子系列\t\t\t','500g/袋\t\t','袋\t\t',4,'零副食品\t\t',13,'东方太格\t',18,15,12,1,'启用\t','新品\t','','\t\t\t\timg/goods/GZ-01.jpg\t\t','html/GZ-001.html\t\t\t',0),(48,'香冠黑糖-原味\t\t\t','268g/盒\t\t','盒\t\t',3,'药食同源\t\t',15,'香冠\t\t',15,10,8,1,'停用\t','新品\t','',NULL,NULL,0),(52,'自然畅原汁椰汁水\t\t','15瓶/箱\t\t','瓶\t\t',7,'清凉解暑\t\t',5,'佳宏煎饼\t',3,3,2,1,'启用\t','新品\t','源自正宗海南椰汁水','\t\timg/goods/zrc.jpg\t\t','html/zrc.html\t\t\t',0),(53,'小黄金香酥脆煎饼\t\t','4盒/箱\t\t','盒\t\t',4,'零副食品\t\t',5,NULL,15,10,9,16,'启用\t','新品\t','纯天然绿色食品越嚼越香好味道','\timg/goods/xjh.jpg \t\t','html/XJHJB.html\t\t\t',0),(54,'笨谷弱碱水\t\t\t','20瓶/箱\t\t','瓶\t\t',7,'清凉解暑\t\t',14,'农淘惠自营\t',2,2,2,200,'启用\t','新品\t','饮用弱碱水','\t\t\timg/goods/0062.jpg\t\t','html/bgrjs-001.html\t\t\t',0),(55,'柠檬香甜\t\t\t','175g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,7,6,2,'启用\t','新品\t','','\t\t\t\timg/goods/Nmxt-0011.jpg \t','html/Nmxt-0011.html\t\t\t',0),(56,'柠檬草\t\t\t','175g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',8,5,4,2,'启用\t','新品\t','','\t\t\t\timg/goods/Nmc-007.jpg \t\t','html/Nmc-007.html\t\t\t',0),(57,'茉莉花茶\t\t\t','30g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',12,9,7,2,'启用\t','新品\t','','\t\t\t\timg/goods/Mlhc-006.jpg \t\t','html/Mnhc-006.html\t\t\t',0),(58,'昆仑雪菊\t\t\t','30g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',12,9,7,2,'启用\t','新品\t','','\t\t\t\timg/goods/Ldxj-002.jpg \t\t','html/Ldxj-002.html\t\t\t',0),(59,'山楂片\t\t\t','90g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,7,6,2,'启用\t','新品\t','','\t\t\t\timg/goods/Szp-008.jpg\t\t','html/Szp-008.html\t\t\t',0),(60,'绿萝花\t\t\t','50g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,7,6,2,'启用\t','新品\t','','\t\t\t\timg/goods/Llh-003.jpg \t\t','html/Llh-003.html\t\t\t',0),(61,'欧陆风情\t\t\t','175g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,7,6,2,'启用\t','新品\t','','\t\t\t\timg/goods/OLFQ-0015.jpg \t','html/OLFQ-0015.html\t\t\t',0),(62,'窈窕淑女\t\t\t','175g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,7,6,2,'启用\t','新品\t','','\t\t\t\timg/goods/Ytsn-0013.jpg \t','html/Ytsn-0013.html\t\t\t',0),(63,'苹漫甜香\t\t\t','175g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,7,6,2,'启用\t','新品\t','','\t\t\t\timg/goods/Pmtx-0014.jpg \t','html/Pmtx-0014.html\t\t\t',0),(64,'红枣片\t\t\t','90g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,7,6,2,'启用\t','新品\t','','\t\t\t\timg/goods/hzp-001.jpg \t\t','html/hzp-001.html\t\t\t',0),(65,'蓝色物语\t\t\t','175g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,7,6,2,'启用\t','新品\t','','\t\t\t\timg/goods/Lswy-0016.jpg \t','html/Lswy-0016.html\t\t\t',0),(66,'彩虹甜心\t\t\t','175g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,7,6,2,'启用\t','新品\t','','\t\t\t\timg/goods/Chtx-0012.jpg\t\t','html/Chtx-0012.html\t\t\t',0),(67,'倾国梦幻\t\t\t','175g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,7,6,2,'启用\t','新品\t','','\t\t\t\timg/goods/Qgmh-0010.jpg \t','html/Qgmh-0010.html\t\t\t',0),(68,'清秀佳人\t\t\t','175g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,7,6,2,'启用\t','新品\t','','\t\t\t\timg/goods/Qxjr-009.jpg\t\t','html/Qxjr-009.html\t\t\t',0),(69,'玫瑰花茶\t\t\t','45g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,7,6,2,'启用\t','新品\t','','\t\t\t\timg/goods/Mghc-005.jpg\t\t','html/Mghc-005.html\t\t\t',0),(70,'洛神花\t\t\t','45g/瓶\t\t','瓶\t\t',10,'花果茶\t\t',14,'农淘惠自营\t',10,6,5,2,'启用\t','新品\t','','\t\t\t\timg/goods/Lsh-004.jpg\t\t','html/lsh-004.html\t\t\t',0),(74,'西芙烤海鸭咸蛋\t\t','60g/个\t\t','个\t\t',4,'零副食品\t\t',14,'农淘惠自营\t',2,2,1,100,'启用\t','新品\t','','\t\t\t\timg/goods/Khyxyd-001.jpg\t','html/khyxd-001.html\t\t\t',0),(75,'俄罗斯艾力水果麦片\t\t','400g/袋\t\t','袋\t\t',5,'俄货专区\t\t',14,'农淘惠自营\t',12,0,12,1,'停用\t','新品\t','','\t\t\t\timg/goods/ELSjksgmp-001.jpg\t','html/ELSjksgmp-001.html\t\t',0),(76,'俄罗斯进口雀巢巧克力玉米圈\t','210g/袋\t\t','袋\t\t',5,'俄货专区\t\t',14,'农淘惠自营\t',14,14,14,1,'停用\t','新品\t','','\t\t\t\timg/goods/ELSQcqklymq-003.jpg\t','html/ELSQcqklymq-003.html\t\t',0),(77,'俄罗斯进口雀巢蜂蜜麦球\t','230g/袋\t\t','袋\t\t',5,'俄货专区\t\t',14,'农淘惠自营\t',14,14,14,1,'停用\t','新品\t','','\t\t\t\timg/goods/ELSqcfmq-002.jpg\t','html/ELSqcfmq-002.jpg\t\t',0),(78,'俄罗斯进口雀巢玉米麦片\t','320g/袋\t\t','袋\t\t',5,'俄货专区\t\t',14,'农淘惠自营\t',14,14,14,1,'停用\t','新品\t','','\t\t\t\timg/goods/ELSqcfmyup-004.jpg\t','html/ELSqcfmyup-004.html\t\t',0),(79,'三只小熊绿桶\t\t\t','6瓶/箱\t\t','桶\t\t',5,'俄货专区\t\t',14,'农淘惠自营\t',18,12,11,12,'启用\t','新品\t','','\t\t\t\timg/goods/elsszxxmpj-002.jpg\t','html/elsszxxmpj-002.html\t\t',0),(80,'源升河大米酒米香型白酒32度\t','450ml*12瓶\t\t','瓶\t\t',2,'地域特色\t\t',1,'源生河集团\t',18,8,6,12,'启用\t','新品\t','','\t\t\t\timg/goods/YSHBJ-001.jpg\t\t','html/YSHBJ-001.html\t\t\t',0),(81,'久鑫稻花香\t\t\t','5kg/袋\t\t','袋\t\t',1,'粮油米面\t\t',14,'农淘惠自营\t',70,56,38,4,'启用\t','新品\t','','\t\t\t\timg/goods/Jxdhxm-001.jpg\t','html/Jxdhxm-001.html\t\t\t',0),(82,'俄罗斯进口雀巢蜂蜜片\t\t','300g/袋\t\t','袋\t\t',5,'俄货专区\t\t',14,'农淘惠自营\t',14,14,14,1,'停用\t','新品\t','',NULL,NULL,0),(83,'野生蓝莓干\t\t\t','24个/袋\t\t','袋\t\t',4,'零副食品\t\t',14,'农淘惠自营\t',24,0,1,1,'停用\t','新品\t','','\t\t\t\timg/goods/Yslmgg-003.jpg\t','html/yslmgg003.html\t\t\t',0),(85,'俄罗斯进口炼乳香酥蛋卷\t','24袋/箱\t\t','袋\t\t',4,'零副食品\t\t',14,'农淘惠自营\t',5,0,3,1,'停用\t','新品\t','',NULL,NULL,0),(86,'源升河生态清香米1kg\t\t','1kg/袋\t\t','袋\t\t',1,'粮油米面\t\t',1,'源生河集团\t',18,10,1,10,'停用\t','新品\t','',NULL,NULL,0),(87,'源升河生态清香米2.5kg\t\t','2.5kg/袋\t\t','袋\t\t',1,'粮油米面\t\t',1,'源生河集团\t',25,0,1,1,'停用\t','新品\t','',NULL,NULL,0),(88,'瓜子\t\t\t\t','100g/袋\t\t','袋\t\t',4,'零副食品\t\t',14,'农淘惠自营\t',5,0,4,1,'停用\t','新品\t','',NULL,NULL,0),(89,'功夫肉干\t\t\t','12个/袋\t\t','袋\t\t',4,'零副食品\t\t',14,'农淘惠自营\t',18,0,16,1,'停用\t','新品\t','',NULL,NULL,0),(90,'马克发面粉\t\t\t','2kg/袋\t\t','袋\t\t',1,'粮油米面\t\t',14,'农淘惠自营\t',16,12,10,1,'停用\t','新品\t','',NULL,NULL,0),(91,'三角蓝莓\t\t\t','15个/袋\t\t','袋\t\t',4,'零副食品\t\t',NULL,NULL,12,0,1,1,'停用\t','新品\t','',NULL,NULL,0),(92,'俄罗斯汽奶碳酸饮料\t\t','500ml/瓶\t\t','瓶\t\t',7,'清凉解暑\t\t',NULL,NULL,8,0,1,1,'停用\t','新品\t','',NULL,NULL,0),(93,'土豆泥\t\t\t','40g/盒\t\t','盒\t\t',5,'俄货专区\t\t',NULL,NULL,0,0,1,1,'停用\t','新品\t','',NULL,NULL,0),(94,'水果燕麦茶\t\t\t','180g/瓶\t\t','瓶\t\t',4,'零副食品\t\t',NULL,NULL,0,0,1,1,'停用\t','新品\t','',NULL,NULL,0),(95,'猪肉罐头\t\t\t','325g/罐\t\t','罐\t\t',5,'俄货专区\t\t',NULL,NULL,14,0,10,1,'停用\t','新品\t','',NULL,NULL,0),(96,'牛肉罐头\t\t\t','338g/罐\t\t','罐\t\t',5,'俄货专区\t\t',NULL,NULL,17,0,13,1,'停用\t','新品\t','',NULL,NULL,0),(97,'培根罐头\t\t\t','325g/罐\t\t','罐\t\t',5,'俄货专区\t\t',NULL,NULL,19,0,1,1,'停用\t','新品\t','','\t\t\t\ting/goods/\t\t\t','html/\t\t\t\t',0),(98,'黑蜂椴树蜜750g\t\t','750g/瓶\t\t','瓶\t\t',3,'药食同源\t\t',NULL,NULL,0,0,1,1,'停用\t','新品\t','',NULL,NULL,0),(100,'蜂格原生态椴树白蜜\t\t','1kg/瓶\t\t','瓶\t\t',3,'药食同源\t\t',4,'蜂格蜜业\t',0,0,1,1,'停用\t','新品\t','',NULL,NULL,0),(101,'椴树原蜜1550g\t\t\t','1550g/盒\t\t','盒\t\t',3,'药食同源\t\t',NULL,NULL,0,0,96,1,'停用\t','新品\t','',NULL,NULL,0),(103,'椴树原蜜500g\t\t\t','500g/瓶\t\t','瓶\t\t',3,'药食同源\t\t',NULL,NULL,0,0,1,1,'停用\t','新品\t','',NULL,NULL,0),(104,'椴树原蜜250g\t\t\t','250g/瓶\t\t','瓶\t\t',3,'药食同源\t\t',NULL,NULL,0,0,14,1,'停用\t','新品\t','',NULL,NULL,0),(105,'蜂格金冠\t\t\t','500g/瓶\t\t','瓶\t\t',3,'药食同源\t\t',NULL,NULL,0,0,1,1,'停用\t','新品\t','',NULL,NULL,0),(106,'山花蜜\t\t\t',NULL,NULL,3,'药食同源\t\t',NULL,NULL,0,0,25,1,'停用\t','新品\t','',NULL,NULL,0),(107,'黄柏蜜\t\t\t','500g/瓶\t\t','瓶\t\t',3,'药食同源\t\t',NULL,NULL,0,0,33,1,'停用\t','新品\t','',NULL,NULL,0),(108,'桦南大煎饼\t\t\t','100g/袋\t\t','袋\t\t',4,'零副食品\t\t',NULL,NULL,0,0,1,1,'停用\t','新品\t','','\t\t\t\timg/goods/\t\t\t','html/\t\t\t\t',0),(109,'葵花籽油\t\t\t','1kg/桶\t\t','桶\t\t',1,'粮油米面\t\t',NULL,NULL,18,0,1,1,'停用\t','新品\t','',NULL,NULL,0),(110,'和田大枣\t\t\t','300g/袋\t\t','袋\t\t',4,'零副食品\t\t',NULL,NULL,20,10,10,10,'启用\t','新品\t','','\t\t\t\timg/goods/xjhtdz-003.jpg\t','html/xjhtdz-003.html\t\t\t',0),(112,'大头巧克力\t\t\t',NULL,NULL,5,'俄货专区\t\t',NULL,NULL,0,0,1,1,'停用\t','新品\t','',NULL,NULL,0),(113,'酸奶威化\t\t\t','400g/袋\t\t','袋\t\t',5,'俄货专区\t\t',NULL,NULL,7,6,1,50,'启用\t','新品\t','','\t\t\t\timg/goods/elsjksnwht-001.jpg\t','html/elsjksnwht-001.html\t\t',0),(114,'俄罗斯进口喜爱100%纯果汁\t','950ml/盒\t\t','盒\t\t',5,'俄货专区\t\t',NULL,NULL,10,0,1,1,'停用\t','新品\t','',NULL,NULL,0),(115,'三只小熊瓶\t\t\t','500g/瓶\t\t','瓶\t\t',5,'俄货专区\t\t',NULL,NULL,6,0,4,1,'停用\t','新品\t','',NULL,NULL,0),(116,'三只小熊厅\t\t\t','500g/瓶\t\t','瓶\t\t',5,'俄货专区\t\t',NULL,NULL,6,0,4,1,'停用\t','新品\t','','\t\t\t\timg/goods/\t\t\t','html/\t\t\t\t',0),(117,'波罗的海\t\t\t','2300ml/桶\t\t','桶\t\t',5,'俄货专区\t\t',NULL,NULL,20,14,1,1,'停用\t','新品\t','','\t\t\t\timg/goods/\t\t\t','html/\t\t\t\t',0),(118,'俄罗斯3、5、7、号\t\t','500ml/瓶\t\t','厅\t\t',5,'俄货专区\t\t',NULL,NULL,0,0,1,1,'停用\t','新品\t','','\t\t\t\timg/goods/\t\t\t','html/\t\t\t\t',0),(119,'枣夹核桃大袋\t\t\t','800g/袋\t\t','袋\t\t',3,'药食同源\t\t',NULL,NULL,24,0,1,1,'停用\t','新品\t','','\t\t\t\timg/goods/xdzjht-002.jpg\t','html/xdzjht-002.html\t\t\t',0),(120,'枣夹核桃小袋\t\t\t','400g/袋\t\t','袋\t\t',3,'药食同源\t\t',NULL,NULL,12,9,9,10,'启用\t','新品\t','','\t\t\t\timg/goods/xdzjht-002.jpg\t','html/xdzjht-002.html\t\t\t',0),(121,'清補凉\t\t\t','360g/瓶\t\t','罐\t\t',7,'清凉解暑\t\t',NULL,NULL,8,0,6,1,'停用\t','新品\t','','\t\t\t\timg/goods/\t\t\t','html/\t\t\t\t',0),(122,'源升河大米酒\t\t\t','4000ml/桶\t\t','桶\t\t',2,'地域特色\t\t',1,'源生河集团\t',28,23,17,4,'停用\t','新品\t','','\t\t\t\timg/goods/\t\t\t','html/\t\t\t\t',0),(123,'源升河大米酒35°\t\t','450ml/瓶\t\t','瓶\t\t',2,'地域特色\t\t',1,'源生河集团\t',8,5,4,12,'启用\t','新品\t','','\t\t\t\timg/goods/yshdmjmxx-001.jpg\t','html/yshdmjmxx-001.html\t\t',0),(124,'源升河大米酒如意稻\t\t','450ml/瓶\t\t','瓶\t\t',2,'地域特色\t\t',1,'源生河集团\t',8,7,5,12,'启用\t','新品\t','','\t\t\t\timg/goods/yshdmj-0010.jpg\t','html/yshdmj-0010.html\t\t',0),(125,'源升河大米酒如意稻\t\t','250ml/瓶\t\t','瓶\t\t',2,'地域特色\t\t',1,'源生河集团\t',5,4,3,20,'启用\t','新品\t','','\t\t\t\timg/goods/yshdamjmxx-001.jpg\t','html/yshdamjmxx-001.html\t\t',0),(126,'源升河大米酒精制稻\t\t','200ml/瓶\t\t','瓶\t\t',2,'地域特色\t\t',1,'源生河集团\t',5,3,2,20,'启用\t','新品\t','','\t\t\t\timg/goods/yshdamij-002.jpg\t','html/yshdamij-002.html\t\t',0),(127,'源升河大米酒世纪稻\t\t','125ml/瓶\t\t','瓶\t\t',2,'地域特色\t\t',1,'源生河集团\t',4,3,2,24,'启用\t','新品\t','','\t\t\t\timg/goods/yshbj-003.jpg\t\t','html/yshbj-003.html\t\t\t',0),(128,'源升河原浆-5年\t\t','450ml/瓶\t\t','盒\t\t',2,'地域特色\t\t',1,'源生河集团\t',28,20,15,6,'启用\t','新品\t','','\t\t\t\timg/goods/yshdmj-0015.jpg\t','html/yshdmj-0015.html\t\t',0),(129,'源升河原浆-15年\t\t','500ml/瓶\t\t','盒\t\t',2,'地域特色\t\t',1,'源生河集团\t',50,45,33,6,'启用\t','新品\t','','\t\t\t\timg/goods/yshdmj-006.jpg\t','html/yshdmj-006.html\t\t\t',0),(130,'源升河原浆-20年\t\t','500ml/瓶\t\t','盒\t\t',2,'地域特色\t\t',1,'源生河集团\t',80,76,56,6,'启用\t','新品\t','','\t\t\t\timg/goods/yshdmj-007.jpg\t','html/yshdmj-007.html\t\t\t',0),(131,'祥盛庆安大高粱纸袋装\t\t','450ml/瓶\t\t','瓶\t\t',2,'地域特色\t\t',1,'源生河集团\t',0,0,1,1,'停用\t','新品\t','','\t\t\t\timg/goods/\t\t\t','html/\t\t\t\t',0),(133,'祥盛百年庆安米香型\t\t','450ml/瓶\t\t','瓶\t\t',2,'地域特色\t\t',1,'源生河集团\t',0,0,1,1,'停用\t','新品\t','','\t\t\t\timg/goods/\t\t\t','html/\t\t\t\t',0),(134,'祥盛百年庆安十年珍品\t\t','500ml/瓶\t\t','瓶\t\t',2,'地域特色\t\t',1,'源生河集团\t',0,0,1,1,'停用\t','新品\t','','\t\t\t\timg/goods/\t\t\t','html/\t\t\t\t',0),(135,'祥盛庆安大高粱十年陈酿\t','500ml/瓶\t\t','瓶\t\t',2,'地域特色\t\t',1,'源生河集团\t',0,0,1,1,'停用\t','新品\t','','\t\t\t\timg/goods/\t\t\t','html/\t\t\t\t',0),(136,'祥盛庆安大高粱米香型\t\t','500ml/瓶\t\t','瓶\t\t',2,'地域特色\t\t',1,'源生河集团\t',0,0,1,1,'停用\t','新品\t','','\t\t\t\timg/goods/\t\t\t','html/\t\t\t\t',0),(137,'得田独稻五常-稻花香红色包装\t','2.5kg/袋\t\t','袋\t\t',1,'粮油米面\t\t',NULL,NULL,35,28,28,10,'启用\t','新品\t','','\t\t\t\timg/goods/dtdddhxm-002.jpg\t','html/dtdddhxm-002.html\t\t',0),(138,'淼谷稻花香\t\t\t','2.5kg/袋\t\t','袋\t\t',1,'粮油米面\t\t',NULL,NULL,45,35,35,10,'启用\t','新品\t','','\t\t\t\timg/goods/mgdhx-004.jpg\t\t','html/mgdhx-004.html\t\t\t',0),(139,'得田獨稻五常-稻花香米蓝色包装\t','2.5kg/袋\t\t','袋\t\t',1,'粮油米面\t\t',NULL,NULL,35,28,28,10,'启用\t','新品\t','','\t\t\t\timg/goods/dtdddhxm-001.jpg\t','html/dtdddhxm-001.html\t\t',0),(140,'得田獨稻五常-稻花香米\t\t','5kg/袋\t\t','袋\t\t',1,'粮油米面\t\t',NULL,NULL,1,1,1,1,'停用\t','新品\t','','\t\t\t\timg/goods/dtdddhxm-003.jpg\t','html/dtdddhxm-003.html\t\t',0),(141,'祥盛百年庆安五年精品\t\t','500ml/瓶\t\t','瓶\t\t',2,'地域特色\t\t',1,NULL,0,0,1,1,'停用\t','新品\t','','\t\t\t\timg/goods/\t\t\t','html/\t\t\t\t',0),(142,'俄罗斯进口大奶牛全脂奶粉\t','850g/袋\t\t','袋\t\t',5,'俄货专区\t\t',NULL,NULL,25,23,19,10,'启用\t','新品\t','','\t\t\t\timg/goods/Dnnnf-001.jpg\t\t','html/Dnnnf-001.html\t\t\t',0),(143,'俄罗斯进口NEWMLKYU植物奶粉\t','1000g/袋\t\t','袋\t\t',5,'俄货专区\t\t',2,NULL,5,23,19,10,'启用\t','新品\t',NULL,'\t\t\t\timg/goods/Zwnf-002.jpg\t\t','html/Zwnf-002.html\t\t\t',0);

#
# Structure for table "sf_pc_cart"
#

CREATE TABLE `sf_pc_cart` (
  `vCid` varchar(255) NOT NULL DEFAULT '',
  `vGoodsId` int(11) DEFAULT NULL,
  `mAmount` int(11) DEFAULT NULL,
  `mSumMoney` int(11) DEFAULT NULL,
  `vUserId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vCid`),
  KEY `vGoodsId` (`vGoodsId`),
  CONSTRAINT `sf_pc_cart_ibfk_1` FOREIGN KEY (`vGoodsId`) REFERENCES `goods` (`vGoodsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sf_pc_cart"
#

INSERT INTO `sf_pc_cart` VALUES ('5d4efe915756141b0157561bf42b0002\t',1,1,45,'qwertyui'),('5d4efe915756141b0157561bffce0003\t',2,1,15,'qwertyui');

#
# Structure for table "sf_pc_order"
#

CREATE TABLE `sf_pc_order` (
  `vOrderId` varchar(255) NOT NULL DEFAULT '',
  `dDate` datetime DEFAULT NULL,
  `vCorpId` int(11) DEFAULT NULL,
  `vCorpTitle` varchar(255) DEFAULT NULL,
  `mSumMoney` int(11) DEFAULT NULL,
  `mPreDec` int(11) DEFAULT NULL,
  `mSumNet` int(11) DEFAULT NULL,
  `dPayTime` int(11) DEFAULT NULL,
  `vState` varchar(255) DEFAULT NULL,
  `vUserId` varchar(255) DEFAULT NULL,
  `vType` varchar(255) DEFAULT NULL,
  `vName` varchar(255) DEFAULT NULL,
  `vTel` varchar(255) DEFAULT NULL,
  `vAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vOrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sf_pc_order"
#

INSERT INTO `sf_pc_order` VALUES ('PF20160922042503177\t','2016-09-22 16:25:00',1,'总部\t\t\t',60,0,2,0,'未支付','asdfghjk','网上支付','sdasdsad\t','13322213872','fdsfdsfdsfsdf'),('PF20160922042506512\t','2016-09-22 16:25:00',1,'总部\t\t\t',0,0,0,0,'未支付','asdfghjk\t','网上支付\t','sdasdsad\t','13322213872\t','fdsfdsfdsfsdf'),('PF20160922044440764\t','2016-09-22 16:44:00',1,'总部\t\t\t',75,0,3,0,'未支付','asdfghjk\t','网上支付\t','sdasdsad\t','13322213872\t','fdsfdsfdsfsdf'),('PF20160922045129251\t','2016-09-22 16:51:00',1,'总部\t\t\t',120,0,4,0,'未支付','asdfghjk\t','网上支付\t','sdasdsad\t','13322213872\t','fdsfdsfdsfsdf'),('PF20160922045515787\t','2016-09-22 16:55:00',1,'总部\t\t\t',0,0,0,0,'未支付','asdfghjk\t','网上支付\t','sdasdsad\t','13322213872\t','fdsfdsfdsfsdf'),('PF20160922102614303\t','2016-09-22 10:26:00',1,'总部\t\t\t',45,0,1,0,'待发货','asdfghjk\t','网上支付\t','sdasdsad\t','13322213872\t','fdsfdsfdsfsdf'),('PF20160923035451118\t','2016-09-23 15:54:00',1,'总部\t\t\t',45,0,1,0,'未支付','asdfghjk\t','网上支付\t','sdasdsad\t','13322213872\t','fdsfdsfdsfsdf'),('PF20160923040656909\t','2016-09-23 16:06:00',1,'总部\t\t\t',45,0,1,0,'未支付',NULL,'网上支付\t','sdasdsad\t','13322213872\t','fdsfdsfdsfsdf'),('PF20160924090141293\t','2016-09-24 09:01:00',1,'总部\t\t\t',15,0,1,0,'未支付','asdfghjk\t','网上支付\t','sdasdsad\t','13322213872\t','fdsfdsfdsfsdf'),('PF20160924092536918\t','2016-09-24 09:25:00',1,'总部\t\t\t',725,0,5,0,'未支付','asdfghjk\t','网上支付\t','sdasdsad\t','13322213872\t','fdsfdsfdsfsdf'),('PF20160924103023756\t','2016-09-24 10:30:00',1,'总部\t\t\t',45,0,1,0,'未支付',NULL,'网上支付\t','sdasdsad\t','13322213872\t','fdsfdsfdsfsdf');

#
# Structure for table "sf_pc_order_item"
#

CREATE TABLE `sf_pc_order_item` (
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `vOrderId` varchar(255) DEFAULT NULL,
  `dDate` datetime DEFAULT NULL,
  `vGoodsId` int(11) DEFAULT NULL,
  `vGoodsTitle` varchar(255) DEFAULT NULL,
  `vSpec` varchar(255) DEFAULT NULL,
  `vUnit` varchar(255) DEFAULT NULL,
  `mPrice` int(11) DEFAULT NULL,
  `mAmount` int(11) DEFAULT NULL,
  `mMoney` int(11) DEFAULT NULL,
  `vImage` varchar(255) DEFAULT NULL,
  `vSupplierId` int(11) DEFAULT NULL,
  `vSupplierTitle` varchar(255) DEFAULT NULL,
  `vUserId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sf_pc_order_item"
#

INSERT INTO `sf_pc_order_item` VALUES ('40283681574fa9b801574fb743660004\t','PF20160922102614303\t','2016-09-22 10:26:00',1,'源生河大米\t','2.5kg/袋\t','袋\t',45,1,45,'img/goods/YSHDM-001.jpg\t',1,'源生河集团\t\t','asdfghjk'),('402836815750db4f015750ffbb970003\t','PF20160922042503177\t','2016-09-22 16:25:00',2,'王老宝黄小米\t','1kg/袋\t','袋\t',15,1,15,'img/goods/WLBXM-FM.jpg\t',3,'王老宝杂粮\t\t','asdfghjk'),('402836815750db4f015750ffd6940004\t','PF20160922042506512\t','2016-09-22 16:25:00',2,'王老宝黄小米\t','1kg/袋\t','袋\t',15,1,15,'img/goods/WLBXM-FM.jpg\t',3,'王老宝杂粮\t\t','asdfghjk'),('402836815750db4f0157510005500005\t','PF20160922042503177\t','2016-09-22 16:25:00',1,'源生河大米\t','2.5kg/袋\t','袋\t',45,1,45,'img/goods/YSHDM-001.jpg\t',1,'源生河集团\t\t','asdfghjk'),('4028368157510e6b01575111c01e0004\t','PF20160922044440764\t','2016-09-22 16:45:00',1,'源生河大米\t','2.5kg/袋\t','袋\t',45,1,45,'img/goods/YSHDM-001.jpg\t',1,'源生河集团\t\t','asdfghjk'),('4028368157510e6b01575112324f0005\t','PF20160922044440764\t','2016-09-22 16:45:00',2,'王老宝黄小米\t','1kg/袋\t','袋\t',15,1,15,'img/goods/WLBXM-FM.jpg\t',3,'王老宝杂粮\t\t','asdfghjk'),('4028368157510e6b01575112b3960006\t','PF20160922044440764\t','2016-09-22 16:46:00',3,'王老宝黄豆\t','1kg/袋\t','袋\t',15,1,15,'img/goods/WLBZLHD-001.jpg\t',3,'王老宝杂粮\t\t','asdfghjk'),('402836815751166301575117f9940001\t','PF20160922045129251\t','2016-09-22 16:51:00',1,'源生河大米\t','2.5kg/袋\t','袋\t',45,2,90,'img/goods/YSHDM-001.jpg\t',1,'源生河集团\t\t','asdfghjk'),('40283681575116630157511864a70002\t','PF20160922045129251\t','2016-09-22 16:52:00',2,'王老宝黄小米\t','1kg/袋\t','袋\t',15,1,15,'img/goods/WLBXM-FM.jpg\t',3,'王老宝杂粮\t\t','asdfghjk'),('402836815751166301575118d00d0003\t','PF20160922045129251\t','2016-09-22 16:52:00',3,'王老宝黄豆\t','1kg/袋\t','袋\t',15,1,15,'img/goods/WLBZLHD-001.jpg\t',3,'王老宝杂粮\t\t','asdfghjk'),('5d4efe915756089c0157560a34760002\t','PF20160923035451118\t','2016-09-23 15:54:00',1,'源生河大米\t','2.5kg/袋\t','袋\t',45,1,45,'img/goods/YSHDM-001.jpg\t',1,'源生河集团\t\t','asdfghjk'),('5d4efe915756141b0157561543250001\t','PF20160923040656909\t','2016-09-23 16:06:00',1,'源生河大米\t','2.5kg/袋\t',NULL,45,1,45,'img/goods/YSHDM-001.jpg\t',1,'源生河集团\t\t','asdfghjk'),('5d4efe91575646be015759b64bb60002\t','PF20160924090141293\t','2016-09-24 09:01:00',3,'王老宝黄豆\t','1kg/袋\t','袋\t',15,1,15,'img/goods/WLBZLHD-001.jpg\t',3,'王老宝杂粮\t\t','asdfghjk'),('5d4efe91575646be015759cc31ca0008\t','PF20160924092536918\t','2016-09-24 09:25:00',12,'刺五加木耳\t','500g/袋\t','袋\t',216,1,216,'img/goods/HTGY-ME-01.jpg\t',9,'黑土国誉\t\t','asdfghjk'),('5d4efe91575646be015759cc31f90009\t','PF20160924092536918\t','2016-09-24 09:25:00',23,'刺五加木耳\t','500g/袋\t','袋\t',216,1,216,'img/goods/HTGY-ME-01.jpg\t',9,'黑土国誉\t\t','asdfghjk'),('5d4efe91575646be015759cc3228000a\t','PF20160924092536918\t','2016-09-24 09:25:00',51,'玄武岩香米\t','5kg/盒\t','盒\t',135,1,135,'img/goods/BHMY-XM-01.jpg\t',8,'渤海米业\t\t','asdfghjk'),('5d4efe91575646be015759cc3256000b\t','PF20160924092536918\t','2016-09-24 09:25:00',5,'玄武岩香米\t','5kg/盒\t','盒\t',135,1,135,'img/goods/BHMY-XM-01.jpg\t',8,'渤海米业\t\t','asdfghjk'),('5d4efe915759f80201575a0781fe0001\t','PF20160924103023756\t','2016-09-24 10:30:00',1,'源生河大米\t','2.5kg/袋\t','\t',45,1,45,'img/goods/YSHDM-001.jpg\t',1,'源生河集团\t\t','asdfghjk'),('5d4efe91575646be015759cc3285000c\t','PF20160924092536918\t','2016-09-24 09:25:00',143,'俄罗斯进口NEWMLKYU植物奶粉\t','1000g/袋\t','袋\t',23,1,23,'img/goods/Zwnf-002.jpg\t',NULL,NULL,'asdfghjk'),('5d4efe91575646be015759cc3285000c\t','PF20160924092536918\t','2016-09-24 09:25:00',143,'俄罗斯进口NEWMLKYU植物奶粉\t','1000g/袋\t','袋\t',23,1,23,'img/goods/Zwnf-002.jpg\t',NULL,NULL,'asdfghjk');

#
# Structure for table "sf_user"
#

CREATE TABLE `sf_user` (
  `vUserId` varchar(255) NOT NULL DEFAULT '',
  `vNickName` varchar(255) DEFAULT NULL,
  `vUserName` varchar(255) DEFAULT NULL,
  `vPassword` varchar(255) DEFAULT NULL,
  `vTel` varchar(255) DEFAULT NULL,
  `vAddress` varchar(255) DEFAULT NULL,
  `vCorpId` int(11) DEFAULT NULL,
  `vCompany` varchar(255) DEFAULT NULL,
  `vIdCard` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sf_user"
#

INSERT INTO `sf_user` VALUES ('123','6391751\t','123\t\t','123','13836350329','1223\t',NULL,NULL,NULL),('asdfghjk\t','dasdasdasd\t','sdasdsad\t','asdfghjk\t','13322213872','fdsfdsfdsfsdf\t',1,NULL,NULL),('bts','BTS','','123456','','',0,'',''),('qwertyui\t','李小龙\t','李小龙\t','qwertyui\t','13322213872\t','十方科技有限公司\t',NULL,'十方科技有限公司',NULL);
