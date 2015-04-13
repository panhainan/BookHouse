/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : bookhouse

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-01-28 18:03:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addr_user_name` varchar(30) DEFAULT NULL,
  `addr_name` varchar(50) DEFAULT NULL,
  `addr_phone` varchar(20) DEFAULT NULL,
  `addr_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`addr_id`),
  KEY `addr_user_id` (`addr_user_id`),
  CONSTRAINT `addr_user_id` FOREIGN KEY (`addr_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('5', '潘海南', '广东广州', '13319552222', '1');
INSERT INTO `address` VALUES ('6', '葛恩利', '湖南长沙', '15574897427', '1');
INSERT INTO `address` VALUES ('7', 'geenli', 'sdfsfds', '13319552222', '1');
INSERT INTO `address` VALUES ('8', '唐友宝', '湖南张家界', '1452234234', '2');
INSERT INTO `address` VALUES ('9', '潘海南', '海南', '13319552222', '1');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admi_id` int(10) NOT NULL AUTO_INCREMENT,
  `admi_login_name` varchar(30) DEFAULT NULL,
  `admi_login_password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`admi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(100) DEFAULT NULL,
  `book_author` varchar(50) DEFAULT NULL,
  `book_isbn` varchar(30) DEFAULT NULL,
  `book_publish_company` varchar(30) DEFAULT NULL,
  `book_publish_datetime` varchar(16) DEFAULT NULL,
  `book_author_introduce` varchar(2000) DEFAULT NULL,
  `book_catalogue` varchar(2000) DEFAULT NULL,
  `book_picture` varchar(50) DEFAULT NULL,
  `book_parameter` varchar(1000) DEFAULT NULL,
  `book_content_introduce` varchar(2000) DEFAULT NULL,
  `book_price` double(5,2) DEFAULT NULL,
  `book_hous_id` bigint(20) DEFAULT NULL,
  `book_type` varchar(400) DEFAULT NULL,
  `book_sum` int(5) DEFAULT NULL,
  `book_status` int(1) DEFAULT NULL,
  `book_sale_sum` int(5) DEFAULT NULL,
  `book_score` double(2,1) DEFAULT NULL,
  `book_sale_comment_sum` int(5) DEFAULT '0',
  PRIMARY KEY (`book_id`),
  KEY `book_hous_id` (`book_hous_id`),
  CONSTRAINT `book_hous_id` FOREIGN KEY (`book_hous_id`) REFERENCES `house` (`hous_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('14', 'Java编程思想', 'tom', 'JavaBCSX0012', '清华大学出版社', '1994-11-19', '略', '1----java发展史\r\n2----java基础', '/bookIMG/2014111919/201411191912423818.jpg', null, '这是一本将java编程语言讲解的非常透彻的书', '70.00', '1', '<a href=\'/BookHouse/book/findBookByType.htm?booktype=计算机类\'>计算机类</a> / <a href=\"/BookHouse/book/findBookByType.htm?booktype=J2EE\">J2EE</a> / <a href=\"/BookHouse/book/findBookByType.htm?booktype=Java语言\"  target=\'_top\'>Java语言</a>', '100', '1', '8', '3.1', '7');
INSERT INTO `book` VALUES ('15', 'Jsp网站开发', '--', 'JSPWZKF201421', '清华大学出版社', '2011-11-19', '--', '1----Jsp发展历史\r\n2----Jsp的介绍\r\n----------', '/bookIMG/2014111919/20141119192112772.jpg', null, 'Jsp是和Asp对应的一种Java网站开发技术', '33.00', '1', '<a href=\'/BookHouse/book/findBookByType.htm?booktype=计算机类\'>计算机类</a> / <a href=\"/BookHouse/book/findBookByType.htm?booktype=J2EE\"  target=\'_top\'>J2EE</a>', '50', '1', '8', '4.1', '6');
INSERT INTO `book` VALUES ('16', 'Java', 'xxx', 'Java201sdf', 'xxxxxx', '2009-11-20', 'xxxxxx', 'xxxxxxxxxxx\r\nxxxxxxxxxxx\r\nxxxxxxxxxxx', '/bookIMG/2014112010/201411201017417559.jpg', null, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '50.00', '1', '<a href=\'/BookHouse/book/findBookByType.htm?booktype=计算机类\'>计算机类</a> / <a href=\"/BookHouse/book/findBookByType.htm?booktype=J2EE\">J2EE</a> / <a href=\"/BookHouse/book/findBookByType.htm?booktype=Java语言\"  target=\'_top\'>Java语言</a>', '100', '1', '0', null, '0');
INSERT INTO `book` VALUES ('17', 'Maven实战', 'xxx', 'MVNSZ231', 'xxxxxx', '2012-11-20', 'xxxxxxxxx', '1----------xxxxxxxxxx\r\n2----------xxxxxxxxxx\r\n......', '/bookIMG/2014112010/20141120104827822.jpg', null, 'xxxxx\r\n....xxxx\r\nxxxx', '50.00', '1', '<a href=\'/BookHouse/book/findBookByType.htm?booktype=计算机类\'>计算机类</a> / <a href=\"/BookHouse/book/findBookByType.htm?booktype=J2EE\"  target=\'_top\'>J2EE</a>', '100', '1', '0', null, '0');
INSERT INTO `book` VALUES ('20', 'mm', 'xxx', 'mm201sdf', 'xxxxxx', '2014-11-20', 'vvv', 'vvvvvv', '/bookIMG/2014112010/20141120104827822.jpg', null, 'vvvvvvvvvvvvvvv', '50.00', '1', '<a href=\'/BookHouse/book/findBookByType.htm?booktype=计算机类\'>计算机类</a> / <a href=\"/BookHouse/book/findBookByType.htm?booktype=网络安全\"  target=\'_top\'>网络安全</a>', '100', '0', '0', null, '0');
INSERT INTO `book` VALUES ('23', 'Java编程思想', 'xxx', 'JavaBCSX0012', 'xxxxxx', '2011-11-22', 'xxxxxxx', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\r\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '/bookIMG/2014112212/201411221251462139.jpg', null, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '70.00', '2', '<a href=\'/BookHouse/book/findBookByType.htm?booktype=计算机类\'>计算机类</a> / <a href=\"/BookHouse/book/findBookByType.htm?booktype=J2EE\">J2EE</a> / <a href=\"/BookHouse/book/findBookByType.htm?booktype=Java语言\"  target=\'_top\'>Java语言</a>', '198', '1', '2', '3.5', '2');
INSERT INTO `book` VALUES ('25', '思考中医', '刘力红', '9787563339198', '广西师范大学出版社', '2006-06-23', '刘力红，男，1958年生。医学博士，教授。就读于广西中医学院、成都中医学院、南京中医学院。于院内师从陈亦人、陈治恒教授修习伤寒之学；于院外随李阳波、王庆余、曾邕生等师修习易、道、医学。现供职于广西中医学院基础医学院。 ', '序\r\n第一章 略说中医的学习与研究\r\n　一、树立正确的认识\r\n　　1.理论认识的重要性\r\n　　2.杨振宁教授所认识的中国文化\r\n　　3.传统理论的构建\r\n　二、学问的传承\r\n　　1.现代中医教育的模式\r\n　　2.形而上与形而下\r\n　　3.师徒相授\r\n　三、寻找有效的方法——依靠经典\r\n　　1.历史的经验\r\n　　2.扫清认识经典的障碍\r\n　　3.三种文化\r\n　　4.学习经典的意义\r\n\r\n', '/bookIMG/9200210-1.jpg', null, '《思考中医》又名《伤寒论导论》，作者以其对中医经典的执著和热爱，致力于《伤寒杂病论》的研究解读和疑难病症研究。为了避免深奥晦涩，作者竭力将学术性与趣味性相结合，超越对《伤寒杂病论》的研究，是个案特点和学术规律结合研究的典范。该书名为“思考中医”，是取思考时空、思考生命、思考健康之意，所以它既是中医书，也是传统文化学术书，更是一本超越了时空与领域的人文社科书。\r\n　　四气调理人论篇第二－－春三月，此谓发陈，天地俱生，万物以荣，夜卧早起，广步于庭，被发缓形，以使志生，生而勿杀，予而勿夺，赏而勿罚，此春气之应，养生之道也……故阴阳四时者，万物之终始也，死生之本也，逆之则灾害生，从这则苛疾不起，是谓得道。道者，圣人行之，愚者佩之。从阴阳则生，逆之则死，从之则治，逆之则乱，反顺为逆，是谓内格。是故圣人不治已病，治未病，不治已乱，治未乱，此之谓也。夫病已成而后药之，乱已成而后治之，譬犹渴而穿井，斗而铸锥，不亦晩乎。 ', '22.00', '2', '<a href=\'/BookHouse/book/findBookByType.htm?booktype=医学类\'>医学类</a> / <a href=\"/BookHouse/book/findBookByType.htm?booktype=中医\"  target=\'_top\'>中医</a>', '200', '1', '0', '0.0', '0');
INSERT INTO `book` VALUES ('26', '黄帝内经 ', '《书立方》编委会　编', '9787229019426', ' 重庆出版社', '2010-11-23', '无', '第一章 探索生命\r\n　关于生命的起源\r\n　生命活动的基本特征\r\n　生命进程的基本规律——生长壮老已\r\n　生命的动力\r\n　人体衰老的过程\r\n　人类合理的寿限\r\n　影响人类寿命的因素\r\n　解秘《黄帝内经》中四种长寿之人\r\n第二章 人体的五脏六腑\r\n　五脏六腑系统总览\r\n　心，气血运行的发动机\r\n　肺，体内气体交换的门户\r\n　肝，贮藏和调节血液的仓库\r\n　肾，藏精、主水和纳气的宝库', '/bookIMG/20810634-1_x_2.jpg', null, '本书将原文的深奥理论用通俗的语言和简捷的图表进行阐释，使抽象概念形象化，深奥理论通俗化，复杂问题具体化，精彩解读了藏象、经络运行、气血津液等知识，并从饮食、起居、劳逸、寒温等各个方面，阐释了疾病的病因、病机，确立了疾病的诊治之法和日常的养生之道。希望编辑们的心血和汗水所铸就的“成果”，可以使想学习和了解本书的读者月月友在阅读中有所裨益。 ', '6.00', '2', '<a href=\'/BookHouse/book/findBookByType.htm?booktype=医学类\'>医学类</a> / <a href=\"/BookHouse/book/findBookByType.htm?booktype=中医\"  target=\'_top\'>中医</a>', '200', '1', '0', '0.0', '0');
INSERT INTO `book` VALUES ('27', '脊椎病因治疗学', '龙层花 主编', '35353534535', '世界图书出版公司', '2011-11-23', '龙层花，著名脊椎病专家、教授，广州医学院毕业；从医50多年，曾任广州军区总医院康复理疗科主治医师，现任中国广州脊椎相关疾病研究所副所长，香港骨伤学会终身会长，中华推拿学会、中国脊椎相关疾病学会名誉会长，中国颈椎病研究会研究员，首届中华脊柱医学论坛大会名誉主席；创立有脊椎病因治疗学说和治脊疗法，发明了微机控制治脊床、颈椎牵引椅、龙牌保健枕，有龙氏脊椎牵引枕等4项国家专利，获世界传统医学大会金杯奖4次，军队科技二、三、四等奖6项，国家级重点课题1项；多次应邀到世界各地讲学，举办龙氏治脊推拿培训班200多期，为全球培训了2万多名龙氏治脊医师。\r\n　　主编及参编著作包括：《龙层花颈椎病防治》、《龙层花腰骶椎病防治》、《龙层花都市病家庭推拿法》（VCD）、《实用理疗学》、《简明临床理疗手册》、《实用脊柱病学》、TheStudy and Treatment of Spinal Diseases，发表论文60多篇。', '前言\r\n上篇　总论\r\n　第一章　概述\r\n　第二章　应用解剖及生理基础\r\n　　第一节　脊柱的生物力学\r\n　 一、脊柱的功能单位(FSU)\r\n　 二、脊柱活动和脊柱的稳定性\r\n　 三、脊柱负荷与应力分布\r\n　 四、椎间盘的生物力学\r\n　　第二节　脊椎骨与椎问盘\r\n　 一、脊椎骨\r\n　 二、脊柱的连接\r\n　 三、椎间盘\r\n　　第三节　椎动(静)脉\r\n　　第四节　脊髓', '/bookIMG/22732158-1_u_1.jpg', null, '　脊椎病因治疗学是研究脊椎遭受损害后，对脊髓、周围神经、血管及内脏神经连带出现的一系列病症采用治脊疗法治疗的一门新兴学说。脊椎相关疾病的发现，为一些常见疾病的发病补充了新的病因学说，为临床疑难病症开辟了一条新而有效的诊治途径，在医学界影响深远。\r\n　　这一版对最早提出并详细介绍脊椎病因及其诊治方法、开脊椎治疗先河的1987年版《脊椎病因治疗学》进行了修订和增补，重点介绍了近年来脊椎病研究的新进展和各种新治脊疗法。上篇为生理、病理等基础学科和各种治脊疗法的手法，下篇为颈椎综合征、胸椎综合征、腰椎综合征及脊椎病因相关病症等的病因病理和治疗方法，图文并茂，权威实用', '44.00', '2', '<a href=\'/BookHouse/book/findBookByType.htm?booktype=医学类\'>医学类</a> / <a href=\"/BookHouse/book/findBookByType.htm?booktype=骨科\"  target=\'_top\'>骨科</a>', '100', '1', '0', '0.0', '0');
INSERT INTO `book` VALUES ('28', '微反应心理学全集', '陈璐 编著', '35353534535345', '中央编译出版社', '2014-11-23', '陈璐：国内某传媒机构CEO，公关活动策划人，知名培训师。致力于心理学与口才说学研究和传播。先后服务过安利、雅芳、IBM、中国民生银行等众多国际和本土知名企业，曾为100多家企业、3000多名学员进行过交际、沟通技巧的课堂培训与一对一辅导，学员中既有高级管理层、中基层经理人员、企业的内部讲师，也有一线营销和服务人员等。', '目录\r\nCONTENT\r\n\r\n第一章 看透意图的读心策略\r\n当你猜不透朋友的内心，看不破上司的意图时，你肯定无数次地祈求上天赋予你看透人意图的“异能”。实际上这种异能并不难学习，每一类心态往往都会产生一种微反应，而这种反应正是本章的内容。\r\n冻结反应：教你如何观察一张凝结的脸\r\n逃离反应：惹不起也要躲得起\r\n认同反应：附议者也分真心和假意\r\n炫耀反应：动物为什么展示羽毛\r\n嫉妒反应：心里不平衡的人，表情动作也难以平衡\r\n攻击反应：动手之前，总有那么一些征兆\r\n疲劳反应：能量流失之后的衰竭\r\n\r\n第二章 识别关系的读心策略', '/bookIMG/23350598-1_u_1.jpg', null, '人与人的交往，就是心与心的较量。\r\n在本书中，你将了解到肢体语言和心理学领域的最新研究成果，这些知识将有助于你拨开云雾见晴天，看懂他人内心的真实世界。同时，你还将看到聪明人是如何运用读心术，迅速获得他人的好感，并且不露痕迹地影响身边的人。这些技术将有助于你获得超级人气，成为人生的终极赢家。\r\n当你掌握了心理学与读心术之后，你将会发现：结识人、琢磨人、了解人是一件多么有意思的事情——对方有再多的掩饰也只是给你提供更多的佐证，供你把他内心研究得更加透彻。', '32.00', '2', '<a href=\'/BookHouse/book/findBookByType.htm?booktype=心理类\'  target=\'_top\'>心理类</a>', '200', '1', '0', '0.0', '0');
INSERT INTO `book` VALUES ('29', '天才在左疯子在右', '高铭', '7897957575', '武汉大学出版社', '2014-11-23', ' 高铭，男，汉族。生干20世纪70年代的北京。目前任职于某公司项目总监。自认为死心眼根筋，对于探索未知事物总是有无尽渴望。从学龄前就已经有了至今仍然挂在嘴边的口头禅“为什么?”成年后曾一度沉迷于宗教、哲学、量子物理、非线性动力学、心理学、生物学和天体', '序言：更多、更多的世界\r\n　1．生命的尽头\r\n　2．梦的真实性\r\n　3．四维虫子\r\n　4．进化惯性\r\n　5．三只小猪——前篇：不存在的哥哥\r\n　6．三只小猪——后篇：多重人格\r\n　7．女人的星球\r\n　8．最后的撒旦\r\n　9．角色问题\r\n　10．飞禽走兽\r\n　11．苹果的味道\r\n　12．颅骨穿孔——前篇：异能追寻者\r\n　13．颅骨穿孔——后篇：如影随形\r\n　14．角度问题', '/bookIMG/20767715-1_u_2.jpg', null, '这个世界，究竟是什么样的呢？这是一个看似很简单的问题．不过必须注意的是：看似。\r\n多年前我曾经收到过一张生日卡，上面写的那句话很动人：最精彩的，其实就是世界本身。也就是看到这句话不久，我希望在有生之年能够环游世界，因为总觉得有必要认识下自己生活的这个星球。也就是有了这个愿望后不久，我想到了刚刚提到的问题：这个世界究竟是怎样的。\r\n在好奇心驱使下，我通过各种各样的渠道和方式，花了很多时间和精力去寻找答案。但是我发现，谁也说不清这个世界到底是怎样的。\r\n就在我为此困惑的时候，某次听一个是精神科医生的朋友说起了一些病例。然后好像明白了一些：明白为什么没人能说清这个世界到底是怎样的了。\r\n道说：这里是人间；佛说：这里是六道之一；上帝说：这里是天堂和地狱之间的战场；哲学说：这里是无穷的辩证迷雾；物理说：这里是基本粒子堆砌出来的聚合体；人文说：这里是存在；历史说：这里是时间的累积。所有的解释都在这里。\r\n看来，这个世界是有无数面的不规则体。\r\n于是我开始饶有兴趣地问身边那些熟悉的人：“在你看来，世界到底是怎样的？”不过，并没得到态度认真的回答。\r\n为什么呢？大概因为很少有人想过这个问题，也很少有人真的愿意面对这个问题，因为大家都在忙着挣钱，找老婆。升职……很少有人在乎这个世界到底是怎样的。更多的人对于我这种不忙着挣钱，不忙着找老婆，不忙着升职的行为表示不解，同时还半真半假地表示关注：你疯了吗？', '44.00', '2', '<a href=\'/BookHouse/book/findBookByType.htm?booktype=心理类\'  target=\'_top\'>心理类</a>', '200', '1', '0', '0.0', '0');
INSERT INTO `book` VALUES ('30', '少年博物馆', '张晓晗　著', '3453534535234', '天津人民出版社', '2014-03-23', '　张晓晗\r\n　　91年生的傲娇摩羯座超龄少女，上戏毕业。\r\n　　拥有买了一百多个手机套最后手机丢了的悲催人生，\r\n　　一生放荡不羁爱淘宝，\r\n　　持之以恒的肉食主义者，\r\n　　凭着长腿瘦胸带领少先队员打天下的银河系少先队大队长。\r\n　　代表作：《女王乔安》。', 'A-AREA\r\n浪子回头的大哥\r\n疯狂投资人\r\n滑板少年\r\n数理哲学家\r\n帅哥\r\n埋单小能手\r\n资深宅男\r\n基佬\r\n和我一起长大的男生\r\n好好先生\r\n不好先生\r\n食草男\r\nB-AREA\r\n美少年小树', '/bookIMG/23522475-1_u_1.jpg', null, '很会吵架的男孩，就是每当我大吼“你滚”的时候，男孩从来不说对不起，不说我错了，不说别生气了。他总是以盖过我的音量暴着青筋吼回来：“你漂亮，个性好又有才华！腿那么长，腰那么细，气质超凡脱俗！我一直以你为骄傲！恨不得告诉所有人你是我女人，你凭什么不自信啊！猜来猜去有意思吗？”通常是他这段话还没吼完，我就已经拉着他的手，笑得不知道自己姓什么了，“好啦好啦，原谅你。”\r\n　　从叫嚣着“你不当我老婆我就不放你下来”的跷跷板男孩，被自拍神器拯救的浪子回头大哥，到把钞票散落漫天的二世祖，掌握了张晓晗经济命脉的神秘总……馆藏108个还未长大、正在长大与已经老了的男孩。这里有你曾经泡过、追过、等过、错过、与尚未见过的男孩，从他们的眼睛里读懂世界，从这里读懂他们，薄薄两厘米，总有一款适合你。愿这108个小故事能在每个失眠的夜里，陪你入睡。', '33.00', '2', '<a  target=\'_top\' href=\'/BookHouse/book/findBookByType.htm?booktype=青春\'>青春</a> / <a target=\"_top\" href=\"/BookHouse/book/findBookByType.htm?booktype=青春文学\">青春文学</a> / <a  target=\"_top\" href=\"/BookHouse/book/findBookByType.htm?booktype=校园\">校园</a>', '100', '1', '0', '0.0', '0');
INSERT INTO `book` VALUES ('31', '个4：不散的宴席', '韩寒 主编', ' 23533937', '作家出版社', '2014-09-23', '韩寒\r\n　　1982年9月23日，生于上海金山区亭林镇。\r\n　　作家---自本世纪初出道，韩寒14年以来始终保持在中国最畅销作家TOP3之列\r\n　　1997年在《少年文艺》发表作品；\r\n　　1999年凭借《杯中窥人》韩寒获第一届新概念作文大赛一等奖，次年蝉联；\r\n　　2000年出版长篇小说《三重门》，累计销售600万册；\r\n　　2001年《零下一度》；\r\n　　2002年《像少年啦飞驰》；\r\n　　2003年《通稿2003》；\r\n　　2004年《长安乱》；', '大冰_不许哭\r\n你多少岁了？你最向往的生活是什么样的？你曾经触碰过吗?\r\n现在我们的祖国还有哪个地方能在夜晚看到满天繁星？\r\n陈谌_莉莉安公主的烦恼\r\n如果你突然具有了可以随意进入别人梦境的能力，你会做什么？你的生活会发生哪些改变？\r\n先天失明者的梦境是什么样子的？\r\n为什么大家在操场跑步都是按逆时针方向来跑的?\r\n张皓宸_总要有荒唐的人事，来完整你的人生\r\n如果童话和虚拟世界里的人都是真的，你最想成为谁?\r\n如何能让身患癌症的朋友打起精神，好好配合治疗?\r\n怎么做才能珍惜时间过好每一天呢?\r\n张晓晗_前男友教给我的二十一件事\r\n分手后你最想从对方那里拿回什么?\r\n当妹子因为生气对我说“滚”时，该怎么办？\r\n自己好像很不合群，不受欢迎。如何是好？', '/bookIMG/23533937-1_u_1.jpg', null, '由一个工作室发掘的“新文学最强战队”12位超给力成员，带来了12篇主题各异“真心话+自然美”的精美好文，集结成作品集，讲述了关于亲情、爱情、梦想、童话等精彩的故事，愿美好触动你心灵的每一个角落。同时还有以往与读者互动的问答版块，你问我答，关于情感、生活、事业等方方面面稀奇古怪的问题。\r\n　　“新文学最强战队”的首发阵容，共同赶赴一场聚会，各自讲述一个心中的故事与你分享：\r\n　　【韩寒】在电影《后会无期》拍摄结束之后写下全新独家文章，分享关于梦想的励志故事；\r\n　　【七堇年】首度尝试想象未来世界，人与人之间最远的距离，并非相隔千山万水，而是心的距离；\r\n　　【大冰】带你重回日光城拉萨，讲述和好友妮可赵雷二彬子的温情往事，千言万语，不许哭；\r\n　　【张晓晗】为你细数都市爱情故事的模样，关于那个“除了爱我一件事都没做好的”男友；\r\n　　【陈谌】再度带来成人世界的有趣童话；\r\n　　【张皓宸】依然温暖治愈；\r\n　　【蔡崇达】因为错位的年代，一位传奇的女人却只能成一曲挽歌；\r\n　　【荞麦】回忆小时候，那个没有半点爸爸样子的男人却是心中最重要的人；\r\n　　【耀一】打破温情路线，展现另类奇谈；\r\n　　【王云超】温和愤怒，回忆北漂的那些日子，那些人；\r\n　　【释戒嗔】谈笑历史，让你相信晦暗的人生都总有一点灯光会照亮你；\r\n　　【方慧】慢慢走入你的内心让你直视亦正亦邪的自己，人的本性究竟是善是恶？\r\n\r\n　　在这场欢乐的文艺聚会中，让我们一起互动吧，你问我答，关于情感、生活、事业等方方面面稀奇古怪的问题，皆可各种无厘头。有的问题让人捧腹大笑：郭德纲老师爱读什么书；如果不小心被抓进精神病医院，如何证明自己不是神经病？有的问题让人感慨万千：竞争残酷的大城市和安逸舒适的小城市，你怎么选？有没有某一个瞬间，发现自己身上人性的恶突然觉醒？看看一个APP的忠实粉丝“班主任陈老师”，“科学传播工作者”，“盲人吴光”，“厦门观音寺僧人”都问了什么答了什么？你的问和答有没有被挑中？只有你想不到的问，没有我们答不了的题，在这里，新的世界，对你敞开。', '44.00', '2', '<a  target=\'_top\' href=\'/BookHouse/book/findBookByType.htm?booktype=青春\'>青春</a> / <a target=\"_top\" href=\"/BookHouse/book/findBookByType.htm?booktype=青春文学\">青春文学</a> ', '100', '1', '0', '0.0', '0');
INSERT INTO `book` VALUES ('32', '孤单的人总会相逢', ' 小寒　著', '765784563535', '译林出版社', '2012-11-23', '小寒，职业背包客一枚。\r\n　　工作于一国企，半年后辞职，开始旅行。历时8个月，花费10000元，环游中国。搭车、住帐篷、做沙发客，打工挣下一站的旅行费。在路上，他遇见了生活中不会遇见的风景，听到了很多稀奇故事，接触到不同的人。2013年，他把自己的旅行故事写在了天涯上，点击率上千万，更多的人开始关注这位90后背包客。', '第一辑 故乡\r\n　旅行　\r\n　远方　　\r\n　朝圣　　\r\n　行者　　\r\n　候鸟　　\r\n　孤寂　　\r\n　沉默　　\r\n　浮生　　\r\n　时光　　\r\n　结庐　　\r\n　故乡　　\r\n第二辑 爱情\r\n　雪域　　\r\n　偶然　', '/bookIMG/23575272-1_u_1.jpg', null, '这是一本与旅行有关的书，这也是一本和旅行扯不上边的书。没有风景，没有美食，没有攻略，没有照片。作者真正想要讲述的，是旅途中遇到的每一个人，每一个故事，从而引发我对这个世界的思索。在这场旅行中，作者和33个城市的33种人生，有穷人、富人、受过教育的、未受过教育的、推陈出新的、循规蹈矩的、大城市的、小村庄的……背景各不相同，却都活在当下，拥有丰满的个性。他们所带来的，是对于这个我们所生活着的世界的全新看法。这场旅行的成果，是一份令人愉悦、真诚又风趣的记录，它组成了一代人的肖像。 ', '30.00', '2', '<a  target=\'_top\' href=\'/BookHouse/book/findBookByType.htm?booktype=生活类\'>生活类</a> / <a target=\"_top\" href=\"/BookHouse/book/findBookByType.htm?booktype=旅游\">旅游</a> ', '100', '1', '0', '0.0', '0');
INSERT INTO `book` VALUES ('33', '一日一花 ', '川濑敏郎　著', '456466767', '湖南人民出版社', '2014-11-23', '川濑敏郎\r\n　　1948年生于京都，自幼师从最古老的“池坊”花道。日本大学艺术学部毕业后，前往巴黎大学留学，回国后不拘泥于流派，回到花道的原点自由创作。\r\n　　擅长用古老、质朴、布满历史痕迹的器皿当做花器，依据时节到山野里找最当令的花叶，融入花器中，简约中有一份枯寂之美。他的花艺有着浓厚的禅意，常被人当作对四季更迭、时间流逝的一种冥想方式。\r\n　　著有《一日一花》《四季花传书》《花会记》等。\r\n　　译者：杨玲\r\n　　毕业于西安外国语大学日语学院，专攻日本文学。1990年代初前往日本，学习欧式花艺。2002年入门传统花道小原流，现为日本花道小原流教授、日本国家花卉装饰一级技能师，在日华人花艺协会会长。', '我酷爱日本审美意识中的寂（Wabi-sabi）：枯山水、陶器、建筑、茶道，以及花道。很多年前，当我还是一名日语专业的大学生时，第一次在日语原文杂志上看到了“插花”。当时我被它的素美所震撼，脑海里闪过“如果能学习插花该多好”的念头。后来移居日本，终于实现了年轻时的愿望，入门日本传统花道小原流。', '/bookIMG/23400692-1_u_4.jpg', null, '　　在东日本大地震后，川濑敏郎从2011年6月开始的一年，用古老、质朴、布满历史痕迹的器皿当做花器，依据时节到山野里找最当令的花叶，融入花器中，并持续在网上连载“一日一花”专栏，广受好评后汇编成这一册精美的图鉴。\r\n　　366个作品野趣中充满了宁静和雅致，在“空”和“寂”中给人一种生命的启示。在《一日一花》中, 川濑敏郎着力于诠释“最高的技巧即没有技巧”，在不着痕迹中传达“素”之花极致的自然姿态。\r\n　　《一日一花》中的图鉴也收到国内众多设计师、文化爱好者、以及设计类图片类网站的喜爱。而诸如@设计目录、@知日、@VOICERme 等都曾在其平台上转载过，深受网友和读者喜爱。\r\n　　作品最后，附带了425种植物的索引和解说，对所有对美敏感、欣赏花道，和所有植物爱好者来说不可多得的一本书。\r\n', '33.00', '2', '<a  target=\'_top\' href=\'/BookHouse/book/findBookByType.htm?booktype=生活类\'>生活类</a> / <a target=\"_top\" href=\"/BookHouse/book/findBookByType.htm?booktype=休闲\">休闲</a> ', '100', '1', '0', '0.0', '0');
INSERT INTO `book` VALUES ('34', '嵌入式系统软硬件协同', '陆佳华　等编著', '457585686876456', '机械工业出版社', '2014-11-23', '陆佳华，开源硬件社区Operhw.org资深版主，Xilinx高级应用工程师，现任职于Xilinx全球大学计划部，主要负责Xilinx全球大学相关的参考设计开发，技术推广、支持。2006年毕业于西安交通大学并获得硕士学位。同年加入Xilinx公司就任产品应用工程师，主要负责FPGA上的嵌入式系统设计、以太网设计、内存控制器设计等方向技术支持。著有《零存整取NetFPGA开发指南》一书。 ', '序言\r\n第2版前言\r\n第一部分　基础篇\r\n第1章　将你的ZED板卡用起来\r\n　1.1　GPIO LED动手玩\r\n　　1.1.1　安装SD卡\r\n　　1.1.2　跳线与外设连接\r\n　　1.1.3　演示操作\r\n　1.2　Linaro Ubuntu动手玩\r\n　　1.2.1　SD卡分区\r\n　　1.2.2　文件复制\r\n　　1.2.3　外设连接\r\n　　1.2.4　可演示的效果\r\n第2章　Zynq平台介绍\r\n　2.1　7系列FPGA简介', '/bookIMG/23523518-1_u_1.jpg', null, '陆佳华、潘祖龙、彭竞宇等编著的《嵌入式系统软硬件协同设计实战指南（基于XilinxZYNQ第2版）》分为基础篇和进阶篇两大部分，基础篇主要介绍ZynqSOC架构，ARMCortex-A9处理器，开发工具链等，器件Boot过程，并配备了大量基础实验，包括板卡的启动，编译嵌入式Linux系统，完成ARM和FPGA的简单片内通讯等；在进阶篇中详解了处理器和FPGA间接口种类和工作方式，分析了如何完成两者间高速的数据交互，通过实例介绍了如何在FPGA中定义用户自己的IP核并完成驱动编写供处理器上运行的Linux使用等，例如如何完成HDMI接口，如何将摄像头数据传递给处理器，并通过运行的OpenCV。本书还将结合Xilinx最新的Vivado和AutoESL开发工具介绍整体软硬件协同设计开发流程并通过案例分析。\r\n　　本书可作为Zynq初学者、软硬件协同设计开发人员的参考用书，亦可作为大专院校嵌入式系统设计、片上系统设计、可编程逻辑器件等相关专业的教师和学生的参考用书', '55.00', '2', '<a  target=\'_top\' href=\'/BookHouse/book/findBookByType.htm?booktype=计算机类\'>计算机类</a> / <a target=\"_top\" href=\"/BookHouse/book/findBookByType.htm?booktype=嵌入式开发\">嵌入式开发</a> ', '100', '1', '0', '0.0', '0');
INSERT INTO `book` VALUES ('35', '电脑硬件从入门到精通', '徐伟，张鹏　编著', '6835636546235', '中国铁道出版社', '2014-11-23', '徐伟，硬件工程师硬件维修。\r\n　　张鹏，硬件工程师硬件维修。 ', '第1篇  硬件选购  第1章  电脑装机维修预备知识  第2章  选购CPU  第3章  选购主板  第4章  选购内存  第5章  选购硬盘  第6章  选购光驱/刻录机', '/bookIMG/23592150-1_u_1.jpg', null, '《电脑硬件选购、组装与维修从入门到精通》是以采购、组装、维修为核心内容的硬件学习手册。全书从实用角度出发，并结合编者多年积累的组装、维修和电脑培训经验，总结出电脑采购、装机、设置、组网、维修等几方面知识的精华，供初学者和相关从业人员学习参考；随书附赠的多媒体光盘中还为读者提供了大量精彩视频。\r\n　　本书结合了大量的实战案例，具有很强的实用性、可读性和可操作性，适合作为电脑初学者的自学教程，也可作为电脑培训班的教材，同时还适合电脑爱好者、装机人员，以及从事电脑组装与维修人员学习使用。 ', '47.00', '2', '<a  target=\'_top\' href=\'/BookHouse/book/findBookByType.htm?booktype=计算机类\'>计算机类</a> null', '100', '1', '0', '0.0', '0');

-- ----------------------------
-- Table structure for `house`
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `hous_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hous_login_email` varchar(30) DEFAULT NULL,
  `hous_login_name` varchar(30) DEFAULT NULL,
  `hous_login_password` varchar(30) DEFAULT NULL,
  `hous_name` varchar(50) DEFAULT NULL,
  `hous_logo` varchar(30) DEFAULT NULL,
  `hous_phone` varchar(255) DEFAULT NULL,
  `hous_company_name` varchar(30) DEFAULT NULL,
  `hous_company_addr` varchar(30) DEFAULT NULL,
  `hous_score_description` double(2,2) DEFAULT NULL,
  `hous_score_service` double(2,2) DEFAULT NULL,
  `hous_score_speed` double(2,2) DEFAULT NULL,
  PRIMARY KEY (`hous_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('1', 'phnlove@163.com', '1', '1', 'fireoct', '/u&hIMG/asf.gif', '13319557866', '炎', '广州', null, null, null);
INSERT INTO `house` VALUES ('2', 'phn@163.', '3', '3', '三味书屋', '/u&hIMG/new06.jpg', '13319557866', '三味书屋', '广州', null, null, null);
INSERT INTO `house` VALUES ('3', '555', '555', '555', null, null, null, null, null, null, null, null);
INSERT INTO `house` VALUES ('4', '5555', '5555', '5555', null, null, null, null, null, null, null, null);
INSERT INTO `house` VALUES ('5', '6', '6', '6', null, null, null, null, null, null, null, null);
INSERT INTO `house` VALUES ('6', '9', '9', '9', '9', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orde_id` bigint(18) NOT NULL AUTO_INCREMENT,
  `orde_number` varchar(30) DEFAULT NULL,
  `orde_book_id` bigint(18) DEFAULT '13',
  `orde_user_id` bigint(18) DEFAULT '1',
  `orde_book_amount` int(5) DEFAULT NULL,
  `orde_status` int(1) DEFAULT NULL,
  `orde_datetime` datetime DEFAULT '2014-12-14 00:00:00',
  `orde_price` double(5,2) DEFAULT NULL,
  `orde_user_comment` varchar(1000) DEFAULT NULL,
  `orde_user_score` double(4,2) DEFAULT NULL,
  `orde_addr_name` varchar(200) DEFAULT NULL,
  `orde_addr_user_name` varchar(20) DEFAULT NULL,
  `orde_addr_phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`orde_id`),
  KEY `orde_book_id` (`orde_book_id`),
  KEY `orde_user_id` (`orde_user_id`),
  CONSTRAINT `orde_book_id` FOREIGN KEY (`orde_book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `orde_user_id` FOREIGN KEY (`orde_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('11', '141119073811-387', '14', '1', '2', '4', '2014-11-19 19:40:43', '140.00', '还好还好', '4.00', '广州', '潘海南', '13319552222');
INSERT INTO `orders` VALUES ('12', '141119075259-271', '15', '1', '1', '4', '2014-11-19 19:53:05', '33.00', '还好还好', '4.00', '广州', '潘海南', '13319552222');
INSERT INTO `orders` VALUES ('13', '141119075331-953', '15', '1', '1', '4', '2014-11-19 19:53:38', '33.00', '很好啊，特地买了第二本', '5.00', '广州', '潘海南', '13319552222');
INSERT INTO `orders` VALUES ('14', '141119080557-360', '14', '1', '1', '4', '2014-11-19 20:32:14', '70.00', 'youmeilaileyben', '4.00', '广州', '潘海南', '13319552222');
INSERT INTO `orders` VALUES ('15', '141119080953-393', '15', '1', '2', '4', '2014-11-19 20:25:55', '66.00', '很好的一本书', '4.50', '广州', '潘海南', '13319552222');
INSERT INTO `orders` VALUES ('16', '141119082703-954', '15', '1', '2', '4', '2014-11-19 20:27:18', '66.00', 'asdfasdf', '4.00', '广州', '潘海南', '13319552222');
INSERT INTO `orders` VALUES ('17', '141119083322-934', '15', '1', '1', '4', '2014-11-19 21:30:15', '33.00', 'wetwwerwer', '2.50', '广州', '潘海南', '13319552222');
INSERT INTO `orders` VALUES ('18', '141119095305-350', '14', '1', '2', '4', '2014-11-19 22:38:19', '140.00', '112', '0.50', '', '', '');
INSERT INTO `orders` VALUES ('19', '141119095305-378', '14', '1', '1', '4', '2014-11-19 23:00:07', '70.00', '很好的一本书', '5.00', '广州', '潘海南', '13319552222');
INSERT INTO `orders` VALUES ('20', '141120101333-179', '14', '1', '2', '4', '2014-11-20 10:13:33', '140.00', '很好哦', '4.00', '广州', '潘海南', '13319552222');
INSERT INTO `orders` VALUES ('21', '141120112243-082', '15', '2', '1', '1', '2014-11-20 11:22:43', '33.00', null, '0.00', '湖南张家界', '唐友宝', '1452234234');
INSERT INTO `orders` VALUES ('22', '141123120425-885', '14', '1', '1', '1', '2014-11-23 00:04:26', '70.00', null, '0.00', '湖南长沙', '葛恩利', '15574897427');
INSERT INTO `orders` VALUES ('27', '141123051606-786', '14', '1', '1', '1', '2014-11-23 17:16:07', '70.00', null, '0.00', '广东广州', '潘海南', '13319552222');
INSERT INTO `orders` VALUES ('28', '141123124348-372', '23', '2', '1', '4', '2014-11-23 12:43:48', '70.00', '很好哦', '4.00', '湖南张家界', '唐友宝', '1452234234');
INSERT INTO `orders` VALUES ('29', '141124081345-525', '23', '2', '1', '1', '2014-11-24 08:13:46', '70.00', null, null, '湖南张家界', '唐友宝', '1452234234');
INSERT INTO `orders` VALUES ('30', '141123125139-143', '23', '2', '1', '4', '2014-11-23 12:51:39', '70.00', '这次质量有点差', '3.00', '湖南张家界', '唐友宝', '1452234234');
INSERT INTO `orders` VALUES ('31', '141124081537-077', '32', '1', '1', '1', '2014-11-24 08:15:37', '30.00', null, null, '广东广州', '潘海南', '13319552222');
INSERT INTO `orders` VALUES ('32', '141124081230-943', '14', '2', '1', '1', '2014-11-24 08:12:31', '70.00', null, null, '湖南张家界', '唐友宝', '1452234234');
INSERT INTO `orders` VALUES ('33', '141204100116-002', '20', '1', '1', '1', '2014-12-04 22:01:16', '50.00', null, null, 'sdfsfds', 'geenli', '13319552222');
INSERT INTO `orders` VALUES ('34', '141124081636-892', '15', '1', '1', '1', '2014-11-24 08:16:37', '33.00', null, null, '湖南长沙', '葛恩利', '15574897427');
INSERT INTO `orders` VALUES ('35', '141124085934-444', '35', '1', '5', '1', '2014-11-24 08:59:34', '235.00', null, null, '广东广州', '潘海南', '13319552222');
INSERT INTO `orders` VALUES ('36', '141210045420-655', '34', '1', '1', '1', '2014-12-10 16:54:21', '55.00', null, null, '海南', '潘海南', '13319552222');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) DEFAULT NULL,
  `type_father_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `type_father_id` (`type_father_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '计算机类', '-1');
INSERT INTO `type` VALUES ('2', '文学类', '-1');
INSERT INTO `type` VALUES ('3', '医学类', '-1');
INSERT INTO `type` VALUES ('4', '网络安全', '1');
INSERT INTO `type` VALUES ('5', 'J2EE', '1');
INSERT INTO `type` VALUES ('6', '嵌入式开发', '1');
INSERT INTO `type` VALUES ('7', '密码学', '4');
INSERT INTO `type` VALUES ('8', 'ARP攻击原理', '4');
INSERT INTO `type` VALUES ('9', 'JavaEE架构', '5');
INSERT INTO `type` VALUES ('10', 'SSH开发', '5');
INSERT INTO `type` VALUES ('11', 'Java语言', '5');
INSERT INTO `type` VALUES ('12', '单片机', '6');
INSERT INTO `type` VALUES ('13', 'Sping', '5');
INSERT INTO `type` VALUES ('14', '小说', '2');
INSERT INTO `type` VALUES ('15', '玄幻', '14');
INSERT INTO `type` VALUES ('16', '散文', '2');
INSERT INTO `type` VALUES ('17', '诗歌', '2');
INSERT INTO `type` VALUES ('18', '绝句', '17');
INSERT INTO `type` VALUES ('19', '生活类', '-1');
INSERT INTO `type` VALUES ('20', '心理类', '-1');
INSERT INTO `type` VALUES ('21', '青春', '-1');
INSERT INTO `type` VALUES ('22', '青春文学', '21');
INSERT INTO `type` VALUES ('23', '动漫', '21');
INSERT INTO `type` VALUES ('24', '幽默', '21');
INSERT INTO `type` VALUES ('25', '校园', '22');
INSERT INTO `type` VALUES ('26', '叛逆', '22');
INSERT INTO `type` VALUES ('27', '爱情', '22');
INSERT INTO `type` VALUES ('28', '大陆漫画', '23');
INSERT INTO `type` VALUES ('29', '日韩漫画', '23');
INSERT INTO `type` VALUES ('30', '骨科', '3');
INSERT INTO `type` VALUES ('31', '外科', '3');
INSERT INTO `type` VALUES ('32', '休闲', '19');
INSERT INTO `type` VALUES ('33', '旅游', '19');
INSERT INTO `type` VALUES ('34', '旅游攻略', '33');
INSERT INTO `type` VALUES ('35', '悬疑', '20');
INSERT INTO `type` VALUES ('36', '恐怖', '20');
INSERT INTO `type` VALUES ('37', '中医', '3');
INSERT INTO `type` VALUES ('38', '西医', '3');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_login_name` varchar(30) DEFAULT NULL,
  `user_login_password` varchar(30) DEFAULT NULL,
  `user_nick_name` varchar(30) DEFAULT NULL,
  `user_sex` varchar(2) DEFAULT NULL,
  `user_picture` varchar(60) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_login_email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2', '22', '222222', '男', '/u&hIMG/901e54f7gw1dxo19zu7xqg.gif', '13319552222', null);
INSERT INTO `user` VALUES ('2', '4', '4', '十月', '男', '/u&hIMG/u=3008622114,4078849108&fm=21&gp=0.jpg', null, 'phn@163.com');
INSERT INTO `user` VALUES ('3', '8', '8', '8', null, '/u&hIMG/asf.gif', null, '8');
