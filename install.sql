-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2020-03-24 11:03:02
-- 服务器版本： 5.6.44-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql_47_110_240_2`
--

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_address`
--

CREATE TABLE `zjhj_bd_address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '收货人',
  `province_id` int(11) NOT NULL,
  `province` varchar(255) NOT NULL COMMENT '省份名称',
  `city_id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL COMMENT '城市名称',
  `district_id` int(11) NOT NULL,
  `district` varchar(255) NOT NULL COMMENT '县区名称',
  `mobile` varchar(255) NOT NULL COMMENT '联系电话',
  `detail` varchar(1000) NOT NULL COMMENT '详细地址',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '纬度',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '位置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_admin_info`
--

CREATE TABLE `zjhj_bd_admin_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_max_count` int(11) NOT NULL DEFAULT '-1' COMMENT '创建小程序最大数量-1.无限制',
  `permissions` text NOT NULL COMMENT '账户权限',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `expired_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '账户过期时间',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `we7_user_id` int(11) NOT NULL COMMENT '默认填0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用默认权限',
  `secondary_permissions` longtext COMMENT '二级权限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `zjhj_bd_admin_info`
--

INSERT INTO `zjhj_bd_admin_info` (`id`, `user_id`, `app_max_count`, `permissions`, `remark`, `expired_at`, `is_delete`, `we7_user_id`, `is_default`, `secondary_permissions`) VALUES
(1, 1, 0, '[]', '', '0000-00-00 00:00:00', 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_admin_register`
--

CREATE TABLE `zjhj_bd_admin_register` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '姓名/企业名',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '申请原因',
  `wechat_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信号',
  `id_card_front_pic` varchar(2000) NOT NULL DEFAULT '' COMMENT '身份证正面',
  `id_card_back_pic` varchar(2000) NOT NULL DEFAULT '' COMMENT '身份证反面',
  `business_pic` varchar(2000) NOT NULL DEFAULT '' COMMENT '营业执照',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态：0=待审核，1=通过，2=不通过',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_advance_banner`
--

