DROP DATABASE IF EXISTS `hospital_mediation`;

CREATE DATABASE IF NOT EXISTS `hospital_mediation`;

use `hospital_mediation`;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_id`	varchar(13) primary key,
	`me_ms_state` VARCHAR(20) NOT NULL default '이용중',
    `me_hs_num`	int NULL,
	`me_pw`	varchar(255) NOT NULL,
	`me_name`	varchar(20)	NOT NULL,
	`me_gender`	varchar(3)	NOT NULL,
	`me_phone`	varchar(11)	NOT NULL,
	`me_email`	varchar(50)	NOT NULL,
	`me_authority`	varchar(10)	not null default 'USER',
    `me_fail` int not null default 0,
	`me_report_count` int not null default 0,
    `me_stop` datetime NULL,
	`me_stop_count`	int	not NULL default 0,
    `me_la_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
	`po_num`	int	 primary key auto_increment,
	`po_title`	varchar(30) NOT	NULL,
	`po_report_count` int not null default 0, 
    `po_view` INT NULL DEFAULT '0',
	`po_date` DATETIME not null,
	`po_content`	TEXT NOT NULL,
	`po_bo_num`	int	NOT NULL,
	`po_mg_num`	int	NOT NULL,
    `po_co_count` INT NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
	`co_num`	int	primary key auto_increment,
	`co_content`	TEXT NOT NULL,
	`co_date` DATETIME not null,
	`co_report_count` int not null default 0,
	`co_po_num`	int	NOT NULL,
	`co_mg_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
	`bo_num`	int	primary key auto_increment,
	`bo_title`	VARCHAR (15) NOT NULL
);

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
	`rv_num`	int	primary key auto_increment,
	`rv_me_id`	varchar(13)	NOT NULL,
	`rv_rvs_name`	varchar(10)	NOT NULL,
	`rv_rs_num`	int	NOT NULL,
    `rv_date`	datetime default CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `bookmark`;

CREATE TABLE `bookmark` (
	`bmk_num`	int	primary key auto_increment,
	`bmk_ho_id`	varchar(13)	NOT NULL,
    `bmk_me_id`	varchar(13)	NOT NULL

);

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
	`pm_num`	varchar(255) primary key,
	`pm_price`	int	NOT NULL,
	`pm_type`	VARCHAR(20)	NOT NULL,
	`pm_ps_name`	VARCHAR(20)	NOT NULL,
	`pm_rv_num`	int	NOT NULL,
    `pm_ho_id`	varchar(13)	NOT NULL
);

DROP TABLE IF EXISTS `recommend`;

CREATE TABLE `recommend` (
	`re_num`	int	primary key auto_increment,
	`re_state`	int NULL default 0,
	`re_po_num`	int	NOT NULL,
	`re_mg_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
	`rp_num`	int	primary key auto_increment,
	`rp_target`	int	NOT NULL,
    `rp_table` varchar(50) not null, 
	`rp_name`	varchar(20) NOT	NULL,
	`rp_rs_name`	varchar(20)	NULL,
	`rp_site_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `reservation_state`;

CREATE TABLE `reservation_state` (
	`rvs_name`	varchar(10)	primary key
);

DROP TABLE IF EXISTS `payment_state`;

CREATE TABLE `payment_state` (
	`ps_name`	VARCHAR(20)	primary key
);

DROP TABLE IF EXISTS `report_state`;

CREATE TABLE `report_state` (
	`rs_name`	varchar(20)	primary key
);

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
	`fi_num`	int primary key auto_increment,
	`fi_name`	VARCHAR(255) NOT NULL,
	`fi_ori_name`	VARCHAR(255) NOT NULL,
	`fi_po_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `member_state`;

CREATE TABLE `member_state` (
	`ms_state`	VARCHAR(20) primary key
);

DROP TABLE IF EXISTS `hospital`;

