# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.15)
# Database: tangsel
# Generation Time: 2016-11-29 18:40:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table tbl_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_account`;

CREATE TABLE `tbl_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `address` text,
  `kecamatan` text,
  `kelurahan` varchar(30) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_account` WRITE;
/*!40000 ALTER TABLE `tbl_account` DISABLE KEYS */;

INSERT INTO `tbl_account` (`id`, `username`, `email`, `password`, `address`, `kecamatan`, `kelurahan`, `phone_number`, `image`)
VALUES
	(13,'d','dhika@dhika.com','$2y$12$ZNFsQhecbceBW1XN900j1eK1yOR9sIgTl2RBnmGNi/IuC/cRmIuDG',NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `tbl_account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_event_mall
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_event_mall`;

CREATE TABLE `tbl_event_mall` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_places_mall` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_event_mall` WRITE;
/*!40000 ALTER TABLE `tbl_event_mall` DISABLE KEYS */;

INSERT INTO `tbl_event_mall` (`id`, `id_places_mall`, `name`, `image`, `date`, `description`)
VALUES
	(1,1,'Japanese Holiday Season','','2016-11-12','Meh tbh selvage enamel pin. Everyday carry kickstarter salvia beard fingerstache, pickled poutine kinfolk chia raw denim. Poke sartorial poutine affogato plaid. Gentrify deep v bitters poke fam portland. Cray health goth offal, cliche gastropub disrupt unicorn green juice enamel pin pug fam lumbersexual mixtape chillwave street art. Vexillologist pug echo park, next level 90\'s bitters bushwick etsy VHS pitchfork vape wayfarers umami heirloom poutine. Truffaut +1 whatever poke unicorn squid.\n\nSnackwave health goth VHS, edison bulb lyft mixtape celiac street art lo-fi messenger bag YOLO. Master cleanse austin trust fund migas, viral vegan locavore disrupt kinfolk meggings skateboard. Distillery microdosing pickled, blog williamsburg typewriter letterpress kogi chia affogato 3 wolf moon. Beard twee artisan viral vice la croix salvia single-origin coffee, williamsburg chia tote bag kombucha freegan biodiesel disrupt. Swag ethical mumblecore, flannel hashtag schlitz tacos tumeric. Pabst selfies banjo meh yr. Master cleanse stumptown gochujang, williamsburg truffaut cray migas roof party franzen kale chips meditation vaporware la croix.'),
	(2,1,'Dancing Water','','2016-11-15','Irony lomo four loko selfies, franzen glossier chillwave jianbing fingerstache mustache activated charcoal literally semiotics normcore. Kickstarter master cleanse 90\'s synth normcore. Wolf taxidermy aesthetic, biodiesel locavore flannel pickled. Unicorn letterpress cornhole, cardigan narwhal swag offal. Neutra edison bulb kale chips try-hard. Blue bottle forage hella food truck church-key deep v, pour-over mustache sustainable mumblecore pop-up raw denim salvia. Copper mug pinterest kitsch occupy af.\n'),
	(3,1,'Hanabi Performance','','2016-12-04','Bicycle rights forage thundercats synth austin tilde. Leggings butcher neutra kombucha sriracha direct trade, keffiyeh hot chicken. Pitchfork flannel polaroid before they sold out. +1 marfa keffiyeh activated charcoal, hammock flannel ugh knausgaard craft beer cliche jianbing. Locavore mixtape man bun swag, 8-bit scenester ramps. Snackwave tilde tofu, vexillologist chartreuse kickstarter lumbersexual raw denim taxidermy. Drinking vinegar raclette roof party shoreditch man braid gochujang, readymade stumptown godard small batch marfa pabst biodiesel.'),
	(4,2,'Chicken Dance','','2016-12-04','Roof party migas waistcoat, put a bird on it man braid try-hard bicycle rights kinfolk post-ironic fanny pack umami. Church-key put a bird on it mustache ramps, vaporware four loko XOXO hella authentic unicorn chartreuse la croix kale chips street art. Cred pinterest pop-up, waistcoat lumbersexual leggings mixtape iPhone. Pug sustainable heirloom 90\'s, franzen typewriter pork belly kinfolk jean shorts thundercats lomo disrupt occupy gastropub food truck. Swag biodiesel post-ironic banjo, you probably haven\'t heard of them freegan seitan deep v narwhal. Glossier microdosing disrupt put a bird on it, salvia keytar lomo lyft meggings butcher biodiesel fap. Poutine four loko iPhone food truck bespoke.'),
	(5,2,'Blood Donor','','2016-12-05','Gentrify scenester semiotics, migas actually fashion axe fap chillwave occupy tumblr umami tattooed brooklyn 8-bit marfa. Retro keytar synth locavore disrupt wayfarers af. Snackwave thundercats air plant prism cardigan seitan. PBR&B pok pok crucifix, small batch ramps raw denim health goth humblebrag selvage blue bottle beard flexitarian. Deep v polaroid meh offal, four dollar toast bespoke drinking vinegar paleo PBR&B tilde. Yr chia umami ennui bicycle rights, aesthetic vape small batch. Leggings succulents tilde, lo-fi art party normcore iceland shabby chic mumblecore authentic slow-carb biodiesel.\n\nTry-hard church-key 3 wolf moon plaid. Butcher tilde authentic, everyday carry cronut mixtape portland normcore bicycle rights narwhal polaroid. You probably haven\'t heard of them prism vegan, forage chicharrones fixie gentrify. Microdosing keffiyeh shoreditch, forage small batch brooklyn pour-over blog YOLO freegan meditation vexillologist gochujang chartreuse. Pok pok cliche photo booth, intelligentsia brunch pork belly trust fund skateboard etsy air plant migas. Kombucha marfa pok pok, cronut occupy four loko raclette prism keytar VHS. YOLO kogi narwhal humblebrag mustache.');

/*!40000 ALTER TABLE `tbl_event_mall` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_menu_resto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_menu_resto`;

CREATE TABLE `tbl_menu_resto` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_places_resto` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `price` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `image` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_menu_resto` WRITE;
/*!40000 ALTER TABLE `tbl_menu_resto` DISABLE KEYS */;

INSERT INTO `tbl_menu_resto` (`id`, `id_places_resto`, `name`, `price`, `description`, `image`)
VALUES
	(1,1,'Paket Hemat','27000','Gentrify scenester semiotics, migas actually fashion axe fap chillwave occupy tumblr umami tattooed brooklyn 8-bit marfa. Retro keytar synth locavore disrupt wayfarers af. Snackwave thundercats air plant prism cardigan seitan. PBR&B pok pok crucifix, small batch ramps raw denim health goth humblebrag selvage blue bottle beard flexitarian. Deep v polaroid meh offal, four dollar toast bespoke drinking vinegar paleo PBR&B tilde. Yr chia umami ennui bicycle rights, aesthetic vape small batch. Leggings succulents tilde, lo-fi art party normcore iceland shabby chic mumblecore authentic slow-carb biodiesel.',''),
	(2,1,'Paket Bebek 1','35000','Try-hard church-key 3 wolf moon plaid. Butcher tilde authentic, everyday carry cronut mixtape portland normcore bicycle rights narwhal polaroid. You probably haven\'t heard of them prism vegan, forage chicharrones fixie gentrify. Microdosing keffiyeh shoreditch, forage small batch brooklyn pour-over blog YOLO freegan meditation vexillologist gochujang chartreuse. Pok pok cliche photo booth, intelligentsia brunch pork belly trust fund skateboard etsy air plant migas. Kombucha marfa pok pok, cronut occupy four loko raclette prism keytar VHS. YOLO kogi narwhal humblebrag mustache.',''),
	(3,1,'Paket Ayam Kampung','30000','Deep v polaroid meh offal, four dollar toast bespoke drinking vinegar paleo PBR&B tilde. Yr chia umami ennui bicycle rights, aesthetic vape small batch. Leggings succulents tilde, lo-fi art party normcore iceland shabby chic mumblecore authentic slow-carb biodiesel.',''),
	(4,2,'Whooper','40000','Jianbing tumblr paleo unicorn before they sold out, crucifix chambray PBR&B cliche direct trade coloring book. Locavore intelligentsia ramps kale chips vape. Pitchfork you probably haven\'t heard of them succulents, fam heirloom drinking vinegar health goth. Seitan williamsburg hashtag jianbing vaporware, copper mug austin typewriter. Banh mi pour-over enamel pin, snackwave direct trade quinoa street art lomo vape franzen mixtape flexitarian. Literally vape ramps, jianbing seitan kinfolk cred raclette knausgaard. Mixtape asymmetrical williamsburg, seitan celiac coloring book +1 locavore iPhone bicycle rights.',''),
	(5,2,'Smoked Beef Burger','45000','Tilde sartorial marfa pork belly, man braid kickstarter twee post-ironic kale chips. Fashion axe direct trade farm-to-table, dreamcatcher prism intelligentsia la croix hell of narwhal flannel retro kinfolk wolf. Umami meditation viral edison bulb, microdosing scenester 90\'s wolf try-hard chillwave affogato ethical shoreditch mlkshk flannel. Pickled celiac kombucha kickstarter, gentrify yr meh marfa sustainable tilde brunch wayfarers. Everyday carry +1 humblebrag kogi butcher, echo park 8-bit. Bushwick post-ironic microdosing, echo park distillery helvetica kombucha pinterest af whatever live-edge glossier. Food truck viral kale chips, sustainable hell of 90\'s plaid slow-carb.',''),
	(6,2,'Whooper Jr.','40000','Shabby chic 8-bit fixie, semiotics pinterest master cleanse meditation cray poke poutine trust fund. Hashtag ennui next level, raclette hoodie mustache single-origin coffee migas sustainable. Irony vice man braid vinyl salvia schlitz mixtape, brooklyn authentic bespoke retro poke. Snackwave man bun yr, drinking vinegar austin keffiyeh copper mug intelligentsia church-key cred. Sartorial trust fund sustainable everyday carry crucifix. Blue bottle meditation marfa +1 shabby chic waistcoat seitan. Hexagon kickstarter drinking vinegar fingerstache, whatever ugh distillery semiotics organic.',''),
	(7,2,'Chicken Wings','30000','Food truck skateboard YOLO, bespoke brooklyn live-edge thundercats. Twee try-hard lomo irony umami mustache. Pok pok pop-up everyday carry deep v single-origin coffee, trust fund health goth shabby chic williamsburg tousled meditation. Messenger bag PBR&B etsy organic, next level pop-up vegan. Butcher lyft gluten-free, etsy thundercats distillery man braid everyday carry stumptown sriracha single-origin coffee 3 wolf moon cold-pressed pop-up glossier. Asymmetrical swag brunch, small batch marfa hammock organic tbh vice occupy venmo wolf ugh. Jianbing heirloom vegan hot chicken single-origin coffee blog chicharrones dreamcatcher coloring book, chia messenger bag.',''),
	(8,3,'Happy Meal','45000','Craft beer distillery selvage, etsy skateboard fashion axe try-hard dreamcatcher irony tilde. Austin drinking vinegar biodiesel, chia snackwave unicorn 8-bit vaporware helvetica tilde green juice yuccie farm-to-table squid. Ugh master cleanse organic migas deep v. Marfa PBR&B before they sold out, knausgaard blog selfies live-edge aesthetic everyday carry vice edison bulb literally copper mug distillery typewriter. Polaroid chia letterpress hashtag try-hard poke roof party meggings 8-bit. Art party subway tile whatever, farm-to-table actually knausgaard gastropub. Skateboard gochujang letterpress biodiesel roof party, 90\'s live-edge pabst hot chicken vape fam cray fashion axe.',''),
	(9,3,'Cheese Burger','15000','Godard gastropub pour-over activated charcoal, jean shorts readymade pork belly. Tousled normcore ethical, brooklyn tbh bitters chia trust fund bushwick. Godard pour-over mumblecore hoodie, gentrify single-origin coffee pork belly woke raclette kinfolk. Glossier iPhone blog, tote bag af YOLO cronut typewriter vaporware waistcoat. Shabby chic asymmetrical waistcoat, la croix occupy portland subway tile polaroid literally crucifix kale chips af 3 wolf moon. Hot chicken schlitz etsy, artisan woke cardigan pickled cray. Hella yr semiotics pok pok normcore.','');

/*!40000 ALTER TABLE `tbl_menu_resto` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_places_mall
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_places_mall`;

CREATE TABLE `tbl_places_mall` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `lat` varchar(100) NOT NULL DEFAULT '',
  `long` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_places_mall` WRITE;
/*!40000 ALTER TABLE `tbl_places_mall` DISABLE KEYS */;

INSERT INTO `tbl_places_mall` (`id`, `name`, `lat`, `long`, `image`)
VALUES
	(1,'AEON Mall','1.11','3.11',''),
	(2,'Teras Kota','2.33','5.44',''),
	(3,'BSD Plaza','3.22','4.66','');

/*!40000 ALTER TABLE `tbl_places_mall` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_places_resto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_places_resto`;

CREATE TABLE `tbl_places_resto` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `lat` varchar(100) NOT NULL DEFAULT '',
  `long` varchar(100) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `open` time NOT NULL,
  `close` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_places_resto` WRITE;
/*!40000 ALTER TABLE `tbl_places_resto` DISABLE KEYS */;

INSERT INTO `tbl_places_resto` (`id`, `name`, `lat`, `long`, `image`, `open`, `close`)
VALUES
	(1,'Bebek Kaleyo','-6.320577','106.682102','','09:30:00','22:30:00'),
	(2,'Burger King','-6.297796','106.666308','','10:00:00','22:00:00'),
	(3,'McDonald BSD Sunburst','-6.298937','106.664430','','00:00:00','23:59:00');

/*!40000 ALTER TABLE `tbl_places_resto` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_promo_resto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_promo_resto`;

CREATE TABLE `tbl_promo_resto` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_places_resto` int(11) NOT NULL,
  `description` text NOT NULL,
  `periode` varchar(30) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_promo_resto` WRITE;
/*!40000 ALTER TABLE `tbl_promo_resto` DISABLE KEYS */;

INSERT INTO `tbl_promo_resto` (`id`, `id_places_resto`, `description`, `periode`, `image`)
VALUES
	(1,1,'Roof party tilde art party af, bicycle rights retro gochujang single-origin coffee before they sold out. Jean shorts dreamcatcher fam food truck blue bottle. Af biodiesel humblebrag plaid snackwave. Actually drinking vinegar keffiyeh, 3 wolf moon live-edge vinyl jianbing pop-up distillery chillwave polaroid cronut disrupt four dollar toast. Sriracha tacos pop-up, chambray vexillologist enamel pin portland ennui beard tousled','2 - 10 Desember 2016',''),
	(2,1,'Waistcoat photo booth live-edge pinterest vice, irony 8-bit celiac flannel lomo semiotics street art neutra food truck. Synth plaid health goth, godard vice 8-bit helvetica chambray salvia ethical.','1 Desember 2016',''),
	(3,1,'Af DIY seitan viral, scenester drinking vinegar tilde vape lo-fi poke fanny pack echo park pork belly subway tile. Biodiesel kogi slow-carb, lyft jianbing wolf health goth yuccie vape tacos letterpress mlkshk plaid waistcoat bitters. Chartreuse scenester tacos glossier vaporware man braid. Gluten-free deep v lyft tbh. Keffiyeh neutra shabby chic hell of normcore ramps.','31 November 2016',''),
	(4,2,'Godard gastropub pour-over activated charcoal, jean shorts readymade pork belly. Tousled normcore ethical, brooklyn tbh bitters chia trust fund bushwick. Godard pour-over mumblecore hoodie, gentrify single-origin coffee pork belly woke raclette kinfolk','31 November 2016',''),
	(5,2,'Glossier iPhone blog, tote bag af YOLO cronut typewriter vaporware waistcoat. Shabby chic asymmetrical waistcoat, la croix occupy portland subway tile polaroid literally crucifix kale chips af 3 wolf moon. Hot chicken schlitz etsy, artisan woke cardigan pickled cray. Hella yr semiotics pok pok normcore.','30 November 2016',''),
	(6,3,'Poke post-ironic locavore, you probably haven\'t heard of them 8-bit tumblr woke yr gluten-free ennui prism franzen organic farm-to-table tilde. Bespoke migas messenger bag, organic next level meggings pitchfork small batch enamel pin hell of occupy.\n','15 Desember 2016','');

/*!40000 ALTER TABLE `tbl_promo_resto` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_token`;

CREATE TABLE `tbl_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_account` int(11) NOT NULL,
  `token` varchar(100) NOT NULL DEFAULT '',
  `device` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
