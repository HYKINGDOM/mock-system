-- MySQL dump 10.13  Distrib 5.6.21, for Win64 (x86_64)
--
-- Host: 47.107.127.244    Database: mock_information
-- ------------------------------------------------------
-- Server version	5.7.22

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
-- Table structure for table `book_chapter`
--


DROP TABLE IF EXISTS `db_connect_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_connect_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `db_connect_name` varchar(100) DEFAULT NULL,
  `db_address` varchar(100) DEFAULT NULL,
  `db_port` int(11) DEFAULT NULL,
  `db_user_name` varchar(100) DEFAULT NULL,
  `db_password` varchar(1000) DEFAULT NULL,
  `db_type` varchar(100) DEFAULT NULL,
  `db_edition` varchar(100) DEFAULT NULL,
  `db_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_connect_info`
--

LOCK TABLES `db_connect_info` WRITE;
/*!40000 ALTER TABLE `db_connect_info` DISABLE KEYS */;
INSERT INTO `db_connect_info` VALUES (1,2,'阿里云-数据库','47.107.127.244',3306,'root','EATsok9YVJfFG5p6s8uJF+oVxNMpUdUn3kh1sigChUmqqBLhUhIqgm4Cj5ZjV3ED8jT8LRTZ+b3sCNBWR36ocjnW6JPOUMms3rJfoRyBMU+xYPffU6da+fys+v89qiDixywVqodXtxGZwSJAzPe1De8s966zkJiJ5g5jqT9TVSo=','mysql','5.6',1);
/*!40000 ALTER TABLE `db_connect_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;



DROP TABLE IF EXISTS `book_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_chapter` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '书籍主键ID',
  `bookId` bigint(20) NOT NULL COMMENT '书籍ID 关联book_info表',
  `chapterNameNum` int(100) DEFAULT NULL COMMENT '章节名编号',
  `chapterName` varchar(40) DEFAULT NULL COMMENT '章节名',
  `chapterContentNum` varchar(30) DEFAULT NULL COMMENT '章节字数',
  `chapterContent` varchar(30) DEFAULT NULL COMMENT '章节内容',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='书籍章节内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_chapter`
--