CREATE TABLE `hospital` (
	`ho_id`	varchar(13)	primary key,
	`ho_ms_state`	VARCHAR(20)	NOT NULL,
	`ho_hs_num`	int	NOT NULL,
	`ho_pw`	varchar(255) NOT NULL,
	`ho_name`	varchar(50)	NOT NULL,
	`ho_ceo`	varchar(5)	NOT NULL,
	`ho_num`	char(10) NOT NULL,
	`ho_address`	varchar(100) NOT NULL,
	`ho_phone`	char(11) NOT NULL,
	`ho_authority`	varchar(10) NOT NULL,
    `ho_fail` int not null default 0,
    `ho_email` varchar(100) not null,
    `ho_report_count` int not null default 0,
    `ho_stop` datetime null,
    `ho_stop_count`	int	not NULL default 0,
    `ho_la_num`	int	NOT NULL
);


DROP TABLE IF EXISTS `site_management`;

CREATE TABLE `site_management` (
	`site_num`	int	primary key auto_increment,
	`site_la_num`	int	not NULL,
	`site_id`	varchar(13) NOT	NULL,
	`site_phone`	varchar(11) NOT	NULL,
	`site_email`	varchar(100) NOT NULL,
	`site_authority`	varchar(10)	NOT NULL default 'USER',
    `site_cookie` varchar(255),
    `site_cookie_limit` datetime
);

DROP TABLE IF EXISTS `chat_room`;

CREATE TABLE `chat_room` (
	`cr_num`	int primary key auto_increment,
	`cr_ho_id`	varchar(13)	NOT NULL,
	`cr_me_id`	varchar(13)	NOT NULL
);

DROP TABLE IF EXISTS `eup_myeon_dong`;

