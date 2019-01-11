CREATE TABLE `tb_user_role` (
  `open_id` varchar(255) NOT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `branch_group` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `promission` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1


CREATE TABLE `dynamic` (
  `userId` varchar(255) NOT NULL COMMENT '用户id',
  `c_passport` varchar(100) DEFAULT NULL COMMENT '护照',
  `c_visa` varchar(50) DEFAULT NULL COMMENT '签证类型',
  `c_photo` varchar(100) DEFAULT NULL COMMENT '照片',
  `c_marriage` varchar(100) DEFAULT NULL COMMENT '结婚证',
  `c_hospital` varchar(50) DEFAULT NULL COMMENT '就诊医院',
  `c_doctor` varchar(50) DEFAULT NULL COMMENT '主治医生',
  `c_HN` varchar(50) DEFAULT NULL COMMENT 'HN号码',
  `c_character` varchar(50) DEFAULT NULL COMMENT '性格',
  `c_remake` varchar(255) DEFAULT NULL COMMENT '备注',
  `c_report` varchar(100) DEFAULT NULL COMMENT '国内检查报告',
  `c_hotel` varchar(100) DEFAULT NULL COMMENT '酒店信息',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1


CREATE TABLE `tb_branch` (
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `branch_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '分公司名称',
  `branch_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '分公司编号',
  `tel_number` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `manager` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主管',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `tb_customer` (
  `create_date` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '创建日期',
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '自增主键',
  `user_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '名字',
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '性别',
  `user_age` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户年龄',
  `user_tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号码',
  `relation_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '家属编号',
  `wechat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信号',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户地址',
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '渠道',
  `salesman` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售人员',
  `sales_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售员编号',
  `service_flag` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务状态：0  未服务、1 正在服务 2 已服务',
  `customer_class` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户类型',
  `branch` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '归属公司',
  `menses_date` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '预估经期',
  `invite_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邀请人姓名',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `file_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '动态档案id',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `tb_job` (
  `openid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serverid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serverName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sale` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `createDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

CREATE TABLE `tb_emp` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT '员工编号',
  `loginname` varchar(50) DEFAULT NULL COMMENT '帐号',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `age` varchar(11) DEFAULT NULL COMMENT '年龄(number)',
  `telnumer` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `birthday` varchar(100) DEFAULT NULL COMMENT '生日(datetime)',
  `dept_id` varchar(50) DEFAULT NULL COMMENT '部门(combobox)',
  `position` varchar(50) DEFAULT NULL COMMENT '职位(combobox)',
  `gender` varchar(11) DEFAULT NULL COMMENT '性别：1男；2女',
  `married` varchar(11) DEFAULT NULL COMMENT '0未婚；1已婚',
  `salary` varchar(20) DEFAULT NULL COMMENT '薪资',
  `educational` varchar(20) DEFAULT NULL COMMENT '学历',
  `country` varchar(20) DEFAULT NULL COMMENT '国家',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `remarks` varchar(2000) DEFAULT NULL COMMENT '备注',
  `school` varchar(100) DEFAULT NULL COMMENT '毕业学校',
  `createtime` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `wechat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 6144 kB; InnoDB free: 7168 kB; InnoDB free: 7168 kB'


CREATE TABLE `token` (
  `access_token` varchar(255) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `expires_in` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1