/*
Navicat MySQL Data Transfer

Source Server         : Ry
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : white_jotter

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-02-14 11:57:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `author` varchar(255) DEFAULT '',
  `date` varchar(20) DEFAULT '',
  `press` varchar(255) DEFAULT '',
  `abs` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL,
  `price` double(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_book_category_on_cid` (`cid`),
  CONSTRAINT `fk_book_category_on_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'https://i.loli.net/2019/04/10/5cadaa0d0759b.jpg', '且在人间', '余秀华', '2019-2-1', '湖南文艺出版社', '诗人余秀华中篇小说首次结集出版。\\r\\n\\r\\n        《且在人间》——以余秀华为生活原型，讲述一个残疾女人悲苦倔强、向死而生的故事。\\r\\n\\r\\n        女主人公周玉生活在乡村，患有“脑瘫”，她几乎被所有人漠视，甚至被整个社会抛弃，但是她渴望被当成一个普通的健康人,而不是带着怜悯或不屑，她只要求平等。爱情的缺 失，家庭的不幸，生活的种种际遇让周玉用诗歌的方式把 情感抒发出来，最终她用诗歌创作出了一个文学的世界，得到了人们的认可。', '1', '9', '20.00');
INSERT INTO `book` VALUES ('2', 'https://i.loli.net/2019/04/10/5cada7e73d601.jpg', '三体', '刘慈欣', ' 2008-1', '重庆出版社', '文化大革命如火如荼进行的同时。军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。地球文明向宇宙发出的第一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……\r\n\r\n四光年外，“三体文明”正苦苦挣扎——三颗无规则运行的太阳主导下的百余次毁灭与重生逼迫他们逃离母星。而恰在此时。他们接收到了地球发来的信息。在运用超技术锁死地球人的基础科学之后。三体人庞大的宇宙舰队开始向地球进发……\r\n\r\n人类的末日悄然来临。', '2', '8', '33.50');
INSERT INTO `book` VALUES ('32', 'https://i.loli.net/2019/04/10/5cada99bd8ca5.jpg', '叙事的虚构性', '[美] 海登·怀特 ', '2019-3', '南京大学出版社', '海登•怀特被誉为人类伟大的思想家之一。从1973年出版具有里程碑意义的专著《元史学》以来，怀特的作品对于历史学、文学研究、人类学、哲学、艺术史、电影传媒研究等将叙事学作为关注焦点的学科而言意义非凡。\n\n本书由罗伯特•多兰作序，他巧妙地将怀特重要但难得一见的文章汇集成册，研究探讨他关于历史书写和叙事的革命性理论。怀特的这些文章大多采用论文体，内容涉及多位思想家，探讨诸多主题，文笔犀利，语言优美。\n\n《叙事的虚构性》追溯怀特重要思想的演变轨迹，是历史编纂学者和学习者、历史理论和文学研究学者们的重要读物。', '3', '10', '27.30');
INSERT INTO `book` VALUES ('35', 'https://i.loli.net/2019/04/10/5cada940e206a.jpg', '圣母', '[日]秋吉理香子 ', '2019-3', '新星出版社', '一起男童被害案搅得蓝出市人心惶惶。\n\n好不容易怀孕生产的保奈美抱紧年幼的孩子，立誓要不惜任何代价保护她。\n\n男人是在孩子出生后才成为父亲的，但女人，是从小生命来到体内的那一瞬间起，就是母亲了。患有不孕症的保奈美是经历过艰辛的治疗过程才终于有了孩子的，她不允许这起命案威胁到宝贵的孩子！\n\n母亲，就是要消除所有对子女的威胁，每一位母亲都应肩负这样的使命，这是神圣的天职！', '1', '10', '28.51');
INSERT INTO `book` VALUES ('37', 'https://i.loli.net/2019/04/10/5cada8986e13a.jpg', '奢侈与逸乐', '[英]马克辛·伯格', '2019-3', '中国工人出版社', '本书探讨了十八世纪英国新式、时尚的消费品的发明、制造和购买。', '3', '10', '29.71');
INSERT INTO `book` VALUES ('38', 'https://i.loli.net/2019/04/10/5cada8b8a3a17.jpg', '忧伤动物', '[德]莫妮卡·马龙 ', '2019-4', '漓江出版社', '“忧伤动物”(animal triste)这个词组取自一句最早可以追溯到亚里士多德时代的拉丁语名言，即“欢爱后，每个动物都忧伤不已”（Post coitum omne animal triste est）。无疑，这部冠以如此标题的小说让人有不祥的预感并暗示着宿命的思想。小说的女主人公是位近乎百岁的老人。在多年前有意斩断了与外界的一切联系之后，在她的后半生里，她唯一能做的就是或躺或坐在“印着鲜红、艳绿和深紫色的大花”、让人想起“食肉植物的花朵”的床单上，追忆几十年前她和自己...', '1', '10', '30.00');
INSERT INTO `book` VALUES ('54', 'https://i.loli.net/2019/04/10/5cada9d9d23a6.jpg', '爱界', '[英] 费伊·韦尔登 ', '2019-3-1', '人民文学出版社', '去不去爱，爱的界限何在，一直是普拉克西丝的人生课题。\n\n年迈的她独自待在肮脏而昏暗的地下室里，想写回忆录，可她该写些什么呢？是写父母未婚同居生下了她，她还年幼天真无邪时，母女就遭父亲抛弃？还是写她曾经或是主动或是被动地成了未婚同居者、妻子、情人、母亲、后母？还是写她两年的牢狱生活？她想描绘二十世纪女性的众生相，想记录女性群体在情感、灵魂和思想方面所处的三重困境，想道出女性之间的大爱如何铸成姐妹之谊。', '3', '10', '30.00');
INSERT INTO `book` VALUES ('55', 'https://i.loli.net/2019/04/10/5cada824c7119.jpg', '密室中的旅行', '[美] 保罗·奥斯特 ', '2019-3', '九州出版社', '一旦被抛进这个世界，我们就永远不会消失，即使造物者已经死去。\n\n.\n\n布兰克先生发现自己被囚禁在一个陌生的房间里，对过去的身份和经历一无所知。桌上有四叠六英寸厚的文稿，其中有一份未完待续的囚犯自述；还有一叠似曾相识的照片，照片中的人物将逐一登场。他续写了那个囚犯的故事，却发现自己正在经历的一切也早已被记录在文稿中……', '1', '10', '30.00');
INSERT INTO `book` VALUES ('59', 'https://i.loli.net/2019/04/10/5cada87fd5c72.jpg', '基本穿搭', '[日]大山旬 ', '2019-3', '四川人民出版社', '对穿衣搭配感到不耐烦，认为时尚很麻烦，穿什么都可以或者对衣服有着自己的想法但不够自信，本书就是为这样的人而准备的穿衣指南。不需要追随瞬息万变的时尚潮流，也不需要烦恼色彩搭配，只要掌握最低限度的知识和备齐常规单品，谁都能完成清爽得体的 80分搭配。', '4', '10', '30.00');
INSERT INTO `book` VALUES ('60', 'https://i.loli.net/2019/04/10/5cada976927da.jpg', '冒牌人生', '陈思安', '2019-4', '四川文艺出版社', '《冒牌人生》收录了十篇短篇小说。十个故事分别以城市中的怪人为主角，他们默默无闻地生存在城市主流生活的边缘地带：或是等待手术的性别认同障碍者，或是武艺高强而深藏不露的夜市摊主，或是卧底追凶的底层保安，或是甘于...', '1', '10', '30.00');
INSERT INTO `book` VALUES ('61', 'https://i.loli.net/2019/04/10/5cada9202d970.jpg', '战争哀歌', '[越]保宁 ', '2019-4', '湖南文艺出版社', '《战争哀歌》超越了战争，战争是它的背景，它的内核是关于逝去的青春，关于美和伤痛！\n\n一场突如其来的战争打碎了阿坚和阿芳这对年轻情侣的生活，在血肉横飞的战争中，主人公阿坚成了幸存者，但战争带来的伤痛还远远没有平息。那些经历仍旧萦绕在阿坚的生活之中，被战争毁灭的不仅 仅是阿坚， 阿芳也遭遇了难以想象的梦魇。时间越长，阿坚越觉得自己不是活着，而是被困在这人世间。', '1', '10', '30.00');
INSERT INTO `book` VALUES ('62', 'https://i.loli.net/2019/04/10/5cada9c852298.jpg', '胡椒的全球史', '[美] 玛乔丽·谢弗 ', '2019-3', '上海三联出版社', '看似不起眼的胡椒，却是家家餐桌必备。在中世纪时，更是欧洲达官显贵们的最爱、财富与地位的象征。黑胡椒原产于印度，距离欧洲各港口有十万八千里之远，取之向来不易。商人们对其供应来源不遗余力的追寻，成为世界史上一股重要的推动力量，促成全球贸易的兴起，重新划定了世界经济版图。', '2', '10', '30.00');
INSERT INTO `book` VALUES ('63', 'https://i.loli.net/2019/04/10/5cada962c287c.jpg', '与病对话', '胡冰霜', '2019-3-31', '北京联合出版公司', '一部融合科普性与趣味性、兼具心理学与哲学意味的医学散文。\n\n一位满怀仁心的资深医者对几十年行医生涯的回望与省思。\n\n全书以真实的病例和鲜活的故事贯穿始终，作者从一位全科医生、心理学者的视角观察、解读疾病与患者身心之关系，厘清大众对诸多常见疾病的误解...', '1', '10', '30.00');
INSERT INTO `book` VALUES ('64', 'https://i.loli.net/2019/04/10/5cada858e6019.jpg', '上帝笑了99次', '[英]彼得·凯弗', '2019-2', '北京联合出版公司', '一只美洲羊驼会坠入爱河吗？机器人能变成人吗？怎样才能不赢得公主青睐？人类一思考，上帝就发笑。在99个奇妙、怪诞、滑稽的问题背后，其实是99个烧脑的哲学、道德、法律领域的经典悖论，也是99道极富挑战性的大思考测试。本书内容覆盖了大多数常见哲学话题，包括形而上学、逻辑学、伦理学、语言哲学、政治哲学、自我认知、人际关系、美学、存在主义等，还配有20多幅漫画插图。在锻炼思维之外，本书也能帮我们建立个性化的哲学知识体系。', '2', '10', '30.00');
INSERT INTO `book` VALUES ('65', 'https://i.loli.net/2019/04/10/5cada8e1aa892.jpg', '互联网算法', '[美] 菲斯曼等 ', '2019-4', '江西人民出版社', '只要你租过房子、上网买过东西、自己经营过企业，那么你就处在商业变革的前线。在这场变革中，亚马逊、谷歌、优步等不同以往的企业取得了史无前例的成功，而促成这场变革的不只是科技进步，还有经济学思想。\n\n在这本趣味横生的书中，我们会看到，经济思想的革命远比科技革命更宏大。从谷歌广告的算法，到网上购物规避欺诈，都要依靠经济学家建立的经济模型，甚至连互联网公司...', '6', '10', '30.00');
INSERT INTO `book` VALUES ('66', 'https://i.loli.net/2019/04/10/5cada9ec514c9.jpg', '七侯笔录', '马伯庸', '2019-4-15', '湖南文艺出版社', '一个关于文化的离奇故事，一段关于文人的壮丽传说。\n\n几千年来，每一位风华绝代的文人墨客辞世之时，都会让自己的灵魂寄寓在一管毛笔之中。他们身躯虽去，才华永存，这些伟大的精神凝为性情不一的笔灵，深藏于世间，只为一句“不教天下才情付诸东流”的誓言。其中最伟大的七位古人，他们所凝聚的七管笔灵，被称为“管城七侯”。\n\n一位不学无术的现代少年，无意中邂逅了李白的青莲笔，命运就此与千年之前的诗仙交织一处，并为他开启了一个叫作笔冢的神秘世界。', '3', '10', '30.00');
INSERT INTO `book` VALUES ('67', 'http://localhost:8443/api/file/1uk2tv.jpg', '钢铁是怎样炼成的', '[美] 希尔斯', '2019-3', '译林出版社', '美国著名社会学家爱德华·希尔斯的主要研究成果包括他对“克里斯玛”、“中心”和“边缘”等概念的解释，以及他对“大众社会”一词的修正，这些研究对分析政治和文化领导力以及社会凝聚力具有重要价值。本书对希尔斯数十载社会理论研究进行了全面而详细的总结，为解释与探究当代社会的结构与变化提供了极具科学性的参考依据。', '3', '10', '30.00');
INSERT INTO `book` VALUES ('68', 'https://i.loli.net/2019/04/10/5cad643643d4c.jpg', '水浒群星闪耀时', '李黎', '2019-4', '上海文艺出版社', '本书以众所周知的梁山英雄为写作对象，重点书写其上山后、招安前的日常生活，涉及他们的喜怒哀乐、同类中人、乡愁怀旧、未来憧憬、命运追问等。书中涉及宋江、武松、鲁智深、李俊、燕青等等耳熟能详的人物而显得有些“改编”与水浒研究的意味，但鉴于所有人物皆为虚构，本书稿的内容是虚构之上的虚构，旨在宏大叙事的语境下突出个人的细微之处和命运感。', '1', '10', '30.00');
INSERT INTO `book` VALUES ('69', 'https://i.loli.net/2019/04/10/5cad63931ce27.jpg', '谋杀狄更斯', '[美] 丹·西蒙斯 ', '2019-4', '上海文艺出版社', '“狄更斯的那场意外灾难发生在1865年6月9日，那列搭载他的成功、平静、理智、手稿与情妇的火车一路飞驰，迎向铁道上的裂隙，突然触目惊心地坠落了。”', '1', '10', '30.00');
INSERT INTO `book` VALUES ('70', 'https://i.loli.net/2019/04/10/5cad63f99f519.jpg', '像艺术家一样思考', '[英] 威尔·贡培兹', '2019-4', '湖南美术出版社', '归纳成就艺术大师的 10 个关键词\n\n揭示大师们的创作秘辛\n\n凝聚 BBC 艺术频道主编威尔·贡培兹职业生涯的所见、所知、所想\n\n·\n\n威尔·贡培兹是你能遇到的最好的老师\n\n——《卫报》', '1', '11', '30.50');

-- ----------------------------
-- Table structure for book_borrow
-- ----------------------------
DROP TABLE IF EXISTS `book_borrow`;
CREATE TABLE `book_borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) DEFAULT NULL,
  `borrid` int(11) DEFAULT NULL,
  `btime` varchar(255) DEFAULT NULL,
  `etime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_borrow
-- ----------------------------
INSERT INTO `book_borrow` VALUES ('1', '1', '1', '2020-1-1', '2020-2-1');
INSERT INTO `book_borrow` VALUES ('4', '2', '2', '2020-1-1', '2020-3-1');
INSERT INTO `book_borrow` VALUES ('14', '1', '5', '2020-1-2', '2020-2-2');

-- ----------------------------
-- Table structure for borrower
-- ----------------------------
DROP TABLE IF EXISTS `borrower`;
CREATE TABLE `borrower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tele` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrower
-- ----------------------------
INSERT INTO `borrower` VALUES ('1', 'gyz', '123456');
INSERT INTO `borrower` VALUES ('2', '幸平创真', '456789');
INSERT INTO `borrower` VALUES ('5', 'OK', '999999');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '文学');
INSERT INTO `category` VALUES ('2', '流行');
INSERT INTO `category` VALUES ('3', '文化');
INSERT INTO `category` VALUES ('4', '生活');
INSERT INTO `category` VALUES ('5', '经管');
INSERT INTO `category` VALUES ('6', '科技');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123');
INSERT INTO `user` VALUES ('2', 'mmk', '123');
