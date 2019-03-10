
#创建数据库
CREATE DATABASE `chatcommunity`;

#选择数据库
use chatcommunity

#创建用户表
 CREATE TABLE `account` (
  `username` varchar(15) DEFAULT NULL,
  `passwd` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#插入新的用户
insert into account values('test1','demo1');

#创建管理员用户表
CREATE TABLE `admin` (
  `adminid` char(6) NOT NULL,
  `adminpasswd` char(16) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#插入管理员用户
insert into admin values('test1','demo1');

#创建邀请码表
CREATE TABLE `invite` (
  `invitecode` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#插入邀请码
insert into invite values('brook001');


#创建话题表
CREATE TABLE `chat` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` varchar(15) DEFAULT NULL,
  `topic` varchar(2000) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;