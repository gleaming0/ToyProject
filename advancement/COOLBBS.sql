CREATE TABLE bbs_info (
  code varchar(10) NOT NULL default '',
  name varchar(20) default NULL,
  title varchar(100) default NULL,
  head text,
  foot text,
  use_file char(1) default NULL,
  scale smallint(6) default NULL,
  page_scale smallint(6) default NULL,
  use_new char(1) default NULL,
  new_time smallint(6) default NULL,
  use_cool char(1) default NULL,
  no_cool smallint(6) default NULL,
  admin_id varchar(10) default NULL,
  admin_pw varchar(8) default NULL,
  mail_notice char(1) default NULL,
  admin_mail varchar(40) default NULL,
  reg_date datetime default NULL,
  use_auth char(1) default NULL,
  auth_id varchar(10) default NULL,
  auth_pw varchar(8) default NULL,
  PRIMARY KEY  (code)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO bbs_info VALUES ('test','test','test','<HTML>\r\n<HEAD>\r\n<TITLE>loveme\\\'s Free BBS</TITLE>\r\n<STYLE TYPE=text/css>\r\n<!--\r\ntd	{ font-family:굴림체,굴림;font-size:10pt}\r\na:link	{ font-family:굴림,굴림체; font-size:10pt;color:#003355; text-decoration:none; }\r\na:visited  { font-family:굴림,굴림체; font-size:10pt; text-decoration: none; }\r\n-->\r\n</STYLE>\r\n</HEAD>\r\n<BODY BGCOLOR=\\\'#006699\\\' LINK=\\\'#99CCFF\\\' VLINK=\\\'#99CCCC\\\' TEXT=\\\'#FFFFFF\\\' >\r\n<center>\r\n<img src=./img/bbstitle.gif border=0 >\r\n<BR>\r\n',' \r\n</center>\r\n</body>\r\n</html>\r\n','y',10,10,'y',24,'y',30,'admin','djemals','','yourmail@yoururl.com','2006-09-29 08:36:08','','','');


CREATE TABLE passwd (
  code char(8) NOT NULL default '',
  userid char(10) default NULL,
  passwd char(10) default NULL,
  PRIMARY KEY  (code)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



INSERT INTO passwd VALUES ('root','admin','djemals');



CREATE TABLE test (
  id int(11) NOT NULL auto_increment,
  name varchar(30) default NULL,
  mail varchar(40) default NULL,
  home varchar(40) default NULL,
  title varchar(80) default NULL,
  body text,
  reg_date datetime default NULL,
  count int(11) default NULL,
  thread int(11) default NULL,
  depth smallint(6) default NULL,
  pos int(11) default NULL,
  passwd varchar(8) default NULL,
  user_file varchar(50) default NULL,
  user_ip varchar(20) default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



INSERT INTO test VALUES (1,'mjh','hack@hacker.en','','mjh','hello world!!!','2023-01-04 10:24:48',1,1,1,191,'1234','./test/MM.PHP','175.202.102.108');
INSERT INTO test VALUES (2,'mjh','hack@hacker.en','','mjh','hello world!!!','2023-01-04 10:24:49',1,2,1,190,'1234','./test/MM.PHP','175.202.102.108');
INSERT INTO test VALUES (3,'mjh','hack@hacker.en','','mjh','hello world!!!','2023-01-04 10:24:49',1,3,1,189,'1234','./test/MM.PHP','175.202.102.108');
INSERT INTO test VALUES (4,'mjh','hack@hacker.en','','mjh','hello world!!!','2023-01-04 10:24:49',1,4,1,188,'1234','./test/MM.PHP','175.202.102.108');
INSERT INTO test VALUES (5,'mjh','hack@hacker.en','','mjh','hello world!!!','2023-01-04 10:24:49',1,5,1,187,'1234','./test/MM.PHP','175.202.102.108');
INSERT INTO test VALUES (6,'mjh','hack@hacker.en','','mjh','hello world!!!','2023-01-04 10:24:49',1,6,1,186,'1234','./test/MM.PHP','175.202.102.108');
INSERT INTO test VALUES (7,'mjh','hack@hacker.en','','mjh','hello world!!!','2023-01-04 10:24:49',1,7,1,185,'1234','./test/MM.PHP','175.202.102.108');
INSERT INTO test VALUES (8,'mjh','hack@hacker.en','','mjh','hello world!!!','2023-01-04 10:24:49',1,8,1,184,'1234','./test/MM.PHP','175.202.102.108');
INSERT INTO test VALUES (9,'mjh','hack@hacker.en','','mjh','hello world!!!','2023-01-04 10:24:49',1,9,1,183,'1234','./test/MM.PHP','175.202.102.108');
INSERT INTO test VALUES (10,'mjh','hack@hacker.en','','mjh','hello world!!!','2023-01-04 10:24:49',4,10,1,182,'1234','./test/MM.PHP','175.202.102.108');
INSERT INTO test VALUES (11,'msh','msh@msh.kr','msh','msh','msh','2023-01-04 10:25:30',1,11,1,181,'msh','./test/webshell3.PHP','175.202.102.108');
INSERT INTO test VALUES (12,'msh','msh@msh.kr','msh','msh','msh','2023-01-04 10:25:30',1,12,1,180,'msh','./test/webshell3.PHP','175.202.102.108');
INSERT INTO test VALUES (13,'msh','msh@msh.kr','msh','msh','msh','2023-01-04 10:25:30',1,13,1,179,'msh','./test/webshell3.PHP','175.202.102.108');
INSERT INTO test VALUES (14,'msh','msh@msh.kr','msh','msh','msh','2023-01-04 10:25:30',1,14,1,178,'msh','./test/webshell3.PHP','175.202.102.108');
INSERT INTO test VALUES (15,'msh','msh@msh.kr','msh','msh','msh','2023-01-04 10:25:30',1,15,1,177,'msh','./test/webshell3.PHP','175.202.102.108');
INSERT INTO test VALUES (16,'msh','msh@msh.kr','msh','msh','msh','2023-01-04 10:25:30',1,16,1,176,'msh','./test/webshell3.PHP','175.202.102.108');
INSERT INTO test VALUES (17,'msh','msh@msh.kr','msh','msh','msh','2023-01-04 10:25:30',1,17,1,175,'msh','./test/webshell3.PHP','175.202.102.108');
INSERT INTO test VALUES (18,'msh','msh@msh.kr','msh','msh','msh','2023-01-04 10:25:31',1,18,1,174,'msh','./test/webshell3.PHP','175.202.102.108');
INSERT INTO test VALUES (19,'msh','msh@msh.kr','msh','msh','msh','2023-01-04 10:25:31',1,19,1,173,'msh','./test/webshell3.PHP','175.202.102.108');
INSERT INTO test VALUES (20,'msh','msh@msh.kr','msh','msh','msh','2023-01-04 10:25:31',1,20,1,172,'msh','./test/webshell3.PHP','175.202.102.108');
INSERT INTO test VALUES (21,'lhs','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:40',1,21,1,171,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (22,'lhs','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:40',1,22,1,170,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (23,'lhs','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:40',1,23,1,169,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (24,'lhs','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:40',1,24,1,168,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (25,'lhs','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:41',1,25,1,167,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (26,'lhs','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:41',1,26,1,166,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (27,'lhs','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:41',1,27,1,165,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (28,'lhs','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:41',1,28,1,164,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (29,'lhs','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:41',1,29,1,163,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (30,'lhs','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:41',1,30,1,162,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (31,'kae','hack@hacker.en','','test','hello world!!!','2023-01-04 10:25:48',1,31,1,161,'1234','./test/kae2.PHP','175.202.102.108');
INSERT INTO test VALUES (32,'kae','hack@hacker.en','','test','hello world!!!','2023-01-04 10:25:48',1,32,1,160,'1234','./test/kae2.PHP','175.202.102.108');
INSERT INTO test VALUES (33,'kae','hack@hacker.en','','test','hello world!!!','2023-01-04 10:25:48',1,33,1,159,'1234','./test/kae2.PHP','175.202.102.108');
INSERT INTO test VALUES (34,'kae','hack@hacker.en','','test','hello world!!!','2023-01-04 10:25:48',1,34,1,158,'1234','./test/kae2.PHP','175.202.102.108');
INSERT INTO test VALUES (35,'kae','hack@hacker.en','','test','hello world!!!','2023-01-04 10:25:48',1,35,1,157,'1234','./test/kae2.PHP','175.202.102.108');
INSERT INTO test VALUES (36,'kae','hack@hacker.en','','test','hello world!!!','2023-01-04 10:25:48',1,36,1,156,'1234','./test/kae2.PHP','175.202.102.108');
INSERT INTO test VALUES (37,'kae','hack@hacker.en','','test','hello world!!!','2023-01-04 10:25:48',1,37,1,155,'1234','./test/kae2.PHP','175.202.102.108');
INSERT INTO test VALUES (38,'kae','hack@hacker.en','','test','hello world!!!','2023-01-04 10:25:48',1,38,1,154,'1234','./test/kae2.PHP','175.202.102.108');
INSERT INTO test VALUES (39,'kae','hack@hacker.en','','test','hello world!!!','2023-01-04 10:25:48',1,39,1,153,'1234','./test/kae2.PHP','175.202.102.108');
INSERT INTO test VALUES (40,'kae','hack@hacker.en','','test','hello world!!!','2023-01-04 10:25:48',1,40,1,152,'1234','./test/kae2.PHP','175.202.102.108');
INSERT INTO test VALUES (41,'kcy','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:54',1,41,1,151,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (42,'kcy','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:54',1,42,1,150,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (43,'kcy','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:54',1,43,1,149,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (44,'kcy','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:54',1,44,1,148,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (45,'kcy','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:54',1,45,1,147,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (46,'kcy','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:54',1,46,1,146,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (47,'kcy','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:54',1,47,1,145,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (48,'kcy','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:54',1,48,1,144,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (49,'kcy','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:54',1,49,1,143,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (50,'kcy','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:25:54',1,50,1,142,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (51,'yym','hack@hacker.en','','yym','hello world!!!','2023-01-04 10:26:00',1,51,1,141,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (52,'yym','hack@hacker.en','','yym','hello world!!!','2023-01-04 10:26:01',1,52,1,140,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (53,'yym','hack@hacker.en','','yym','hello world!!!','2023-01-04 10:26:01',1,53,1,139,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (54,'yym','hack@hacker.en','','yym','hello world!!!','2023-01-04 10:26:01',1,54,1,138,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (55,'yym','hack@hacker.en','','yym','hello world!!!','2023-01-04 10:26:01',1,55,1,137,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (56,'yym','hack@hacker.en','','yym','hello world!!!','2023-01-04 10:26:01',1,56,1,136,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (57,'yym','hack@hacker.en','','yym','hello world!!!','2023-01-04 10:26:01',1,57,1,135,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (58,'yym','hack@hacker.en','','yym','hello world!!!','2023-01-04 10:26:01',1,58,1,134,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (59,'yym','hack@hacker.en','','yym','hello world!!!','2023-01-04 10:26:01',1,59,1,133,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (60,'yym','hack@hacker.en','','yym','hello world!!!','2023-01-04 10:26:01',1,60,1,132,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (61,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:03',1,61,1,131,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (62,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:03',1,62,1,130,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (63,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:03',1,63,1,129,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (64,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:03',1,64,1,128,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (65,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:03',1,65,1,127,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (66,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:03',1,66,1,126,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (67,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:03',1,67,1,125,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (68,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:03',1,68,1,124,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (69,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:03',1,69,1,123,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (70,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:03',1,70,1,122,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (71,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:26:13',1,71,1,121,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (72,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:26:13',1,72,1,120,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (73,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:26:13',1,73,1,119,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (74,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:26:13',1,74,1,118,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (75,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:26:13',1,75,1,117,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (76,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:26:13',1,76,1,116,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (77,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:26:13',1,77,1,115,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (78,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:26:13',1,78,1,114,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (79,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:26:13',1,79,1,113,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (80,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:26:13',1,80,1,112,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (81,'zzangsun','zzangsun@hi.kr','','zzangsun','hi','2023-01-04 10:26:25',1,81,1,111,'123456','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (82,'zzangsun','zzangsun@hi.kr','','zzangsun','hi','2023-01-04 10:26:26',1,82,1,110,'123456','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (83,'zzangsun','zzangsun@hi.kr','','zzangsun','hi','2023-01-04 10:26:26',1,83,1,109,'123456','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (84,'zzangsun','zzangsun@hi.kr','','zzangsun','hi','2023-01-04 10:26:26',1,84,1,108,'123456','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (85,'zzangsun','zzangsun@hi.kr','','zzangsun','hi','2023-01-04 10:26:26',1,85,1,107,'123456','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (86,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:26:32',1,86,1,106,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (87,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:26:32',1,87,1,105,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (88,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:26:32',1,88,1,104,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (89,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:26:32',1,89,1,103,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (90,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:26:32',1,90,1,102,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (91,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:26:32',1,91,1,101,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (92,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:26:32',1,92,1,100,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (93,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:26:32',1,93,1,99,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (94,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:26:33',1,94,1,98,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (95,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:26:33',1,95,1,97,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (96,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:39',1,96,1,96,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (97,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:39',1,97,1,95,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (98,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:39',1,98,1,94,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (99,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:39',1,99,1,93,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (100,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:39',1,100,1,92,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (101,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:39',1,101,1,91,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (102,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:39',1,102,1,90,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (103,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:39',1,103,1,89,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (104,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:39',1,104,1,88,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (105,'JSH','peach@hacker.en','','peach','peach~!!!!','2023-01-04 10:26:39',1,105,1,87,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (106,'틈새','틈새','틈새','틈새','틈새','2023-01-04 10:26:42',1017,106,1,86,'123456','','175.202.102.108');
INSERT INTO test VALUES (107,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,107,1,85,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (108,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,108,1,84,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (109,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,109,1,83,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (110,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,110,1,82,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (111,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,111,1,81,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (112,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,112,1,80,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (113,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,113,1,79,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (114,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,114,1,78,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (115,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,115,1,77,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (116,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,116,1,76,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (117,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,117,1,75,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (118,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,118,1,74,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (119,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,119,1,73,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (120,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:33',1,120,1,72,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (121,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,121,1,71,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (122,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,122,1,70,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (123,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,123,1,69,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (124,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,124,1,68,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (125,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,125,1,67,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (126,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,126,1,66,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (127,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,127,1,65,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (128,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,128,1,64,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (129,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,129,1,63,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (130,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,130,1,62,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (131,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,131,1,61,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (132,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,132,1,60,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (133,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,133,1,59,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (134,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,134,1,58,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (135,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:34',1,135,1,57,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (136,'hacker','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:27:35',1,136,1,56,'1234','./test/JJS.PHP','175.202.102.108');
INSERT INTO test VALUES (137,'KSY','ksy@hacker.en','','Westzero','hello world!!!','2023-01-04 10:27:45',1,137,1,55,'1234','./test/dic.PHP','175.202.102.108');
INSERT INTO test VALUES (138,'KSY','ksy@hacker.en','','Westzero','hello world!!!','2023-01-04 10:27:45',1,138,1,54,'1234','./test/dic.PHP','175.202.102.108');
INSERT INTO test VALUES (139,'KSY','ksy@hacker.en','','Westzero','hello world!!!','2023-01-04 10:27:45',1,139,1,53,'1234','./test/dic.PHP','175.202.102.108');
INSERT INTO test VALUES (140,'KSY','ksy@hacker.en','','Westzero','hello world!!!','2023-01-04 10:27:45',1,140,1,52,'1234','./test/dic.PHP','175.202.102.108');
INSERT INTO test VALUES (141,'KSY','ksy@hacker.en','','Westzero','hello world!!!','2023-01-04 10:27:45',1,141,1,51,'1234','./test/dic.PHP','175.202.102.108');
INSERT INTO test VALUES (142,'KSY','ksy@hacker.en','','Westzero','hello world!!!','2023-01-04 10:27:45',1,142,1,50,'1234','./test/dic.PHP','175.202.102.108');
INSERT INTO test VALUES (143,'KSY','ksy@hacker.en','','Westzero','hello world!!!','2023-01-04 10:27:45',1,143,1,49,'1234','./test/dic.PHP','175.202.102.108');
INSERT INTO test VALUES (144,'KSY','ksy@hacker.en','','Westzero','hello world!!!','2023-01-04 10:27:45',1,144,1,48,'1234','./test/dic.PHP','175.202.102.108');
INSERT INTO test VALUES (145,'KSY','ksy@hacker.en','','Westzero','hello world!!!','2023-01-04 10:27:45',1,145,1,47,'1234','./test/dic.PHP','175.202.102.108');
INSERT INTO test VALUES (146,'KSY','ksy@hacker.en','','Westzero','hello world!!!','2023-01-04 10:27:46',1,146,1,46,'1234','./test/dic.PHP','175.202.102.108');
INSERT INTO test VALUES (147,'ksa','hack@hacker.en','','007','hello world!!!','2023-01-04 10:27:51',1,147,1,45,'1234','./test/ksa.PHP','175.202.102.108');
INSERT INTO test VALUES (148,'ksa','hack@hacker.en','','007','hello world!!!','2023-01-04 10:27:51',1,148,1,44,'1234','./test/ksa.PHP','175.202.102.108');
INSERT INTO test VALUES (149,'ksa','hack@hacker.en','','007','hello world!!!','2023-01-04 10:27:51',1,149,1,43,'1234','./test/ksa.PHP','175.202.102.108');
INSERT INTO test VALUES (150,'ksa','hack@hacker.en','','007','hello world!!!','2023-01-04 10:27:51',1,150,1,42,'1234','./test/ksa.PHP','175.202.102.108');
INSERT INTO test VALUES (151,'ksa','hack@hacker.en','','007','hello world!!!','2023-01-04 10:27:51',1,151,1,41,'1234','./test/ksa.PHP','175.202.102.108');
INSERT INTO test VALUES (152,'ksa','hack@hacker.en','','007','hello world!!!','2023-01-04 10:27:51',1,152,1,40,'1234','./test/ksa.PHP','175.202.102.108');
INSERT INTO test VALUES (153,'ksa','hack@hacker.en','','007','hello world!!!','2023-01-04 10:27:51',1,153,1,39,'1234','./test/ksa.PHP','175.202.102.108');
INSERT INTO test VALUES (154,'ksa','hack@hacker.en','','007','hello world!!!','2023-01-04 10:27:51',1,154,1,38,'1234','./test/ksa.PHP','175.202.102.108');
INSERT INTO test VALUES (155,'ksa','hack@hacker.en','','007','hello world!!!','2023-01-04 10:27:51',1,155,1,37,'1234','./test/ksa.PHP','175.202.102.108');
INSERT INTO test VALUES (156,'ksa','hack@hacker.en','','007','hello world!!!','2023-01-04 10:27:51',1,156,1,36,'1234','./test/ksa.PHP','175.202.102.108');
INSERT INTO test VALUES (157,'ykj','a@jjcom.kr','','test','1234','2023-01-04 10:28:01',2,157,1,35,'123456','./test/webshell_test.Php','175.202.102.108');
INSERT INTO test VALUES (158,'ykj','a@jjcom.kr','','test','1234','2023-01-04 10:28:01',1,158,1,34,'123456','./test/webshell_test.Php','175.202.102.108');
INSERT INTO test VALUES (159,'ykj','a@jjcom.kr','','test','1234','2023-01-04 10:28:01',1,159,1,33,'123456','./test/webshell_test.Php','175.202.102.108');
INSERT INTO test VALUES (160,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:27',1,160,1,32,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (161,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:27',1,161,1,31,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (162,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:27',1,162,1,30,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (163,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:27',1,163,1,29,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (164,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:27',1,164,1,28,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (165,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:27',1,165,1,27,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (166,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:27',1,166,1,26,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (167,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:27',1,167,1,25,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (168,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:28',1,168,1,24,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (169,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:28',2,169,1,23,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (170,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:36',1,170,1,22,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (171,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:36',1,171,1,21,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (172,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:36',1,172,1,20,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (173,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:36',1,173,1,19,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (174,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:36',1,174,1,18,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (175,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:36',1,175,1,17,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (176,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:36',1,176,1,16,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (177,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:36',1,177,1,15,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (178,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:36',1,178,1,14,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (179,'sms','sms@sms.sms','','sms','sms','2023-01-04 10:28:36',1,179,1,13,'123456','./test/dic.txt','175.202.102.108');
INSERT INTO test VALUES (180,'lsh','hack@hacker.en','','hacker','hello world!!!','2023-01-04 10:29:19',1,180,1,12,'1234','./test/lsh.PHP','175.202.102.108');
INSERT INTO test VALUES (181,'name','mail','','title','body','2023-01-04 10:32:10',1,181,1,11,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (182,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:45:46',1,182,1,10,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (183,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:45:46',1,183,1,9,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (184,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:45:46',1,184,1,8,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (185,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:45:46',1,185,1,7,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (186,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:45:46',1,186,1,6,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (187,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:45:46',1,187,1,5,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (188,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:45:46',1,188,1,4,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (189,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:45:46',1,189,1,3,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (190,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:45:46',3,190,1,2,'1234','./test/webshell.PHP','175.202.102.108');
INSERT INTO test VALUES (191,'JYE','JYE@hacker.en','','jye','hello world!!!','2023-01-04 10:45:46',3,191,1,1,'1234','./test/webshell.PHP','175.202.102.108');

