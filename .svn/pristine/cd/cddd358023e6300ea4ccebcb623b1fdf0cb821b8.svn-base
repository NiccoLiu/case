/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/12/15 15:48:06                          */
/*==============================================================*/


drop table if exists admin;

drop table if exists "case";

drop table if exists case_log;

drop table if exists case_new;

drop table if exists department;

drop table if exists disease;

drop table if exists doctor;

drop table if exists sufferer;

drop table if exists template;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   id                   varchar(64) not null,
   admin_name           varchar(64),
   admin_account        varchar(64),
   admin_pwd            varchar(64),
   primary key (id)
);

/*==============================================================*/
/* Table: "case"                                                */
/*==============================================================*/
create table "case"
(
   id                   varchar(64) not null,
   suf_id               varchar(64),
   doc_id               varchar(64),
   dep_id               varchar(64),
   tem_id               varchar(64),
   des_id               varchar(64),
   hos_no               varchar(64),
   hos_data             date,
   diagnose_sug         text,
   process              text,
   deal_sug             text,
   diagnose_result      text,
   create_time          datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: case_log                                              */
/*==============================================================*/
create table case_log
(
   id                   varchar(64) not null,
   case_id              varchar(64),
   log_case_id          varchar(64),
   log_remark           text,
   upate_time           datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: case_new                                              */
/*==============================================================*/
create table case_new
(
   id                   varchar(64) not null,
   case_id              char(10),
   suf_id               varchar(64),
   doc_id               varchar(64),
   dep_id               varchar(64),
   tem_id               varchar(64),
   des_id               varchar(64),
   hos_no               varchar(64),
   hos_data             date,
   diagnose_sug         text,
   process              text,
   deal_sug             text,
   diagnose_result      text,
   create_time          datetime,
   update_time          datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: department                                            */
/*==============================================================*/
create table department
(
   id                   varchar(64) not null,
   dep_name             varchar(64),
   dep_remark           varchar(512),
   primary key (id)
);

/*==============================================================*/
/* Table: disease                                               */
/*==============================================================*/
create table disease
(
   id                   varchar(64) not null,
   des_name             varchar(64),
   des_remark           text,
   primary key (id)
);

/*==============================================================*/
/* Table: doctor                                                */
/*==============================================================*/
create table doctor
(
   id                   varchar(64) not null,
   doc_name             varchar(64),
   depart_id            varchar(64),
   doc_account          varchar(64),
   doc_pwd              varchar(64),
   doc_age              int,
   doc_title            varchar(64),
   doc_sex              varchar(64),
   primary key (id)
);

/*==============================================================*/
/* Table: sufferer                                              */
/*==============================================================*/
create table sufferer
(
   id                   varchar(64) not null,
   suf_name             varchar(64),
   suf_sex              varchar(64),
   suf_age              int,
   suf_his              text,
   suf_card             varchar(64),
   doc_id               varchar(64),
   suf_address          varchar(512),
   suf_phone            varchar(64),
   suf_nation           varchar(64),
   suf_native           varchar(64),
   primary key (id)
);

/*==============================================================*/
/* Table: template                                              */
/*==============================================================*/
create table template
(
   id                   varchar(46) not null,
   dep_id               varchar(46),
   tem_name             varchar(46),
   tem_url              varchar(512),
   primary key (id)
);