CREATE TABLE `zjhj_bd_advance_banner` (
  `id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='预售轮播图' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_advance_goods`
--

CREATE TABLE `zjhj_bd_advance_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `ladder_rules` varchar(4096) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '阶梯规则',
  `deposit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `swell_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定金膨胀金',
  `start_prepayment_at` timestamp NOT NULL COMMENT '预售开始时间',
  `end_prepayment_at` timestamp NOT NULL COMMENT '预售结束时间',
  `pay_limit` int(11) NOT NULL COMMENT '尾款支付时间 -1:无限制',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_advance_goods_attr`
--

CREATE TABLE `zjhj_bd_advance_goods_attr` (
  `id` int(11) UNSIGNED NOT NULL,
  `deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品所需定金',
  `swell_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定金膨胀金',
  `goods_id` int(11) NOT NULL,
  `goods_attr_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `advance_num` int(11) NOT NULL DEFAULT '0' COMMENT '预约数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_advance_order`
--

CREATE TABLE `zjhj_bd_advance_order` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_attr_id` int(11) NOT NULL COMMENT '规格ID',
  `goods_num` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `order_no` varchar(255) NOT NULL DEFAULT '0',
  `advance_no` varchar(255) NOT NULL COMMENT '定金订单号',
  `deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定金',
  `swell_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '膨胀金',
  `is_cancel` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1取消',
  `cancel_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_refund` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1退款',
  `is_delete` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1删除',
  `is_pay` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否支付：0.未支付|1.已支付',
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0.否|1.是',
  `pay_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式：1.在线支付 2.货到付款 3.余额支付',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `auto_cancel_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '自动取消时间',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `goods_info` longtext NOT NULL,
  `token` varchar(32) NOT NULL,
  `order_token` varchar(32) DEFAULT NULL,
  `preferential_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动优惠金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_advance_order_submit_result`
--

CREATE TABLE `zjhj_bd_advance_order_submit_result` (
  `id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_advance_setting`
--

CREATE TABLE `zjhj_bd_advance_setting` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT '1',
  `payment_type` text NOT NULL,
  `deposit_payment_type` varchar(255) NOT NULL DEFAULT '',
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0',
  `is_print` tinyint(1) NOT NULL DEFAULT '0',
  `is_territorial_limitation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启区域允许购买',
  `goods_poster` longtext NOT NULL,
  `send_type` varchar(255) NOT NULL DEFAULT '' COMMENT '发货方式',
  `over_time` int(11) NOT NULL DEFAULT '0' COMMENT '未支付定金订单超时时间',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_aliapp_config`
--

CREATE TABLE `zjhj_bd_aliapp_config` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `appid` varchar(32) NOT NULL,
  `app_private_key` varchar(2000) NOT NULL,
  `alipay_public_key` varchar(2000) NOT NULL,
  `cs_tnt_inst_id` varchar(32) NOT NULL DEFAULT '',
  `cs_scene` varchar(32) NOT NULL DEFAULT '',
  `app_aes_secret` varchar(32) NOT NULL DEFAULT '' COMMENT '内容加密AES密钥',
  `transfer_app_id` varchar(64) DEFAULT '' COMMENT '打款到用户app_id',
  `transfer_app_private_key` varchar(2048) DEFAULT '' COMMENT '打款到用户app_private_key',
  `transfer_alipay_public_key` text,
  `transfer_appcert` text COMMENT '应用公钥证书',
  `transfer_alipay_rootcert` text COMMENT '支付宝根证书',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_aliapp_template`
--

CREATE TABLE `zjhj_bd_aliapp_template` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `tpl_name` varchar(255) NOT NULL,
  `tpl_id` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_article`
--

CREATE TABLE `zjhj_bd_article` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `article_cat_id` int(11) NOT NULL COMMENT '分类id：1=关于我们，2=服务中心 , 3=拼团',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0隐藏 1显示',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext NOT NULL COMMENT '内容',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL COMMENT '删除时间',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_attachment`
--

CREATE TABLE `zjhj_bd_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `storage_id` int(11) NOT NULL,
  `attachment_group_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '多商户id',
  `name` varchar(128) NOT NULL,
  `size` int(11) NOT NULL COMMENT '大小：字节',
  `url` varchar(2080) NOT NULL,
  `thumb_url` varchar(2080) NOT NULL DEFAULT '',
  `type` tinyint(2) NOT NULL COMMENT '类型：1=图片，2=视频',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0.否|1.是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='附件、文件';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_attachment_group`
--

CREATE TABLE `zjhj_bd_attachment_group` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0.否|1.是',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 图片 1商品'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_attachment_storage`
--

CREATE TABLE `zjhj_bd_attachment_storage` (
  `id` int(10) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '存储类型：1=本地，2=阿里云，3=腾讯云，4=七牛',
  `config` longtext NOT NULL COMMENT '存储配置',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0=未启用，1=已启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1' COMMENT '存储设置所属账号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='附件存储器';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_auth_role`
--

CREATE TABLE `zjhj_bd_auth_role` (
  `id` int(11) UNSIGNED NOT NULL,
  `creator_id` int(11) NOT NULL COMMENT '创建者ID',
  `mall_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述、备注',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_auth_role_permission`
--

CREATE TABLE `zjhj_bd_auth_role_permission` (
  `id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `permissions` longtext NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_auth_role_user`
--

CREATE TABLE `zjhj_bd_auth_role_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_balance_log`
--

CREATE TABLE `zjhj_bd_balance_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '类型：1=收入，2=支出',
  `money` decimal(10,2) NOT NULL COMMENT '变动金额',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '变动说明',
  `custom_desc` longtext NOT NULL COMMENT '自定义详细说明|记录',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_banner`
--

CREATE TABLE `zjhj_bd_banner` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `pic_url` varchar(2080) NOT NULL COMMENT '图片',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `page_url` varchar(2048) NOT NULL DEFAULT '' COMMENT '页面路径',
  `open_type` varchar(65) NOT NULL DEFAULT '' COMMENT '打开方式',
  `params` text NOT NULL COMMENT '导航参数',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `deleted_at` timestamp NOT NULL COMMENT '删除时间',
  `updated_at` timestamp NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bargain_banner`
--

CREATE TABLE `zjhj_bd_bargain_banner` (
  `id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='砍价轮播图';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bargain_goods`
--

CREATE TABLE `zjhj_bd_bargain_goods` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `min_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '最低价',
  `begin_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动结束时间',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '砍价小时数',
  `status_data` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '砍价方式数据',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动是否开放 0--不开放 1--开放',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许中途下单 1--允许 2--不允许',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '活动库存',
  `initiator` int(11) NOT NULL DEFAULT '0' COMMENT '发起人数',
  `participant` int(11) NOT NULL DEFAULT '0' COMMENT '参与人数',
  `min_price_goods` int(11) NOT NULL DEFAULT '0' COMMENT '砍到最小价格数',
  `underway` int(11) NOT NULL DEFAULT '0' COMMENT '进行中的',
  `success` int(11) NOT NULL DEFAULT '0' COMMENT '成功的',
  `fail` int(11) NOT NULL DEFAULT '0' COMMENT '失败的'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='砍价商品设置';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bargain_order`
--

CREATE TABLE `zjhj_bd_bargain_order` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bargain_goods_id` int(11) NOT NULL COMMENT '砍价商品id',
  `token` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `min_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低价',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '砍价时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0--进行中 1--成功 2--失败',
  `bargain_goods_data` longtext NOT NULL COMMENT '砍价设置',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bargain_setting`
--

CREATE TABLE `zjhj_bd_bargain_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='砍价设置';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bargain_user_order`
--

CREATE TABLE `zjhj_bd_bargain_user_order` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bargain_order_id` int(11) NOT NULL COMMENT '砍价订单ID',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '砍价的金额',
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户参与砍价所砍的金额';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bdapp_config`
--

CREATE TABLE `zjhj_bd_bdapp_config` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `app_id` varchar(16) DEFAULT NULL,
  `app_key` varchar(64) DEFAULT NULL,
  `app_secret` varchar(64) DEFAULT NULL,
  `pay_dealid` varchar(64) DEFAULT NULL,
  `pay_public_key` text,
  `pay_private_key` text,
  `pay_app_key` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bdapp_order`
--

CREATE TABLE `zjhj_bd_bdapp_order` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `bd_user_id` varchar(255) NOT NULL DEFAULT '',
  `bd_order_id` varchar(255) NOT NULL DEFAULT '' COMMENT '百度平台订单ID',
  `bd_refund_batch_id` varchar(255) NOT NULL DEFAULT '' COMMENT '百度平台退款批次号',
  `bd_refund_money` int(11) NOT NULL DEFAULT '0',
  `refund_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_refund` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='百度订单号与商城订单号关联表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bdapp_template`
--

CREATE TABLE `zjhj_bd_bdapp_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `tpl_name` varchar(65) NOT NULL DEFAULT '',
  `tpl_id` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bonus_captain`
--

CREATE TABLE `zjhj_bd_bonus_captain` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '队长姓名',
  `mobile` varchar(64) NOT NULL DEFAULT '' COMMENT '队长手机',
  `user_id` int(11) NOT NULL,
  `all_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计分红',
  `total_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已分红',
  `expect_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预计分红，未到账分红',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级:0. 普通成员 关联等级表',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1重新申请未提交 0--申请中 1--成功 2--失败 3--处理中',
  `all_member` int(11) NOT NULL DEFAULT '0' COMMENT '团员数量',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `apply_at` timestamp NULL DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='团队分红队长表';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bonus_captain_log`
--

CREATE TABLE `zjhj_bd_bonus_captain_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `handler` int(11) NOT NULL DEFAULT '0' COMMENT '操作人',
  `user_id` int(11) NOT NULL COMMENT '队长',
  `event` varchar(255) NOT NULL COMMENT '事件名',
  `content` mediumtext NOT NULL COMMENT '记录信息',
  `create_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='队长操作日志表';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bonus_captain_relation`
--

CREATE TABLE `zjhj_bd_bonus_captain_relation` (
  `id` int(11) NOT NULL,
  `captain_id` int(11) NOT NULL COMMENT '队长id',
  `user_id` int(11) NOT NULL COMMENT '团队id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bonus_cash`
--

CREATE TABLE `zjhj_bd_bonus_cash` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现手续费（%）',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '提现方式 auto--自动打款 wechat--微信打款 alipay--支付宝打款 bank--银行转账 balance--打款到余额',
  `extra` longtext COMMENT '额外信息 例如微信账号、支付宝账号等',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '提现状态 0--申请 1--同意 2--已打款 3--驳回',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `content` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现记录表';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bonus_cash_log`
--

CREATE TABLE `zjhj_bd_bonus_cash_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '类型 1--收入 2--支出',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动佣金',
  `desc` longtext,
  `custom_desc` longtext,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bonus_members`
--

CREATE TABLE `zjhj_bd_bonus_members` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `level` int(11) UNSIGNED NOT NULL COMMENT '等级',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '等级名称',
  `auto_update` tinyint(1) NOT NULL COMMENT '是否开启自动升级',
  `update_type` int(11) NOT NULL DEFAULT '0' COMMENT '升级条件类型',
  `update_condition` varchar(64) NOT NULL COMMENT '升级条件',
  `rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '分红比例',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0--禁用 1--启用',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bonus_order_log`
--

CREATE TABLE `zjhj_bd_bonus_order_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `from_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '下单用户ID',
  `to_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '受益用户ID',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单商品实付金额',
  `bonus_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分红金额',
  `fail_bonus_price` decimal(10,2) DEFAULT '0.00' COMMENT '失败分红金额',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0预计分红，1完成分红，2分红失败',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(2) NOT NULL DEFAULT '0',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `bonus_rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '下单时的分红比例%'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_bonus_setting`
--

CREATE TABLE `zjhj_bd_bonus_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0--未删除 1--已删除',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='团队分红设置';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_booking_cats`
--

CREATE TABLE `zjhj_bd_booking_cats` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_booking_goods`
--

CREATE TABLE `zjhj_bd_booking_goods` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `form_data` longtext NOT NULL COMMENT '自定义表单',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_booking_order`
--

CREATE TABLE `zjhj_bd_booking_order` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_booking_setting`
--

CREATE TABLE `zjhj_bd_booking_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启短信通知',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启订单打印',
  `is_cat` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示分类',
  `is_form` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用默认form',
  `form_data` longtext NOT NULL COMMENT 'form默认表单',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `goods_poster` longtext NOT NULL COMMENT '自定义海报'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_booking_store`
--

CREATE TABLE `zjhj_bd_booking_store` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_cart`
--

CREATE TABLE `zjhj_bd_cart` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品',
  `attr_id` int(11) NOT NULL COMMENT '商品规格',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `sign` varchar(65) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `attr_info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_check_in_award_config`
--

CREATE TABLE `zjhj_bd_check_in_award_config` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '奖励数量',
  `day` int(11) NOT NULL DEFAULT '0' COMMENT '领取奖励的天数',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '奖励类型integral--积分|balance--余额',
  `status` tinyint(1) NOT NULL COMMENT '领取类型1--普通签到领取|2--连续签到领取|3--累计签到领取',
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到奖励设置';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_check_in_config`
--

CREATE TABLE `zjhj_bd_check_in_config` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启 0--关闭|1--开启',
  `is_remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否提醒 0--关闭|1--开启',
  `time` varchar(255) NOT NULL COMMENT '提醒时间',
  `continue_type` tinyint(1) NOT NULL COMMENT '连续签到周期1--不限|2--周清|3--月清',
  `rule` longtext NOT NULL COMMENT '签到规则',
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到设置';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_check_in_customize`
--

CREATE TABLE `zjhj_bd_check_in_customize` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_check_in_queue`
--

CREATE TABLE `zjhj_bd_check_in_queue` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到定时任务执行记录表';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_check_in_sign`
--

CREATE TABLE `zjhj_bd_check_in_sign` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '签到奖励数量',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '签到奖励类型integral--积分|balance--余额',
  `day` int(11) NOT NULL DEFAULT '1' COMMENT '签到天数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1--普通签到奖励 2--连续签到奖励 3--累计签到奖励',
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `token` varchar(255) NOT NULL,
  `award_id` int(11) NOT NULL DEFAULT '0' COMMENT '签到奖励id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到领取奖励';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_check_in_user`
--

CREATE TABLE `zjhj_bd_check_in_user` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '累计签到时间',
  `continue` int(11) NOT NULL DEFAULT '0' COMMENT '连续签到时间',
  `is_remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启签到提醒',
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL,
  `continue_start` timestamp NULL DEFAULT NULL COMMENT '连续签到的起始日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到插件--用户表';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_check_in_user_remind`
--

CREATE TABLE `zjhj_bd_check_in_user_remind` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `is_remind` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户签到提醒记录';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_city_deliveryman`
--

CREATE TABLE `zjhj_bd_city_deliveryman` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL COMMENT '配送员名称',
  `mobile` varchar(255) NOT NULL COMMENT '联系方式',
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_city_delivery_setting`
--

CREATE TABLE `zjhj_bd_city_delivery_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(60) DEFAULT NULL,
  `value` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_delete` tinyint(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_clerk_user`
--

CREATE TABLE `zjhj_bd_clerk_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_clerk_user_store_relation`
--

CREATE TABLE `zjhj_bd_clerk_user_store_relation` (
  `id` int(11) UNSIGNED NOT NULL,
  `clerk_user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_core_action_log`
--

CREATE TABLE `zjhj_bd_core_action_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '操作人ID',
  `model` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '模型名称',
  `model_id` int(11) NOT NULL COMMENT '模模型ID',
  `before_update` longtext COLLATE utf8mb4_german2_ci,
  `after_update` longtext COLLATE utf8mb4_german2_ci,
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(255) COLLATE utf8mb4_german2_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_core_exception_log`
--

CREATE TABLE `zjhj_bd_core_exception_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '异常等级1.报错|2.警告|3.记录信息',
  `title` mediumtext NOT NULL COMMENT '异常标题',
  `content` mediumtext NOT NULL COMMENT '异常内容',
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_core_plugin`
--

CREATE TABLE `zjhj_bd_core_plugin` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `display_name` varchar(64) NOT NULL,
  `version` varchar(64) NOT NULL DEFAULT '',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `zjhj_bd_core_plugin`
--

INSERT INTO `zjhj_bd_core_plugin` (`id`, `name`, `display_name`, `version`, `is_delete`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'wxapp', 'wxapp', '1.0.22', 0, '2020-03-16 07:15:55', '2020-03-16 07:15:55', '0000-00-00 00:00:00'),
(2, 'stock', 'stock', '1.0.5', 0, '2020-03-16 07:17:20', '2020-03-16 07:17:20', '0000-00-00 00:00:00'),
(3, 'pintuan', 'pintuan', '1.0.62', 0, '2020-03-16 07:17:27', '2020-03-16 07:17:27', '0000-00-00 00:00:00'),
(4, 'scan_code_pay', 'scan_code_pay', '1.0.15', 0, '2020-03-16 07:17:34', '2020-03-16 07:17:34', '0000-00-00 00:00:00'),
(5, 'clerk', 'clerk', '1.0.5', 0, '2020-03-16 07:17:40', '2020-03-16 07:17:40', '0000-00-00 00:00:00'),
(6, 'bargain', 'bargain', '1.0.34', 0, '2020-03-16 07:17:48', '2020-03-16 07:17:48', '0000-00-00 00:00:00'),
(7, 'app_admin', 'app_admin', '1.0.4', 0, '2020-03-16 07:17:55', '2020-03-16 07:17:55', '0000-00-00 00:00:00'),
(8, 'ttapp', 'ttapp', '1.0.54', 0, '2020-03-16 07:18:02', '2020-03-16 07:18:02', '0000-00-00 00:00:00'),
(9, 'mch', 'mch', '1.0.51', 0, '2020-03-16 07:18:08', '2020-03-16 07:18:08', '0000-00-00 00:00:00'),
(10, 'fxhb', 'fxhb', '1.0.25', 0, '2020-03-16 07:18:15', '2020-03-16 07:18:15', '0000-00-00 00:00:00'),
(11, 'scratch', 'scratch', '1.0.24', 0, '2020-03-16 07:18:22', '2020-03-16 07:18:22', '0000-00-00 00:00:00'),
(12, 'advance', 'advance', '1.0.20', 0, '2020-03-16 07:18:28', '2020-03-16 07:18:28', '0000-00-00 00:00:00'),
(13, 'quick_share', 'quick_share', '1.0.6', 0, '2020-03-16 07:18:39', '2020-03-16 07:18:39', '0000-00-00 00:00:00'),
(14, 'shopping', 'shopping', '1.0.7', 0, '2020-03-16 07:18:46', '2020-03-16 07:18:46', '0000-00-00 00:00:00'),
(15, 'bdapp', 'bdapp', '1.0.52', 0, '2020-03-16 07:18:53', '2020-03-16 07:18:53', '0000-00-00 00:00:00'),
(16, 'booking', 'booking', '1.0.48', 0, '2020-03-16 07:20:09', '2020-03-16 07:20:09', '0000-00-00 00:00:00'),
(17, 'aliapp', 'aliapp', '1.0.54', 0, '2020-03-16 07:20:18', '2020-03-16 07:20:18', '0000-00-00 00:00:00'),
(18, 'pond', 'pond', '1.0.25', 0, '2020-03-16 07:20:32', '2020-03-16 07:20:32', '0000-00-00 00:00:00'),
(19, 'integral_mall', 'integral_mall', '1.0.39', 0, '2020-03-16 07:20:39', '2020-03-16 07:20:39', '0000-00-00 00:00:00'),
(20, 'diy', 'diy', '1.0.60', 0, '2020-03-16 07:20:45', '2020-03-16 07:20:45', '0000-00-00 00:00:00'),
(21, 'check_in', 'check_in', '1.0.18', 0, '2020-03-16 07:20:51', '2020-03-16 07:20:51', '0000-00-00 00:00:00'),
(22, 'lottery', 'lottery', '1.0.42', 0, '2020-03-16 07:20:57', '2020-03-16 07:20:57', '0000-00-00 00:00:00'),
(23, 'gift', 'gift', '1.0.10', 0, '2020-03-16 07:21:04', '2020-03-16 07:21:04', '0000-00-00 00:00:00'),
(24, 'dianqilai', 'dianqilai', '1.0.4', 0, '2020-03-16 07:21:13', '2020-03-16 07:21:13', '0000-00-00 00:00:00'),
(25, 'bonus', 'bonus', '1.0.21', 0, '2020-03-16 07:21:19', '2020-03-16 07:21:19', '0000-00-00 00:00:00'),
(26, 'vip_card', 'vip_card', '1.0.21', 0, '2020-03-16 07:21:25', '2020-03-16 07:21:25', '0000-00-00 00:00:00'),
(27, 'step', 'step', '1.0.43', 0, '2020-03-16 07:21:50', '2020-03-16 07:21:50', '0000-00-00 00:00:00'),
(28, 'miaosha', 'miaosha', '1.0.39', 0, '2020-03-16 07:21:58', '2020-03-16 07:21:58', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_core_queue`
--

CREATE TABLE `zjhj_bd_core_queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(64) NOT NULL,
  `job` blob NOT NULL,
  `pushed_at` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `reserved_at` int(11) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `done_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_core_queue_data`
--

CREATE TABLE `zjhj_bd_core_queue_data` (
  `id` int(11) NOT NULL,
  `queue_id` int(11) NOT NULL DEFAULT '0' COMMENT '队列返回值',
  `token` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='队列存储';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_core_session`
--

CREATE TABLE `zjhj_bd_core_session` (
  `id` char(40) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `DATA` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `zjhj_bd_core_session`
--

INSERT INTO `zjhj_bd_core_session` (`id`, `expire`, `DATA`) VALUES
('0ohp1kkdamef0rn78rpieattmv', 1585020391, 0x5f5f666c6173687c613a303a7b7d5f5f636170746368612f736974652f7069632d636170746368617c733a343a226b75696f223b5f5f636170746368612f736974652f7069632d63617074636861636f756e747c693a313b5f5f69647c693a313b63306139323931356266333063623337633462343765343237306330393662387c733a3135323a224d3841566e54767178587a48352f635370782f7175444577595445334d54557959546b335a4452685a4745334d7a42684d7a526a4e5451344f44417a5a445a6d5a5467795a446c6d4d4745784d7a4530595467304e5749314d32566c5a6a67334d324532595752685a4453313247656578454c65776d53706f6a4553733935666f67626d774f336d39394453462b524e75656e7a49513d3d223b65346633323531666534643765393331656133663637366135616662376535667c733a3135323a225063532b41423846503975437247574563576770375749335a574d314e7a466b5a544d324f574668596a6c6d5a6d4d324e3259784d4441774e545a695a5467314e6d55324e47526b4f4745355a6a4e685a546b785a57566a4f44557a4f5455314e4751344d44633159544e59657a4869344d6b6936654276665969424c595a68394c2f507158434f2b644f2f6f61474f6767314236413d3d223b),
('378pa9pqb9mj8f2tfburb3tuk9', 1584706958, 0x5f5f666c6173687c613a303a7b7d5f5f636170746368612f736974652f7069632d636170746368617c733a343a22666f6365223b5f5f636170746368612f736974652f7069632d63617074636861636f756e747c693a313b),
('4sdqvghfcov6sf6ueah4pdu0do', 1584687962, 0x5f5f666c6173687c613a303a7b7d5f5f636170746368612f736974652f7069632d636170746368617c733a353a227161666c66223b5f5f636170746368612f736974652f7069632d63617074636861636f756e747c693a313b),
('fccgj0e9jc3krlnb9vlpluhvoi', 1584856225, 0x5f5f666c6173687c613a303a7b7d5f5f636170746368612f736974652f7069632d636170746368617c733a343a2270617661223b5f5f636170746368612f736974652f7069632d63617074636861636f756e747c693a313b),
('hq4jskl5gto8ltu27ocem5fugl', 1584767350, 0x5f5f666c6173687c613a303a7b7d5f5f636170746368612f736974652f7069632d636170746368617c733a343a2270656d75223b5f5f636170746368612f736974652f7069632d63617074636861636f756e747c693a313b),
('pfbj09j3982bhuhe9s167856gb', 1584346855, 0x5f5f666c6173687c613a303a7b7d5f5f636170746368612f736974652f7069632d636170746368617c733a343a227278736f223b5f5f636170746368612f736974652f7069632d63617074636861636f756e747c693a313b5f5f69647c693a313b63306139323931356266333063623337633462343765343237306330393662387c733a3135323a22795a415162493378356c6c3267456233753135684e6d56684f4455774f44457a5a5446685a54646a4f5751354d7a5a6b596d4e695a444d7a4e544d304d544669597a4535596a6b7a4e7a41785a47466b4d5751775a44493559574e684e54566a4e574e6c595449795a6a6176704e70393735624576427946516f4d7455394f574e6855583938506867315168633674416d2f66482f773d3d223b65346633323531666534643765393331656133663637366135616662376535667c733a3135323a22796679617643483254783061685861776b666c526c6a41314e6a5533596d4e6959324579593255334d546c6c4d7a55324f4464694d4445314d6a686c5957597a4f546c695932457a4d6a6b795a444a6d4e6a42694f4745334e5445785a5745785a5455354e4463325a544c4f7132384b66477748575067647a50553835714e6d31336e763444626463636e726d31414b38556a4175673d3d223b);

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_core_task`
--

CREATE TABLE `zjhj_bd_core_task` (
  `id` int(11) NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 NOT NULL,
  `delay_seconds` int(11) NOT NULL,
  `is_executed` int(1) NOT NULL,
  `class` varchar(128) CHARACTER SET utf8 NOT NULL,
  `params` longtext,
  `content` longtext,
  `is_delete` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_core_template`
--

CREATE TABLE `zjhj_bd_core_template` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '模板名称',
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '作者',
  `price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '价格',
  `pics` longtext NOT NULL,
  `data` longtext NOT NULL COMMENT '数据',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `version` varchar(255) NOT NULL DEFAULT '' COMMENT '版本号',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT 'home--首页布局 diy--DIY模板',
  `detail` longtext NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_core_template_edit`
--

CREATE TABLE `zjhj_bd_core_template_edit` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '修改后名称',
  `price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '修改后价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_core_validate_code`
--

CREATE TABLE `zjhj_bd_core_validate_code` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(255) NOT NULL,
  `code` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `is_validated` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已验证：0=未验证，1-已验证'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信、邮箱验证码';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_core_validate_code_log`
--

CREATE TABLE `zjhj_bd_core_validate_code_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_coupon`
--

CREATE TABLE `zjhj_bd_coupon` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '优惠券名称',
  `type` smallint(1) NOT NULL COMMENT '优惠券类型：1=折扣，2=满减',
  `discount` decimal(3,1) NOT NULL DEFAULT '10.0' COMMENT '折扣率',
  `pic_url` int(11) NOT NULL DEFAULT '0' COMMENT '未用',
  `desc` varchar(2000) NOT NULL DEFAULT '' COMMENT '未用',
  `min_price` decimal(10,2) NOT NULL COMMENT '最低消费金额',
  `sub_price` decimal(10,2) NOT NULL COMMENT '优惠金额',
  `total_count` int(11) NOT NULL DEFAULT '-1' COMMENT '可发放的数量（剩余数量）',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序按升序排列',
  `expire_type` smallint(1) NOT NULL COMMENT '到期类型：1=领取后N天过期，2=指定有效期',
  `expire_day` int(11) NOT NULL DEFAULT '0' COMMENT '有效天数，expire_type=1时',
  `begin_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期结束时间',
  `appoint_type` smallint(11) NOT NULL COMMENT '1 指定分类 2 指定商品 3全部',
  `rule` varchar(2000) NOT NULL DEFAULT '' COMMENT '使用说明',
  `is_member` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否指定会员等级',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `discount_limit` decimal(10,2) DEFAULT NULL COMMENT '折扣优惠上限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_coupon_auto_send`
--

CREATE TABLE `zjhj_bd_coupon_auto_send` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL COMMENT '优惠卷',
  `event` int(11) NOT NULL DEFAULT '1' COMMENT '触发事件：1=分享，2=购买并付款',
  `send_count` int(11) NOT NULL DEFAULT '0' COMMENT '最多发放次数，0表示不限制',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '领取人 0--所有人 1--指定用户',
  `user_list` longtext COMMENT '指定用户id列表'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_coupon_cat_relation`
--

CREATE TABLE `zjhj_bd_coupon_cat_relation` (
  `id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL COMMENT '优惠券',
  `cat_id` int(11) NOT NULL COMMENT '分类',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_coupon_center`
--

CREATE TABLE `zjhj_bd_coupon_center` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL COMMENT '优惠券id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_coupon_goods_relation`
--

CREATE TABLE `zjhj_bd_coupon_goods_relation` (
  `id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL COMMENT '优惠券',
  `goods_warehouse_id` int(11) NOT NULL COMMENT '商品',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_coupon_mall_relation`
--

CREATE TABLE `zjhj_bd_coupon_mall_relation` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_coupon_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_coupon_member_relation`
--

CREATE TABLE `zjhj_bd_coupon_member_relation` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL COMMENT '优惠券id',
  `member_level` int(11) NOT NULL COMMENT '会员id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_delivery`
--

CREATE TABLE `zjhj_bd_delivery` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `express_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递公司id',
  `customer_account` varchar(255) NOT NULL DEFAULT '' COMMENT '电子面单客户账号',
  `customer_pwd` varchar(255) NOT NULL DEFAULT '' COMMENT '电子面单密码',
  `month_code` varchar(255) NOT NULL DEFAULT '' COMMENT '月结编码',
  `outlets_name` varchar(255) NOT NULL DEFAULT '' COMMENT '网点名称',
  `outlets_code` varchar(255) NOT NULL DEFAULT '' COMMENT '网点编码',
  `company` varchar(255) NOT NULL DEFAULT '' COMMENT '发件人公司',
  `name` varchar(255) NOT NULL COMMENT '发件人名称',
  `tel` varchar(255) NOT NULL DEFAULT '' COMMENT '发件人电话',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '发件人手机',
  `zip_code` varchar(255) NOT NULL DEFAULT '' COMMENT '发件人邮政编码',
  `province` varchar(255) NOT NULL COMMENT '发件人省',
  `city` varchar(255) NOT NULL COMMENT '发件人市',
  `district` varchar(255) NOT NULL COMMENT '发件人区',
  `address` varchar(255) NOT NULL COMMENT '发件人详细地址',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否订阅短信',
  `template_size` varchar(255) NOT NULL DEFAULT '' COMMENT '快递鸟电子面单模板规格',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_goods` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否商品信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_diy_alone_page`
--

CREATE TABLE `zjhj_bd_diy_alone_page` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT '' COMMENT '类型 auth--授权页面',
  `params` longtext COMMENT '参数',
  `is_delete` smallint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_open` smallint(1) DEFAULT '0' COMMENT '是否显示 0--不显示 1--显示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_diy_form`
--

CREATE TABLE `zjhj_bd_diy_form` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `form_data` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='diy表单信息';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_diy_page`
--

CREATE TABLE `zjhj_bd_diy_page` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `show_navs` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示导航条：0=不显示，1=显示',
  `is_disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用状态：0=启用，1=禁用',
  `is_home_page` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是首页0--否 1--是',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_diy_page_nav`
--

CREATE TABLE `zjhj_bd_diy_page_nav` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `template_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_diy_template`
--

CREATE TABLE `zjhj_bd_diy_template` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_favorite`
--

CREATE TABLE `zjhj_bd_favorite` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_footprint_data_log`
--

CREATE TABLE `zjhj_bd_footprint_data_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(60) NOT NULL,
  `value` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `statistics_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上一次统计的时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_footprint_goods_log`
--

CREATE TABLE `zjhj_bd_footprint_goods_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_form`
--

CREATE TABLE `zjhj_bd_form` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `data` longtext COMMENT '表单内容',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_formid`
--

CREATE TABLE `zjhj_bd_formid` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `form_id` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `remains` int(11) NOT NULL COMMENT '剩余次数',
  `expired_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_free_delivery_rules`
--

CREATE TABLE `zjhj_bd_free_delivery_rules` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `detail` longtext NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_fxhb_activity`
--

CREATE TABLE `zjhj_bd_fxhb_activity` (
  `id` int(11) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启活动：0.关闭|1.开启',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '红包分配方式：1.随机|2.平均',
  `number` int(11) NOT NULL COMMENT '拆包人数',
  `count_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '红包总金额',
  `least_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '最低消费金额',
  `effective_time` int(11) NOT NULL COMMENT '代金券有效期',
  `open_effective_time` int(11) NOT NULL COMMENT '拆红包有效期',
  `coupon_type` tinyint(1) NOT NULL COMMENT '代金券使用场景：1.指定分类|2.指定商品|3.全场通用',
  `sponsor_num` int(11) NOT NULL DEFAULT '-1' COMMENT '该用户可发起活动的次数',
  `help_num` int(11) NOT NULL DEFAULT '-1' COMMENT '帮拆的次数',
  `sponsor_count` int(11) NOT NULL DEFAULT '-1' COMMENT '此活动可发红包总次数',
  `sponsor_count_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '次数扣除方式：0.活动成功扣除|1.活动发起就扣除',
  `start_time` timestamp NOT NULL COMMENT '活动开始时间',
  `end_time` timestamp NOT NULL COMMENT '活动结束时间',
  `remark` text NOT NULL COMMENT '活动规则 ',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '活动图片',
  `share_title` text NOT NULL COMMENT '分享标题',
  `share_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mall_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT '活动名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_fxhb_activity_cat_relation`
--

CREATE TABLE `zjhj_bd_fxhb_activity_cat_relation` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `cat_id` int(11) NOT NULL COMMENT '分类',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_fxhb_activity_goods_relation`
--

CREATE TABLE `zjhj_bd_fxhb_activity_goods_relation` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `goods_warehouse_id` int(11) NOT NULL COMMENT '商品',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_fxhb_user_activity`
--

CREATE TABLE `zjhj_bd_fxhb_user_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `fxhb_activity_id` int(11) NOT NULL COMMENT '活动ID',
  `number` int(11) NOT NULL COMMENT '拆包人数',
  `count_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '红包总金额',
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `data` longtext NOT NULL COMMENT '活动发起时活动的设置',
  `status` tinyint(1) NOT NULL COMMENT '状态0--进行中 1--成功 2--失败',
  `mall_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_coupon_id` int(11) NOT NULL,
  `get_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '拆红包获得的金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户参与红包';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_gift_log`
--

CREATE TABLE `zjhj_bd_gift_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '礼物总数',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_confirm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '送礼状态：0.未完成送礼|1.已完成送礼',
  `type` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '送礼方式',
  `open_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开奖时间',
  `open_num` int(11) NOT NULL DEFAULT '0' COMMENT '开奖所需人数',
  `open_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0一人拿奖，1多人各领一份奖',
  `bless_word` varchar(200) NOT NULL COMMENT '祝福语',
  `bless_music` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '祝福语音',
  `auto_refund_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '自动退款时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `is_cancel` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_gift_lottery`
--

CREATE TABLE `zjhj_bd_gift_lottery` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `send_order_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_prize` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未中，1中奖'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_gift_open_result`
--

CREATE TABLE `zjhj_bd_gift_open_result` (
  `id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_gift_order`
--

CREATE TABLE `zjhj_bd_gift_order` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `order_no` varchar(255) NOT NULL DEFAULT '',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `goods_attr_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '商城订单ID',
  `type` varchar(60) NOT NULL COMMENT '送礼方式',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `user_order_id` int(11) NOT NULL DEFAULT '0',
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退款，前端显示超时',
  `buy_order_detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '买礼物的商城订单详情id',
  `gift_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_gift_order_submit_result`
--

CREATE TABLE `zjhj_bd_gift_order_submit_result` (
  `id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_gift_send_order`
--

CREATE TABLE `zjhj_bd_gift_send_order` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `gift_id` int(11) NOT NULL DEFAULT '0' COMMENT 'gift_log的id',
  `order_no` varchar(60) NOT NULL DEFAULT '',
  `total_price` decimal(10,2) NOT NULL COMMENT '订单总金额(含运费)',
  `total_pay_price` decimal(10,2) NOT NULL COMMENT '实际支付总费用(含运费）',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支付：0.未支付|1.已支付',
  `pay_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付方式：1.在线支付 2.货到付款 3.余额支付',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未退款，1已退款',
  `is_confirm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '送礼状态：0.未完成送礼|1.已完成送礼',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `support_pay_types` text NOT NULL COMMENT '支持的支付方式，空表示支持系统设置支持的所有方式',
  `token` varchar(32) NOT NULL,
  `total_goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_goods_original_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `member_discount_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `use_user_coupon_id` int(11) NOT NULL DEFAULT '0',
  `coupon_discount_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `use_integral_num` int(11) NOT NULL DEFAULT '0',
  `integral_deduction_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_cancel` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_gift_send_order_detail`
--

CREATE TABLE `zjhj_bd_gift_send_order_detail` (
  `id` int(11) NOT NULL,
  `send_order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_attr_id` int(11) NOT NULL DEFAULT '0',
  `goods_info` longtext COMMENT '购买商品信息',
  `num` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL COMMENT '商品单价',
  `total_original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品原总价(优惠前)',
  `total_price` decimal(10,2) NOT NULL COMMENT '商品总价(优惠后)',
  `member_discount_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未退款，1已退款',
  `refund_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '售后状态 0--未售后 1--售后中 2--售后结束',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `receive_num` int(11) NOT NULL DEFAULT '0' COMMENT '已领取数量',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_gift_setting`
--

CREATE TABLE `zjhj_bd_gift_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL DEFAULT '[]' COMMENT '玩法',
  `auto_refund` int(11) NOT NULL DEFAULT '0' COMMENT '自动退款天数',
  `auto_remind` int(11) NOT NULL DEFAULT '0' COMMENT '送礼失败提醒天数',
  `bless_word` varchar(200) NOT NULL COMMENT '祝福语',
  `ask_gift` varchar(200) NOT NULL COMMENT '求礼物',
  `is_share` tinyint(1) NOT NULL DEFAULT '0',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0',
  `is_print` tinyint(1) NOT NULL DEFAULT '0',
  `payment_type` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `poster` longtext NOT NULL COMMENT '海报',
  `background` varchar(200) NOT NULL DEFAULT '[]' COMMENT '自定义背景',
  `theme` text NOT NULL COMMENT '主题色',
  `send_type` varchar(200) NOT NULL DEFAULT '[]',
  `explain` text NOT NULL COMMENT '规则说明'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_gift_user_order`
--

CREATE TABLE `zjhj_bd_gift_user_order` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `gift_id` int(11) NOT NULL DEFAULT '0',
  `is_turn` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否转赠0未转1已转',
  `turn_no` varchar(255) NOT NULL DEFAULT '' COMMENT '转赠码',
  `turn_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '被转赠用户ID',
  `is_receive` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未领取，1已领取',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_win` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未中，1已中',
  `token` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_goods`
--

CREATE TABLE `zjhj_bd_goods` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `goods_warehouse_id` int(11) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '上架状态：0=下架，1=上架',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `use_attr` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否使用规格：0=不使用，1=使用',
  `attr_groups` text CHARACTER SET utf8 NOT NULL COMMENT '商品规格组',
  `goods_stock` int(11) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `virtual_sales` int(11) NOT NULL DEFAULT '0' COMMENT '已出售量',
  `confine_count` int(11) NOT NULL DEFAULT '-1' COMMENT '购物数量限制',
  `pieces` int(11) NOT NULL DEFAULT '0' COMMENT '单品满件包邮',
  `forehead` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单口满额包邮',
  `freight_id` int(11) NOT NULL COMMENT '运费模板ID',
  `give_integral` int(11) NOT NULL DEFAULT '0' COMMENT '赠送积分',
  `give_integral_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '赠送积分类型1.固定值 |2.百分比',
  `forehead_integral` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可抵扣积分',
  `forehead_integral_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可抵扣积分类型1.固定值 |2.百分比',
  `accumulative` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许多件累计折扣',
  `individual_share` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否单独分销设置：0=否，1=是',
  `attr_setting_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分销设置类型 0.普通设置|1.详细设置',
  `is_level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否享受会员价购买',
  `is_level_alone` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否单独设置会员价',
  `share_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '佣金配比 0--固定金额 1--百分比',
  `sign` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '商品标示用于区分商品属于什么模块',
  `app_share_pic` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '自定义分享图片',
  `app_share_title` varchar(65) NOT NULL DEFAULT '' COMMENT '自定义分享标题',
  `is_default_services` tinyint(1) NOT NULL DEFAULT '1' COMMENT '默认服务 0.否|1.是',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `payment_people` int(11) NOT NULL DEFAULT '0' COMMENT '支付人数',
  `payment_num` int(11) NOT NULL DEFAULT '0' COMMENT '支付件数',
  `payment_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `payment_order` int(11) NOT NULL DEFAULT '0' COMMENT '支付订单数',
  `confine_order_count` int(11) NOT NULL DEFAULT '-1',
  `is_area_limit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否单独区域购买',
  `area_limit` longtext NOT NULL,
  `form_id` int(11) NOT NULL DEFAULT '0' COMMENT '自定义表单id 0--表示默认表单 -1--表示不使用表单'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品通用信息表';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_goods_attr`
--

CREATE TABLE `zjhj_bd_goods_attr` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(11) NOT NULL,
  `sign_id` varchar(255) NOT NULL DEFAULT '' COMMENT '规格ID标识',
  `stock` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '库存',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `no` varchar(255) NOT NULL DEFAULT '' COMMENT '货号',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '重量（克）',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '规格图片',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_goods_cards`
--

CREATE TABLE `zjhj_bd_goods_cards` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(65) NOT NULL DEFAULT '',
  `pic_url` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `expire_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '到期类型：1=领取后N天过期，2=指定有效期',
  `expire_day` int(11) NOT NULL DEFAULT '0' COMMENT '有效天数',
  `begin_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期结束时间',
  `total_count` int(11) NOT NULL DEFAULT '-1' COMMENT '卡券数量',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_goods_card_relation`
--

CREATE TABLE `zjhj_bd_goods_card_relation` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '卡券数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_goods_cats`
--

CREATE TABLE `zjhj_bd_goods_cats` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pic_url` varchar(255) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序，升序',
  `big_pic_url` varchar(255) NOT NULL DEFAULT '',
  `advert_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `advert_url` varchar(255) NOT NULL DEFAULT '' COMMENT '广告链接',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用:0.禁用|1.启用',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_show` tinyint(1) DEFAULT '1',
  `advert_open_type` varchar(65) NOT NULL DEFAULT '' COMMENT '打开方式',
  `advert_params` text NOT NULL COMMENT '导航参数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_goods_cat_relation`
--

CREATE TABLE `zjhj_bd_goods_cat_relation` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_warehouse_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_goods_member_price`
--

CREATE TABLE `zjhj_bd_goods_member_price` (
  `id` int(11) UNSIGNED NOT NULL,
  `level` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_attr_id` int(11) NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_goods_services`
--

CREATE TABLE `zjhj_bd_goods_services` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(65) NOT NULL DEFAULT '' COMMENT '服务名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注、描述',
  `sort` int(11) NOT NULL DEFAULT '100',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认服务',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_goods_service_relation`
--

CREATE TABLE `zjhj_bd_goods_service_relation` (
  `id` int(11) UNSIGNED NOT NULL,
  `service_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_goods_share`
--

CREATE TABLE `zjhj_bd_goods_share` (
  `id` int(11) NOT NULL,
  `share_commission_first` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '一级分销佣金比例',
  `share_commission_second` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '二级分销佣金比例',
  `share_commission_third` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '三级分销佣金比例',
  `goods_id` int(11) NOT NULL,
  `goods_attr_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '分销商等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_goods_warehouse`
--

CREATE TABLE `zjhj_bd_goods_warehouse` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `cover_pic` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '商品缩略图',
  `pic_url` text CHARACTER SET utf8 NOT NULL COMMENT '商品轮播图',
  `video_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '商品视频',
  `unit` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '件' COMMENT '单位',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_home_block`
--

CREATE TABLE `zjhj_bd_home_block` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '样式类型：1.默认|2.样式一|3.样式二',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_home_nav`
--

CREATE TABLE `zjhj_bd_home_nav` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL DEFAULT '' COMMENT '导航名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '导航链接',
  `open_type` varchar(65) NOT NULL DEFAULT '' COMMENT '打开方式',
  `icon_url` varchar(255) NOT NULL DEFAULT '' COMMENT '导航图标',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0.隐藏|1.显示',
  `params` text NOT NULL COMMENT '导航参数',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_import_goods`
--

CREATE TABLE `zjhj_bd_import_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL COMMENT '操作账户ID',
  `status` tinyint(4) NOT NULL COMMENT '导入状态|1.全部失败|2.部分失败|3.全部成功',
  `file_name` varchar(191) NOT NULL DEFAULT '' COMMENT '导入文件名',
  `goods_count` int(11) NOT NULL,
  `success_count` int(11) NOT NULL,
  `error_count` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_integral_log`
--

CREATE TABLE `zjhj_bd_integral_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '类型：1=收入，2=支出',
  `integral` int(11) NOT NULL COMMENT '变动积分',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '变动说明',
  `custom_desc` longtext NOT NULL COMMENT '自定义详细说明|记录',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_integral_mall_banners`
--

CREATE TABLE `zjhj_bd_integral_mall_banners` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_integral_mall_cats`
--

CREATE TABLE `zjhj_bd_integral_mall_cats` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '100',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_integral_mall_coupons`
--

CREATE TABLE `zjhj_bd_integral_mall_coupons` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `exchange_num` int(11) NOT NULL DEFAULT '-1' COMMENT '兑换次数-1.不限制',
  `integral_num` int(11) NOT NULL COMMENT '所需兑换积分',
  `send_count` int(11) NOT NULL COMMENT '发放优惠券总数',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_integral_mall_coupons_orders`
--

CREATE TABLE `zjhj_bd_integral_mall_coupons_orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `mall_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '',
  `integral_mall_coupon_id` int(11) NOT NULL COMMENT '积分商城优惠券ID',
  `integral_mall_coupon_info` text NOT NULL COMMENT '积分商城优惠券信息',
  `user_coupon_id` int(11) NOT NULL COMMENT '关联用户优惠券ID',
  `price` decimal(11,2) NOT NULL COMMENT '优惠券价格',
  `integral_num` int(11) NOT NULL COMMENT '优惠券积分',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pay_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式：1.在线支付 2.货到付款 3.余额支付',
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_integral_mall_coupons_user`
--

CREATE TABLE `zjhj_bd_integral_mall_coupons_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `mall_id` int(11) NOT NULL,
  `integral_mall_coupon_id` int(11) NOT NULL COMMENT '积分商城优惠券ID',
  `user_coupon_id` int(11) NOT NULL COMMENT '关联用户优惠券ID',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_integral_mall_coupon_order_submit_result`
--

CREATE TABLE `zjhj_bd_integral_mall_coupon_order_submit_result` (
  `id` int(11) UNSIGNED NOT NULL,
  `token` varchar(32) NOT NULL DEFAULT '',
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_integral_mall_goods`
--

CREATE TABLE `zjhj_bd_integral_mall_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT '0' COMMENT '放置首页0.否|1.是',
  `integral_num` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_integral_mall_goods_attr`
--

CREATE TABLE `zjhj_bd_integral_mall_goods_attr` (
  `id` int(11) UNSIGNED NOT NULL,
  `integral_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品所需积分',
  `goods_id` int(11) NOT NULL,
  `goods_attr_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_integral_mall_orders`
--

CREATE TABLE `zjhj_bd_integral_mall_orders` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '',
  `integral_num` int(11) NOT NULL COMMENT '商品所需积分',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_integral_mall_setting`
--

CREATE TABLE `zjhj_bd_integral_mall_setting` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_share` int(11) NOT NULL DEFAULT '0',
  `is_sms` int(11) NOT NULL DEFAULT '0',
  `is_mail` int(11) NOT NULL DEFAULT '0',
  `is_print` int(11) NOT NULL DEFAULT '0',
  `is_territorial_limitation` int(11) NOT NULL DEFAULT '0',
  `desc` text NOT NULL COMMENT '积分说明',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `goods_poster` longtext NOT NULL COMMENT '自定义海报'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_lottery`
--

CREATE TABLE `zjhj_bd_lottery` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '规格',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0关闭 1开启',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未完成 1已完成 2超限 3过期',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `join_min_num` int(11) NOT NULL DEFAULT '0' COMMENT '参加最少人数限制',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `participant` int(11) NOT NULL DEFAULT '0' COMMENT '参与人',
  `invitee` int(11) NOT NULL DEFAULT '0' COMMENT '被邀请人',
  `code_num` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖券码数量',
  `buy_goods_id` int(11) NOT NULL COMMENT '购买商品id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_lottery_banner`
--

CREATE TABLE `zjhj_bd_lottery_banner` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_lottery_default`
--

CREATE TABLE `zjhj_bd_lottery_default` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `lottery_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_lottery_log`
--

CREATE TABLE `zjhj_bd_lottery_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lottery_id` int(11) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0未抽奖 1待开奖 2未中奖 3中奖 4已领取 ',
  `goods_id` int(11) NOT NULL COMMENT '规格id',
  `child_id` int(11) NOT NULL DEFAULT '0' COMMENT '受邀请userid',
  `lucky_code` varchar(255) NOT NULL COMMENT '幸运码',
  `raffled_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '领取时间',
  `obtain_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_lottery_order`
--

CREATE TABLE `zjhj_bd_lottery_order` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `lottery_log_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_lottery_setting`
--

CREATE TABLE `zjhj_bd_lottery_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：分享即送 1： 被分享人参与抽奖',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序标题',
  `rule` longtext NOT NULL COMMENT '规则',
  `created_at` timestamp NOT NULL,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `goods_poster` longtext NOT NULL COMMENT '自定义海报',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启邮件提醒',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启打印',
  `cs_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启客服提示',
  `cs_prompt_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '客服提示图片',
  `cs_wechat` longtext NOT NULL COMMENT '客服微信号',
  `cs_wechat_flock_qrcode_pic` longtext NOT NULL COMMENT '微信群'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mail_setting`
--

CREATE TABLE `zjhj_bd_mail_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '-1',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `send_mail` longtext CHARACTER SET utf8 NOT NULL COMMENT '发件人邮箱',
  `send_pwd` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '授权码',
  `send_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '发件人名称',
  `receive_mail` longtext CHARACTER SET utf8 NOT NULL COMMENT '收件人邮箱 多个用英文逗号隔开',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知 0--关闭 1--开启',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mall`
--

CREATE TABLE `zjhj_bd_mall` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `user_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否回收',
  `is_disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `expired_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商城';

--
-- 转存表中的数据 `zjhj_bd_mall`
--

INSERT INTO `zjhj_bd_mall` (`id`, `name`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `is_delete`, `is_recycle`, `is_disable`, `expired_at`) VALUES
(1, '小程序商城', 1, '2020-03-16 07:14:03', '2020-03-24 03:02:18', '0000-00-00 00:00:00', 0, 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mall_banner_relation`
--

CREATE TABLE `zjhj_bd_mall_banner_relation` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL COMMENT '轮播图id',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mall_goods`
--

CREATE TABLE `zjhj_bd_mall_goods` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_quick_shop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否快速购买',
  `is_sell_well` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热销',
  `is_negotiable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否面议商品',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商城商品额外信息表';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mall_members`
--

CREATE TABLE `zjhj_bd_mall_members` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `level` int(11) UNSIGNED NOT NULL COMMENT '会员等级',
  `name` varchar(65) NOT NULL DEFAULT '' COMMENT '等级名称',
  `auto_update` tinyint(1) NOT NULL COMMENT '是否开启自动升级',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '会员完成订单金额满足则升级',
  `discount` decimal(11,1) NOT NULL DEFAULT '0.0' COMMENT '会员折扣',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0--禁用 1--启用',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '会员图片',
  `is_purchase` tinyint(1) NOT NULL COMMENT '会员是否可购买',
  `price` decimal(11,2) NOT NULL COMMENT '购买会员价格',
  `rules` mediumtext NOT NULL COMMENT '会员规则',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `bg_pic_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mall_member_orders`
--

CREATE TABLE `zjhj_bd_mall_member_orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `order_no` varchar(30) NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_price` decimal(10,2) NOT NULL COMMENT '支付金额',
  `pay_type` tinyint(1) NOT NULL COMMENT '支付方式 1.线上支付',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支付 0--未支付 1--支付',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `detail` mediumtext,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mall_member_rights`
--

CREATE TABLE `zjhj_bd_mall_member_rights` (
  `id` int(11) UNSIGNED NOT NULL,
  `member_id` int(11) NOT NULL,
  `title` varchar(65) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `pic_url` varchar(255) NOT NULL DEFAULT '',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mall_setting`
--

CREATE TABLE `zjhj_bd_mall_setting` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `key` varchar(65) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mch`
--

CREATE TABLE `zjhj_bd_mch` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否营业0.否|1.是',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '好店推荐：0.不推荐|1.推荐',
  `review_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态：0=待审核，1.审核通过.2=审核不通过',
  `review_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '审核结果、备注',
  `review_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `realname` varchar(65) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `wechat` varchar(65) NOT NULL DEFAULT '' COMMENT '微信号',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mch_common_cat_id` int(11) NOT NULL COMMENT '商户所属类目',
  `transfer_rate` int(11) NOT NULL DEFAULT '0' COMMENT '商户手续费',
  `account_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '店铺排序|升序',
  `form_data` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mch_account_log`
--

CREATE TABLE `zjhj_bd_mch_account_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `money` decimal(11,2) NOT NULL COMMENT '金额',
  `desc` text NOT NULL COMMENT '备注说明',
  `type` tinyint(1) NOT NULL COMMENT '类型：1=收入，2=支出',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mch_cash`
--

CREATE TABLE `zjhj_bd_mch_cash` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL COMMENT '多商户ID',
  `money` decimal(10,2) NOT NULL COMMENT '提现金额',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提现状态：0=待处理，1=同意，2=拒绝',
  `transfer_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0.待转账 | 1.已转账  | 2.拒绝转账',
  `type` varchar(65) NOT NULL DEFAULT '0' COMMENT 'wx 微信| alipay 支付宝 | bank 银行卡 | balance 余额',
  `type_data` varchar(255) NOT NULL DEFAULT '' COMMENT '不同提现类型，提交的数据',
  `virtual_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '实际上打款方式',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mch_common_cat`
--

CREATE TABLE `zjhj_bd_mch_common_cat` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '类目名称',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序：升序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mch_goods`
--

CREATE TABLE `zjhj_bd_mch_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `mch_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0.申请上架|1.申请中|2.同意上架|3.拒绝上架',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '商户的排序',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mch_mall_setting`
--

CREATE TABLE `zjhj_bd_mch_mall_setting` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销0.否|1.是',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mch_order`
--

CREATE TABLE `zjhj_bd_mch_order` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `is_transfer` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否转入商户0.否|1.是',
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mch_setting`
--

CREATE TABLE `zjhj_bd_mch_setting` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销0.否|1.是',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启订单打印',
  `is_territorial_limitation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '区域购买限制',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `created_at` timestamp NOT NULL,
  `is_web_service` tinyint(1) NOT NULL DEFAULT '0',
  `web_service_url` varchar(255) NOT NULL DEFAULT '',
  `web_service_pic` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mch_visit_log`
--

CREATE TABLE `zjhj_bd_mch_visit_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_miaosha_banners`
--

CREATE TABLE `zjhj_bd_miaosha_banners` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_miaosha_goods`
--

CREATE TABLE `zjhj_bd_miaosha_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_warehouse_id` int(11) NOT NULL,
  `open_time` tinyint(1) NOT NULL COMMENT '开放时间',
  `open_date` date NOT NULL,
  `buy_limit` int(11) NOT NULL DEFAULT '-1' COMMENT '限单 -1|不限单',
  `virtual_miaosha_num` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟秒杀量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_miaosha_setting`
--

CREATE TABLE `zjhj_bd_miaosha_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `over_time` int(11) NOT NULL DEFAULT '1' COMMENT '未支付订单取消时间',
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启订单打印',
  `is_territorial_limitation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '区域购买限制',
  `open_time` text NOT NULL COMMENT '秒杀开放时间',
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `payment_type` longtext NOT NULL,
  `send_type` longtext NOT NULL,
  `goods_poster` longtext NOT NULL COMMENT '自定义海报'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='秒杀设置';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_mp_template_record`
--

CREATE TABLE `zjhj_bd_mp_template_record` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `open_id` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '模板消息是否发送成功0--失败|1--成功',
  `data` longtext NOT NULL COMMENT '模板消息内容',
  `error` longtext NOT NULL COMMENT '错误信息',
  `created_at` timestamp NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT '模板消息发送标示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模板消息发送记录表';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_option`
--

CREATE TABLE `zjhj_bd_option` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `zjhj_bd_option`
--

INSERT INTO `zjhj_bd_option` (`id`, `mall_id`, `mch_id`, `group`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 0, 0, '', 'version', '\"4.2.48\"', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order`
--

CREATE TABLE `zjhj_bd_order` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '多商户id，0表示商城订单',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `total_price` decimal(10,2) NOT NULL COMMENT '订单总金额(含运费)',
  `total_pay_price` decimal(10,2) NOT NULL COMMENT '实际支付总费用(含运费）',
  `express_original_price` decimal(10,2) NOT NULL COMMENT '运费(后台修改前)',
  `express_price` decimal(10,2) NOT NULL COMMENT '运费(后台修改后)',
  `total_goods_price` decimal(10,2) NOT NULL COMMENT '订单商品总金额(优惠后)',
  `total_goods_original_price` decimal(10,2) NOT NULL COMMENT '订单商品总金额(优惠前)',
  `member_discount_price` decimal(10,2) NOT NULL COMMENT '会员优惠价格(正数表示优惠，负数表示加价)',
  `use_user_coupon_id` int(11) NOT NULL COMMENT '使用的用户优惠券id',
  `coupon_discount_price` decimal(10,2) NOT NULL COMMENT '优惠券优惠金额',
  `use_integral_num` int(11) NOT NULL COMMENT '使用积分数量',
  `integral_deduction_price` decimal(10,2) NOT NULL COMMENT '积分抵扣金额',
  `name` varchar(65) NOT NULL DEFAULT '' COMMENT '收件人姓名',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人地址',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '用户订单备注',
  `order_form` longtext COMMENT '自定义表单（JSON）',
  `words` varchar(255) NOT NULL DEFAULT '' COMMENT '商家留言',
  `seller_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '商家订单备注',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支付：0.未支付|1.已支付',
  `pay_type` tinyint(4) NOT NULL COMMENT '支付方式：1.在线支付 2.货到付款 3.余额支付',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `is_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发货：0.未发货|1.已发货',
  `send_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发货时间',
  `customer_name` varchar(65) DEFAULT '' COMMENT '京东商家编号',
  `express` varchar(65) NOT NULL DEFAULT '' COMMENT '物流公司',
  `express_no` varchar(255) NOT NULL DEFAULT '' COMMENT '物流订单号',
  `is_sale` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否过售后时间',
  `is_confirm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收货状态：0.未收货|1.已收货',
  `confirm_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '确认收货时间',
  `cancel_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单取消状态：0.未取消|1.已取消|2.申请取消',
  `cancel_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单取消时间',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0.否|1.是',
  `send_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送方式：0--快递配送 1--到店自提 2--同城配送',
  `offline_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '核销码',
  `clerk_id` int(11) NOT NULL DEFAULT '0' COMMENT '核销员ID',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '自提门店ID',
  `sign` varchar(255) NOT NULL DEFAULT '' COMMENT '订单标识，用于区分插件',
  `token` varchar(32) NOT NULL DEFAULT '',
  `support_pay_types` longtext COMMENT '支持的支付方式，空表示支持系统设置支持的所有方式',
  `is_comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否评价0.否|1.是',
  `comment_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sale_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否申请售后',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '订单状态|1.已完成|0.进行中不能对订单进行任何操作',
  `back_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '后台优惠(正数表示优惠，负数表示加价)',
  `auto_cancel_time` timestamp NULL DEFAULT NULL COMMENT '自动取消时间',
  `auto_confirm_time` timestamp NULL DEFAULT NULL COMMENT '自动确认收货时间',
  `auto_sales_time` timestamp NULL DEFAULT NULL COMMENT '自动售后时间',
  `distance` int(11) DEFAULT '-1' COMMENT '同城配送距离，-1不在范围内，正数为距离KM',
  `city_mobile` varchar(100) DEFAULT '' COMMENT '同城配送联系方式',
  `location` varchar(255) DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `city_info` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order_clerk`
--

CREATE TABLE `zjhj_bd_order_clerk` (
  `id` int(11) UNSIGNED NOT NULL,
  `affirm_pay_type` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '确认收款类型|1.小程序收款|2.后台收款',
  `clerk_type` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '确认核销类型|1.小程序核销|2.后台核销',
  `clerk_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '核销备注',
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order_comments`
--

CREATE TABLE `zjhj_bd_order_comments` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` tinyint(4) NOT NULL COMMENT '评分：1=差评，2=中评，3=好',
  `content` text NOT NULL COMMENT '评价内容',
  `pic_url` text NOT NULL COMMENT '评价图片',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示：0.不显示|1.显示',
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否虚拟用户',
  `virtual_user` varchar(255) NOT NULL DEFAULT '' COMMENT '虚拟用户名',
  `virtual_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '虚拟头像',
  `virtual_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '虚拟评价时间',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_warehouse_id` int(11) NOT NULL COMMENT '商品库ID',
  `sign` varchar(255) NOT NULL DEFAULT '',
  `reply_content` text NOT NULL COMMENT '商家回复内容',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否匿名 0.否|1.是',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶0.否|1.是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order_comments_templates`
--

CREATE TABLE `zjhj_bd_order_comments_templates` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '模板类型:1.好评|2.中评|3.差评',
  `title` varchar(65) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order_detail`
--

CREATE TABLE `zjhj_bd_order_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL COMMENT '购买商品数量',
  `unit_price` decimal(10,2) NOT NULL COMMENT '商品单价',
  `total_original_price` decimal(10,2) NOT NULL COMMENT '商品原总价(优惠前)',
  `total_price` decimal(10,2) NOT NULL COMMENT '商品总价(优惠后)',
  `member_discount_price` decimal(10,2) NOT NULL COMMENT '会员优惠金额(正数表示优惠，负数表示加价)',
  `goods_info` longtext NOT NULL COMMENT '购买商品信息',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退款',
  `refund_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '售后状态 0--未售后 1--售后中 2--售后结束',
  `back_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '后台优惠(正数表示优惠，负数表示加价)',
  `sign` varchar(255) NOT NULL DEFAULT '' COMMENT '订单详情标识，用于区分插件',
  `goods_no` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `form_data` longtext COMMENT '自定义表单提交的数据',
  `form_id` int(11) DEFAULT '0' COMMENT '自定义表单的id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order_detail_express`
--

CREATE TABLE `zjhj_bd_order_detail_express` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `express` varchar(65) NOT NULL DEFAULT '',
  `send_type` tinyint(1) NOT NULL COMMENT '1.快递|2.其它方式',
  `express_no` varchar(255) NOT NULL DEFAULT '',
  `merchant_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '商家留言',
  `express_content` varchar(255) NOT NULL DEFAULT '' COMMENT '物流内容',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `customer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '京东物流编号',
  `express_single_id` int(11) NOT NULL DEFAULT '0' COMMENT '电子面单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order_detail_express_relation`
--

CREATE TABLE `zjhj_bd_order_detail_express_relation` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `order_detail_express_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order_express_single`
--

CREATE TABLE `zjhj_bd_order_express_single` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `express_code` varchar(255) NOT NULL COMMENT '快递公司编码',
  `ebusiness_id` varchar(255) NOT NULL COMMENT '快递鸟id',
  `print_teplate` longtext NOT NULL,
  `order` longtext NOT NULL COMMENT '订单信息',
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order_pay_result`
--

CREATE TABLE `zjhj_bd_order_pay_result` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `data` longtext COMMENT 'json数据',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order_refund`
--

CREATE TABLE `zjhj_bd_order_refund` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL COMMENT '关联订单详情',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '退款单号',
  `type` tinyint(1) NOT NULL COMMENT '售后类型：1=退货退款，2=换货',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '用户退款备注、说明',
  `pic_list` mediumtext NOT NULL COMMENT '用户上传图片凭证',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.待商家处理 2.同意 3.拒绝',
  `status_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '商家处理时间',
  `merchant_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '商家同意|拒绝备注、理由',
  `is_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户是否发货 0.未发货1.已发货',
  `send_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发货时间',
  `customer_name` varchar(65) DEFAULT '' COMMENT '京东商家编号',
  `express` varchar(65) NOT NULL DEFAULT '' COMMENT '快递公司',
  `express_no` varchar(255) NOT NULL DEFAULT '' COMMENT '快递单号',
  `address_id` int(11) NOT NULL DEFAULT '0' COMMENT '退换货地址ID',
  `is_confirm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商家确认操作',
  `confirm_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '确认时间',
  `merchant_customer_name` varchar(65) DEFAULT '' COMMENT '商家京东商家编号',
  `merchant_express` varchar(65) NOT NULL DEFAULT '' COMMENT '商家发货快递公司',
  `merchant_express_no` varchar(255) NOT NULL DEFAULT '' COMMENT '商家发货快递单号',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `refund_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_refund` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否打款，2代表旧数据',
  `reality_refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商家实际退款金额',
  `merchant_express_content` varchar(255) NOT NULL DEFAULT '' COMMENT '物流内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order_send_template`
--

CREATE TABLE `zjhj_bd_order_send_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '发货单名称',
  `cover_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `params` text NOT NULL COMMENT '模板参数',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为默认模板0.否|1.是',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order_send_template_address`
--

CREATE TABLE `zjhj_bd_order_send_template_address` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '网点名称',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '联系电话',
  `code` varchar(60) NOT NULL DEFAULT '' COMMENT '网点邮编',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_order_submit_result`
--

CREATE TABLE `zjhj_bd_order_submit_result` (
  `id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_payment_order`
--

CREATE TABLE `zjhj_bd_payment_order` (
  `id` int(11) NOT NULL,
  `payment_order_union_id` int(11) NOT NULL,
  `order_no` varchar(32) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `is_pay` int(1) NOT NULL DEFAULT '0' COMMENT '支付状态：0=未支付，1=已支付',
  `pay_type` int(1) NOT NULL DEFAULT '0' COMMENT '支付方式：1=微信支付，2=货到付款，3=余额支付，4=支付宝支付',
  `title` varchar(128) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notify_class` varchar(512) NOT NULL,
  `refund` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '已退款金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_payment_order_union`
--

CREATE TABLE `zjhj_bd_payment_order_union` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_no` varchar(32) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `is_pay` int(1) NOT NULL DEFAULT '0' COMMENT '支付状态：0=未支付，1=已支付',
  `pay_type` int(1) NOT NULL DEFAULT '0' COMMENT '支付方式：1=微信支付，2=货到付款，3=余额支付，4=支付宝支付',
  `title` varchar(128) NOT NULL,
  `support_pay_types` text COMMENT '支持的支付方式（JSON）',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_payment_refund`
--

CREATE TABLE `zjhj_bd_payment_refund` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '退款单号',
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `is_pay` int(1) NOT NULL DEFAULT '0' COMMENT '支付状态 0--未支付|1--已支付',
  `pay_type` int(1) NOT NULL DEFAULT '0' COMMENT '支付方式：1=微信支付，2=货到付款，3=余额支付，4=支付宝支付',
  `title` varchar(128) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `out_trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '支付单号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='退款订单';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_payment_transfer`
--

CREATE TABLE `zjhj_bd_payment_transfer` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL COMMENT '提交微信或支付宝的订单号',
  `transfer_order_no` varchar(255) NOT NULL COMMENT '发起 打款的订单号',
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `is_pay` int(1) NOT NULL DEFAULT '0' COMMENT '支付状态 0--未支付|1--已支付',
  `pay_type` varchar(255) NOT NULL DEFAULT '' COMMENT '方式：wechat--微信打款 alipay--支付宝打款',
  `title` varchar(128) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='平台向用户打款';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pintuan_banners`
--

CREATE TABLE `zjhj_bd_pintuan_banners` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pintuan_cats`
--

CREATE TABLE `zjhj_bd_pintuan_cats` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '100',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pintuan_goods`
--

CREATE TABLE `zjhj_bd_pintuan_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `is_alone_buy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许单独购买',
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '拼团结束时间',
  `groups_restrictions` int(11) NOT NULL DEFAULT '-1' COMMENT '拼团次数限制',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `is_sell_well` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热销'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pintuan_goods_attr`
--

CREATE TABLE `zjhj_bd_pintuan_goods_attr` (
  `id` int(11) UNSIGNED NOT NULL,
  `pintuan_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '拼团价',
  `pintuan_stock` int(11) NOT NULL COMMENT '拼团库存',
  `pintuan_goods_groups_id` int(11) NOT NULL COMMENT '拼团设置ID',
  `goods_attr_id` int(11) NOT NULL COMMENT '商城商品规格ID',
  `goods_id` int(11) NOT NULL COMMENT '商城商品ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pintuan_goods_groups`
--

CREATE TABLE `zjhj_bd_pintuan_goods_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(11) NOT NULL,
  `people_num` int(11) NOT NULL DEFAULT '2' COMMENT '拼团人数',
  `preferential_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '团长优惠',
  `pintuan_time` int(11) NOT NULL DEFAULT '1' COMMENT '拼团限间',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `group_num` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pintuan_goods_member_price`
--

CREATE TABLE `zjhj_bd_pintuan_goods_member_price` (
  `id` int(11) UNSIGNED NOT NULL,
  `level` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_id` int(11) NOT NULL COMMENT '商城商品ID',
  `goods_attr_id` int(11) NOT NULL COMMENT '商城商品规格ID',
  `pintuan_goods_groups_id` int(11) NOT NULL COMMENT '拼团设置ID',
  `pintuan_goods_attr_id` int(11) NOT NULL COMMENT '拼团商品规格ID',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pintuan_goods_share`
--

CREATE TABLE `zjhj_bd_pintuan_goods_share` (
  `id` int(11) NOT NULL,
  `share_commission_first` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '一级分销佣金比例',
  `share_commission_second` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '二级分销佣金比例',
  `share_commission_third` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '三级分销佣金比例',
  `goods_id` int(11) NOT NULL,
  `goods_attr_id` int(11) NOT NULL COMMENT '商城商品规格ID',
  `pintuan_goods_groups_id` int(11) NOT NULL COMMENT '拼团设置ID',
  `pintuan_goods_attr_id` int(11) NOT NULL DEFAULT '0' COMMENT '拼团商品规格ID',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '分销商等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pintuan_orders`
--

CREATE TABLE `zjhj_bd_pintuan_orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `preferential_price` decimal(10,2) NOT NULL COMMENT '团长优惠',
  `mall_id` int(11) NOT NULL,
  `success_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '成团时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0.待付款|1.拼团中|2.拼团成功|3.拼团失败',
  `people_num` int(11) NOT NULL COMMENT '成团所需人数',
  `pintuan_time` int(11) NOT NULL DEFAULT '2' COMMENT '拼团限时(小时)',
  `pintuan_goods_groups_id` int(11) NOT NULL COMMENT '阶梯团ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pintuan_order_relation`
--

CREATE TABLE `zjhj_bd_pintuan_order_relation` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '商城订单ID',
  `user_id` int(11) NOT NULL,
  `pintuan_order_id` int(11) NOT NULL COMMENT '组团订单ID',
  `is_parent` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否为团长',
  `is_groups` tinyint(4) NOT NULL COMMENT '0.单独购买|1.拼团购买',
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `robot_id` int(11) NOT NULL DEFAULT '0',
  `cancel_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '拼团订单取消状态:0.未取消|1.超出拼团总人数取消'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pintuan_robots`
--

CREATE TABLE `zjhj_bd_pintuan_robots` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `nickname` varchar(65) NOT NULL DEFAULT '' COMMENT '机器人昵称',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pintuan_setting`
--

CREATE TABLE `zjhj_bd_pintuan_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启订单打印',
  `rules` text NOT NULL COMMENT '拼团规则',
  `is_territorial_limitation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '区域购买限制',
  `advertisement` text NOT NULL COMMENT '拼团广告',
  `is_advertisement` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启拼团广告',
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `goods_poster` longtext NOT NULL COMMENT '自定义海报'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='砍价设置';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pond`
--

CREATE TABLE `zjhj_bd_pond` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '别名',
  `type` int(11) NOT NULL COMMENT '1.红包2.优惠卷3.积分4.实物.5.无',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '红包价格',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠卷',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pond_log`
--

CREATE TABLE `zjhj_bd_pond_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `pond_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT ' 0未领取1 已领取',
  `type` int(11) NOT NULL COMMENT '1.红包2.优惠卷3.积分4.实物5无',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `detail` varchar(2000) NOT NULL DEFAULT '' COMMENT '优惠券信息',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `raffled_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pond_log_coupon_relation`
--

CREATE TABLE `zjhj_bd_pond_log_coupon_relation` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_coupon_id` int(11) NOT NULL COMMENT '用户优惠券id',
  `pond_log_id` int(11) NOT NULL COMMENT '奖品记录id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pond_order`
--

CREATE TABLE `zjhj_bd_pond_order` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `pond_log_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_pond_setting`
--

CREATE TABLE `zjhj_bd_pond_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序标题',
  `type` smallint(1) NOT NULL COMMENT '1.天 2 用户',
  `probability` int(11) NOT NULL DEFAULT '0' COMMENT '概率',
  `oppty` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖次数',
  `start_at` timestamp NOT NULL COMMENT '开始时间',
  `end_at` timestamp NOT NULL COMMENT '结束时间',
  `deplete_integral_num` int(11) NOT NULL DEFAULT '0' COMMENT '消耗积分',
  `rule` longtext NOT NULL COMMENT '规则',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启邮件提醒',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启打印'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_postage_rules`
--

CREATE TABLE `zjhj_bd_postage_rules` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(65) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL COMMENT '规则详情',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '计费方式【1=>按重计费、2=>按件计费】',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_printer`
--

CREATE TABLE `zjhj_bd_printer` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `setting` longtext NOT NULL COMMENT '设置',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_printer_setting`
--

CREATE TABLE `zjhj_bd_printer_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `printer_id` int(11) NOT NULL COMMENT '打印机id',
  `block_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0关闭 1启用',
  `is_attr` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不使用规格 1使用规格',
  `type` longtext NOT NULL COMMENT 'order(下单打印)-> 0关闭 1开启 \r\npay (付款打印)-> 0关闭 1开启 \r\nconfirm (确认收货打印)-> 0关闭 1开启 \r\n ',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `big` int(11) NOT NULL DEFAULT '0' COMMENT '放大倍数',
  `show_type` longtext NOT NULL COMMENT '打印参数 attr 规格 goods_no 货号 form_data 下单表单',
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_qr_code_parameter`
--

CREATE TABLE `zjhj_bd_qr_code_parameter` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(30) NOT NULL DEFAULT '',
  `data` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_quick_share_goods`
--

CREATE TABLE `zjhj_bd_quick_share_goods` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `share_text` varchar(255) NOT NULL COMMENT '分享文本',
  `share_pic` longtext NOT NULL COMMENT '素材图片',
  `material_sort` int(11) NOT NULL DEFAULT '0' COMMENT '素材排序',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `material_video_url` varchar(255) NOT NULL DEFAULT '' COMMENT '动态视频',
  `material_cover_url` varchar(255) NOT NULL DEFAULT '' COMMENT '视频封面',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_quick_share_setting`
--

CREATE TABLE `zjhj_bd_quick_share_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发圈对象 仅素材 1全部商品',
  `goods_poster` longtext NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_quick_shop_cats`
--

CREATE TABLE `zjhj_bd_quick_shop_cats` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_recharge`
--

CREATE TABLE `zjhj_bd_recharge` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '名称',
  `pay_price` decimal(10,2) NOT NULL COMMENT '支付价格',
  `send_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送价格',
  `is_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `send_integral` int(11) NOT NULL DEFAULT '0' COMMENT '赠送的积分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_recharge_orders`
--

CREATE TABLE `zjhj_bd_recharge_orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `order_no` varchar(32) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `pay_price` decimal(10,2) NOT NULL COMMENT '充值金额',
  `send_price` decimal(10,2) NOT NULL COMMENT '赠送金额',
  `pay_type` tinyint(4) NOT NULL COMMENT '支付方式 1.线上支付',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支付 0--未支付 1--支付',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `send_integral` int(11) NOT NULL DEFAULT '0' COMMENT '赠送的积分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_refund_address`
--

CREATE TABLE `zjhj_bd_refund_address` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(65) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `address_detail` varchar(255) NOT NULL DEFAULT '',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scan_code_pay_activities`
--

CREATE TABLE `zjhj_bd_scan_code_pay_activities` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `start_time` timestamp NOT NULL COMMENT '活动开始时间',
  `end_time` timestamp NOT NULL COMMENT '活动结束时间',
  `send_type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1.赠送所有规则|2.赠送满足最高规则',
  `rules` text COMMENT '买单规则',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scan_code_pay_activities_groups`
--

CREATE TABLE `zjhj_bd_scan_code_pay_activities_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `activity_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scan_code_pay_activities_groups_level`
--

CREATE TABLE `zjhj_bd_scan_code_pay_activities_groups_level` (
  `id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scan_code_pay_activities_groups_rules`
--

CREATE TABLE `zjhj_bd_scan_code_pay_activities_groups_rules` (
  `id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) NOT NULL,
  `rules_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.赠送规则|2.优惠规则',
  `consume_money` decimal(10,2) NOT NULL COMMENT '单次消费金额',
  `send_integral_num` int(11) NOT NULL COMMENT '赠送积分',
  `send_integral_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.固定值|2.百分比',
  `send_money` decimal(10,2) NOT NULL COMMENT '赠送余额',
  `preferential_money` decimal(10,2) NOT NULL COMMENT '优惠金额',
  `integral_deduction` int(11) NOT NULL COMMENT '积分抵扣',
  `integral_deduction_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.固定值|2.百分比',
  `is_coupon` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可使用优惠券',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scan_code_pay_activities_groups_rules_cards`
--

CREATE TABLE `zjhj_bd_scan_code_pay_activities_groups_rules_cards` (
  `id` int(11) UNSIGNED NOT NULL,
  `group_rule_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `send_num` int(11) NOT NULL COMMENT '赠送数量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scan_code_pay_activities_groups_rules_coupons`
--

CREATE TABLE `zjhj_bd_scan_code_pay_activities_groups_rules_coupons` (
  `id` int(11) UNSIGNED NOT NULL,
  `group_rule_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `send_num` int(11) NOT NULL COMMENT '赠送数量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scan_code_pay_orders`
--

CREATE TABLE `zjhj_bd_scan_code_pay_orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `activity_preferential_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动优惠价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scan_code_pay_setting`
--

CREATE TABLE `zjhj_bd_scan_code_pay_setting` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_scan_code_pay` tinyint(1) NOT NULL DEFAULT '0',
  `payment_type` text NOT NULL,
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0',
  `share_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1.百分比|2.固定金额',
  `share_commission_first` decimal(10,2) NOT NULL DEFAULT '0.00',
  `share_commission_second` decimal(10,2) NOT NULL DEFAULT '0.00',
  `share_commission_third` decimal(10,2) NOT NULL DEFAULT '0.00',
  `poster` mediumtext NOT NULL COMMENT '自定义海报',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scratch`
--

CREATE TABLE `zjhj_bd_scratch` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1.红包2.优惠卷3.积分4.实物.5.无',
  `status` tinyint(1) NOT NULL COMMENT '状态 0 关闭 1开启',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '红包价格',
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scratch_log`
--

CREATE TABLE `zjhj_bd_scratch_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `scratch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT ' 0预领取 1 未领取 2 已领取',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1.红包2.优惠卷3.积分4.实物5无',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `detail` longtext NOT NULL COMMENT '优惠券信息',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `raffled_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scratch_log_coupon_relation`
--

CREATE TABLE `zjhj_bd_scratch_log_coupon_relation` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_coupon_id` int(11) NOT NULL COMMENT '用户优惠券id',
  `scratch_log_id` int(11) NOT NULL COMMENT '记录id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scratch_order`
--

CREATE TABLE `zjhj_bd_scratch_order` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `scratch_log_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_scratch_setting`
--

CREATE TABLE `zjhj_bd_scratch_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序标题',
  `type` smallint(1) NOT NULL COMMENT '1.天 2 用户',
  `probability` int(11) NOT NULL DEFAULT '0' COMMENT '概率',
  `oppty` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖次数',
  `start_at` timestamp NOT NULL COMMENT '开始时间',
  `end_at` timestamp NOT NULL COMMENT '结束时间',
  `deplete_integral_num` int(11) NOT NULL DEFAULT '0' COMMENT '消耗积分',
  `rule` longtext NOT NULL COMMENT '规则',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启邮件提醒',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启打印'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_share`
--

CREATE TABLE `zjhj_bd_share` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分销商名称',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '分销商手机号',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可提现佣金',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '用户申请分销商状态0--申请中 1--成功 2--失败',
  `total_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计佣金',
  `content` longtext COMMENT '备注',
  `is_delete` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `apply_at` datetime DEFAULT NULL COMMENT '申请时间',
  `become_at` datetime DEFAULT NULL COMMENT '成为分销商时间',
  `reason` longtext COMMENT '审核原因',
  `first_children` int(11) NOT NULL DEFAULT '0' COMMENT '直接下级数量',
  `all_children` int(11) NOT NULL DEFAULT '0' COMMENT '所有下级数量',
  `all_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总佣金数量(包括已发放和未发放且未退款的佣金）',
  `all_order` int(11) NOT NULL DEFAULT '0' COMMENT '分销订单数量',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '分销商等级',
  `level_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '成为分销商等级时间',
  `delete_first_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除后是否第一次展示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分销商信息';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_share_cash`
--

CREATE TABLE `zjhj_bd_share_cash` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现手续费（%）',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '提现方式 auto--自动打款 wechat--微信打款 alipay--支付宝打款 bank--银行转账 balance--打款到余额',
  `extra` longtext COMMENT '额外信息 例如微信账号、支付宝账号等',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '提现状态 0--申请 1--同意 2--已打款 3--驳回',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `content` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现记录表';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_share_cash_log`
--

CREATE TABLE `zjhj_bd_share_cash_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '类型 1--收入 2--支出',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动佣金',
  `desc` longtext,
  `custom_desc` longtext,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_share_level`
--

CREATE TABLE `zjhj_bd_share_level` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '分销等级1~100',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分销等级名称',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '升级条件：1--下线用户数|2--累计佣金|3--已提现佣金',
  `condition` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '下线用户数（人）|累计佣金数（元）|已提现佣金数（元）',
  `price_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分销佣金类型：1--百分比|2--固定金额',
  `first` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '一级分销佣金数（元）',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `second` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '二级分销佣金数（元）',
  `third` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '三级分销佣金数（元）',
  `is_auto_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用自动升级',
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '等级说明'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_share_order`
--

CREATE TABLE `zjhj_bd_share_order` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '购物者用户id',
  `first_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上一级用户id',
  `second_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上二级用户id',
  `third_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上三级用户id',
  `first_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '上一级分销佣金',
  `second_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '上二级分销佣金',
  `third_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '上三级分销佣金',
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未退款 1退款',
  `is_transfer` tinyint(1) NOT NULL DEFAULT '0' COMMENT '佣金发放状态：0=未发放，1=已发放',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分销订单';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_share_order_log`
--

CREATE TABLE `zjhj_bd_share_order_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `share_setting` longtext NOT NULL COMMENT '分销设置情况',
  `order_share_info` longtext NOT NULL COMMENT '订单分销情况',
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_share_setting`
--

CREATE TABLE `zjhj_bd_share_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0--未删除 1--已删除',
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分销设置';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_shopping_buys`
--

CREATE TABLE `zjhj_bd_shopping_buys` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_shopping_likes`
--

CREATE TABLE `zjhj_bd_shopping_likes` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_shopping_like_users`
--

CREATE TABLE `zjhj_bd_shopping_like_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `like_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_shopping_setting`
--

CREATE TABLE `zjhj_bd_shopping_setting` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启0.关闭|1.开启',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_step_activity`
--

CREATE TABLE `zjhj_bd_step_activity` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '奖金池',
  `step_num` int(11) NOT NULL DEFAULT '0' COMMENT '挑战步数',
  `bail_currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '0进行中 1 已完成 2 已解散',
  `begin_at` date NOT NULL COMMENT '开始时间',
  `end_at` date NOT NULL COMMENT '结束时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_step_activity_info`
--

CREATE TABLE `zjhj_bd_step_activity_info` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `activity_log_id` int(11) NOT NULL COMMENT 'a',
  `num` int(11) NOT NULL COMMENT '提交步数',
  `open_date` date NOT NULL COMMENT '创建时间',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_step_activity_log`
--

CREATE TABLE `zjhj_bd_step_activity_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `step_currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '缴纳金',
  `reward_currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '奖励金额',
  `status` tinyint(255) NOT NULL DEFAULT '0' COMMENT '0报名1达标  2成功 3失败 4解散',
  `created_at` timestamp NOT NULL,
  `raffled_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_step_ad`
--

CREATE TABLE `zjhj_bd_step_ad` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `unit_id` varchar(255) NOT NULL DEFAULT '' COMMENT '广告id',
  `site` int(11) NOT NULL DEFAULT '0' COMMENT '位置',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0关闭 1开启',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_step_banner_relation`
--

CREATE TABLE `zjhj_bd_step_banner_relation` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL COMMENT '轮播图id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_step_daily`
--

CREATE TABLE `zjhj_bd_step_daily` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `ratio` int(11) NOT NULL COMMENT '兑换概率',
  `real_num` int(11) NOT NULL COMMENT '真实步数',
  `num` int(11) NOT NULL COMMENT '兑换加成后数量',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_step_goods`
--

CREATE TABLE `zjhj_bd_step_goods` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活力币',
  `goods_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_step_goods_attr`
--

CREATE TABLE `zjhj_bd_step_goods_attr` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `attr_id` int(11) NOT NULL COMMENT '规格',
  `currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活力币',
  `goods_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_step_log`
--

CREATE TABLE `zjhj_bd_step_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1收入 2 支出',
  `currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活力币',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `data` longtext NOT NULL COMMENT '详情',
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_step_order`
--

CREATE TABLE `zjhj_bd_step_order` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `mall_id` int(11) NOT NULL,
  `num` int(11) NOT NULL COMMENT '商品数量',
  `total_pay_price` decimal(10,2) NOT NULL COMMENT '订单实际支付价格',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `currency` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `token` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_step_setting`
--

CREATE TABLE `zjhj_bd_step_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `convert_max` int(11) NOT NULL DEFAULT '0' COMMENT '每日最高兑换数',
  `convert_ratio` int(11) NOT NULL DEFAULT '0' COMMENT '兑换比率',
  `currency_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活力币别名',
  `activity_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '活动背景',
  `ranking_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '排行榜背景',
  `qrcode_pic` longtext NOT NULL COMMENT '海报缩略图',
  `invite_ratio` int(11) NOT NULL DEFAULT '0' COMMENT '邀请比率',
  `remind_at` varchar(255) NOT NULL DEFAULT '16' COMMENT '提醒时间',
  `rule` longtext NOT NULL COMMENT '活动规则',
  `activity_rule` longtext NOT NULL COMMENT '活动规则',
  `ranking_num` int(11) NOT NULL DEFAULT '0' COMMENT '全国排行限制',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序标题',
  `share_title` varchar(255) NOT NULL DEFAULT '' COMMENT '转发标题',
  `qrcode_title` varchar(255) NOT NULL DEFAULT '' COMMENT '海报文字',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启邮件提醒',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启打印',
  `is_territorial_limitation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启区域允许购买',
  `goods_poster` longtext NOT NULL COMMENT '自定义海报',
  `step_poster` longtext NOT NULL COMMENT '步数海报'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_step_user`
--

CREATE TABLE `zjhj_bd_step_user` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `ratio` int(11) NOT NULL DEFAULT '0' COMMENT '概率加成',
  `step_currency` decimal(10,2) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '邀请ID',
  `invite_ratio` int(11) NOT NULL DEFAULT '0' COMMENT '邀请好友加成',
  `is_remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否提醒',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_stock_bonus_log`
--

CREATE TABLE `zjhj_bd_stock_bonus_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `bonus_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1按周，2按月',
  `bonus_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分红金额',
  `bonus_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当时的分红比例',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '分红订单数',
  `stock_num` int(11) NOT NULL DEFAULT '0' COMMENT '当时股东人数',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分红时间段-开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分红时间段-结束时间',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_stock_cash`
--

CREATE TABLE `zjhj_bd_stock_cash` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现手续费（%）',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '提现方式 auto--自动打款 wechat--微信打款 alipay--支付宝打款 bank--银行转账 balance--打款到余额',
  `extra` longtext COMMENT '额外信息 例如微信账号、支付宝账号等',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '提现状态 0--申请 1--同意 2--已打款 3--驳回',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `content` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现记录表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_stock_cash_log`
--

CREATE TABLE `zjhj_bd_stock_cash_log` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '类型 1--收入 2--支出',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动佣金',
  `desc` longtext,
  `custom_desc` longtext,
  `level_id` int(11) DEFAULT '0' COMMENT '当时的股东等级',
  `level_name` varchar(100) DEFAULT NULL,
  `order_num` int(11) DEFAULT '0',
  `bonus_rate` decimal(10,2) DEFAULT '0.00' COMMENT '当时的分红比例',
  `bonus_id` int(11) DEFAULT '0' COMMENT '股东完成分红记录ID',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分红日志' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_stock_level`
--

CREATE TABLE `zjhj_bd_stock_level` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '等级名称',
  `bonus_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分红比例',
  `condition` int(11) NOT NULL DEFAULT '0' COMMENT '升级条件，0不自动升级',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认等级，0否1是',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='股东等级表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_stock_level_up`
--

CREATE TABLE `zjhj_bd_stock_level_up` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1下线总人数，2累计佣金总额，3已提现佣金总额，4分销订单总数，5分销订单总金额',
  `remark` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='股东等级升级条件' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_stock_order`
--

CREATE TABLE `zjhj_bd_stock_order` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `total_pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单实付金额',
  `is_bonus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已分红，0未分红',
  `bonus_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分红时间',
  `bonus_id` int(11) NOT NULL DEFAULT '0' COMMENT '股东完成分红记录ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分红池' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_stock_setting`
--

CREATE TABLE `zjhj_bd_stock_setting` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0--未删除 1--已删除',
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='股东分红设置' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_stock_user`
--

CREATE TABLE `zjhj_bd_stock_user` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应等级表ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-2被拒或移除后再次申请没提交 -1移除 0审核中，1同意，2拒绝',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `applyed_at` timestamp NOT NULL COMMENT '申请时间',
  `agreed_at` timestamp NOT NULL COMMENT '审核时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='股东表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_stock_user_info`
--

CREATE TABLE `zjhj_bd_stock_user_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT '' COMMENT '股东姓名',
  `phone` varchar(11) DEFAULT '' COMMENT '股东手机号',
  `all_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计分红',
  `total_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前分红',
  `out_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已提现分红',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `reason` text NOT NULL COMMENT '拒绝理由',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='股东信息表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_store`
--

CREATE TABLE `zjhj_bd_store` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(65) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '纬度',
  `score` int(11) NOT NULL DEFAULT '5' COMMENT '店铺评分',
  `cover_url` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺封面图',
  `pic_url` text NOT NULL COMMENT '门店轮播图',
  `business_hours` varchar(125) NOT NULL DEFAULT '' COMMENT '营业时间',
  `description` text NOT NULL COMMENT '门店描述',
  `scope` mediumtext NOT NULL COMMENT '门店经营范围',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认总店0.否|1.是',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_all_day` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否全天营业0.否|1.是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_template_record`
--

CREATE TABLE `zjhj_bd_template_record` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '模板消息是否发送成功0--失败|1--成功',
  `data` longtext NOT NULL COMMENT '模板消息内容',
  `error` longtext NOT NULL COMMENT '错误信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL COMMENT '模板消息发送标示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模板消息发送记录表';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_topic`
--

CREATE TABLE `zjhj_bd_topic` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '分类',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `sub_title` varchar(255) NOT NULL DEFAULT '' COMMENT '副标题（未用）',
  `content` longtext NOT NULL COMMENT '专题内容',
  `layout` smallint(1) NOT NULL DEFAULT '0' COMMENT '布局方式：0=小图，1=大图模式',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序：升序',
  `cover_pic` varchar(255) NOT NULL COMMENT '封面图',
  `read_count` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数（未用）',
  `virtual_read_count` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟阅读量',
  `virtual_agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟点赞数（未用）',
  `virtual_favorite_count` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟收藏量',
  `qrcode_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义分享图片(海报图)',
  `app_share_title` varchar(65) NOT NULL DEFAULT '' COMMENT '自定义分享标题',
  `is_chosen` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精选',
  `is_delete` tinyint(11) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `pic_list` longtext,
  `detail` longtext,
  `abstract` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_topic_favorite`
--

CREATE TABLE `zjhj_bd_topic_favorite` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_topic_type`
--

CREATE TABLE `zjhj_bd_topic_type` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0隐藏 1开启',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_ttapp_config`
--

CREATE TABLE `zjhj_bd_ttapp_config` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` varchar(64) DEFAULT NULL COMMENT '商户号',
  `app_key` varchar(64) DEFAULT NULL,
  `app_secret` varchar(64) DEFAULT NULL,
  `pay_app_secret` varchar(128) DEFAULT NULL,
  `pay_app_id` varchar(64) DEFAULT NULL,
  `alipay_app_id` varchar(128) DEFAULT NULL,
  `alipay_public_key` text,
  `alipay_private_key` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_ttapp_jump_appid`
--

CREATE TABLE `zjhj_bd_ttapp_jump_appid` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `appid` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_ttapp_template`
--

CREATE TABLE `zjhj_bd_ttapp_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `tpl_name` varchar(65) NOT NULL DEFAULT '',
  `tpl_id` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_user`
--

CREATE TABLE `zjhj_bd_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '多商户ID',
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `nickname` varchar(45) NOT NULL DEFAULT '',
  `auth_key` varchar(128) NOT NULL,
  `access_token` varchar(128) NOT NULL,
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `zjhj_bd_user`
--

INSERT INTO `zjhj_bd_user` (`id`, `mall_id`, `mch_id`, `username`, `password`, `nickname`, `auth_key`, `access_token`, `mobile`, `created_at`, `updated_at`, `deleted_at`, `is_delete`) VALUES
(1, 0, 0, 'admin', '$2y$13$dstA9zulH1ZvQva5c1GDBuvkvBaOGs0v5Lhy1BlN6ipHWx7Wa2vXu', 'admin', 'qdpwCPMqbRaVCjS1f8HT85v6DUJKF8xb', 'Zr-1ZST2rSD-8D8VX7MYgWVMYv6BTSDk', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_user_auth_login`
--

CREATE TABLE `zjhj_bd_user_auth_login` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL DEFAULT '',
  `is_pass` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否确认登录',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_user_card`
--

CREATE TABLE `zjhj_bd_user_card` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `pic_url` varchar(255) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '详情',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_use` int(11) NOT NULL DEFAULT '0' COMMENT '是否使用 0--未使用 1--已使用',
  `clerk_id` int(11) NOT NULL DEFAULT '0' COMMENT '核销人id',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `clerked_at` timestamp NOT NULL COMMENT ' 核销时间',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '发放卡券的订单id',
  `order_detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单详情ID',
  `data` longtext COMMENT '额外信息字段',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_user_coupon`
--

CREATE TABLE `zjhj_bd_user_coupon` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `coupon_id` int(11) NOT NULL COMMENT '优惠卷',
  `sub_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满减',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣',
  `coupon_min_price` decimal(10,2) NOT NULL COMMENT '最低消费金额',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '优惠券类型：1=折扣，2=满减',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期结束时间',
  `is_use` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已使用：0=未使用，1=已使用',
  `is_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `receive_type` varchar(255) NOT NULL DEFAULT '' COMMENT '获取方式',
  `coupon_data` longtext NOT NULL COMMENT '优惠券信息json格式',
  `discount_limit` decimal(10,2) DEFAULT NULL COMMENT '折扣优惠上限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_user_coupon_auto`
--

CREATE TABLE `zjhj_bd_user_coupon_auto` (
  `id` int(11) NOT NULL,
  `user_coupon_id` int(11) NOT NULL,
  `auto_coupon_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_user_coupon_center`
--

CREATE TABLE `zjhj_bd_user_coupon_center` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0' COMMENT '商城ID',
  `user_coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0--不删除 1--删除',
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户领取的优惠券关联表（领券中心）';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_user_coupon_member`
--

CREATE TABLE `zjhj_bd_user_coupon_member` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `member_level` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `user_coupon_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_user_identity`
--

CREATE TABLE `zjhj_bd_user_identity` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '用户身份表',
  `user_id` int(11) NOT NULL,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为超级管理员',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为管理员',
  `is_operator` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为操作员|员工',
  `member_level` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级:0.普通成员',
  `is_distributor` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为分销商',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `zjhj_bd_user_identity`
--

INSERT INTO `zjhj_bd_user_identity` (`id`, `user_id`, `is_super_admin`, `is_admin`, `is_operator`, `member_level`, `is_distributor`, `is_delete`) VALUES
(1, 1, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_user_info`
--

CREATE TABLE `zjhj_bd_user_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `platform_user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '用户所属平台的用户id',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `total_integral` int(11) NOT NULL DEFAULT '0' COMMENT '最高积分',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `total_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总余额',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `is_blacklist` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否黑名单',
  `contact_way` varchar(255) NOT NULL DEFAULT '' COMMENT '联系方式',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `junior_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '成为下级时间',
  `platform` varchar(255) NOT NULL DEFAULT '' COMMENT '用户所属平台标识',
  `temp_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '临时上级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_video`
--

CREATE TABLE `zjhj_bd_video` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `type` tinyint(1) NOT NULL COMMENT '视频来源 0--源地址 1--腾讯视频',
  `url` varchar(2048) NOT NULL DEFAULT '' COMMENT '链接',
  `pic_url` varchar(255) NOT NULL COMMENT '封面图',
  `content` longtext NOT NULL COMMENT '详情介绍',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_vip_card`
--

CREATE TABLE `zjhj_bd_vip_card` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '会员卡名称',
  `cover` varchar(2048) NOT NULL DEFAULT '' COMMENT '卡片样式',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:指定商品类别 1:指定商品 2:全场通用',
  `type_info` varchar(2048) NOT NULL DEFAULT '',
  `discount` decimal(11,1) NOT NULL DEFAULT '0.0' COMMENT '折扣',
  `is_discount` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:关闭 1开启',
  `is_free_delivery` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不包邮 1:包邮',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_vip_card_appoint_goods`
--

CREATE TABLE `zjhj_bd_vip_card_appoint_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_vip_card_cards`
--

CREATE TABLE `zjhj_bd_vip_card_cards` (
  `id` int(11) UNSIGNED NOT NULL,
  `detail_id` int(11) NOT NULL COMMENT 'vip卡id',
  `card_id` int(11) NOT NULL COMMENT '卡券id',
  `send_num` int(11) NOT NULL COMMENT '赠送数量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_vip_card_coupons`
--

CREATE TABLE `zjhj_bd_vip_card_coupons` (
  `id` int(11) UNSIGNED NOT NULL,
  `detail_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `send_num` int(11) NOT NULL COMMENT '赠送数量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_vip_card_detail`
--

CREATE TABLE `zjhj_bd_vip_card_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '标题',
  `cover` varchar(2048) NOT NULL DEFAULT '' COMMENT '子卡封面',
  `expire_day` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `send_integral_num` int(11) NOT NULL DEFAULT '0' COMMENT '积分赠送',
  `send_integral_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '积分赠送类型 1.固定值|2.百分比',
  `send_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送余额',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '使用说明',
  `content` varchar(2048) NOT NULL DEFAULT '' COMMENT '使用内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:正常 1：停发',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_vip_card_discount`
--

CREATE TABLE `zjhj_bd_vip_card_discount` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `main_id` int(11) NOT NULL DEFAULT '0',
  `main_name` varchar(255) NOT NULL DEFAULT '' COMMENT '主卡名称',
  `detail_id` int(11) NOT NULL DEFAULT '0',
  `detail_name` varchar(255) NOT NULL DEFAULT '' COMMENT '子卡名称',
  `discount_num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣优惠',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_vip_card_order`
--

CREATE TABLE `zjhj_bd_vip_card_order` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `main_id` int(11) NOT NULL COMMENT '主卡id',
  `main_name` varchar(255) NOT NULL DEFAULT '' COMMENT '主卡名称',
  `detail_id` int(11) NOT NULL,
  `detail_name` varchar(255) NOT NULL DEFAULT '' COMMENT '子卡名称',
  `price` decimal(10,2) NOT NULL COMMENT '购买价格',
  `expire` int(11) NOT NULL COMMENT '有效期',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未售 1已售',
  `all_send` varchar(2048) NOT NULL DEFAULT '',
  `is_admin_add` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否后台添加',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_vip_card_setting`
--

CREATE TABLE `zjhj_bd_vip_card_setting` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_vip_card` tinyint(1) NOT NULL DEFAULT '0',
  `payment_type` text NOT NULL,
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0',
  `is_agreement` tinyint(1) NOT NULL DEFAULT '0',
  `agreement_title` varchar(255) NOT NULL DEFAULT '',
  `agreement_content` text NOT NULL,
  `is_buy_become_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '购买成为分销商 0:关闭 1开启',
  `share_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1.百分比|2.固定金额',
  `share_commission_first` decimal(10,2) NOT NULL DEFAULT '0.00',
  `share_commission_second` decimal(10,2) NOT NULL DEFAULT '0.00',
  `share_commission_third` decimal(10,2) NOT NULL DEFAULT '0.00',
  `form` text NOT NULL,
  `rules` text NOT NULL COMMENT '允许的插件',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `share_level` text COMMENT '分销等级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_vip_card_user`
--

CREATE TABLE `zjhj_bd_vip_card_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `main_id` int(11) NOT NULL DEFAULT '0',
  `detail_id` int(11) NOT NULL,
  `image_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:指定商品类别 1:指定商品 2:全场通用',
  `image_type_info` varchar(2048) NOT NULL DEFAULT '',
  `image_discount` decimal(11,1) NOT NULL DEFAULT '0.0' COMMENT '折扣',
  `image_is_free_delivery` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不包邮 1:包邮',
  `image_main_name` varchar(255) NOT NULL DEFAULT '' COMMENT '主卡名称',
  `image_name` varchar(255) NOT NULL COMMENT '名称',
  `all_send` varchar(2048) NOT NULL DEFAULT '' COMMENT '所有赠送信息',
  `data` longtext COMMENT '额外信息字段',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_we7_app`
--

CREATE TABLE `zjhj_bd_we7_app` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `acid` int(11) NOT NULL COMMENT '微擎应用的acid',
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_wxapp_config`
--

CREATE TABLE `zjhj_bd_wxapp_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `appid` varchar(128) NOT NULL,
  `appsecret` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `mchid` varchar(32) NOT NULL,
  `key` varchar(32) NOT NULL,
  `cert_pem` varchar(2000) NOT NULL DEFAULT '',
  `key_pem` varchar(2000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_wxapp_jump_appid`
--

CREATE TABLE `zjhj_bd_wxapp_jump_appid` (
  `id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `appid` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_wxapp_subscribe`
--

CREATE TABLE `zjhj_bd_wxapp_subscribe` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `tpl_name` varchar(65) NOT NULL DEFAULT '',
  `tpl_id` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信订阅消息';

-- --------------------------------------------------------

--
-- 表的结构 `zjhj_bd_wxapp_template`
--

CREATE TABLE `zjhj_bd_wxapp_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `mall_id` int(11) NOT NULL,
  `tpl_name` varchar(65) NOT NULL DEFAULT '',
  `tpl_id` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `zjhj_bd_address`
--
ALTER TABLE `zjhj_bd_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `zjhj_bd_admin_info`
--
ALTER TABLE `zjhj_bd_admin_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_admin_register`
--
ALTER TABLE `zjhj_bd_admin_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_advance_banner`
--
ALTER TABLE `zjhj_bd_advance_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_advance_goods`
--
ALTER TABLE `zjhj_bd_advance_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_advance_goods_attr`
--
ALTER TABLE `zjhj_bd_advance_goods_attr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_advance_order`
--
ALTER TABLE `zjhj_bd_advance_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_advance_order_submit_result`
--
ALTER TABLE `zjhj_bd_advance_order_submit_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_advance_setting`
--
ALTER TABLE `zjhj_bd_advance_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_aliapp_config`
--
ALTER TABLE `zjhj_bd_aliapp_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_aliapp_template`
--
ALTER TABLE `zjhj_bd_aliapp_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_article`
--
ALTER TABLE `zjhj_bd_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`mall_id`) USING BTREE,
  ADD KEY `is_delete` (`is_delete`) USING BTREE;

--
-- Indexes for table `zjhj_bd_attachment`
--
ALTER TABLE `zjhj_bd_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachment_group_id` (`attachment_group_id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `mch_id` (`mch_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `zjhj_bd_attachment_group`
--
ALTER TABLE `zjhj_bd_attachment_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `mch_id` (`mch_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `zjhj_bd_attachment_storage`
--
ALTER TABLE `zjhj_bd_attachment_storage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_auth_role`
--
ALTER TABLE `zjhj_bd_auth_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_auth_role_permission`
--
ALTER TABLE `zjhj_bd_auth_role_permission`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_auth_role_user`
--
ALTER TABLE `zjhj_bd_auth_role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_balance_log`
--
ALTER TABLE `zjhj_bd_balance_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `zjhj_bd_banner`
--
ALTER TABLE `zjhj_bd_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_bargain_banner`
--
ALTER TABLE `zjhj_bd_bargain_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_bargain_goods`
--
ALTER TABLE `zjhj_bd_bargain_goods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `goods_id` (`goods_id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_bargain_order`
--
ALTER TABLE `zjhj_bd_bargain_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_bargain_setting`
--
ALTER TABLE `zjhj_bd_bargain_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_bargain_user_order`
--
ALTER TABLE `zjhj_bd_bargain_user_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `bargain_order_id` (`bargain_order_id`);

--
-- Indexes for table `zjhj_bd_bdapp_config`
--
ALTER TABLE `zjhj_bd_bdapp_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_bdapp_order`
--
ALTER TABLE `zjhj_bd_bdapp_order`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_bdapp_template`
--
ALTER TABLE `zjhj_bd_bdapp_template`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_bonus_captain`
--
ALTER TABLE `zjhj_bd_bonus_captain`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_bonus_captain_log`
--
ALTER TABLE `zjhj_bd_bonus_captain_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `zjhj_bd_bonus_captain_relation`
--
ALTER TABLE `zjhj_bd_bonus_captain_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_bonus_cash`
--
ALTER TABLE `zjhj_bd_bonus_cash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_bonus_cash_log`
--
ALTER TABLE `zjhj_bd_bonus_cash_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_bonus_members`
--
ALTER TABLE `zjhj_bd_bonus_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_bonus_order_log`
--
ALTER TABLE `zjhj_bd_bonus_order_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  ADD KEY `from_user_id` (`from_user_id`) USING BTREE,
  ADD KEY `to_user_id` (`to_user_id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_bonus_setting`
--
ALTER TABLE `zjhj_bd_bonus_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_booking_cats`
--
ALTER TABLE `zjhj_bd_booking_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_booking_goods`
--
ALTER TABLE `zjhj_bd_booking_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_booking_order`
--
ALTER TABLE `zjhj_bd_booking_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_booking_setting`
--
ALTER TABLE `zjhj_bd_booking_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`);

--
-- Indexes for table `zjhj_bd_booking_store`
--
ALTER TABLE `zjhj_bd_booking_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_cart`
--
ALTER TABLE `zjhj_bd_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `zjhj_bd_check_in_award_config`
--
ALTER TABLE `zjhj_bd_check_in_award_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_check_in_config`
--
ALTER TABLE `zjhj_bd_check_in_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_check_in_customize`
--
ALTER TABLE `zjhj_bd_check_in_customize`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_check_in_queue`
--
ALTER TABLE `zjhj_bd_check_in_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_check_in_sign`
--
ALTER TABLE `zjhj_bd_check_in_sign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `zjhj_bd_check_in_user`
--
ALTER TABLE `zjhj_bd_check_in_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `zjhj_bd_check_in_user_remind`
--
ALTER TABLE `zjhj_bd_check_in_user_remind`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_remind` (`is_remind`);

--
-- Indexes for table `zjhj_bd_city_deliveryman`
--
ALTER TABLE `zjhj_bd_city_deliveryman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_city_delivery_setting`
--
ALTER TABLE `zjhj_bd_city_delivery_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_clerk_user`
--
ALTER TABLE `zjhj_bd_clerk_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_clerk_user_store_relation`
--
ALTER TABLE `zjhj_bd_clerk_user_store_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_core_action_log`
--
ALTER TABLE `zjhj_bd_core_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`mall_id`);

--
-- Indexes for table `zjhj_bd_core_exception_log`
--
ALTER TABLE `zjhj_bd_core_exception_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_core_plugin`
--
ALTER TABLE `zjhj_bd_core_plugin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `zjhj_bd_core_queue`
--
ALTER TABLE `zjhj_bd_core_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel` (`channel`),
  ADD KEY `reserved_at` (`reserved_at`),
  ADD KEY `priority` (`priority`);

--
-- Indexes for table `zjhj_bd_core_queue_data`
--
ALTER TABLE `zjhj_bd_core_queue_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_id` (`queue_id`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `zjhj_bd_core_session`
--
ALTER TABLE `zjhj_bd_core_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_core_task`
--
ALTER TABLE `zjhj_bd_core_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_core_template`
--
ALTER TABLE `zjhj_bd_core_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_core_template_edit`
--
ALTER TABLE `zjhj_bd_core_template_edit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_core_validate_code`
--
ALTER TABLE `zjhj_bd_core_validate_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `code` (`code`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `is_validated` (`is_validated`);

--
-- Indexes for table `zjhj_bd_core_validate_code_log`
--
ALTER TABLE `zjhj_bd_core_validate_code_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_coupon`
--
ALTER TABLE `zjhj_bd_coupon`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `store_id` (`mall_id`) USING BTREE,
  ADD KEY `is_delete` (`is_delete`) USING BTREE;

--
-- Indexes for table `zjhj_bd_coupon_auto_send`
--
ALTER TABLE `zjhj_bd_coupon_auto_send`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_coupon_cat_relation`
--
ALTER TABLE `zjhj_bd_coupon_cat_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_coupon_center`
--
ALTER TABLE `zjhj_bd_coupon_center`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_coupon_goods_relation`
--
ALTER TABLE `zjhj_bd_coupon_goods_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_coupon_mall_relation`
--
ALTER TABLE `zjhj_bd_coupon_mall_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_coupon_id` (`user_coupon_id`);

--
-- Indexes for table `zjhj_bd_coupon_member_relation`
--
ALTER TABLE `zjhj_bd_coupon_member_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_delivery`
--
ALTER TABLE `zjhj_bd_delivery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_diy_alone_page`
--
ALTER TABLE `zjhj_bd_diy_alone_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_diy_form`
--
ALTER TABLE `zjhj_bd_diy_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `mall_id` (`mall_id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_diy_page`
--
ALTER TABLE `zjhj_bd_diy_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_diy_page_nav`
--
ALTER TABLE `zjhj_bd_diy_page_nav`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_diy_template`
--
ALTER TABLE `zjhj_bd_diy_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_favorite`
--
ALTER TABLE `zjhj_bd_favorite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_footprint_data_log`
--
ALTER TABLE `zjhj_bd_footprint_data_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_footprint_goods_log`
--
ALTER TABLE `zjhj_bd_footprint_goods_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_form`
--
ALTER TABLE `zjhj_bd_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_formid`
--
ALTER TABLE `zjhj_bd_formid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `remains` (`remains`);

--
-- Indexes for table `zjhj_bd_free_delivery_rules`
--
ALTER TABLE `zjhj_bd_free_delivery_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_fxhb_activity`
--
ALTER TABLE `zjhj_bd_fxhb_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_fxhb_activity_cat_relation`
--
ALTER TABLE `zjhj_bd_fxhb_activity_cat_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_fxhb_activity_goods_relation`
--
ALTER TABLE `zjhj_bd_fxhb_activity_goods_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_fxhb_user_activity`
--
ALTER TABLE `zjhj_bd_fxhb_user_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_gift_log`
--
ALTER TABLE `zjhj_bd_gift_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_gift_lottery`
--
ALTER TABLE `zjhj_bd_gift_lottery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_gift_open_result`
--
ALTER TABLE `zjhj_bd_gift_open_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_gift_order`
--
ALTER TABLE `zjhj_bd_gift_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_gift_order_submit_result`
--
ALTER TABLE `zjhj_bd_gift_order_submit_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_gift_send_order`
--
ALTER TABLE `zjhj_bd_gift_send_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_gift_send_order_detail`
--
ALTER TABLE `zjhj_bd_gift_send_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_gift_setting`
--
ALTER TABLE `zjhj_bd_gift_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_gift_user_order`
--
ALTER TABLE `zjhj_bd_gift_user_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_goods`
--
ALTER TABLE `zjhj_bd_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `goods_warehouse_id` (`goods_warehouse_id`),
  ADD KEY `sign` (`sign`),
  ADD KEY `index1` (`mall_id`,`is_delete`,`sign`,`status`,`goods_warehouse_id`),
  ADD KEY `index2` (`is_delete`,`mall_id`,`status`);

--
-- Indexes for table `zjhj_bd_goods_attr`
--
ALTER TABLE `zjhj_bd_goods_attr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `zjhj_bd_goods_cards`
--
ALTER TABLE `zjhj_bd_goods_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_goods_card_relation`
--
ALTER TABLE `zjhj_bd_goods_card_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_goods_cats`
--
ALTER TABLE `zjhj_bd_goods_cats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index1` (`is_delete`,`status`,`is_show`,`mch_id`,`mall_id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `mch_id` (`mch_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `zjhj_bd_goods_cat_relation`
--
ALTER TABLE `zjhj_bd_goods_cat_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_warehouse_id` (`goods_warehouse_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `zjhj_bd_goods_member_price`
--
ALTER TABLE `zjhj_bd_goods_member_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_attr_id` (`goods_attr_id`),
  ADD KEY `index1` (`is_delete`,`goods_id`,`level`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `zjhj_bd_goods_services`
--
ALTER TABLE `zjhj_bd_goods_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_goods_service_relation`
--
ALTER TABLE `zjhj_bd_goods_service_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_goods_share`
--
ALTER TABLE `zjhj_bd_goods_share`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_attr_id` (`goods_attr_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `zjhj_bd_goods_warehouse`
--
ALTER TABLE `zjhj_bd_goods_warehouse`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `store_id` (`mall_id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_home_block`
--
ALTER TABLE `zjhj_bd_home_block`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_home_nav`
--
ALTER TABLE `zjhj_bd_home_nav`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_import_goods`
--
ALTER TABLE `zjhj_bd_import_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_integral_log`
--
ALTER TABLE `zjhj_bd_integral_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `zjhj_bd_integral_mall_banners`
--
ALTER TABLE `zjhj_bd_integral_mall_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_integral_mall_cats`
--
ALTER TABLE `zjhj_bd_integral_mall_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_integral_mall_coupons`
--
ALTER TABLE `zjhj_bd_integral_mall_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_integral_mall_coupons_orders`
--
ALTER TABLE `zjhj_bd_integral_mall_coupons_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_integral_mall_coupons_user`
--
ALTER TABLE `zjhj_bd_integral_mall_coupons_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_integral_mall_coupon_order_submit_result`
--
ALTER TABLE `zjhj_bd_integral_mall_coupon_order_submit_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_integral_mall_goods`
--
ALTER TABLE `zjhj_bd_integral_mall_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_integral_mall_goods_attr`
--
ALTER TABLE `zjhj_bd_integral_mall_goods_attr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `goods_attr_id` (`goods_attr_id`);

--
-- Indexes for table `zjhj_bd_integral_mall_orders`
--
ALTER TABLE `zjhj_bd_integral_mall_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_integral_mall_setting`
--
ALTER TABLE `zjhj_bd_integral_mall_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_lottery`
--
ALTER TABLE `zjhj_bd_lottery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_lottery_banner`
--
ALTER TABLE `zjhj_bd_lottery_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_lottery_default`
--
ALTER TABLE `zjhj_bd_lottery_default`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_lottery_log`
--
ALTER TABLE `zjhj_bd_lottery_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lottery_id` (`lottery_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `mall_id` (`mall_id`);

--
-- Indexes for table `zjhj_bd_lottery_order`
--
ALTER TABLE `zjhj_bd_lottery_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_lottery_setting`
--
ALTER TABLE `zjhj_bd_lottery_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mail_setting`
--
ALTER TABLE `zjhj_bd_mail_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mall`
--
ALTER TABLE `zjhj_bd_mall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mall_banner_relation`
--
ALTER TABLE `zjhj_bd_mall_banner_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mall_goods`
--
ALTER TABLE `zjhj_bd_mall_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index1` (`goods_id`),
  ADD KEY `mall_id` (`mall_id`);

--
-- Indexes for table `zjhj_bd_mall_members`
--
ALTER TABLE `zjhj_bd_mall_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `zjhj_bd_mall_member_orders`
--
ALTER TABLE `zjhj_bd_mall_member_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mall_member_rights`
--
ALTER TABLE `zjhj_bd_mall_member_rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mall_setting`
--
ALTER TABLE `zjhj_bd_mall_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `key` (`key`);

--
-- Indexes for table `zjhj_bd_mch`
--
ALTER TABLE `zjhj_bd_mch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mch_account_log`
--
ALTER TABLE `zjhj_bd_mch_account_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mch_cash`
--
ALTER TABLE `zjhj_bd_mch_cash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mch_common_cat`
--
ALTER TABLE `zjhj_bd_mch_common_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mch_goods`
--
ALTER TABLE `zjhj_bd_mch_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mch_mall_setting`
--
ALTER TABLE `zjhj_bd_mch_mall_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mch_order`
--
ALTER TABLE `zjhj_bd_mch_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mch_setting`
--
ALTER TABLE `zjhj_bd_mch_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mch_visit_log`
--
ALTER TABLE `zjhj_bd_mch_visit_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_miaosha_banners`
--
ALTER TABLE `zjhj_bd_miaosha_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_miaosha_goods`
--
ALTER TABLE `zjhj_bd_miaosha_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index1` (`is_delete`,`open_date`,`open_time`),
  ADD KEY `index2` (`is_delete`,`goods_id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `goods_warehouse_id` (`goods_warehouse_id`);

--
-- Indexes for table `zjhj_bd_miaosha_setting`
--
ALTER TABLE `zjhj_bd_miaosha_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_mp_template_record`
--
ALTER TABLE `zjhj_bd_mp_template_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_option`
--
ALTER TABLE `zjhj_bd_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`(191)),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `mch_id` (`mch_id`),
  ADD KEY `group` (`group`(191));

--
-- Indexes for table `zjhj_bd_order`
--
ALTER TABLE `zjhj_bd_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `index1` (`mall_id`,`is_delete`,`is_pay`,`pay_type`,`cancel_status`),
  ADD KEY `order_no` (`order_no`(191)),
  ADD KEY `is_pay` (`is_pay`),
  ADD KEY `is_send` (`is_send`),
  ADD KEY `is_sale` (`is_sale`),
  ADD KEY `is_confirm` (`is_confirm`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_recycle` (`is_recycle`),
  ADD KEY `token` (`token`),
  ADD KEY `is_comment` (`is_comment`),
  ADD KEY `status` (`status`),
  ADD KEY `sale_status` (`sale_status`),
  ADD KEY `sign` (`sign`(191)),
  ADD KEY `clerk_id` (`clerk_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `cancel_status` (`cancel_status`),
  ADD KEY `index2` (`mall_id`,`is_delete`,`cancel_status`),
  ADD KEY `index3` (`mall_id`,`is_delete`,`cancel_status`,`is_pay`),
  ADD KEY `index4` (`mall_id`,`is_delete`,`cancel_status`,`pay_type`),
  ADD KEY `index5` (`mall_id`,`is_delete`,`cancel_status`,`is_pay`,`pay_type`);

--
-- Indexes for table `zjhj_bd_order_clerk`
--
ALTER TABLE `zjhj_bd_order_clerk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_order_comments`
--
ALTER TABLE `zjhj_bd_order_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_order_comments_templates`
--
ALTER TABLE `zjhj_bd_order_comments_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_order_detail`
--
ALTER TABLE `zjhj_bd_order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `index1` (`goods_id`,`is_refund`,`order_id`);

--
-- Indexes for table `zjhj_bd_order_detail_express`
--
ALTER TABLE `zjhj_bd_order_detail_express`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `mch_id` (`mch_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `send_type` (`send_type`);

--
-- Indexes for table `zjhj_bd_order_detail_express_relation`
--
ALTER TABLE `zjhj_bd_order_detail_express_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_order_express_single`
--
ALTER TABLE `zjhj_bd_order_express_single`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_order_pay_result`
--
ALTER TABLE `zjhj_bd_order_pay_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `zjhj_bd_order_refund`
--
ALTER TABLE `zjhj_bd_order_refund`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_order_send_template`
--
ALTER TABLE `zjhj_bd_order_send_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_order_send_template_address`
--
ALTER TABLE `zjhj_bd_order_send_template_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_order_submit_result`
--
ALTER TABLE `zjhj_bd_order_submit_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_payment_order`
--
ALTER TABLE `zjhj_bd_payment_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_order_union_id` (`payment_order_union_id`),
  ADD KEY `order_no` (`order_no`),
  ADD KEY `is_pay` (`is_pay`),
  ADD KEY `pay_type` (`pay_type`);

--
-- Indexes for table `zjhj_bd_payment_order_union`
--
ALTER TABLE `zjhj_bd_payment_order_union`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_no` (`order_no`),
  ADD KEY `is_pay` (`is_pay`),
  ADD KEY `pay_type` (`pay_type`);

--
-- Indexes for table `zjhj_bd_payment_refund`
--
ALTER TABLE `zjhj_bd_payment_refund`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_payment_transfer`
--
ALTER TABLE `zjhj_bd_payment_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pintuan_banners`
--
ALTER TABLE `zjhj_bd_pintuan_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pintuan_cats`
--
ALTER TABLE `zjhj_bd_pintuan_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pintuan_goods`
--
ALTER TABLE `zjhj_bd_pintuan_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pintuan_goods_attr`
--
ALTER TABLE `zjhj_bd_pintuan_goods_attr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pintuan_goods_groups`
--
ALTER TABLE `zjhj_bd_pintuan_goods_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pintuan_goods_member_price`
--
ALTER TABLE `zjhj_bd_pintuan_goods_member_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pintuan_goods_share`
--
ALTER TABLE `zjhj_bd_pintuan_goods_share`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pintuan_orders`
--
ALTER TABLE `zjhj_bd_pintuan_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pintuan_order_relation`
--
ALTER TABLE `zjhj_bd_pintuan_order_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pintuan_robots`
--
ALTER TABLE `zjhj_bd_pintuan_robots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pintuan_setting`
--
ALTER TABLE `zjhj_bd_pintuan_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pond`
--
ALTER TABLE `zjhj_bd_pond`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_pond_log`
--
ALTER TABLE `zjhj_bd_pond_log`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `pond_id` (`pond_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`),
  ADD KEY `type` (`type`),
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `zjhj_bd_pond_log_coupon_relation`
--
ALTER TABLE `zjhj_bd_pond_log_coupon_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pond_order`
--
ALTER TABLE `zjhj_bd_pond_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_pond_setting`
--
ALTER TABLE `zjhj_bd_pond_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_postage_rules`
--
ALTER TABLE `zjhj_bd_postage_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_printer`
--
ALTER TABLE `zjhj_bd_printer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_printer_setting`
--
ALTER TABLE `zjhj_bd_printer_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `mch_id` (`mch_id`),
  ADD KEY `status` (`status`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `zjhj_bd_qr_code_parameter`
--
ALTER TABLE `zjhj_bd_qr_code_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_quick_share_goods`
--
ALTER TABLE `zjhj_bd_quick_share_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_id` (`goods_id`) USING BTREE,
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `status` (`status`),
  ADD KEY `is_top` (`is_top`);

--
-- Indexes for table `zjhj_bd_quick_share_setting`
--
ALTER TABLE `zjhj_bd_quick_share_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_quick_shop_cats`
--
ALTER TABLE `zjhj_bd_quick_shop_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_recharge`
--
ALTER TABLE `zjhj_bd_recharge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_recharge_orders`
--
ALTER TABLE `zjhj_bd_recharge_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_refund_address`
--
ALTER TABLE `zjhj_bd_refund_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scan_code_pay_activities`
--
ALTER TABLE `zjhj_bd_scan_code_pay_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scan_code_pay_activities_groups`
--
ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scan_code_pay_activities_groups_level`
--
ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scan_code_pay_activities_groups_rules`
--
ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scan_code_pay_activities_groups_rules_cards`
--
ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_rules_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scan_code_pay_activities_groups_rules_coupons`
--
ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_rules_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scan_code_pay_orders`
--
ALTER TABLE `zjhj_bd_scan_code_pay_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scan_code_pay_setting`
--
ALTER TABLE `zjhj_bd_scan_code_pay_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scratch`
--
ALTER TABLE `zjhj_bd_scratch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scratch_log`
--
ALTER TABLE `zjhj_bd_scratch_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scratch_log_coupon_relation`
--
ALTER TABLE `zjhj_bd_scratch_log_coupon_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scratch_order`
--
ALTER TABLE `zjhj_bd_scratch_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_scratch_setting`
--
ALTER TABLE `zjhj_bd_scratch_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_share`
--
ALTER TABLE `zjhj_bd_share`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `zjhj_bd_share_cash`
--
ALTER TABLE `zjhj_bd_share_cash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_share_cash_log`
--
ALTER TABLE `zjhj_bd_share_cash_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `zjhj_bd_share_level`
--
ALTER TABLE `zjhj_bd_share_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_share_order`
--
ALTER TABLE `zjhj_bd_share_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_detail_id` (`order_detail_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `first_parent_id` (`first_parent_id`),
  ADD KEY `second_parent_id` (`second_parent_id`),
  ADD KEY `third_parent_id` (`third_parent_id`);

--
-- Indexes for table `zjhj_bd_share_order_log`
--
ALTER TABLE `zjhj_bd_share_order_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_share_setting`
--
ALTER TABLE `zjhj_bd_share_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `key` (`key`(191));

--
-- Indexes for table `zjhj_bd_shopping_buys`
--
ALTER TABLE `zjhj_bd_shopping_buys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `zjhj_bd_shopping_likes`
--
ALTER TABLE `zjhj_bd_shopping_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_shopping_like_users`
--
ALTER TABLE `zjhj_bd_shopping_like_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_shopping_setting`
--
ALTER TABLE `zjhj_bd_shopping_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_step_activity`
--
ALTER TABLE `zjhj_bd_step_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_step_activity_info`
--
ALTER TABLE `zjhj_bd_step_activity_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_step_activity_log`
--
ALTER TABLE `zjhj_bd_step_activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_step_ad`
--
ALTER TABLE `zjhj_bd_step_ad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_step_banner_relation`
--
ALTER TABLE `zjhj_bd_step_banner_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_step_daily`
--
ALTER TABLE `zjhj_bd_step_daily`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_step_goods`
--
ALTER TABLE `zjhj_bd_step_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_step_goods_attr`
--
ALTER TABLE `zjhj_bd_step_goods_attr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_step_log`
--
ALTER TABLE `zjhj_bd_step_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_step_order`
--
ALTER TABLE `zjhj_bd_step_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_step_setting`
--
ALTER TABLE `zjhj_bd_step_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_step_user`
--
ALTER TABLE `zjhj_bd_step_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_stock_bonus_log`
--
ALTER TABLE `zjhj_bd_stock_bonus_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_stock_cash`
--
ALTER TABLE `zjhj_bd_stock_cash`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_stock_cash_log`
--
ALTER TABLE `zjhj_bd_stock_cash_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_stock_level`
--
ALTER TABLE `zjhj_bd_stock_level`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_stock_level_up`
--
ALTER TABLE `zjhj_bd_stock_level_up`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_stock_order`
--
ALTER TABLE `zjhj_bd_stock_order`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_stock_setting`
--
ALTER TABLE `zjhj_bd_stock_setting`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_stock_user`
--
ALTER TABLE `zjhj_bd_stock_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_stock_user_info`
--
ALTER TABLE `zjhj_bd_stock_user_info`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_store`
--
ALTER TABLE `zjhj_bd_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_template_record`
--
ALTER TABLE `zjhj_bd_template_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `zjhj_bd_topic`
--
ALTER TABLE `zjhj_bd_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`mall_id`) USING BTREE,
  ADD KEY `is_delete` (`is_delete`) USING BTREE;

--
-- Indexes for table `zjhj_bd_topic_favorite`
--
ALTER TABLE `zjhj_bd_topic_favorite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_topic_type`
--
ALTER TABLE `zjhj_bd_topic_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_ttapp_config`
--
ALTER TABLE `zjhj_bd_ttapp_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_ttapp_jump_appid`
--
ALTER TABLE `zjhj_bd_ttapp_jump_appid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_ttapp_template`
--
ALTER TABLE `zjhj_bd_ttapp_template`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_user`
--
ALTER TABLE `zjhj_bd_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `access_token` (`access_token`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `mch_id` (`mch_id`);

--
-- Indexes for table `zjhj_bd_user_auth_login`
--
ALTER TABLE `zjhj_bd_user_auth_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_user_card`
--
ALTER TABLE `zjhj_bd_user_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `zjhj_bd_user_coupon`
--
ALTER TABLE `zjhj_bd_user_coupon`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `store_id` (`mall_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `coupon_id` (`coupon_id`) USING BTREE,
  ADD KEY `is_delete` (`is_delete`) USING BTREE,
  ADD KEY `is_use` (`is_use`) USING BTREE;

--
-- Indexes for table `zjhj_bd_user_coupon_auto`
--
ALTER TABLE `zjhj_bd_user_coupon_auto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_coupon_id` (`user_coupon_id`),
  ADD KEY `auto_coupon_id` (`auto_coupon_id`);

--
-- Indexes for table `zjhj_bd_user_coupon_center`
--
ALTER TABLE `zjhj_bd_user_coupon_center`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`),
  ADD KEY `user_coupon_id` (`user_coupon_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `zjhj_bd_user_coupon_member`
--
ALTER TABLE `zjhj_bd_user_coupon_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_user_identity`
--
ALTER TABLE `zjhj_bd_user_identity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `zjhj_bd_user_info`
--
ALTER TABLE `zjhj_bd_user_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `platform_user_id` (`platform_user_id`(191)),
  ADD KEY `temp_parent_id` (`temp_parent_id`);

--
-- Indexes for table `zjhj_bd_video`
--
ALTER TABLE `zjhj_bd_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_vip_card`
--
ALTER TABLE `zjhj_bd_vip_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_vip_card_appoint_goods`
--
ALTER TABLE `zjhj_bd_vip_card_appoint_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `zjhj_bd_vip_card_cards`
--
ALTER TABLE `zjhj_bd_vip_card_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_vip_card_coupons`
--
ALTER TABLE `zjhj_bd_vip_card_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_vip_card_detail`
--
ALTER TABLE `zjhj_bd_vip_card_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_vip_card_discount`
--
ALTER TABLE `zjhj_bd_vip_card_discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_vip_card_order`
--
ALTER TABLE `zjhj_bd_vip_card_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_vip_card_setting`
--
ALTER TABLE `zjhj_bd_vip_card_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`);

--
-- Indexes for table `zjhj_bd_vip_card_user`
--
ALTER TABLE `zjhj_bd_vip_card_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `zjhj_bd_we7_app`
--
ALTER TABLE `zjhj_bd_we7_app`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_wxapp_config`
--
ALTER TABLE `zjhj_bd_wxapp_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_wxapp_jump_appid`
--
ALTER TABLE `zjhj_bd_wxapp_jump_appid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_wxapp_subscribe`
--
ALTER TABLE `zjhj_bd_wxapp_subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zjhj_bd_wxapp_template`
--
ALTER TABLE `zjhj_bd_wxapp_template`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `zjhj_bd_address`
--
ALTER TABLE `zjhj_bd_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_admin_info`
--
ALTER TABLE `zjhj_bd_admin_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_admin_register`
--
ALTER TABLE `zjhj_bd_admin_register`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_advance_banner`
--
ALTER TABLE `zjhj_bd_advance_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_advance_goods`
--
ALTER TABLE `zjhj_bd_advance_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_advance_goods_attr`
--
ALTER TABLE `zjhj_bd_advance_goods_attr`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_advance_order`
--
ALTER TABLE `zjhj_bd_advance_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_advance_order_submit_result`
--
ALTER TABLE `zjhj_bd_advance_order_submit_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_advance_setting`
--
ALTER TABLE `zjhj_bd_advance_setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_aliapp_config`
--
ALTER TABLE `zjhj_bd_aliapp_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_aliapp_template`
--
ALTER TABLE `zjhj_bd_aliapp_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_article`
--
ALTER TABLE `zjhj_bd_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_attachment`
--
ALTER TABLE `zjhj_bd_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_attachment_group`
--
ALTER TABLE `zjhj_bd_attachment_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_attachment_storage`
--
ALTER TABLE `zjhj_bd_attachment_storage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_auth_role`
--
ALTER TABLE `zjhj_bd_auth_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_auth_role_permission`
--
ALTER TABLE `zjhj_bd_auth_role_permission`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_auth_role_user`
--
ALTER TABLE `zjhj_bd_auth_role_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_balance_log`
--
ALTER TABLE `zjhj_bd_balance_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_banner`
--
ALTER TABLE `zjhj_bd_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bargain_banner`
--
ALTER TABLE `zjhj_bd_bargain_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bargain_goods`
--
ALTER TABLE `zjhj_bd_bargain_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bargain_order`
--
ALTER TABLE `zjhj_bd_bargain_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bargain_setting`
--
ALTER TABLE `zjhj_bd_bargain_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bargain_user_order`
--
ALTER TABLE `zjhj_bd_bargain_user_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bdapp_config`
--
ALTER TABLE `zjhj_bd_bdapp_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bdapp_order`
--
ALTER TABLE `zjhj_bd_bdapp_order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bdapp_template`
--
ALTER TABLE `zjhj_bd_bdapp_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bonus_captain`
--
ALTER TABLE `zjhj_bd_bonus_captain`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bonus_captain_log`
--
ALTER TABLE `zjhj_bd_bonus_captain_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bonus_captain_relation`
--
ALTER TABLE `zjhj_bd_bonus_captain_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bonus_cash`
--
ALTER TABLE `zjhj_bd_bonus_cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bonus_cash_log`
--
ALTER TABLE `zjhj_bd_bonus_cash_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bonus_members`
--
ALTER TABLE `zjhj_bd_bonus_members`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bonus_order_log`
--
ALTER TABLE `zjhj_bd_bonus_order_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_bonus_setting`
--
ALTER TABLE `zjhj_bd_bonus_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_booking_cats`
--
ALTER TABLE `zjhj_bd_booking_cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_booking_goods`
--
ALTER TABLE `zjhj_bd_booking_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_booking_order`
--
ALTER TABLE `zjhj_bd_booking_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_booking_setting`
--
ALTER TABLE `zjhj_bd_booking_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_booking_store`
--
ALTER TABLE `zjhj_bd_booking_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_cart`
--
ALTER TABLE `zjhj_bd_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_check_in_award_config`
--
ALTER TABLE `zjhj_bd_check_in_award_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_check_in_config`
--
ALTER TABLE `zjhj_bd_check_in_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_check_in_customize`
--
ALTER TABLE `zjhj_bd_check_in_customize`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_check_in_queue`
--
ALTER TABLE `zjhj_bd_check_in_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_check_in_sign`
--
ALTER TABLE `zjhj_bd_check_in_sign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_check_in_user`
--
ALTER TABLE `zjhj_bd_check_in_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_check_in_user_remind`
--
ALTER TABLE `zjhj_bd_check_in_user_remind`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_city_deliveryman`
--
ALTER TABLE `zjhj_bd_city_deliveryman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_city_delivery_setting`
--
ALTER TABLE `zjhj_bd_city_delivery_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_clerk_user`
--
ALTER TABLE `zjhj_bd_clerk_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_clerk_user_store_relation`
--
ALTER TABLE `zjhj_bd_clerk_user_store_relation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_core_action_log`
--
ALTER TABLE `zjhj_bd_core_action_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_core_exception_log`
--
ALTER TABLE `zjhj_bd_core_exception_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_core_plugin`
--
ALTER TABLE `zjhj_bd_core_plugin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_core_queue`
--
ALTER TABLE `zjhj_bd_core_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_core_queue_data`
--
ALTER TABLE `zjhj_bd_core_queue_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_core_task`
--
ALTER TABLE `zjhj_bd_core_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_core_template`
--
ALTER TABLE `zjhj_bd_core_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_core_template_edit`
--
ALTER TABLE `zjhj_bd_core_template_edit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_core_validate_code`
--
ALTER TABLE `zjhj_bd_core_validate_code`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_core_validate_code_log`
--
ALTER TABLE `zjhj_bd_core_validate_code_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_coupon`
--
ALTER TABLE `zjhj_bd_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_coupon_auto_send`
--
ALTER TABLE `zjhj_bd_coupon_auto_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_coupon_cat_relation`
--
ALTER TABLE `zjhj_bd_coupon_cat_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_coupon_center`
--
ALTER TABLE `zjhj_bd_coupon_center`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_coupon_goods_relation`
--
ALTER TABLE `zjhj_bd_coupon_goods_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_coupon_mall_relation`
--
ALTER TABLE `zjhj_bd_coupon_mall_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_coupon_member_relation`
--
ALTER TABLE `zjhj_bd_coupon_member_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_delivery`
--
ALTER TABLE `zjhj_bd_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_diy_alone_page`
--
ALTER TABLE `zjhj_bd_diy_alone_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_diy_form`
--
ALTER TABLE `zjhj_bd_diy_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_diy_page`
--
ALTER TABLE `zjhj_bd_diy_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_diy_page_nav`
--
ALTER TABLE `zjhj_bd_diy_page_nav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_diy_template`
--
ALTER TABLE `zjhj_bd_diy_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_favorite`
--
ALTER TABLE `zjhj_bd_favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_footprint_data_log`
--
ALTER TABLE `zjhj_bd_footprint_data_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_footprint_goods_log`
--
ALTER TABLE `zjhj_bd_footprint_goods_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_form`
--
ALTER TABLE `zjhj_bd_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_formid`
--
ALTER TABLE `zjhj_bd_formid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_free_delivery_rules`
--
ALTER TABLE `zjhj_bd_free_delivery_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_fxhb_activity`
--
ALTER TABLE `zjhj_bd_fxhb_activity`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_fxhb_activity_cat_relation`
--
ALTER TABLE `zjhj_bd_fxhb_activity_cat_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_fxhb_activity_goods_relation`
--
ALTER TABLE `zjhj_bd_fxhb_activity_goods_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_fxhb_user_activity`
--
ALTER TABLE `zjhj_bd_fxhb_user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_gift_log`
--
ALTER TABLE `zjhj_bd_gift_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_gift_lottery`
--
ALTER TABLE `zjhj_bd_gift_lottery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_gift_open_result`
--
ALTER TABLE `zjhj_bd_gift_open_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_gift_order`
--
ALTER TABLE `zjhj_bd_gift_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_gift_order_submit_result`
--
ALTER TABLE `zjhj_bd_gift_order_submit_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_gift_send_order`
--
ALTER TABLE `zjhj_bd_gift_send_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_gift_send_order_detail`
--
ALTER TABLE `zjhj_bd_gift_send_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_gift_setting`
--
ALTER TABLE `zjhj_bd_gift_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_gift_user_order`
--
ALTER TABLE `zjhj_bd_gift_user_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_goods`
--
ALTER TABLE `zjhj_bd_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_goods_attr`
--
ALTER TABLE `zjhj_bd_goods_attr`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_goods_cards`
--
ALTER TABLE `zjhj_bd_goods_cards`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_goods_card_relation`
--
ALTER TABLE `zjhj_bd_goods_card_relation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_goods_cats`
--
ALTER TABLE `zjhj_bd_goods_cats`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_goods_cat_relation`
--
ALTER TABLE `zjhj_bd_goods_cat_relation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_goods_member_price`
--
ALTER TABLE `zjhj_bd_goods_member_price`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_goods_services`
--
ALTER TABLE `zjhj_bd_goods_services`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_goods_service_relation`
--
ALTER TABLE `zjhj_bd_goods_service_relation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_goods_share`
--
ALTER TABLE `zjhj_bd_goods_share`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_goods_warehouse`
--
ALTER TABLE `zjhj_bd_goods_warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_home_block`
--
ALTER TABLE `zjhj_bd_home_block`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_home_nav`
--
ALTER TABLE `zjhj_bd_home_nav`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_import_goods`
--
ALTER TABLE `zjhj_bd_import_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_integral_log`
--
ALTER TABLE `zjhj_bd_integral_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_integral_mall_banners`
--
ALTER TABLE `zjhj_bd_integral_mall_banners`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_integral_mall_cats`
--
ALTER TABLE `zjhj_bd_integral_mall_cats`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_integral_mall_coupons`
--
ALTER TABLE `zjhj_bd_integral_mall_coupons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_integral_mall_coupons_orders`
--
ALTER TABLE `zjhj_bd_integral_mall_coupons_orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_integral_mall_coupons_user`
--
ALTER TABLE `zjhj_bd_integral_mall_coupons_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_integral_mall_coupon_order_submit_result`
--
ALTER TABLE `zjhj_bd_integral_mall_coupon_order_submit_result`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_integral_mall_goods`
--
ALTER TABLE `zjhj_bd_integral_mall_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_integral_mall_goods_attr`
--
ALTER TABLE `zjhj_bd_integral_mall_goods_attr`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_integral_mall_orders`
--
ALTER TABLE `zjhj_bd_integral_mall_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_integral_mall_setting`
--
ALTER TABLE `zjhj_bd_integral_mall_setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_lottery`
--
ALTER TABLE `zjhj_bd_lottery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_lottery_banner`
--
ALTER TABLE `zjhj_bd_lottery_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_lottery_default`
--
ALTER TABLE `zjhj_bd_lottery_default`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_lottery_log`
--
ALTER TABLE `zjhj_bd_lottery_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_lottery_order`
--
ALTER TABLE `zjhj_bd_lottery_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_lottery_setting`
--
ALTER TABLE `zjhj_bd_lottery_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mail_setting`
--
ALTER TABLE `zjhj_bd_mail_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mall`
--
ALTER TABLE `zjhj_bd_mall`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mall_banner_relation`
--
ALTER TABLE `zjhj_bd_mall_banner_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mall_goods`
--
ALTER TABLE `zjhj_bd_mall_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mall_members`
--
ALTER TABLE `zjhj_bd_mall_members`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mall_member_orders`
--
ALTER TABLE `zjhj_bd_mall_member_orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mall_member_rights`
--
ALTER TABLE `zjhj_bd_mall_member_rights`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mall_setting`
--
ALTER TABLE `zjhj_bd_mall_setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mch`
--
ALTER TABLE `zjhj_bd_mch`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mch_account_log`
--
ALTER TABLE `zjhj_bd_mch_account_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mch_cash`
--
ALTER TABLE `zjhj_bd_mch_cash`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mch_common_cat`
--
ALTER TABLE `zjhj_bd_mch_common_cat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mch_goods`
--
ALTER TABLE `zjhj_bd_mch_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mch_mall_setting`
--
ALTER TABLE `zjhj_bd_mch_mall_setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mch_order`
--
ALTER TABLE `zjhj_bd_mch_order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mch_setting`
--
ALTER TABLE `zjhj_bd_mch_setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mch_visit_log`
--
ALTER TABLE `zjhj_bd_mch_visit_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_miaosha_banners`
--
ALTER TABLE `zjhj_bd_miaosha_banners`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_miaosha_goods`
--
ALTER TABLE `zjhj_bd_miaosha_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_miaosha_setting`
--
ALTER TABLE `zjhj_bd_miaosha_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_mp_template_record`
--
ALTER TABLE `zjhj_bd_mp_template_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_option`
--
ALTER TABLE `zjhj_bd_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order`
--
ALTER TABLE `zjhj_bd_order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order_clerk`
--
ALTER TABLE `zjhj_bd_order_clerk`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order_comments`
--
ALTER TABLE `zjhj_bd_order_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order_comments_templates`
--
ALTER TABLE `zjhj_bd_order_comments_templates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order_detail`
--
ALTER TABLE `zjhj_bd_order_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order_detail_express`
--
ALTER TABLE `zjhj_bd_order_detail_express`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order_detail_express_relation`
--
ALTER TABLE `zjhj_bd_order_detail_express_relation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order_express_single`
--
ALTER TABLE `zjhj_bd_order_express_single`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order_pay_result`
--
ALTER TABLE `zjhj_bd_order_pay_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order_refund`
--
ALTER TABLE `zjhj_bd_order_refund`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order_send_template`
--
ALTER TABLE `zjhj_bd_order_send_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order_send_template_address`
--
ALTER TABLE `zjhj_bd_order_send_template_address`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_order_submit_result`
--
ALTER TABLE `zjhj_bd_order_submit_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_payment_order`
--
ALTER TABLE `zjhj_bd_payment_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_payment_order_union`
--
ALTER TABLE `zjhj_bd_payment_order_union`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_payment_refund`
--
ALTER TABLE `zjhj_bd_payment_refund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_payment_transfer`
--
ALTER TABLE `zjhj_bd_payment_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pintuan_banners`
--
ALTER TABLE `zjhj_bd_pintuan_banners`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pintuan_cats`
--
ALTER TABLE `zjhj_bd_pintuan_cats`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pintuan_goods`
--
ALTER TABLE `zjhj_bd_pintuan_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pintuan_goods_attr`
--
ALTER TABLE `zjhj_bd_pintuan_goods_attr`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pintuan_goods_groups`
--
ALTER TABLE `zjhj_bd_pintuan_goods_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pintuan_goods_member_price`
--
ALTER TABLE `zjhj_bd_pintuan_goods_member_price`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pintuan_goods_share`
--
ALTER TABLE `zjhj_bd_pintuan_goods_share`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pintuan_orders`
--
ALTER TABLE `zjhj_bd_pintuan_orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pintuan_order_relation`
--
ALTER TABLE `zjhj_bd_pintuan_order_relation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pintuan_robots`
--
ALTER TABLE `zjhj_bd_pintuan_robots`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pintuan_setting`
--
ALTER TABLE `zjhj_bd_pintuan_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pond`
--
ALTER TABLE `zjhj_bd_pond`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pond_log`
--
ALTER TABLE `zjhj_bd_pond_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pond_log_coupon_relation`
--
ALTER TABLE `zjhj_bd_pond_log_coupon_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pond_order`
--
ALTER TABLE `zjhj_bd_pond_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_pond_setting`
--
ALTER TABLE `zjhj_bd_pond_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_postage_rules`
--
ALTER TABLE `zjhj_bd_postage_rules`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_printer`
--
ALTER TABLE `zjhj_bd_printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_printer_setting`
--
ALTER TABLE `zjhj_bd_printer_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_qr_code_parameter`
--
ALTER TABLE `zjhj_bd_qr_code_parameter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_quick_share_goods`
--
ALTER TABLE `zjhj_bd_quick_share_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_quick_share_setting`
--
ALTER TABLE `zjhj_bd_quick_share_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_quick_shop_cats`
--
ALTER TABLE `zjhj_bd_quick_shop_cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_recharge`
--
ALTER TABLE `zjhj_bd_recharge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_recharge_orders`
--
ALTER TABLE `zjhj_bd_recharge_orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_refund_address`
--
ALTER TABLE `zjhj_bd_refund_address`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scan_code_pay_activities`
--
ALTER TABLE `zjhj_bd_scan_code_pay_activities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scan_code_pay_activities_groups`
--
ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scan_code_pay_activities_groups_level`
--
ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_level`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scan_code_pay_activities_groups_rules`
--
ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_rules`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scan_code_pay_activities_groups_rules_cards`
--
ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_rules_cards`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scan_code_pay_activities_groups_rules_coupons`
--
ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_rules_coupons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scan_code_pay_orders`
--
ALTER TABLE `zjhj_bd_scan_code_pay_orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scan_code_pay_setting`
--
ALTER TABLE `zjhj_bd_scan_code_pay_setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scratch`
--
ALTER TABLE `zjhj_bd_scratch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scratch_log`
--
ALTER TABLE `zjhj_bd_scratch_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scratch_log_coupon_relation`
--
ALTER TABLE `zjhj_bd_scratch_log_coupon_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scratch_order`
--
ALTER TABLE `zjhj_bd_scratch_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_scratch_setting`
--
ALTER TABLE `zjhj_bd_scratch_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_share`
--
ALTER TABLE `zjhj_bd_share`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_share_cash`
--
ALTER TABLE `zjhj_bd_share_cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_share_cash_log`
--
ALTER TABLE `zjhj_bd_share_cash_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_share_level`
--
ALTER TABLE `zjhj_bd_share_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_share_order`
--
ALTER TABLE `zjhj_bd_share_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_share_order_log`
--
ALTER TABLE `zjhj_bd_share_order_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_share_setting`
--
ALTER TABLE `zjhj_bd_share_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_shopping_buys`
--
ALTER TABLE `zjhj_bd_shopping_buys`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_shopping_likes`
--
ALTER TABLE `zjhj_bd_shopping_likes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_shopping_like_users`
--
ALTER TABLE `zjhj_bd_shopping_like_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_shopping_setting`
--
ALTER TABLE `zjhj_bd_shopping_setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_step_activity`
--
ALTER TABLE `zjhj_bd_step_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_step_activity_info`
--
ALTER TABLE `zjhj_bd_step_activity_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_step_activity_log`
--
ALTER TABLE `zjhj_bd_step_activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_step_ad`
--
ALTER TABLE `zjhj_bd_step_ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_step_banner_relation`
--
ALTER TABLE `zjhj_bd_step_banner_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_step_daily`
--
ALTER TABLE `zjhj_bd_step_daily`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_step_goods`
--
ALTER TABLE `zjhj_bd_step_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_step_goods_attr`
--
ALTER TABLE `zjhj_bd_step_goods_attr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_step_log`
--
ALTER TABLE `zjhj_bd_step_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_step_order`
--
ALTER TABLE `zjhj_bd_step_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_step_setting`
--
ALTER TABLE `zjhj_bd_step_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_step_user`
--
ALTER TABLE `zjhj_bd_step_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_stock_bonus_log`
--
ALTER TABLE `zjhj_bd_stock_bonus_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_stock_cash`
--
ALTER TABLE `zjhj_bd_stock_cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_stock_cash_log`
--
ALTER TABLE `zjhj_bd_stock_cash_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_stock_level`
--
ALTER TABLE `zjhj_bd_stock_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_stock_level_up`
--
ALTER TABLE `zjhj_bd_stock_level_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_stock_order`
--
ALTER TABLE `zjhj_bd_stock_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_stock_setting`
--
ALTER TABLE `zjhj_bd_stock_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_stock_user`
--
ALTER TABLE `zjhj_bd_stock_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_stock_user_info`
--
ALTER TABLE `zjhj_bd_stock_user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_store`
--
ALTER TABLE `zjhj_bd_store`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_template_record`
--
ALTER TABLE `zjhj_bd_template_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_topic`
--
ALTER TABLE `zjhj_bd_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_topic_favorite`
--
ALTER TABLE `zjhj_bd_topic_favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_topic_type`
--
ALTER TABLE `zjhj_bd_topic_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_ttapp_config`
--
ALTER TABLE `zjhj_bd_ttapp_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_ttapp_jump_appid`
--
ALTER TABLE `zjhj_bd_ttapp_jump_appid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_ttapp_template`
--
ALTER TABLE `zjhj_bd_ttapp_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_user`
--
ALTER TABLE `zjhj_bd_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_user_auth_login`
--
ALTER TABLE `zjhj_bd_user_auth_login`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_user_card`
--
ALTER TABLE `zjhj_bd_user_card`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_user_coupon`
--
ALTER TABLE `zjhj_bd_user_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_user_coupon_auto`
--
ALTER TABLE `zjhj_bd_user_coupon_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_user_coupon_center`
--
ALTER TABLE `zjhj_bd_user_coupon_center`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_user_coupon_member`
--
ALTER TABLE `zjhj_bd_user_coupon_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_user_identity`
--
ALTER TABLE `zjhj_bd_user_identity`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户身份表', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_user_info`
--
ALTER TABLE `zjhj_bd_user_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_video`
--
ALTER TABLE `zjhj_bd_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_vip_card`
--
ALTER TABLE `zjhj_bd_vip_card`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_vip_card_appoint_goods`
--
ALTER TABLE `zjhj_bd_vip_card_appoint_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_vip_card_cards`
--
ALTER TABLE `zjhj_bd_vip_card_cards`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_vip_card_coupons`
--
ALTER TABLE `zjhj_bd_vip_card_coupons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_vip_card_detail`
--
ALTER TABLE `zjhj_bd_vip_card_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_vip_card_discount`
--
ALTER TABLE `zjhj_bd_vip_card_discount`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_vip_card_order`
--
ALTER TABLE `zjhj_bd_vip_card_order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_vip_card_setting`
--
ALTER TABLE `zjhj_bd_vip_card_setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_vip_card_user`
--
ALTER TABLE `zjhj_bd_vip_card_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_we7_app`
--
ALTER TABLE `zjhj_bd_we7_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_wxapp_config`
--
ALTER TABLE `zjhj_bd_wxapp_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_wxapp_jump_appid`
--
ALTER TABLE `zjhj_bd_wxapp_jump_appid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_wxapp_subscribe`
--
ALTER TABLE `zjhj_bd_wxapp_subscribe`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `zjhj_bd_wxapp_template`
--
ALTER TABLE `zjhj_bd_wxapp_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;


SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `zjhj_bd_diy_ad_coupon` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`user_coupon_id`  int(11) NOT NULL ,
`is_delete`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除' ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_diy_ad_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`template_id`  int(11) NOT NULL ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除' ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`raffled_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;

ALTER TABLE `zjhj_bd_goods` MODIFY COLUMN `area_limit`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '区域限制' AFTER `is_area_limit`;
ALTER TABLE `zjhj_bd_goods` ADD COLUMN `sales`  int(11) NOT NULL DEFAULT 0 COMMENT '商品实际销量' AFTER `form_id`;

CREATE TABLE `zjhj_bd_goods_card_clerk_log` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`user_card_id`  int(11) NOT NULL COMMENT '用户卡券ID' ,
`clerk_id`  int(11) NOT NULL COMMENT '核销员ID' ,
`store_id`  int(11) NOT NULL COMMENT '核销门店ID' ,
`use_number`  int(11) NOT NULL COMMENT '核销次数' ,
`surplus_number`  int(11) NOT NULL COMMENT '剩余次数' ,
`clerked_at`  timestamp NOT NULL COMMENT '核销时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_goods_cards` ADD COLUMN `number`  int(11) NOT NULL DEFAULT 1 COMMENT '卡券可核销总次数' AFTER `is_delete`;

CREATE TABLE `zjhj_bd_local_template` (
`id`  int(10) UNSIGNED NOT NULL ,
`name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板名称' ,
`pics`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板图片' ,
`type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板类型' ,
`version`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板版本' ,
`detail`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板描述' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=Compact
;

INSERT INTO `zjhj_bd_local_template` VALUES (7, '双十二', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/d66b72d485ceed26d358e8f142dec60f.png\"]', 'diy', '0.0.1', '<p>双十二</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (8, '服饰1', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/42d68cee10e3fa8af2c23ab81241e14e.png\"]', 'diy', '0.0.1', '<p>服饰1</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (9, '服饰2', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/7e96634708ed70371f9fbcd3dcba0bb4.png\"]', 'diy', '0.0.1', '<p>服饰2</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (10, '服饰3', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/2e86a1ad42ac8ea8b5f9c8e1131e2cc2.png\"]', 'diy', '0.0.1', '<p>服饰3</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (13, '生鲜1', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/3d6b77eb7d512537c8e03e86c1e052f5.png\"]', 'diy', '0.0.1', '<p>生鲜1</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (14, '生鲜2', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/7b516ba8fce669badea52aa2452dc3db.png\"]', 'diy', '0.0.2', '<p>生鲜2</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (15, '美妆1', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/9d24aec77b45951b50343f3bc9708cd9.png\"]', 'diy', '0.0.1', '<p>美妆1</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (16, '美妆2', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/dc9370e6666b5cb588d81c1b22c72151.png\"]', 'diy', '0.0.1', '<p>美妆2</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (17, '超市1', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/3bddad82d6c63870596334e318777fa5.png\"]', 'diy', '0.0.1', '<p>超市1</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (18, '超市2', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/81ecb3a4ec8e8248da0e7f7a027bafd2.png\"]', 'diy', '0.0.1', '<p>超市2</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (19, '超市3', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/63f989c9f7b9663e6ab9de13c03056b6.png\"]', 'diy', '0.0.1', '<p>超市3</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (28, '春节模板', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/2be7b8bd21b5b89c1008bcbfbd6fc876.png\"]', 'diy', '0.0.1', '<p>春节模板</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (29, '元宵节模板', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/a5c397ade39f0e76c784d46078f0ea20.png\"]', 'diy', '0.0.1', '<p>元宵节模板</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (30, '情人节模板', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/615112ec2dc3e3b0b8aaa9b0b93bd4f0.png\"]', 'diy', '0.0.1', '<p>情人节模板</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (31, '元宵节模板2', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/5f8c2f51b4a9160decb00bed2277952f.png\"]', 'diy', '0.0.1', '<p>元宵节模板2</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (33, '春节模板2', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/2022fc32d157bbdacae989174c75d583.png\"]', 'diy', '0.0.1', '<p>春节模板2</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (34, '情人节模板2', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/a0dadedd1a511bfa59fa63497a8c974d.png\"]', 'diy', '0.0.1', '<p>情人节模板2</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (35, '妇女节', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/be4f913235be3ca1b7a4b4d34bb45216.png\"]', 'diy', '0.0.1', '<p>妇女节</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (36, '妇女节2', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/df3307934c25cfbf1ae2c1046037d8bc.png\"]', 'diy', '0.0.1', '<p>妇女节2</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (37, '51劳动节', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/fdce3d73af8165e0f5652187213950e3.png\"]', 'diy', '0.0.1', '<p>51劳动节</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (38, '51劳动节-2', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/a65509e5cee18c6dda134cde50009892.png\"]', 'diy', '0.0.1', '<p>51劳动节-2</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (39, '618年中盛典', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/3dec44461189a8c99b157e426ec98aa4.png\"]', 'diy', '0.0.1', '<p>618年中盛典</p>');
INSERT INTO `zjhj_bd_local_template` VALUES (40, '618年中盛典-2', '[\"http:\\/\\/auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com\\/uploads\\/versions\\/35120f94cf467eb8874aa67afe0b12c4.png\"]', 'diy', '0.0.1', '<p>618年中盛典-2</p>');

ALTER TABLE `zjhj_bd_mail_setting` ADD COLUMN `show_type`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'attr 规格 goods_no 货号 form_data 下单表单' AFTER `deleted_at`;
ALTER TABLE `zjhj_bd_mall_setting` MODIFY COLUMN `value`  mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL AFTER `key`;

CREATE TABLE `zjhj_bd_pick_activity` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`status`  int(11) NOT NULL DEFAULT 0 COMMENT '状态 0下架 1上架' ,
`is_delete`  tinyint(4) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`title`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动标题' ,
`start_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动开始时间' ,
`end_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动结束时间' ,
`rule_price`  decimal(10,2) NOT NULL COMMENT '组合方案 元' ,
`rule_num`  int(11) NOT NULL COMMENT '组合方案 件' ,
`is_area_limit`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否单独区域购买' ,
`area_limit`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`id`),
INDEX `idx_1` (`mall_id`, `is_delete`, `created_at`) USING BTREE ,
INDEX `sort` (`start_at`, `end_at`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_pick_cart` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`goods_id`  int(11) NOT NULL COMMENT '商品' ,
`attr_id`  int(11) NOT NULL COMMENT '商品规格' ,
`num`  int(11) NOT NULL DEFAULT 1 COMMENT '商品数量' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除' ,
`created_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`attr_info`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL ,
`pick_activity_id`  int(11) NOT NULL COMMENT '活动id' ,
PRIMARY KEY (`id`),
INDEX `mall_id` (`mall_id`) USING BTREE ,
INDEX `user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_pick_goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`status`  tinyint(1) NOT NULL COMMENT '状态 0 关闭 1开启' ,
`goods_id`  int(11) NOT NULL DEFAULT 0 ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除' ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`pick_activity_id`  int(11) NOT NULL DEFAULT 0 COMMENT '活动id' ,
`stock`  int(11) NOT NULL COMMENT '总库存' ,
`sort`  int(11) NOT NULL DEFAULT 100 COMMENT '排序' ,
PRIMARY KEY (`id`),
INDEX `activity` (`pick_activity_id`) USING BTREE ,
INDEX `goods_id` (`goods_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_pick_setting` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`key`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`value`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`created_at`  timestamp NOT NULL COMMENT '创建时间' ,
`updated_at`  timestamp NOT NULL COMMENT '更新时间' ,
`is_delete`  int(11) NOT NULL DEFAULT 0 COMMENT '是否删除 0--未删除 1--已删除' ,
`deleted_at`  timestamp NOT NULL COMMENT '删除时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_step_ad` ADD COLUMN `type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '流量主类型' AFTER `deleted_at`;
ALTER TABLE `zjhj_bd_step_ad` ADD COLUMN `pic_url`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '广告封面' AFTER `type`;
ALTER TABLE `zjhj_bd_step_ad` ADD COLUMN `video_url`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '广告视频' AFTER `pic_url`;
ALTER TABLE `zjhj_bd_step_ad` ADD COLUMN `reward_data`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '奖励数据' AFTER `video_url`;
CREATE TABLE `zjhj_bd_step_ad_coupon` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`user_coupon_id`  int(11) NOT NULL ,
`is_delete`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除' ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_step_ad_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`ad_id`  int(11) NOT NULL ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除' ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`raffled_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_step_setting` ADD COLUMN `share_pic`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分享图片' AFTER `step_poster`;
ALTER TABLE `zjhj_bd_user_card` ADD COLUMN `use_number`  int(11) NOT NULL DEFAULT 0 COMMENT '卡券已核销次数' AFTER `end_time`;
ALTER TABLE `zjhj_bd_user_card` ADD COLUMN `number`  int(11) NOT NULL DEFAULT 1 COMMENT '卡券可核销次数' AFTER `use_number`;
ALTER TABLE `zjhj_bd_user_info` ADD COLUMN `remark_name`  varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注名' AFTER `temp_parent_id`;
ALTER TABLE `zjhj_bd_vip_card_user` MODIFY COLUMN `all_send`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所有赠送信息' AFTER `image_name`;


ALTER TABLE `zjhj_bd_banner` ADD COLUMN `sign`  varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件标识' AFTER `updated_at`;

CREATE TABLE `zjhj_bd_composition` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT ' ' ,
`mall_id`  int(11) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '套餐名' ,
`price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '套餐价' ,
`type`  tinyint(255) NOT NULL DEFAULT 1 COMMENT '套餐类型 1--固定套餐 2--搭配套餐' ,
`status`  int(11) NOT NULL DEFAULT 0 COMMENT '是否上架 0--下架 1--上架' ,
`sort`  int(11) NOT NULL DEFAULT 100 COMMENT '排序' ,
`is_delete`  int(11) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`sort_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '排序的优惠金额' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_composition_goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`model_id`  int(11) NOT NULL COMMENT '套餐id' ,
`goods_id`  int(11) NOT NULL COMMENT '商品id' ,
`is_host`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是主商品' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额' ,
`payment_people`  int(11) NOT NULL DEFAULT 0 COMMENT '支付人数' ,
`payment_num`  int(11) NOT NULL DEFAULT 0 COMMENT '支付件数' ,
`payment_amount`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '支付金额' ,
`created_at`  timestamp NOT NULL ,
PRIMARY KEY (`id`),
INDEX `mall_id` (`mall_id`) USING BTREE ,
INDEX `model_id` (`model_id`) USING BTREE ,
INDEX `goods_id` (`goods_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_composition_order` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`order_id`  int(11) NOT NULL ,
`composition_id`  int(11) NOT NULL DEFAULT 0 COMMENT '优惠金额' ,
`price`  decimal(10,2) NOT NULL ,
`is_delete`  tinyint(1) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;

CREATE TABLE `zjhj_bd_goods_attr_template` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`mch_id`  int(11) NOT NULL DEFAULT 0 ,
`attr_group_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规格名' ,
`attr_group_id`  int(11) NOT NULL DEFAULT 0 COMMENT '规格组' ,
`attr_list`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格值' ,
`select_attr_list`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '后台 搜索用的' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除' ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_home_nav` ADD COLUMN `sign`  varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件标识' AFTER `is_delete`;
CREATE TABLE `zjhj_bd_import_data` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`mch_id`  int(11) NOT NULL DEFAULT 0 ,
`user_id`  int(11) NOT NULL COMMENT '操作账户ID' ,
`status`  tinyint(4) NOT NULL COMMENT '导入状态|1.全部失败|2.部分失败|3.全部成功' ,
`file_name`  varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '导入文件名' ,
`count`  int(11) NOT NULL COMMENT '导入总数量' ,
`success_count`  int(11) NOT NULL ,
`error_count`  int(11) NOT NULL ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`is_delete`  int(11) NOT NULL DEFAULT 0 ,
`type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '1.商品导入|2.分类导入' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_order` MODIFY COLUMN `send_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '配送方式：0--快递配送 1--到店自提 2--同城配送 3--无配送' AFTER `is_recycle`;

SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE `zjhj_bd_address` MODIFY COLUMN `province_id`  int(11) NOT NULL DEFAULT 0 AFTER `name`;
ALTER TABLE `zjhj_bd_address` MODIFY COLUMN `province`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省份名称' AFTER `province_id`;
ALTER TABLE `zjhj_bd_address` MODIFY COLUMN `city_id`  int(11) NOT NULL DEFAULT 0 AFTER `province`;
ALTER TABLE `zjhj_bd_address` MODIFY COLUMN `city`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市名称' AFTER `city_id`;
ALTER TABLE `zjhj_bd_address` MODIFY COLUMN `district_id`  int(11) NOT NULL DEFAULT 0 AFTER `city`;
ALTER TABLE `zjhj_bd_address` MODIFY COLUMN `district`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '县区名称' AFTER `district_id`;
ALTER TABLE `zjhj_bd_address` ADD COLUMN `type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型：0快递 1同城' AFTER `location`;
CREATE INDEX `user_id` ON `zjhj_bd_admin_info`(`user_id`) USING BTREE ;
CREATE INDEX `is_delete` ON `zjhj_bd_admin_info`(`is_delete`) USING BTREE ;
CREATE TABLE `zjhj_bd_admin_notice` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL DEFAULT 0 ,
`type`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'update更新urgent紧急important重要' ,
`content`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_assistant_data` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型 0--淘宝 1--淘宝app 2--天猫 3--天猫app 4--京东 5--拼多多' ,
`itemId`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '原始商品id' ,
`json`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据' ,
`created_at`  timestamp NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE INDEX `is_delete` ON `zjhj_bd_attachment`(`is_delete`) USING BTREE ;
CREATE INDEX `is_recycle` ON `zjhj_bd_attachment`(`is_recycle`) USING BTREE ;
ALTER TABLE `zjhj_bd_bargain_goods` ADD COLUMN `stock_type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '减库存的方式 1--参与减库存 2--拍下减库存' AFTER `fail`;
CREATE INDEX `mall_id` ON `zjhj_bd_bargain_goods`(`mall_id`) USING BTREE ;
CREATE INDEX `is_delete` ON `zjhj_bd_bargain_goods`(`is_delete`) USING BTREE ;
CREATE INDEX `end_time` ON `zjhj_bd_bargain_goods`(`end_time`) USING BTREE ;
ALTER TABLE `zjhj_bd_bargain_order` ADD COLUMN `preferential_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额' AFTER `is_delete`;
ALTER TABLE `zjhj_bd_booking_goods` ADD COLUMN `is_order_form`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启自定义表单0.否|1.是' AFTER `deleted_at`;
ALTER TABLE `zjhj_bd_booking_goods` ADD COLUMN `order_form_type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '1.选择表单|2.自定义表单' AFTER `is_order_form`;
CREATE INDEX `key` ON `zjhj_bd_city_delivery_setting`(`key`) USING BTREE ;
CREATE INDEX `is_delete` ON `zjhj_bd_city_delivery_setting`(`is_delete`) USING BTREE ;
CREATE INDEX `mall_id` ON `zjhj_bd_city_delivery_setting`(`mall_id`) USING BTREE ;
CREATE TABLE `zjhj_bd_cloud_template` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '云模板ID' ,
`name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '云模板名称' ,
`pics`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '云模板图片' ,
`detail`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '云模板详情' ,
`price`  decimal(10,2) NOT NULL COMMENT '云模板价格' ,
`type`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '云模板类型' ,
`version`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '云模板版本' ,
`package`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '云模板资源包' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_core_plugin` ADD COLUMN `pic_url`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL AFTER `deleted_at`;
ALTER TABLE `zjhj_bd_core_plugin` ADD COLUMN `desc`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL AFTER `pic_url`;
ALTER TABLE `zjhj_bd_core_plugin` ADD COLUMN `sort`  int(11) NOT NULL DEFAULT 100 AFTER `desc`;
CREATE TABLE `zjhj_bd_core_template_type` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`template_id`  int(11) NOT NULL ,
`type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模板适用地方' ,
`is_delete`  tinyint(1) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_delivery` ADD COLUMN `goods_alias`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '商品' COMMENT '自定义商品别名' AFTER `deleted_at`;
ALTER TABLE `zjhj_bd_delivery` ADD COLUMN `is_goods_alias`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '自定义商品别名开关' AFTER `goods_alias`;
CREATE TABLE `zjhj_bd_diy_coupon_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`template_id`  int(11) NOT NULL ,
`user_coupon_id`  int(11) NOT NULL ,
`is_delete`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除' ,
`created_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE INDEX `is_delete` ON `zjhj_bd_diy_page`(`is_delete`) USING BTREE ;
CREATE INDEX `mall_id` ON `zjhj_bd_diy_page`(`mall_id`) USING BTREE ;
CREATE INDEX `is_disable` ON `zjhj_bd_diy_page`(`is_disable`) USING BTREE ;
ALTER TABLE `zjhj_bd_diy_template` ADD COLUMN `type`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'page:微页面' AFTER `deleted_at`;
CREATE TABLE `zjhj_bd_ecard` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '卡密名称' ,
`content`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '使用说明' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`list`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡密字段' ,
`sales`  int(11) NOT NULL DEFAULT 0 COMMENT '已售' ,
`stock`  int(11) NOT NULL DEFAULT 0 COMMENT '库存' ,
`is_unique`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否去重 0--否 1--是' ,
`pre_stock`  int(11) NOT NULL DEFAULT 0 COMMENT '预占用的库存' ,
`total_stock`  int(11) NOT NULL DEFAULT 0 COMMENT '总库存' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_ecard_data` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`ecard_id`  int(11) NOT NULL ,
`token`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`key`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`value`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`is_delete`  tinyint(1) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_ecard_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`ecard_id`  int(11) NOT NULL DEFAULT 0 ,
`status`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '日志操作 add--添加 occupy--占用 sales--卖出 delete--删除' ,
`sign`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件标示' ,
`number`  int(11) NOT NULL DEFAULT 0 COMMENT '数量' ,
`created_at`  timestamp NOT NULL ,
`goods_id`  int(11) NOT NULL DEFAULT 0 COMMENT '商品id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_ecard_options` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`token`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '加密字符串' ,
`ecard_id`  int(11) NOT NULL DEFAULT 0 COMMENT '电子卡密id' ,
`value`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡密字段值' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
`is_sales`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否出售' ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`is_occupy`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否被占用 0--否 1--是' ,
PRIMARY KEY (`id`),
INDEX `e_card_id` (`ecard_id`) USING BTREE ,
INDEX `token` (`token`(191)) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_ecard_order` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`ecard_id`  int(11) NOT NULL ,
`value`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`order_id`  int(11) NOT NULL ,
`order_detail_id`  int(11) NOT NULL ,
`is_delete`  tinyint(1) NOT NULL ,
`token`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '加密字符串' ,
`ecard_options_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL DEFAULT 0 COMMENT '用户id' ,
`order_token`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单token' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE INDEX `user_id` ON `zjhj_bd_favorite`(`user_id`) USING BTREE ;
CREATE INDEX `is_delete` ON `zjhj_bd_favorite`(`is_delete`) USING BTREE ;
CREATE TABLE `zjhj_bd_flash_sale_activity` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`status`  int(11) NOT NULL DEFAULT 0 COMMENT '状态 0下架 1上架' ,
`is_delete`  tinyint(4) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`title`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动标题' ,
`start_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动开始时间' ,
`end_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动结束时间' ,
`notice`  int(11) NOT NULL DEFAULT 0 COMMENT '活动预告' ,
`notice_hours`  int(11) NOT NULL DEFAULT 0 COMMENT '提前N小时' ,
PRIMARY KEY (`id`),
INDEX `idx_1` (`mall_id`, `is_delete`, `created_at`) USING BTREE ,
INDEX `sort` (`start_at`, `end_at`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_flash_sale_goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`status`  tinyint(1) NOT NULL COMMENT '状态 0 关闭 1开启' ,
`goods_id`  int(11) NOT NULL DEFAULT 0 ,
`type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '1打折  2减钱  3促销价' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除' ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`activity_id`  int(11) NOT NULL DEFAULT 0 COMMENT '活动id' ,
`sort`  int(11) NOT NULL DEFAULT 100 COMMENT '排序' ,
PRIMARY KEY (`id`),
INDEX `activity` (`activity_id`) USING BTREE ,
INDEX `goods_id` (`goods_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_flash_sale_goods_attr` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`discount`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品折扣' ,
`cut`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品减钱' ,
`type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '1打折  2减钱  3促销价' ,
`goods_id`  int(11) NOT NULL ,
`goods_attr_id`  int(11) NOT NULL ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_flash_sale_order_discount` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`order_id`  int(11) NOT NULL COMMENT '订单id' ,
`discount`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额' ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE INDEX `user_id` ON `zjhj_bd_footprint_goods_log`(`user_id`) USING BTREE ;
CREATE INDEX `is_delete` ON `zjhj_bd_footprint_goods_log`(`is_delete`) USING BTREE ;
CREATE INDEX `mall_id` ON `zjhj_bd_form`(`mall_id`) USING BTREE ;
CREATE INDEX `mch_id` ON `zjhj_bd_form`(`mch_id`) USING BTREE ;
CREATE INDEX `is_default` ON `zjhj_bd_form`(`is_default`) USING BTREE ;
CREATE INDEX `status` ON `zjhj_bd_form`(`status`) USING BTREE ;
CREATE INDEX `is_delete` ON `zjhj_bd_form`(`is_delete`) USING BTREE ;
ALTER TABLE `zjhj_bd_fxhb_activity` ADD COLUMN `is_home_model`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '首页弹窗开关' AFTER `name`;
CREATE INDEX `status` ON `zjhj_bd_goods`(`status`) USING BTREE ;
CREATE INDEX `is_delete` ON `zjhj_bd_goods`(`is_delete`) USING BTREE ;
CREATE INDEX `sort` ON `zjhj_bd_goods`(`sort`) USING BTREE ;
CREATE INDEX `created_at` ON `zjhj_bd_goods`(`created_at`) USING BTREE ;
CREATE INDEX `sales` ON `zjhj_bd_goods`(`sales`) USING BTREE ;
CREATE INDEX `index1` ON `zjhj_bd_goods_attr`(`is_delete`, `goods_id`) USING BTREE ;
CREATE INDEX `is_delete` ON `zjhj_bd_goods_member_price`(`is_delete`) USING BTREE ;
CREATE INDEX `index1` ON `zjhj_bd_goods_service_relation`(`goods_id`, `is_delete`) USING BTREE ;
CREATE INDEX `index2` ON `zjhj_bd_goods_service_relation`(`service_id`, `is_delete`) USING BTREE ;
CREATE INDEX `service_id` ON `zjhj_bd_goods_service_relation`(`service_id`) USING BTREE ;
CREATE INDEX `goods_id` ON `zjhj_bd_goods_service_relation`(`goods_id`) USING BTREE ;
CREATE INDEX `is_delete` ON `zjhj_bd_goods_service_relation`(`is_delete`) USING BTREE ;
ALTER TABLE `zjhj_bd_goods_warehouse` ADD COLUMN `type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'goods' COMMENT '商品类型：goods--实体商品 ecard--电子卡密' AFTER `is_delete`;
ALTER TABLE `zjhj_bd_goods_warehouse` ADD COLUMN `ecard_id`  int(11) NOT NULL DEFAULT 0 COMMENT '卡密id' AFTER `type`;
CREATE INDEX `mall_id` ON `zjhj_bd_goods_warehouse`(`mall_id`) USING BTREE ;
CREATE INDEX `is_delete` ON `zjhj_bd_goods_warehouse`(`is_delete`) USING BTREE ;
CREATE TABLE `zjhj_bd_live_goods` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`goods_id`  int(11) NOT NULL ,
`audit_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `index_name` (`goods_id`, `audit_id`, `mall_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_lottery_log` ADD COLUMN `token`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单表token' AFTER `created_at`;
CREATE INDEX `is_delete` ON `zjhj_bd_mall_members`(`is_delete`) USING BTREE ;
ALTER TABLE `zjhj_bd_mch_cash` ADD COLUMN `content`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注' AFTER `is_delete`;
CREATE TABLE `zjhj_bd_miaosha_activitys` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '秒杀活动状态0.关闭|1.开启' ,
`open_date`  date NOT NULL DEFAULT '0000-00-00' COMMENT '活动开始时间' ,
`end_date`  date NOT NULL DEFAULT '0000-00-00' COMMENT '活动结束时间' ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_miaosha_goods` ADD COLUMN `activity_id`  int(11) NOT NULL DEFAULT 0 COMMENT '活动ID' AFTER `is_delete`;
ALTER TABLE `zjhj_bd_order` ADD COLUMN `cancel_data`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '订单申请退款数据' AFTER `city_info`;
CREATE INDEX `order_id` ON `zjhj_bd_order_comments`(`order_id`) USING BTREE ;
ALTER TABLE `zjhj_bd_order_detail` ADD COLUMN `goods_type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'goods' COMMENT '商品类型' AFTER `form_id`;
CREATE TABLE `zjhj_bd_order_detail_vip_card_info` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`vip_card_order_id`  int(11) NOT NULL ,
`order_detail_id`  int(11) NOT NULL ,
`order_detail_total_price`  decimal(10,2) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_order_refund` ADD COLUMN `mobile`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系方式' AFTER `merchant_express_content`;
ALTER TABLE `zjhj_bd_order_refund` ADD COLUMN `refund_data`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '售后数据' AFTER `mobile`;
CREATE INDEX `mall_id` ON `zjhj_bd_order_refund`(`mall_id`) USING BTREE ;
CREATE INDEX `mch_id` ON `zjhj_bd_order_refund`(`mch_id`) USING BTREE ;
CREATE INDEX `user_id` ON `zjhj_bd_order_refund`(`user_id`) USING BTREE ;
CREATE INDEX `order_id` ON `zjhj_bd_order_refund`(`order_id`) USING BTREE ;
CREATE INDEX `order_detail_id` ON `zjhj_bd_order_refund`(`order_detail_id`) USING BTREE ;
CREATE INDEX `order_no` ON `zjhj_bd_order_refund`(`order_no`(191)) USING BTREE ;
CREATE INDEX `type` ON `zjhj_bd_order_refund`(`type`) USING BTREE ;
CREATE INDEX `status` ON `zjhj_bd_order_refund`(`status`) USING BTREE ;
CREATE INDEX `is_send` ON `zjhj_bd_order_refund`(`is_send`) USING BTREE ;
CREATE INDEX `is_confirm` ON `zjhj_bd_order_refund`(`is_confirm`) USING BTREE ;
CREATE INDEX `is_refund` ON `zjhj_bd_order_refund`(`is_refund`) USING BTREE ;
CREATE INDEX `is_delete` ON `zjhj_bd_order_refund`(`is_delete`) USING BTREE ;
CREATE TABLE `zjhj_bd_order_vip_card_info` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`order_id`  int(11) NOT NULL COMMENT '订单ID' ,
`vip_card_detail_id`  int(11) NOT NULL COMMENT '超级会员卡子卡ID' ,
`order_total_price`  decimal(10,2) NOT NULL COMMENT '超级会员卡优惠后订单的金额' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_payment_order_union` ADD COLUMN `app_version`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '小程序端版本' AFTER `updated_at`;
ALTER TABLE `zjhj_bd_pintuan_goods` ADD COLUMN `start_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动开始日期' AFTER `is_sell_well`;
ALTER TABLE `zjhj_bd_pintuan_goods` ADD COLUMN `is_auto_add_robot`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否自动添加机器人0.否|1.是' AFTER `start_time`;
ALTER TABLE `zjhj_bd_pintuan_goods` ADD COLUMN `add_robot_time`  int(11) NOT NULL DEFAULT 0 COMMENT '机器人参与时间0.表示不添加' AFTER `is_auto_add_robot`;
ALTER TABLE `zjhj_bd_pintuan_goods` ADD COLUMN `pintuan_goods_id`  int(11) NOT NULL DEFAULT 0 COMMENT '是否为同一组' AFTER `add_robot_time`;
ALTER TABLE `zjhj_bd_pintuan_orders` ADD COLUMN `expected_over_time`  int(11) NOT NULL DEFAULT 0 AFTER `updated_at`;
CREATE INDEX `index_name` ON `zjhj_bd_pintuan_orders`(`expected_over_time`) USING BTREE ;
CREATE TABLE `zjhj_bd_plugin_cat` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`display_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`color`  varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
`sort`  int(11) NOT NULL DEFAULT 100 ,
`icon`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`add_time`  datetime NULL DEFAULT NULL ,
`update_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `name` (`name`) USING BTREE ,
INDEX `sort` (`sort`) USING BTREE ,
INDEX `is_delete` (`is_delete`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_plugin_cat_rel` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`plugin_name`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`plugin_cat_name`  varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`id`),
INDEX `plugin_name` (`plugin_name`) USING BTREE ,
INDEX `plugin_cat_name` (`plugin_cat_name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_pond_log` ADD COLUMN `token`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单表token' AFTER `created_at`;
CREATE INDEX `is_delete` ON `zjhj_bd_printer_setting`(`is_delete`) USING BTREE ;
ALTER TABLE `zjhj_bd_qr_code_parameter` ADD COLUMN `use_number`  int(11) NOT NULL DEFAULT 0 COMMENT '使用次数' AFTER `path`;
CREATE INDEX `mall_id` ON `zjhj_bd_qr_code_parameter`(`mall_id`) USING BTREE ;
CREATE INDEX `token` ON `zjhj_bd_qr_code_parameter`(`token`) USING BTREE ;
CREATE TABLE `zjhj_bd_region_area` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域名称' ,
`province_rate`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '省代理分红比例' ,
`city_rate`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '市代理分红比例' ,
`district_rate`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '区/县分红比例' ,
`province_condition`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '省代理条件' ,
`city_condition`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '市代理条件' ,
`district_condition`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '区/县代理条件' ,
`become_type`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '1:下线总人数\r\n2:分销订单总数\r\n3:分销订单总金额\r\n4:累计佣金总额\r\n5:已提现佣金总额\r\n6:消费金额' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
PRIMARY KEY (`id`),
INDEX `index_1` (`mall_id`, `is_delete`, `created_at`) USING BTREE ,
INDEX `created_at` (`created_at`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_region_area_detail` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`area_id`  int(11) NOT NULL COMMENT '区域id' ,
`province_id`  int(2) NOT NULL COMMENT '省id' ,
`is_delete`  tinyint(2) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`),
INDEX `area_id` (`area_id`) USING BTREE ,
INDEX `index_1` (`mall_id`, `area_id`, `is_delete`) USING BTREE ,
INDEX `created_at` (`created_at`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_region_bonus_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL DEFAULT 0 ,
`bonus_type`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '1按周，2按月' ,
`pre_bonus_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '预计分红金额' ,
`bonus_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '分红金额' ,
`bonus_rate`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '当时的分红比例' ,
`pre_order_num`  int(11) NOT NULL DEFAULT 0 COMMENT '预计分红订单数' ,
`order_num`  int(11) NOT NULL DEFAULT 0 COMMENT '分红订单数' ,
`region_num`  int(11) NOT NULL DEFAULT 0 COMMENT '当时区域人数' ,
`start_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分红时间段-开始时间' ,
`end_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分红时间段-结束时间' ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_region_cash` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`order_no`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号' ,
`price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '提现金额' ,
`service_charge`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '提现手续费（%）' ,
`type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '提现方式 auto--自动打款 wechat--微信打款 alipay--支付宝打款 bank--银行转账 balance--打款到余额' ,
`extra`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '额外信息 例如微信账号、支付宝账号等' ,
`status`  int(11) NOT NULL DEFAULT 0 COMMENT '提现状态 0--申请 1--同意 2--已打款 3--驳回' ,
`is_delete`  int(11) NOT NULL DEFAULT 0 ,
`created_at`  datetime NOT NULL ,
`updated_at`  datetime NOT NULL ,
`deleted_at`  datetime NOT NULL ,
`content`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_region_cash_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`type`  int(11) NOT NULL DEFAULT 1 COMMENT '类型 1--收入 2--支出' ,
`price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '变动佣金' ,
`desc`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL ,
`custom_desc`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL ,
`level_id`  int(11) NOT NULL DEFAULT 0 COMMENT '当时的区域等级' ,
`level_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
`order_num`  int(11) NOT NULL DEFAULT 0 ,
`bonus_rate`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '当时的分红比例' ,
`bonus_id`  int(11) NOT NULL DEFAULT 0 COMMENT '区域完成分红记录ID' ,
`is_delete`  int(11) NOT NULL DEFAULT 0 ,
`created_at`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`province_id`  int(11) NOT NULL DEFAULT 0 ,
`city_id`  int(11) NOT NULL DEFAULT 0 ,
`district_id`  int(11) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`),
INDEX `idx_1` (`mall_id`, `is_delete`, `province_id`, `level_id`, `type`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_region_level_up` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:申请升级中  1:通过升级 2:拒绝升级' ,
`level`  tinyint(1) NOT NULL COMMENT '升级的等级' ,
`reason`  varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '理由' ,
`is_read`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未读  1已读' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`),
INDEX `idx_1` (`mall_id`, `is_delete`, `user_id`, `created_at`) USING BTREE ,
INDEX `idx_2` (`user_id`) USING BTREE ,
INDEX `idx_3` (`created_at`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_region_order` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL DEFAULT 0 ,
`order_id`  int(11) NOT NULL DEFAULT 0 ,
`total_pay_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '订单实付金额' ,
`is_bonus`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '1已分红，0未分红' ,
`bonus_rate`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '分红比例' ,
`bonus_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分红时间' ,
`bonus_id`  int(11) NOT NULL DEFAULT 0 COMMENT '区域完成分红记录ID' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`province`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省' ,
`city`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '市' ,
`district`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区' ,
`province_id`  int(11) NOT NULL DEFAULT 0 ,
`city_id`  int(11) NOT NULL DEFAULT 0 ,
`district_id`  int(11) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_region_relation` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL COMMENT '代理id' ,
`district_id`  int(11) NOT NULL COMMENT '代理的省市区id' ,
`is_update`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是升级中的关联地区0：否 1：是' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`),
INDEX `mall_id` (`mall_id`, `district_id`, `is_update`, `is_delete`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_region_setting` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`key`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`value`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`created_at`  timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
`updated_at`  timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`is_delete`  int(11) NOT NULL DEFAULT 0 COMMENT '是否删除 0--未删除 1--已删除' ,
`deleted_at`  timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_region_user` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`area_id`  int(11) NOT NULL COMMENT '区域ID' ,
`province_id`  int(11) NOT NULL COMMENT '所属省' ,
`level`  tinyint(2) NOT NULL COMMENT '1:省代理  2:市代理 3:区代理' ,
`status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '-2被拒或移除后再次申请没提交 -1移除 0审核中，1同意，2拒绝' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`applyed_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '申请时间' ,
`agreed_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间' ,
PRIMARY KEY (`id`),
INDEX `created_at` (`created_at`) USING BTREE ,
INDEX `idx_1` (`mall_id`, `is_delete`, `status`, `created_at`) USING BTREE ,
INDEX `idx_2` (`mall_id`, `is_delete`, `user_id`, `status`, `created_at`) USING BTREE ,
INDEX `user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_region_user_info` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL ,
`name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域姓名' ,
`phone`  varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域手机号' ,
`all_bonus`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '累计分红' ,
`total_bonus`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '当前分红' ,
`out_bonus`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '已提现分红' ,
`remark`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注' ,
`reason`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '拒绝理由' ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`),
INDEX `idx_1` (`user_id`, `created_at`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_scratch_log` ADD COLUMN `token`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单表token' AFTER `deleted_at`;
ALTER TABLE `zjhj_bd_share_order` ADD COLUMN `price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '用于分销的金额' AFTER `deleted_at`;
ALTER TABLE `zjhj_bd_share_order` ADD COLUMN `first_share_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '一级分销的分销类型' AFTER `price`;
ALTER TABLE `zjhj_bd_share_order` ADD COLUMN `first_share_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '一级佣金' AFTER `first_share_type`;
ALTER TABLE `zjhj_bd_share_order` ADD COLUMN `second_share_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '二级分销的分销类型' AFTER `first_share_price`;
ALTER TABLE `zjhj_bd_share_order` ADD COLUMN `second_share_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '二级佣金' AFTER `second_share_type`;
ALTER TABLE `zjhj_bd_share_order` ADD COLUMN `third_share_type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '三级分销的分销类型' AFTER `second_share_price`;
ALTER TABLE `zjhj_bd_share_order` ADD COLUMN `third_share_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '三级佣金' AFTER `third_share_type`;
ALTER TABLE `zjhj_bd_share_order` ADD COLUMN `flag`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '修改记录 0--售后优化之前的分销订单 1--售后优化之后的订单' AFTER `third_share_price`;
CREATE TABLE `zjhj_bd_statistics_data_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL DEFAULT 0 ,
`key`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
`value`  int(11) NOT NULL DEFAULT 0 ,
`time_stamp`  int(11) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`),
INDEX `mall_id` (`mall_id`) USING BTREE ,
INDEX `key` (`key`) USING BTREE ,
INDEX `value` (`value`) USING BTREE ,
INDEX `time_stamp` (`time_stamp`) USING BTREE ,
INDEX `created_at` (`created_at`) USING BTREE ,
INDEX `mall_id_2` (`mall_id`) USING BTREE ,
INDEX `key_2` (`key`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_statistics_user_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL DEFAULT 0 ,
`user_id`  int(11) NOT NULL DEFAULT 0 ,
`num`  int(11) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`time_stamp`  int(11) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`),
INDEX `mall_id` (`mall_id`) USING BTREE ,
INDEX `user_id` (`user_id`) USING BTREE ,
INDEX `num` (`num`) USING BTREE ,
INDEX `created_at` (`created_at`) USING BTREE ,
INDEX `is_delete` (`is_delete`) USING BTREE ,
INDEX `time_stamp` (`time_stamp`) USING BTREE ,
INDEX `mall_id_2` (`mall_id`) USING BTREE ,
INDEX `user_id_2` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_store` MODIFY COLUMN `description`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门店描述' AFTER `business_hours`;
CREATE INDEX `is_super_admin` ON `zjhj_bd_user_identity`(`is_super_admin`) USING BTREE ;
CREATE INDEX `mall_id` ON `zjhj_bd_vip_card`(`mall_id`) USING BTREE ;
CREATE INDEX `is_delete` ON `zjhj_bd_vip_card`(`is_delete`) USING BTREE ;
CREATE INDEX `order_id` ON `zjhj_bd_vip_card_discount`(`order_id`) USING BTREE ;
ALTER TABLE `zjhj_bd_vip_card_order` MODIFY COLUMN `all_send`  varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' AFTER `status`;
CREATE INDEX `is_delete` ON `zjhj_bd_vip_card_setting`(`is_delete`) USING BTREE ;
ALTER TABLE `zjhj_bd_wxapp_config` MODIFY COLUMN `mchid`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' AFTER `updated_at`;
ALTER TABLE `zjhj_bd_wxapp_config` MODIFY COLUMN `key`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' AFTER `mchid`;
CREATE INDEX `mall_id` ON `zjhj_bd_wxapp_config`(`mall_id`) USING BTREE ;
CREATE TABLE `zjhj_bd_wxapp_service` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`cid`  int(11) NOT NULL COMMENT 'wxapp_config' ,
`appid`  varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务商appid' ,
`mchid`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务商mchid' ,
`is_choise`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '1选中  0不选' ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`key`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务商微信支付Api密钥' ,
`cert_pem`  varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
`key_pem`  varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE INDEX `mall_id` ON `zjhj_bd_wxapp_subscribe`(`mall_id`) USING BTREE ;

INSERT INTO `zjhj_bd_plugin_cat` (`id`, `name`, `display_name`, `color`, `sort`, `icon`, `is_delete`, `add_time`, `update_time`) VALUES
(1, 'xb4z5hqs6388pd5c', '销售渠道', '#3399FF', 100, NULL, 0, NULL, NULL),
(2, 'nddsdjdaxzmmeqk4', '促销玩法', '#FAA322', 100, NULL, 0, NULL, NULL),
(3, 'xwmgpax7jkzjrxha', '获客工具', '#0DBCD7', 100, NULL, 0, NULL, NULL),
(4, '3wsern27hxspzytd', '客户维护', '#E84C52', 100, NULL, 0, NULL, NULL),
(5, 'kwfhnndnbakznksb', '常用工具', '#7181D9', 100, NULL, 0, NULL, NULL);


INSERT INTO `zjhj_bd_plugin_cat_rel` (`id`, `plugin_name`, `plugin_cat_name`) VALUES
(89, 'wxapp', 'xb4z5hqs6388pd5c'),
(90, 'aliapp', 'xb4z5hqs6388pd5c'),
(91, 'ttapp', 'xb4z5hqs6388pd5c'),
(92, 'bdapp', 'xb4z5hqs6388pd5c'),
(93, 'advance', 'nddsdjdaxzmmeqk4'),
(94, 'composition', 'nddsdjdaxzmmeqk4'),
(95, 'pick', 'nddsdjdaxzmmeqk4'),
(96, 'booking', 'nddsdjdaxzmmeqk4'),
(97, 'bargain', 'nddsdjdaxzmmeqk4'),
(98, 'gift', 'nddsdjdaxzmmeqk4'),
(99, 'miaosha', 'nddsdjdaxzmmeqk4'),
(100, 'pintuan', 'nddsdjdaxzmmeqk4'),
(101, 'shopping', 'nddsdjdaxzmmeqk4'),
(102, 'ecard', 'nddsdjdaxzmmeqk4'),
(103, 'pond', 'xwmgpax7jkzjrxha'),
(104, 'bonus', 'xwmgpax7jkzjrxha'),
(105, 'check_in', 'xwmgpax7jkzjrxha'),
(106, 'fxhb', 'xwmgpax7jkzjrxha'),
(107, 'lottery', 'xwmgpax7jkzjrxha'),
(108, 'mch', 'xwmgpax7jkzjrxha'),
(109, 'quick_share', 'xwmgpax7jkzjrxha'),
(110, 'scratch', 'xwmgpax7jkzjrxha'),
(111, 'step', 'xwmgpax7jkzjrxha'),
(112, 'stock', 'xwmgpax7jkzjrxha'),
(113, 'region', 'xwmgpax7jkzjrxha'),
(114, 'integral_mall', '3wsern27hxspzytd'),
(115, 'vip_card', '3wsern27hxspzytd'),
(116, 'assistant', 'kwfhnndnbakznksb'),
(117, 'diy', 'kwfhnndnbakznksb'),
(118, 'app_admin', 'kwfhnndnbakznksb'),
(119, 'clerk', 'kwfhnndnbakznksb'),
(120, 'dianqilai', 'kwfhnndnbakznksb'),
(121, 'scan_code_pay', 'kwfhnndnbakznksb');

drop table zjhj_bd_core_plugin;
CREATE TABLE `zjhj_bd_core_plugin` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `display_name` varchar(64) NOT NULL,
  `version` varchar(64) NOT NULL DEFAULT '',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `pic_url` text,
  `desc` longtext,
  `sort` int(11) NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `zjhj_bd_core_plugin`
--

INSERT INTO `zjhj_bd_core_plugin` (`id`, `name`, `display_name`, `version`, `is_delete`, `created_at`, `updated_at`, `deleted_at`, `pic_url`, `desc`, `sort`) VALUES
(1, 'wxapp', '微信小程序', '1.0.24', 0, '2020-07-14 15:44:01', '2020-07-14 16:20:37', '0000-00-00 00:00:00', NULL, NULL, 1),
(2, 'diy', 'DIY装修', '1.0.85', 0, '2020-07-12 15:32:32', '2020-07-12 15:32:32', '0000-00-00 00:00:00', NULL, NULL, 2),
(3, 'advance', '商品预售', '1.0.42', 0, '2020-07-12 15:33:21', '2020-07-12 15:33:21', '0000-00-00 00:00:00', NULL, NULL, 1),
(4, 'composition', '套餐组合', '1.0.13', 0, '2020-07-14 15:40:52', '2020-07-14 15:40:52', '0000-00-00 00:00:00', NULL, NULL, 2),
(5, 'aliapp', '支付宝小程序', '1.0.96', 0, '2020-07-14 15:40:59', '2020-07-14 16:39:38', '0000-00-00 00:00:00', NULL, NULL, 2),
(6, 'app_admin', '手机端管理', '1.0.6', 0, '2020-07-14 15:41:07', '2020-07-14 15:41:07', '0000-00-00 00:00:00', NULL, NULL, 3),
(7, 'assistant', '采集助手', '1.0.5', 0, '2020-07-14 15:41:12', '2020-07-14 15:41:12', '0000-00-00 00:00:00', NULL, NULL, 1),
(8, 'bargain', '砍价', '1.0.51', 0, '2020-07-14 15:41:18', '2020-07-14 15:41:18', '0000-00-00 00:00:00', NULL, NULL, 5),
(9, 'bdapp', '百度小程序', '1.0.94', 0, '2020-07-14 15:41:24', '2020-07-14 15:41:24', '0000-00-00 00:00:00', NULL, NULL, 4),
(10, 'bonus', '团队分红', '1.0.32', 0, '2020-07-14 15:41:29', '2020-07-14 15:41:29', '0000-00-00 00:00:00', NULL, NULL, 2),
(11, 'booking', '预约', '1.0.61', 0, '2020-07-14 15:41:37', '2020-07-14 15:41:37', '0000-00-00 00:00:00', NULL, NULL, 4),
(12, 'check_in', '签到插件', '1.0.24', 0, '2020-07-14 15:41:42', '2020-07-14 15:41:42', '0000-00-00 00:00:00', NULL, NULL, 3),
(13, 'clerk', '核销员', '1.0.11', 0, '2020-07-14 15:41:48', '2020-07-14 15:41:48', '0000-00-00 00:00:00', NULL, NULL, 4),
(14, 'dianqilai', '客服系统', '1.0.7', 0, '2020-07-14 15:41:54', '2020-07-14 15:41:54', '0000-00-00 00:00:00', NULL, NULL, 5),
(15, 'ecard', '电子卡密', '1.0.4', 0, '2020-07-14 15:42:02', '2020-07-14 15:42:02', '0000-00-00 00:00:00', NULL, NULL, 10),
(16, 'fxhb', '拆红包', '1.0.32', 0, '2020-07-14 15:42:07', '2020-07-14 15:42:07', '0000-00-00 00:00:00', NULL, NULL, 4),
(17, 'gift', '社交送礼', '1.0.25', 0, '2020-07-14 15:42:13', '2020-07-14 15:42:13', '0000-00-00 00:00:00', NULL, NULL, 6),
(18, 'integral_mall', '积分商城', '1.0.54', 0, '2020-07-14 15:42:19', '2020-07-14 15:42:19', '0000-00-00 00:00:00', NULL, NULL, 1),
(19, 'lottery', '幸运抽奖', '1.0.56', 0, '2020-07-14 15:42:24', '2020-07-14 15:42:24', '0000-00-00 00:00:00', NULL, NULL, 5),
(20, 'mch', '多商户', '1.0.67', 0, '2020-07-14 15:42:30', '2020-07-14 15:42:30', '0000-00-00 00:00:00', NULL, NULL, 6),
(21, 'miaosha', '整点秒杀', '1.0.56', 0, '2020-07-14 15:42:37', '2020-07-14 15:42:37', '0000-00-00 00:00:00', NULL, NULL, 7),
(22, 'pick', 'N元任选', '1.0.19', 0, '2020-07-14 15:42:42', '2020-07-14 15:42:42', '0000-00-00 00:00:00', NULL, NULL, 3),
(23, 'pintuan', '拼团', '1.0.90', 0, '2020-07-14 15:42:58', '2020-07-14 15:42:58', '0000-00-00 00:00:00', NULL, NULL, 8),
(24, 'pond', '九宫格', '1.0.34', 0, '2020-07-14 15:43:04', '2020-07-14 15:43:04', '0000-00-00 00:00:00', NULL, NULL, 1),
(25, 'quick_share', '一键发圈', '1.0.12', 0, '2020-07-14 15:43:10', '2020-07-14 15:43:10', '0000-00-00 00:00:00', NULL, NULL, 7),
(26, 'scan_code_pay', '当面付', '1.0.28', 0, '2020-07-14 15:43:16', '2020-07-14 15:43:16', '0000-00-00 00:00:00', NULL, NULL, 6),
(27, 'scratch', '刮刮卡', '1.0.34', 0, '2020-07-14 15:43:22', '2020-07-14 15:43:22', '0000-00-00 00:00:00', NULL, NULL, 8),
(28, 'shopping', '好物圈', '1.0.8', 0, '2020-07-14 15:43:27', '2020-07-14 15:43:27', '0000-00-00 00:00:00', NULL, NULL, 9),
(29, 'step', '步数宝', '1.0.60', 0, '2020-07-14 15:43:33', '2020-07-14 15:43:33', '0000-00-00 00:00:00', NULL, NULL, 9),
(30, 'stock', '股东分红', '1.0.16', 0, '2020-07-14 15:43:39', '2020-07-14 15:43:39', '0000-00-00 00:00:00', NULL, NULL, 10),
(31, 'ttapp', '抖音/头条小程序', '1.0.96', 0, '2020-07-14 15:43:49', '2020-07-14 15:43:49', '0000-00-00 00:00:00', NULL, NULL, 3),
(32, 'vip_card', '超级会员卡', '1.0.38', 0, '2020-07-14 15:43:55', '2020-07-14 15:43:55', '0000-00-00 00:00:00', NULL, NULL, 2),
(33, 'region', '区域代理', '1.0.4', 0, '2020-07-12 15:19:44', '2020-07-12 15:19:44', '0000-00-00 00:00:00', NULL, NULL, 11),
(34, 'flash_sale', '限时抢购', '1.0.1', 0, '2020-07-12 15:19:44', '2020-07-12 15:19:44', '0000-00-00 00:00:00', NULL, NULL, 11);

truncate table zjhj_bd_cloud_template;
INSERT INTO `zjhj_bd_cloud_template` (`id`, `name`, `pics`, `detail`, `price`, `type`, `version`, `package`) VALUES
(1, '双十二', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/d66b72d485ceed26d358e8f142dec60f.png\"]', '双十二', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/6d79442a06563f9b356854994d794b9a.zip'),
(2, '服饰1', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/42d68cee10e3fa8af2c23ab81241e14e.png\"]', '服饰1', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/e7b0241ebaf1b6a62498d6b3368104d7.zip'),
(3, '服饰2', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/7e96634708ed70371f9fbcd3dcba0bb4.png\"]', '服饰2', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/ab1744dc43d2086eb9c783bef3103a81.zip'),
(4, '服饰3', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/2e86a1ad42ac8ea8b5f9c8e1131e2cc2.png\"]', '服饰3', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/0f42e2f848b9f4f915e89bb143a07f08.zip'),
(5, '生鲜1', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/3d6b77eb7d512537c8e03e86c1e052f5.png\"]', '生鲜1', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/60cada7959c796057723077f5ece92b8.zip'),
(6, '生鲜2', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/7b516ba8fce669badea52aa2452dc3db.png\"]', '生鲜2', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/2d55951b4a6f9edfb3119f1a6523d85d.zip'),
(7, '美妆1', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/9d24aec77b45951b50343f3bc9708cd9.png\"]', '美妆1', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/7926abf6c6100457633685f5bc59375a.zip'),
(8, '美妆2', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/dc9370e6666b5cb588d81c1b22c72151.png\"]', '美妆2', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/35f29d446dd3b6329affd943e0e9f5c4.zip'),
(9, '超市1', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/3bddad82d6c63870596334e318777fa5.png\"]', '超市1', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/33bd4dfe5ad7a707042a74b7bd79d843.zip'),
(10, '超市2', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/81ecb3a4ec8e8248da0e7f7a027bafd2.png\"]', '超市2', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/87646dd04503f59f316e23af515015e8.zip'),
(11, '超市3', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/63f989c9f7b9663e6ab9de13c03056b6.png\"]', '超市3', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/476d9d5bcc2b4faba2693b4f6c990603.zip'),
(12, '春节模板', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/2be7b8bd21b5b89c1008bcbfbd6fc876.png\"]', '春节模板', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/29434d36932147c538e575e95918ec3b.zip'),
(13, '元宵节模板', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/a5c397ade39f0e76c784d46078f0ea20.png\"]', '元宵节模板', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/4057bee3a03bcbe14d1c7d5fb36a5afb.zip'),
(14, '情人节模板', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/615112ec2dc3e3b0b8aaa9b0b93bd4f0.png\"]', '情人节模板', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/f275c5db1cbd432567b7eaab81cf1dd0.zip'),
(15, '春节模板2', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/2022fc32d157bbdacae989174c75d583.png\"]', '春节模板2', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/732a5469e1f2110de1b0433ba9223a14.zip'),
(16, '元宵节模板2', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/5f8c2f51b4a9160decb00bed2277952f.png\"]', '元宵节模板2', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/46fcb342159ea926a4a5258503717895.zip'),
(17, '情人节模板2', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/a0dadedd1a511bfa59fa63497a8c974d.png\"]', '情人节模板2', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/ee6f185747fc4079bc097331ffe26e94.zip'),
(18, '妇女节', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/be4f913235be3ca1b7a4b4d34bb45216.png\"]', '妇女节', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/aa6b10949760ec20e2febfe8598d28e1.zip'),
(19, '妇女节2', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/df3307934c25cfbf1ae2c1046037d8bc.png\"]', '妇女节2', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/3d31d280d6bb8e87fdf433369bc25126.zip'),
(20, '51劳动节', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/fdce3d73af8165e0f5652187213950e3.png\"]', '51劳动节', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/976637b958d269cd483784e9c5c1c71e.zip'),
(21, '51劳动节-2', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/a65509e5cee18c6dda134cde50009892.png\"]', '51劳动节-2', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/db17654eddbc57754dfb9542f57ffd6a.zip'),
(22, '618年中盛典', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/3dec44461189a8c99b157e426ec98aa4.png\"]', '618年中盛典', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/c651005b5944a0b61871b82459edece4.zip'),
(23, '618年中盛典-2', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/35120f94cf467eb8874aa67afe0b12c4.png\"]', '618年中盛典-2', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/fc0274194a2297cceee2d62bdb7ec248.zip'),
(24, '端午节2', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/995334b8ad426121aa8565297b51fcca.png\"]', '端午节2', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/0605dac1b23afa05e59ee253c5785ff2.zip'),
(25, '端午节1', '[\"http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/da8a5f4aa964f4dd933b60f9643a7353.png\"]', '端午节1', '0.00', 'diy', '0.0.1', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/61173884b5b6f8bb604ad0bfe5998b22.zip');


ALTER TABLE `zjhj_bd_balance_log` ADD COLUMN `order_no`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号' AFTER `custom_desc`;
CREATE TABLE `zjhj_bd_city_preview_order` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`result_data`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL ,
`order_info`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL ,
`created_at`  timestamp NULL DEFAULT NULL ,
`order_detail_sign`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
`all_order_info`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_city_service` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`platform`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属平台' ,
`name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配送名称' ,
`distribution_corporation`  int(11) NOT NULL COMMENT '配送公司 1.顺丰|2.闪送|3.美团配送|4.达达' ,
`shop_no`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门店编号' ,
`data`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL ,
`created_at`  timestamp NULL DEFAULT NULL ,
`is_delete`  int(1) NOT NULL DEFAULT 0 ,
`service_type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_activity` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`status`  int(11) NOT NULL DEFAULT 0 COMMENT '状态 0下架 1上架' ,
`is_delete`  tinyint(4) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`title`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动标题' ,
`start_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动开始时间' ,
`end_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动结束时间' ,
`is_area_limit`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否单独区域购买' ,
`area_limit`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`full_price`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '满减方案json' ,
`condition`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭，1开启人数条件，2开启件数条件' ,
`num`  int(11) NOT NULL DEFAULT 0 COMMENT '条件数量' ,
PRIMARY KEY (`id`),
INDEX `idx_1` (`mall_id`, `is_delete`, `created_at`) USING BTREE ,
INDEX `sort` (`start_at`, `end_at`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_activity_locking` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`activity_id`  int(11) NOT NULL DEFAULT 0 ,
`middleman_id`  int(11) NOT NULL DEFAULT 0 ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_activity_robots` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`activity_id`  int(11) NOT NULL DEFAULT 0 ,
`middleman_id`  int(11) NOT NULL DEFAULT 0 ,
`robots_ids`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_address` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人' ,
`province_id`  int(11) NOT NULL ,
`province`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省份名称' ,
`city_id`  int(11) NOT NULL ,
`city`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '城市名称' ,
`district_id`  int(11) NOT NULL ,
`district`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '县区名称' ,
`mobile`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话' ,
`detail`  varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址' ,
`is_default`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除' ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`latitude`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '经度' ,
`longitude`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '纬度' ,
`location`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '位置' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_bonus_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL DEFAULT 0 ,
`user_id`  int(11) NOT NULL DEFAULT 0 ,
`order_id`  int(11) NOT NULL DEFAULT 0 ,
`activity_id`  int(11) NOT NULL DEFAULT 0 COMMENT '活动ID' ,
`desc`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
`price`  decimal(10,2) NOT NULL DEFAULT 0.00 ,
`profit_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '利润' ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_cart` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL DEFAULT 0 ,
`mch_id`  int(11) NOT NULL DEFAULT 0 ,
`user_id`  int(11) NOT NULL DEFAULT 0 ,
`activity_id`  int(11) NOT NULL DEFAULT 0 ,
`community_goods_id`  int(11) NOT NULL DEFAULT 0 ,
`goods_id`  int(11) NOT NULL DEFAULT 0 ,
`goods_attr_id`  int(11) NOT NULL DEFAULT 0 ,
`attr_info`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`num`  int(11) NOT NULL DEFAULT 0 ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`goods_id`  int(11) NOT NULL DEFAULT 0 ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除' ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`activity_id`  int(11) NOT NULL DEFAULT 0 COMMENT '活动id' ,
`sort`  int(11) NOT NULL DEFAULT 100 COMMENT '排序' ,
PRIMARY KEY (`id`),
INDEX `activity` (`activity_id`) USING BTREE ,
INDEX `goods_id` (`goods_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_goods_attr` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`goods_id`  int(11) NOT NULL DEFAULT 0 ,
`attr_id`  int(11) NOT NULL DEFAULT 0 ,
`supply_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '供货价' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL DEFAULT 0 ,
`middleman_id`  int(11) NOT NULL DEFAULT 0 ,
`activity_id`  int(11) NOT NULL DEFAULT 0 ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_middleman` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`money`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '可提现利润' ,
`total_money`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '累计利润' ,
`status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '0--申请中 1--通过 2--拒绝 -1--未支付' ,
`apply_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '申请时间' ,
`become_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '通过审核时间' ,
`delete_first_show`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除后是否显示0--不显示 1--显示' ,
`reason`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '审核结果原因' ,
`content`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注' ,
`name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人' ,
`mobile`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系电话' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除' ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`pay_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '支付的金额' ,
`token`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
`pay_type`  tinyint(255) NOT NULL DEFAULT 0 COMMENT '支付方式' ,
`pay_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间' ,
`total_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '销售总额' ,
`order_count`  int(11) NOT NULL DEFAULT 0 COMMENT '订单总数' ,
PRIMARY KEY (`id`),
INDEX `user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_middleman_activity` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`middleman_id`  int(11) NOT NULL DEFAULT 0 COMMENT '团长user_id' ,
`activity_id`  int(11) NOT NULL DEFAULT 0 COMMENT '活动id' ,
`is_remind`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否提醒 0--未提醒 1--已提醒' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_order` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL DEFAULT 0 ,
`order_id`  int(11) NOT NULL DEFAULT 0 ,
`activity_id`  int(11) NOT NULL DEFAULT 0 COMMENT '活动ID' ,
`user_id`  int(11) NOT NULL DEFAULT 0 COMMENT '用户ID' ,
`middleman_id`  int(11) NOT NULL COMMENT '团长ID' ,
`profit_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '总利润' ,
`profit_data`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '利润详情' ,
`full_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '满多少' ,
`discount_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`activity_no`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动编号' ,
`no`  int(11) NOT NULL DEFAULT 0 COMMENT '编号' ,
`num`  int(11) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_relations` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL DEFAULT 0 ,
`middleman_id`  int(11) NOT NULL DEFAULT 0 ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_community_switch` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`middleman_id`  int(11) NOT NULL DEFAULT 0 ,
`activity_id`  int(11) NOT NULL DEFAULT 0 ,
`goods_id`  int(11) NOT NULL DEFAULT 0 ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_coupon` ADD COLUMN `can_receive_count`  int(11) NOT NULL DEFAULT 1 COMMENT '可领取数量' AFTER `discount_limit`;
ALTER TABLE `zjhj_bd_coupon` ADD COLUMN `app_share_title`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' AFTER `can_receive_count`;
ALTER TABLE `zjhj_bd_coupon` ADD COLUMN `app_share_pic`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' AFTER `app_share_title`;
ALTER TABLE `zjhj_bd_delivery` ADD COLUMN `business_type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '业务类型' AFTER `is_goods_alias`;
ALTER TABLE `zjhj_bd_delivery` ADD COLUMN `kd100_business_type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快递100 业务类型' AFTER `is_goods`;
ALTER TABLE `zjhj_bd_delivery` ADD COLUMN `kd100_template`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快递100 模板' AFTER `kd100_business_type`;
CREATE TABLE `zjhj_bd_exchange_code` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`library_id`  int(11) NOT NULL ,
`type`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 后台 1礼品卡' ,
`code`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL ,
`status`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态开关 0禁用 1 启用 2 兑换 3结束' ,
`validity_type`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
`valid_end_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`valid_start_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`r_user_id`  int(11) NOT NULL DEFAULT 0 ,
`r_raffled_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`r_rewards`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL ,
`r_origin`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '兑换来源' ,
`name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '后台联系人' ,
`mobile`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '后台手机号码' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_exchange_code_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`is_success`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否兑换成功' ,
`code`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
`origin`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'admin app' ,
`remake`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简单说明' ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_exchange_coupon_relation` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`code_id`  int(11) NOT NULL ,
`user_coupon_id`  int(11) NOT NULL ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_exchange_goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`library_id`  int(11) NOT NULL DEFAULT 0 ,
`goods_id`  int(11) NOT NULL ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_exchange_library` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称' ,
`remark`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '说明' ,
`expire_type`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'all' COMMENT 'all 永久 fixed 固定 relatively相对' ,
`expire_start_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '固定开始' ,
`expire_end_time`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '固定开始' ,
`expire_start_day`  int(10) NOT NULL DEFAULT 0 COMMENT '相对开始' ,
`expire_end_day`  int(10) NOT NULL DEFAULT 0 COMMENT '相对结束' ,
`mode`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 全部 1 份' ,
`code_format`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'english_num' COMMENT 'english_num, num' ,
`rewards`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '奖励品' ,
`rewards_s`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '奖励品类型 后台搜索使用' ,
`is_recycle`  tinyint(1) NOT NULL COMMENT '是否加入回收站' ,
`recycle_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`updated_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`deleted_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_exchange_order` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`order_id`  int(11) NOT NULL ,
`exchange_id`  int(11) NOT NULL ,
`code_id`  int(11) NOT NULL ,
`goods_id`  int(11) NOT NULL ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_exchange_record_order` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`order_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`token`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`code_id`  int(11) NOT NULL ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_exchange_reward_result` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`code_token`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
`token`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
`data`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_exchange_svip_order` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`order_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`code_id`  int(11) NOT NULL ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_favorite` ADD COLUMN `mirror_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '收藏时的售价' AFTER `goods_id`;
CREATE TABLE `zjhj_bd_finance` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`order_no`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号' ,
`price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '提现金额' ,
`service_charge`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '提现手续费（%）' ,
`type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '提现方式 auto--自动打款 wechat--微信打款 alipay--支付宝打款 bank--银行转账 balance--打款到余额' ,
`extra`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '额外信息 例如微信账号、支付宝账号等' ,
`status`  int(11) NOT NULL DEFAULT 0 COMMENT '提现状态 0--申请 1--同意 2--已打款 3--驳回' ,
`is_delete`  int(11) NOT NULL DEFAULT 0 ,
`created_at`  datetime NOT NULL ,
`updated_at`  datetime NOT NULL ,
`deleted_at`  datetime NOT NULL ,
`content`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL ,
`name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名' ,
`model`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '提现插件(share,bonus,stock,region,mch)' ,
`transfer_status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '0.待转账 | 1.已转账  | 2.拒绝转账' ,
`phone`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_free_delivery_rules` ADD COLUMN `type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:订单满额包邮  2:订单满件包邮  3:单商品满额包邮 4:单商品满件包邮' AFTER `name`;
ALTER TABLE `zjhj_bd_free_delivery_rules` ADD COLUMN `status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认  0否 1是' AFTER `detail`;
CREATE TABLE `zjhj_bd_full_reduce_activity` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动标题' ,
`content`  varchar(8192) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' ,
`status`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0下架 1上架' ,
`created_at`  timestamp NOT NULL ,
`updated_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
`start_at`  timestamp NOT NULL ,
`end_at`  timestamp NOT NULL ,
`appoint_type`  tinyint(1) NOT NULL COMMENT '1:全部商品\r\n2:全部自营商品\r\n3:指定商品参加\r\n4:指定商品不参加' ,
`rule_type`  tinyint(1) NOT NULL COMMENT '1:阶梯满减\r\n2:循环满减' ,
`discount_rule`  varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '阶梯满减规则' ,
`loop_discount_rule`  varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '循环满减规则' ,
`appoint_goods`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`noappoint_goods`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_gift_send_order` ADD COLUMN `full_reduce_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '满减活动优惠价格' AFTER `member_discount_price`;
ALTER TABLE `zjhj_bd_goods` ADD COLUMN `shipping_id`  int(11) NOT NULL DEFAULT 0 COMMENT '包邮模板ID' AFTER `forehead`;
ALTER TABLE `zjhj_bd_goods` ADD COLUMN `give_balance`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '赠送余额' AFTER `give_integral_type`;
ALTER TABLE `zjhj_bd_goods` ADD COLUMN `give_balance_type`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '赠送余额类型1.固定值 |2.百分比' AFTER `give_balance`;
ALTER TABLE `zjhj_bd_goods` ADD COLUMN `detail_count`  int(11) NOT NULL DEFAULT 0 COMMENT '详情浏览量统计' AFTER `sales`;
ALTER TABLE `zjhj_bd_goods` ADD COLUMN `guarantee_title`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品服务标题' AFTER `detail_count`;
ALTER TABLE `zjhj_bd_goods` ADD COLUMN `guarantee_pic`  varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品服务标识' AFTER `guarantee_title`;
ALTER TABLE `zjhj_bd_goods_cards` ADD COLUMN `app_share_title`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' AFTER `number`;
ALTER TABLE `zjhj_bd_goods_cards` ADD COLUMN `app_share_pic`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' AFTER `app_share_title`;
ALTER TABLE `zjhj_bd_goods_cards` ADD COLUMN `is_allow_send`  int(1) NOT NULL DEFAULT 0 COMMENT '是否允许转赠' AFTER `app_share_pic`;
CREATE TABLE `zjhj_bd_goods_coupon_relation` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`goods_id`  int(11) NOT NULL ,
`coupon_id`  int(11) NOT NULL ,
`num`  int(11) NOT NULL DEFAULT 1 ,
`is_delete`  int(11) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
CREATE TABLE `zjhj_bd_goods_hot_search` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL ,
`goods_id`  int(11) NOT NULL COMMENT '商品id' ,
`title`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '热搜词' ,
`type`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'goods 自动 hot-search 手动' ,
`sort`  smallint(2) NOT NULL DEFAULT 0 COMMENT '排序' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NOT NULL ,
`deleted_at`  timestamp NOT NULL ,
PRIMARY KEY (`id`),
INDEX `mall_id` (`mall_id`, `type`, `is_delete`) USING BTREE ,
INDEX `goods_id` (`goods_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_goods_services` ADD COLUMN `pic`  varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品服务标识' AFTER `name`;
ALTER TABLE `zjhj_bd_goods_warehouse` ADD COLUMN `subtitle`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '副标题' AFTER `name`;
ALTER TABLE `zjhj_bd_integral_log` ADD COLUMN `order_no`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号' AFTER `custom_desc`;
ALTER TABLE `zjhj_bd_order` ADD COLUMN `full_reduce_price`  decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '满减活动优惠价格' AFTER `member_discount_price`;
ALTER TABLE `zjhj_bd_order_comments` ADD COLUMN `goods_info`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品信息' AFTER `is_top`;
ALTER TABLE `zjhj_bd_order_comments` ADD COLUMN `attr_id`  int(11) NOT NULL DEFAULT 0 COMMENT '规格' AFTER `goods_info`;
CREATE INDEX `created_at` ON `zjhj_bd_order_detail`(`created_at`) USING BTREE ;
ALTER TABLE `zjhj_bd_order_detail_express` ADD COLUMN `city_mobile`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL AFTER `express_single_id`;
ALTER TABLE `zjhj_bd_order_detail_express` ADD COLUMN `city_info`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL AFTER `city_mobile`;
ALTER TABLE `zjhj_bd_order_detail_express` ADD COLUMN `city_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL AFTER `city_info`;
ALTER TABLE `zjhj_bd_order_detail_express` ADD COLUMN `shop_order_id`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL AFTER `city_name`;
ALTER TABLE `zjhj_bd_order_detail_express` ADD COLUMN `status`  int(11) NOT NULL DEFAULT 0 AFTER `shop_order_id`;
ALTER TABLE `zjhj_bd_order_detail_express` ADD COLUMN `express_type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' AFTER `status`;
ALTER TABLE `zjhj_bd_order_detail_express` ADD COLUMN `city_service_id`  int(11) NOT NULL DEFAULT 0 AFTER `express_type`;
ALTER TABLE `zjhj_bd_pond_setting` ADD COLUMN `bg_pic`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '背景图' AFTER `is_print`;
ALTER TABLE `zjhj_bd_pond_setting` ADD COLUMN `bg_color`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '背景颜色' AFTER `bg_pic`;
ALTER TABLE `zjhj_bd_pond_setting` ADD COLUMN `bg_color_type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '背景颜色类型' AFTER `bg_color`;
ALTER TABLE `zjhj_bd_pond_setting` ADD COLUMN `bg_gradient_color`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '背景渐变颜色' AFTER `bg_color_type`;
ALTER TABLE `zjhj_bd_printer_setting` ADD COLUMN `order_send_type`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' AFTER `show_type`;
ALTER TABLE `zjhj_bd_recharge` ADD COLUMN `send_member_id`  int(11) NOT NULL DEFAULT 0 COMMENT '赠送的会员' AFTER `send_integral`;
ALTER TABLE `zjhj_bd_recharge_orders` ADD COLUMN `send_member_id`  int(11) NOT NULL DEFAULT 0 COMMENT '赠送的会员' AFTER `send_integral`;
ALTER TABLE `zjhj_bd_scratch_setting` ADD COLUMN `bg_pic`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '背景图' AFTER `is_print`;
ALTER TABLE `zjhj_bd_share` ADD COLUMN `form`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分销商自定义表单' AFTER `delete_first_show`;
ALTER TABLE `zjhj_bd_user` ADD COLUMN `unionid`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' AFTER `mobile`;
ALTER TABLE `zjhj_bd_user_card` ADD COLUMN `receive_id`  int(11) NOT NULL DEFAULT 0 COMMENT '转赠领取的用户id' AFTER `number`;
ALTER TABLE `zjhj_bd_user_card` ADD COLUMN `parent_card_id`  int(11) NOT NULL DEFAULT 0 COMMENT '转赠的用户卡券id' AFTER `receive_id`;
ALTER TABLE `zjhj_bd_user_card` ADD COLUMN `remark`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '简单备注来源' AFTER `parent_card_id`;
CREATE TABLE `zjhj_bd_user_coupon_goods` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mall_id`  int(11) NOT NULL DEFAULT 0 COMMENT '商城ID' ,
`user_coupon_id`  int(11) NOT NULL DEFAULT 0 COMMENT '优惠券ID' ,
`user_id`  int(11) NOT NULL DEFAULT 0 COMMENT '用户ID' ,
`goods_id`  int(11) NOT NULL COMMENT '商品ID' ,
`is_delete`  int(11) NOT NULL DEFAULT 0 COMMENT '是否删除 0--不删除 1--删除' ,
`created_at`  timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
`updated_at`  timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
`deleted_at`  timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间' ,
PRIMARY KEY (`id`),
INDEX `mall_id` (`mall_id`) USING BTREE ,
INDEX `user_coupon_id` (`user_coupon_id`) USING BTREE ,
INDEX `user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
ROW_FORMAT=Compact
;
ALTER TABLE `zjhj_bd_vip_card_order` ADD COLUMN `sign`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' AFTER `deleted_at`;
ALTER TABLE `zjhj_bd_vip_card_setting` ADD COLUMN `is_order_form`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '下单表单开关' AFTER `rules`;
ALTER TABLE `zjhj_bd_vip_card_setting` ADD COLUMN `order_form`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL AFTER `is_order_form`;

DROP TABLE IF EXISTS `zjhj_bd_core_plugin`;
CREATE TABLE `zjhj_bd_core_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `display_name` varchar(64) NOT NULL,
  `version` varchar(64) NOT NULL DEFAULT '',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `pic_url` text,
  `desc` longtext,
  `sort` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;


INSERT INTO `zjhj_bd_core_plugin` VALUES ('1', 'wxapp', '微信小程序', '1.0.31', '0', '2020-07-14 23:44:01', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/d52a90d4eb06059d9fdb0641592400b3.png', '在微信小程序中经营你的店铺', '1');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('2', 'diy', 'DIY装修', '1.0.102', '0', '2020-07-12 23:32:32', '2020-10-04 10:41:37', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/4903220b146520fd91533ed140d2542f.png', 'DIY店铺风格和元素，千人千面', '2');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('3', 'advance', '商品预售', '1.0.57', '0', '2020-07-12 23:33:21', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/888a3c5dbc7881c74e2ae4299c4e6e2c.png', '提前交付定金，尾款享受优惠', '1');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('4', 'composition', '套餐组合', '1.0.15', '0', '2020-07-14 23:40:52', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/753525bea4854dae63ce83f575fa3a10.png', '套餐组合', '2');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('5', 'aliapp', '支付宝小程序', '1.0.136', '0', '2020-07-14 23:40:59', '2020-10-04 10:41:38', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/e1f631677b48470eeb0c50f811165472.png', '在支付宝小程序中经营你的店铺', '2');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('6', 'app_admin', '手机端管理', '1.0.7', '0', '2020-07-14 23:41:07', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/e3e79ca9b97dba95ae79b9ac1bed16f9.png', '手机端操作管理店铺', '3');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('7', 'assistant', '采集助手', '1.0.5', '0', '2020-07-14 23:41:12', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/8064507d4b463ae2be31dd86ccc4bd8d.png', '采集助手', '1');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('8', 'bargain', '砍价', '1.0.61', '0', '2020-07-14 23:41:18', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/10da8fa3ab90d190fb6c8dcb1fa0ac24.png', '邀请好友砍价后低价购买', '5');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('9', 'bdapp', '百度小程序', '1.0.134', '0', '2020-07-14 23:41:24', '2020-10-04 10:41:39', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/c606e51d6c842f68b768c6780f6dbc87.png', '在百度小程序中经营你的店铺', '4');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('10', 'bonus', '团队分红', '1.0.40', '0', '2020-07-14 23:41:29', '2020-10-04 10:41:40', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/6831954dc342f2ba066621409fe1e60d.png', '队长获得队员订单分红', '2');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('11', 'booking', '预约', '1.0.69', '0', '2020-07-14 23:41:37', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/07c662e46ade264338df7544c5f5057f.png', '提前线下消费或服务', '4');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('12', 'check_in', '签到插件', '1.0.26', '0', '2020-07-14 23:41:42', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/9f8feafc5d1619c3d897e56ba2fd4147.png', '促进店铺访问量和用户活跃度', '3');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('13', 'clerk', '手机端核销员', '1.0.11', '0', '2020-07-14 23:41:48', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/2743ec86b035db21eaa5e3019e33c714.png', '手机端扫码核销，查询订单', '4');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('14', 'dianqilai', '客服系统', '1.0.7', '0', '2020-07-14 23:41:54', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/9a1ae4508528799d9ca5543a857b3237.png', '促进商家和买家之间的高效交流', '5');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('15', 'ecard', '电子卡密', '1.0.7', '0', '2020-07-14 23:42:02', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/ea1a03f8a27561ea18ec1312b102c3e3.png', '电子卡密', '11');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('16', 'fxhb', '裂变拆“红包”', '1.0.33', '0', '2020-07-14 23:42:07', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/9a7e9bb462ece248a6da22d7a2a39b84.png', '裂变式邀请好友拆“红包”', '4');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('17', 'gift', '社交送礼', '1.0.35', '0', '2020-07-14 23:42:13', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/e88d4dd935389049bdeda86856b59ed3.png', '购买礼品送给朋友', '6');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('18', 'integral_mall', '积分商城', '1.0.61', '0', '2020-07-14 23:42:19', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/4677340a313d1d6a417492dd3b615540.png', '使用积分或积分+现金兑换商品', '1');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('19', 'lottery', '幸运抽奖', '1.0.61', '0', '2020-07-14 23:42:24', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/0bde7f03396f64b1a6a602ffdc384fe8.png', '裂变玩法，抽取幸运客户赠送奖品', '5');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('20', 'mch', '多商户', '1.0.73', '0', '2020-07-14 23:42:30', '2020-10-04 10:41:41', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/e518720e0d614439e51b49735fe1f842.png', '获取入驻商流量，自营+商户入驻', '6');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('21', 'miaosha', '整点秒杀', '1.0.62', '0', '2020-07-14 23:42:37', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/7ec0386824388b8ce18040857058827d.png', '引导客户快速抢购', '7');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('22', 'pick', 'N元任选', '1.0.28', '0', '2020-07-14 23:42:42', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/a4f3d48897eb696fd936816f33a2da70.png', 'N元任选', '3');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('23', 'pintuan', '拼团', '1.0.102', '0', '2020-07-14 23:42:58', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/1ad43702df97bdea25452f00b3b49f5e.png', '引导客户邀请朋友一起拼团购买', '8');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('24', 'pond', '九宫格抽奖', '1.0.44', '0', '2020-07-14 23:43:04', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/4b9e58ea9aa6f60e08b5aaef20426ac9.png', '抽积分、优惠券、实物等', '1');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('25', 'quick_share', '一键发圈', '1.0.15', '0', '2020-07-14 23:43:10', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/7e2836a9861b31de1eb548f067bb2fde.png', '一键保存文案和图片，高效发朋友圈', '7');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('26', 'scan_code_pay', '当面付', '1.0.32', '0', '2020-07-14 23:43:16', '2020-10-04 10:41:42', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/0680c8f2ef2632d373750bd8addcfe8b.png', '线下场景扫码当面支付', '6');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('27', 'scratch', '刮刮卡', '1.0.42', '0', '2020-07-14 23:43:22', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/28fd30646970fe742350d47c3494aee4.png', '刮开卡片参与抽奖', '8');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('28', 'shopping', '好物圈', '1.0.9', '0', '2020-07-14 23:43:27', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/994df3a6c8dc456d4a3a3614b4deaec4.png', '向微信好友推荐好商品', '9');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('29', 'step', '步数宝', '1.0.69', '0', '2020-07-14 23:43:33', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/7e2e64e891d444d5c31824fee9f8fb88.png', '步数兑换商品', '9');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('30', 'stock', '股东分红', '1.0.20', '0', '2020-07-14 23:43:39', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/8174c99e859fd446abd47b877fd41a45.png', '股东分红', '10');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('31', 'ttapp', '抖音/头条小程序', '1.0.136', '0', '2020-07-14 23:43:49', '2020-10-04 10:41:43', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/0192ac346351c5fbdc2ea1c953d097f2.png', '在抖音/头条小程序中经营你的店铺', '3');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('32', 'vip_card', '超级会员卡', '1.0.52', '0', '2020-07-14 23:43:55', '2020-10-04 10:41:44', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/9c719748ee725092f09fdc5ee18538f2.png', '享受超级会员折扣和福利', '2');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('33', 'region', '区域代理', '1.0.10', '0', '2020-07-12 23:19:44', '2020-10-04 10:41:45', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/1a698f7c1b6c64b57f878d735734858b.png', '区域代理', '11');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('34', 'flash_sale', '限时抢购', '1.0.12', '0', '2020-07-12 23:19:44', '2020-10-04 10:33:33', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/0c4882580c64ac1c5a239b653b2e429f.png', '一段时间内以指定的优惠出售', '12');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('35', 'community', '社区团购', '1.0.23', '0', '2020-08-06 14:49:35', '2020-10-04 10:41:46', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/8fec059e37dbf85adb01bd1d7f904d1e.png', '团长群内推广，本地社区自提', '10');
INSERT INTO `zjhj_bd_core_plugin` VALUES ('36', 'exchange', '兑换中心', '1.0.8', '0', '2020-09-08 23:01:52', '2020-10-04 10:41:46', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/e7116ea1eee1ae77747cca91cc9f7fed.png', '提货卡、礼品卡、送礼神器', '3');

DROP TABLE IF EXISTS `zjhj_bd_plugin_cat_rel`;
CREATE TABLE `zjhj_bd_plugin_cat_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(32) NOT NULL,
  `plugin_cat_name` varchar(24) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_name` (`plugin_name`),
  KEY `plugin_cat_name` (`plugin_cat_name`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('263', 'wxapp', 'xb4z5hqs6388pd5c');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('264', 'aliapp', 'xb4z5hqs6388pd5c');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('265', 'ttapp', 'xb4z5hqs6388pd5c');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('266', 'bdapp', 'xb4z5hqs6388pd5c');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('267', 'advance', 'nddsdjdaxzmmeqk4');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('268', 'composition', 'nddsdjdaxzmmeqk4');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('269', 'pick', 'nddsdjdaxzmmeqk4');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('270', 'booking', 'nddsdjdaxzmmeqk4');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('271', 'bargain', 'nddsdjdaxzmmeqk4');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('272', 'gift', 'nddsdjdaxzmmeqk4');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('273', 'miaosha', 'nddsdjdaxzmmeqk4');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('274', 'pintuan', 'nddsdjdaxzmmeqk4');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('275', 'shopping', 'nddsdjdaxzmmeqk4');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('276', 'community', 'nddsdjdaxzmmeqk4');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('277', 'ecard', 'nddsdjdaxzmmeqk4');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('278', 'flash_sale', 'nddsdjdaxzmmeqk4');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('279', 'pond', 'xwmgpax7jkzjrxha');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('280', 'bonus', 'xwmgpax7jkzjrxha');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('281', 'check_in', 'xwmgpax7jkzjrxha');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('282', 'fxhb', 'xwmgpax7jkzjrxha');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('283', 'lottery', 'xwmgpax7jkzjrxha');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('284', 'mch', 'xwmgpax7jkzjrxha');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('285', 'quick_share', 'xwmgpax7jkzjrxha');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('286', 'scratch', 'xwmgpax7jkzjrxha');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('287', 'step', 'xwmgpax7jkzjrxha');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('288', 'stock', 'xwmgpax7jkzjrxha');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('289', 'region', 'xwmgpax7jkzjrxha');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('290', 'integral_mall', '3wsern27hxspzytd');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('291', 'vip_card', '3wsern27hxspzytd');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('292', 'exchange', '3wsern27hxspzytd');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('293', 'assistant', 'kwfhnndnbakznksb');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('294', 'diy', 'kwfhnndnbakznksb');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('295', 'app_admin', 'kwfhnndnbakznksb');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('296', 'clerk', 'kwfhnndnbakznksb');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('297', 'dianqilai', 'kwfhnndnbakznksb');
INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES ('298', 'scan_code_pay', 'kwfhnndnbakznksb');


CREATE TABLE `zjhj_bd_wholesale_goods` (   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,   `goods_id` int(11) NOT NULL,   `mall_id` int(11) NOT NULL,   `type` tinyint(1) NOT NULL COMMENT '优惠方式，0折扣，1减钱\r\n',   `wholesale_rules` varchar(2048) NOT NULL DEFAULT '' COMMENT '批发规则',   `is_delete` tinyint(1) NOT NULL DEFAULT '0',   `rise_num` int(11) NOT NULL DEFAULT '0' COMMENT '0不设置',   `rules_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '规则开关，0关闭，1开启',   PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='批发商品';
CREATE TABLE `zjhj_bd_wholesale_order` (   `id` int(11) NOT NULL AUTO_INCREMENT,   `mall_id` int(11) NOT NULL DEFAULT '0',   `order_id` int(11) NOT NULL DEFAULT '0',   `discount` decimal(10,2) NOT NULL DEFAULT '0.00',   PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
ALTER TABLE `zjhj_bd_goods` ADD COLUMN `param_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数名称' AFTER `guarantee_pic`, ADD COLUMN `param_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数内容' AFTER `param_name`;
ALTER TABLE `zjhj_bd_coupon` ADD COLUMN `use_obtain` tinyint(1) NOT NULL DEFAULT 0 COMMENT '领取后赠送' AFTER `app_share_pic`;
ALTER TABLE `zjhj_bd_coupon_mall_relation` ADD COLUMN `order_id` int(11) NOT NULL COMMENT '订单id' AFTER `is_delete`, ADD COLUMN `type` varchar(20) NOT NULL COMMENT ' use优惠券自动发放' AFTER `order_id`;
alter table zjhj_bd_store add `extra_attributes` text not null;

CREATE TABLE `zjhj_bd_wxapp_platform` (   `id` int(11) NOT NULL AUTO_INCREMENT,   `appid` varchar(128) NOT NULL COMMENT '第三方平台应用appid',   `appsecret` varchar(255) NOT NULL COMMENT '第三方平台应用appsecret',   `token` varchar(255) NOT NULL COMMENT '第三方平台应用token（消息校验Token）',   `encoding_aes_key` varchar(512) NOT NULL COMMENT '第三方平台应用Key（消息加解密Key）',   `component_access_token` varchar(255) NOT NULL DEFAULT '',   `token_expires` int(11) NOT NULL DEFAULT '0' COMMENT 'token过期时间',   `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '授权类型\r\n1：公众号\r\n2：小程序\r\n3：公众号/小程序同时展现\r\n',   `third_appid` varchar(128) NOT NULL COMMENT '第三方平台绑定的应用appid',   `domain` longtext NOT NULL COMMENT '域名',   `created_at` timestamp NOT NULL,   `updated_at` timestamp NOT NULL,   PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
CREATE TABLE `zjhj_bd_wxapp_wxminiprogram_audit` (   `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',   `appid` varchar(45) NOT NULL DEFAULT '' COMMENT '小程序appid',   `auditid` varchar(45) NOT NULL DEFAULT '' COMMENT '审核编号',   `version` varchar(45) NOT NULL DEFAULT '',   `template_id` int(11) NOT NULL COMMENT '模板id',   `status` tinyint(1) unsigned NOT NULL DEFAULT '3' COMMENT '审核状态，其中0为审核成功，1为审核失败，2为审核中，3已提交审核, 4已发布',   `reason` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '当status=1，审核被拒绝时，返回的拒绝原因',   `created_at` timestamp NOT NULL COMMENT '提交审核时间',   `release_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',   `is_delete` tinyint(4) NOT NULL DEFAULT '0',   PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='微信小程序提交审核的小程序';
CREATE TABLE `zjhj_bd_wxapp_wxminiprograms` (   `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',   `mall_id` int(11) NOT NULL COMMENT '商城id',   `nick_name` varchar(45) NOT NULL DEFAULT '' COMMENT '微信小程序名称',   `token` varchar(45) NOT NULL DEFAULT '' COMMENT '平台生成的token值',   `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '微信小程序头像',   `verify_type_info` tinyint(1) NOT NULL DEFAULT '0' COMMENT '授权方认证类型，-1代表未认证，0代表微信认证',   `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示，0显示，1隐藏',   `user_name` varchar(45) NOT NULL DEFAULT '' COMMENT '原始ID',   `qrcode_url` varchar(2048) NOT NULL DEFAULT '' COMMENT '二维码图片的URL',   `business_info` varchar(2048) NOT NULL DEFAULT '' COMMENT 'json格式。用以了解以下功能的开通状况（0代表未开通，1代表已开通）： open_store:是否开通微信门店功能 open_scan:是否开通微信扫商品功能 open_pay:是否开通微信支付功能 open_card:是否开通微信卡券功能 open_shake:是否开通微信摇一摇功能',   `idc` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'idc',   `principal_name` varchar(45) NOT NULL DEFAULT '' COMMENT '小程序的主体名称',   `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '帐号介绍',   `miniprograminfo` varchar(255) NOT NULL DEFAULT '' COMMENT 'json格式。判断是否为小程序类型授权，包含network小程序已设置的各个服务器域名',   `func_info` longtext COMMENT 'json格式。权限集列表，ID为17到19时分别代表： 17.帐号管理权限 18.开发管理权限 19.客服消息管理权限 请注意： 1）该字段的返回不会考虑小程序是否具备该权限集的权限（因为可能部分具备）。',   `authorizer_appid` varchar(45) NOT NULL DEFAULT '' COMMENT '小程序appid',   `authorizer_access_token` varchar(255) NOT NULL DEFAULT '' COMMENT '授权方接口调用凭据（在授权的公众号或小程序具备API权限时，才有此返回值），也简称为令牌',   `authorizer_expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'refresh有效期',   `authorizer_refresh_token` varchar(255) NOT NULL DEFAULT '' COMMENT '接口调用凭据刷新令牌',   `created_at` timestamp NOT NULL COMMENT '授权时间',   `updated_at` timestamp NOT NULL,   `deleted_at` timestamp NOT NULL,   `is_delete` tinyint(1) NOT NULL DEFAULT '0',   PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='微信小程序授权列表';
ALTER TABLE `zjhj_bd_wxapp_config` MODIFY COLUMN `appid`  varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' AFTER `mall_id`, MODIFY COLUMN `appsecret`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' AFTER `appid`;
ALTER TABLE `zjhj_bd_wxapp_wxminiprograms` ADD COLUMN `domain`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务域名' AFTER `authorizer_refresh_token`;  




truncate table zjhj_bd_core_plugin;
INSERT INTO `zjhj_bd_core_plugin` VALUES (1, 'wxapp', '微信小程序', '1.0.31', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/d52a90d4eb06059d9fdb0641592400b3.png', '在微信小程序中经营你的店铺', 1);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (2, 'diy', 'DIY装修', '1.0.104', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/4903220b146520fd91533ed140d2542f.png', 'DIY店铺风格和元素，千人千面', 2);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (3, 'advance', '商品预售', '1.0.57', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/888a3c5dbc7881c74e2ae4299c4e6e2c.png', '提前交付定金，尾款享受优惠', 1);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (4, 'composition', '套餐组合', '1.0.15', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/753525bea4854dae63ce83f575fa3a10.png', '套餐组合', 2);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (5, 'aliapp', '支付宝小程序', '1.0.135', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/e1f631677b48470eeb0c50f811165472.png', '在支付宝小程序中经营你的店铺', 2);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (6, 'app_admin', '手机端管理', '1.0.7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/e3e79ca9b97dba95ae79b9ac1bed16f9.png', '手机端操作管理店铺', 3);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (7, 'assistant', '采集助手', '1.0.5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/8064507d4b463ae2be31dd86ccc4bd8d.png', '采集助手', 1);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (8, 'bargain', '砍价', '1.0.61', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/10da8fa3ab90d190fb6c8dcb1fa0ac24.png', '邀请好友砍价后低价购买', 5);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (9, 'bdapp', '百度小程序', '1.0.133', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/c606e51d6c842f68b768c6780f6dbc87.png', '在百度小程序中经营你的店铺', 4);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (10, 'bonus', '团队分红', '1.0.39', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/6831954dc342f2ba066621409fe1e60d.png', '队长获得队员订单分红', 2);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (11, 'booking', '预约', '1.0.69', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/07c662e46ade264338df7544c5f5057f.png', '提前线下消费或服务', 4);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (12, 'check_in', '签到插件', '1.0.26', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/9f8feafc5d1619c3d897e56ba2fd4147.png', '促进店铺访问量和用户活跃度', 3);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (13, 'clerk', '核销员', '1.0.12', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/2743ec86b035db21eaa5e3019e33c714.png', '手机端扫码核销，查询订单', 4);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (14, 'dianqilai', '客服系统', '1.0.7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/9a1ae4508528799d9ca5543a857b3237.png', '促进商家和买家之间的高效交流', 5);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (15, 'ecard', '电子卡密', '1.0.7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/ea1a03f8a27561ea18ec1312b102c3e3.png', '电子卡密', 10);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (16, 'fxhb', '裂变拆“红包”', '1.0.33', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/9a7e9bb462ece248a6da22d7a2a39b84.png', '裂变式邀请好友拆“红包”', 4);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (17, 'gift', '社交送礼', '1.0.35', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/e88d4dd935389049bdeda86856b59ed3.png', '购买礼品送给朋友', 6);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (18, 'integral_mall', '积分商城', '1.0.61', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/4677340a313d1d6a417492dd3b615540.png', '使用积分或积分+现金兑换商品', 1);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (19, 'lottery', '幸运抽奖', '1.0.61', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/0bde7f03396f64b1a6a602ffdc384fe8.png', '裂变玩法，抽取幸运客户赠送奖品', 5);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (20, 'mch', '多商户', '1.0.72', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/e518720e0d614439e51b49735fe1f842.png', '获取入驻商流量，自营+商户入驻', 6);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (21, 'miaosha', '整点秒杀', '1.0.62', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/7ec0386824388b8ce18040857058827d.png', '引导客户快速抢购', 7);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (22, 'pick', 'N元任选', '1.0.28', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/a4f3d48897eb696fd936816f33a2da70.png', 'N元任选', 3);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (23, 'pintuan', '拼团', '1.0.102', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/1ad43702df97bdea25452f00b3b49f5e.png', '引导客户邀请朋友一起拼团购买', 8);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (24, 'pond', '九宫格', '1.0.44', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/4b9e58ea9aa6f60e08b5aaef20426ac9.png', '抽积分、优惠券、实物等', 1);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (25, 'quick_share', '一键发圈', '1.0.15', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/7e2836a9861b31de1eb548f067bb2fde.png', '一键保存文案和图片，高效发朋友圈', 7);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (26, 'scan_code_pay', '当面付', '1.0.31', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/0680c8f2ef2632d373750bd8addcfe8b.png', '线下场景扫码当面支付', 6);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (27, 'scratch', '刮刮卡', '1.0.42', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/28fd30646970fe742350d47c3494aee4.png', '刮开卡片参与抽奖', 8);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (28, 'shopping', '好物圈', '1.0.9', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/994df3a6c8dc456d4a3a3614b4deaec4.png', '向微信好友推荐好商品', 9);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (29, 'step', '步数宝', '1.0.69', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/7e2e64e891d444d5c31824fee9f8fb88.png', '步数兑换商品', 9);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (30, 'stock', '股东分红', '1.0.20', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/8174c99e859fd446abd47b877fd41a45.png', '股东分红', 10);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (31, 'ttapp', '抖音/头条小程序', '1.0.135', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/0192ac346351c5fbdc2ea1c953d097f2.png', '在抖音/头条小程序中经营你的店铺', 3);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (32, 'vip_card', '超级会员卡', '1.0.51', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/9c719748ee725092f09fdc5ee18538f2.png', '享受超级会员折扣和福利', 2);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (33, 'region', '区域代理', '1.0.9', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/1a698f7c1b6c64b57f878d735734858b.png', '区域代理', 11);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (34, 'flash_sale', '限时抢购', '1.0.12', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/0c4882580c64ac1c5a239b653b2e429f.png', '限时抢购', 11);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (35, 'community', '社区团购', '1.0.23', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/8fec059e37dbf85adb01bd1d7f904d1e.png', '团长群内推广，本地社区自提', 100);
        INSERT INTO `zjhj_bd_core_plugin` VALUES (36, 'exchange', '兑换中心', '1.0.7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/e7116ea1eee1ae77747cca91cc9f7fed.png', '提货卡、礼品卡、送礼神器', 100);
		INSERT INTO `zjhj_bd_core_plugin` VALUES (37, 'wholesale', '商品批发', '1.0.1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://auth-zjhejiang-com.oss-cn-hangzhou.aliyuncs.com/uploads/versions/a646bebae632d967be78ee275e9921a5.png', '商品批发', 100);
 truncate table zjhj_bd_plugin_cat;
        INSERT INTO `zjhj_bd_plugin_cat` VALUES ('1', 'xb4z5hqs6388pd5c', '销售渠道', '#3399FF', '100', null, '0', null, null);
        INSERT INTO `zjhj_bd_plugin_cat` VALUES ('2', 'nddsdjdaxzmmeqk4', '促销玩法', '#FAA322', '100', null, '0', null, null);
        INSERT INTO `zjhj_bd_plugin_cat` VALUES ('3', 'xwmgpax7jkzjrxha', '获客工具', '#0DBCD7', '100', null, '0', null, null);
        INSERT INTO `zjhj_bd_plugin_cat` VALUES ('4', '3wsern27hxspzytd', '客户维护', '#E84C52', '100', null, '0', null, null);
        INSERT INTO `zjhj_bd_plugin_cat` VALUES ('5', 'kwfhnndnbakznksb', '常用工具', '#7181D9', '100', null, '0', null, null);   
truncate table zjhj_bd_plugin_cat_rel;               
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (1, 'wxapp', 'xb4z5hqs6388pd5c');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (2, 'aliapp', 'xb4z5hqs6388pd5c');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (3, 'ttapp', 'xb4z5hqs6388pd5c');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (4, 'bdapp', 'xb4z5hqs6388pd5c');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (5, 'advance', 'nddsdjdaxzmmeqk4');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (6, 'composition', 'nddsdjdaxzmmeqk4');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (7, 'pick', 'nddsdjdaxzmmeqk4');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (8, 'booking', 'nddsdjdaxzmmeqk4');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (9, 'bargain', 'nddsdjdaxzmmeqk4');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (10, 'gift', 'nddsdjdaxzmmeqk4');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (11, 'miaosha', 'nddsdjdaxzmmeqk4');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (12, 'pintuan', 'nddsdjdaxzmmeqk4');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (13, 'shopping', 'nddsdjdaxzmmeqk4');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (14, 'ecard', 'nddsdjdaxzmmeqk4');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (15, 'flash_sale', 'nddsdjdaxzmmeqk4');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (16, 'pond', 'xwmgpax7jkzjrxha');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (17, 'bonus', 'xwmgpax7jkzjrxha');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (18, 'check_in', 'xwmgpax7jkzjrxha');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (19, 'fxhb', 'xwmgpax7jkzjrxha');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (20, 'lottery', 'xwmgpax7jkzjrxha');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (21, 'mch', 'xwmgpax7jkzjrxha');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (22, 'quick_share', 'xwmgpax7jkzjrxha');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (23, 'scratch', 'xwmgpax7jkzjrxha');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (24, 'step', 'xwmgpax7jkzjrxha');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (25, 'stock', 'xwmgpax7jkzjrxha');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (26, 'region', 'xwmgpax7jkzjrxha');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (27, 'integral_mall', '3wsern27hxspzytd');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (28, 'vip_card', '3wsern27hxspzytd');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (29, 'assistant', 'kwfhnndnbakznksb');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (30, 'diy', 'kwfhnndnbakznksb');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (31, 'app_admin', 'kwfhnndnbakznksb');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (32, 'clerk', 'kwfhnndnbakznksb');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (33, 'dianqilai', 'kwfhnndnbakznksb');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (34, 'scan_code_pay', 'kwfhnndnbakznksb');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (35, 'community', 'nddsdjdaxzmmeqk4');
        INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (36, 'exchange', 'nddsdjdaxzmmeqk4');
		INSERT INTO `zjhj_bd_plugin_cat_rel` VALUES (37, 'wholesale', 'nddsdjdaxzmmeqk4');
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