LOCK TABLES `book_chapter` WRITE;
/*!40000 ALTER TABLE `book_chapter` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_info`
--

DROP TABLE IF EXISTS `book_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_info` (
  `bookId` bigint(20) NOT NULL COMMENT '书籍ID 第一存入的时候生成',
  `bookName` varchar(50) DEFAULT NULL COMMENT '书籍名',
  `bookType` varchar(30) DEFAULT NULL COMMENT '书籍类型',
  `latestChapters` varchar(100) DEFAULT NULL COMMENT '最新章节',
  `author` varchar(40) DEFAULT NULL COMMENT '作者',
  `articleLength` varchar(30) DEFAULT NULL COMMENT '字数',
  `updateTime` varchar(30) DEFAULT NULL COMMENT '最后一次更新时间',
  `currentState` varchar(10) DEFAULT NULL COMMENT '书籍当前状态',
  `articleCategory` varchar(30) DEFAULT NULL COMMENT '文章类别',
  `collectionNum` varchar(30) DEFAULT NULL COMMENT '收藏数',
  `totalClick` varchar(30) DEFAULT NULL COMMENT '总点击数',
  `totalRecommendedNum` varchar(30) DEFAULT NULL COMMENT '总推荐数',
  `content` varchar(2000) DEFAULT NULL COMMENT '书籍简介',
  `bookAddressUrl` varchar(500) DEFAULT NULL COMMENT '书籍简介地址',
  `bookIndexUrl` varchar(500) DEFAULT NULL COMMENT '书籍的目录地址',
  `bookImageUrl` varchar(500) DEFAULT NULL COMMENT '书籍封面地址',
  `bookSource` varchar(100) DEFAULT NULL COMMENT '书籍来源',
  `crawlingTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='书籍基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_info`
--

LOCK TABLES `book_info` WRITE;
/*!40000 ALTER TABLE `book_info` DISABLE KEYS */;
INSERT INTO `book_info` VALUES (2544,'校花的贴身高手','都市言情','第7801章 大获全胜','鱼人二代','18936626字','2019-05-28','连载中',NULL,'24720','6632899','115189','一个大山里走出来的绝世高手，一块能预知未来的神秘玉佩…… 林逸是一名普通的高三学生，不过，他还有身负另外一个重任，那就是泡校花！而且还是奉校花老爸之命！ 虽然林逸很不想跟这位难伺候的大小姐打交道，但是长辈之命难违抗，他不得不千里迢迢的转学到了松山市第一高中，给大小姐鞍前马后的当跟班……于是，史上最牛逼的跟班出现了大小姐的贴身高手！ 看这位跟班如何发家致富偷小姐，开始他奉旨泡妞牛X闪闪的人生…… 本书有点儿纯……也有点儿小暧昧……','https://www.x23us.com/book/2544','https://www.x23us.com/html/2/2544/','https://www.x23us.com/files/article/image/2/2544/2544s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:14'),(10913,'混沌剑神','武侠修真','第两千六百七十五章 鹤芊芊的拉拢','心星逍遥','8209343字','2019-07-17','连载中',NULL,'26439','1290159','73422','剑尘，江湖中公认的第一高手，一手快剑法出神入化，无人能破，当他与消失百年的绝世高手独孤求败一战之后，身死而亡。 死后，剑尘的灵魂转世来到了一个陌生的世界，并且飞快的成长了起来，最后因仇家太多，被仇家打成重伤，在生死关头灵魂发生异变，从此以后，他便踏上了一条完全不同的剑道修炼之路，最终成为一代剑神。 逍遥初来乍到，喜欢《混沌剑神》的朋友可以到17K网站来阅读，就不用去看盗版的了。 本书实力体系，由低至高——圣者，大圣者，圣师，大圣师，大地圣师，天空圣师，圣王，圣皇，圣帝。','https://www.x23us.com/book/10913','https://www.x23us.com/html/10/10913/','https://www.x23us.com/files/article/image/10/10913/10913s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:16'),(25754,'武炼巅峰','历史军事','第四千七百九十七章 真是好弟弟好妹妹','莫默','18279378字','2019-07-04','连载中',NULL,'26701','5103056','210252','武之巅峰，是孤独，是寂寞，是漫漫求索，是高处不胜寒 逆境中成长，绝地里求生，不屈不饶，才能堪破武之极道。 凌霄阁试炼弟子兼扫地小厮杨开偶获一本无字黑书，从此踏上漫漫武道。友情提示：这是一个持久的男人的故事，这也是一个淫者见淫，智者见智的故事。 做男人，当持久！新书上传，各种求啊！','https://www.x23us.com/book/25754','https://www.x23us.com/html/25/25754/','https://www.x23us.com/files/article/image/25/25754/25754s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:03'),(28357,'修罗武神','历史军事','第四千零二十八章 血脉逆天','善良的蜜蜂','9941990字','2019-07-23','连载中',NULL,'24839','4049322','66364','论潜力，不算天才，可玄功武技，皆可无师自通。 论魅力，千金小姐算什么，妖女圣女，都爱我欲罢不能。 论实力，任凭你有万千至宝，但定不敌我界灵大军。 我是谁？天下众生视我为修罗，却不知，我以修罗成武神。 等级：灵武，元武，玄武，天武，武君，武王，武帝，武祖.... 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓 【修罗殿】铁杆①群：215777237（已满） 【修罗殿】铁杆②群：307953758（已满） 【修罗殿】铁杆③群：224035061（已满） 【修罗殿】铁杆④群：118453747（已满）','https://www.x23us.com/book/28357','https://www.x23us.com/html/28/28357/','https://www.x23us.com/files/article/image/28/28357/28357s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:08'),(50658,'永夜君王','玄幻魔法','终章 美丽新世界','烟雨江南','5319786字','2019-01-10','连载中',NULL,'14067','1040059','99933','千夜自困苦中崛起，在背叛中坠落。 自此一个人，一把枪，行在永夜与黎明之间，却走出一段传奇。 若永夜注定是他的命运，那他也要成为主宰的王。','https://www.x23us.com/book/50658','https://www.x23us.com/html/50/50658/','https://www.x23us.com/files/article/image/50/50658/50658s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:05'),(51230,'儒道至圣','玄幻魔法','第3313章 新世界（大结局）','永恒之火','8503155字','2019-07-19','连载中',NULL,'26519','2662748','321312','这是一个读书人掌握天地之力的世界。才气在身，诗可杀敌，词能灭军，文章安天下。秀才提笔，纸上谈兵；举人杀敌，出口成章；进士一怒，唇枪舌剑。圣人驾临，口诛笔伐，可诛人，可判天子无道，以一敌国。此时，圣院把持文位，国君掌官位，十国相争，蛮族虎视，群妖作乱。此时，无唐诗大兴，无宋词鼎盛，无创新文章，百年无新圣。一个默默无闻的寒门子弟，被人砸破头后，挟传世诗词，书惊圣文章，踏上至圣之路。感谢阅文官方书评团提供书评支持！','https://www.x23us.com/book/51230','https://www.x23us.com/html/51/51230/','https://www.x23us.com/files/article/image/51/51230/51230s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:11'),(55304,'全职法师','玄幻魔法','第3030章 就在这里修行吧','乱','7384527字','2019-07-22','连载中',NULL,'17174','3118415','76973','一觉醒来，世界大变。熟悉的高中传授的是魔法，告诉大家要成为一名出色的魔法师。居住的都市之外游荡着袭击人类的魔物妖兽，虎视眈眈。崇尚科学的世界变成了崇尚魔法，偏偏有着一样以学渣看待自己的老师，一样目光异样的同学，一样社会底层挣扎的爸爸，一样纯美却不能走路的非血缘妹妹……不过，莫凡发现绝大多数人都只能够主修一系魔法，自己却是全系全能法师！','https://www.x23us.com/book/55304','https://www.x23us.com/html/55/55304/','https://www.x23us.com/files/article/image/55/55304/55304s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:10'),(55505,'寒门崛起','历史军事','第一千一百三十三章 议和进行中','朱郎才尽','2743349字','2019-07-22','连载中',NULL,'13330','1313308','85412','这是一个就业路上屡被蹂躏的古汉语专业研究生，回到了明朝中叶，进入了山村一家幼童身体后的故事。 木讷父亲泼辣娘，一水的极品亲戚，农家小院是非不少。好在，咱有几千年的历史积淀，四书五经八股文，专业也对口，幸又看得到气运。谁言寒门再难出贵子。 国力上升垂拱而治； 法纪松弛，官纪慵散； 有几只奸臣，也闹点倭寇； 但总体上可以说，这是士大夫自由滋生的沃土。 一个寒门崛起的传奇也就从这里生长了。 谨以此文向所有的穿越经典致敬。','https://www.x23us.com/book/55505','https://www.x23us.com/html/55/55505/','https://www.x23us.com/files/article/image/55/55505/55505s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:19'),(57036,'真武世界','都市言情','后记 （二） 结束也是开始','蚕茧里的牛','4778418字','2019-04-30','连载中',NULL,'10623','1881414','45671','有一天，易云去爬山，在山洞中发现了一张神秘的紫色卡片。 他触及卡片的一瞬间，山体塌方。 在他好不容易爬出来之后，却见到了极度不可思议的一幕，呃……具体什么不可思议，请看本书第一章。 ——这是一个瑰丽而又充满未知的真武世界，这是一个平凡少年成就绝世强者的传奇。 作者蚕茧里的牛，已有完本作品《武极天下》，书荒可以看一看。','https://www.x23us.com/book/57036','https://www.x23us.com/html/57/57036/','https://www.x23us.com/files/article/image/57/57036/57036s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:17'),(57137,'最强狂兵','都市言情','第3855章 像我，又像你！','烈焰滔滔','13931751字','2019-07-23','连载中',NULL,'4374','567275','24393','曾经，老子是一代枭傲邪王，现在，老子要做超级护花天王！简单粗暴是我的行事艺术，不服就干是我的生活态度！看顶级狂少如何纵横都市，书写属于他的天王传奇！依旧极爽极热血！（老书《都市邪王》280万字完本，无断更记录，人品保证，放心收藏！书友群： 287999620）','https://www.x23us.com/book/57137','https://www.x23us.com/html/57/57137/','https://www.x23us.com/files/article/image/57/57137/57137s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:13'),(57371,'修真聊天群','都市言情','第2825章 加入我们的大家庭吧，书航小友！','圣骑士的传说','8669436字','2019-07-23','连载中',NULL,'13984','2822464','105501','某天，宋书航意外加入了一个仙侠中二病资深患者的交流群，里面的群友们都以‘道友’相称，群名片都是各种府主、洞主、真人、天师。连群主走失的宠物犬都称为大妖犬离家出走。整天聊的是炼丹、闯秘境、炼功经验啥的。 突然有一天，潜水良久的他突然发现……群里每一个群员，竟然全部是修真者，能移山倒海、长生千年的那种！ 啊啊啊啊，世界观在一夜间彻底崩碎啦！ 书友群：九洲1号群:207572656 九洲2号群:168114177 九洲一号群（vip书友群，需验证）63769632','https://www.x23us.com/book/57371','https://www.x23us.com/html/57/57371/','https://www.x23us.com/files/article/image/57/57371/57371s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:16'),(57682,'万古神帝','都市言情','第二千三百四十二章 斩浮屠','飞天鱼','9031505字','2019-07-23','连载中',NULL,'6972','2115354','30088','八百年前，明帝之子张若尘，被他的未婚妻池瑶公主杀死，一代天骄，就此陨落。八百年后，张若尘重新活了过来，却发现曾经杀死他的未婚妻，已经统一昆仑界，开辟出第一中央帝国，号称“池瑶女皇”。池瑶女皇——统御天下，威临八方；青春永驻，不死不灭。张若尘站在诸皇祠堂外，望着池瑶女皇的神像，心中燃烧起熊熊的仇恨烈焰，“待我重修十三年，敢叫女皇下黄泉”。…………微信公众号开通：feitian玉5，大家可以关注一下。','https://www.x23us.com/book/57682','https://www.x23us.com/html/57/57682/','https://www.x23us.com/files/article/image/57/57682/57682s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:07'),(64889,'帝霸','恐怖灵异','第3719章无法理解','厌笔萧生','12286509字','2019-07-23','连载中',NULL,'6222','2632675','31172','天若逆我，我必封之，神若挡我，我必屠之——站在万族之巅的李七夜立下豪言！ 这是属于一个平凡小子崛起的故事，一个牧童走向万族之巅的征程。 在这里充满神话与奇迹，天魔建起古国，石人筑就天城，鬼族铺成仙路，魅灵修补神府……','https://www.x23us.com/book/64889','https://www.x23us.com/html/64/64889/','https://www.x23us.com/files/article/image/64/64889/64889s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:07'),(65525,'最强医圣','都市言情','第两千三百三十二章 第二个丹田','左耳思念','5829142字','2019-07-23','连载中',NULL,'2954','240632','11610','带着一身通天本领强势回归。会治病、会算命、会炼药、会摆阵、会炼符……“这个世界上没有我办不到的事情！”——沈风。——————————————————读者群：539912693','https://www.x23us.com/book/65525','https://www.x23us.com/html/65/65525/','https://www.x23us.com/files/article/image/65/65525/65525s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:20'),(65650,'人皇纪','其他类型','第一千九百九十四章 沟通安轧荦山者，死！','皇甫奇','6684813字','2019-07-23','连载中',NULL,'2701','183401','11526','我不能把这个世界，让给我所鄙视的人！ 所以，王冲踩着枯骨血海，踏上人皇宝座，挽狂澜于既倒，扶大厦之将倾，成就了一段无上的传说！ 【最新消息，欢迎关注微信公众号：皇甫奇】 qq交流群：427253533　人皇殿','https://www.x23us.com/book/65650','https://www.x23us.com/html/65/65650/','https://www.x23us.com/files/article/image/65/65650/65650s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:12'),(66656,'圣墟','玄幻魔法','第1412章 跃入上苍','辰东','5539348字','2019-07-23','连载中',NULL,'20331','11341620','159152','在破败中崛起，在寂灭中复苏。沧海成尘，雷电枯竭，那一缕幽雾又一次临近大地，世间的枷锁被打开了，一个全新的世界就此揭开神秘的一角……','https://www.x23us.com/book/66656','https://www.x23us.com/html/66/66656/','https://www.x23us.com/files/article/image/66/66656/66656s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:02'),(67025,'天道图书馆','玄幻魔法','第二一五八章 洛七七的消息？','横扫天涯','6997523字','2019-07-23','连载中',NULL,'6284','1893831','26551','张悬穿越异界，成了一名光荣的教师，脑海中多出了一个神秘的图书馆。只要他看过的东西，无论人还是物，都能自动形成书籍，记录下对方各种各样的缺点，于是，他牛大了！教学生、收徒弟，开堂授课，调教最强者，传授天下。“灼阳大帝，你怎么不喜欢穿内裤啊？堂堂大帝，能不能注意点形象？”“玲珑仙子，你如果晚上再失眠，可以找我嘛，我这个人唱安眠曲很有一套的！”“还有你，乾坤魔君，能不能少吃点大葱，想把老子熏死吗？”这是一个师道传承，培养、指点世界最强者的牛逼拉风故事。ps1：已有完本《拳皇异界纵横》、《八神庵》、《无尽丹田》等书，质量保证，可入坑！ps2：本书普通群289258448，vip594565673。','https://www.x23us.com/book/67025','https://www.x23us.com/html/67/67025/','https://www.x23us.com/files/article/image/67/67025/67025s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:18'),(67926,'一号红人','其他类型','_第2904章 反面教材','山间老寺','8568183字','2019-02-22','连载中',NULL,'1100','20155','1748','李睿在单位里被美女上司无情欺压，家里面老婆红杏出墙，陷入了人生最低谷。在一次防汛检查时，他跟上司袁晶晶闹翻，事后才知她是市里某领导的儿媳。山洪暴发，李睿凑巧救了某位贵人，自此成为了市里的大红人……','https://www.x23us.com/book/67926','https://www.x23us.com/html/67/67926/','/modules/article/images/nocover.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:18'),(68255,'牧神记','玄幻魔法','第一七五一章 太易渡河','宅猪','6149888字','2019-07-23','连载中',NULL,'7412','85692','19532','大墟的祖训说，天黑，别出门。大墟残老村的老弱病残们从江边捡到了一个婴儿，取名秦牧，含辛茹苦将他养大。这一天夜幕降临，黑暗笼罩大墟，秦牧走出了家门……做个春风中荡漾的反派吧！瞎子对他说。秦牧的反派之路，正在崛起！','https://www.x23us.com/book/68255','https://www.x23us.com/html/68/68255/','/modules/article/images/nocover.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:06'),(69123,'元尊','玄幻魔法','第九百三十八章?0?2 法域争斗','天蚕土豆','2620542字','2019-07-23','连载中',NULL,'5533','81968','28890','《元尊》 新书 天蚕土豆 元尊此次新书在纵横中文网发布的同时，也会首次在熊猫看书、掌阅、书旗、咪咕阅读、17K、逐浪等阅读平台同步发布新书，让全网用户第一时间读到天蚕土豆的最新小说，共同见证发书时刻。纵横文学携手掌阅科技，阿里文学，咪咕文化，中文在线等行业领先公司，共同为书迷朋友们奉上这场阅读盛宴，让我们一起期待吧！','https://www.x23us.com/book/69123','https://www.x23us.com/html/69/69123/','https://www.x23us.com/files/article/image/69/69123/69123s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:03'),(69136,'飞剑问道','武侠修真','后记，许多年以后','我吃西红柿','2257991字','2019-05-02','连载中',NULL,'6160','70147','36797','在这个世界，有狐仙、河神、水怪、大妖，也有求长生的修行者。 修行者们， 开法眼，可看妖魔鬼怪。 炼一口飞剑，可千里杀敌。 千里眼、顺风耳，更可探查四方。 …… 秦府二公子‘秦云’，便是一位修行者……','https://www.x23us.com/book/69136','https://www.x23us.com/html/69/69136/','/modules/article/images/nocover.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:05'),(69624,'大道朝天','玄幻魔法','第二章不能入宫的理由','猫腻','2033800字','2019-07-23','连载中',NULL,'1938','27335','1992','千里杀一人，十步不愿行。（大道朝天官方一群，群号码：311875513，大道朝天官方二群，群号码：220593959，欢迎加入）','https://www.x23us.com/book/69624','https://www.x23us.com/html/69/69624/','https://www.x23us.com/files/article/image/69/69624/69624s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:15'),(69628,'大王饶命','都市言情','一个讲故事的人','会说话的肘子','3062630字','2019-04-15','连载中',NULL,'3257','39389','7447','灵气复苏的时代，寂静生活碎掉了，仿佛雷霆贯穿长空，电光直射天心，雨沙沙地落下。凡逆我们的终将死去，这就是法则。……这是一个吕树依靠毒鸡汤成为大魔王的故事。','https://www.x23us.com/book/69628','https://www.x23us.com/html/69/69628/','https://www.x23us.com/files/article/image/69/69628/69628s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:09'),(69629,'汉乡','历史军事','第五十九章 汉家儿','孑与2','4174748字','2019-07-23','连载中',NULL,'4149','67611','19495','我们接受了祖先的遗产，这让中华辉煌了数千年，我们是如此的心安理得，从未想过要回归那个在刀耕火种中苦苦寻找出路的时代。反哺我们苦难的祖先，并从中找到故乡的真正意义，将是本书要讲的故事。','https://www.x23us.com/book/69629','https://www.x23us.com/html/69/69629/','https://www.x23us.com/files/article/image/69/69629/69629s.jpg','顶点小说网--https://www.x23us.com','2019-07-24 00:00:13');
/*!40000 ALTER TABLE `book_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','深色主题theme-dark，浅色主题theme-light');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','星海科技',0,'星海','15888888888','yihur@qq.com','0','0','admin','2018-03-16 11:33:00','admin','2019-12-04 09:10:39'),(101,100,'0,100','杭州总公司',2,'星海','15888888888','yihur@qq.com','0','0','admin','2018-03-16 11:33:00','admin','2019-12-04 09:10:38'),(102,100,'0,100','长沙分公司',2,'星海','15888888888','yihur@qq.com','0','2','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00'),(103,101,'0,100,101','研发部门',1,'星海','15888888888','yihur@qq.com','0','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00'),(104,101,'0,100,101','市场部门',2,'星海','15888888888','yihur@qq.com','0','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00'),(105,101,'0,100,101','测试部门',3,'星海','15888888888','yihur@qq.com','0','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00'),(106,101,'0,100,101','财务部门',4,'星海','15888888888','yihur@qq.com','0','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00'),(107,101,'0,100,101','运维部门',5,'星海','15888888888','yihur@qq.com','0','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00'),(108,102,'0,100,102','市场部门',1,'星海','15888888888','yihur@qq.com','0','2','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00'),(109,102,'0,100,102','财务部门',2,'星海','15888888888','yihur@qq.com','0','2','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00'),(110,100,'0,100','总裁办',1,'yihur',NULL,NULL,'0','0','admin','2019-12-04 09:09:15','',NULL),(111,110,'0,100,110','秘书处',1,NULL,NULL,NULL,'0','0','admin','2019-12-04 09:09:39','',NULL),(112,110,'0,100,110','助理处',2,NULL,NULL,NULL,'0','0','admin','2019-12-04 09:10:04','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','关闭状态'),(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','新增操作'),(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','修改操作'),(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','删除操作'),(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','授权操作'),(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','导出操作'),(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','导入操作'),(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','强退操作'),(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','生成操作'),(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','清空操作'),(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','正常状态'),(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0 0/5 * * * ? ','3','1','1','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0 0/8 * * * ? ','3','1','1','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0 0/10 * * * ? ','3','1','1','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2019-11-11 22:04:27'),(101,'admin','127.0.0.1','内网IP','Unknown','Unknown','1','验证码错误','2019-11-11 22:55:21'),(102,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2019-11-11 22:59:34'),(103,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','1','验证码错误','2019-12-01 22:36:47'),(104,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-01 22:36:54'),(105,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-01 22:37:03'),(106,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-01 22:37:29'),(107,'admin','115.198.206.87','XX XX','Chrome','Windows 10','0','登录成功','2019-12-01 22:38:05'),(108,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-01 22:40:52'),(109,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-01 22:41:41'),(110,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-01 22:42:25'),(111,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-01 22:42:47'),(112,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-02 21:15:11'),(113,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-02 21:19:05'),(114,'admin','115.198.206.87','XX XX','Chrome','Windows 10','0','登录成功','2019-12-02 21:26:45'),(115,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','1','验证码错误','2019-12-02 21:26:49'),(116,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','1','验证码已失效','2019-12-02 21:26:50'),(117,'admin','115.198.206.87','XX XX','Chrome','Windows 10','0','登录成功','2019-12-02 21:26:58'),(118,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2019-12-02 21:28:10'),(119,NULL,'111.19.99.41','陕西 西安','Unknown','Unknown','1','验证码错误','2019-12-02 22:02:10'),(120,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','1','验证码已失效','2019-12-02 22:02:20'),(121,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','1','验证码已失效','2019-12-02 22:02:22'),(122,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','1','验证码已失效','2019-12-02 22:02:24'),(123,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-02 22:02:30'),(124,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-02 22:02:40'),(125,NULL,'111.19.99.41','陕西 西安','Unknown','Unknown','1','验证码错误','2019-12-02 22:02:49'),(126,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-02 22:03:43'),(127,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','1','验证码已失效','2019-12-02 22:06:23'),(128,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-02 22:07:01'),(129,'admin','111.19.99.41','陕西 西安','Unknown','Unknown','1','验证码错误','2019-12-02 22:15:04'),(130,'admin','111.19.99.41','陕西 西安','Unknown','Unknown','0','登录成功','2019-12-02 22:15:22'),(131,'admin','115.198.206.87','XX XX','Chrome','Windows 10','0','登录成功','2019-12-02 22:16:25'),(132,'admin','115.198.206.87','XX XX','Chrome','Windows 10','0','登录成功','2019-12-02 22:16:56'),(133,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-02 22:25:22'),(134,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-02 22:27:59'),(135,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','1','验证码已失效','2019-12-02 22:31:23'),(136,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-02 22:32:02'),(137,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','1','验证码已失效','2019-12-02 22:34:44'),(138,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-02 22:34:53'),(139,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','1','验证码已失效','2019-12-02 22:35:57'),(140,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-02 22:36:04'),(141,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','1','验证码已失效','2019-12-02 22:50:24'),(142,'admin','115.198.206.87','XX XX','Chrome','Windows 10','0','登录成功','2019-12-02 22:50:31'),(143,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-02 22:50:31'),(144,'admin','117.32.155.94','陕西 西安','Chrome','Windows 10','1','验证码已失效','2019-12-03 16:30:35'),(145,'admin','117.32.155.94','陕西 西安','Chrome','Windows 10','0','登录成功','2019-12-03 16:31:08'),(146,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-03 20:12:40'),(147,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-03 20:46:38'),(148,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-03 23:18:44'),(149,'admin','117.32.155.94','陕西 西安','Chrome','Windows 10','0','登录成功','2019-12-04 08:59:21'),(150,'admin','117.32.155.94','陕西 西安','Chrome','Windows 10','0','退出成功','2019-12-04 10:31:22'),(151,'admin','223.104.159.197','江苏 南京','Chrome','Windows 10','0','登录成功','2019-12-04 10:36:15'),(152,'admin','223.104.159.197','江苏 南京','Chrome','Windows 10','1','验证码已失效','2019-12-04 10:50:06'),(153,'admin','223.104.159.197','江苏 南京','Chrome','Windows 10','0','登录成功','2019-12-04 10:50:14'),(154,'admin','117.32.155.94','陕西 西安','Chrome','Windows 10','0','登录成功','2019-12-04 10:59:01'),(155,'admin','223.104.159.197','江苏 南京','Chrome Mobile','Android Mobile','0','登录成功','2019-12-04 12:19:17'),(156,'admin','42.120.74.88','浙江 杭州','Chrome','Mac OS X','0','登录成功','2019-12-04 14:08:25'),(157,'admin','140.205.147.71','上海 上海','Chrome','Mac OS X','0','登录成功','2019-12-04 14:11:30'),(158,'admin','42.120.74.88','浙江 杭州','Chrome','Mac OS X','0','退出成功','2019-12-04 15:01:48'),(159,'gpqiaof','42.120.74.88','浙江 杭州','Chrome','Mac OS X','0','登录成功','2019-12-04 15:01:59'),(160,'gpqiaof','42.120.74.88','XX XX','Chrome','Mac OS X','0','退出成功','2019-12-04 15:03:40'),(161,'admin','42.120.74.88','XX XX','Chrome','Mac OS X','0','登录成功','2019-12-04 15:03:48'),(162,'gpqiaof','117.32.155.94','XX XX','Chrome','Windows 10','0','登录成功','2019-12-04 15:04:40'),(163,'gpqiaof','117.32.155.94','陕西 西安','Chrome','Windows 10','0','退出成功','2019-12-04 15:05:05'),(164,'admin','117.32.155.94','陕西 西安','Chrome','Windows 10','0','登录成功','2019-12-04 15:05:11'),(165,'admin','117.32.155.94','陕西 西安','Chrome','Windows 10','0','退出成功','2019-12-04 15:18:31'),(166,'admin','117.32.155.94','陕西 西安','Chrome','Windows 10','1','用户不存在/密码错误','2019-12-04 15:18:41'),(167,'admin','117.32.155.94','陕西 西安','Chrome','Windows 10','1','验证码错误','2019-12-04 15:31:55'),(168,'admin','117.32.155.94','陕西 西安','Chrome','Windows 10','1','验证码已失效','2019-12-04 15:32:06'),(169,'admin','117.32.155.94','陕西 西安','Chrome','Windows 10','1','用户不存在/密码错误','2019-12-04 15:32:12'),(170,'admin','117.32.155.94','陕西 西安','Chrome','Windows 10','0','登录成功','2019-12-04 15:32:27'),(171,'admin','42.120.74.88','浙江 杭州','Chrome','Mac OS X','0','退出成功','2019-12-04 15:45:12'),(172,'admin','42.120.74.88','浙江 杭州','Chrome','Mac OS X','1','验证码错误','2019-12-04 15:54:13'),(173,'admin','42.120.74.88','浙江 杭州','Chrome','Mac OS X','0','登录成功','2019-12-04 15:54:22'),(174,'admin','42.120.74.88','XX XX','Chrome','Mac OS X','0','退出成功','2019-12-04 15:58:11'),(175,'gpqiaof','42.120.74.88','XX XX','Chrome','Mac OS X','1','验证码已失效','2019-12-04 15:58:24'),(176,'gpqiaof','42.120.74.88','浙江 杭州','Chrome','Mac OS X','0','登录成功','2019-12-04 15:58:30'),(177,'gpqiaof','42.120.74.88','浙江 杭州','Chrome','Mac OS X','0','退出成功','2019-12-04 16:00:43'),(178,'admin','42.120.74.88','浙江 杭州','Chrome','Mac OS X','0','登录成功','2019-12-04 16:00:55'),(179,'admin','1.80.223.212','陕西 西安','Chrome','Windows 7','0','登录成功','2019-12-04 16:13:56'),(180,'admin','42.120.74.88','浙江 杭州','Chrome','Mac OS X','0','退出成功','2019-12-04 17:21:16'),(181,'admin','111.18.44.3','XX XX','Chrome','Windows 10','0','登录成功','2019-12-04 21:25:26'),(182,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','1','验证码错误','2019-12-04 21:28:43'),(183,'admin','115.198.206.87','浙江 杭州','Chrome','Windows 10','0','登录成功','2019-12-04 21:28:50'),(184,'admin','115.198.206.87','XX XX','Chrome','Windows 10','1','用户不存在/密码错误','2019-12-04 21:43:38'),(185,'admin','115.198.206.87','XX XX','Chrome','Windows 10','0','登录成功','2019-12-04 21:43:50'),(186,'admin','42.120.74.116','浙江 杭州','Chrome','Mac OS X','0','登录成功','2019-12-05 09:35:11'),(187,'admin','42.120.74.116','浙江 杭州','Chrome','Mac OS X','0','登录成功','2019-12-05 09:50:53'),(188,'admin','42.120.74.116','浙江 杭州','Chrome','Mac OS X','0','登录成功','2019-12-05 10:08:05');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1060 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,1,'M','0','','system','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,1,'M','0','','monitor','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','系统监控目录'),(3,'系统工具',0,3,'tool',NULL,1,'M','0','','tool','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','系统工具目录'),(4,'星海官网',0,4,'http://www.gpqiaof.top/',NULL,0,'M','0','','guide','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','星海官网地址'),(100,'用户管理',1,1,'user','system/user/index',1,'C','0','system:user:list','user','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index',1,'C','0','system:role:list','peoples','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index',1,'C','0','system:menu:list','tree-table','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index',1,'C','0','system:dept:list','tree','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index',1,'C','0','system:post:list','post','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index',1,'C','0','system:dict:list','dict','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index',1,'C','0','system:config:list','edit','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index',1,'C','0','system:notice:list','message','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','通知公告菜单'),(108,'日志管理',1,9,'log','system/log/index',1,'M','0','','log','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index',1,'C','0','monitor:online:list','online','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index',1,'C','0','monitor:job:list','job','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index',1,'C','0','monitor:druid:list','druid','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index',1,'C','0','monitor:server:list','server','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','服务监控菜单'),(113,'表单构建',3,1,'build','tool/build/index',1,'C','0','tool:build:list','build','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','表单构建菜单'),(114,'代码生成',3,2,'server','tool/gen/index',1,'C','0','tool:gen:list','code','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','代码生成菜单'),(115,'系统接口',3,3,'swagger','tool/swagger/index',1,'C','0','tool:swagger:list','swagger','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index',1,'C','0','monitor:operlog:list','form','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index',1,'C','0','monitor:logininfor:list','logininfor','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','登录日志菜单'),(1001,'用户查询',100,1,'','',1,'F','0','system:user:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1002,'用户新增',100,2,'','',1,'F','0','system:user:add','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1003,'用户修改',100,3,'','',1,'F','0','system:user:edit','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1004,'用户删除',100,4,'','',1,'F','0','system:user:remove','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1005,'用户导出',100,5,'','',1,'F','0','system:user:export','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1006,'用户导入',100,6,'','',1,'F','0','system:user:import','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1007,'重置密码',100,7,'','',1,'F','0','system:user:resetPwd','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1008,'角色查询',101,1,'','',1,'F','0','system:role:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1009,'角色新增',101,2,'','',1,'F','0','system:role:add','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1010,'角色修改',101,3,'','',1,'F','0','system:role:edit','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1011,'角色删除',101,4,'','',1,'F','0','system:role:remove','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1012,'角色导出',101,5,'','',1,'F','0','system:role:export','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1013,'菜单查询',102,1,'','',1,'F','0','system:menu:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1014,'菜单新增',102,2,'','',1,'F','0','system:menu:add','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1015,'菜单修改',102,3,'','',1,'F','0','system:menu:edit','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1016,'菜单删除',102,4,'','',1,'F','0','system:menu:remove','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1017,'部门查询',103,1,'','',1,'F','0','system:dept:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1018,'部门新增',103,2,'','',1,'F','0','system:dept:add','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1019,'部门修改',103,3,'','',1,'F','0','system:dept:edit','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1020,'部门删除',103,4,'','',1,'F','0','system:dept:remove','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1021,'岗位查询',104,1,'','',1,'F','0','system:post:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1022,'岗位新增',104,2,'','',1,'F','0','system:post:add','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1023,'岗位修改',104,3,'','',1,'F','0','system:post:edit','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1024,'岗位删除',104,4,'','',1,'F','0','system:post:remove','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1025,'岗位导出',104,5,'','',1,'F','0','system:post:export','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1026,'字典查询',105,1,'#','',1,'F','0','system:dict:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1027,'字典新增',105,2,'#','',1,'F','0','system:dict:add','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1028,'字典修改',105,3,'#','',1,'F','0','system:dict:edit','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1029,'字典删除',105,4,'#','',1,'F','0','system:dict:remove','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1030,'字典导出',105,5,'#','',1,'F','0','system:dict:export','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1031,'参数查询',106,1,'#','',1,'F','0','system:config:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1032,'参数新增',106,2,'#','',1,'F','0','system:config:add','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1033,'参数修改',106,3,'#','',1,'F','0','system:config:edit','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1034,'参数删除',106,4,'#','',1,'F','0','system:config:remove','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1035,'参数导出',106,5,'#','',1,'F','0','system:config:export','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1036,'公告查询',107,1,'#','',1,'F','0','system:notice:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1037,'公告新增',107,2,'#','',1,'F','0','system:notice:add','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1038,'公告修改',107,3,'#','',1,'F','0','system:notice:edit','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1039,'公告删除',107,4,'#','',1,'F','0','system:notice:remove','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1040,'操作查询',500,1,'#','',1,'F','0','monitor:operlog:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1041,'操作删除',500,2,'#','',1,'F','0','monitor:operlog:remove','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1042,'日志导出',500,4,'#','',1,'F','0','monitor:operlog:export','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1043,'登录查询',501,1,'#','',1,'F','0','monitor:logininfor:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1044,'登录删除',501,2,'#','',1,'F','0','monitor:logininfor:remove','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1045,'日志导出',501,3,'#','',1,'F','0','monitor:logininfor:export','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1046,'在线查询',109,1,'#','',1,'F','0','monitor:online:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1047,'批量强退',109,2,'#','',1,'F','0','monitor:online:batchLogout','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1048,'单条强退',109,3,'#','',1,'F','0','monitor:online:forceLogout','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1049,'任务查询',110,1,'#','',1,'F','0','monitor:job:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1050,'任务新增',110,2,'#','',1,'F','0','monitor:job:add','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1051,'任务修改',110,3,'#','',1,'F','0','monitor:job:edit','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1052,'任务删除',110,4,'#','',1,'F','0','monitor:job:remove','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1053,'状态修改',110,5,'#','',1,'F','0','monitor:job:changeStatus','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1054,'任务导出',110,7,'#','',1,'F','0','monitor:job:export','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1055,'生成查询',114,1,'#','',1,'F','0','tool:gen:query','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1056,'生成修改',114,2,'#','',1,'F','0','tool:gen:edit','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1057,'生成删除',114,3,'#','',1,'F','0','tool:gen:remove','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1058,'预览代码',114,4,'#','',1,'F','0','tool:gen:preview','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(1059,'生成代码',114,5,'#','',1,'F','0','tool:gen:code','#','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 星海新版本发布啦','2','新版本内容','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','管理员'),(2,'维护通知：2018-07-01 星海系统凌晨维护','1','维护内容','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','117.32.155.94','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1521171180000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"yihur@qq.com\",\"nickName\":\"星海\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"星海\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"yihur\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1521171180000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 09:08:30'),(2,'部门管理',1,'com.scs.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/prod-api/system/dept','117.32.155.94','陕西 西安','{\"deptName\":\"总裁办\",\"leader\":\"yihur\",\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 09:09:15'),(3,'部门管理',1,'com.scs.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/prod-api/system/dept','117.32.155.94','陕西 西安','{\"deptName\":\"秘书处\",\"orderNum\":\"1\",\"params\":{},\"parentId\":110,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,110\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 09:09:39'),(4,'部门管理',1,'com.scs.project.system.controller.SysDeptController.add()','POST',1,'admin',NULL,'/prod-api/system/dept','117.32.155.94','陕西 西安','{\"deptName\":\"助理处\",\"orderNum\":\"2\",\"params\":{},\"parentId\":110,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,110\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 09:10:04'),(5,'部门管理',3,'com.scs.project.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/prod-api/system/dept/102','117.32.155.94','陕西 西安','{deptId=102}','{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}',0,NULL,'2019-12-04 09:10:10'),(6,'部门管理',3,'com.scs.project.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/prod-api/system/dept/109','117.32.155.94','陕西 西安','{deptId=109}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 09:10:14'),(7,'部门管理',3,'com.scs.project.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/prod-api/system/dept/108','117.32.155.94','陕西 西安','{deptId=108}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 09:10:16'),(8,'部门管理',3,'com.scs.project.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/prod-api/system/dept/102','117.32.155.94','陕西 西安','{deptId=102}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 09:10:19'),(9,'部门管理',2,'com.scs.project.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/prod-api/system/dept','117.32.155.94','陕西 西安','{\"deptName\":\"杭州总公司\",\"leader\":\"星海\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"yihur@qq.com\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 09:10:29'),(10,'部门管理',2,'com.scs.project.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/prod-api/system/dept','117.32.155.94','XX XX','{\"deptName\":\"杭州总公司\",\"leader\":\"星海\",\"deptId\":101,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"yihur@qq.com\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 09:10:39'),(11,'用户管理',1,'com.scs.project.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"phonenumber\":\"15114828779\",\"admin\":false,\"remark\":\"我相信我能改变世界，我相信明天\",\"password\":\"$2a$10$uwtJRrsQxmx5VRMVXldq2eim9QSyMdOh7o16hV/3NeVOh5.0aqPJ2\",\"postIds\":[4],\"email\":\"gpqiaof@163.com\",\"nickName\":\"莫慌\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"gpqiaof\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 15:01:42'),(12,'用户管理',3,'com.scs.project.system.controller.SysUserController.remove()','DELETE',1,'admin',NULL,'/prod-api/system/user/3','42.120.74.88','浙江 杭州','{userIds=3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 15:29:20'),(13,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"yihur@163.com\",\"nickName\":\"莫慌\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 15:29:31'),(14,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"yihur@163.com\",\"nickName\":\"莫慌\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 15:29:39'),(15,'用户管理',1,'com.scs.project.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"phonenumber\":\"15114828779\",\"admin\":false,\"remark\":\"一人江湖一人酒\",\"password\":\"gpqiaof\",\"postIds\":[],\"email\":\"gpqiaof@163.com\",\"nickName\":\"莫慌\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"gpqiaof\",\"roleIds\":[1],\"status\":\"0\"}','{\"msg\":\"新增用户\'gpqiaof\'失败，登录账号已存在\",\"code\":500}',0,NULL,'2019-12-04 15:32:07'),(16,'用户管理',1,'com.scs.project.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"phonenumber\":\"15114828778\",\"admin\":false,\"remark\":\"一个人的江湖\",\"password\":\"gpqiaof\",\"postIds\":[],\"nickName\":\"莫慌\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"gpqiaof\",\"roleIds\":[1],\"status\":\"0\"}','{\"msg\":\"新增用户\'gpqiaof\'失败，登录账号已存在\",\"code\":500}',0,NULL,'2019-12-04 15:32:55'),(17,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','117.32.155.94','陕西 西安','{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1521171180000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"yihur@qq.com\",\"nickName\":\"星海\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"星海科技\",\"leader\":\"星海\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"yihur\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1521171180000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 15:54:06'),(18,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','117.32.155.94','陕西 西安','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828779\",\"admin\":false,\"remark\":\"我相信我能改变世界，我相信明天\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"莫慌\",\"sex\":\"2\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"星海科技\",\"leader\":\"星海\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"gpqiaof\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1575442902000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 15:54:13'),(19,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','117.32.155.94','陕西 西安','{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1521171180000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"yihur@qq.com\",\"nickName\":\"星海\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"星海科技\",\"leader\":\"星海\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"yihur\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1521171180000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 15:54:34'),(20,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828779\",\"admin\":false,\"remark\":\"我相信我能改变世界，我相信明天\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"莫慌\",\"sex\":\"2\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"星海科技\",\"leader\":\"星海\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"gpqiaof\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1575442902000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 15:54:40'),(21,'用户管理',2,'com.scs.project.system.controller.SysUserController.resetPwd()','PUT',1,'admin',NULL,'/prod-api/system/user/resetPwd','117.32.155.94','陕西 西安','{\"admin\":false,\"password\":\"$2a$10$OG/M8ipeuXXw9j3gmc7m0ueTq5KAqRx8GDWXzCuC90m949X.uswTW\",\"updateBy\":\"admin\",\"params\":{},\"userId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 15:54:48'),(22,'个人信息',2,'com.scs.project.system.controller.SysProfileController.updateProfile()','PUT',1,'admin',NULL,'/prod-api/system/user/profile','42.120.74.88','浙江 杭州','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1521171180000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 16:43:20'),(23,'个人信息',2,'com.scs.project.system.controller.SysProfileController.updateProfile()','PUT',1,'admin',NULL,'/prod-api/system/user/profile','42.120.74.88','浙江 杭州','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1521171180000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2019-12-04 16:43:33'),(24,'用户头像',2,'com.scs.project.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/prod-api/system/user/profile/avatar','42.120.74.88','浙江 杭州','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"code\":200}',0,NULL,'2019-12-04 16:44:16'),(25,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:18'),(26,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:21'),(27,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:21'),(28,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:22'),(29,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:22'),(30,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:22'),(31,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:23'),(32,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:23'),(33,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:23'),(34,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:23'),(35,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:23'),(36,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:23'),(37,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:24'),(38,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:24'),(39,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:24'),(40,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:24'),(41,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:25'),(42,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','XX XX','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:25'),(43,'用户管理',2,'com.scs.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/prod-api/system/user','42.120.74.88','浙江 杭州','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15114828772\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1,3],\"loginIp\":\"127.0.0.1\",\"email\":\"gpqiaof@163.com\",\"nickName\":\"影疏（东海移花）\",\"sex\":\"0\",\"deptId\":111,\"avatar\":\"/profile/avatar/2019/12/04/b34ffc2899b85f0fdbd251441b8126a4.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"星海\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}','null',1,'不允许操作超级管理员用户','2019-12-04 16:45:55'),(44,'用户头像',2,'com.scs.project.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/prod-api/system/user/profile/avatar','115.198.206.87','XX XX','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2019/12/04/8b699aea420587943fc4cf73c8177921.jpeg\",\"code\":200}',0,NULL,'2019-12-04 21:40:40'),(45,'用户头像',2,'com.scs.project.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/prod-api/system/user/profile/avatar','115.198.206.87','浙江 杭州','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2019/12/04/1c68cd2ace2d75e1d4b463d3244fe200.jpeg\",\"code\":200}',0,NULL,'2019-12-04 21:47:34');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(2,'se','项目经理',2,'0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(3,'hr','人力资源',3,'0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00',''),(4,'user','普通员工',4,'0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'管理员','admin',1,'1','0','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','管理员'),(2,'普通角色','common',2,'2','0','0','admin','2018-03-16 11:33:00','yihur','2018-03-16 11:33:00','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2),(3,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mock_information'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-05 17:44:12