CREATE TABLE `eup_myeon_dong` (
	`emd_num`	int	primary key auto_increment,
	`emd_name`	varchar(255) NOT NULL,
	`emd_sgg_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `si_goon_gu`;

CREATE TABLE `si_goon_gu` (
	`sgg_num`	int	primary key auto_increment,
	`sgg_name`	varchar(255) NOT NULL,
	`sgg_sd_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `land`;

CREATE TABLE `land` (
	`la_num`	int	primary key auto_increment,
    `la_sd_num`	int	NOT NULL,
	`la_sgg_num`	int	NOT NULL,
	`la_emd_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `si_do`;

CREATE TABLE `si_do` (
	`sd_num`	int	primary key auto_increment,
	`sd_name`	varchar(255) NOT NULL
);

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
	`ct_num`	int	primary key auto_increment,
	`ct_site_num`	int	NOT NULL,
	`ct_cr_num`	int	NOT NULL,
	`ct_content`	text NOT NULL,
	`ct_date`	datetime NOT NULL
);

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
	`it_num`	int	primary key auto_increment,
	`it_name`	varchar(100)	NULL,
	`it_explanation`	text	NULL,
	`it_ho_id`	varchar(13)	NOT NULL,
    `it_hsl_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `hospital_program`;

CREATE TABLE `hospital_program` (
	`hp_num`	int	primary key auto_increment,
	`hp_title`	varchar(100) NOT NULL,
	`hp_payment`	int	NOT NULL,
	`hp_ho_id`	varchar(13)	NOT NULL,
    `hp_hsl_num` int	NOT NULL
);

DROP TABLE IF EXISTS `item_list`;

CREATE TABLE `item_list` (
	`il_num`	int	primary key auto_increment,
	`il_hp_num`	int	NOT NULL,
	`il_it_num`	int	NOT NULL
);



DROP TABLE IF EXISTS `reservation_schedule`;

CREATE TABLE `reservation_schedule` (
	`rs_num`	int	primary key auto_increment,
	`rs_hp_num`	int	NOT NULL,
	`rs_date`	date NOT NULL,
	`rs_time`	time NOT NULL,
	`rs_max_person`	int	NOT NULL default 0
);

DROP TABLE IF EXISTS `hospital_subject`;

CREATE TABLE `hospital_subject` (
	`hs_num`	int	primary key auto_increment,
	`hs_title`	varchar(100) NOT NULL
);

DROP TABLE IF EXISTS `hs_list`;

CREATE TABLE `hs_list` (
	`hsl_num`	int	primary key auto_increment,
	`hsl_hs_num`	int	NOT NULL,
	`hsl_ho_id`	varchar(13)	NOT NULL
);

DROP TABLE IF EXISTS `hospital_detail`;

CREATE TABLE `hospital_detail` (
	`hd_num`	int	primary key auto_increment,
	`hd_ho_id`	varchar(13)	NOT NULL,
	`hd_info`	text NULL,
	`hd_time`	text NULL,
	`hd_park`	text NULL,
	`hd_announce`	text NULL,
	`hd_etc`	text NULL,
	`hd_subject_detail`	text NULL
);

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
	`vw_num`	int	primary key auto_increment,
	`vw_hd_num`	int	NOT NULL,
	`vw_me_id`	varchar(13)	NOT NULL,
	`vw_content`	text	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `FK_member_state_TO_member_1` FOREIGN KEY (
	`me_ms_state`
)
REFERENCES `member_state` (
	`ms_state`
);

ALTER TABLE `post` ADD CONSTRAINT `FK_board_TO_post_1` FOREIGN KEY (
	`po_bo_num`
)
REFERENCES `board` (
	`bo_num`
);

ALTER TABLE `post` ADD CONSTRAINT `FK_site_management_TO_post_1` FOREIGN KEY (
	`po_mg_num`
)
REFERENCES `site_management` (
	`site_num`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_post_TO_comment_1` FOREIGN KEY (
	`co_po_num`
)
REFERENCES `post` (
	`po_num`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_site_management_TO_comment_1` FOREIGN KEY (
	`co_mg_num`
)
REFERENCES `site_management` (
	`site_num`
);

ALTER TABLE `reservation` ADD CONSTRAINT `FK_member_TO_reservation_1` FOREIGN KEY (
	`rv_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `reservation` ADD CONSTRAINT `FK_reservation_state_TO_reservation_1` FOREIGN KEY (
	`rv_rvs_name`
)
REFERENCES `reservation_state` (
	`rvs_name`
);

ALTER TABLE `reservation` ADD CONSTRAINT `FK_reservation_schedule_TO_reservation_1` FOREIGN KEY (
	`rv_rs_num`
)
REFERENCES `reservation_schedule` (
	`rs_num`
);

ALTER TABLE `bookmark` ADD CONSTRAINT `FK_hospital_TO_bookmark_1` FOREIGN KEY (
	`bmk_ho_id`
)
REFERENCES `hospital` (
	`ho_id`
);

ALTER TABLE `payment` ADD CONSTRAINT `FK_payment_state_TO_payment_1` FOREIGN KEY (
	`pm_ps_name`
)
REFERENCES `payment_state` (
	`ps_name`
);

ALTER TABLE `payment` ADD CONSTRAINT `FK_reservation_TO_payment_1` FOREIGN KEY (
	`pm_rv_num`
)
REFERENCES `reservation` (
	`rv_num`
);

ALTER TABLE `recommend` ADD CONSTRAINT `FK_post_TO_recommend_1` FOREIGN KEY (
	`re_po_num`
)
REFERENCES `post` (
	`po_num`
);

ALTER TABLE `recommend` ADD CONSTRAINT `FK_site_management_TO_recommend_1` FOREIGN KEY (
	`re_mg_num`
)
REFERENCES `site_management` (
	`site_num`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_report_state_TO_report_1` FOREIGN KEY (
	`rp_rs_name`
)
REFERENCES `report_state` (
	`rs_name`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_site_management_TO_report_1` FOREIGN KEY (
	`rp_site_num`
)
REFERENCES `site_management` (
	`site_num`
);

ALTER TABLE `file` ADD CONSTRAINT `FK_post_TO_file_1` FOREIGN KEY (
	`fi_po_num`
)
REFERENCES `post` (
	`po_num`
);

ALTER TABLE `hospital` ADD CONSTRAINT `FK_member_state_TO_hospital_1` FOREIGN KEY (
	`ho_ms_state`
)
REFERENCES `member_state` (
	`ms_state`
);

ALTER TABLE `hospital` ADD CONSTRAINT `FK_hospital_subject_TO_hospital_1` FOREIGN KEY (
	`ho_hs_num`
)
REFERENCES `hospital_subject` (
	`hs_num`
);

ALTER TABLE `item` ADD CONSTRAINT `FK_hs_list_TO_item_1` FOREIGN KEY (
	`it_hsl_num`
)
REFERENCES `hs_list` (
	`hsl_num`
);

ALTER TABLE `hospital_program` ADD CONSTRAINT `FK_hs_list_TO_hospital_program_1` FOREIGN KEY (
	`hp_hsl_num`
)
REFERENCES `hs_list` (
	`hsl_num`
);

ALTER TABLE `site_management` ADD CONSTRAINT `FK_land_TO_site_management_1` FOREIGN KEY (
	`site_la_num`
)
REFERENCES `land` (
	`la_num`
);

ALTER TABLE `chat_room` ADD CONSTRAINT `FK_hospital_TO_chat_room_1` FOREIGN KEY (
	`cr_ho_id`
)
REFERENCES `hospital` (
	`ho_id`
);

ALTER TABLE `chat_room` ADD CONSTRAINT `FK_member_TO_chat_room_1` FOREIGN KEY (
	`cr_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `eup_myeon_dong` ADD CONSTRAINT `FK_si_goon_gu_TO_eup_myeon_dong_1` FOREIGN KEY (
	`emd_sgg_num`
)
REFERENCES `si_goon_gu` (
	`sgg_num`
);

ALTER TABLE `si_goon_gu` ADD CONSTRAINT `FK_si_do_TO_si_goon_gu_1` FOREIGN KEY (
	`sgg_sd_num`
)
REFERENCES `si_do` (
	`sd_num`
);

ALTER TABLE `land` ADD CONSTRAINT `FK_eup_myeon_dong_TO_land_1` FOREIGN KEY (
	`la_emd_num`
)
REFERENCES `eup_myeon_dong` (
	`emd_num`
);

ALTER TABLE `chat` ADD CONSTRAINT `FK_site_management_TO_chat_1` FOREIGN KEY (
	`ct_site_num`
)
REFERENCES `site_management` (
	`site_num`
);

ALTER TABLE `chat` ADD CONSTRAINT `FK_chat_room_TO_chat_1` FOREIGN KEY (
	`ct_cr_num`
)
REFERENCES `chat_room` (
	`cr_num`
);

ALTER TABLE `hospital_program` ADD CONSTRAINT `FK_hospital_TO_hospital_program_1` FOREIGN KEY (
	`hp_ho_id`
)
REFERENCES `hospital` (
	`ho_id`
);

ALTER TABLE `item_list` ADD CONSTRAINT `FK_hospital_program_TO_item_list_1` FOREIGN KEY (
	`il_hp_num`
)
REFERENCES `hospital_program` (
	`hp_num`
);

ALTER TABLE `item_list` ADD CONSTRAINT `FK_item_TO_item_list_1` FOREIGN KEY (
	`il_it_num`
)
REFERENCES `item` (
	`it_num`
);

ALTER TABLE `reservation_schedule` ADD CONSTRAINT `FK_hospital_program_TO_reservation_schedule_1` FOREIGN KEY (
	`rs_hp_num`
)
REFERENCES `hospital_program` (
	`hp_num`
);

ALTER TABLE `member` ADD CONSTRAINT `FK_hospital_subject_TO_member_1` FOREIGN KEY (
	`me_hs_num`
)
REFERENCES `hospital_subject` (
	`hs_num`
);

ALTER TABLE `hospital_detail` ADD CONSTRAINT `FK_hospital_TO_hospital_detail_1` FOREIGN KEY (
	`hd_ho_id`
)
REFERENCES `hospital` (
	`ho_id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_hospital_detail_TO_review_1` FOREIGN KEY (
	`vw_hd_num`
)
REFERENCES `hospital_detail` (
	`hd_num`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_member_TO_review_1` FOREIGN KEY (
	`vw_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `member` ADD CONSTRAINT `FK_land_TO_member_1` FOREIGN KEY (
	`me_la_num`
)
REFERENCES `land` (
	`la_num`
);

ALTER TABLE `hospital` ADD CONSTRAINT `FK_land_TO_hospital_1` FOREIGN KEY (
	`ho_la_num`
)
REFERENCES `land` (
	`la_num`
);

ALTER TABLE `land` ADD CONSTRAINT `FK_si_do_TO_land_1` FOREIGN KEY (
	`la_sd_num`
)
REFERENCES `si_do` (
	`sd_num`
);

ALTER TABLE `land` ADD CONSTRAINT `FK_si_goon_gu_TO_land_1` FOREIGN KEY (
	`la_sgg_num`
)
REFERENCES `si_goon_gu` (
	`sgg_num`
);

ALTER TABLE `bookmark` ADD CONSTRAINT `FK_member_TO_bookmark_1` FOREIGN KEY (
	`bmk_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `hs_list` ADD CONSTRAINT `FK_hospital_subject_TO_hs_list_1` FOREIGN KEY (
	`hsl_hs_num`
)
REFERENCES `hospital_subject` (
	`hs_num`
);

ALTER TABLE `hs_list` ADD CONSTRAINT `FK_hospital_TO_hs_list_1` FOREIGN KEY (
	`hsl_ho_id`
)
REFERENCES `hospital` (
	`ho_id`
);

ALTER TABLE `payment` ADD CONSTRAINT `FK_hospital_TO_payment_1` FOREIGN KEY (
	`pm_ho_id`
)
REFERENCES `hospital` (
	`ho_id`
);

#파일 null 체크
ALTER TABLE `hospital_mediation`.`file` 
CHANGE COLUMN `fi_name` `fi_name` VARCHAR(255) NULL ,
CHANGE COLUMN `fi_ori_name` `fi_ori_name` VARCHAR(255) NULL ,
CHANGE COLUMN `fi_po_num` `fi_po_num` INT NULL ;

#북마크 cascade
ALTER TABLE `hospital_mediation`.`bookmark` 
DROP FOREIGN KEY `FK_hospital_TO_bookmark_1`;
ALTER TABLE `hospital_mediation`.`bookmark` 
ADD CONSTRAINT `FK_hospital_TO_bookmark_1`
  FOREIGN KEY (`bmk_ho_id`)
  REFERENCES `hospital_mediation`.`hospital` (`ho_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `hospital_mediation`.`bookmark` 
DROP FOREIGN KEY `FK_member_TO_bookmark_1`;
ALTER TABLE `hospital_mediation`.`bookmark` 
ADD CONSTRAINT `FK_member_TO_bookmark_1`
  FOREIGN KEY (`bmk_me_id`)
  REFERENCES `hospital_mediation`.`member` (`me_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#댓글 cascade
ALTER TABLE `hospital_mediation`.`comment` 
DROP FOREIGN KEY `FK_post_TO_comment_1`;
ALTER TABLE `hospital_mediation`.`comment` 
ADD CONSTRAINT `FK_post_TO_comment_1`
  FOREIGN KEY (`co_po_num`)
  REFERENCES `hospital_mediation`.`post` (`po_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `hospital_mediation`.`comment` 
DROP FOREIGN KEY `FK_site_management_TO_comment_1`;
ALTER TABLE `hospital_mediation`.`comment` 
ADD CONSTRAINT `FK_site_management_TO_comment_1`
  FOREIGN KEY (`co_mg_num`)
  REFERENCES `hospital_mediation`.`site_management` (`site_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#병원

ALTER TABLE `hospital_mediation`.`hospital` 
DROP FOREIGN KEY `FK_hospital_subject_TO_hospital_1`;
ALTER TABLE `hospital_mediation`.`hospital` 
ADD CONSTRAINT `FK_hospital_subject_TO_hospital_1`
  FOREIGN KEY (`ho_hs_num`)
  REFERENCES `hospital_mediation`.`hospital_subject` (`hs_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `hospital_mediation`.`hospital` 
DROP FOREIGN KEY `FK_land_TO_hospital_1`;
ALTER TABLE `hospital_mediation`.`hospital` 
ADD CONSTRAINT `FK_land_TO_hospital_1`
  FOREIGN KEY (`ho_la_num`)
  REFERENCES `hospital_mediation`.`land` (`la_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `hospital_mediation`.`hospital` 
DROP FOREIGN KEY `FK_member_state_TO_hospital_1`;
ALTER TABLE `hospital_mediation`.`hospital` 
ADD CONSTRAINT `FK_member_state_TO_hospital_1`
  FOREIGN KEY (`ho_ms_state`)
  REFERENCES `hospital_mediation`.`member_state` (`ms_state`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#상세

ALTER TABLE `hospital_mediation`.`hospital_detail` 
DROP FOREIGN KEY `FK_hospital_TO_hospital_detail_1`;
ALTER TABLE `hospital_mediation`.`hospital_detail` 
ADD CONSTRAINT `FK_hospital_TO_hospital_detail_1`
  FOREIGN KEY (`hd_ho_id`)
  REFERENCES `hospital_mediation`.`hospital` (`ho_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#프로그램

ALTER TABLE `hospital_mediation`.`hospital_program` 
DROP FOREIGN KEY `FK_hospital_TO_hospital_program_1`;
ALTER TABLE `hospital_mediation`.`hospital_program` 
ADD CONSTRAINT `FK_hospital_TO_hospital_program_1`
  FOREIGN KEY (`hp_ho_id`)
  REFERENCES `hospital_mediation`.`hospital` (`ho_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `hospital_mediation`.`hospital_program` 
DROP FOREIGN KEY `FK_hs_list_TO_hospital_program_1`;
ALTER TABLE `hospital_mediation`.`hospital_program` 
ADD CONSTRAINT `FK_hs_list_TO_hospital_program_1`
  FOREIGN KEY (`hp_hsl_num`)
  REFERENCES `hospital_mediation`.`hs_list` (`hsl_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#과목리스트

ALTER TABLE `hospital_mediation`.`hs_list` 
DROP FOREIGN KEY `FK_hospital_subject_TO_hs_list_1`,
DROP FOREIGN KEY `FK_hospital_TO_hs_list_1`;
ALTER TABLE `hospital_mediation`.`hs_list` 
ADD CONSTRAINT `FK_hospital_subject_TO_hs_list_1`
  FOREIGN KEY (`hsl_hs_num`)
  REFERENCES `hospital_mediation`.`hospital_subject` (`hs_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_hospital_TO_hs_list_1`
  FOREIGN KEY (`hsl_ho_id`)
  REFERENCES `hospital_mediation`.`hospital` (`ho_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#아이템
ALTER TABLE `hospital_mediation`.`item` 
DROP FOREIGN KEY `FK_hs_list_TO_item_1`;
ALTER TABLE `hospital_mediation`.`item` 
ADD CONSTRAINT `FK_hs_list_TO_item_1`
  FOREIGN KEY (`it_hsl_num`)
  REFERENCES `hospital_mediation`.`hs_list` (`hsl_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#아이템 리스트

ALTER TABLE `hospital_mediation`.`item_list` 
DROP FOREIGN KEY `FK_hospital_program_TO_item_list_1`,
DROP FOREIGN KEY `FK_item_TO_item_list_1`;
ALTER TABLE `hospital_mediation`.`item_list` 
ADD CONSTRAINT `FK_hospital_program_TO_item_list_1`
  FOREIGN KEY (`il_hp_num`)
  REFERENCES `hospital_mediation`.`hospital_program` (`hp_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_item_TO_item_list_1`
  FOREIGN KEY (`il_it_num`)
  REFERENCES `hospital_mediation`.`item` (`it_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#멤버

ALTER TABLE `hospital_mediation`.`member` 
DROP FOREIGN KEY `FK_hospital_subject_TO_member_1`,
DROP FOREIGN KEY `FK_land_TO_member_1`,
DROP FOREIGN KEY `FK_member_state_TO_member_1`;
ALTER TABLE `hospital_mediation`.`member` 
ADD CONSTRAINT `FK_hospital_subject_TO_member_1`
  FOREIGN KEY (`me_hs_num`)
  REFERENCES `hospital_mediation`.`hospital_subject` (`hs_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_land_TO_member_1`
  FOREIGN KEY (`me_la_num`)
  REFERENCES `hospital_mediation`.`land` (`la_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_member_state_TO_member_1`
  FOREIGN KEY (`me_ms_state`)
  REFERENCES `hospital_mediation`.`member_state` (`ms_state`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#페이먼트

ALTER TABLE `hospital_mediation`.`payment` 
DROP FOREIGN KEY `FK_payment_state_TO_payment_1`,
DROP FOREIGN KEY `FK_reservation_TO_payment_1`;
ALTER TABLE `hospital_mediation`.`payment` 
ADD CONSTRAINT `FK_payment_state_TO_payment_1`
  FOREIGN KEY (`pm_ps_name`)
  REFERENCES `hospital_mediation`.`payment_state` (`ps_name`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_reservation_TO_payment_1`
  FOREIGN KEY (`pm_rv_num`)
  REFERENCES `hospital_mediation`.`reservation` (`rv_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#포스트
ALTER TABLE `hospital_mediation`.`post` 
DROP FOREIGN KEY `FK_board_TO_post_1`,
DROP FOREIGN KEY `FK_site_management_TO_post_1`;
ALTER TABLE `hospital_mediation`.`post` 
ADD CONSTRAINT `FK_board_TO_post_1`
  FOREIGN KEY (`po_bo_num`)
  REFERENCES `hospital_mediation`.`board` (`bo_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_site_management_TO_post_1`
  FOREIGN KEY (`po_mg_num`)
  REFERENCES `hospital_mediation`.`site_management` (`site_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#리커맨드

ALTER TABLE `hospital_mediation`.`recommend` 
DROP FOREIGN KEY `FK_post_TO_recommend_1`,
DROP FOREIGN KEY `FK_site_management_TO_recommend_1`;
ALTER TABLE `hospital_mediation`.`recommend` 
ADD CONSTRAINT `FK_post_TO_recommend_1`
  FOREIGN KEY (`re_po_num`)
  REFERENCES `hospital_mediation`.`post` (`po_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_site_management_TO_recommend_1`
  FOREIGN KEY (`re_mg_num`)
  REFERENCES `hospital_mediation`.`site_management` (`site_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#리포트

ALTER TABLE `hospital_mediation`.`report` 
DROP FOREIGN KEY `FK_report_state_TO_report_1`,
DROP FOREIGN KEY `FK_site_management_TO_report_1`;
ALTER TABLE `hospital_mediation`.`report` 
ADD CONSTRAINT `FK_report_state_TO_report_1`
  FOREIGN KEY (`rp_rs_name`)
  REFERENCES `hospital_mediation`.`report_state` (`rs_name`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_site_management_TO_report_1`
  FOREIGN KEY (`rp_site_num`)
  REFERENCES `hospital_mediation`.`site_management` (`site_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#리저베이션

ALTER TABLE `hospital_mediation`.`reservation` 
DROP FOREIGN KEY `FK_member_TO_reservation_1`,
DROP FOREIGN KEY `FK_reservation_schedule_TO_reservation_1`,
DROP FOREIGN KEY `FK_reservation_state_TO_reservation_1`;
ALTER TABLE `hospital_mediation`.`reservation` 
ADD CONSTRAINT `FK_member_TO_reservation_1`
  FOREIGN KEY (`rv_me_id`)
  REFERENCES `hospital_mediation`.`member` (`me_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_reservation_schedule_TO_reservation_1`
  FOREIGN KEY (`rv_rs_num`)
  REFERENCES `hospital_mediation`.`reservation_schedule` (`rs_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_reservation_state_TO_reservation_1`
  FOREIGN KEY (`rv_rvs_name`)
  REFERENCES `hospital_mediation`.`reservation_state` (`rvs_name`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#리저베이션 스케쥴

ALTER TABLE `hospital_mediation`.`reservation_schedule` 
DROP FOREIGN KEY `FK_hospital_program_TO_reservation_schedule_1`;
ALTER TABLE `hospital_mediation`.`reservation_schedule` 
ADD CONSTRAINT `FK_hospital_program_TO_reservation_schedule_1`
  FOREIGN KEY (`rs_hp_num`)
  REFERENCES `hospital_mediation`.`hospital_program` (`hp_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#리뷰

ALTER TABLE `hospital_mediation`.`review` 
DROP FOREIGN KEY `FK_hospital_detail_TO_review_1`,
DROP FOREIGN KEY `FK_member_TO_review_1`;
ALTER TABLE `hospital_mediation`.`review` 
ADD CONSTRAINT `FK_hospital_detail_TO_review_1`
  FOREIGN KEY (`vw_hd_num`)
  REFERENCES `hospital_mediation`.`hospital_detail` (`hd_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_member_TO_review_1`
  FOREIGN KEY (`vw_me_id`)
  REFERENCES `hospital_mediation`.`member` (`me_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#사이트매니지먼트

ALTER TABLE `hospital_mediation`.`site_management` 
DROP FOREIGN KEY `FK_land_TO_site_management_1`;
ALTER TABLE `hospital_mediation`.`site_management` 
ADD CONSTRAINT `FK_land_TO_site_management_1`
  FOREIGN KEY (`site_la_num`)
  REFERENCES `hospital_mediation`.`land` (`la_num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;




 INSERT INTO MEMBER_STATE VALUES('승인대기'), ('이용중'), ('기간정지'), ('영구정지'), ('탈퇴'),('가입대기');
# 병원 과목
insert into hospital_subject(hs_title) 
values 
 ('가정의학과'),('내과'),('외과'),('이비인후과'), ('안과'), ('비뇨의학과'), ('피부과'),('산부인과'),('정형외과'),('성형외과'),('치과'), ('이비인후과'),('순환기내과'), 
 ('소화기내과'), ('혈액종양내과'), ('내분비대사내과'), ('알레르기내과'), ('신장내과'), ('감염내과'), ('류마티스내과'),  ('위장관외과'), ('대장항문외과'), 
 ('외상외과'),  ('건강증진센터'), ('마취통증학과'),('방사선종양학과'), ('병리과'),   ('신경과'), ('신경외과'), ('심장혈관흉부외과'), ('영상의학과'), 
 ('응급의학과'), ('재활의학과'), ('정신건강의학과'),  ('중환자의학과'), ('진단검사의학과'),('호흡기내과'), ('핵의학과');

insert into board(bo_title) values('공지');
# 지역 DB 넣은 후 실행
-- insert into land value(1,1,1,1);

# 신고 상태
insert into report_state values('1'),('3'),('7'),('15'),('30'),('60'),('180'),('365');

#예약상태 
insert into reservation_state values ("예약취소"),("예약완료");

#결제상태
INSERT INTO `hospital_mediation`.`payment_state` (`ps_name`) VALUES ('결제완료');
INSERT INTO `hospital_mediation`.`payment_state` (`ps_name`) VALUES ('결제취소');

# site_management 추가
-- insert into site_management value(1, 1, 'qqqq1111', "01011111111", "qqqq1111@naver.com", "USER");
select * from site_management;

# 신고 유형
#insert into report(rp_target, rp_name, rp_rs_name, rp_site_num) 
#values('qqqq1111', '스팸홍보','1', 3),('qqqq1111', '도배','1', 3), ('qqqq1111', '음란물','3', 3), ('qqqq1111', '불법정보를 포함','1', 3), ('qwer1234', '청소년에게 유해한 내용','1', 3), ('qwer1234', '욕설/혐오/차별 표현','1', 3), ('qwer1234', '개인정보 유출','1', 3), ('qwer1234', '불법촬영물등 포함','1', 3), ('qwer1234', '명예훼손','1', 3), ('qwer1234', '저작권 침해','1', 3), ('qwer1234', '불쾌한 표현 있음','1', 3);

select * from member;
select * from hospital;
select * from site_management;
SELECT * FROM member JOIN site_management ON site_num = me_id WHERE site_id = 'wldyd1234' 