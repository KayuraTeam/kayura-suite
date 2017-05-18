/*
Navicat MySQL Data Transfer

Source Server         : localhost_mysql
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : kayura_db

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-05-18 23:29:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(5.21.0.0)', '1');
INSERT INTO `act_ge_property` VALUES ('schema.version', '5.21.0.0', '1');

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for example_categories
-- ----------------------------
DROP TABLE IF EXISTS `example_categories`;
CREATE TABLE `example_categories` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(15) NOT NULL,
  `Description` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`),
  KEY `CategoryName` (`CategoryName`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of example_categories
-- ----------------------------
INSERT INTO `example_categories` VALUES ('1', 'Beverages', 'Soft drinks, coffees, teas, beers, and ales');
INSERT INTO `example_categories` VALUES ('2', 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings');
INSERT INTO `example_categories` VALUES ('3', 'Confections', 'Desserts, candies, and sweet breads');
INSERT INTO `example_categories` VALUES ('4', 'Dairy Products', 'Cheeses');
INSERT INTO `example_categories` VALUES ('5', 'Grains/Cereals', 'Breads, crackers, pasta, and cereal');
INSERT INTO `example_categories` VALUES ('6', 'Meat/Poultry', 'Prepared meats');
INSERT INTO `example_categories` VALUES ('7', 'Produce', 'Dried fruit and bean curd');
INSERT INTO `example_categories` VALUES ('8', 'Seafood', 'Seaweed and fish');

-- ----------------------------
-- Table structure for example_customers
-- ----------------------------
DROP TABLE IF EXISTS `example_customers`;
CREATE TABLE `example_customers` (
  `CustomerID` char(5) NOT NULL,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `City` (`City`),
  KEY `CompanyName` (`CompanyName`),
  KEY `PostalCode` (`PostalCode`),
  KEY `Region` (`Region`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of example_customers
-- ----------------------------
INSERT INTO `example_customers` VALUES ('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', null, '12209', 'Germany', '030-0074321', '030-0076545');
INSERT INTO `example_customers` VALUES ('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.', null, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745');
INSERT INTO `example_customers` VALUES ('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Owner', 'Mataderos  2312', 'México D.F.', null, '05023', 'Mexico', '(5) 555-3932', null);
INSERT INTO `example_customers` VALUES ('AROUT', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '120 Hanover Sq.', 'London', null, 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6750');
INSERT INTO `example_customers` VALUES ('BERGS', 'Berglunds snabbk?p', 'Christina Berglund', 'Order Administrator', 'Berguvsv?gen  8', 'Lule?', null, 'S-958 22', 'Sweden', '0921-12 34 65', '0921-12 34 67');
INSERT INTO `example_customers` VALUES ('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim', null, '68306', 'Germany', '0621-08460', '0621-08924');
INSERT INTO `example_customers` VALUES ('BLONP', 'Blondesddsl père et fils', 'Frédérique Citeaux', 'Marketing Manager', '24, place Kléber', 'Strasbourg', null, '67000', 'France', '88.60.15.31', '88.60.15.32');
INSERT INTO `example_customers` VALUES ('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Owner', 'C/ Araquil, 67', 'Madrid', null, '28023', 'Spain', '(91) 555 22 82', '(91) 555 91 99');
INSERT INTO `example_customers` VALUES ('BONAP', 'Bon app', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', null, '13008', 'France', '91.24.45.40', '91.24.45.41');
INSERT INTO `example_customers` VALUES ('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(604) 555-4729', '(604) 555-3745');
INSERT INTO `example_customers` VALUES ('BSBEV', 'Bs Beverages', 'Victoria Ashworth', 'Sales Representative', 'Fauntleroy Circus', 'London', null, 'EC2 5NT', 'UK', '(171) 555-1212', null);
INSERT INTO `example_customers` VALUES ('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Sales Agent', 'Cerrito 333', 'Buenos Aires', null, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892');
INSERT INTO `example_customers` VALUES ('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Marketing Manager', 'Sierras de Granada 9993', 'México D.F.', null, '05022', 'Mexico', '(5) 555-3392', '(5) 555-7293');
INSERT INTO `example_customers` VALUES ('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Owner', 'Hauptstr. 29', 'Bern', null, '3012', 'Switzerland', '0452-076545', null);
INSERT INTO `example_customers` VALUES ('COMMI', 'Comércio Mineiro', 'Pedro Afonso', 'Sales Associate', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', '(11) 555-7647', null);
INSERT INTO `example_customers` VALUES ('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Sales Representative', 'Berkeley Gardens 12  Brewery', 'London', null, 'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199');
INSERT INTO `example_customers` VALUES ('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Order Administrator', 'Walserweg 21', 'Aachen', null, '52066', 'Germany', '0241-039123', '0241-059428');
INSERT INTO `example_customers` VALUES ('DUMON', 'Du monde entier', 'Janine Labrune', 'Owner', '67, rue des Cinquante Otages', 'Nantes', null, '44000', 'France', '40.67.88.88', '40.67.89.89');
INSERT INTO `example_customers` VALUES ('EASTC', 'Eastern Connection', 'Ann Devon', 'Sales Agent', '35 King George', 'London', null, 'WX3 6FW', 'UK', '(171) 555-0297', '(171) 555-3373');
INSERT INTO `example_customers` VALUES ('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Sales Manager', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria', '7675-3425', '7675-3426');
INSERT INTO `example_customers` VALUES ('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Marketing Assistant', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', '(11) 555-9857', null);
INSERT INTO `example_customers` VALUES ('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Die Roel', 'Accounting Manager', 'C/ Moralzarzal, 86', 'Madrid', null, '28034', 'Spain', '(91) 555 94 44', '(91) 555 55 93');
INSERT INTO `example_customers` VALUES ('FOLIG', 'Folies urmandes', 'Martine Rancé', 'Assistant Sales Agent', '184, chaussée de Tournai', 'Lille', null, '59000', 'France', '20.16.10.16', '20.16.10.17');
INSERT INTO `example_customers` VALUES ('FOLKO', 'Folk och f? HB', 'Maria Larsson', 'Owner', '?kergatan 24', 'Br?cke', null, 'S-844 67', 'Sweden', '0695-34 67 21', null);
INSERT INTO `example_customers` VALUES ('FRANK', 'Frankenversand', 'Peter Franken', 'Marketing Manager', 'Berliner Platz 43', 'München', null, '80805', 'Germany', '089-0877310', '089-0877451');
INSERT INTO `example_customers` VALUES ('FRANR', 'France restauration', 'Carine Schmitt', 'Marketing Manager', '54, rue Royale', 'Nantes', null, '44000', 'France', '40.32.21.21', '40.32.21.20');
INSERT INTO `example_customers` VALUES ('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Sales Representative', 'Via Monte Bianco 34', 'Torino', null, '10100', 'Italy', '011-4988260', '011-4988261');
INSERT INTO `example_customers` VALUES ('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Sales Manager', 'Jardim das rosas n. 32', 'Lisboa', null, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535');
INSERT INTO `example_customers` VALUES ('GALED', 'Galería del gastrónomo', 'Eduardo Saavedra', 'Marketing Manager', 'Rambla de Catalu?a, 23', 'Barcelona', null, '08022', 'Spain', '(93) 203 4560', '(93) 203 4561');
INSERT INTO `example_customers` VALUES ('GODOS', 'dos Cocina Típica', 'José Pedro Freyre', 'Sales Manager', 'C/ Romero, 33', 'Sevilla', null, '41101', 'Spain', '(95) 555 82 82', null);
INSERT INTO `example_customers` VALUES ('GOURL', 'urmet Lanchonetes', 'André Fonseca', 'Sales Associate', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', '(11) 555-9482', null);
INSERT INTO `example_customers` VALUES ('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', '(503) 555-7555', null);
INSERT INTO `example_customers` VALUES ('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Owner', '5a Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397');
INSERT INTO `example_customers` VALUES ('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Accounting Manager', 'Rua do Pa?o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', '(21) 555-0091', '(21) 555-8765');
INSERT INTO `example_customers` VALUES ('HILAA', 'HILARION-Abastos', 'Carlos Hernández', 'Sales Representative', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948');
INSERT INTO `example_customers` VALUES ('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(503) 555-6874', '(503) 555-2376');
INSERT INTO `example_customers` VALUES ('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Sales Associate', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland', '2967 542', '2967 3333');
INSERT INTO `example_customers` VALUES ('ISLAT', 'Island Trading', 'Helen Bennett', 'Marketing Manager', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888', null);
INSERT INTO `example_customers` VALUES ('KOENE', 'K?niglich Essen', 'Philip Cramer', 'Sales Associate', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany', '0555-09876', null);
INSERT INTO `example_customers` VALUES ('LACOR', 'La corne dabondance', 'Daniel Tonini', 'Sales Representative', '67, avenue de lEurope', 'Versailles', null, '78000', 'France', '30.59.84.10', '30.59.85.11');
INSERT INTO `example_customers` VALUES ('LAMAI', 'La maison dAsie', 'Annette Roulet', 'Sales Manager', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France', '61.77.61.10', '61.77.61.11');
INSERT INTO `example_customers` VALUES ('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Marketing Assistant', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', '(604) 555-3392', '(604) 555-7293');
INSERT INTO `example_customers` VALUES ('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Marketing Manager', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', '(509) 555-7969', '(509) 555-6221');
INSERT INTO `example_customers` VALUES ('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Sales Representative', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany', '069-0245984', '069-0245874');
INSERT INTO `example_customers` VALUES ('LETSS', 'Lets Stop N Shop', 'Jaime Yorres', 'Owner', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', '(415) 555-5938', null);
INSERT INTO `example_customers` VALUES ('LILAS', 'LILA-Supermercado', 'Carlos nzález', 'Accounting Manager', 'Carrera 52 con Ave. Bolívar #65-98 Llano Lar', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256');
INSERT INTO `example_customers` VALUES ('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Owner', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93');
INSERT INTO `example_customers` VALUES ('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Sales Manager', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', '(503) 555-9573', '(503) 555-9646');
INSERT INTO `example_customers` VALUES ('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Marketing Manager', 'Via Ludovico il Moro 22', 'Bergamo', null, '24100', 'Italy', '035-640230', '035-640231');
INSERT INTO `example_customers` VALUES ('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Sales Agent', 'Rue Joseph-Bens 532', 'Bruxelles', null, 'B-1180', 'Belgium', '(02) 201 24 67', '(02) 201 24 68');
INSERT INTO `example_customers` VALUES ('MEREP', 'Mère Paillarde', 'Jean Fresnière', 'Marketing Assistant', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-8054', '(514) 555-8055');
INSERT INTO `example_customers` VALUES ('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Marketing Assistant', 'Heerstr. 22', 'Leipzig', null, '04179', 'Germany', '0342-023176', null);
INSERT INTO `example_customers` VALUES ('NORTS', 'North/South', 'Simon Crowther', 'Sales Associate', 'South House 300 Queensbridge', 'London', null, 'SW7 1RZ', 'UK', '(171) 555-7733', '(171) 555-2530');
INSERT INTO `example_customers` VALUES ('OCEAN', 'Océano Atlántico Ltda.', 'Yvonne Moncada', 'Sales Agent', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', null, '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535');
INSERT INTO `example_customers` VALUES ('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Sales Representative', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', '(907) 555-7584', '(907) 555-2880');
INSERT INTO `example_customers` VALUES ('OTTIK', 'Ottilies K?seladen', 'Henriette Pfalzheim', 'Owner', 'Mehrheimerstr. 369', 'K?ln', null, '50739', 'Germany', '0221-0644327', '0221-0765721');
INSERT INTO `example_customers` VALUES ('PARIS', 'Paris spécialités', 'Marie Bertrand', 'Owner', '265, boulevard Charonne', 'Paris', null, '75012', 'France', '(1) 42.34.22.66', '(1) 42.34.22.77');
INSERT INTO `example_customers` VALUES ('PERIC', 'Pericles Comidas clásicas', 'Guillermo Fernández', 'Sales Representative', 'Calle Dr. Jorge Cash 321', 'México D.F.', null, '05033', 'Mexico', '(5) 552-3745', '(5) 545-3745');
INSERT INTO `example_customers` VALUES ('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Sales Manager', 'Geislweg 14', 'Salzburg', null, '5020', 'Austria', '6562-9722', '6562-9723');
INSERT INTO `example_customers` VALUES ('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Sales Representative', 'Estrada da saúde n. 58', 'Lisboa', null, '1756', 'Portugal', '(1) 356-5634', null);
INSERT INTO `example_customers` VALUES ('QUEDE', 'Que Delícia', 'Bernardo Batista', 'Accounting Manager', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', '(21) 555-4252', '(21) 555-4545');
INSERT INTO `example_customers` VALUES ('QUEEN', 'Queen Cozinha', 'Lúcia Carvalho', 'Marketing Assistant', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', '(11) 555-1189', null);
INSERT INTO `example_customers` VALUES ('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Accounting Manager', 'Taucherstra?e 10', 'Cunewalde', null, '01307', 'Germany', '0372-035188', null);
INSERT INTO `example_customers` VALUES ('RANCH', 'Rancho grande', 'Sergio Gutiérrez', 'Sales Representative', 'Av. del Libertador 900', 'Buenos Aires', null, '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556');
INSERT INTO `example_customers` VALUES ('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Assistant Sales Representative', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', '(505) 555-5939', '(505) 555-3620');
INSERT INTO `example_customers` VALUES ('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Sales Associate', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy', '0522-556721', '0522-556722');
INSERT INTO `example_customers` VALUES ('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Assistant Sales Agent', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', '(21) 555-3412', null);
INSERT INTO `example_customers` VALUES ('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Sales Manager', 'Grenzacherweg 237', 'Genève', null, '1203', 'Switzerland', '0897-034214', null);
INSERT INTO `example_customers` VALUES ('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Accounting Manager', 'Gran Vía, 1', 'Madrid', null, '28001', 'Spain', '(91) 745 6200', '(91) 745 6210');
INSERT INTO `example_customers` VALUES ('SANTG', 'Santé urmet', 'Jonas Bergulfsen', 'Owner', 'Erling Skakkes gate 78', 'Stavern', null, '4110', 'Norway', '07-98 92 35', '07-98 92 47');
INSERT INTO `example_customers` VALUES ('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Sales Representative', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', '(208) 555-8097', null);
INSERT INTO `example_customers` VALUES ('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Sales Manager', '90 Wadhurst Rd.', 'London', null, 'OX15 4NB', 'UK', '(171) 555-1717', '(171) 555-5646');
INSERT INTO `example_customers` VALUES ('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Owner', 'Vinb?ltet 34', 'Kobenhavn', null, '1734', 'Denmark', '31 12 34 56', '31 13 35 57');
INSERT INTO `example_customers` VALUES ('SPECD', 'Spécialités du monde', 'Dominique Perrier', 'Marketing Manager', '25, rue Lauriston', 'Paris', null, '75016', 'France', '(1) 47.55.60.10', '(1) 47.55.60.20');
INSERT INTO `example_customers` VALUES ('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Sales Manager', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', '(307) 555-4680', '(307) 555-6525');
INSERT INTO `example_customers` VALUES ('SUPRD', 'Suprêmes délices', 'Pascale Cartrain', 'Accounting Manager', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium', '(071) 23 67 22 20', '(071) 23 67 22 21');
INSERT INTO `example_customers` VALUES ('THEBI', 'The Big Cheese', 'Liz Nixon', 'Marketing Manager', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', '(503) 555-3612', null);
INSERT INTO `example_customers` VALUES ('THECR', 'The Cracker Box', 'Liu Wong', 'Marketing Assistant', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA', '(406) 555-5834', '(406) 555-8083');
INSERT INTO `example_customers` VALUES ('TOMSP', 'Toms Spezialit?ten', 'Karin Josephs', 'Marketing Manager', 'Luisenstr. 48', 'Münster', null, '44087', 'Germany', '0251-031259', '0251-035695');
INSERT INTO `example_customers` VALUES ('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Owner', 'Avda. Azteca 123', 'México D.F.', null, '05033', 'Mexico', '(5) 555-2933', null);
INSERT INTO `example_customers` VALUES ('TRADH', 'Tradi??o Hipermercados', 'Anabela Domingues', 'Sales Representative', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', '(11) 555-2167', '(11) 555-2168');
INSERT INTO `example_customers` VALUES ('TRAIH', 'Trails Head urmet Provisioners', 'Helvetius Nagy', 'Sales Associate', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA', '(206) 555-8257', '(206) 555-2174');
INSERT INTO `example_customers` VALUES ('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Sales Manager', 'Smagsloget 45', '?rhus', null, '8200', 'Denmark', '86 21 32 43', '86 22 33 44');
INSERT INTO `example_customers` VALUES ('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Sales Agent', '2, rue du Commerce', 'Lyon', null, '69004', 'France', '78.32.54.86', '78.32.54.87');
INSERT INTO `example_customers` VALUES ('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Accounting Manager', '59 rue de lAbbaye', 'Reims', null, '51100', 'France', '26.47.15.10', '26.47.15.11');
INSERT INTO `example_customers` VALUES ('WANDK', 'Die Wandernde Kuh', 'Rita Müller', 'Sales Representative', 'Adenauerallee 900', 'Stuttgart', null, '70563', 'Germany', '0711-020361', '0711-035428');
INSERT INTO `example_customers` VALUES ('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Accounting Manager', 'Torikatu 38', 'Oulu', null, '90110', 'Finland', '981-443655', '981-443655');
INSERT INTO `example_customers` VALUES ('WELLI', 'Wellington Importadora', 'Paula Parente', 'Sales Manager', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', '(14) 555-8122', null);
INSERT INTO `example_customers` VALUES ('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Owner', '305 - 14th Ave. S. Suite 3B', 'Seattle', 'WA', '98128', 'USA', '(206) 555-4112', '(206) 555-4115');
INSERT INTO `example_customers` VALUES ('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Owner/Marketing Assistant', 'Keskuskatu 45', 'Helsinki', null, '21240', 'Finland', '90-224 8858', '90-224 8858');
INSERT INTO `example_customers` VALUES ('WOLZA', 'Wolski  Zajazd', 'Zbyszek Piestrzeniewicz', 'Owner', 'ul. Filtrowa 68', 'Warszawa', null, '01-012', 'Poland', '(26) 642-7012', '(26) 642-7012');

-- ----------------------------
-- Table structure for example_employees
-- ----------------------------
DROP TABLE IF EXISTS `example_employees`;
CREATE TABLE `example_employees` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(20) NOT NULL,
  `FirstName` varchar(10) NOT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `TitleOfCourtesy` varchar(25) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `HireDate` datetime DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `HomePhone` varchar(24) DEFAULT NULL,
  `Extension` varchar(4) DEFAULT NULL,
  `Notes` varchar(4096) DEFAULT NULL,
  `ReportsTo` int(11) DEFAULT NULL,
  `PhotoPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `LastName` (`LastName`),
  KEY `PostalCode` (`PostalCode`),
  KEY `FK_Example_Employees_Employees` (`ReportsTo`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of example_employees
-- ----------------------------
INSERT INTO `example_employees` VALUES ('1', 'Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08 00:00:00', '1992-05-01 00:00:00', '507 - 20th Ave. E.Apt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', 'Education includes a BA in psychology from Colorado State University in 1970.  She also completed \"The Art of the Cold Call.\"  Nancy is a member of Toastmasters International.', null, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO `example_employees` VALUES ('2', 'Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', '1952-02-19 00:00:00', '1992-08-14 00:00:00', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'USA', '(206) 555-9482', '3457', 'Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.', null, 'http://accweb/emmployees/fuller.bmp');
INSERT INTO `example_employees` VALUES ('3', 'Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30 00:00:00', '1992-04-01 00:00:00', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '(206) 555-3412', '3355', 'Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.', '2', 'http://accweb/emmployees/leverling.bmp');
INSERT INTO `example_employees` VALUES ('4', 'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1937-09-19 00:00:00', '1993-05-03 00:00:00', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'USA', '(206) 555-8122', '5176', 'Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.', '2', 'http://accweb/emmployees/peacock.bmp');
INSERT INTO `example_employees` VALUES ('5', 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-03-04 00:00:00', '1993-10-17 00:00:00', '14 Garrett Hill', 'London', null, 'SW1 8JR', 'UK', '(71) 555-4848', '3453', 'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses \"Successful Telemarketing\" and \"International Sales Management.\"  He is fluent in French.', '2', 'http://accweb/emmployees/buchanan.bmp');
INSERT INTO `example_employees` VALUES ('6', 'Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-07-02 00:00:00', '1993-10-17 00:00:00', 'Coventry HouseMiner Rd.', 'London', null, 'EC2 7JR', 'UK', '(71) 555-7773', '428', 'Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986).  He has also taken the courses \"Multi-Cultural Selling\" and \"Time Management for the Sales Professional.\"  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.', '5', 'http://accweb/emmployees/davolio.bmp');
INSERT INTO `example_employees` VALUES ('7', 'King', 'Robert', 'Sales Representative', 'Mr.', '1960-05-29 00:00:00', '1994-01-02 00:00:00', 'Edgeham HollowWinchester Way', 'London', null, 'RG1 9SP', 'UK', '(71) 555-5598', '465', 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company.  After completing a course entitled \"Selling in Europe,\" he was transferred to the London office in March 1993.', '5', 'http://accweb/emmployees/davolio.bmp');
INSERT INTO `example_employees` VALUES ('8', 'Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1958-01-09 00:00:00', '1994-03-05 00:00:00', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'USA', '(206) 555-1189', '2344', 'Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.', '2', 'http://accweb/emmployees/davolio.bmp');
INSERT INTO `example_employees` VALUES ('9', 'Dodsworth', 'Anne', 'Sales Representative', 'Ms.', '1966-01-27 00:00:00', '1994-11-15 00:00:00', '7 Houndstooth Rd.', 'London', null, 'WG2 7LT', 'UK', '(71) 555-4444', '452', 'Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.', '5', 'http://accweb/emmployees/davolio.bmp');

-- ----------------------------
-- Table structure for example_orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `example_orderdetails`;
CREATE TABLE `example_orderdetails` (
  `DetailID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `UnitPrice` double(12,2) NOT NULL DEFAULT '0.00',
  `Quantity` smallint(6) NOT NULL DEFAULT '0',
  `Discount` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`DetailID`),
  KEY `OrdersOrder_Details` (`OrderID`),
  KEY `ProductsOrder_Details` (`ProductID`)
) ENGINE=MyISAM AUTO_INCREMENT=2156 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of example_orderdetails
-- ----------------------------
INSERT INTO `example_orderdetails` VALUES ('1', '10248', '11', '14.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('2', '10248', '42', '9.80', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('3', '10248', '72', '34.80', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('4', '10249', '14', '18.60', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('5', '10249', '51', '42.40', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('6', '10250', '41', '7.70', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('7', '10250', '51', '42.40', '35', '0.15');
INSERT INTO `example_orderdetails` VALUES ('8', '10250', '65', '16.80', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('9', '10251', '22', '16.80', '6', '0.05');
INSERT INTO `example_orderdetails` VALUES ('10', '10251', '57', '15.60', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('11', '10251', '65', '16.80', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('12', '10252', '20', '64.80', '40', '0.05');
INSERT INTO `example_orderdetails` VALUES ('13', '10252', '33', '2.00', '25', '0.05');
INSERT INTO `example_orderdetails` VALUES ('14', '10252', '60', '27.20', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('15', '10253', '31', '10.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('16', '10253', '39', '14.40', '42', '0');
INSERT INTO `example_orderdetails` VALUES ('17', '10253', '49', '16.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('18', '10254', '24', '3.60', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('19', '10254', '55', '19.20', '21', '0.15');
INSERT INTO `example_orderdetails` VALUES ('20', '10254', '74', '8.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('21', '10255', '2', '15.20', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('22', '10255', '16', '13.90', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('23', '10255', '36', '15.20', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('24', '10255', '59', '44.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('25', '10256', '53', '26.20', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('26', '10256', '77', '10.40', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('27', '10257', '27', '35.10', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('28', '10257', '39', '14.40', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('29', '10257', '77', '10.40', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('30', '10258', '2', '15.20', '50', '0.2');
INSERT INTO `example_orderdetails` VALUES ('31', '10258', '5', '17.00', '65', '0.2');
INSERT INTO `example_orderdetails` VALUES ('32', '10258', '32', '25.60', '6', '0.2');
INSERT INTO `example_orderdetails` VALUES ('33', '10259', '21', '8.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('34', '10259', '37', '20.80', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('35', '10260', '41', '7.70', '16', '0.25');
INSERT INTO `example_orderdetails` VALUES ('36', '10260', '57', '15.60', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('37', '10260', '62', '39.40', '15', '0.25');
INSERT INTO `example_orderdetails` VALUES ('38', '10260', '70', '12.00', '21', '0.25');
INSERT INTO `example_orderdetails` VALUES ('39', '10261', '21', '8.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('40', '10261', '35', '14.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('41', '10262', '5', '17.00', '12', '0.2');
INSERT INTO `example_orderdetails` VALUES ('42', '10262', '7', '24.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('43', '10262', '56', '30.40', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('44', '10263', '16', '13.90', '60', '0.25');
INSERT INTO `example_orderdetails` VALUES ('45', '10263', '24', '3.60', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('46', '10263', '30', '20.70', '60', '0.25');
INSERT INTO `example_orderdetails` VALUES ('47', '10263', '74', '8.00', '36', '0.25');
INSERT INTO `example_orderdetails` VALUES ('48', '10264', '2', '15.20', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('49', '10264', '41', '7.70', '25', '0.15');
INSERT INTO `example_orderdetails` VALUES ('50', '10265', '17', '31.20', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('51', '10265', '70', '12.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('52', '10266', '12', '30.40', '12', '0.05');
INSERT INTO `example_orderdetails` VALUES ('53', '10267', '40', '14.70', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('54', '10267', '59', '44.00', '70', '0.15');
INSERT INTO `example_orderdetails` VALUES ('55', '10267', '76', '14.40', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('56', '10268', '29', '99.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('57', '10268', '72', '27.80', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('58', '10269', '33', '2.00', '60', '0.05');
INSERT INTO `example_orderdetails` VALUES ('59', '10269', '72', '27.80', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('60', '10270', '36', '15.20', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('61', '10270', '43', '36.80', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('62', '10271', '33', '2.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('63', '10272', '20', '64.80', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('64', '10272', '31', '10.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('65', '10272', '72', '27.80', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('66', '10273', '10', '24.80', '24', '0.05');
INSERT INTO `example_orderdetails` VALUES ('67', '10273', '31', '10.00', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('68', '10273', '33', '2.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('69', '10273', '40', '14.70', '60', '0.05');
INSERT INTO `example_orderdetails` VALUES ('70', '10273', '76', '14.40', '33', '0.05');
INSERT INTO `example_orderdetails` VALUES ('71', '10274', '71', '17.20', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('72', '10274', '72', '27.80', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('73', '10275', '24', '3.60', '12', '0.05');
INSERT INTO `example_orderdetails` VALUES ('74', '10275', '59', '44.00', '6', '0.05');
INSERT INTO `example_orderdetails` VALUES ('75', '10276', '10', '24.80', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('76', '10276', '13', '4.80', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('77', '10277', '28', '36.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('78', '10277', '62', '39.40', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('79', '10278', '44', '15.50', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('80', '10278', '59', '44.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('81', '10278', '63', '35.10', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('82', '10278', '73', '12.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('83', '10279', '17', '31.20', '15', '0.25');
INSERT INTO `example_orderdetails` VALUES ('84', '10280', '24', '3.60', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('85', '10280', '55', '19.20', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('86', '10280', '75', '6.20', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('87', '10281', '19', '7.30', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('88', '10281', '24', '3.60', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('89', '10281', '35', '14.40', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('90', '10282', '30', '20.70', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('91', '10282', '57', '15.60', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('92', '10283', '15', '12.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('93', '10283', '19', '7.30', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('94', '10283', '60', '27.20', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('95', '10283', '72', '27.80', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('96', '10284', '27', '35.10', '15', '0.25');
INSERT INTO `example_orderdetails` VALUES ('97', '10284', '44', '15.50', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('98', '10284', '60', '27.20', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('99', '10284', '67', '11.20', '5', '0.25');
INSERT INTO `example_orderdetails` VALUES ('100', '10285', '1', '14.40', '45', '0.2');
INSERT INTO `example_orderdetails` VALUES ('101', '10285', '40', '14.70', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('102', '10285', '53', '26.20', '36', '0.2');
INSERT INTO `example_orderdetails` VALUES ('103', '10286', '35', '14.40', '100', '0');
INSERT INTO `example_orderdetails` VALUES ('104', '10286', '62', '39.40', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('105', '10287', '16', '13.90', '40', '0.15');
INSERT INTO `example_orderdetails` VALUES ('106', '10287', '34', '11.20', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('107', '10287', '46', '9.60', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('108', '10288', '54', '5.90', '10', '0.1');
INSERT INTO `example_orderdetails` VALUES ('109', '10288', '68', '10.00', '3', '0.1');
INSERT INTO `example_orderdetails` VALUES ('110', '10289', '3', '8.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('111', '10289', '64', '26.60', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('112', '10290', '5', '17.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('113', '10290', '29', '99.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('114', '10290', '49', '16.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('115', '10290', '77', '10.40', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('116', '10291', '13', '4.80', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('117', '10291', '44', '15.50', '24', '0.1');
INSERT INTO `example_orderdetails` VALUES ('118', '10291', '51', '42.40', '2', '0.1');
INSERT INTO `example_orderdetails` VALUES ('119', '10292', '20', '64.80', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('120', '10293', '18', '50.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('121', '10293', '24', '3.60', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('122', '10293', '63', '35.10', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('123', '10293', '75', '6.20', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('124', '10294', '1', '14.40', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('125', '10294', '17', '31.20', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('126', '10294', '43', '36.80', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('127', '10294', '60', '27.20', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('128', '10294', '75', '6.20', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('129', '10295', '56', '30.40', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('130', '10296', '11', '16.80', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('131', '10296', '16', '13.90', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('132', '10296', '69', '28.80', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('133', '10297', '39', '14.40', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('134', '10297', '72', '27.80', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('135', '10298', '2', '15.20', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('136', '10298', '36', '15.20', '40', '0.25');
INSERT INTO `example_orderdetails` VALUES ('137', '10298', '59', '44.00', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('138', '10298', '62', '39.40', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('139', '10299', '19', '7.30', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('140', '10299', '70', '12.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('141', '10300', '66', '13.60', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('142', '10300', '68', '10.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('143', '10301', '40', '14.70', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('144', '10301', '56', '30.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('145', '10302', '17', '31.20', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('146', '10302', '28', '36.40', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('147', '10302', '43', '36.80', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('148', '10303', '40', '14.70', '40', '0.1');
INSERT INTO `example_orderdetails` VALUES ('149', '10303', '65', '16.80', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('150', '10303', '68', '10.00', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('151', '10304', '49', '16.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('152', '10304', '59', '44.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('153', '10304', '71', '17.20', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('154', '10305', '18', '50.00', '25', '0.1');
INSERT INTO `example_orderdetails` VALUES ('155', '10305', '29', '99.00', '25', '0.1');
INSERT INTO `example_orderdetails` VALUES ('156', '10305', '39', '14.40', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('157', '10306', '30', '20.70', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('158', '10306', '53', '26.20', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('159', '10306', '54', '5.90', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('160', '10307', '62', '39.40', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('161', '10307', '68', '10.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('162', '10308', '69', '28.80', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('163', '10308', '70', '12.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('164', '10309', '4', '17.60', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('165', '10309', '6', '20.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('166', '10309', '42', '11.20', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('167', '10309', '43', '36.80', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('168', '10309', '71', '17.20', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('169', '10310', '16', '13.90', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('170', '10310', '62', '39.40', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('171', '10311', '42', '11.20', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('172', '10311', '69', '28.80', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('173', '10312', '28', '36.40', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('174', '10312', '43', '36.80', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('175', '10312', '53', '26.20', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('176', '10312', '75', '6.20', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('177', '10313', '36', '15.20', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('178', '10314', '32', '25.60', '40', '0.1');
INSERT INTO `example_orderdetails` VALUES ('179', '10314', '58', '10.60', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('180', '10314', '62', '39.40', '25', '0.1');
INSERT INTO `example_orderdetails` VALUES ('181', '10315', '34', '11.20', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('182', '10315', '70', '12.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('183', '10316', '41', '7.70', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('184', '10316', '62', '39.40', '70', '0');
INSERT INTO `example_orderdetails` VALUES ('185', '10317', '1', '14.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('186', '10318', '41', '7.70', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('187', '10318', '76', '14.40', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('188', '10319', '17', '31.20', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('189', '10319', '28', '36.40', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('190', '10319', '76', '14.40', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('191', '10320', '71', '17.20', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('192', '10321', '35', '14.40', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('193', '10322', '52', '5.60', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('194', '10323', '15', '12.40', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('195', '10323', '25', '11.20', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('196', '10323', '39', '14.40', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('197', '10324', '16', '13.90', '21', '0.15');
INSERT INTO `example_orderdetails` VALUES ('198', '10324', '35', '14.40', '70', '0.15');
INSERT INTO `example_orderdetails` VALUES ('199', '10324', '46', '9.60', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('200', '10324', '59', '44.00', '40', '0.15');
INSERT INTO `example_orderdetails` VALUES ('201', '10324', '63', '35.10', '80', '0.15');
INSERT INTO `example_orderdetails` VALUES ('202', '10325', '6', '20.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('203', '10325', '13', '4.80', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('204', '10325', '14', '18.60', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('205', '10325', '31', '10.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('206', '10325', '72', '27.80', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('207', '10326', '4', '17.60', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('208', '10326', '57', '15.60', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('209', '10326', '75', '6.20', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('210', '10327', '2', '15.20', '25', '0.2');
INSERT INTO `example_orderdetails` VALUES ('211', '10327', '11', '16.80', '50', '0.2');
INSERT INTO `example_orderdetails` VALUES ('212', '10327', '30', '20.70', '35', '0.2');
INSERT INTO `example_orderdetails` VALUES ('213', '10327', '58', '10.60', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('214', '10328', '59', '44.00', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('215', '10328', '65', '16.80', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('216', '10328', '68', '10.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('217', '10329', '19', '7.30', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('218', '10329', '30', '20.70', '8', '0.05');
INSERT INTO `example_orderdetails` VALUES ('219', '10329', '38', '210.80', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('220', '10329', '56', '30.40', '12', '0.05');
INSERT INTO `example_orderdetails` VALUES ('221', '10330', '26', '24.90', '50', '0.15');
INSERT INTO `example_orderdetails` VALUES ('222', '10330', '72', '27.80', '25', '0.15');
INSERT INTO `example_orderdetails` VALUES ('223', '10331', '54', '5.90', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('224', '10332', '18', '50.00', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('225', '10332', '42', '11.20', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('226', '10332', '47', '7.60', '16', '0.2');
INSERT INTO `example_orderdetails` VALUES ('227', '10333', '14', '18.60', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('228', '10333', '21', '8.00', '10', '0.1');
INSERT INTO `example_orderdetails` VALUES ('229', '10333', '71', '17.20', '40', '0.1');
INSERT INTO `example_orderdetails` VALUES ('230', '10334', '52', '5.60', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('231', '10334', '68', '10.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('232', '10335', '2', '15.20', '7', '0.2');
INSERT INTO `example_orderdetails` VALUES ('233', '10335', '31', '10.00', '25', '0.2');
INSERT INTO `example_orderdetails` VALUES ('234', '10335', '32', '25.60', '6', '0.2');
INSERT INTO `example_orderdetails` VALUES ('235', '10335', '51', '42.40', '48', '0.2');
INSERT INTO `example_orderdetails` VALUES ('236', '10336', '4', '17.60', '18', '0.1');
INSERT INTO `example_orderdetails` VALUES ('237', '10337', '23', '7.20', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('238', '10337', '26', '24.90', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('239', '10337', '36', '15.20', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('240', '10337', '37', '20.80', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('241', '10337', '72', '27.80', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('242', '10338', '17', '31.20', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('243', '10338', '30', '20.70', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('244', '10339', '4', '17.60', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('245', '10339', '17', '31.20', '70', '0.05');
INSERT INTO `example_orderdetails` VALUES ('246', '10339', '62', '39.40', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('247', '10340', '18', '50.00', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('248', '10340', '41', '7.70', '12', '0.05');
INSERT INTO `example_orderdetails` VALUES ('249', '10340', '43', '36.80', '40', '0.05');
INSERT INTO `example_orderdetails` VALUES ('250', '10341', '33', '2.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('251', '10341', '59', '44.00', '9', '0.15');
INSERT INTO `example_orderdetails` VALUES ('252', '10342', '2', '15.20', '24', '0.2');
INSERT INTO `example_orderdetails` VALUES ('253', '10342', '31', '10.00', '56', '0.2');
INSERT INTO `example_orderdetails` VALUES ('254', '10342', '36', '15.20', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('255', '10342', '55', '19.20', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('256', '10343', '64', '26.60', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('257', '10343', '68', '10.00', '4', '0.05');
INSERT INTO `example_orderdetails` VALUES ('258', '10343', '76', '14.40', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('259', '10344', '4', '17.60', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('260', '10344', '8', '32.00', '70', '0.25');
INSERT INTO `example_orderdetails` VALUES ('261', '10345', '8', '32.00', '70', '0');
INSERT INTO `example_orderdetails` VALUES ('262', '10345', '19', '7.30', '80', '0');
INSERT INTO `example_orderdetails` VALUES ('263', '10345', '42', '11.20', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('264', '10346', '17', '31.20', '36', '0.1');
INSERT INTO `example_orderdetails` VALUES ('265', '10346', '56', '30.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('266', '10347', '25', '11.20', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('267', '10347', '39', '14.40', '50', '0.15');
INSERT INTO `example_orderdetails` VALUES ('268', '10347', '40', '14.70', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('269', '10347', '75', '6.20', '6', '0.15');
INSERT INTO `example_orderdetails` VALUES ('270', '10348', '1', '14.40', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('271', '10348', '23', '7.20', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('272', '10349', '54', '5.90', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('273', '10350', '50', '13.00', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('274', '10350', '69', '28.80', '18', '0.1');
INSERT INTO `example_orderdetails` VALUES ('275', '10351', '38', '210.80', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('276', '10351', '41', '7.70', '13', '0');
INSERT INTO `example_orderdetails` VALUES ('277', '10351', '44', '15.50', '77', '0.05');
INSERT INTO `example_orderdetails` VALUES ('278', '10351', '65', '16.80', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('279', '10352', '24', '3.60', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('280', '10352', '54', '5.90', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('281', '10353', '11', '16.80', '12', '0.2');
INSERT INTO `example_orderdetails` VALUES ('282', '10353', '38', '210.80', '50', '0.2');
INSERT INTO `example_orderdetails` VALUES ('283', '10354', '1', '14.40', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('284', '10354', '29', '99.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('285', '10355', '24', '3.60', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('286', '10355', '57', '15.60', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('287', '10356', '31', '10.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('288', '10356', '55', '19.20', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('289', '10356', '69', '28.80', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('290', '10357', '10', '24.80', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('291', '10357', '26', '24.90', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('292', '10357', '60', '27.20', '8', '0.2');
INSERT INTO `example_orderdetails` VALUES ('293', '10358', '24', '3.60', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('294', '10358', '34', '11.20', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('295', '10358', '36', '15.20', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('296', '10359', '16', '13.90', '56', '0.05');
INSERT INTO `example_orderdetails` VALUES ('297', '10359', '31', '10.00', '70', '0.05');
INSERT INTO `example_orderdetails` VALUES ('298', '10359', '60', '27.20', '80', '0.05');
INSERT INTO `example_orderdetails` VALUES ('299', '10360', '28', '36.40', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('300', '10360', '29', '99.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('301', '10360', '38', '210.80', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('302', '10360', '49', '16.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('303', '10360', '54', '5.90', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('304', '10361', '39', '14.40', '54', '0.1');
INSERT INTO `example_orderdetails` VALUES ('305', '10361', '60', '27.20', '55', '0.1');
INSERT INTO `example_orderdetails` VALUES ('306', '10362', '25', '11.20', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('307', '10362', '51', '42.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('308', '10362', '54', '5.90', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('309', '10363', '31', '10.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('310', '10363', '75', '6.20', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('311', '10363', '76', '14.40', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('312', '10364', '69', '28.80', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('313', '10364', '71', '17.20', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('314', '10365', '11', '16.80', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('315', '10366', '65', '16.80', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('316', '10366', '77', '10.40', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('317', '10367', '34', '11.20', '36', '0');
INSERT INTO `example_orderdetails` VALUES ('318', '10367', '54', '5.90', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('319', '10367', '65', '16.80', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('320', '10367', '77', '10.40', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('321', '10368', '21', '8.00', '5', '0.1');
INSERT INTO `example_orderdetails` VALUES ('322', '10368', '28', '36.40', '13', '0.1');
INSERT INTO `example_orderdetails` VALUES ('323', '10368', '57', '15.60', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('324', '10368', '64', '26.60', '35', '0.1');
INSERT INTO `example_orderdetails` VALUES ('325', '10369', '29', '99.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('326', '10369', '56', '30.40', '18', '0.25');
INSERT INTO `example_orderdetails` VALUES ('327', '10370', '1', '14.40', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('328', '10370', '64', '26.60', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('329', '10370', '74', '8.00', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('330', '10371', '36', '15.20', '6', '0.2');
INSERT INTO `example_orderdetails` VALUES ('331', '10372', '20', '64.80', '12', '0.25');
INSERT INTO `example_orderdetails` VALUES ('332', '10372', '38', '210.80', '40', '0.25');
INSERT INTO `example_orderdetails` VALUES ('333', '10372', '60', '27.20', '70', '0.25');
INSERT INTO `example_orderdetails` VALUES ('334', '10372', '72', '27.80', '42', '0.25');
INSERT INTO `example_orderdetails` VALUES ('335', '10373', '58', '10.60', '80', '0.2');
INSERT INTO `example_orderdetails` VALUES ('336', '10373', '71', '17.20', '50', '0.2');
INSERT INTO `example_orderdetails` VALUES ('337', '10374', '31', '10.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('338', '10374', '58', '10.60', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('339', '10375', '14', '18.60', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('340', '10375', '54', '5.90', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('341', '10376', '31', '10.00', '42', '0.05');
INSERT INTO `example_orderdetails` VALUES ('342', '10377', '28', '36.40', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('343', '10377', '39', '14.40', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('344', '10378', '71', '17.20', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('345', '10379', '41', '7.70', '8', '0.1');
INSERT INTO `example_orderdetails` VALUES ('346', '10379', '63', '35.10', '16', '0.1');
INSERT INTO `example_orderdetails` VALUES ('347', '10379', '65', '16.80', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('348', '10380', '30', '20.70', '18', '0.1');
INSERT INTO `example_orderdetails` VALUES ('349', '10380', '53', '26.20', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('350', '10380', '60', '27.20', '6', '0.1');
INSERT INTO `example_orderdetails` VALUES ('351', '10380', '70', '12.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('352', '10381', '74', '8.00', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('353', '10382', '5', '17.00', '32', '0');
INSERT INTO `example_orderdetails` VALUES ('354', '10382', '18', '50.00', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('355', '10382', '29', '99.00', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('356', '10382', '33', '2.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('357', '10382', '74', '8.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('358', '10383', '13', '4.80', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('359', '10383', '50', '13.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('360', '10383', '56', '30.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('361', '10384', '20', '64.80', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('362', '10384', '60', '27.20', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('363', '10385', '7', '24.00', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('364', '10385', '60', '27.20', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('365', '10385', '68', '10.00', '8', '0.2');
INSERT INTO `example_orderdetails` VALUES ('366', '10386', '24', '3.60', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('367', '10386', '34', '11.20', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('368', '10387', '24', '3.60', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('369', '10387', '28', '36.40', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('370', '10387', '59', '44.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('371', '10387', '71', '17.20', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('372', '10388', '45', '7.60', '15', '0.2');
INSERT INTO `example_orderdetails` VALUES ('373', '10388', '52', '5.60', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('374', '10388', '53', '26.20', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('375', '10389', '10', '24.80', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('376', '10389', '55', '19.20', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('377', '10389', '62', '39.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('378', '10389', '70', '12.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('379', '10390', '31', '10.00', '60', '0.1');
INSERT INTO `example_orderdetails` VALUES ('380', '10390', '35', '14.40', '40', '0.1');
INSERT INTO `example_orderdetails` VALUES ('381', '10390', '46', '9.60', '45', '0');
INSERT INTO `example_orderdetails` VALUES ('382', '10390', '72', '27.80', '24', '0.1');
INSERT INTO `example_orderdetails` VALUES ('383', '10391', '13', '4.80', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('384', '10392', '69', '28.80', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('385', '10393', '2', '15.20', '25', '0.25');
INSERT INTO `example_orderdetails` VALUES ('386', '10393', '14', '18.60', '42', '0.25');
INSERT INTO `example_orderdetails` VALUES ('387', '10393', '25', '11.20', '7', '0.25');
INSERT INTO `example_orderdetails` VALUES ('388', '10393', '26', '24.90', '70', '0.25');
INSERT INTO `example_orderdetails` VALUES ('389', '10393', '31', '10.00', '32', '0');
INSERT INTO `example_orderdetails` VALUES ('390', '10394', '13', '4.80', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('391', '10394', '62', '39.40', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('392', '10395', '46', '9.60', '28', '0.1');
INSERT INTO `example_orderdetails` VALUES ('393', '10395', '53', '26.20', '70', '0.1');
INSERT INTO `example_orderdetails` VALUES ('394', '10395', '69', '28.80', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('395', '10396', '23', '7.20', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('396', '10396', '71', '17.20', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('397', '10396', '72', '27.80', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('398', '10397', '21', '8.00', '10', '0.15');
INSERT INTO `example_orderdetails` VALUES ('399', '10397', '51', '42.40', '18', '0.15');
INSERT INTO `example_orderdetails` VALUES ('400', '10398', '35', '14.40', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('401', '10398', '55', '19.20', '120', '0.1');
INSERT INTO `example_orderdetails` VALUES ('402', '10399', '68', '10.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('403', '10399', '71', '17.20', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('404', '10399', '76', '14.40', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('405', '10399', '77', '10.40', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('406', '10400', '29', '99.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('407', '10400', '35', '14.40', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('408', '10400', '49', '16.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('409', '10401', '30', '20.70', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('410', '10401', '56', '30.40', '70', '0');
INSERT INTO `example_orderdetails` VALUES ('411', '10401', '65', '16.80', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('412', '10401', '71', '17.20', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('413', '10402', '23', '7.20', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('414', '10402', '63', '35.10', '65', '0');
INSERT INTO `example_orderdetails` VALUES ('415', '10403', '16', '13.90', '21', '0.15');
INSERT INTO `example_orderdetails` VALUES ('416', '10403', '48', '10.20', '70', '0.15');
INSERT INTO `example_orderdetails` VALUES ('417', '10404', '26', '24.90', '30', '0.05');
INSERT INTO `example_orderdetails` VALUES ('418', '10404', '42', '11.20', '40', '0.05');
INSERT INTO `example_orderdetails` VALUES ('419', '10404', '49', '16.00', '30', '0.05');
INSERT INTO `example_orderdetails` VALUES ('420', '10405', '3', '8.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('421', '10406', '1', '14.40', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('422', '10406', '21', '8.00', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('423', '10406', '28', '36.40', '42', '0.1');
INSERT INTO `example_orderdetails` VALUES ('424', '10406', '36', '15.20', '5', '0.1');
INSERT INTO `example_orderdetails` VALUES ('425', '10406', '40', '14.70', '2', '0.1');
INSERT INTO `example_orderdetails` VALUES ('426', '10407', '11', '16.80', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('427', '10407', '69', '28.80', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('428', '10407', '71', '17.20', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('429', '10408', '37', '20.80', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('430', '10408', '54', '5.90', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('431', '10408', '62', '39.40', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('432', '10409', '14', '18.60', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('433', '10409', '21', '8.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('434', '10410', '33', '2.00', '49', '0');
INSERT INTO `example_orderdetails` VALUES ('435', '10410', '59', '44.00', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('436', '10411', '41', '7.70', '25', '0.2');
INSERT INTO `example_orderdetails` VALUES ('437', '10411', '44', '15.50', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('438', '10411', '59', '44.00', '9', '0.2');
INSERT INTO `example_orderdetails` VALUES ('439', '10412', '14', '18.60', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('440', '10413', '1', '14.40', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('441', '10413', '62', '39.40', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('442', '10413', '76', '14.40', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('443', '10414', '19', '7.30', '18', '0.05');
INSERT INTO `example_orderdetails` VALUES ('444', '10414', '33', '2.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('445', '10415', '17', '31.20', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('446', '10415', '33', '2.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('447', '10416', '19', '7.30', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('448', '10416', '53', '26.20', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('449', '10416', '57', '15.60', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('450', '10417', '38', '210.80', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('451', '10417', '46', '9.60', '2', '0.25');
INSERT INTO `example_orderdetails` VALUES ('452', '10417', '68', '10.00', '36', '0.25');
INSERT INTO `example_orderdetails` VALUES ('453', '10417', '77', '10.40', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('454', '10418', '2', '15.20', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('455', '10418', '47', '7.60', '55', '0');
INSERT INTO `example_orderdetails` VALUES ('456', '10418', '61', '22.80', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('457', '10418', '74', '8.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('458', '10419', '60', '27.20', '60', '0.05');
INSERT INTO `example_orderdetails` VALUES ('459', '10419', '69', '28.80', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('460', '10420', '9', '77.60', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('461', '10420', '13', '4.80', '2', '0.1');
INSERT INTO `example_orderdetails` VALUES ('462', '10420', '70', '12.00', '8', '0.1');
INSERT INTO `example_orderdetails` VALUES ('463', '10420', '73', '12.00', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('464', '10421', '19', '7.30', '4', '0.15');
INSERT INTO `example_orderdetails` VALUES ('465', '10421', '26', '24.90', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('466', '10421', '53', '26.20', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('467', '10421', '77', '10.40', '10', '0.15');
INSERT INTO `example_orderdetails` VALUES ('468', '10422', '26', '24.90', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('469', '10423', '31', '10.00', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('470', '10423', '59', '44.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('471', '10424', '35', '14.40', '60', '0.2');
INSERT INTO `example_orderdetails` VALUES ('472', '10424', '38', '210.80', '49', '0.2');
INSERT INTO `example_orderdetails` VALUES ('473', '10424', '68', '10.00', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('474', '10425', '55', '19.20', '10', '0.25');
INSERT INTO `example_orderdetails` VALUES ('475', '10425', '76', '14.40', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('476', '10426', '56', '30.40', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('477', '10426', '64', '26.60', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('478', '10427', '14', '18.60', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('479', '10428', '46', '9.60', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('480', '10429', '50', '13.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('481', '10429', '63', '35.10', '35', '0.25');
INSERT INTO `example_orderdetails` VALUES ('482', '10430', '17', '31.20', '45', '0.2');
INSERT INTO `example_orderdetails` VALUES ('483', '10430', '21', '8.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('484', '10430', '56', '30.40', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('485', '10430', '59', '44.00', '70', '0.2');
INSERT INTO `example_orderdetails` VALUES ('486', '10431', '17', '31.20', '50', '0.25');
INSERT INTO `example_orderdetails` VALUES ('487', '10431', '40', '14.70', '50', '0.25');
INSERT INTO `example_orderdetails` VALUES ('488', '10431', '47', '7.60', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('489', '10432', '26', '24.90', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('490', '10432', '54', '5.90', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('491', '10433', '56', '30.40', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('492', '10434', '11', '16.80', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('493', '10434', '76', '14.40', '18', '0.15');
INSERT INTO `example_orderdetails` VALUES ('494', '10435', '2', '15.20', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('495', '10435', '22', '16.80', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('496', '10435', '72', '27.80', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('497', '10436', '46', '9.60', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('498', '10436', '56', '30.40', '40', '0.1');
INSERT INTO `example_orderdetails` VALUES ('499', '10436', '64', '26.60', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('500', '10436', '75', '6.20', '24', '0.1');
INSERT INTO `example_orderdetails` VALUES ('501', '10437', '53', '26.20', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('502', '10438', '19', '7.30', '15', '0.2');
INSERT INTO `example_orderdetails` VALUES ('503', '10438', '34', '11.20', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('504', '10438', '57', '15.60', '15', '0.2');
INSERT INTO `example_orderdetails` VALUES ('505', '10439', '12', '30.40', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('506', '10439', '16', '13.90', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('507', '10439', '64', '26.60', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('508', '10439', '74', '8.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('509', '10440', '2', '15.20', '45', '0.15');
INSERT INTO `example_orderdetails` VALUES ('510', '10440', '16', '13.90', '49', '0.15');
INSERT INTO `example_orderdetails` VALUES ('511', '10440', '29', '99.00', '24', '0.15');
INSERT INTO `example_orderdetails` VALUES ('512', '10440', '61', '22.80', '90', '0.15');
INSERT INTO `example_orderdetails` VALUES ('513', '10441', '27', '35.10', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('514', '10442', '11', '16.80', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('515', '10442', '54', '5.90', '80', '0');
INSERT INTO `example_orderdetails` VALUES ('516', '10442', '66', '13.60', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('517', '10443', '11', '16.80', '6', '0.2');
INSERT INTO `example_orderdetails` VALUES ('518', '10443', '28', '36.40', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('519', '10444', '17', '31.20', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('520', '10444', '26', '24.90', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('521', '10444', '35', '14.40', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('522', '10444', '41', '7.70', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('523', '10445', '39', '14.40', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('524', '10445', '54', '5.90', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('525', '10446', '19', '7.30', '12', '0.1');
INSERT INTO `example_orderdetails` VALUES ('526', '10446', '24', '3.60', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('527', '10446', '31', '10.00', '3', '0.1');
INSERT INTO `example_orderdetails` VALUES ('528', '10446', '52', '5.60', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('529', '10447', '19', '7.30', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('530', '10447', '65', '16.80', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('531', '10447', '71', '17.20', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('532', '10448', '26', '24.90', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('533', '10448', '40', '14.70', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('534', '10449', '10', '24.80', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('535', '10449', '52', '5.60', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('536', '10449', '62', '39.40', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('537', '10450', '10', '24.80', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('538', '10450', '54', '5.90', '6', '0.2');
INSERT INTO `example_orderdetails` VALUES ('539', '10451', '55', '19.20', '120', '0.1');
INSERT INTO `example_orderdetails` VALUES ('540', '10451', '64', '26.60', '35', '0.1');
INSERT INTO `example_orderdetails` VALUES ('541', '10451', '65', '16.80', '28', '0.1');
INSERT INTO `example_orderdetails` VALUES ('542', '10451', '77', '10.40', '55', '0.1');
INSERT INTO `example_orderdetails` VALUES ('543', '10452', '28', '36.40', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('544', '10452', '44', '15.50', '100', '0.05');
INSERT INTO `example_orderdetails` VALUES ('545', '10453', '48', '10.20', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('546', '10453', '70', '12.00', '25', '0.1');
INSERT INTO `example_orderdetails` VALUES ('547', '10454', '16', '13.90', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('548', '10454', '33', '2.00', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('549', '10454', '46', '9.60', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('550', '10455', '39', '14.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('551', '10455', '53', '26.20', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('552', '10455', '61', '22.80', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('553', '10455', '71', '17.20', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('554', '10456', '21', '8.00', '40', '0.15');
INSERT INTO `example_orderdetails` VALUES ('555', '10456', '49', '16.00', '21', '0.15');
INSERT INTO `example_orderdetails` VALUES ('556', '10457', '59', '44.00', '36', '0');
INSERT INTO `example_orderdetails` VALUES ('557', '10458', '26', '24.90', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('558', '10458', '28', '36.40', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('559', '10458', '43', '36.80', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('560', '10458', '56', '30.40', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('561', '10458', '71', '17.20', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('562', '10459', '7', '24.00', '16', '0.05');
INSERT INTO `example_orderdetails` VALUES ('563', '10459', '46', '9.60', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('564', '10459', '72', '27.80', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('565', '10460', '68', '10.00', '21', '0.25');
INSERT INTO `example_orderdetails` VALUES ('566', '10460', '75', '6.20', '4', '0.25');
INSERT INTO `example_orderdetails` VALUES ('567', '10461', '21', '8.00', '40', '0.25');
INSERT INTO `example_orderdetails` VALUES ('568', '10461', '30', '20.70', '28', '0.25');
INSERT INTO `example_orderdetails` VALUES ('569', '10461', '55', '19.20', '60', '0.25');
INSERT INTO `example_orderdetails` VALUES ('570', '10462', '13', '4.80', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('571', '10462', '23', '7.20', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('572', '10463', '19', '7.30', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('573', '10463', '42', '11.20', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('574', '10464', '4', '17.60', '16', '0.2');
INSERT INTO `example_orderdetails` VALUES ('575', '10464', '43', '36.80', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('576', '10464', '56', '30.40', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('577', '10464', '60', '27.20', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('578', '10465', '24', '3.60', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('579', '10465', '29', '99.00', '18', '0.1');
INSERT INTO `example_orderdetails` VALUES ('580', '10465', '40', '14.70', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('581', '10465', '45', '7.60', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('582', '10465', '50', '13.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('583', '10466', '11', '16.80', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('584', '10466', '46', '9.60', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('585', '10467', '24', '3.60', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('586', '10467', '25', '11.20', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('587', '10468', '30', '20.70', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('588', '10468', '43', '36.80', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('589', '10469', '2', '15.20', '40', '0.15');
INSERT INTO `example_orderdetails` VALUES ('590', '10469', '16', '13.90', '35', '0.15');
INSERT INTO `example_orderdetails` VALUES ('591', '10469', '44', '15.50', '2', '0.15');
INSERT INTO `example_orderdetails` VALUES ('592', '10470', '18', '50.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('593', '10470', '23', '7.20', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('594', '10470', '64', '26.60', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('595', '10471', '7', '24.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('596', '10471', '56', '30.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('597', '10472', '24', '3.60', '80', '0.05');
INSERT INTO `example_orderdetails` VALUES ('598', '10472', '51', '42.40', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('599', '10473', '33', '2.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('600', '10473', '71', '17.20', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('601', '10474', '14', '18.60', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('602', '10474', '28', '36.40', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('603', '10474', '40', '14.70', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('604', '10474', '75', '6.20', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('605', '10475', '31', '10.00', '35', '0.15');
INSERT INTO `example_orderdetails` VALUES ('606', '10475', '66', '13.60', '60', '0.15');
INSERT INTO `example_orderdetails` VALUES ('607', '10475', '76', '14.40', '42', '0.15');
INSERT INTO `example_orderdetails` VALUES ('608', '10476', '55', '19.20', '2', '0.05');
INSERT INTO `example_orderdetails` VALUES ('609', '10476', '70', '12.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('610', '10477', '1', '14.40', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('611', '10477', '21', '8.00', '21', '0.25');
INSERT INTO `example_orderdetails` VALUES ('612', '10477', '39', '14.40', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('613', '10478', '10', '24.80', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('614', '10479', '38', '210.80', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('615', '10479', '53', '26.20', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('616', '10479', '59', '44.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('617', '10479', '64', '26.60', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('618', '10480', '47', '7.60', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('619', '10480', '59', '44.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('620', '10481', '49', '16.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('621', '10481', '60', '27.20', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('622', '10482', '40', '14.70', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('623', '10483', '34', '11.20', '35', '0.05');
INSERT INTO `example_orderdetails` VALUES ('624', '10483', '77', '10.40', '30', '0.05');
INSERT INTO `example_orderdetails` VALUES ('625', '10484', '21', '8.00', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('626', '10484', '40', '14.70', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('627', '10484', '51', '42.40', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('628', '10485', '2', '15.20', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('629', '10485', '3', '8.00', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('630', '10485', '55', '19.20', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('631', '10485', '70', '12.00', '60', '0.1');
INSERT INTO `example_orderdetails` VALUES ('632', '10486', '11', '16.80', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('633', '10486', '51', '42.40', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('634', '10486', '74', '8.00', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('635', '10487', '19', '7.30', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('636', '10487', '26', '24.90', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('637', '10487', '54', '5.90', '24', '0.25');
INSERT INTO `example_orderdetails` VALUES ('638', '10488', '59', '44.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('639', '10488', '73', '12.00', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('640', '10489', '11', '16.80', '15', '0.25');
INSERT INTO `example_orderdetails` VALUES ('641', '10489', '16', '13.90', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('642', '10490', '59', '44.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('643', '10490', '68', '10.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('644', '10490', '75', '6.20', '36', '0');
INSERT INTO `example_orderdetails` VALUES ('645', '10491', '44', '15.50', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('646', '10491', '77', '10.40', '7', '0.15');
INSERT INTO `example_orderdetails` VALUES ('647', '10492', '25', '11.20', '60', '0.05');
INSERT INTO `example_orderdetails` VALUES ('648', '10492', '42', '11.20', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('649', '10493', '65', '16.80', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('650', '10493', '66', '13.60', '10', '0.1');
INSERT INTO `example_orderdetails` VALUES ('651', '10493', '69', '28.80', '10', '0.1');
INSERT INTO `example_orderdetails` VALUES ('652', '10494', '56', '30.40', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('653', '10495', '23', '7.20', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('654', '10495', '41', '7.70', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('655', '10495', '77', '10.40', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('656', '10496', '31', '10.00', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('657', '10497', '56', '30.40', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('658', '10497', '72', '27.80', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('659', '10497', '77', '10.40', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('660', '10498', '24', '4.50', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('661', '10498', '40', '18.40', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('662', '10498', '42', '14.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('663', '10499', '28', '45.60', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('664', '10499', '49', '20.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('665', '10500', '15', '15.50', '12', '0.05');
INSERT INTO `example_orderdetails` VALUES ('666', '10500', '28', '45.60', '8', '0.05');
INSERT INTO `example_orderdetails` VALUES ('667', '10501', '54', '7.45', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('668', '10502', '45', '9.50', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('669', '10502', '53', '32.80', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('670', '10502', '67', '14.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('671', '10503', '14', '23.25', '70', '0');
INSERT INTO `example_orderdetails` VALUES ('672', '10503', '65', '21.05', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('673', '10504', '2', '19.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('674', '10504', '21', '10.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('675', '10504', '53', '32.80', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('676', '10504', '61', '28.50', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('677', '10505', '62', '49.30', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('678', '10506', '25', '14.00', '18', '0.1');
INSERT INTO `example_orderdetails` VALUES ('679', '10506', '70', '15.00', '14', '0.1');
INSERT INTO `example_orderdetails` VALUES ('680', '10507', '43', '46.00', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('681', '10507', '48', '12.75', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('682', '10508', '13', '6.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('683', '10508', '39', '18.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('684', '10509', '28', '45.60', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('685', '10510', '29', '123.79', '36', '0');
INSERT INTO `example_orderdetails` VALUES ('686', '10510', '75', '7.75', '36', '0.1');
INSERT INTO `example_orderdetails` VALUES ('687', '10511', '4', '22.00', '50', '0.15');
INSERT INTO `example_orderdetails` VALUES ('688', '10511', '7', '30.00', '50', '0.15');
INSERT INTO `example_orderdetails` VALUES ('689', '10511', '8', '40.00', '10', '0.15');
INSERT INTO `example_orderdetails` VALUES ('690', '10512', '24', '4.50', '10', '0.15');
INSERT INTO `example_orderdetails` VALUES ('691', '10512', '46', '12.00', '9', '0.15');
INSERT INTO `example_orderdetails` VALUES ('692', '10512', '47', '9.50', '6', '0.15');
INSERT INTO `example_orderdetails` VALUES ('693', '10512', '60', '34.00', '12', '0.15');
INSERT INTO `example_orderdetails` VALUES ('694', '10513', '21', '10.00', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('695', '10513', '32', '32.00', '50', '0.2');
INSERT INTO `example_orderdetails` VALUES ('696', '10513', '61', '28.50', '15', '0.2');
INSERT INTO `example_orderdetails` VALUES ('697', '10514', '20', '81.00', '39', '0');
INSERT INTO `example_orderdetails` VALUES ('698', '10514', '28', '45.60', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('699', '10514', '56', '38.00', '70', '0');
INSERT INTO `example_orderdetails` VALUES ('700', '10514', '65', '21.05', '39', '0');
INSERT INTO `example_orderdetails` VALUES ('701', '10514', '75', '7.75', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('702', '10515', '9', '97.00', '16', '0.15');
INSERT INTO `example_orderdetails` VALUES ('703', '10515', '16', '17.45', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('704', '10515', '27', '43.90', '120', '0');
INSERT INTO `example_orderdetails` VALUES ('705', '10515', '33', '2.50', '16', '0.15');
INSERT INTO `example_orderdetails` VALUES ('706', '10515', '60', '34.00', '84', '0.15');
INSERT INTO `example_orderdetails` VALUES ('707', '10516', '18', '62.50', '25', '0.1');
INSERT INTO `example_orderdetails` VALUES ('708', '10516', '41', '9.65', '80', '0.1');
INSERT INTO `example_orderdetails` VALUES ('709', '10516', '42', '14.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('710', '10517', '52', '7.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('711', '10517', '59', '55.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('712', '10517', '70', '15.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('713', '10518', '24', '4.50', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('714', '10518', '38', '263.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('715', '10518', '44', '19.45', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('716', '10519', '10', '31.00', '16', '0.05');
INSERT INTO `example_orderdetails` VALUES ('717', '10519', '56', '38.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('718', '10519', '60', '34.00', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('719', '10520', '24', '4.50', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('720', '10520', '53', '32.80', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('721', '10521', '35', '18.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('722', '10521', '41', '9.65', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('723', '10521', '68', '12.50', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('724', '10522', '1', '18.00', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('725', '10522', '8', '40.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('726', '10522', '30', '25.89', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('727', '10522', '40', '18.40', '25', '0.2');
INSERT INTO `example_orderdetails` VALUES ('728', '10523', '17', '39.00', '25', '0.1');
INSERT INTO `example_orderdetails` VALUES ('729', '10523', '20', '81.00', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('730', '10523', '37', '26.00', '18', '0.1');
INSERT INTO `example_orderdetails` VALUES ('731', '10523', '41', '9.65', '6', '0.1');
INSERT INTO `example_orderdetails` VALUES ('732', '10524', '10', '31.00', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('733', '10524', '30', '25.89', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('734', '10524', '43', '46.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('735', '10524', '54', '7.45', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('736', '10525', '36', '19.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('737', '10525', '40', '18.40', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('738', '10526', '1', '18.00', '8', '0.15');
INSERT INTO `example_orderdetails` VALUES ('739', '10526', '13', '6.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('740', '10526', '56', '38.00', '30', '0.15');
INSERT INTO `example_orderdetails` VALUES ('741', '10527', '4', '22.00', '50', '0.1');
INSERT INTO `example_orderdetails` VALUES ('742', '10527', '36', '19.00', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('743', '10528', '11', '21.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('744', '10528', '33', '2.50', '8', '0.2');
INSERT INTO `example_orderdetails` VALUES ('745', '10528', '72', '34.80', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('746', '10529', '55', '24.00', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('747', '10529', '68', '12.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('748', '10529', '69', '36.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('749', '10530', '17', '39.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('750', '10530', '43', '46.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('751', '10530', '61', '28.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('752', '10530', '76', '18.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('753', '10531', '59', '55.00', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('754', '10532', '30', '25.89', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('755', '10532', '66', '17.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('756', '10533', '4', '22.00', '50', '0.05');
INSERT INTO `example_orderdetails` VALUES ('757', '10533', '72', '34.80', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('758', '10533', '73', '15.00', '24', '0.05');
INSERT INTO `example_orderdetails` VALUES ('759', '10534', '30', '25.89', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('760', '10534', '40', '18.40', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('761', '10534', '54', '7.45', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('762', '10535', '11', '21.00', '50', '0.1');
INSERT INTO `example_orderdetails` VALUES ('763', '10535', '40', '18.40', '10', '0.1');
INSERT INTO `example_orderdetails` VALUES ('764', '10535', '57', '19.50', '5', '0.1');
INSERT INTO `example_orderdetails` VALUES ('765', '10535', '59', '55.00', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('766', '10536', '12', '38.00', '15', '0.25');
INSERT INTO `example_orderdetails` VALUES ('767', '10536', '31', '12.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('768', '10536', '33', '2.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('769', '10536', '60', '34.00', '35', '0.25');
INSERT INTO `example_orderdetails` VALUES ('770', '10537', '31', '12.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('771', '10537', '51', '53.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('772', '10537', '58', '13.25', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('773', '10537', '72', '34.80', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('774', '10537', '73', '15.00', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('775', '10538', '70', '15.00', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('776', '10538', '72', '34.80', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('777', '10539', '13', '6.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('778', '10539', '21', '10.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('779', '10539', '33', '2.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('780', '10539', '49', '20.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('781', '10540', '3', '10.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('782', '10540', '26', '31.23', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('783', '10540', '38', '263.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('784', '10540', '68', '12.50', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('785', '10541', '24', '4.50', '35', '0.1');
INSERT INTO `example_orderdetails` VALUES ('786', '10541', '38', '263.50', '4', '0.1');
INSERT INTO `example_orderdetails` VALUES ('787', '10541', '65', '21.05', '36', '0.1');
INSERT INTO `example_orderdetails` VALUES ('788', '10541', '71', '21.50', '9', '0.1');
INSERT INTO `example_orderdetails` VALUES ('789', '10542', '11', '21.00', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('790', '10542', '54', '7.45', '24', '0.05');
INSERT INTO `example_orderdetails` VALUES ('791', '10543', '12', '38.00', '30', '0.15');
INSERT INTO `example_orderdetails` VALUES ('792', '10543', '23', '9.00', '70', '0.15');
INSERT INTO `example_orderdetails` VALUES ('793', '10544', '28', '45.60', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('794', '10544', '67', '14.00', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('795', '10545', '11', '21.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('796', '10546', '7', '30.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('797', '10546', '35', '18.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('798', '10546', '62', '49.30', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('799', '10547', '32', '32.00', '24', '0.15');
INSERT INTO `example_orderdetails` VALUES ('800', '10547', '36', '19.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('801', '10548', '34', '14.00', '10', '0.25');
INSERT INTO `example_orderdetails` VALUES ('802', '10548', '41', '9.65', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('803', '10549', '31', '12.50', '55', '0.15');
INSERT INTO `example_orderdetails` VALUES ('804', '10549', '45', '9.50', '100', '0.15');
INSERT INTO `example_orderdetails` VALUES ('805', '10549', '51', '53.00', '48', '0.15');
INSERT INTO `example_orderdetails` VALUES ('806', '10550', '17', '39.00', '8', '0.1');
INSERT INTO `example_orderdetails` VALUES ('807', '10550', '19', '9.20', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('808', '10550', '21', '10.00', '6', '0.1');
INSERT INTO `example_orderdetails` VALUES ('809', '10550', '61', '28.50', '10', '0.1');
INSERT INTO `example_orderdetails` VALUES ('810', '10551', '16', '17.45', '40', '0.15');
INSERT INTO `example_orderdetails` VALUES ('811', '10551', '35', '18.00', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('812', '10551', '44', '19.45', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('813', '10552', '69', '36.00', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('814', '10552', '75', '7.75', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('815', '10553', '11', '21.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('816', '10553', '16', '17.45', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('817', '10553', '22', '21.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('818', '10553', '31', '12.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('819', '10553', '35', '18.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('820', '10554', '16', '17.45', '30', '0.05');
INSERT INTO `example_orderdetails` VALUES ('821', '10554', '23', '9.00', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('822', '10554', '62', '49.30', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('823', '10554', '77', '13.00', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('824', '10555', '14', '23.25', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('825', '10555', '19', '9.20', '35', '0.2');
INSERT INTO `example_orderdetails` VALUES ('826', '10555', '24', '4.50', '18', '0.2');
INSERT INTO `example_orderdetails` VALUES ('827', '10555', '51', '53.00', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('828', '10555', '56', '38.00', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('829', '10556', '72', '34.80', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('830', '10557', '64', '33.25', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('831', '10557', '75', '7.75', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('832', '10558', '47', '9.50', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('833', '10558', '51', '53.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('834', '10558', '52', '7.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('835', '10558', '53', '32.80', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('836', '10558', '73', '15.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('837', '10559', '41', '9.65', '12', '0.05');
INSERT INTO `example_orderdetails` VALUES ('838', '10559', '55', '24.00', '18', '0.05');
INSERT INTO `example_orderdetails` VALUES ('839', '10560', '30', '25.89', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('840', '10560', '62', '49.30', '15', '0.25');
INSERT INTO `example_orderdetails` VALUES ('841', '10561', '44', '19.45', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('842', '10561', '51', '53.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('843', '10562', '33', '2.50', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('844', '10562', '62', '49.30', '10', '0.1');
INSERT INTO `example_orderdetails` VALUES ('845', '10563', '36', '19.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('846', '10563', '52', '7.00', '70', '0');
INSERT INTO `example_orderdetails` VALUES ('847', '10564', '17', '39.00', '16', '0.05');
INSERT INTO `example_orderdetails` VALUES ('848', '10564', '31', '12.50', '6', '0.05');
INSERT INTO `example_orderdetails` VALUES ('849', '10564', '55', '24.00', '25', '0.05');
INSERT INTO `example_orderdetails` VALUES ('850', '10565', '24', '4.50', '25', '0.1');
INSERT INTO `example_orderdetails` VALUES ('851', '10565', '64', '33.25', '18', '0.1');
INSERT INTO `example_orderdetails` VALUES ('852', '10566', '11', '21.00', '35', '0.15');
INSERT INTO `example_orderdetails` VALUES ('853', '10566', '18', '62.50', '18', '0.15');
INSERT INTO `example_orderdetails` VALUES ('854', '10566', '76', '18.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('855', '10567', '31', '12.50', '60', '0.2');
INSERT INTO `example_orderdetails` VALUES ('856', '10567', '51', '53.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('857', '10567', '59', '55.00', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('858', '10568', '10', '31.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('859', '10569', '31', '12.50', '35', '0.2');
INSERT INTO `example_orderdetails` VALUES ('860', '10569', '76', '18.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('861', '10570', '11', '21.00', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('862', '10570', '56', '38.00', '60', '0.05');
INSERT INTO `example_orderdetails` VALUES ('863', '10571', '14', '23.25', '11', '0.15');
INSERT INTO `example_orderdetails` VALUES ('864', '10571', '42', '14.00', '28', '0.15');
INSERT INTO `example_orderdetails` VALUES ('865', '10572', '16', '17.45', '12', '0.1');
INSERT INTO `example_orderdetails` VALUES ('866', '10572', '32', '32.00', '10', '0.1');
INSERT INTO `example_orderdetails` VALUES ('867', '10572', '40', '18.40', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('868', '10572', '75', '7.75', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('869', '10573', '17', '39.00', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('870', '10573', '34', '14.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('871', '10573', '53', '32.80', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('872', '10574', '33', '2.50', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('873', '10574', '40', '18.40', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('874', '10574', '62', '49.30', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('875', '10574', '64', '33.25', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('876', '10575', '59', '55.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('877', '10575', '63', '43.90', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('878', '10575', '72', '34.80', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('879', '10575', '76', '18.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('880', '10576', '1', '18.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('881', '10576', '31', '12.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('882', '10576', '44', '19.45', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('883', '10577', '39', '18.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('884', '10577', '75', '7.75', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('885', '10577', '77', '13.00', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('886', '10578', '35', '18.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('887', '10578', '57', '19.50', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('888', '10579', '15', '15.50', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('889', '10579', '75', '7.75', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('890', '10580', '14', '23.25', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('891', '10580', '41', '9.65', '9', '0.05');
INSERT INTO `example_orderdetails` VALUES ('892', '10580', '65', '21.05', '30', '0.05');
INSERT INTO `example_orderdetails` VALUES ('893', '10581', '75', '7.75', '50', '0.2');
INSERT INTO `example_orderdetails` VALUES ('894', '10582', '57', '19.50', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('895', '10582', '76', '18.00', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('896', '10583', '29', '123.79', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('897', '10583', '60', '34.00', '24', '0.15');
INSERT INTO `example_orderdetails` VALUES ('898', '10583', '69', '36.00', '10', '0.15');
INSERT INTO `example_orderdetails` VALUES ('899', '10584', '31', '12.50', '50', '0.05');
INSERT INTO `example_orderdetails` VALUES ('900', '10585', '47', '9.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('901', '10586', '52', '7.00', '4', '0.15');
INSERT INTO `example_orderdetails` VALUES ('902', '10587', '26', '31.23', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('903', '10587', '35', '18.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('904', '10587', '77', '13.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('905', '10588', '18', '62.50', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('906', '10588', '42', '14.00', '100', '0.2');
INSERT INTO `example_orderdetails` VALUES ('907', '10589', '35', '18.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('908', '10590', '1', '18.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('909', '10590', '77', '13.00', '60', '0.05');
INSERT INTO `example_orderdetails` VALUES ('910', '10591', '3', '10.00', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('911', '10591', '7', '30.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('912', '10591', '54', '7.45', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('913', '10592', '15', '15.50', '25', '0.05');
INSERT INTO `example_orderdetails` VALUES ('914', '10592', '26', '31.23', '5', '0.05');
INSERT INTO `example_orderdetails` VALUES ('915', '10593', '20', '81.00', '21', '0.2');
INSERT INTO `example_orderdetails` VALUES ('916', '10593', '69', '36.00', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('917', '10593', '76', '18.00', '4', '0.2');
INSERT INTO `example_orderdetails` VALUES ('918', '10594', '52', '7.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('919', '10594', '58', '13.25', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('920', '10595', '35', '18.00', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('921', '10595', '61', '28.50', '120', '0.25');
INSERT INTO `example_orderdetails` VALUES ('922', '10595', '69', '36.00', '65', '0.25');
INSERT INTO `example_orderdetails` VALUES ('923', '10596', '56', '38.00', '5', '0.2');
INSERT INTO `example_orderdetails` VALUES ('924', '10596', '63', '43.90', '24', '0.2');
INSERT INTO `example_orderdetails` VALUES ('925', '10596', '75', '7.75', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('926', '10597', '24', '4.50', '35', '0.2');
INSERT INTO `example_orderdetails` VALUES ('927', '10597', '57', '19.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('928', '10597', '65', '21.05', '12', '0.2');
INSERT INTO `example_orderdetails` VALUES ('929', '10598', '27', '43.90', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('930', '10598', '71', '21.50', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('931', '10599', '62', '49.30', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('932', '10600', '54', '7.45', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('933', '10600', '73', '15.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('934', '10601', '13', '6.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('935', '10601', '59', '55.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('936', '10602', '77', '13.00', '5', '0.25');
INSERT INTO `example_orderdetails` VALUES ('937', '10603', '22', '21.00', '48', '0');
INSERT INTO `example_orderdetails` VALUES ('938', '10603', '49', '20.00', '25', '0.05');
INSERT INTO `example_orderdetails` VALUES ('939', '10604', '48', '12.75', '6', '0.1');
INSERT INTO `example_orderdetails` VALUES ('940', '10604', '76', '18.00', '10', '0.1');
INSERT INTO `example_orderdetails` VALUES ('941', '10605', '16', '17.45', '30', '0.05');
INSERT INTO `example_orderdetails` VALUES ('942', '10605', '59', '55.00', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('943', '10605', '60', '34.00', '70', '0.05');
INSERT INTO `example_orderdetails` VALUES ('944', '10605', '71', '21.50', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('945', '10606', '4', '22.00', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('946', '10606', '55', '24.00', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('947', '10606', '62', '49.30', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('948', '10607', '7', '30.00', '45', '0');
INSERT INTO `example_orderdetails` VALUES ('949', '10607', '17', '39.00', '100', '0');
INSERT INTO `example_orderdetails` VALUES ('950', '10607', '33', '2.50', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('951', '10607', '40', '18.40', '42', '0');
INSERT INTO `example_orderdetails` VALUES ('952', '10607', '72', '34.80', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('953', '10608', '56', '38.00', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('954', '10609', '1', '18.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('955', '10609', '10', '31.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('956', '10609', '21', '10.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('957', '10610', '36', '19.00', '21', '0.25');
INSERT INTO `example_orderdetails` VALUES ('958', '10611', '1', '18.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('959', '10611', '2', '19.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('960', '10611', '60', '34.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('961', '10612', '10', '31.00', '70', '0');
INSERT INTO `example_orderdetails` VALUES ('962', '10612', '36', '19.00', '55', '0');
INSERT INTO `example_orderdetails` VALUES ('963', '10612', '49', '20.00', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('964', '10612', '60', '34.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('965', '10612', '76', '18.00', '80', '0');
INSERT INTO `example_orderdetails` VALUES ('966', '10613', '13', '6.00', '8', '0.1');
INSERT INTO `example_orderdetails` VALUES ('967', '10613', '75', '7.75', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('968', '10614', '11', '21.00', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('969', '10614', '21', '10.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('970', '10614', '39', '18.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('971', '10615', '55', '24.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('972', '10616', '38', '263.50', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('973', '10616', '56', '38.00', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('974', '10616', '70', '15.00', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('975', '10616', '71', '21.50', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('976', '10617', '59', '55.00', '30', '0.15');
INSERT INTO `example_orderdetails` VALUES ('977', '10618', '6', '25.00', '70', '0');
INSERT INTO `example_orderdetails` VALUES ('978', '10618', '56', '38.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('979', '10618', '68', '12.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('980', '10619', '21', '10.00', '42', '0');
INSERT INTO `example_orderdetails` VALUES ('981', '10619', '22', '21.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('982', '10620', '24', '4.50', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('983', '10620', '52', '7.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('984', '10621', '19', '9.20', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('985', '10621', '23', '9.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('986', '10621', '70', '15.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('987', '10621', '71', '21.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('988', '10622', '2', '19.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('989', '10622', '68', '12.50', '18', '0.2');
INSERT INTO `example_orderdetails` VALUES ('990', '10623', '14', '23.25', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('991', '10623', '19', '9.20', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('992', '10623', '21', '10.00', '25', '0.1');
INSERT INTO `example_orderdetails` VALUES ('993', '10623', '24', '4.50', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('994', '10623', '35', '18.00', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('995', '10624', '28', '45.60', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('996', '10624', '29', '123.79', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('997', '10624', '44', '19.45', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('998', '10625', '14', '23.25', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('999', '10625', '42', '14.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1000', '10625', '60', '34.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1001', '10626', '53', '32.80', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1002', '10626', '60', '34.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1003', '10626', '71', '21.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1004', '10627', '62', '49.30', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1005', '10627', '73', '15.00', '35', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1006', '10628', '1', '18.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1007', '10629', '29', '123.79', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1008', '10629', '64', '33.25', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('1009', '10630', '55', '24.00', '12', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1010', '10630', '76', '18.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1011', '10631', '75', '7.75', '8', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1012', '10632', '2', '19.00', '30', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1013', '10632', '33', '2.50', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1014', '10633', '12', '38.00', '36', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1015', '10633', '13', '6.00', '13', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1016', '10633', '26', '31.23', '35', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1017', '10633', '62', '49.30', '80', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1018', '10634', '7', '30.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1019', '10634', '18', '62.50', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1020', '10634', '51', '53.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1021', '10634', '75', '7.75', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1022', '10635', '4', '22.00', '10', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1023', '10635', '5', '21.35', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1024', '10635', '22', '21.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1025', '10636', '4', '22.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1026', '10636', '58', '13.25', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1027', '10637', '11', '21.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1028', '10637', '50', '16.25', '25', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1029', '10637', '56', '38.00', '60', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1030', '10638', '45', '9.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1031', '10638', '65', '21.05', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1032', '10638', '72', '34.80', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1033', '10639', '18', '62.50', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1034', '10640', '69', '36.00', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1035', '10640', '70', '15.00', '15', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1036', '10641', '2', '19.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1037', '10641', '40', '18.40', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1038', '10642', '21', '10.00', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1039', '10642', '61', '28.50', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1040', '10643', '28', '45.60', '15', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1041', '10643', '39', '18.00', '21', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1042', '10643', '46', '12.00', '2', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1043', '10644', '18', '62.50', '4', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1044', '10644', '43', '46.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1045', '10644', '46', '12.00', '21', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1046', '10645', '18', '62.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1047', '10645', '36', '19.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1048', '10646', '1', '18.00', '15', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1049', '10646', '10', '31.00', '18', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1050', '10646', '71', '21.50', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1051', '10646', '77', '13.00', '35', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1052', '10647', '19', '9.20', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1053', '10647', '39', '18.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1054', '10648', '22', '21.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1055', '10648', '24', '4.50', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1056', '10649', '28', '45.60', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1057', '10649', '72', '34.80', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1058', '10650', '30', '25.89', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1059', '10650', '53', '32.80', '25', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1060', '10650', '54', '7.45', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1061', '10651', '19', '9.20', '12', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1062', '10651', '22', '21.00', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1063', '10652', '30', '25.89', '2', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1064', '10652', '42', '14.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1065', '10653', '16', '17.45', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1066', '10653', '60', '34.00', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1067', '10654', '4', '22.00', '12', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1068', '10654', '39', '18.00', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1069', '10654', '54', '7.45', '6', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1070', '10655', '41', '9.65', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1071', '10656', '14', '23.25', '3', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1072', '10656', '44', '19.45', '28', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1073', '10656', '47', '9.50', '6', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1074', '10657', '15', '15.50', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1075', '10657', '41', '9.65', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1076', '10657', '46', '12.00', '45', '0');
INSERT INTO `example_orderdetails` VALUES ('1077', '10657', '47', '9.50', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1078', '10657', '56', '38.00', '45', '0');
INSERT INTO `example_orderdetails` VALUES ('1079', '10657', '60', '34.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1080', '10658', '21', '10.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1081', '10658', '40', '18.40', '70', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1082', '10658', '60', '34.00', '55', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1083', '10658', '77', '13.00', '70', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1084', '10659', '31', '12.50', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1085', '10659', '40', '18.40', '24', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1086', '10659', '70', '15.00', '40', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1087', '10660', '20', '81.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1088', '10661', '39', '18.00', '3', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1089', '10661', '58', '13.25', '49', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1090', '10662', '68', '12.50', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1091', '10663', '40', '18.40', '30', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1092', '10663', '42', '14.00', '30', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1093', '10663', '51', '53.00', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1094', '10664', '10', '31.00', '24', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1095', '10664', '56', '38.00', '12', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1096', '10664', '65', '21.05', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1097', '10665', '51', '53.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1098', '10665', '59', '55.00', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('1099', '10665', '76', '18.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1100', '10666', '29', '123.79', '36', '0');
INSERT INTO `example_orderdetails` VALUES ('1101', '10666', '65', '21.05', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1102', '10667', '69', '36.00', '45', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1103', '10667', '71', '21.50', '14', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1104', '10668', '31', '12.50', '8', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1105', '10668', '55', '24.00', '4', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1106', '10668', '64', '33.25', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1107', '10669', '36', '19.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1108', '10670', '23', '9.00', '32', '0');
INSERT INTO `example_orderdetails` VALUES ('1109', '10670', '46', '12.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1110', '10670', '67', '14.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1111', '10670', '73', '15.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1112', '10670', '75', '7.75', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1113', '10671', '16', '17.45', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1114', '10671', '62', '49.30', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1115', '10671', '65', '21.05', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1116', '10672', '38', '263.50', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1117', '10672', '71', '21.50', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1118', '10673', '16', '17.45', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1119', '10673', '42', '14.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1120', '10673', '43', '46.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1121', '10674', '23', '9.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1122', '10675', '14', '23.25', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1123', '10675', '53', '32.80', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1124', '10675', '58', '13.25', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1125', '10676', '10', '31.00', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1126', '10676', '19', '9.20', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('1127', '10676', '44', '19.45', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1128', '10677', '26', '31.23', '30', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1129', '10677', '33', '2.50', '8', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1130', '10678', '12', '38.00', '100', '0');
INSERT INTO `example_orderdetails` VALUES ('1131', '10678', '33', '2.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1132', '10678', '41', '9.65', '120', '0');
INSERT INTO `example_orderdetails` VALUES ('1133', '10678', '54', '7.45', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1134', '10679', '59', '55.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1135', '10680', '16', '17.45', '50', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1136', '10680', '31', '12.50', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1137', '10680', '42', '14.00', '40', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1138', '10681', '19', '9.20', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1139', '10681', '21', '10.00', '12', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1140', '10681', '64', '33.25', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('1141', '10682', '33', '2.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1142', '10682', '66', '17.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1143', '10682', '75', '7.75', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1144', '10683', '52', '7.00', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('1145', '10684', '40', '18.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1146', '10684', '47', '9.50', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1147', '10684', '60', '34.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1148', '10685', '10', '31.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1149', '10685', '41', '9.65', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1150', '10685', '47', '9.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1151', '10686', '17', '39.00', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1152', '10686', '26', '31.23', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1153', '10687', '9', '97.00', '50', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1154', '10687', '29', '123.79', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1155', '10687', '36', '19.00', '6', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1156', '10688', '10', '31.00', '18', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1157', '10688', '28', '45.60', '60', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1158', '10688', '34', '14.00', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('1159', '10689', '1', '18.00', '35', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1160', '10690', '56', '38.00', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1161', '10690', '77', '13.00', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1162', '10691', '1', '18.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1163', '10691', '29', '123.79', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1164', '10691', '43', '46.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1165', '10691', '44', '19.45', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1166', '10691', '62', '49.30', '48', '0');
INSERT INTO `example_orderdetails` VALUES ('1167', '10692', '63', '43.90', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1168', '10693', '9', '97.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1169', '10693', '54', '7.45', '60', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1170', '10693', '69', '36.00', '30', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1171', '10693', '73', '15.00', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1172', '10694', '7', '30.00', '90', '0');
INSERT INTO `example_orderdetails` VALUES ('1173', '10694', '59', '55.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1174', '10694', '70', '15.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1175', '10695', '8', '40.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1176', '10695', '12', '38.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1177', '10695', '24', '4.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1178', '10696', '17', '39.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1179', '10696', '46', '12.00', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('1180', '10697', '19', '9.20', '7', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1181', '10697', '35', '18.00', '9', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1182', '10697', '58', '13.25', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1183', '10697', '70', '15.00', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1184', '10698', '11', '21.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1185', '10698', '17', '39.00', '8', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1186', '10698', '29', '123.79', '12', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1187', '10698', '65', '21.05', '65', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1188', '10698', '70', '15.00', '8', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1189', '10699', '47', '9.50', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1190', '10700', '1', '18.00', '5', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1191', '10700', '34', '14.00', '12', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1192', '10700', '68', '12.50', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1193', '10700', '71', '21.50', '60', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1194', '10701', '59', '55.00', '42', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1195', '10701', '71', '21.50', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1196', '10701', '76', '18.00', '35', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1197', '10702', '3', '10.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1198', '10702', '76', '18.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1199', '10703', '2', '19.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1200', '10703', '59', '55.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1201', '10703', '73', '15.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1202', '10704', '4', '22.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1203', '10704', '24', '4.50', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1204', '10704', '48', '12.75', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1205', '10705', '31', '12.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1206', '10705', '32', '32.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1207', '10706', '16', '17.45', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1208', '10706', '43', '46.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1209', '10706', '59', '55.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1210', '10707', '55', '24.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1211', '10707', '57', '19.50', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1212', '10707', '70', '15.00', '28', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1213', '10708', '5', '21.35', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1214', '10708', '36', '19.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1215', '10709', '8', '40.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1216', '10709', '51', '53.00', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('1217', '10709', '60', '34.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1218', '10710', '19', '9.20', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1219', '10710', '47', '9.50', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1220', '10711', '19', '9.20', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1221', '10711', '41', '9.65', '42', '0');
INSERT INTO `example_orderdetails` VALUES ('1222', '10711', '53', '32.80', '120', '0');
INSERT INTO `example_orderdetails` VALUES ('1223', '10712', '53', '32.80', '3', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1224', '10712', '56', '38.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1225', '10713', '10', '31.00', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('1226', '10713', '26', '31.23', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1227', '10713', '45', '9.50', '110', '0');
INSERT INTO `example_orderdetails` VALUES ('1228', '10713', '46', '12.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1229', '10714', '2', '19.00', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1230', '10714', '17', '39.00', '27', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1231', '10714', '47', '9.50', '50', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1232', '10714', '56', '38.00', '18', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1233', '10714', '58', '13.25', '12', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1234', '10715', '10', '31.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1235', '10715', '71', '21.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1236', '10716', '21', '10.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1237', '10716', '51', '53.00', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('1238', '10716', '61', '28.50', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1239', '10717', '21', '10.00', '32', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1240', '10717', '54', '7.45', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1241', '10717', '69', '36.00', '25', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1242', '10718', '12', '38.00', '36', '0');
INSERT INTO `example_orderdetails` VALUES ('1243', '10718', '16', '17.45', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1244', '10718', '36', '19.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1245', '10718', '62', '49.30', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1246', '10719', '18', '62.50', '12', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1247', '10719', '30', '25.89', '3', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1248', '10719', '54', '7.45', '40', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1249', '10720', '35', '18.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1250', '10720', '71', '21.50', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1251', '10721', '44', '19.45', '50', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1252', '10722', '2', '19.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1253', '10722', '31', '12.50', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1254', '10722', '68', '12.50', '45', '0');
INSERT INTO `example_orderdetails` VALUES ('1255', '10722', '75', '7.75', '42', '0');
INSERT INTO `example_orderdetails` VALUES ('1256', '10723', '26', '31.23', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1257', '10724', '10', '31.00', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('1258', '10724', '61', '28.50', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1259', '10725', '41', '9.65', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1260', '10725', '52', '7.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1261', '10725', '55', '24.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1262', '10726', '4', '22.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1263', '10726', '11', '21.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1264', '10727', '17', '39.00', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1265', '10727', '56', '38.00', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1266', '10727', '59', '55.00', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1267', '10728', '30', '25.89', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1268', '10728', '40', '18.40', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1269', '10728', '55', '24.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1270', '10728', '60', '34.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1271', '10729', '1', '18.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1272', '10729', '21', '10.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1273', '10729', '50', '16.25', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1274', '10730', '16', '17.45', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1275', '10730', '31', '12.50', '3', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1276', '10730', '65', '21.05', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1277', '10731', '21', '10.00', '40', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1278', '10731', '51', '53.00', '30', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1279', '10732', '76', '18.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1280', '10733', '14', '23.25', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('1281', '10733', '28', '45.60', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1282', '10733', '52', '7.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1283', '10734', '6', '25.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1284', '10734', '30', '25.89', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1285', '10734', '76', '18.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1286', '10735', '61', '28.50', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1287', '10735', '77', '13.00', '2', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1288', '10736', '65', '21.05', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1289', '10736', '75', '7.75', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1290', '10737', '13', '6.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1291', '10737', '41', '9.65', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1292', '10738', '16', '17.45', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1293', '10739', '36', '19.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1294', '10739', '52', '7.00', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('1295', '10740', '28', '45.60', '5', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1296', '10740', '35', '18.00', '35', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1297', '10740', '45', '9.50', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1298', '10740', '56', '38.00', '14', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1299', '10741', '2', '19.00', '15', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1300', '10742', '3', '10.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1301', '10742', '60', '34.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1302', '10742', '72', '34.80', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1303', '10743', '46', '12.00', '28', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1304', '10744', '40', '18.40', '50', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1305', '10745', '18', '62.50', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1306', '10745', '44', '19.45', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('1307', '10745', '59', '55.00', '45', '0');
INSERT INTO `example_orderdetails` VALUES ('1308', '10745', '72', '34.80', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('1309', '10746', '13', '6.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1310', '10746', '42', '14.00', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('1311', '10746', '62', '49.30', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('1312', '10746', '69', '36.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1313', '10747', '31', '12.50', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1314', '10747', '41', '9.65', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1315', '10747', '63', '43.90', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('1316', '10747', '69', '36.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1317', '10748', '23', '9.00', '44', '0');
INSERT INTO `example_orderdetails` VALUES ('1318', '10748', '40', '18.40', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1319', '10748', '56', '38.00', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('1320', '10749', '56', '38.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1321', '10749', '59', '55.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1322', '10749', '76', '18.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1323', '10750', '14', '23.25', '5', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1324', '10750', '45', '9.50', '40', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1325', '10750', '59', '55.00', '25', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1326', '10751', '26', '31.23', '12', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1327', '10751', '30', '25.89', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1328', '10751', '50', '16.25', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1329', '10751', '73', '15.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1330', '10752', '1', '18.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1331', '10752', '69', '36.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1332', '10753', '45', '9.50', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1333', '10753', '74', '10.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1334', '10754', '40', '18.40', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1335', '10755', '47', '9.50', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1336', '10755', '56', '38.00', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1337', '10755', '57', '19.50', '14', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1338', '10755', '69', '36.00', '25', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1339', '10756', '18', '62.50', '21', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1340', '10756', '36', '19.00', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1341', '10756', '68', '12.50', '6', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1342', '10756', '69', '36.00', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1343', '10757', '34', '14.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1344', '10757', '59', '55.00', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('1345', '10757', '62', '49.30', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1346', '10757', '64', '33.25', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1347', '10758', '26', '31.23', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1348', '10758', '52', '7.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1349', '10758', '70', '15.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1350', '10759', '32', '32.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1351', '10760', '25', '14.00', '12', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1352', '10760', '27', '43.90', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1353', '10760', '43', '46.00', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1354', '10761', '25', '14.00', '35', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1355', '10761', '75', '7.75', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('1356', '10762', '39', '18.00', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('1357', '10762', '47', '9.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1358', '10762', '51', '53.00', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('1359', '10762', '56', '38.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1360', '10763', '21', '10.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1361', '10763', '22', '21.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1362', '10763', '24', '4.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1363', '10764', '3', '10.00', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1364', '10764', '39', '18.00', '130', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1365', '10765', '65', '21.05', '80', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1366', '10766', '2', '19.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1367', '10766', '7', '30.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1368', '10766', '68', '12.50', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1369', '10767', '42', '14.00', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1370', '10768', '22', '21.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1371', '10768', '31', '12.50', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1372', '10768', '60', '34.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1373', '10768', '71', '21.50', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1374', '10769', '41', '9.65', '30', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1375', '10769', '52', '7.00', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1376', '10769', '61', '28.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1377', '10769', '62', '49.30', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1378', '10770', '11', '21.00', '15', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1379', '10771', '71', '21.50', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('1380', '10772', '29', '123.79', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('1381', '10772', '59', '55.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1382', '10773', '17', '39.00', '33', '0');
INSERT INTO `example_orderdetails` VALUES ('1383', '10773', '31', '12.50', '70', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1384', '10773', '75', '7.75', '7', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1385', '10774', '31', '12.50', '2', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1386', '10774', '66', '17.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1387', '10775', '10', '31.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1388', '10775', '67', '14.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1389', '10776', '31', '12.50', '16', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1390', '10776', '42', '14.00', '12', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1391', '10776', '45', '9.50', '27', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1392', '10776', '51', '53.00', '120', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1393', '10777', '42', '14.00', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1394', '10778', '41', '9.65', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1395', '10779', '16', '17.45', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1396', '10779', '62', '49.30', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1397', '10780', '70', '15.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1398', '10780', '77', '13.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1399', '10781', '54', '7.45', '3', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1400', '10781', '56', '38.00', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1401', '10781', '74', '10.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1402', '10782', '31', '12.50', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('1403', '10783', '31', '12.50', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1404', '10783', '38', '263.50', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1405', '10784', '36', '19.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1406', '10784', '39', '18.00', '2', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1407', '10784', '72', '34.80', '30', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1408', '10785', '10', '31.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1409', '10785', '75', '7.75', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1410', '10786', '8', '40.00', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1411', '10786', '30', '25.89', '15', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1412', '10786', '75', '7.75', '42', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1413', '10787', '2', '19.00', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1414', '10787', '29', '123.79', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1415', '10788', '19', '9.20', '50', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1416', '10788', '75', '7.75', '40', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1417', '10789', '18', '62.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1418', '10789', '35', '18.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1419', '10789', '63', '43.90', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1420', '10789', '68', '12.50', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('1421', '10790', '7', '30.00', '3', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1422', '10790', '56', '38.00', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1423', '10791', '29', '123.79', '14', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1424', '10791', '41', '9.65', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1425', '10792', '2', '19.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1426', '10792', '54', '7.45', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1427', '10792', '68', '12.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1428', '10793', '41', '9.65', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('1429', '10793', '52', '7.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1430', '10794', '14', '23.25', '15', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1431', '10794', '54', '7.45', '6', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1432', '10795', '16', '17.45', '65', '0');
INSERT INTO `example_orderdetails` VALUES ('1433', '10795', '17', '39.00', '35', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1434', '10796', '26', '31.23', '21', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1435', '10796', '44', '19.45', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1436', '10796', '64', '33.25', '35', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1437', '10796', '69', '36.00', '24', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1438', '10797', '11', '21.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1439', '10798', '62', '49.30', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1440', '10798', '72', '34.80', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1441', '10799', '13', '6.00', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1442', '10799', '24', '4.50', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1443', '10799', '59', '55.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1444', '10800', '11', '21.00', '50', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1445', '10800', '51', '53.00', '10', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1446', '10800', '54', '7.45', '7', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1447', '10801', '17', '39.00', '40', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1448', '10801', '29', '123.79', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1449', '10802', '30', '25.89', '25', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1450', '10802', '51', '53.00', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1451', '10802', '55', '24.00', '60', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1452', '10802', '62', '49.30', '5', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1453', '10803', '19', '9.20', '24', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1454', '10803', '25', '14.00', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1455', '10803', '59', '55.00', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1456', '10804', '10', '31.00', '36', '0');
INSERT INTO `example_orderdetails` VALUES ('1457', '10804', '28', '45.60', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1458', '10804', '49', '20.00', '4', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1459', '10805', '34', '14.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1460', '10805', '38', '263.50', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1461', '10806', '2', '19.00', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1462', '10806', '65', '21.05', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1463', '10806', '74', '10.00', '15', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1464', '10807', '40', '18.40', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('1465', '10808', '56', '38.00', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1466', '10808', '76', '18.00', '50', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1467', '10809', '52', '7.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1468', '10810', '13', '6.00', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('1469', '10810', '25', '14.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1470', '10810', '70', '15.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1471', '10811', '19', '9.20', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1472', '10811', '23', '9.00', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('1473', '10811', '40', '18.40', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1474', '10812', '31', '12.50', '16', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1475', '10812', '72', '34.80', '40', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1476', '10812', '77', '13.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1477', '10813', '2', '19.00', '12', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1478', '10813', '46', '12.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1479', '10814', '41', '9.65', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1480', '10814', '43', '46.00', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1481', '10814', '48', '12.75', '8', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1482', '10814', '61', '28.50', '30', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1483', '10815', '33', '2.50', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('1484', '10816', '38', '263.50', '30', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1485', '10816', '62', '49.30', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1486', '10817', '26', '31.23', '40', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1487', '10817', '38', '263.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1488', '10817', '40', '18.40', '60', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1489', '10817', '62', '49.30', '25', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1490', '10818', '32', '32.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1491', '10818', '41', '9.65', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1492', '10819', '43', '46.00', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('1493', '10819', '75', '7.75', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1494', '10820', '56', '38.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1495', '10821', '35', '18.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1496', '10821', '51', '53.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1497', '10822', '62', '49.30', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1498', '10822', '70', '15.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1499', '10823', '11', '21.00', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1500', '10823', '57', '19.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1501', '10823', '59', '55.00', '40', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1502', '10823', '77', '13.00', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1503', '10824', '41', '9.65', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1504', '10824', '70', '15.00', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('1505', '10825', '26', '31.23', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1506', '10825', '53', '32.80', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1507', '10826', '31', '12.50', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1508', '10826', '57', '19.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1509', '10827', '10', '31.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1510', '10827', '39', '18.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1511', '10828', '20', '81.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1512', '10828', '38', '263.50', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1513', '10829', '2', '19.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1514', '10829', '8', '40.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1515', '10829', '13', '6.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1516', '10829', '60', '34.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1517', '10830', '6', '25.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1518', '10830', '39', '18.00', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('1519', '10830', '60', '34.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1520', '10830', '68', '12.50', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1521', '10831', '19', '9.20', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1522', '10831', '35', '18.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1523', '10831', '38', '263.50', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1524', '10831', '43', '46.00', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('1525', '10832', '13', '6.00', '3', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1526', '10832', '25', '14.00', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1527', '10832', '44', '19.45', '16', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1528', '10832', '64', '33.25', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1529', '10833', '7', '30.00', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1530', '10833', '31', '12.50', '9', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1531', '10833', '53', '32.80', '9', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1532', '10834', '29', '123.79', '8', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1533', '10834', '30', '25.89', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1534', '10835', '59', '55.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1535', '10835', '77', '13.00', '2', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1536', '10836', '22', '21.00', '52', '0');
INSERT INTO `example_orderdetails` VALUES ('1537', '10836', '35', '18.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1538', '10836', '57', '19.50', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1539', '10836', '60', '34.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1540', '10836', '64', '33.25', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1541', '10837', '13', '6.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1542', '10837', '40', '18.40', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1543', '10837', '47', '9.50', '40', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1544', '10837', '76', '18.00', '21', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1545', '10838', '1', '18.00', '4', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1546', '10838', '18', '62.50', '25', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1547', '10838', '36', '19.00', '50', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1548', '10839', '58', '13.25', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1549', '10839', '72', '34.80', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1550', '10840', '25', '14.00', '6', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1551', '10840', '39', '18.00', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1552', '10841', '10', '31.00', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('1553', '10841', '56', '38.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1554', '10841', '59', '55.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1555', '10841', '77', '13.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1556', '10842', '11', '21.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1557', '10842', '43', '46.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1558', '10842', '68', '12.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1559', '10842', '70', '15.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1560', '10843', '51', '53.00', '4', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1561', '10844', '22', '21.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1562', '10845', '23', '9.00', '70', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1563', '10845', '35', '18.00', '25', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1564', '10845', '42', '14.00', '42', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1565', '10845', '58', '13.25', '60', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1566', '10845', '64', '33.25', '48', '0');
INSERT INTO `example_orderdetails` VALUES ('1567', '10846', '4', '22.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1568', '10846', '70', '15.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1569', '10846', '74', '10.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1570', '10847', '1', '18.00', '80', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1571', '10847', '19', '9.20', '12', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1572', '10847', '37', '26.00', '60', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1573', '10847', '45', '9.50', '36', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1574', '10847', '60', '34.00', '45', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1575', '10847', '71', '21.50', '55', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1576', '10848', '5', '21.35', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1577', '10848', '9', '97.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1578', '10849', '3', '10.00', '49', '0');
INSERT INTO `example_orderdetails` VALUES ('1579', '10849', '26', '31.23', '18', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1580', '10850', '25', '14.00', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1581', '10850', '33', '2.50', '4', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1582', '10850', '70', '15.00', '30', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1583', '10851', '2', '19.00', '5', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1584', '10851', '25', '14.00', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1585', '10851', '57', '19.50', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1586', '10851', '59', '55.00', '42', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1587', '10852', '2', '19.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1588', '10852', '17', '39.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1589', '10852', '62', '49.30', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1590', '10853', '18', '62.50', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1591', '10854', '10', '31.00', '100', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1592', '10854', '13', '6.00', '65', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1593', '10855', '16', '17.45', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1594', '10855', '31', '12.50', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('1595', '10855', '56', '38.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1596', '10855', '65', '21.05', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1597', '10856', '2', '19.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1598', '10856', '42', '14.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1599', '10857', '3', '10.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1600', '10857', '26', '31.23', '35', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1601', '10857', '29', '123.79', '10', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1602', '10858', '7', '30.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1603', '10858', '27', '43.90', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1604', '10858', '70', '15.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1605', '10859', '24', '4.50', '40', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1606', '10859', '54', '7.45', '35', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1607', '10859', '64', '33.25', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1608', '10860', '51', '53.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1609', '10860', '76', '18.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1610', '10861', '17', '39.00', '42', '0');
INSERT INTO `example_orderdetails` VALUES ('1611', '10861', '18', '62.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1612', '10861', '21', '10.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1613', '10861', '33', '2.50', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1614', '10861', '62', '49.30', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1615', '10862', '11', '21.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1616', '10862', '52', '7.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1617', '10863', '1', '18.00', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1618', '10863', '58', '13.25', '12', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1619', '10864', '35', '18.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1620', '10864', '67', '14.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1621', '10865', '38', '263.50', '60', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1622', '10865', '39', '18.00', '80', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1623', '10866', '2', '19.00', '21', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1624', '10866', '24', '4.50', '6', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1625', '10866', '30', '25.89', '40', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1626', '10867', '53', '32.80', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1627', '10868', '26', '31.23', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1628', '10868', '35', '18.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1629', '10868', '49', '20.00', '42', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1630', '10869', '1', '18.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1631', '10869', '11', '21.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1632', '10869', '23', '9.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1633', '10869', '68', '12.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1634', '10870', '35', '18.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1635', '10870', '51', '53.00', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1636', '10871', '6', '25.00', '50', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1637', '10871', '16', '17.45', '12', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1638', '10871', '17', '39.00', '16', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1639', '10872', '55', '24.00', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1640', '10872', '62', '49.30', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1641', '10872', '64', '33.25', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1642', '10872', '65', '21.05', '21', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1643', '10873', '21', '10.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1644', '10873', '28', '45.60', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1645', '10874', '10', '31.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1646', '10875', '19', '9.20', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1647', '10875', '47', '9.50', '21', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1648', '10875', '49', '20.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1649', '10876', '46', '12.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1650', '10876', '64', '33.25', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1651', '10877', '16', '17.45', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1652', '10877', '18', '62.50', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1653', '10878', '20', '81.00', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1654', '10879', '40', '18.40', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1655', '10879', '65', '21.05', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1656', '10879', '76', '18.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1657', '10880', '23', '9.00', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1658', '10880', '61', '28.50', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1659', '10880', '70', '15.00', '50', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1660', '10881', '73', '15.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1661', '10882', '42', '14.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1662', '10882', '49', '20.00', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1663', '10882', '54', '7.45', '32', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1664', '10883', '24', '4.50', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1665', '10884', '21', '10.00', '40', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1666', '10884', '56', '38.00', '21', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1667', '10884', '65', '21.05', '12', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1668', '10885', '2', '19.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1669', '10885', '24', '4.50', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1670', '10885', '70', '15.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1671', '10885', '77', '13.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1672', '10886', '10', '31.00', '70', '0');
INSERT INTO `example_orderdetails` VALUES ('1673', '10886', '31', '12.50', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1674', '10886', '77', '13.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1675', '10887', '25', '14.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1676', '10888', '2', '19.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1677', '10888', '68', '12.50', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('1678', '10889', '11', '21.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1679', '10889', '38', '263.50', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1680', '10890', '17', '39.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1681', '10890', '34', '14.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1682', '10890', '41', '9.65', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('1683', '10891', '30', '25.89', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1684', '10892', '59', '55.00', '40', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1685', '10893', '8', '40.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1686', '10893', '24', '4.50', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1687', '10893', '29', '123.79', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1688', '10893', '30', '25.89', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1689', '10893', '36', '19.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1690', '10894', '13', '6.00', '28', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1691', '10894', '69', '36.00', '50', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1692', '10894', '75', '7.75', '120', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1693', '10895', '24', '4.50', '110', '0');
INSERT INTO `example_orderdetails` VALUES ('1694', '10895', '39', '18.00', '45', '0');
INSERT INTO `example_orderdetails` VALUES ('1695', '10895', '40', '18.40', '91', '0');
INSERT INTO `example_orderdetails` VALUES ('1696', '10895', '60', '34.00', '100', '0');
INSERT INTO `example_orderdetails` VALUES ('1697', '10896', '45', '9.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1698', '10896', '56', '38.00', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('1699', '10897', '29', '123.79', '80', '0');
INSERT INTO `example_orderdetails` VALUES ('1700', '10897', '30', '25.89', '36', '0');
INSERT INTO `example_orderdetails` VALUES ('1701', '10898', '13', '6.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1702', '10899', '39', '18.00', '8', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1703', '10900', '70', '15.00', '3', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1704', '10901', '41', '9.65', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1705', '10901', '71', '21.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1706', '10902', '55', '24.00', '30', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1707', '10902', '62', '49.30', '6', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1708', '10903', '13', '6.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1709', '10903', '65', '21.05', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1710', '10903', '68', '12.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1711', '10904', '58', '13.25', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1712', '10904', '62', '49.30', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1713', '10905', '1', '18.00', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1714', '10906', '61', '28.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1715', '10907', '75', '7.75', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('1716', '10908', '7', '30.00', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1717', '10908', '52', '7.00', '14', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1718', '10909', '7', '30.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1719', '10909', '16', '17.45', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1720', '10909', '41', '9.65', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1721', '10910', '19', '9.20', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1722', '10910', '49', '20.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1723', '10910', '61', '28.50', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1724', '10911', '1', '18.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1725', '10911', '17', '39.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1726', '10911', '67', '14.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1727', '10912', '11', '21.00', '40', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1728', '10912', '29', '123.79', '60', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1729', '10913', '4', '22.00', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1730', '10913', '33', '2.50', '40', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1731', '10913', '58', '13.25', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1732', '10914', '71', '21.50', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1733', '10915', '17', '39.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1734', '10915', '33', '2.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1735', '10915', '54', '7.45', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1736', '10916', '16', '17.45', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1737', '10916', '32', '32.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1738', '10916', '57', '19.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1739', '10917', '30', '25.89', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('1740', '10917', '60', '34.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1741', '10918', '1', '18.00', '60', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1742', '10918', '60', '34.00', '25', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1743', '10919', '16', '17.45', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1744', '10919', '25', '14.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1745', '10919', '40', '18.40', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1746', '10920', '50', '16.25', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1747', '10921', '35', '18.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1748', '10921', '63', '43.90', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1749', '10922', '17', '39.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1750', '10922', '24', '4.50', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1751', '10923', '42', '14.00', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1752', '10923', '43', '46.00', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1753', '10923', '67', '14.00', '24', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1754', '10924', '10', '31.00', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1755', '10924', '28', '45.60', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1756', '10924', '75', '7.75', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1757', '10925', '36', '19.00', '25', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1758', '10925', '52', '7.00', '12', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1759', '10926', '11', '21.00', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1760', '10926', '13', '6.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1761', '10926', '19', '9.20', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('1762', '10926', '72', '34.80', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1763', '10927', '20', '81.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1764', '10927', '52', '7.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1765', '10927', '76', '18.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1766', '10928', '47', '9.50', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1767', '10928', '76', '18.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1768', '10929', '21', '10.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1769', '10929', '75', '7.75', '49', '0');
INSERT INTO `example_orderdetails` VALUES ('1770', '10929', '77', '13.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1771', '10930', '21', '10.00', '36', '0');
INSERT INTO `example_orderdetails` VALUES ('1772', '10930', '27', '43.90', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1773', '10930', '55', '24.00', '25', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1774', '10930', '58', '13.25', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1775', '10931', '13', '6.00', '42', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1776', '10931', '57', '19.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1777', '10932', '16', '17.45', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1778', '10932', '62', '49.30', '14', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1779', '10932', '72', '34.80', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('1780', '10932', '75', '7.75', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1781', '10933', '53', '32.80', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1782', '10933', '61', '28.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1783', '10934', '6', '25.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1784', '10935', '1', '18.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1785', '10935', '18', '62.50', '4', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1786', '10935', '23', '9.00', '8', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1787', '10936', '36', '19.00', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1788', '10937', '28', '45.60', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1789', '10937', '34', '14.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1790', '10938', '13', '6.00', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1791', '10938', '43', '46.00', '24', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1792', '10938', '60', '34.00', '49', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1793', '10938', '71', '21.50', '35', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1794', '10939', '2', '19.00', '10', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1795', '10939', '67', '14.00', '40', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1796', '10940', '7', '30.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1797', '10940', '13', '6.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1798', '10941', '31', '12.50', '44', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1799', '10941', '62', '49.30', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1800', '10941', '68', '12.50', '80', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1801', '10941', '72', '34.80', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1802', '10942', '49', '20.00', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('1803', '10943', '13', '6.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1804', '10943', '22', '21.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1805', '10943', '46', '12.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1806', '10944', '11', '21.00', '5', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1807', '10944', '44', '19.45', '18', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1808', '10944', '56', '38.00', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('1809', '10945', '13', '6.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1810', '10945', '31', '12.50', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1811', '10946', '10', '31.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1812', '10946', '24', '4.50', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1813', '10946', '77', '13.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1814', '10947', '59', '55.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1815', '10948', '50', '16.25', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('1816', '10948', '51', '53.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1817', '10948', '55', '24.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1818', '10949', '6', '25.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1819', '10949', '10', '31.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1820', '10949', '17', '39.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1821', '10949', '62', '49.30', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1822', '10950', '4', '22.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1823', '10951', '33', '2.50', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1824', '10951', '41', '9.65', '6', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1825', '10951', '75', '7.75', '50', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1826', '10952', '6', '25.00', '16', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1827', '10952', '28', '45.60', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1828', '10953', '20', '81.00', '50', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1829', '10953', '31', '12.50', '50', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1830', '10954', '16', '17.45', '28', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1831', '10954', '31', '12.50', '25', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1832', '10954', '45', '9.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1833', '10954', '60', '34.00', '24', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1834', '10955', '75', '7.75', '12', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1835', '10956', '21', '10.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1836', '10956', '47', '9.50', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('1837', '10956', '51', '53.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1838', '10957', '30', '25.89', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1839', '10957', '35', '18.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1840', '10957', '64', '33.25', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1841', '10958', '5', '21.35', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1842', '10958', '7', '30.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1843', '10958', '72', '34.80', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1844', '10959', '75', '7.75', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1845', '10960', '24', '4.50', '10', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1846', '10960', '41', '9.65', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1847', '10961', '52', '7.00', '6', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1848', '10961', '76', '18.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1849', '10962', '7', '30.00', '45', '0');
INSERT INTO `example_orderdetails` VALUES ('1850', '10962', '13', '6.00', '77', '0');
INSERT INTO `example_orderdetails` VALUES ('1851', '10962', '53', '32.80', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1852', '10962', '69', '36.00', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('1853', '10962', '76', '18.00', '44', '0');
INSERT INTO `example_orderdetails` VALUES ('1854', '10963', '60', '34.00', '2', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1855', '10964', '18', '62.50', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1856', '10964', '38', '263.50', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1857', '10964', '69', '36.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1858', '10965', '51', '53.00', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('1859', '10966', '37', '26.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1860', '10966', '56', '38.00', '12', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1861', '10966', '62', '49.30', '12', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1862', '10967', '19', '9.20', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1863', '10967', '49', '20.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1864', '10968', '12', '38.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1865', '10968', '24', '4.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1866', '10968', '64', '33.25', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1867', '10969', '46', '12.00', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('1868', '10970', '52', '7.00', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1869', '10971', '29', '123.79', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('1870', '10972', '17', '39.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1871', '10972', '33', '2.50', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('1872', '10973', '26', '31.23', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1873', '10973', '41', '9.65', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1874', '10973', '75', '7.75', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1875', '10974', '63', '43.90', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1876', '10975', '8', '40.00', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('1877', '10975', '75', '7.75', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1878', '10976', '28', '45.60', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1879', '10977', '39', '18.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1880', '10977', '47', '9.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1881', '10977', '51', '53.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1882', '10977', '63', '43.90', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1883', '10978', '8', '40.00', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1884', '10978', '21', '10.00', '40', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1885', '10978', '40', '18.40', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1886', '10978', '44', '19.45', '6', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1887', '10979', '7', '30.00', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('1888', '10979', '12', '38.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1889', '10979', '24', '4.50', '80', '0');
INSERT INTO `example_orderdetails` VALUES ('1890', '10979', '27', '43.90', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1891', '10979', '31', '12.50', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('1892', '10979', '63', '43.90', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('1893', '10980', '75', '7.75', '40', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1894', '10981', '38', '263.50', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1895', '10982', '7', '30.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1896', '10982', '43', '46.00', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('1897', '10983', '13', '6.00', '84', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1898', '10983', '57', '19.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1899', '10984', '16', '17.45', '55', '0');
INSERT INTO `example_orderdetails` VALUES ('1900', '10984', '24', '4.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1901', '10984', '36', '19.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1902', '10985', '16', '17.45', '36', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1903', '10985', '18', '62.50', '8', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1904', '10985', '32', '32.00', '35', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1905', '10986', '11', '21.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1906', '10986', '20', '81.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1907', '10986', '76', '18.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1908', '10986', '77', '13.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1909', '10987', '7', '30.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1910', '10987', '43', '46.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1911', '10987', '72', '34.80', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1912', '10988', '7', '30.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1913', '10988', '62', '49.30', '40', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1914', '10989', '6', '25.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1915', '10989', '11', '21.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1916', '10989', '41', '9.65', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1917', '10990', '21', '10.00', '65', '0');
INSERT INTO `example_orderdetails` VALUES ('1918', '10990', '34', '14.00', '60', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1919', '10990', '55', '24.00', '65', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1920', '10990', '61', '28.50', '66', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1921', '10991', '2', '19.00', '50', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1922', '10991', '70', '15.00', '20', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1923', '10991', '76', '18.00', '90', '0.2');
INSERT INTO `example_orderdetails` VALUES ('1924', '10992', '72', '34.80', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1925', '10993', '29', '123.79', '50', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1926', '10993', '41', '9.65', '35', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1927', '10994', '59', '55.00', '18', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1928', '10995', '51', '53.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1929', '10995', '60', '34.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1930', '10996', '42', '14.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1931', '10997', '32', '32.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('1932', '10997', '46', '12.00', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1933', '10997', '52', '7.00', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1934', '10998', '24', '4.50', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1935', '10998', '61', '28.50', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('1936', '10998', '74', '10.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1937', '10998', '75', '7.75', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1938', '10999', '41', '9.65', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1939', '10999', '51', '53.00', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1940', '10999', '77', '13.00', '21', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1941', '11000', '4', '22.00', '25', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1942', '11000', '24', '4.50', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1943', '11000', '77', '13.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1944', '11001', '7', '30.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('1945', '11001', '22', '21.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1946', '11001', '46', '12.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1947', '11001', '55', '24.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1948', '11002', '13', '6.00', '56', '0');
INSERT INTO `example_orderdetails` VALUES ('1949', '11002', '35', '18.00', '15', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1950', '11002', '42', '14.00', '24', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1951', '11002', '55', '24.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('1952', '11003', '1', '18.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1953', '11003', '40', '18.40', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1954', '11003', '52', '7.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1955', '11004', '26', '31.23', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1956', '11004', '76', '18.00', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('1957', '11005', '1', '18.00', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1958', '11005', '59', '55.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1959', '11006', '1', '18.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('1960', '11006', '29', '123.79', '2', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1961', '11007', '8', '40.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1962', '11007', '29', '123.79', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1963', '11007', '42', '14.00', '14', '0');
INSERT INTO `example_orderdetails` VALUES ('1964', '11008', '28', '45.60', '70', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1965', '11008', '34', '14.00', '90', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1966', '11008', '71', '21.50', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('1967', '11009', '24', '4.50', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('1968', '11009', '36', '19.00', '18', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1969', '11009', '60', '34.00', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('1970', '11010', '7', '30.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1971', '11010', '24', '4.50', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1972', '11011', '58', '13.25', '40', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1973', '11011', '71', '21.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1974', '11012', '19', '9.20', '50', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1975', '11012', '60', '34.00', '36', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1976', '11012', '71', '21.50', '60', '0.05');
INSERT INTO `example_orderdetails` VALUES ('1977', '11013', '23', '9.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1978', '11013', '42', '14.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('1979', '11013', '45', '9.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1980', '11013', '68', '12.50', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1981', '11014', '41', '9.65', '28', '0.1');
INSERT INTO `example_orderdetails` VALUES ('1982', '11015', '30', '25.89', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1983', '11015', '77', '13.00', '18', '0');
INSERT INTO `example_orderdetails` VALUES ('1984', '11016', '31', '12.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1985', '11016', '36', '19.00', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('1986', '11017', '3', '10.00', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('1987', '11017', '59', '55.00', '110', '0');
INSERT INTO `example_orderdetails` VALUES ('1988', '11017', '70', '15.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('1989', '11018', '12', '38.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('1990', '11018', '18', '62.50', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('1991', '11018', '56', '38.00', '5', '0');
INSERT INTO `example_orderdetails` VALUES ('1992', '11019', '46', '12.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('1993', '11019', '49', '20.00', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('1994', '11020', '10', '31.00', '24', '0.15');
INSERT INTO `example_orderdetails` VALUES ('1995', '11021', '2', '19.00', '11', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1996', '11021', '20', '81.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('1997', '11021', '26', '31.23', '63', '0');
INSERT INTO `example_orderdetails` VALUES ('1998', '11021', '51', '53.00', '44', '0.25');
INSERT INTO `example_orderdetails` VALUES ('1999', '11021', '72', '34.80', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('2000', '11022', '19', '9.20', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('2001', '11022', '69', '36.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('2002', '11023', '7', '30.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('2003', '11023', '43', '46.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('2004', '11024', '26', '31.23', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('2005', '11024', '33', '2.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('2006', '11024', '65', '21.05', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('2007', '11024', '71', '21.50', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('2008', '11025', '1', '18.00', '10', '0.1');
INSERT INTO `example_orderdetails` VALUES ('2009', '11025', '13', '6.00', '20', '0.1');
INSERT INTO `example_orderdetails` VALUES ('2010', '11026', '18', '62.50', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('2011', '11026', '51', '53.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('2012', '11027', '24', '4.50', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('2013', '11027', '62', '49.30', '21', '0.25');
INSERT INTO `example_orderdetails` VALUES ('2014', '11028', '55', '24.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('2015', '11028', '59', '55.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('2016', '11029', '56', '38.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('2017', '11029', '63', '43.90', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('2018', '11030', '2', '19.00', '100', '0.25');
INSERT INTO `example_orderdetails` VALUES ('2019', '11030', '5', '21.35', '70', '0');
INSERT INTO `example_orderdetails` VALUES ('2020', '11030', '29', '123.79', '60', '0.25');
INSERT INTO `example_orderdetails` VALUES ('2021', '11030', '59', '55.00', '100', '0.25');
INSERT INTO `example_orderdetails` VALUES ('2022', '11031', '1', '18.00', '45', '0');
INSERT INTO `example_orderdetails` VALUES ('2023', '11031', '13', '6.00', '80', '0');
INSERT INTO `example_orderdetails` VALUES ('2024', '11031', '24', '4.50', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('2025', '11031', '64', '33.25', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('2026', '11031', '71', '21.50', '16', '0');
INSERT INTO `example_orderdetails` VALUES ('2027', '11032', '36', '19.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('2028', '11032', '38', '263.50', '25', '0');
INSERT INTO `example_orderdetails` VALUES ('2029', '11032', '59', '55.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('2030', '11033', '53', '32.80', '70', '0.1');
INSERT INTO `example_orderdetails` VALUES ('2031', '11033', '69', '36.00', '36', '0.1');
INSERT INTO `example_orderdetails` VALUES ('2032', '11034', '21', '10.00', '15', '0.1');
INSERT INTO `example_orderdetails` VALUES ('2033', '11034', '44', '19.45', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('2034', '11034', '61', '28.50', '6', '0');
INSERT INTO `example_orderdetails` VALUES ('2035', '11035', '1', '18.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('2036', '11035', '35', '18.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('2037', '11035', '42', '14.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('2038', '11035', '54', '7.45', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('2039', '11036', '13', '6.00', '7', '0');
INSERT INTO `example_orderdetails` VALUES ('2040', '11036', '59', '55.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('2041', '11037', '70', '15.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('2042', '11038', '40', '18.40', '5', '0.2');
INSERT INTO `example_orderdetails` VALUES ('2043', '11038', '52', '7.00', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('2044', '11038', '71', '21.50', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('2045', '11039', '28', '45.60', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('2046', '11039', '35', '18.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('2047', '11039', '49', '20.00', '60', '0');
INSERT INTO `example_orderdetails` VALUES ('2048', '11039', '57', '19.50', '28', '0');
INSERT INTO `example_orderdetails` VALUES ('2049', '11040', '21', '10.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('2050', '11041', '2', '19.00', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('2051', '11041', '63', '43.90', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('2052', '11042', '44', '19.45', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('2053', '11042', '61', '28.50', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('2054', '11043', '11', '21.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('2055', '11044', '62', '49.30', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('2056', '11045', '33', '2.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('2057', '11045', '51', '53.00', '24', '0');
INSERT INTO `example_orderdetails` VALUES ('2058', '11046', '12', '38.00', '20', '0.05');
INSERT INTO `example_orderdetails` VALUES ('2059', '11046', '32', '32.00', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('2060', '11046', '35', '18.00', '18', '0.05');
INSERT INTO `example_orderdetails` VALUES ('2061', '11047', '1', '18.00', '25', '0.25');
INSERT INTO `example_orderdetails` VALUES ('2062', '11047', '5', '21.35', '30', '0.25');
INSERT INTO `example_orderdetails` VALUES ('2063', '11048', '68', '12.50', '42', '0');
INSERT INTO `example_orderdetails` VALUES ('2064', '11049', '2', '19.00', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('2065', '11049', '12', '38.00', '4', '0.2');
INSERT INTO `example_orderdetails` VALUES ('2066', '11050', '76', '18.00', '50', '0.1');
INSERT INTO `example_orderdetails` VALUES ('2067', '11051', '24', '4.50', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('2068', '11052', '43', '46.00', '30', '0.2');
INSERT INTO `example_orderdetails` VALUES ('2069', '11052', '61', '28.50', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('2070', '11053', '18', '62.50', '35', '0.2');
INSERT INTO `example_orderdetails` VALUES ('2071', '11053', '32', '32.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('2072', '11053', '64', '33.25', '25', '0.2');
INSERT INTO `example_orderdetails` VALUES ('2073', '11054', '33', '2.50', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('2074', '11054', '67', '14.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('2075', '11055', '24', '4.50', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('2076', '11055', '25', '14.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('2077', '11055', '51', '53.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('2078', '11055', '57', '19.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('2079', '11056', '7', '30.00', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('2080', '11056', '55', '24.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('2081', '11056', '60', '34.00', '50', '0');
INSERT INTO `example_orderdetails` VALUES ('2082', '11057', '70', '15.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('2083', '11058', '21', '10.00', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('2084', '11058', '60', '34.00', '21', '0');
INSERT INTO `example_orderdetails` VALUES ('2085', '11058', '61', '28.50', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('2086', '11059', '13', '6.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('2087', '11059', '17', '39.00', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('2088', '11059', '60', '34.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('2089', '11060', '60', '34.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('2090', '11060', '77', '13.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('2091', '11061', '60', '34.00', '15', '0');
INSERT INTO `example_orderdetails` VALUES ('2092', '11062', '53', '32.80', '10', '0.2');
INSERT INTO `example_orderdetails` VALUES ('2093', '11062', '70', '15.00', '12', '0.2');
INSERT INTO `example_orderdetails` VALUES ('2094', '11063', '34', '14.00', '30', '0');
INSERT INTO `example_orderdetails` VALUES ('2095', '11063', '40', '18.40', '40', '0.1');
INSERT INTO `example_orderdetails` VALUES ('2096', '11063', '41', '9.65', '30', '0.1');
INSERT INTO `example_orderdetails` VALUES ('2097', '11064', '17', '39.00', '77', '0.1');
INSERT INTO `example_orderdetails` VALUES ('2098', '11064', '41', '9.65', '12', '0');
INSERT INTO `example_orderdetails` VALUES ('2099', '11064', '53', '32.80', '25', '0.1');
INSERT INTO `example_orderdetails` VALUES ('2100', '11064', '55', '24.00', '4', '0.1');
INSERT INTO `example_orderdetails` VALUES ('2101', '11064', '68', '12.50', '55', '0');
INSERT INTO `example_orderdetails` VALUES ('2102', '11065', '30', '25.89', '4', '0.25');
INSERT INTO `example_orderdetails` VALUES ('2103', '11065', '54', '7.45', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('2104', '11066', '16', '17.45', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('2105', '11066', '19', '9.20', '42', '0');
INSERT INTO `example_orderdetails` VALUES ('2106', '11066', '34', '14.00', '35', '0');
INSERT INTO `example_orderdetails` VALUES ('2107', '11067', '41', '9.65', '9', '0');
INSERT INTO `example_orderdetails` VALUES ('2108', '11068', '28', '45.60', '8', '0.15');
INSERT INTO `example_orderdetails` VALUES ('2109', '11068', '43', '46.00', '36', '0.15');
INSERT INTO `example_orderdetails` VALUES ('2110', '11068', '77', '13.00', '28', '0.15');
INSERT INTO `example_orderdetails` VALUES ('2111', '11069', '39', '18.00', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('2112', '11070', '1', '18.00', '40', '0.15');
INSERT INTO `example_orderdetails` VALUES ('2113', '11070', '2', '19.00', '20', '0.15');
INSERT INTO `example_orderdetails` VALUES ('2114', '11070', '16', '17.45', '30', '0.15');
INSERT INTO `example_orderdetails` VALUES ('2115', '11070', '31', '12.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('2116', '11071', '7', '30.00', '15', '0.05');
INSERT INTO `example_orderdetails` VALUES ('2117', '11071', '13', '6.00', '10', '0.05');
INSERT INTO `example_orderdetails` VALUES ('2118', '11072', '2', '19.00', '8', '0');
INSERT INTO `example_orderdetails` VALUES ('2119', '11072', '41', '9.65', '40', '0');
INSERT INTO `example_orderdetails` VALUES ('2120', '11072', '50', '16.25', '22', '0');
INSERT INTO `example_orderdetails` VALUES ('2121', '11072', '64', '33.25', '130', '0');
INSERT INTO `example_orderdetails` VALUES ('2122', '11073', '11', '21.00', '10', '0');
INSERT INTO `example_orderdetails` VALUES ('2123', '11073', '24', '4.50', '20', '0');
INSERT INTO `example_orderdetails` VALUES ('2124', '11074', '16', '17.45', '14', '0.05');
INSERT INTO `example_orderdetails` VALUES ('2125', '11075', '2', '19.00', '10', '0.15');
INSERT INTO `example_orderdetails` VALUES ('2126', '11075', '46', '12.00', '30', '0.15');
INSERT INTO `example_orderdetails` VALUES ('2127', '11075', '76', '18.00', '2', '0.15');
INSERT INTO `example_orderdetails` VALUES ('2128', '11076', '6', '25.00', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('2129', '11076', '14', '23.25', '20', '0.25');
INSERT INTO `example_orderdetails` VALUES ('2130', '11076', '19', '9.20', '10', '0.25');
INSERT INTO `example_orderdetails` VALUES ('2131', '11077', '2', '19.00', '24', '0.2');
INSERT INTO `example_orderdetails` VALUES ('2132', '11077', '3', '10.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('2133', '11077', '4', '22.00', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('2134', '11077', '6', '25.00', '1', '0.02');
INSERT INTO `example_orderdetails` VALUES ('2135', '11077', '7', '30.00', '1', '0.05');
INSERT INTO `example_orderdetails` VALUES ('2136', '11077', '8', '40.00', '2', '0.1');
INSERT INTO `example_orderdetails` VALUES ('2137', '11077', '10', '31.00', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('2138', '11077', '12', '38.00', '2', '0.05');
INSERT INTO `example_orderdetails` VALUES ('2139', '11077', '13', '6.00', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('2140', '11077', '14', '23.25', '1', '0.03');
INSERT INTO `example_orderdetails` VALUES ('2141', '11077', '16', '17.45', '2', '0.03');
INSERT INTO `example_orderdetails` VALUES ('2142', '11077', '20', '81.00', '1', '0.04');
INSERT INTO `example_orderdetails` VALUES ('2143', '11077', '23', '9.00', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('2144', '11077', '32', '32.00', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('2145', '11077', '39', '18.00', '2', '0.05');
INSERT INTO `example_orderdetails` VALUES ('2146', '11077', '41', '9.65', '3', '0');
INSERT INTO `example_orderdetails` VALUES ('2147', '11077', '46', '12.00', '3', '0.02');
INSERT INTO `example_orderdetails` VALUES ('2148', '11077', '52', '7.00', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('2149', '11077', '55', '24.00', '2', '0');
INSERT INTO `example_orderdetails` VALUES ('2150', '11077', '60', '34.00', '2', '0.06');
INSERT INTO `example_orderdetails` VALUES ('2151', '11077', '64', '33.25', '2', '0.03');
INSERT INTO `example_orderdetails` VALUES ('2152', '11077', '66', '17.00', '1', '0');
INSERT INTO `example_orderdetails` VALUES ('2153', '11077', '73', '15.00', '2', '0.01');
INSERT INTO `example_orderdetails` VALUES ('2154', '11077', '75', '7.75', '4', '0');
INSERT INTO `example_orderdetails` VALUES ('2155', '11077', '77', '13.00', '2', '0');

-- ----------------------------
-- Table structure for example_orders
-- ----------------------------
DROP TABLE IF EXISTS `example_orders`;
CREATE TABLE `example_orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` char(5) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `RequiredDate` datetime DEFAULT NULL,
  `ShippedDate` datetime DEFAULT NULL,
  `ShipVia` int(11) DEFAULT NULL,
  `Freight` double(12,2) DEFAULT '0.00',
  `ShipName` varchar(40) DEFAULT NULL,
  `ShipAddress` varchar(60) DEFAULT NULL,
  `ShipCity` varchar(15) DEFAULT NULL,
  `ShipRegion` varchar(15) DEFAULT NULL,
  `ShipPostalCode` varchar(10) DEFAULT NULL,
  `ShipCountry` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomersOrders` (`CustomerID`),
  KEY `EmployeesOrders` (`EmployeeID`),
  KEY `OrderDate` (`OrderDate`),
  KEY `ShippedDate` (`ShippedDate`),
  KEY `ShipPostalCode` (`ShipPostalCode`),
  KEY `FK_Example_Orders_Shippers` (`ShipVia`)
) ENGINE=MyISAM AUTO_INCREMENT=11078 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of example_orders
-- ----------------------------
INSERT INTO `example_orders` VALUES ('10248', 'VINET', '5', '1996-07-04 00:00:00', '1996-08-01 00:00:00', '1996-07-16 00:00:00', '3', '32.38', 'Vins et alcools Chevalier', '59 rue de lAbbaye', 'Reims', null, '51100', 'France');
INSERT INTO `example_orders` VALUES ('10249', 'TOMSP', '6', '1996-07-05 00:00:00', '1996-08-16 00:00:00', '1996-07-10 00:00:00', '1', '11.61', 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', null, '44087', 'Germany');
INSERT INTO `example_orders` VALUES ('10250', 'HANAR', '4', '1996-07-08 00:00:00', '1996-08-05 00:00:00', '1996-07-12 00:00:00', '2', '65.83', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('10251', 'VICTE', '3', '1996-07-08 00:00:00', '1996-08-05 00:00:00', '1996-07-15 00:00:00', '1', '41.34', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', null, '69004', 'France');
INSERT INTO `example_orders` VALUES ('10252', 'SUPRD', '4', '1996-07-09 00:00:00', '1996-08-06 00:00:00', '1996-07-11 00:00:00', '2', '51.30', 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium');
INSERT INTO `example_orders` VALUES ('10253', 'HANAR', '3', '1996-07-10 00:00:00', '1996-07-24 00:00:00', '1996-07-16 00:00:00', '2', '58.17', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('10254', 'CHOPS', '5', '1996-07-11 00:00:00', '1996-08-08 00:00:00', '1996-07-23 00:00:00', '2', '22.98', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', null, '3012', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10255', 'RICSU', '9', '1996-07-12 00:00:00', '1996-08-09 00:00:00', '1996-07-15 00:00:00', '3', '148.33', 'Richter Supermarkt', 'Starenweg 5', 'Genève', null, '1204', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10256', 'WELLI', '3', '1996-07-15 00:00:00', '1996-08-12 00:00:00', '1996-07-17 00:00:00', '2', '13.97', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO `example_orders` VALUES ('10257', 'HILAA', '4', '1996-07-16 00:00:00', '1996-08-13 00:00:00', '1996-07-22 00:00:00', '3', '81.91', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10258', 'ERNSH', '1', '1996-07-17 00:00:00', '1996-08-14 00:00:00', '1996-07-23 00:00:00', '1', '140.51', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10259', 'CENTC', '4', '1996-07-18 00:00:00', '1996-08-15 00:00:00', '1996-07-25 00:00:00', '3', '3.25', 'Centro comercial Moctezuma', 'Sierras de Granada 9993', 'México D.F.', null, '05022', 'Mexico');
INSERT INTO `example_orders` VALUES ('10260', 'OTTIK', '4', '1996-07-19 00:00:00', '1996-08-16 00:00:00', '1996-07-29 00:00:00', '1', '55.09', 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', null, '50739', 'Germany');
INSERT INTO `example_orders` VALUES ('10261', 'QUEDE', '4', '1996-07-19 00:00:00', '1996-08-16 00:00:00', '1996-07-30 00:00:00', '2', '3.05', 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO `example_orders` VALUES ('10262', 'RATTC', '8', '1996-07-22 00:00:00', '1996-08-19 00:00:00', '1996-07-25 00:00:00', '3', '48.29', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10263', 'ERNSH', '9', '1996-07-23 00:00:00', '1996-08-20 00:00:00', '1996-07-31 00:00:00', '3', '146.06', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10264', 'FOLKO', '6', '1996-07-24 00:00:00', '1996-08-21 00:00:00', '1996-08-23 00:00:00', '3', '3.67', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10265', 'BLONP', '2', '1996-07-25 00:00:00', '1996-08-22 00:00:00', '1996-08-12 00:00:00', '1', '55.28', 'Blondel père et fils', '24, place Kléber', 'Strasbourg', null, '67000', 'France');
INSERT INTO `example_orders` VALUES ('10266', 'WARTH', '3', '1996-07-26 00:00:00', '1996-09-06 00:00:00', '1996-07-31 00:00:00', '3', '25.73', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10267', 'FRANK', '4', '1996-07-29 00:00:00', '1996-08-26 00:00:00', '1996-08-06 00:00:00', '1', '208.58', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10268', 'GROSR', '8', '1996-07-30 00:00:00', '1996-08-27 00:00:00', '1996-08-02 00:00:00', '3', '66.29', 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10269', 'WHITC', '5', '1996-07-31 00:00:00', '1996-08-14 00:00:00', '1996-08-09 00:00:00', '1', '4.56', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('10270', 'WARTH', '1', '1996-08-01 00:00:00', '1996-08-29 00:00:00', '1996-08-02 00:00:00', '1', '136.54', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10271', 'SPLIR', '6', '1996-08-01 00:00:00', '1996-08-29 00:00:00', '1996-08-30 00:00:00', '2', '4.54', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO `example_orders` VALUES ('10272', 'RATTC', '6', '1996-08-02 00:00:00', '1996-08-30 00:00:00', '1996-08-06 00:00:00', '2', '98.03', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10273', 'QUICK', '3', '1996-08-05 00:00:00', '1996-09-02 00:00:00', '1996-08-12 00:00:00', '3', '76.07', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10274', 'VINET', '6', '1996-08-06 00:00:00', '1996-09-03 00:00:00', '1996-08-16 00:00:00', '1', '6.01', 'Vins et alcools Chevalier', '59 rue de lAbbaye', 'Reims', null, '51100', 'France');
INSERT INTO `example_orders` VALUES ('10275', 'MAGAA', '1', '1996-08-07 00:00:00', '1996-09-04 00:00:00', '1996-08-09 00:00:00', '1', '26.93', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', null, '24100', 'Italy');
INSERT INTO `example_orders` VALUES ('10276', 'TORTU', '8', '1996-08-08 00:00:00', '1996-08-22 00:00:00', '1996-08-14 00:00:00', '3', '13.84', 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10277', 'MORGK', '2', '1996-08-09 00:00:00', '1996-09-06 00:00:00', '1996-08-13 00:00:00', '3', '125.77', 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', null, '04179', 'Germany');
INSERT INTO `example_orders` VALUES ('10278', 'BERGS', '8', '1996-08-12 00:00:00', '1996-09-09 00:00:00', '1996-08-16 00:00:00', '2', '92.69', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10279', 'LEHMS', '8', '1996-08-13 00:00:00', '1996-09-10 00:00:00', '1996-08-16 00:00:00', '2', '25.83', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10280', 'BERGS', '2', '1996-08-14 00:00:00', '1996-09-11 00:00:00', '1996-09-12 00:00:00', '1', '8.98', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10281', 'ROMEY', '4', '1996-08-14 00:00:00', '1996-08-28 00:00:00', '1996-08-21 00:00:00', '1', '2.94', 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', null, '28001', 'Spain');
INSERT INTO `example_orders` VALUES ('10282', 'ROMEY', '4', '1996-08-15 00:00:00', '1996-09-12 00:00:00', '1996-08-21 00:00:00', '1', '12.69', 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', null, '28001', 'Spain');
INSERT INTO `example_orders` VALUES ('10283', 'LILAS', '3', '1996-08-16 00:00:00', '1996-09-13 00:00:00', '1996-08-23 00:00:00', '3', '84.81', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10284', 'LEHMS', '4', '1996-08-19 00:00:00', '1996-09-16 00:00:00', '1996-08-27 00:00:00', '1', '76.56', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10285', 'QUICK', '1', '1996-08-20 00:00:00', '1996-09-17 00:00:00', '1996-08-26 00:00:00', '2', '76.83', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10286', 'QUICK', '8', '1996-08-21 00:00:00', '1996-09-18 00:00:00', '1996-08-30 00:00:00', '3', '229.24', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10287', 'RICAR', '8', '1996-08-22 00:00:00', '1996-09-19 00:00:00', '1996-08-28 00:00:00', '3', '12.76', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO `example_orders` VALUES ('10288', 'REGGC', '4', '1996-08-23 00:00:00', '1996-09-20 00:00:00', '1996-09-03 00:00:00', '1', '7.45', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy');
INSERT INTO `example_orders` VALUES ('10289', 'BSBEV', '7', '1996-08-26 00:00:00', '1996-09-23 00:00:00', '1996-08-28 00:00:00', '3', '22.77', 'Bs Beverages', 'Fauntleroy Circus', 'London', null, 'EC2 5NT', 'UK');
INSERT INTO `example_orders` VALUES ('10290', 'COMMI', '8', '1996-08-27 00:00:00', '1996-09-24 00:00:00', '1996-09-03 00:00:00', '1', '79.70', 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO `example_orders` VALUES ('10291', 'QUEDE', '6', '1996-08-27 00:00:00', '1996-09-24 00:00:00', '1996-09-04 00:00:00', '2', '6.40', 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO `example_orders` VALUES ('10292', 'TRADH', '1', '1996-08-28 00:00:00', '1996-09-25 00:00:00', '1996-09-02 00:00:00', '2', '1.35', 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10293', 'TORTU', '1', '1996-08-29 00:00:00', '1996-09-26 00:00:00', '1996-09-11 00:00:00', '3', '21.18', 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10294', 'RATTC', '4', '1996-08-30 00:00:00', '1996-09-27 00:00:00', '1996-09-05 00:00:00', '2', '147.26', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10295', 'VINET', '2', '1996-09-02 00:00:00', '1996-09-30 00:00:00', '1996-09-10 00:00:00', '2', '1.15', 'Vins et alcools Chevalier', '59 rue de lAbbaye', 'Reims', null, '51100', 'France');
INSERT INTO `example_orders` VALUES ('10296', 'LILAS', '6', '1996-09-03 00:00:00', '1996-10-01 00:00:00', '1996-09-11 00:00:00', '1', '0.12', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10297', 'BLONP', '5', '1996-09-04 00:00:00', '1996-10-16 00:00:00', '1996-09-10 00:00:00', '2', '5.74', 'Blondel père et fils', '24, place Kléber', 'Strasbourg', null, '67000', 'France');
INSERT INTO `example_orders` VALUES ('10298', 'HUNGO', '6', '1996-09-05 00:00:00', '1996-10-03 00:00:00', '1996-09-11 00:00:00', '2', '168.22', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10299', 'RICAR', '4', '1996-09-06 00:00:00', '1996-10-04 00:00:00', '1996-09-13 00:00:00', '2', '29.76', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO `example_orders` VALUES ('10300', 'MAGAA', '2', '1996-09-09 00:00:00', '1996-10-07 00:00:00', '1996-09-18 00:00:00', '2', '17.68', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', null, '24100', 'Italy');
INSERT INTO `example_orders` VALUES ('10301', 'WANDK', '8', '1996-09-09 00:00:00', '1996-10-07 00:00:00', '1996-09-17 00:00:00', '2', '45.08', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', null, '70563', 'Germany');
INSERT INTO `example_orders` VALUES ('10302', 'SUPRD', '4', '1996-09-10 00:00:00', '1996-10-08 00:00:00', '1996-10-09 00:00:00', '2', '6.27', 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium');
INSERT INTO `example_orders` VALUES ('10303', 'GODOS', '7', '1996-09-11 00:00:00', '1996-10-09 00:00:00', '1996-09-18 00:00:00', '2', '107.83', 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', null, '41101', 'Spain');
INSERT INTO `example_orders` VALUES ('10304', 'TORTU', '1', '1996-09-12 00:00:00', '1996-10-10 00:00:00', '1996-09-17 00:00:00', '2', '63.79', 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10305', 'OLDWO', '8', '1996-09-13 00:00:00', '1996-10-11 00:00:00', '1996-10-09 00:00:00', '3', '257.62', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO `example_orders` VALUES ('10306', 'ROMEY', '1', '1996-09-16 00:00:00', '1996-10-14 00:00:00', '1996-09-23 00:00:00', '3', '7.56', 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', null, '28001', 'Spain');
INSERT INTO `example_orders` VALUES ('10307', 'LONEP', '2', '1996-09-17 00:00:00', '1996-10-15 00:00:00', '1996-09-25 00:00:00', '2', '0.56', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO `example_orders` VALUES ('10308', 'ANATR', '7', '1996-09-18 00:00:00', '1996-10-16 00:00:00', '1996-09-24 00:00:00', '3', '1.61', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', null, '05021', 'Mexico');
INSERT INTO `example_orders` VALUES ('10309', 'HUNGO', '3', '1996-09-19 00:00:00', '1996-10-17 00:00:00', '1996-10-23 00:00:00', '1', '47.30', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10310', 'THEBI', '8', '1996-09-20 00:00:00', '1996-10-18 00:00:00', '1996-09-27 00:00:00', '2', '17.52', 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO `example_orders` VALUES ('10311', 'DUMON', '1', '1996-09-20 00:00:00', '1996-10-04 00:00:00', '1996-09-26 00:00:00', '3', '24.69', 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', null, '44000', 'France');
INSERT INTO `example_orders` VALUES ('10312', 'WANDK', '2', '1996-09-23 00:00:00', '1996-10-21 00:00:00', '1996-10-03 00:00:00', '2', '40.26', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', null, '70563', 'Germany');
INSERT INTO `example_orders` VALUES ('10313', 'QUICK', '2', '1996-09-24 00:00:00', '1996-10-22 00:00:00', '1996-10-04 00:00:00', '2', '1.96', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10314', 'RATTC', '1', '1996-09-25 00:00:00', '1996-10-23 00:00:00', '1996-10-04 00:00:00', '2', '74.16', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10315', 'ISLAT', '4', '1996-09-26 00:00:00', '1996-10-24 00:00:00', '1996-10-03 00:00:00', '2', '41.76', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO `example_orders` VALUES ('10316', 'RATTC', '1', '1996-09-27 00:00:00', '1996-10-25 00:00:00', '1996-10-08 00:00:00', '3', '150.15', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10317', 'LONEP', '6', '1996-09-30 00:00:00', '1996-10-28 00:00:00', '1996-10-10 00:00:00', '1', '12.69', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO `example_orders` VALUES ('10318', 'ISLAT', '8', '1996-10-01 00:00:00', '1996-10-29 00:00:00', '1996-10-04 00:00:00', '2', '4.73', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO `example_orders` VALUES ('10319', 'TORTU', '7', '1996-10-02 00:00:00', '1996-10-30 00:00:00', '1996-10-11 00:00:00', '3', '64.50', 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10320', 'WARTH', '5', '1996-10-03 00:00:00', '1996-10-17 00:00:00', '1996-10-18 00:00:00', '3', '34.57', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10321', 'ISLAT', '3', '1996-10-03 00:00:00', '1996-10-31 00:00:00', '1996-10-11 00:00:00', '2', '3.43', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO `example_orders` VALUES ('10322', 'PERIC', '7', '1996-10-04 00:00:00', '1996-11-01 00:00:00', '1996-10-23 00:00:00', '3', '0.40', 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10323', 'KOENE', '4', '1996-10-07 00:00:00', '1996-11-04 00:00:00', '1996-10-14 00:00:00', '1', '4.88', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10324', 'SAVEA', '9', '1996-10-08 00:00:00', '1996-11-05 00:00:00', '1996-10-10 00:00:00', '1', '214.27', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10325', 'KOENE', '1', '1996-10-09 00:00:00', '1996-10-23 00:00:00', '1996-10-14 00:00:00', '3', '64.86', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10326', 'BOLID', '4', '1996-10-10 00:00:00', '1996-11-07 00:00:00', '1996-10-14 00:00:00', '2', '77.92', 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', null, '28023', 'Spain');
INSERT INTO `example_orders` VALUES ('10327', 'FOLKO', '2', '1996-10-11 00:00:00', '1996-11-08 00:00:00', '1996-10-14 00:00:00', '1', '63.36', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10328', 'FURIB', '4', '1996-10-14 00:00:00', '1996-11-11 00:00:00', '1996-10-17 00:00:00', '3', '87.03', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', null, '1675', 'Portugal');
INSERT INTO `example_orders` VALUES ('10329', 'SPLIR', '4', '1996-10-15 00:00:00', '1996-11-26 00:00:00', '1996-10-23 00:00:00', '2', '191.67', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO `example_orders` VALUES ('10330', 'LILAS', '3', '1996-10-16 00:00:00', '1996-11-13 00:00:00', '1996-10-28 00:00:00', '1', '12.75', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10331', 'BONAP', '9', '1996-10-16 00:00:00', '1996-11-27 00:00:00', '1996-10-21 00:00:00', '1', '10.19', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10332', 'MEREP', '3', '1996-10-17 00:00:00', '1996-11-28 00:00:00', '1996-10-21 00:00:00', '2', '52.84', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10333', 'WARTH', '5', '1996-10-18 00:00:00', '1996-11-15 00:00:00', '1996-10-25 00:00:00', '3', '0.59', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10334', 'VICTE', '8', '1996-10-21 00:00:00', '1996-11-18 00:00:00', '1996-10-28 00:00:00', '2', '8.56', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', null, '69004', 'France');
INSERT INTO `example_orders` VALUES ('10335', 'HUNGO', '7', '1996-10-22 00:00:00', '1996-11-19 00:00:00', '1996-10-24 00:00:00', '2', '42.11', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10336', 'PRINI', '7', '1996-10-23 00:00:00', '1996-11-20 00:00:00', '1996-10-25 00:00:00', '2', '15.51', 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', null, '1756', 'Portugal');
INSERT INTO `example_orders` VALUES ('10337', 'FRANK', '4', '1996-10-24 00:00:00', '1996-11-21 00:00:00', '1996-10-29 00:00:00', '3', '108.26', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10338', 'OLDWO', '4', '1996-10-25 00:00:00', '1996-11-22 00:00:00', '1996-10-29 00:00:00', '3', '84.21', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO `example_orders` VALUES ('10339', 'MEREP', '2', '1996-10-28 00:00:00', '1996-11-25 00:00:00', '1996-11-04 00:00:00', '2', '15.66', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10340', 'BONAP', '1', '1996-10-29 00:00:00', '1996-11-26 00:00:00', '1996-11-08 00:00:00', '3', '166.31', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10341', 'SIMOB', '7', '1996-10-29 00:00:00', '1996-11-26 00:00:00', '1996-11-05 00:00:00', '3', '26.78', 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', null, '1734', 'Denmark');
INSERT INTO `example_orders` VALUES ('10342', 'FRANK', '4', '1996-10-30 00:00:00', '1996-11-13 00:00:00', '1996-11-04 00:00:00', '2', '54.83', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10343', 'LEHMS', '4', '1996-10-31 00:00:00', '1996-11-28 00:00:00', '1996-11-06 00:00:00', '1', '110.37', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10344', 'WHITC', '4', '1996-11-01 00:00:00', '1996-11-29 00:00:00', '1996-11-05 00:00:00', '2', '23.29', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('10345', 'QUICK', '2', '1996-11-04 00:00:00', '1996-12-02 00:00:00', '1996-11-11 00:00:00', '2', '249.06', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10346', 'RATTC', '3', '1996-11-05 00:00:00', '1996-12-17 00:00:00', '1996-11-08 00:00:00', '3', '142.08', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10347', 'FAMIA', '4', '1996-11-06 00:00:00', '1996-12-04 00:00:00', '1996-11-08 00:00:00', '3', '3.10', 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10348', 'WANDK', '4', '1996-11-07 00:00:00', '1996-12-05 00:00:00', '1996-11-15 00:00:00', '2', '0.78', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', null, '70563', 'Germany');
INSERT INTO `example_orders` VALUES ('10349', 'SPLIR', '7', '1996-11-08 00:00:00', '1996-12-06 00:00:00', '1996-11-15 00:00:00', '1', '8.63', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO `example_orders` VALUES ('10350', 'LAMAI', '6', '1996-11-11 00:00:00', '1996-12-09 00:00:00', '1996-12-03 00:00:00', '2', '64.19', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10351', 'ERNSH', '1', '1996-11-11 00:00:00', '1996-12-09 00:00:00', '1996-11-20 00:00:00', '1', '162.33', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10352', 'FURIB', '3', '1996-11-12 00:00:00', '1996-11-26 00:00:00', '1996-11-18 00:00:00', '3', '1.30', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', null, '1675', 'Portugal');
INSERT INTO `example_orders` VALUES ('10353', 'PICCO', '7', '1996-11-13 00:00:00', '1996-12-11 00:00:00', '1996-11-25 00:00:00', '3', '360.63', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', null, '5020', 'Austria');
INSERT INTO `example_orders` VALUES ('10354', 'PERIC', '8', '1996-11-14 00:00:00', '1996-12-12 00:00:00', '1996-11-20 00:00:00', '3', '53.80', 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10355', 'AROUT', '6', '1996-11-15 00:00:00', '1996-12-13 00:00:00', '1996-11-20 00:00:00', '1', '41.95', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('10356', 'WANDK', '6', '1996-11-18 00:00:00', '1996-12-16 00:00:00', '1996-11-27 00:00:00', '2', '36.71', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', null, '70563', 'Germany');
INSERT INTO `example_orders` VALUES ('10357', 'LILAS', '1', '1996-11-19 00:00:00', '1996-12-17 00:00:00', '1996-12-02 00:00:00', '3', '34.88', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10358', 'LAMAI', '5', '1996-11-20 00:00:00', '1996-12-18 00:00:00', '1996-11-27 00:00:00', '1', '19.64', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10359', 'SEVES', '5', '1996-11-21 00:00:00', '1996-12-19 00:00:00', '1996-11-26 00:00:00', '3', '288.43', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', null, 'OX15 4NB', 'UK');
INSERT INTO `example_orders` VALUES ('10360', 'BLONP', '4', '1996-11-22 00:00:00', '1996-12-20 00:00:00', '1996-12-02 00:00:00', '3', '131.70', 'Blondel père et fils', '24, place Kléber', 'Strasbourg', null, '67000', 'France');
INSERT INTO `example_orders` VALUES ('10361', 'QUICK', '1', '1996-11-22 00:00:00', '1996-12-20 00:00:00', '1996-12-03 00:00:00', '2', '183.17', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10362', 'BONAP', '3', '1996-11-25 00:00:00', '1996-12-23 00:00:00', '1996-11-28 00:00:00', '1', '96.04', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10363', 'DRACD', '4', '1996-11-26 00:00:00', '1996-12-24 00:00:00', '1996-12-04 00:00:00', '3', '30.54', 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', null, '52066', 'Germany');
INSERT INTO `example_orders` VALUES ('10364', 'EASTC', '1', '1996-11-26 00:00:00', '1997-01-07 00:00:00', '1996-12-04 00:00:00', '1', '71.97', 'Eastern Connection', '35 King George', 'London', null, 'WX3 6FW', 'UK');
INSERT INTO `example_orders` VALUES ('10365', 'ANTON', '3', '1996-11-27 00:00:00', '1996-12-25 00:00:00', '1996-12-02 00:00:00', '2', '22.00', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', null, '05023', 'Mexico');
INSERT INTO `example_orders` VALUES ('10366', 'GALED', '8', '1996-11-28 00:00:00', '1997-01-09 00:00:00', '1996-12-30 00:00:00', '2', '10.14', 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', null, '8022', 'Spain');
INSERT INTO `example_orders` VALUES ('10367', 'VAFFE', '7', '1996-11-28 00:00:00', '1996-12-26 00:00:00', '1996-12-02 00:00:00', '3', '13.55', 'Vaffeljernet', 'Smagsloget 45', 'Århus', null, '8200', 'Denmark');
INSERT INTO `example_orders` VALUES ('10368', 'ERNSH', '2', '1996-11-29 00:00:00', '1996-12-27 00:00:00', '1996-12-02 00:00:00', '2', '101.95', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10369', 'SPLIR', '8', '1996-12-02 00:00:00', '1996-12-30 00:00:00', '1996-12-09 00:00:00', '2', '195.68', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO `example_orders` VALUES ('10370', 'CHOPS', '6', '1996-12-03 00:00:00', '1996-12-31 00:00:00', '1996-12-27 00:00:00', '2', '1.17', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', null, '3012', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10371', 'LAMAI', '1', '1996-12-03 00:00:00', '1996-12-31 00:00:00', '1996-12-24 00:00:00', '1', '0.45', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10372', 'QUEEN', '5', '1996-12-04 00:00:00', '1997-01-01 00:00:00', '1996-12-09 00:00:00', '2', '890.78', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('10373', 'HUNGO', '4', '1996-12-05 00:00:00', '1997-01-02 00:00:00', '1996-12-11 00:00:00', '3', '124.12', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10374', 'WOLZA', '1', '1996-12-05 00:00:00', '1997-01-02 00:00:00', '1996-12-09 00:00:00', '3', '3.94', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', null, '01-012', 'Poland');
INSERT INTO `example_orders` VALUES ('10375', 'HUNGC', '3', '1996-12-06 00:00:00', '1997-01-03 00:00:00', '1996-12-09 00:00:00', '2', '20.12', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO `example_orders` VALUES ('10376', 'MEREP', '1', '1996-12-09 00:00:00', '1997-01-06 00:00:00', '1996-12-13 00:00:00', '2', '20.39', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10377', 'SEVES', '1', '1996-12-09 00:00:00', '1997-01-06 00:00:00', '1996-12-13 00:00:00', '3', '22.21', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', null, 'OX15 4NB', 'UK');
INSERT INTO `example_orders` VALUES ('10378', 'FOLKO', '5', '1996-12-10 00:00:00', '1997-01-07 00:00:00', '1996-12-19 00:00:00', '3', '5.44', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10379', 'QUEDE', '2', '1996-12-11 00:00:00', '1997-01-08 00:00:00', '1996-12-13 00:00:00', '1', '45.03', 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO `example_orders` VALUES ('10380', 'HUNGO', '8', '1996-12-12 00:00:00', '1997-01-09 00:00:00', '1997-01-16 00:00:00', '3', '35.03', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10381', 'LILAS', '3', '1996-12-12 00:00:00', '1997-01-09 00:00:00', '1996-12-13 00:00:00', '3', '7.99', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10382', 'ERNSH', '4', '1996-12-13 00:00:00', '1997-01-10 00:00:00', '1996-12-16 00:00:00', '1', '94.77', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10383', 'AROUT', '8', '1996-12-16 00:00:00', '1997-01-13 00:00:00', '1996-12-18 00:00:00', '3', '34.24', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('10384', 'BERGS', '3', '1996-12-16 00:00:00', '1997-01-13 00:00:00', '1996-12-20 00:00:00', '3', '168.64', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10385', 'SPLIR', '1', '1996-12-17 00:00:00', '1997-01-14 00:00:00', '1996-12-23 00:00:00', '2', '30.96', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO `example_orders` VALUES ('10386', 'FAMIA', '9', '1996-12-18 00:00:00', '1997-01-01 00:00:00', '1996-12-25 00:00:00', '3', '13.99', 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10387', 'SANTG', '1', '1996-12-18 00:00:00', '1997-01-15 00:00:00', '1996-12-20 00:00:00', '2', '93.63', 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', null, '4110', 'Norway');
INSERT INTO `example_orders` VALUES ('10388', 'SEVES', '2', '1996-12-19 00:00:00', '1997-01-16 00:00:00', '1996-12-20 00:00:00', '1', '34.86', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', null, 'OX15 4NB', 'UK');
INSERT INTO `example_orders` VALUES ('10389', 'BOTTM', '4', '1996-12-20 00:00:00', '1997-01-17 00:00:00', '1996-12-24 00:00:00', '2', '47.42', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('10390', 'ERNSH', '6', '1996-12-23 00:00:00', '1997-01-20 00:00:00', '1996-12-26 00:00:00', '1', '126.38', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10391', 'DRACD', '3', '1996-12-23 00:00:00', '1997-01-20 00:00:00', '1996-12-31 00:00:00', '3', '5.45', 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', null, '52066', 'Germany');
INSERT INTO `example_orders` VALUES ('10392', 'PICCO', '2', '1996-12-24 00:00:00', '1997-01-21 00:00:00', '1997-01-01 00:00:00', '3', '122.46', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', null, '5020', 'Austria');
INSERT INTO `example_orders` VALUES ('10393', 'SAVEA', '1', '1996-12-25 00:00:00', '1997-01-22 00:00:00', '1997-01-03 00:00:00', '3', '126.56', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10394', 'HUNGC', '1', '1996-12-25 00:00:00', '1997-01-22 00:00:00', '1997-01-03 00:00:00', '3', '30.34', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO `example_orders` VALUES ('10395', 'HILAA', '6', '1996-12-26 00:00:00', '1997-01-23 00:00:00', '1997-01-03 00:00:00', '1', '184.41', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10396', 'FRANK', '1', '1996-12-27 00:00:00', '1997-01-10 00:00:00', '1997-01-06 00:00:00', '3', '135.35', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10397', 'PRINI', '5', '1996-12-27 00:00:00', '1997-01-24 00:00:00', '1997-01-02 00:00:00', '1', '60.26', 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', null, '1756', 'Portugal');
INSERT INTO `example_orders` VALUES ('10398', 'SAVEA', '2', '1996-12-30 00:00:00', '1997-01-27 00:00:00', '1997-01-09 00:00:00', '3', '89.16', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10399', 'VAFFE', '8', '1996-12-31 00:00:00', '1997-01-14 00:00:00', '1997-01-08 00:00:00', '3', '27.36', 'Vaffeljernet', 'Smagsloget 45', 'Århus', null, '8200', 'Denmark');
INSERT INTO `example_orders` VALUES ('10400', 'EASTC', '1', '1997-01-01 00:00:00', '1997-01-29 00:00:00', '1997-01-16 00:00:00', '3', '83.93', 'Eastern Connection', '35 King George', 'London', null, 'WX3 6FW', 'UK');
INSERT INTO `example_orders` VALUES ('10401', 'RATTC', '1', '1997-01-01 00:00:00', '1997-01-29 00:00:00', '1997-01-10 00:00:00', '1', '12.51', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10402', 'ERNSH', '8', '1997-01-02 00:00:00', '1997-02-13 00:00:00', '1997-01-10 00:00:00', '2', '67.88', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10403', 'ERNSH', '4', '1997-01-03 00:00:00', '1997-01-31 00:00:00', '1997-01-09 00:00:00', '3', '73.79', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10404', 'MAGAA', '2', '1997-01-03 00:00:00', '1997-01-31 00:00:00', '1997-01-08 00:00:00', '1', '155.97', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', null, '24100', 'Italy');
INSERT INTO `example_orders` VALUES ('10405', 'LINOD', '1', '1997-01-06 00:00:00', '1997-02-03 00:00:00', '1997-01-22 00:00:00', '1', '34.82', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10406', 'QUEEN', '7', '1997-01-07 00:00:00', '1997-02-18 00:00:00', '1997-01-13 00:00:00', '1', '108.04', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('10407', 'OTTIK', '2', '1997-01-07 00:00:00', '1997-02-04 00:00:00', '1997-01-30 00:00:00', '2', '91.48', 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', null, '50739', 'Germany');
INSERT INTO `example_orders` VALUES ('10408', 'FOLIG', '8', '1997-01-08 00:00:00', '1997-02-05 00:00:00', '1997-01-14 00:00:00', '1', '11.26', 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', null, '59000', 'France');
INSERT INTO `example_orders` VALUES ('10409', 'OCEAN', '3', '1997-01-09 00:00:00', '1997-02-06 00:00:00', '1997-01-14 00:00:00', '1', '29.83', 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10410', 'BOTTM', '3', '1997-01-10 00:00:00', '1997-02-07 00:00:00', '1997-01-15 00:00:00', '3', '2.40', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('10411', 'BOTTM', '9', '1997-01-10 00:00:00', '1997-02-07 00:00:00', '1997-01-21 00:00:00', '3', '23.65', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('10412', 'WARTH', '8', '1997-01-13 00:00:00', '1997-02-10 00:00:00', '1997-01-15 00:00:00', '2', '3.77', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10413', 'LAMAI', '3', '1997-01-14 00:00:00', '1997-02-11 00:00:00', '1997-01-16 00:00:00', '2', '95.66', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10414', 'FAMIA', '2', '1997-01-14 00:00:00', '1997-02-11 00:00:00', '1997-01-17 00:00:00', '3', '21.48', 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10415', 'HUNGC', '3', '1997-01-15 00:00:00', '1997-02-12 00:00:00', '1997-01-24 00:00:00', '1', '0.20', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO `example_orders` VALUES ('10416', 'WARTH', '8', '1997-01-16 00:00:00', '1997-02-13 00:00:00', '1997-01-27 00:00:00', '3', '22.72', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10417', 'SIMOB', '4', '1997-01-16 00:00:00', '1997-02-13 00:00:00', '1997-01-28 00:00:00', '3', '70.29', 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', null, '1734', 'Denmark');
INSERT INTO `example_orders` VALUES ('10418', 'QUICK', '4', '1997-01-17 00:00:00', '1997-02-14 00:00:00', '1997-01-24 00:00:00', '1', '17.55', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10419', 'RICSU', '4', '1997-01-20 00:00:00', '1997-02-17 00:00:00', '1997-01-30 00:00:00', '2', '137.35', 'Richter Supermarkt', 'Starenweg 5', 'Genève', null, '1204', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10420', 'WELLI', '3', '1997-01-21 00:00:00', '1997-02-18 00:00:00', '1997-01-27 00:00:00', '1', '44.12', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO `example_orders` VALUES ('10421', 'QUEDE', '8', '1997-01-21 00:00:00', '1997-03-04 00:00:00', '1997-01-27 00:00:00', '1', '99.23', 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO `example_orders` VALUES ('10422', 'FRANS', '2', '1997-01-22 00:00:00', '1997-02-19 00:00:00', '1997-01-31 00:00:00', '1', '3.02', 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', null, '10100', 'Italy');
INSERT INTO `example_orders` VALUES ('10423', 'GOURL', '6', '1997-01-23 00:00:00', '1997-02-06 00:00:00', '1997-02-24 00:00:00', '3', '24.50', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO `example_orders` VALUES ('10424', 'MEREP', '7', '1997-01-23 00:00:00', '1997-02-20 00:00:00', '1997-01-27 00:00:00', '2', '370.61', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10425', 'LAMAI', '6', '1997-01-24 00:00:00', '1997-02-21 00:00:00', '1997-02-14 00:00:00', '2', '7.93', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10426', 'GALED', '4', '1997-01-27 00:00:00', '1997-02-24 00:00:00', '1997-02-06 00:00:00', '1', '18.69', 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', null, '8022', 'Spain');
INSERT INTO `example_orders` VALUES ('10427', 'PICCO', '4', '1997-01-27 00:00:00', '1997-02-24 00:00:00', '1997-03-03 00:00:00', '2', '31.29', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', null, '5020', 'Austria');
INSERT INTO `example_orders` VALUES ('10428', 'REGGC', '7', '1997-01-28 00:00:00', '1997-02-25 00:00:00', '1997-02-04 00:00:00', '1', '11.09', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy');
INSERT INTO `example_orders` VALUES ('10429', 'HUNGO', '3', '1997-01-29 00:00:00', '1997-03-12 00:00:00', '1997-02-07 00:00:00', '2', '56.63', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10430', 'ERNSH', '4', '1997-01-30 00:00:00', '1997-02-13 00:00:00', '1997-02-03 00:00:00', '1', '458.78', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10431', 'BOTTM', '4', '1997-01-30 00:00:00', '1997-02-13 00:00:00', '1997-02-07 00:00:00', '2', '44.17', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('10432', 'SPLIR', '3', '1997-01-31 00:00:00', '1997-02-14 00:00:00', '1997-02-07 00:00:00', '2', '4.34', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO `example_orders` VALUES ('10433', 'PRINI', '3', '1997-02-03 00:00:00', '1997-03-03 00:00:00', '1997-03-04 00:00:00', '3', '73.83', 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', null, '1756', 'Portugal');
INSERT INTO `example_orders` VALUES ('10434', 'FOLKO', '3', '1997-02-03 00:00:00', '1997-03-03 00:00:00', '1997-02-13 00:00:00', '2', '17.92', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10435', 'CONSH', '8', '1997-02-04 00:00:00', '1997-03-18 00:00:00', '1997-02-07 00:00:00', '2', '9.21', 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', null, 'WX1 6LT', 'UK');
INSERT INTO `example_orders` VALUES ('10436', 'BLONP', '3', '1997-02-05 00:00:00', '1997-03-05 00:00:00', '1997-02-11 00:00:00', '2', '156.66', 'Blondel père et fils', '24, place Kléber', 'Strasbourg', null, '67000', 'France');
INSERT INTO `example_orders` VALUES ('10437', 'WARTH', '8', '1997-02-05 00:00:00', '1997-03-05 00:00:00', '1997-02-12 00:00:00', '1', '19.97', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10438', 'TOMSP', '3', '1997-02-06 00:00:00', '1997-03-06 00:00:00', '1997-02-14 00:00:00', '2', '8.24', 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', null, '44087', 'Germany');
INSERT INTO `example_orders` VALUES ('10439', 'MEREP', '6', '1997-02-07 00:00:00', '1997-03-07 00:00:00', '1997-02-10 00:00:00', '3', '4.07', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10440', 'SAVEA', '4', '1997-02-10 00:00:00', '1997-03-10 00:00:00', '1997-02-28 00:00:00', '2', '86.53', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10441', 'OLDWO', '3', '1997-02-10 00:00:00', '1997-03-24 00:00:00', '1997-03-14 00:00:00', '2', '73.02', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO `example_orders` VALUES ('10442', 'ERNSH', '3', '1997-02-11 00:00:00', '1997-03-11 00:00:00', '1997-02-18 00:00:00', '2', '47.94', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10443', 'REGGC', '8', '1997-02-12 00:00:00', '1997-03-12 00:00:00', '1997-02-14 00:00:00', '1', '13.95', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy');
INSERT INTO `example_orders` VALUES ('10444', 'BERGS', '3', '1997-02-12 00:00:00', '1997-03-12 00:00:00', '1997-02-21 00:00:00', '3', '3.50', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10445', 'BERGS', '3', '1997-02-13 00:00:00', '1997-03-13 00:00:00', '1997-02-20 00:00:00', '1', '9.30', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10446', 'TOMSP', '6', '1997-02-14 00:00:00', '1997-03-14 00:00:00', '1997-02-19 00:00:00', '1', '14.68', 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', null, '44087', 'Germany');
INSERT INTO `example_orders` VALUES ('10447', 'RICAR', '4', '1997-02-14 00:00:00', '1997-03-14 00:00:00', '1997-03-07 00:00:00', '2', '68.66', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO `example_orders` VALUES ('10448', 'RANCH', '4', '1997-02-17 00:00:00', '1997-03-17 00:00:00', '1997-02-24 00:00:00', '2', '38.82', 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10449', 'BLONP', '3', '1997-02-18 00:00:00', '1997-03-18 00:00:00', '1997-02-27 00:00:00', '2', '53.30', 'Blondel père et fils', '24, place Kléber', 'Strasbourg', null, '67000', 'France');
INSERT INTO `example_orders` VALUES ('10450', 'VICTE', '8', '1997-02-19 00:00:00', '1997-03-19 00:00:00', '1997-03-11 00:00:00', '2', '7.23', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', null, '69004', 'France');
INSERT INTO `example_orders` VALUES ('10451', 'QUICK', '4', '1997-02-19 00:00:00', '1997-03-05 00:00:00', '1997-03-12 00:00:00', '3', '189.09', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10452', 'SAVEA', '8', '1997-02-20 00:00:00', '1997-03-20 00:00:00', '1997-02-26 00:00:00', '1', '140.26', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10453', 'AROUT', '1', '1997-02-21 00:00:00', '1997-03-21 00:00:00', '1997-02-26 00:00:00', '2', '25.36', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('10454', 'LAMAI', '4', '1997-02-21 00:00:00', '1997-03-21 00:00:00', '1997-02-25 00:00:00', '3', '2.74', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10455', 'WARTH', '8', '1997-02-24 00:00:00', '1997-04-07 00:00:00', '1997-03-03 00:00:00', '2', '180.45', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10456', 'KOENE', '8', '1997-02-25 00:00:00', '1997-04-08 00:00:00', '1997-02-28 00:00:00', '2', '8.12', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10457', 'KOENE', '2', '1997-02-25 00:00:00', '1997-03-25 00:00:00', '1997-03-03 00:00:00', '1', '11.57', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10458', 'SUPRD', '7', '1997-02-26 00:00:00', '1997-03-26 00:00:00', '1997-03-04 00:00:00', '3', '147.06', 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium');
INSERT INTO `example_orders` VALUES ('10459', 'VICTE', '4', '1997-02-27 00:00:00', '1997-03-27 00:00:00', '1997-02-28 00:00:00', '2', '25.09', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', null, '69004', 'France');
INSERT INTO `example_orders` VALUES ('10460', 'FOLKO', '8', '1997-02-28 00:00:00', '1997-03-28 00:00:00', '1997-03-03 00:00:00', '1', '16.27', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10461', 'LILAS', '1', '1997-02-28 00:00:00', '1997-03-28 00:00:00', '1997-03-05 00:00:00', '3', '148.61', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10462', 'CONSH', '2', '1997-03-03 00:00:00', '1997-03-31 00:00:00', '1997-03-18 00:00:00', '1', '6.17', 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', null, 'WX1 6LT', 'UK');
INSERT INTO `example_orders` VALUES ('10463', 'SUPRD', '5', '1997-03-04 00:00:00', '1997-04-01 00:00:00', '1997-03-06 00:00:00', '3', '14.78', 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium');
INSERT INTO `example_orders` VALUES ('10464', 'FURIB', '4', '1997-03-04 00:00:00', '1997-04-01 00:00:00', '1997-03-14 00:00:00', '2', '89.00', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', null, '1675', 'Portugal');
INSERT INTO `example_orders` VALUES ('10465', 'VAFFE', '1', '1997-03-05 00:00:00', '1997-04-02 00:00:00', '1997-03-14 00:00:00', '3', '145.04', 'Vaffeljernet', 'Smagsloget 45', 'Århus', null, '8200', 'Denmark');
INSERT INTO `example_orders` VALUES ('10466', 'COMMI', '4', '1997-03-06 00:00:00', '1997-04-03 00:00:00', '1997-03-13 00:00:00', '1', '11.93', 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO `example_orders` VALUES ('10467', 'MAGAA', '8', '1997-03-06 00:00:00', '1997-04-03 00:00:00', '1997-03-11 00:00:00', '2', '4.93', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', null, '24100', 'Italy');
INSERT INTO `example_orders` VALUES ('10468', 'KOENE', '3', '1997-03-07 00:00:00', '1997-04-04 00:00:00', '1997-03-12 00:00:00', '3', '44.12', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10469', 'WHITC', '1', '1997-03-10 00:00:00', '1997-04-07 00:00:00', '1997-03-14 00:00:00', '1', '60.18', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('10470', 'BONAP', '4', '1997-03-11 00:00:00', '1997-04-08 00:00:00', '1997-03-14 00:00:00', '2', '64.56', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10471', 'BSBEV', '2', '1997-03-11 00:00:00', '1997-04-08 00:00:00', '1997-03-18 00:00:00', '3', '45.59', 'Bs Beverages', 'Fauntleroy Circus', 'London', null, 'EC2 5NT', 'UK');
INSERT INTO `example_orders` VALUES ('10472', 'SEVES', '8', '1997-03-12 00:00:00', '1997-04-09 00:00:00', '1997-03-19 00:00:00', '1', '4.20', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', null, 'OX15 4NB', 'UK');
INSERT INTO `example_orders` VALUES ('10473', 'ISLAT', '1', '1997-03-13 00:00:00', '1997-03-27 00:00:00', '1997-03-21 00:00:00', '3', '16.37', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO `example_orders` VALUES ('10474', 'PERIC', '5', '1997-03-13 00:00:00', '1997-04-10 00:00:00', '1997-03-21 00:00:00', '2', '83.49', 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10475', 'SUPRD', '9', '1997-03-14 00:00:00', '1997-04-11 00:00:00', '1997-04-04 00:00:00', '1', '68.52', 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium');
INSERT INTO `example_orders` VALUES ('10476', 'HILAA', '8', '1997-03-17 00:00:00', '1997-04-14 00:00:00', '1997-03-24 00:00:00', '3', '4.41', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10477', 'PRINI', '5', '1997-03-17 00:00:00', '1997-04-14 00:00:00', '1997-03-25 00:00:00', '2', '13.02', 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', null, '1756', 'Portugal');
INSERT INTO `example_orders` VALUES ('10478', 'VICTE', '2', '1997-03-18 00:00:00', '1997-04-01 00:00:00', '1997-03-26 00:00:00', '3', '4.81', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', null, '69004', 'France');
INSERT INTO `example_orders` VALUES ('10479', 'RATTC', '3', '1997-03-19 00:00:00', '1997-04-16 00:00:00', '1997-03-21 00:00:00', '3', '708.95', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10480', 'FOLIG', '6', '1997-03-20 00:00:00', '1997-04-17 00:00:00', '1997-03-24 00:00:00', '2', '1.35', 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', null, '59000', 'France');
INSERT INTO `example_orders` VALUES ('10481', 'RICAR', '8', '1997-03-20 00:00:00', '1997-04-17 00:00:00', '1997-03-25 00:00:00', '2', '64.33', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO `example_orders` VALUES ('10482', 'LAZYK', '1', '1997-03-21 00:00:00', '1997-04-18 00:00:00', '1997-04-10 00:00:00', '3', '7.48', 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO `example_orders` VALUES ('10483', 'WHITC', '7', '1997-03-24 00:00:00', '1997-04-21 00:00:00', '1997-04-25 00:00:00', '2', '15.28', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('10484', 'BSBEV', '3', '1997-03-24 00:00:00', '1997-04-21 00:00:00', '1997-04-01 00:00:00', '3', '6.88', 'Bs Beverages', 'Fauntleroy Circus', 'London', null, 'EC2 5NT', 'UK');
INSERT INTO `example_orders` VALUES ('10485', 'LINOD', '4', '1997-03-25 00:00:00', '1997-04-08 00:00:00', '1997-03-31 00:00:00', '2', '64.45', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10486', 'HILAA', '1', '1997-03-26 00:00:00', '1997-04-23 00:00:00', '1997-04-02 00:00:00', '2', '30.53', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10487', 'QUEEN', '2', '1997-03-26 00:00:00', '1997-04-23 00:00:00', '1997-03-28 00:00:00', '2', '71.07', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('10488', 'FRANK', '8', '1997-03-27 00:00:00', '1997-04-24 00:00:00', '1997-04-02 00:00:00', '2', '4.93', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10489', 'PICCO', '6', '1997-03-28 00:00:00', '1997-04-25 00:00:00', '1997-04-09 00:00:00', '2', '5.29', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', null, '5020', 'Austria');
INSERT INTO `example_orders` VALUES ('10490', 'HILAA', '7', '1997-03-31 00:00:00', '1997-04-28 00:00:00', '1997-04-03 00:00:00', '2', '210.19', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10491', 'FURIB', '8', '1997-03-31 00:00:00', '1997-04-28 00:00:00', '1997-04-08 00:00:00', '3', '16.96', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', null, '1675', 'Portugal');
INSERT INTO `example_orders` VALUES ('10492', 'BOTTM', '3', '1997-04-01 00:00:00', '1997-04-29 00:00:00', '1997-04-11 00:00:00', '1', '62.89', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('10493', 'LAMAI', '4', '1997-04-02 00:00:00', '1997-04-30 00:00:00', '1997-04-10 00:00:00', '3', '10.64', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10494', 'COMMI', '4', '1997-04-02 00:00:00', '1997-04-30 00:00:00', '1997-04-09 00:00:00', '2', '65.99', 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO `example_orders` VALUES ('10495', 'LAUGB', '3', '1997-04-03 00:00:00', '1997-05-01 00:00:00', '1997-04-11 00:00:00', '3', '4.65', 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO `example_orders` VALUES ('10496', 'TRADH', '7', '1997-04-04 00:00:00', '1997-05-02 00:00:00', '1997-04-07 00:00:00', '2', '46.77', 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10497', 'LEHMS', '7', '1997-04-04 00:00:00', '1997-05-02 00:00:00', '1997-04-07 00:00:00', '1', '36.21', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10498', 'HILAA', '8', '1997-04-07 00:00:00', '1997-05-05 00:00:00', '1997-04-11 00:00:00', '2', '29.75', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10499', 'LILAS', '4', '1997-04-08 00:00:00', '1997-05-06 00:00:00', '1997-04-16 00:00:00', '2', '102.02', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10500', 'LAMAI', '6', '1997-04-09 00:00:00', '1997-05-07 00:00:00', '1997-04-17 00:00:00', '1', '42.68', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10501', 'BLAUS', '9', '1997-04-09 00:00:00', '1997-05-07 00:00:00', '1997-04-16 00:00:00', '3', '8.85', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', null, '68306', 'Germany');
INSERT INTO `example_orders` VALUES ('10502', 'PERIC', '2', '1997-04-10 00:00:00', '1997-05-08 00:00:00', '1997-04-29 00:00:00', '1', '69.32', 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10503', 'HUNGO', '6', '1997-04-11 00:00:00', '1997-05-09 00:00:00', '1997-04-16 00:00:00', '2', '16.74', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10504', 'WHITC', '4', '1997-04-11 00:00:00', '1997-05-09 00:00:00', '1997-04-18 00:00:00', '3', '59.13', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('10505', 'MEREP', '3', '1997-04-14 00:00:00', '1997-05-12 00:00:00', '1997-04-21 00:00:00', '3', '7.13', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10506', 'KOENE', '9', '1997-04-15 00:00:00', '1997-05-13 00:00:00', '1997-05-02 00:00:00', '2', '21.19', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10507', 'ANTON', '7', '1997-04-15 00:00:00', '1997-05-13 00:00:00', '1997-04-22 00:00:00', '1', '47.45', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', null, '05023', 'Mexico');
INSERT INTO `example_orders` VALUES ('10508', 'OTTIK', '1', '1997-04-16 00:00:00', '1997-05-14 00:00:00', '1997-05-13 00:00:00', '2', '4.99', 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', null, '50739', 'Germany');
INSERT INTO `example_orders` VALUES ('10509', 'BLAUS', '4', '1997-04-17 00:00:00', '1997-05-15 00:00:00', '1997-04-29 00:00:00', '1', '0.15', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', null, '68306', 'Germany');
INSERT INTO `example_orders` VALUES ('10510', 'SAVEA', '6', '1997-04-18 00:00:00', '1997-05-16 00:00:00', '1997-04-28 00:00:00', '3', '367.63', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10511', 'BONAP', '4', '1997-04-18 00:00:00', '1997-05-16 00:00:00', '1997-04-21 00:00:00', '3', '350.64', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10512', 'FAMIA', '7', '1997-04-21 00:00:00', '1997-05-19 00:00:00', '1997-04-24 00:00:00', '2', '3.53', 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10513', 'WANDK', '7', '1997-04-22 00:00:00', '1997-06-03 00:00:00', '1997-04-28 00:00:00', '1', '105.65', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', null, '70563', 'Germany');
INSERT INTO `example_orders` VALUES ('10514', 'ERNSH', '3', '1997-04-22 00:00:00', '1997-05-20 00:00:00', '1997-05-16 00:00:00', '2', '789.95', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10515', 'QUICK', '2', '1997-04-23 00:00:00', '1997-05-07 00:00:00', '1997-05-23 00:00:00', '1', '204.47', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10516', 'HUNGO', '2', '1997-04-24 00:00:00', '1997-05-22 00:00:00', '1997-05-01 00:00:00', '3', '62.78', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10517', 'NORTS', '3', '1997-04-24 00:00:00', '1997-05-22 00:00:00', '1997-04-29 00:00:00', '3', '32.07', 'North/South', 'South House 300 Queensbridge', 'London', null, 'SW7 1RZ', 'UK');
INSERT INTO `example_orders` VALUES ('10518', 'TORTU', '4', '1997-04-25 00:00:00', '1997-05-09 00:00:00', '1997-05-05 00:00:00', '2', '218.15', 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10519', 'CHOPS', '6', '1997-04-28 00:00:00', '1997-05-26 00:00:00', '1997-05-01 00:00:00', '3', '91.76', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', null, '3012', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10520', 'SANTG', '7', '1997-04-29 00:00:00', '1997-05-27 00:00:00', '1997-05-01 00:00:00', '1', '13.37', 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', null, '4110', 'Norway');
INSERT INTO `example_orders` VALUES ('10521', 'CACTU', '8', '1997-04-29 00:00:00', '1997-05-27 00:00:00', '1997-05-02 00:00:00', '2', '17.22', 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10522', 'LEHMS', '4', '1997-04-30 00:00:00', '1997-05-28 00:00:00', '1997-05-06 00:00:00', '1', '45.33', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10523', 'SEVES', '7', '1997-05-01 00:00:00', '1997-05-29 00:00:00', '1997-05-30 00:00:00', '2', '77.63', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', null, 'OX15 4NB', 'UK');
INSERT INTO `example_orders` VALUES ('10524', 'BERGS', '1', '1997-05-01 00:00:00', '1997-05-29 00:00:00', '1997-05-07 00:00:00', '2', '244.79', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10525', 'BONAP', '1', '1997-05-02 00:00:00', '1997-05-30 00:00:00', '1997-05-23 00:00:00', '2', '11.06', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10526', 'WARTH', '4', '1997-05-05 00:00:00', '1997-06-02 00:00:00', '1997-05-15 00:00:00', '2', '58.59', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10527', 'QUICK', '7', '1997-05-05 00:00:00', '1997-06-02 00:00:00', '1997-05-07 00:00:00', '1', '41.90', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10528', 'GREAL', '6', '1997-05-06 00:00:00', '1997-05-20 00:00:00', '1997-05-09 00:00:00', '2', '3.35', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO `example_orders` VALUES ('10529', 'MAISD', '5', '1997-05-07 00:00:00', '1997-06-04 00:00:00', '1997-05-09 00:00:00', '2', '66.69', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', null, 'B-1180', 'Belgium');
INSERT INTO `example_orders` VALUES ('10530', 'PICCO', '3', '1997-05-08 00:00:00', '1997-06-05 00:00:00', '1997-05-12 00:00:00', '2', '339.22', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', null, '5020', 'Austria');
INSERT INTO `example_orders` VALUES ('10531', 'OCEAN', '7', '1997-05-08 00:00:00', '1997-06-05 00:00:00', '1997-05-19 00:00:00', '1', '8.12', 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10532', 'EASTC', '7', '1997-05-09 00:00:00', '1997-06-06 00:00:00', '1997-05-12 00:00:00', '3', '74.46', 'Eastern Connection', '35 King George', 'London', null, 'WX3 6FW', 'UK');
INSERT INTO `example_orders` VALUES ('10533', 'FOLKO', '8', '1997-05-12 00:00:00', '1997-06-09 00:00:00', '1997-05-22 00:00:00', '1', '188.04', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10534', 'LEHMS', '8', '1997-05-12 00:00:00', '1997-06-09 00:00:00', '1997-05-14 00:00:00', '2', '27.94', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10535', 'ANTON', '4', '1997-05-13 00:00:00', '1997-06-10 00:00:00', '1997-05-21 00:00:00', '1', '15.64', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', null, '05023', 'Mexico');
INSERT INTO `example_orders` VALUES ('10536', 'LEHMS', '3', '1997-05-14 00:00:00', '1997-06-11 00:00:00', '1997-06-06 00:00:00', '2', '58.88', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10537', 'RICSU', '1', '1997-05-14 00:00:00', '1997-05-28 00:00:00', '1997-05-19 00:00:00', '1', '78.85', 'Richter Supermarkt', 'Starenweg 5', 'Genève', null, '1204', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10538', 'BSBEV', '9', '1997-05-15 00:00:00', '1997-06-12 00:00:00', '1997-05-16 00:00:00', '3', '4.87', 'Bs Beverages', 'Fauntleroy Circus', 'London', null, 'EC2 5NT', 'UK');
INSERT INTO `example_orders` VALUES ('10539', 'BSBEV', '6', '1997-05-16 00:00:00', '1997-06-13 00:00:00', '1997-05-23 00:00:00', '3', '12.36', 'Bs Beverages', 'Fauntleroy Circus', 'London', null, 'EC2 5NT', 'UK');
INSERT INTO `example_orders` VALUES ('10540', 'QUICK', '3', '1997-05-19 00:00:00', '1997-06-16 00:00:00', '1997-06-13 00:00:00', '3', '1007.64', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10541', 'HANAR', '2', '1997-05-19 00:00:00', '1997-06-16 00:00:00', '1997-05-29 00:00:00', '1', '68.65', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('10542', 'KOENE', '1', '1997-05-20 00:00:00', '1997-06-17 00:00:00', '1997-05-26 00:00:00', '3', '10.95', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10543', 'LILAS', '8', '1997-05-21 00:00:00', '1997-06-18 00:00:00', '1997-05-23 00:00:00', '2', '48.17', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10544', 'LONEP', '4', '1997-05-21 00:00:00', '1997-06-18 00:00:00', '1997-05-30 00:00:00', '1', '24.91', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO `example_orders` VALUES ('10545', 'LAZYK', '8', '1997-05-22 00:00:00', '1997-06-19 00:00:00', '1997-06-26 00:00:00', '2', '11.92', 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO `example_orders` VALUES ('10546', 'VICTE', '1', '1997-05-23 00:00:00', '1997-06-20 00:00:00', '1997-05-27 00:00:00', '3', '194.72', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', null, '69004', 'France');
INSERT INTO `example_orders` VALUES ('10547', 'SEVES', '3', '1997-05-23 00:00:00', '1997-06-20 00:00:00', '1997-06-02 00:00:00', '2', '178.43', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', null, 'OX15 4NB', 'UK');
INSERT INTO `example_orders` VALUES ('10548', 'TOMSP', '3', '1997-05-26 00:00:00', '1997-06-23 00:00:00', '1997-06-02 00:00:00', '2', '1.43', 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', null, '44087', 'Germany');
INSERT INTO `example_orders` VALUES ('10549', 'QUICK', '5', '1997-05-27 00:00:00', '1997-06-10 00:00:00', '1997-05-30 00:00:00', '1', '171.24', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10550', 'GODOS', '7', '1997-05-28 00:00:00', '1997-06-25 00:00:00', '1997-06-06 00:00:00', '3', '4.32', 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', null, '41101', 'Spain');
INSERT INTO `example_orders` VALUES ('10551', 'FURIB', '4', '1997-05-28 00:00:00', '1997-07-09 00:00:00', '1997-06-06 00:00:00', '3', '72.95', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', null, '1675', 'Portugal');
INSERT INTO `example_orders` VALUES ('10552', 'HILAA', '2', '1997-05-29 00:00:00', '1997-06-26 00:00:00', '1997-06-05 00:00:00', '1', '83.22', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10553', 'WARTH', '2', '1997-05-30 00:00:00', '1997-06-27 00:00:00', '1997-06-03 00:00:00', '2', '149.49', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10554', 'OTTIK', '4', '1997-05-30 00:00:00', '1997-06-27 00:00:00', '1997-06-05 00:00:00', '3', '120.97', 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', null, '50739', 'Germany');
INSERT INTO `example_orders` VALUES ('10555', 'SAVEA', '6', '1997-06-02 00:00:00', '1997-06-30 00:00:00', '1997-06-04 00:00:00', '3', '252.49', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10556', 'SIMOB', '2', '1997-06-03 00:00:00', '1997-07-15 00:00:00', '1997-06-13 00:00:00', '1', '9.80', 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', null, '1734', 'Denmark');
INSERT INTO `example_orders` VALUES ('10557', 'LEHMS', '9', '1997-06-03 00:00:00', '1997-06-17 00:00:00', '1997-06-06 00:00:00', '2', '96.72', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10558', 'AROUT', '1', '1997-06-04 00:00:00', '1997-07-02 00:00:00', '1997-06-10 00:00:00', '2', '72.97', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('10559', 'BLONP', '6', '1997-06-05 00:00:00', '1997-07-03 00:00:00', '1997-06-13 00:00:00', '1', '8.05', 'Blondel père et fils', '24, place Kléber', 'Strasbourg', null, '67000', 'France');
INSERT INTO `example_orders` VALUES ('10560', 'FRANK', '8', '1997-06-06 00:00:00', '1997-07-04 00:00:00', '1997-06-09 00:00:00', '1', '36.65', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10561', 'FOLKO', '2', '1997-06-06 00:00:00', '1997-07-04 00:00:00', '1997-06-09 00:00:00', '2', '242.21', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10562', 'REGGC', '1', '1997-06-09 00:00:00', '1997-07-07 00:00:00', '1997-06-12 00:00:00', '1', '22.95', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy');
INSERT INTO `example_orders` VALUES ('10563', 'RICAR', '2', '1997-06-10 00:00:00', '1997-07-22 00:00:00', '1997-06-24 00:00:00', '2', '60.43', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO `example_orders` VALUES ('10564', 'RATTC', '4', '1997-06-10 00:00:00', '1997-07-08 00:00:00', '1997-06-16 00:00:00', '3', '13.75', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10565', 'MEREP', '8', '1997-06-11 00:00:00', '1997-07-09 00:00:00', '1997-06-18 00:00:00', '2', '7.15', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10566', 'BLONP', '9', '1997-06-12 00:00:00', '1997-07-10 00:00:00', '1997-06-18 00:00:00', '1', '88.40', 'Blondel père et fils', '24, place Kléber', 'Strasbourg', null, '67000', 'France');
INSERT INTO `example_orders` VALUES ('10567', 'HUNGO', '1', '1997-06-12 00:00:00', '1997-07-10 00:00:00', '1997-06-17 00:00:00', '1', '33.97', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10568', 'GALED', '3', '1997-06-13 00:00:00', '1997-07-11 00:00:00', '1997-07-09 00:00:00', '3', '6.54', 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', null, '8022', 'Spain');
INSERT INTO `example_orders` VALUES ('10569', 'RATTC', '5', '1997-06-16 00:00:00', '1997-07-14 00:00:00', '1997-07-11 00:00:00', '1', '58.98', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10570', 'MEREP', '3', '1997-06-17 00:00:00', '1997-07-15 00:00:00', '1997-06-19 00:00:00', '3', '188.99', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10571', 'ERNSH', '8', '1997-06-17 00:00:00', '1997-07-29 00:00:00', '1997-07-04 00:00:00', '3', '26.06', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10572', 'BERGS', '3', '1997-06-18 00:00:00', '1997-07-16 00:00:00', '1997-06-25 00:00:00', '2', '116.43', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10573', 'ANTON', '7', '1997-06-19 00:00:00', '1997-07-17 00:00:00', '1997-06-20 00:00:00', '3', '84.84', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', null, '05023', 'Mexico');
INSERT INTO `example_orders` VALUES ('10574', 'TRAIH', '4', '1997-06-19 00:00:00', '1997-07-17 00:00:00', '1997-06-30 00:00:00', '2', '37.60', 'Trails Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO `example_orders` VALUES ('10575', 'MORGK', '5', '1997-06-20 00:00:00', '1997-07-04 00:00:00', '1997-06-30 00:00:00', '1', '127.34', 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', null, '04179', 'Germany');
INSERT INTO `example_orders` VALUES ('10576', 'TORTU', '3', '1997-06-23 00:00:00', '1997-07-07 00:00:00', '1997-06-30 00:00:00', '3', '18.56', 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10577', 'TRAIH', '9', '1997-06-23 00:00:00', '1997-08-04 00:00:00', '1997-06-30 00:00:00', '2', '25.41', 'Trails Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO `example_orders` VALUES ('10578', 'BSBEV', '4', '1997-06-24 00:00:00', '1997-07-22 00:00:00', '1997-07-25 00:00:00', '3', '29.60', 'Bs Beverages', 'Fauntleroy Circus', 'London', null, 'EC2 5NT', 'UK');
INSERT INTO `example_orders` VALUES ('10579', 'LETSS', '1', '1997-06-25 00:00:00', '1997-07-23 00:00:00', '1997-07-04 00:00:00', '2', '13.73', 'Lets Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO `example_orders` VALUES ('10580', 'OTTIK', '4', '1997-06-26 00:00:00', '1997-07-24 00:00:00', '1997-07-01 00:00:00', '3', '75.89', 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', null, '50739', 'Germany');
INSERT INTO `example_orders` VALUES ('10581', 'FAMIA', '3', '1997-06-26 00:00:00', '1997-07-24 00:00:00', '1997-07-02 00:00:00', '1', '3.01', 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10582', 'BLAUS', '3', '1997-06-27 00:00:00', '1997-07-25 00:00:00', '1997-07-14 00:00:00', '2', '27.71', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', null, '68306', 'Germany');
INSERT INTO `example_orders` VALUES ('10583', 'WARTH', '2', '1997-06-30 00:00:00', '1997-07-28 00:00:00', '1997-07-04 00:00:00', '2', '7.28', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10584', 'BLONP', '4', '1997-06-30 00:00:00', '1997-07-28 00:00:00', '1997-07-04 00:00:00', '1', '59.14', 'Blondel père et fils', '24, place Kléber', 'Strasbourg', null, '67000', 'France');
INSERT INTO `example_orders` VALUES ('10585', 'WELLI', '7', '1997-07-01 00:00:00', '1997-07-29 00:00:00', '1997-07-10 00:00:00', '1', '13.41', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO `example_orders` VALUES ('10586', 'REGGC', '9', '1997-07-02 00:00:00', '1997-07-30 00:00:00', '1997-07-09 00:00:00', '1', '0.48', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy');
INSERT INTO `example_orders` VALUES ('10587', 'QUEDE', '1', '1997-07-02 00:00:00', '1997-07-30 00:00:00', '1997-07-09 00:00:00', '1', '62.52', 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO `example_orders` VALUES ('10588', 'QUICK', '2', '1997-07-03 00:00:00', '1997-07-31 00:00:00', '1997-07-10 00:00:00', '3', '194.67', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10589', 'GREAL', '8', '1997-07-04 00:00:00', '1997-08-01 00:00:00', '1997-07-14 00:00:00', '2', '4.42', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO `example_orders` VALUES ('10590', 'MEREP', '4', '1997-07-07 00:00:00', '1997-08-04 00:00:00', '1997-07-14 00:00:00', '3', '44.77', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10591', 'VAFFE', '1', '1997-07-07 00:00:00', '1997-07-21 00:00:00', '1997-07-16 00:00:00', '1', '55.92', 'Vaffeljernet', 'Smagsloget 45', 'Århus', null, '8200', 'Denmark');
INSERT INTO `example_orders` VALUES ('10592', 'LEHMS', '3', '1997-07-08 00:00:00', '1997-08-05 00:00:00', '1997-07-16 00:00:00', '1', '32.10', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10593', 'LEHMS', '7', '1997-07-09 00:00:00', '1997-08-06 00:00:00', '1997-08-13 00:00:00', '2', '174.20', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10594', 'OLDWO', '3', '1997-07-09 00:00:00', '1997-08-06 00:00:00', '1997-07-16 00:00:00', '2', '5.24', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO `example_orders` VALUES ('10595', 'ERNSH', '2', '1997-07-10 00:00:00', '1997-08-07 00:00:00', '1997-07-14 00:00:00', '1', '96.78', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10596', 'WHITC', '8', '1997-07-11 00:00:00', '1997-08-08 00:00:00', '1997-08-12 00:00:00', '1', '16.34', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('10597', 'PICCO', '7', '1997-07-11 00:00:00', '1997-08-08 00:00:00', '1997-07-18 00:00:00', '3', '35.12', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', null, '5020', 'Austria');
INSERT INTO `example_orders` VALUES ('10598', 'RATTC', '1', '1997-07-14 00:00:00', '1997-08-11 00:00:00', '1997-07-18 00:00:00', '3', '44.42', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10599', 'BSBEV', '6', '1997-07-15 00:00:00', '1997-08-26 00:00:00', '1997-07-21 00:00:00', '3', '29.98', 'Bs Beverages', 'Fauntleroy Circus', 'London', null, 'EC2 5NT', 'UK');
INSERT INTO `example_orders` VALUES ('10600', 'HUNGC', '4', '1997-07-16 00:00:00', '1997-08-13 00:00:00', '1997-07-21 00:00:00', '1', '45.13', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO `example_orders` VALUES ('10601', 'HILAA', '7', '1997-07-16 00:00:00', '1997-08-27 00:00:00', '1997-07-22 00:00:00', '1', '58.30', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10602', 'VAFFE', '8', '1997-07-17 00:00:00', '1997-08-14 00:00:00', '1997-07-22 00:00:00', '2', '2.92', 'Vaffeljernet', 'Smagsloget 45', 'Århus', null, '8200', 'Denmark');
INSERT INTO `example_orders` VALUES ('10603', 'SAVEA', '8', '1997-07-18 00:00:00', '1997-08-15 00:00:00', '1997-08-08 00:00:00', '2', '48.77', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10604', 'FURIB', '1', '1997-07-18 00:00:00', '1997-08-15 00:00:00', '1997-07-29 00:00:00', '1', '7.46', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', null, '1675', 'Portugal');
INSERT INTO `example_orders` VALUES ('10605', 'MEREP', '1', '1997-07-21 00:00:00', '1997-08-18 00:00:00', '1997-07-29 00:00:00', '2', '379.13', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10606', 'TRADH', '4', '1997-07-22 00:00:00', '1997-08-19 00:00:00', '1997-07-31 00:00:00', '3', '79.40', 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10607', 'SAVEA', '5', '1997-07-22 00:00:00', '1997-08-19 00:00:00', '1997-07-25 00:00:00', '1', '200.24', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10608', 'TOMSP', '4', '1997-07-23 00:00:00', '1997-08-20 00:00:00', '1997-08-01 00:00:00', '2', '27.79', 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', null, '44087', 'Germany');
INSERT INTO `example_orders` VALUES ('10609', 'DUMON', '7', '1997-07-24 00:00:00', '1997-08-21 00:00:00', '1997-07-30 00:00:00', '2', '1.85', 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', null, '44000', 'France');
INSERT INTO `example_orders` VALUES ('10610', 'LAMAI', '8', '1997-07-25 00:00:00', '1997-08-22 00:00:00', '1997-08-06 00:00:00', '1', '26.78', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10611', 'WOLZA', '6', '1997-07-25 00:00:00', '1997-08-22 00:00:00', '1997-08-01 00:00:00', '2', '80.65', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', null, '01-012', 'Poland');
INSERT INTO `example_orders` VALUES ('10612', 'SAVEA', '1', '1997-07-28 00:00:00', '1997-08-25 00:00:00', '1997-08-01 00:00:00', '2', '544.08', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10613', 'HILAA', '4', '1997-07-29 00:00:00', '1997-08-26 00:00:00', '1997-08-01 00:00:00', '2', '8.11', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10614', 'BLAUS', '8', '1997-07-29 00:00:00', '1997-08-26 00:00:00', '1997-08-01 00:00:00', '3', '1.93', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', null, '68306', 'Germany');
INSERT INTO `example_orders` VALUES ('10615', 'WILMK', '2', '1997-07-30 00:00:00', '1997-08-27 00:00:00', '1997-08-06 00:00:00', '3', '0.75', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', null, '21240', 'Finland');
INSERT INTO `example_orders` VALUES ('10616', 'GREAL', '1', '1997-07-31 00:00:00', '1997-08-28 00:00:00', '1997-08-05 00:00:00', '2', '116.53', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO `example_orders` VALUES ('10617', 'GREAL', '4', '1997-07-31 00:00:00', '1997-08-28 00:00:00', '1997-08-04 00:00:00', '2', '18.53', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO `example_orders` VALUES ('10618', 'MEREP', '1', '1997-08-01 00:00:00', '1997-09-12 00:00:00', '1997-08-08 00:00:00', '1', '154.68', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10619', 'MEREP', '3', '1997-08-04 00:00:00', '1997-09-01 00:00:00', '1997-08-07 00:00:00', '3', '91.05', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10620', 'LAUGB', '2', '1997-08-05 00:00:00', '1997-09-02 00:00:00', '1997-08-14 00:00:00', '3', '0.94', 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO `example_orders` VALUES ('10621', 'ISLAT', '4', '1997-08-05 00:00:00', '1997-09-02 00:00:00', '1997-08-11 00:00:00', '2', '23.73', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO `example_orders` VALUES ('10622', 'RICAR', '4', '1997-08-06 00:00:00', '1997-09-03 00:00:00', '1997-08-11 00:00:00', '3', '50.97', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO `example_orders` VALUES ('10623', 'FRANK', '8', '1997-08-07 00:00:00', '1997-09-04 00:00:00', '1997-08-12 00:00:00', '2', '97.18', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10624', 'THECR', '4', '1997-08-07 00:00:00', '1997-09-04 00:00:00', '1997-08-19 00:00:00', '2', '94.80', 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO `example_orders` VALUES ('10625', 'ANATR', '3', '1997-08-08 00:00:00', '1997-09-05 00:00:00', '1997-08-14 00:00:00', '1', '43.90', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', null, '05021', 'Mexico');
INSERT INTO `example_orders` VALUES ('10626', 'BERGS', '1', '1997-08-11 00:00:00', '1997-09-08 00:00:00', '1997-08-20 00:00:00', '2', '138.69', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10627', 'SAVEA', '8', '1997-08-11 00:00:00', '1997-09-22 00:00:00', '1997-08-21 00:00:00', '3', '107.46', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10628', 'BLONP', '4', '1997-08-12 00:00:00', '1997-09-09 00:00:00', '1997-08-20 00:00:00', '3', '30.36', 'Blondel père et fils', '24, place Kléber', 'Strasbourg', null, '67000', 'France');
INSERT INTO `example_orders` VALUES ('10629', 'GODOS', '4', '1997-08-12 00:00:00', '1997-09-09 00:00:00', '1997-08-20 00:00:00', '3', '85.46', 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', null, '41101', 'Spain');
INSERT INTO `example_orders` VALUES ('10630', 'KOENE', '1', '1997-08-13 00:00:00', '1997-09-10 00:00:00', '1997-08-19 00:00:00', '2', '32.35', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10631', 'LAMAI', '8', '1997-08-14 00:00:00', '1997-09-11 00:00:00', '1997-08-15 00:00:00', '1', '0.87', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10632', 'WANDK', '8', '1997-08-14 00:00:00', '1997-09-11 00:00:00', '1997-08-19 00:00:00', '1', '41.38', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', null, '70563', 'Germany');
INSERT INTO `example_orders` VALUES ('10633', 'ERNSH', '7', '1997-08-15 00:00:00', '1997-09-12 00:00:00', '1997-08-18 00:00:00', '3', '477.90', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10634', 'FOLIG', '4', '1997-08-15 00:00:00', '1997-09-12 00:00:00', '1997-08-21 00:00:00', '3', '487.38', 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', null, '59000', 'France');
INSERT INTO `example_orders` VALUES ('10635', 'MAGAA', '8', '1997-08-18 00:00:00', '1997-09-15 00:00:00', '1997-08-21 00:00:00', '3', '47.46', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', null, '24100', 'Italy');
INSERT INTO `example_orders` VALUES ('10636', 'WARTH', '4', '1997-08-19 00:00:00', '1997-09-16 00:00:00', '1997-08-26 00:00:00', '1', '1.15', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10637', 'QUEEN', '6', '1997-08-19 00:00:00', '1997-09-16 00:00:00', '1997-08-26 00:00:00', '1', '201.29', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('10638', 'LINOD', '3', '1997-08-20 00:00:00', '1997-09-17 00:00:00', '1997-09-01 00:00:00', '1', '158.44', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10639', 'SANTG', '7', '1997-08-20 00:00:00', '1997-09-17 00:00:00', '1997-08-27 00:00:00', '3', '38.64', 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', null, '4110', 'Norway');
INSERT INTO `example_orders` VALUES ('10640', 'WANDK', '4', '1997-08-21 00:00:00', '1997-09-18 00:00:00', '1997-08-28 00:00:00', '1', '23.55', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', null, '70563', 'Germany');
INSERT INTO `example_orders` VALUES ('10641', 'HILAA', '4', '1997-08-22 00:00:00', '1997-09-19 00:00:00', '1997-08-26 00:00:00', '2', '179.61', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10642', 'SIMOB', '7', '1997-08-22 00:00:00', '1997-09-19 00:00:00', '1997-09-05 00:00:00', '3', '41.89', 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', null, '1734', 'Denmark');
INSERT INTO `example_orders` VALUES ('10643', 'ALFKI', '6', '1997-08-25 00:00:00', '1997-09-22 00:00:00', '1997-09-02 00:00:00', '1', '29.46', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', null, '12209', 'Germany');
INSERT INTO `example_orders` VALUES ('10644', 'WELLI', '3', '1997-08-25 00:00:00', '1997-09-22 00:00:00', '1997-09-01 00:00:00', '2', '0.14', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO `example_orders` VALUES ('10645', 'HANAR', '4', '1997-08-26 00:00:00', '1997-09-23 00:00:00', '1997-09-02 00:00:00', '1', '12.41', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('10646', 'HUNGO', '9', '1997-08-27 00:00:00', '1997-10-08 00:00:00', '1997-09-03 00:00:00', '3', '142.33', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10647', 'QUEDE', '4', '1997-08-27 00:00:00', '1997-09-10 00:00:00', '1997-09-03 00:00:00', '2', '45.54', 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO `example_orders` VALUES ('10648', 'RICAR', '5', '1997-08-28 00:00:00', '1997-10-09 00:00:00', '1997-09-09 00:00:00', '2', '14.25', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO `example_orders` VALUES ('10649', 'MAISD', '5', '1997-08-28 00:00:00', '1997-09-25 00:00:00', '1997-08-29 00:00:00', '3', '6.20', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', null, 'B-1180', 'Belgium');
INSERT INTO `example_orders` VALUES ('10650', 'FAMIA', '5', '1997-08-29 00:00:00', '1997-09-26 00:00:00', '1997-09-03 00:00:00', '3', '176.81', 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10651', 'WANDK', '8', '1997-09-01 00:00:00', '1997-09-29 00:00:00', '1997-09-11 00:00:00', '2', '20.60', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', null, '70563', 'Germany');
INSERT INTO `example_orders` VALUES ('10652', 'GOURL', '4', '1997-09-01 00:00:00', '1997-09-29 00:00:00', '1997-09-08 00:00:00', '2', '7.14', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO `example_orders` VALUES ('10653', 'FRANK', '1', '1997-09-02 00:00:00', '1997-09-30 00:00:00', '1997-09-19 00:00:00', '1', '93.25', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10654', 'BERGS', '5', '1997-09-02 00:00:00', '1997-09-30 00:00:00', '1997-09-11 00:00:00', '1', '55.26', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10655', 'REGGC', '1', '1997-09-03 00:00:00', '1997-10-01 00:00:00', '1997-09-11 00:00:00', '2', '4.41', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy');
INSERT INTO `example_orders` VALUES ('10656', 'GREAL', '6', '1997-09-04 00:00:00', '1997-10-02 00:00:00', '1997-09-10 00:00:00', '1', '57.15', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO `example_orders` VALUES ('10657', 'SAVEA', '2', '1997-09-04 00:00:00', '1997-10-02 00:00:00', '1997-09-15 00:00:00', '2', '352.69', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10658', 'QUICK', '4', '1997-09-05 00:00:00', '1997-10-03 00:00:00', '1997-09-08 00:00:00', '1', '364.15', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10659', 'QUEEN', '7', '1997-09-05 00:00:00', '1997-10-03 00:00:00', '1997-09-10 00:00:00', '2', '105.81', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('10660', 'HUNGC', '8', '1997-09-08 00:00:00', '1997-10-06 00:00:00', '1997-10-15 00:00:00', '1', '111.29', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO `example_orders` VALUES ('10661', 'HUNGO', '7', '1997-09-09 00:00:00', '1997-10-07 00:00:00', '1997-09-15 00:00:00', '3', '17.55', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10662', 'LONEP', '3', '1997-09-09 00:00:00', '1997-10-07 00:00:00', '1997-09-18 00:00:00', '2', '1.28', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO `example_orders` VALUES ('10663', 'BONAP', '2', '1997-09-10 00:00:00', '1997-09-24 00:00:00', '1997-10-03 00:00:00', '2', '113.15', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10664', 'FURIB', '1', '1997-09-10 00:00:00', '1997-10-08 00:00:00', '1997-09-19 00:00:00', '3', '1.27', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', null, '1675', 'Portugal');
INSERT INTO `example_orders` VALUES ('10665', 'LONEP', '1', '1997-09-11 00:00:00', '1997-10-09 00:00:00', '1997-09-17 00:00:00', '2', '26.31', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO `example_orders` VALUES ('10666', 'RICSU', '7', '1997-09-12 00:00:00', '1997-10-10 00:00:00', '1997-09-22 00:00:00', '2', '232.42', 'Richter Supermarkt', 'Starenweg 5', 'Genève', null, '1204', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10667', 'ERNSH', '7', '1997-09-12 00:00:00', '1997-10-10 00:00:00', '1997-09-19 00:00:00', '1', '78.09', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10668', 'WANDK', '1', '1997-09-15 00:00:00', '1997-10-13 00:00:00', '1997-09-23 00:00:00', '2', '47.22', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', null, '70563', 'Germany');
INSERT INTO `example_orders` VALUES ('10669', 'SIMOB', '2', '1997-09-15 00:00:00', '1997-10-13 00:00:00', '1997-09-22 00:00:00', '1', '24.39', 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', null, '1734', 'Denmark');
INSERT INTO `example_orders` VALUES ('10670', 'FRANK', '4', '1997-09-16 00:00:00', '1997-10-14 00:00:00', '1997-09-18 00:00:00', '1', '203.48', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10671', 'FRANR', '1', '1997-09-17 00:00:00', '1997-10-15 00:00:00', '1997-09-24 00:00:00', '1', '30.34', 'France restauration', '54, rue Royale', 'Nantes', null, '44000', 'France');
INSERT INTO `example_orders` VALUES ('10672', 'BERGS', '9', '1997-09-17 00:00:00', '1997-10-01 00:00:00', '1997-09-26 00:00:00', '2', '95.75', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10673', 'WILMK', '2', '1997-09-18 00:00:00', '1997-10-16 00:00:00', '1997-09-19 00:00:00', '1', '22.76', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', null, '21240', 'Finland');
INSERT INTO `example_orders` VALUES ('10674', 'ISLAT', '4', '1997-09-18 00:00:00', '1997-10-16 00:00:00', '1997-09-30 00:00:00', '2', '0.90', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO `example_orders` VALUES ('10675', 'FRANK', '5', '1997-09-19 00:00:00', '1997-10-17 00:00:00', '1997-09-23 00:00:00', '2', '31.85', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10676', 'TORTU', '2', '1997-09-22 00:00:00', '1997-10-20 00:00:00', '1997-09-29 00:00:00', '2', '2.01', 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10677', 'ANTON', '1', '1997-09-22 00:00:00', '1997-10-20 00:00:00', '1997-09-26 00:00:00', '3', '4.03', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', null, '05023', 'Mexico');
INSERT INTO `example_orders` VALUES ('10678', 'SAVEA', '7', '1997-09-23 00:00:00', '1997-10-21 00:00:00', '1997-10-16 00:00:00', '3', '388.98', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10679', 'BLONP', '8', '1997-09-23 00:00:00', '1997-10-21 00:00:00', '1997-09-30 00:00:00', '3', '27.94', 'Blondel père et fils', '24, place Kléber', 'Strasbourg', null, '67000', 'France');
INSERT INTO `example_orders` VALUES ('10680', 'OLDWO', '1', '1997-09-24 00:00:00', '1997-10-22 00:00:00', '1997-09-26 00:00:00', '1', '26.61', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO `example_orders` VALUES ('10681', 'GREAL', '3', '1997-09-25 00:00:00', '1997-10-23 00:00:00', '1997-09-30 00:00:00', '3', '76.13', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO `example_orders` VALUES ('10682', 'ANTON', '3', '1997-09-25 00:00:00', '1997-10-23 00:00:00', '1997-10-01 00:00:00', '2', '36.13', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', null, '05023', 'Mexico');
INSERT INTO `example_orders` VALUES ('10683', 'DUMON', '2', '1997-09-26 00:00:00', '1997-10-24 00:00:00', '1997-10-01 00:00:00', '1', '4.40', 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', null, '44000', 'France');
INSERT INTO `example_orders` VALUES ('10684', 'OTTIK', '3', '1997-09-26 00:00:00', '1997-10-24 00:00:00', '1997-09-30 00:00:00', '1', '145.63', 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', null, '50739', 'Germany');
INSERT INTO `example_orders` VALUES ('10685', 'GOURL', '4', '1997-09-29 00:00:00', '1997-10-13 00:00:00', '1997-10-03 00:00:00', '2', '33.75', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO `example_orders` VALUES ('10686', 'PICCO', '2', '1997-09-30 00:00:00', '1997-10-28 00:00:00', '1997-10-08 00:00:00', '1', '96.50', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', null, '5020', 'Austria');
INSERT INTO `example_orders` VALUES ('10687', 'HUNGO', '9', '1997-09-30 00:00:00', '1997-10-28 00:00:00', '1997-10-30 00:00:00', '2', '296.43', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10688', 'VAFFE', '4', '1997-10-01 00:00:00', '1997-10-15 00:00:00', '1997-10-07 00:00:00', '2', '299.09', 'Vaffeljernet', 'Smagsloget 45', 'Århus', null, '8200', 'Denmark');
INSERT INTO `example_orders` VALUES ('10689', 'BERGS', '1', '1997-10-01 00:00:00', '1997-10-29 00:00:00', '1997-10-07 00:00:00', '2', '13.42', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10690', 'HANAR', '1', '1997-10-02 00:00:00', '1997-10-30 00:00:00', '1997-10-03 00:00:00', '1', '15.80', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('10691', 'QUICK', '2', '1997-10-03 00:00:00', '1997-11-14 00:00:00', '1997-10-22 00:00:00', '2', '810.05', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10692', 'ALFKI', '4', '1997-10-03 00:00:00', '1997-10-31 00:00:00', '1997-10-13 00:00:00', '2', '61.02', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', null, '12209', 'Germany');
INSERT INTO `example_orders` VALUES ('10693', 'WHITC', '3', '1997-10-06 00:00:00', '1997-10-20 00:00:00', '1997-10-10 00:00:00', '3', '139.34', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('10694', 'QUICK', '8', '1997-10-06 00:00:00', '1997-11-03 00:00:00', '1997-10-09 00:00:00', '3', '398.36', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10695', 'WILMK', '7', '1997-10-07 00:00:00', '1997-11-18 00:00:00', '1997-10-14 00:00:00', '1', '16.72', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', null, '21240', 'Finland');
INSERT INTO `example_orders` VALUES ('10696', 'WHITC', '8', '1997-10-08 00:00:00', '1997-11-19 00:00:00', '1997-10-14 00:00:00', '3', '102.55', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('10697', 'LINOD', '3', '1997-10-08 00:00:00', '1997-11-05 00:00:00', '1997-10-14 00:00:00', '1', '45.52', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10698', 'ERNSH', '4', '1997-10-09 00:00:00', '1997-11-06 00:00:00', '1997-10-17 00:00:00', '1', '272.47', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10699', 'MORGK', '3', '1997-10-09 00:00:00', '1997-11-06 00:00:00', '1997-10-13 00:00:00', '3', '0.58', 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', null, '04179', 'Germany');
INSERT INTO `example_orders` VALUES ('10700', 'SAVEA', '3', '1997-10-10 00:00:00', '1997-11-07 00:00:00', '1997-10-16 00:00:00', '1', '65.10', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10701', 'HUNGO', '6', '1997-10-13 00:00:00', '1997-10-27 00:00:00', '1997-10-15 00:00:00', '3', '220.31', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10702', 'ALFKI', '4', '1997-10-13 00:00:00', '1997-11-24 00:00:00', '1997-10-21 00:00:00', '1', '23.94', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', null, '12209', 'Germany');
INSERT INTO `example_orders` VALUES ('10703', 'FOLKO', '6', '1997-10-14 00:00:00', '1997-11-11 00:00:00', '1997-10-20 00:00:00', '2', '152.30', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10704', 'QUEEN', '6', '1997-10-14 00:00:00', '1997-11-11 00:00:00', '1997-11-07 00:00:00', '1', '4.78', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('10705', 'HILAA', '9', '1997-10-15 00:00:00', '1997-11-12 00:00:00', '1997-11-18 00:00:00', '2', '3.52', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10706', 'OLDWO', '8', '1997-10-16 00:00:00', '1997-11-13 00:00:00', '1997-10-21 00:00:00', '3', '135.63', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO `example_orders` VALUES ('10707', 'AROUT', '4', '1997-10-16 00:00:00', '1997-10-30 00:00:00', '1997-10-23 00:00:00', '3', '21.74', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('10708', 'THEBI', '6', '1997-10-17 00:00:00', '1997-11-28 00:00:00', '1997-11-05 00:00:00', '2', '2.96', 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO `example_orders` VALUES ('10709', 'GOURL', '1', '1997-10-17 00:00:00', '1997-11-14 00:00:00', '1997-11-20 00:00:00', '3', '210.80', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO `example_orders` VALUES ('10710', 'FRANS', '1', '1997-10-20 00:00:00', '1997-11-17 00:00:00', '1997-10-23 00:00:00', '1', '4.98', 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', null, '10100', 'Italy');
INSERT INTO `example_orders` VALUES ('10711', 'SAVEA', '5', '1997-10-21 00:00:00', '1997-12-02 00:00:00', '1997-10-29 00:00:00', '2', '52.41', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10712', 'HUNGO', '3', '1997-10-21 00:00:00', '1997-11-18 00:00:00', '1997-10-31 00:00:00', '1', '89.93', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10713', 'SAVEA', '1', '1997-10-22 00:00:00', '1997-11-19 00:00:00', '1997-10-24 00:00:00', '1', '167.05', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10714', 'SAVEA', '5', '1997-10-22 00:00:00', '1997-11-19 00:00:00', '1997-10-27 00:00:00', '3', '24.49', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10715', 'BONAP', '3', '1997-10-23 00:00:00', '1997-11-06 00:00:00', '1997-10-29 00:00:00', '1', '63.20', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10716', 'RANCH', '4', '1997-10-24 00:00:00', '1997-11-21 00:00:00', '1997-10-27 00:00:00', '2', '22.57', 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10717', 'FRANK', '1', '1997-10-24 00:00:00', '1997-11-21 00:00:00', '1997-10-29 00:00:00', '2', '59.25', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10718', 'KOENE', '1', '1997-10-27 00:00:00', '1997-11-24 00:00:00', '1997-10-29 00:00:00', '3', '170.88', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10719', 'LETSS', '8', '1997-10-27 00:00:00', '1997-11-24 00:00:00', '1997-11-05 00:00:00', '2', '51.44', 'Lets Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO `example_orders` VALUES ('10720', 'QUEDE', '8', '1997-10-28 00:00:00', '1997-11-11 00:00:00', '1997-11-05 00:00:00', '2', '9.53', 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO `example_orders` VALUES ('10721', 'QUICK', '5', '1997-10-29 00:00:00', '1997-11-26 00:00:00', '1997-10-31 00:00:00', '3', '48.92', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10722', 'SAVEA', '8', '1997-10-29 00:00:00', '1997-12-10 00:00:00', '1997-11-04 00:00:00', '1', '74.58', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10723', 'WHITC', '3', '1997-10-30 00:00:00', '1997-11-27 00:00:00', '1997-11-25 00:00:00', '1', '21.72', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('10724', 'MEREP', '8', '1997-10-30 00:00:00', '1997-12-11 00:00:00', '1997-11-05 00:00:00', '2', '57.75', 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO `example_orders` VALUES ('10725', 'FAMIA', '4', '1997-10-31 00:00:00', '1997-11-28 00:00:00', '1997-11-05 00:00:00', '3', '10.83', 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10726', 'EASTC', '4', '1997-11-03 00:00:00', '1997-11-17 00:00:00', '1997-12-05 00:00:00', '1', '16.56', 'Eastern Connection', '35 King George', 'London', null, 'WX3 6FW', 'UK');
INSERT INTO `example_orders` VALUES ('10727', 'REGGC', '2', '1997-11-03 00:00:00', '1997-12-01 00:00:00', '1997-12-05 00:00:00', '1', '89.90', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy');
INSERT INTO `example_orders` VALUES ('10728', 'QUEEN', '4', '1997-11-04 00:00:00', '1997-12-02 00:00:00', '1997-11-11 00:00:00', '2', '58.33', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('10729', 'LINOD', '8', '1997-11-04 00:00:00', '1997-12-16 00:00:00', '1997-11-14 00:00:00', '3', '141.06', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10730', 'BONAP', '5', '1997-11-05 00:00:00', '1997-12-03 00:00:00', '1997-11-14 00:00:00', '1', '20.12', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10731', 'CHOPS', '7', '1997-11-06 00:00:00', '1997-12-04 00:00:00', '1997-11-14 00:00:00', '1', '96.65', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', null, '3012', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10732', 'BONAP', '3', '1997-11-06 00:00:00', '1997-12-04 00:00:00', '1997-11-07 00:00:00', '1', '16.97', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10733', 'BERGS', '1', '1997-11-07 00:00:00', '1997-12-05 00:00:00', '1997-11-10 00:00:00', '3', '110.11', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10734', 'GOURL', '2', '1997-11-07 00:00:00', '1997-12-05 00:00:00', '1997-11-12 00:00:00', '3', '1.63', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO `example_orders` VALUES ('10735', 'LETSS', '6', '1997-11-10 00:00:00', '1997-12-08 00:00:00', '1997-11-21 00:00:00', '2', '45.97', 'Lets Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO `example_orders` VALUES ('10736', 'HUNGO', '9', '1997-11-11 00:00:00', '1997-12-09 00:00:00', '1997-11-21 00:00:00', '2', '44.10', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10737', 'VINET', '2', '1997-11-11 00:00:00', '1997-12-09 00:00:00', '1997-11-18 00:00:00', '2', '7.79', 'Vins et alcools Chevalier', '59 rue de lAbbaye', 'Reims', null, '51100', 'France');
INSERT INTO `example_orders` VALUES ('10738', 'SPECD', '2', '1997-11-12 00:00:00', '1997-12-10 00:00:00', '1997-11-18 00:00:00', '1', '2.91', 'Spécialités du monde', '25, rue Lauriston', 'Paris', null, '75016', 'France');
INSERT INTO `example_orders` VALUES ('10739', 'VINET', '3', '1997-11-12 00:00:00', '1997-12-10 00:00:00', '1997-11-17 00:00:00', '3', '11.08', 'Vins et alcools Chevalier', '59 rue de lAbbaye', 'Reims', null, '51100', 'France');
INSERT INTO `example_orders` VALUES ('10740', 'WHITC', '4', '1997-11-13 00:00:00', '1997-12-11 00:00:00', '1997-11-25 00:00:00', '2', '81.88', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('10741', 'AROUT', '4', '1997-11-14 00:00:00', '1997-11-28 00:00:00', '1997-11-18 00:00:00', '3', '10.96', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('10742', 'BOTTM', '3', '1997-11-14 00:00:00', '1997-12-12 00:00:00', '1997-11-18 00:00:00', '3', '243.73', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('10743', 'AROUT', '1', '1997-11-17 00:00:00', '1997-12-15 00:00:00', '1997-11-21 00:00:00', '2', '23.72', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('10744', 'VAFFE', '6', '1997-11-17 00:00:00', '1997-12-15 00:00:00', '1997-11-24 00:00:00', '1', '69.19', 'Vaffeljernet', 'Smagsloget 45', 'Århus', null, '8200', 'Denmark');
INSERT INTO `example_orders` VALUES ('10745', 'QUICK', '9', '1997-11-18 00:00:00', '1997-12-16 00:00:00', '1997-11-27 00:00:00', '1', '3.52', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10746', 'CHOPS', '1', '1997-11-19 00:00:00', '1997-12-17 00:00:00', '1997-11-21 00:00:00', '3', '31.43', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', null, '3012', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10747', 'PICCO', '6', '1997-11-19 00:00:00', '1997-12-17 00:00:00', '1997-11-26 00:00:00', '1', '117.33', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', null, '5020', 'Austria');
INSERT INTO `example_orders` VALUES ('10748', 'SAVEA', '3', '1997-11-20 00:00:00', '1997-12-18 00:00:00', '1997-11-28 00:00:00', '1', '232.55', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10749', 'ISLAT', '4', '1997-11-20 00:00:00', '1997-12-18 00:00:00', '1997-12-19 00:00:00', '2', '61.53', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO `example_orders` VALUES ('10750', 'WARTH', '9', '1997-11-21 00:00:00', '1997-12-19 00:00:00', '1997-11-24 00:00:00', '1', '79.30', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10751', 'RICSU', '3', '1997-11-24 00:00:00', '1997-12-22 00:00:00', '1997-12-03 00:00:00', '3', '130.79', 'Richter Supermarkt', 'Starenweg 5', 'Genève', null, '1204', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10752', 'NORTS', '2', '1997-11-24 00:00:00', '1997-12-22 00:00:00', '1997-11-28 00:00:00', '3', '1.39', 'North/South', 'South House 300 Queensbridge', 'London', null, 'SW7 1RZ', 'UK');
INSERT INTO `example_orders` VALUES ('10753', 'FRANS', '3', '1997-11-25 00:00:00', '1997-12-23 00:00:00', '1997-11-27 00:00:00', '1', '7.70', 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', null, '10100', 'Italy');
INSERT INTO `example_orders` VALUES ('10754', 'MAGAA', '6', '1997-11-25 00:00:00', '1997-12-23 00:00:00', '1997-11-27 00:00:00', '3', '2.38', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', null, '24100', 'Italy');
INSERT INTO `example_orders` VALUES ('10755', 'BONAP', '4', '1997-11-26 00:00:00', '1997-12-24 00:00:00', '1997-11-28 00:00:00', '2', '16.71', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10756', 'SPLIR', '8', '1997-11-27 00:00:00', '1997-12-25 00:00:00', '1997-12-02 00:00:00', '2', '73.21', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO `example_orders` VALUES ('10757', 'SAVEA', '6', '1997-11-27 00:00:00', '1997-12-25 00:00:00', '1997-12-15 00:00:00', '1', '8.19', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10758', 'RICSU', '3', '1997-11-28 00:00:00', '1997-12-26 00:00:00', '1997-12-04 00:00:00', '3', '138.17', 'Richter Supermarkt', 'Starenweg 5', 'Genève', null, '1204', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10759', 'ANATR', '3', '1997-11-28 00:00:00', '1997-12-26 00:00:00', '1997-12-12 00:00:00', '3', '11.99', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', null, '05021', 'Mexico');
INSERT INTO `example_orders` VALUES ('10760', 'MAISD', '4', '1997-12-01 00:00:00', '1997-12-29 00:00:00', '1997-12-10 00:00:00', '1', '155.64', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', null, 'B-1180', 'Belgium');
INSERT INTO `example_orders` VALUES ('10761', 'RATTC', '5', '1997-12-02 00:00:00', '1997-12-30 00:00:00', '1997-12-08 00:00:00', '2', '18.66', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10762', 'FOLKO', '3', '1997-12-02 00:00:00', '1997-12-30 00:00:00', '1997-12-09 00:00:00', '1', '328.74', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10763', 'FOLIG', '3', '1997-12-03 00:00:00', '1997-12-31 00:00:00', '1997-12-08 00:00:00', '3', '37.35', 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', null, '59000', 'France');
INSERT INTO `example_orders` VALUES ('10764', 'ERNSH', '6', '1997-12-03 00:00:00', '1997-12-31 00:00:00', '1997-12-08 00:00:00', '3', '145.45', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10765', 'QUICK', '3', '1997-12-04 00:00:00', '1998-01-01 00:00:00', '1997-12-09 00:00:00', '3', '42.74', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10766', 'OTTIK', '4', '1997-12-05 00:00:00', '1998-01-02 00:00:00', '1997-12-09 00:00:00', '1', '157.55', 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', null, '50739', 'Germany');
INSERT INTO `example_orders` VALUES ('10767', 'SUPRD', '4', '1997-12-05 00:00:00', '1998-01-02 00:00:00', '1997-12-15 00:00:00', '3', '1.59', 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium');
INSERT INTO `example_orders` VALUES ('10768', 'AROUT', '3', '1997-12-08 00:00:00', '1998-01-05 00:00:00', '1997-12-15 00:00:00', '2', '146.32', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('10769', 'VAFFE', '3', '1997-12-08 00:00:00', '1998-01-05 00:00:00', '1997-12-12 00:00:00', '1', '65.06', 'Vaffeljernet', 'Smagsloget 45', 'Århus', null, '8200', 'Denmark');
INSERT INTO `example_orders` VALUES ('10770', 'HANAR', '8', '1997-12-09 00:00:00', '1998-01-06 00:00:00', '1997-12-17 00:00:00', '3', '5.32', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('10771', 'ERNSH', '9', '1997-12-10 00:00:00', '1998-01-07 00:00:00', '1998-01-02 00:00:00', '2', '11.19', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10772', 'LEHMS', '3', '1997-12-10 00:00:00', '1998-01-07 00:00:00', '1997-12-19 00:00:00', '2', '91.28', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10773', 'ERNSH', '1', '1997-12-11 00:00:00', '1998-01-08 00:00:00', '1997-12-16 00:00:00', '3', '96.43', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10774', 'FOLKO', '4', '1997-12-11 00:00:00', '1997-12-25 00:00:00', '1997-12-12 00:00:00', '1', '48.20', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10775', 'THECR', '7', '1997-12-12 00:00:00', '1998-01-09 00:00:00', '1997-12-26 00:00:00', '1', '20.25', 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO `example_orders` VALUES ('10776', 'ERNSH', '1', '1997-12-15 00:00:00', '1998-01-12 00:00:00', '1997-12-18 00:00:00', '3', '351.53', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10777', 'GOURL', '7', '1997-12-15 00:00:00', '1997-12-29 00:00:00', '1998-01-21 00:00:00', '2', '3.01', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO `example_orders` VALUES ('10778', 'BERGS', '3', '1997-12-16 00:00:00', '1998-01-13 00:00:00', '1997-12-24 00:00:00', '1', '6.79', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10779', 'MORGK', '3', '1997-12-16 00:00:00', '1998-01-13 00:00:00', '1998-01-14 00:00:00', '2', '58.13', 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', null, '04179', 'Germany');
INSERT INTO `example_orders` VALUES ('10780', 'LILAS', '2', '1997-12-16 00:00:00', '1997-12-30 00:00:00', '1997-12-25 00:00:00', '1', '42.13', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10781', 'WARTH', '2', '1997-12-17 00:00:00', '1998-01-14 00:00:00', '1997-12-19 00:00:00', '3', '73.16', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('10782', 'CACTU', '9', '1997-12-17 00:00:00', '1998-01-14 00:00:00', '1997-12-22 00:00:00', '3', '1.10', 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10783', 'HANAR', '4', '1997-12-18 00:00:00', '1998-01-15 00:00:00', '1997-12-19 00:00:00', '2', '124.98', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('10784', 'MAGAA', '4', '1997-12-18 00:00:00', '1998-01-15 00:00:00', '1997-12-22 00:00:00', '3', '70.09', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', null, '24100', 'Italy');
INSERT INTO `example_orders` VALUES ('10785', 'GROSR', '1', '1997-12-18 00:00:00', '1998-01-15 00:00:00', '1997-12-24 00:00:00', '3', '1.51', 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10786', 'QUEEN', '8', '1997-12-19 00:00:00', '1998-01-16 00:00:00', '1997-12-23 00:00:00', '1', '110.87', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('10787', 'LAMAI', '2', '1997-12-19 00:00:00', '1998-01-02 00:00:00', '1997-12-26 00:00:00', '1', '249.93', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10788', 'QUICK', '1', '1997-12-22 00:00:00', '1998-01-19 00:00:00', '1998-01-19 00:00:00', '2', '42.70', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10789', 'FOLIG', '1', '1997-12-22 00:00:00', '1998-01-19 00:00:00', '1997-12-31 00:00:00', '2', '100.60', 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', null, '59000', 'France');
INSERT INTO `example_orders` VALUES ('10790', 'GOURL', '6', '1997-12-22 00:00:00', '1998-01-19 00:00:00', '1997-12-26 00:00:00', '1', '28.23', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO `example_orders` VALUES ('10791', 'FRANK', '6', '1997-12-23 00:00:00', '1998-01-20 00:00:00', '1998-01-01 00:00:00', '2', '16.85', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10792', 'WOLZA', '1', '1997-12-23 00:00:00', '1998-01-20 00:00:00', '1997-12-31 00:00:00', '3', '23.79', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', null, '01-012', 'Poland');
INSERT INTO `example_orders` VALUES ('10793', 'AROUT', '3', '1997-12-24 00:00:00', '1998-01-21 00:00:00', '1998-01-08 00:00:00', '3', '4.52', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('10794', 'QUEDE', '6', '1997-12-24 00:00:00', '1998-01-21 00:00:00', '1998-01-02 00:00:00', '1', '21.49', 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO `example_orders` VALUES ('10795', 'ERNSH', '8', '1997-12-24 00:00:00', '1998-01-21 00:00:00', '1998-01-20 00:00:00', '2', '126.66', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10796', 'HILAA', '3', '1997-12-25 00:00:00', '1998-01-22 00:00:00', '1998-01-14 00:00:00', '1', '26.52', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10797', 'DRACD', '7', '1997-12-25 00:00:00', '1998-01-22 00:00:00', '1998-01-05 00:00:00', '2', '33.35', 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', null, '52066', 'Germany');
INSERT INTO `example_orders` VALUES ('10798', 'ISLAT', '2', '1997-12-26 00:00:00', '1998-01-23 00:00:00', '1998-01-05 00:00:00', '1', '2.33', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO `example_orders` VALUES ('10799', 'KOENE', '9', '1997-12-26 00:00:00', '1998-02-06 00:00:00', '1998-01-05 00:00:00', '3', '30.76', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10800', 'SEVES', '1', '1997-12-26 00:00:00', '1998-01-23 00:00:00', '1998-01-05 00:00:00', '3', '137.44', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', null, 'OX15 4NB', 'UK');
INSERT INTO `example_orders` VALUES ('10801', 'BOLID', '4', '1997-12-29 00:00:00', '1998-01-26 00:00:00', '1997-12-31 00:00:00', '2', '97.09', 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', null, '28023', 'Spain');
INSERT INTO `example_orders` VALUES ('10802', 'SIMOB', '4', '1997-12-29 00:00:00', '1998-01-26 00:00:00', '1998-01-02 00:00:00', '2', '257.26', 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', null, '1734', 'Denmark');
INSERT INTO `example_orders` VALUES ('10803', 'WELLI', '4', '1997-12-30 00:00:00', '1998-01-27 00:00:00', '1998-01-06 00:00:00', '1', '55.23', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO `example_orders` VALUES ('10804', 'SEVES', '6', '1997-12-30 00:00:00', '1998-01-27 00:00:00', '1998-01-07 00:00:00', '2', '27.33', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', null, 'OX15 4NB', 'UK');
INSERT INTO `example_orders` VALUES ('10805', 'THEBI', '2', '1997-12-30 00:00:00', '1998-01-27 00:00:00', '1998-01-09 00:00:00', '3', '237.34', 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO `example_orders` VALUES ('10806', 'VICTE', '3', '1997-12-31 00:00:00', '1998-01-28 00:00:00', '1998-01-05 00:00:00', '2', '22.11', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', null, '69004', 'France');
INSERT INTO `example_orders` VALUES ('10807', 'FRANS', '4', '1997-12-31 00:00:00', '1998-01-28 00:00:00', '1998-01-30 00:00:00', '1', '1.36', 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', null, '10100', 'Italy');
INSERT INTO `example_orders` VALUES ('10808', 'OLDWO', '2', '1998-01-01 00:00:00', '1998-01-29 00:00:00', '1998-01-09 00:00:00', '3', '45.53', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO `example_orders` VALUES ('10809', 'WELLI', '7', '1998-01-01 00:00:00', '1998-01-29 00:00:00', '1998-01-07 00:00:00', '1', '4.87', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO `example_orders` VALUES ('10810', 'LAUGB', '2', '1998-01-01 00:00:00', '1998-01-29 00:00:00', '1998-01-07 00:00:00', '3', '4.33', 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO `example_orders` VALUES ('10811', 'LINOD', '8', '1998-01-02 00:00:00', '1998-01-30 00:00:00', '1998-01-08 00:00:00', '1', '31.22', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10812', 'REGGC', '5', '1998-01-02 00:00:00', '1998-01-30 00:00:00', '1998-01-12 00:00:00', '1', '59.78', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy');
INSERT INTO `example_orders` VALUES ('10813', 'RICAR', '1', '1998-01-05 00:00:00', '1998-02-02 00:00:00', '1998-01-09 00:00:00', '1', '47.38', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO `example_orders` VALUES ('10814', 'VICTE', '3', '1998-01-05 00:00:00', '1998-02-02 00:00:00', '1998-01-14 00:00:00', '3', '130.94', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', null, '69004', 'France');
INSERT INTO `example_orders` VALUES ('10815', 'SAVEA', '2', '1998-01-05 00:00:00', '1998-02-02 00:00:00', '1998-01-14 00:00:00', '3', '14.62', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10816', 'GREAL', '4', '1998-01-06 00:00:00', '1998-02-03 00:00:00', '1998-02-04 00:00:00', '2', '719.78', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO `example_orders` VALUES ('10817', 'KOENE', '3', '1998-01-06 00:00:00', '1998-01-20 00:00:00', '1998-01-13 00:00:00', '2', '306.07', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10818', 'MAGAA', '7', '1998-01-07 00:00:00', '1998-02-04 00:00:00', '1998-01-12 00:00:00', '3', '65.48', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', null, '24100', 'Italy');
INSERT INTO `example_orders` VALUES ('10819', 'CACTU', '2', '1998-01-07 00:00:00', '1998-02-04 00:00:00', '1998-01-16 00:00:00', '3', '19.76', 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10820', 'RATTC', '3', '1998-01-07 00:00:00', '1998-02-04 00:00:00', '1998-01-13 00:00:00', '2', '37.52', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10821', 'SPLIR', '1', '1998-01-08 00:00:00', '1998-02-05 00:00:00', '1998-01-15 00:00:00', '1', '36.68', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO `example_orders` VALUES ('10822', 'TRAIH', '6', '1998-01-08 00:00:00', '1998-02-05 00:00:00', '1998-01-16 00:00:00', '3', '7.00', 'Trails Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO `example_orders` VALUES ('10823', 'LILAS', '5', '1998-01-09 00:00:00', '1998-02-06 00:00:00', '1998-01-13 00:00:00', '2', '163.97', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10824', 'FOLKO', '8', '1998-01-09 00:00:00', '1998-02-06 00:00:00', '1998-01-30 00:00:00', '1', '1.23', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10825', 'DRACD', '1', '1998-01-09 00:00:00', '1998-02-06 00:00:00', '1998-01-14 00:00:00', '1', '79.25', 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', null, '52066', 'Germany');
INSERT INTO `example_orders` VALUES ('10826', 'BLONP', '6', '1998-01-12 00:00:00', '1998-02-09 00:00:00', '1998-02-06 00:00:00', '1', '7.09', 'Blondel père et fils', '24, place Kléber', 'Strasbourg', null, '67000', 'France');
INSERT INTO `example_orders` VALUES ('10827', 'BONAP', '1', '1998-01-12 00:00:00', '1998-01-26 00:00:00', '1998-02-06 00:00:00', '2', '63.54', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10828', 'RANCH', '9', '1998-01-13 00:00:00', '1998-01-27 00:00:00', '1998-02-04 00:00:00', '1', '90.85', 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10829', 'ISLAT', '9', '1998-01-13 00:00:00', '1998-02-10 00:00:00', '1998-01-23 00:00:00', '1', '154.72', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO `example_orders` VALUES ('10830', 'TRADH', '4', '1998-01-13 00:00:00', '1998-02-24 00:00:00', '1998-01-21 00:00:00', '2', '81.83', 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10831', 'SANTG', '3', '1998-01-14 00:00:00', '1998-02-11 00:00:00', '1998-01-23 00:00:00', '2', '72.19', 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', null, '4110', 'Norway');
INSERT INTO `example_orders` VALUES ('10832', 'LAMAI', '2', '1998-01-14 00:00:00', '1998-02-11 00:00:00', '1998-01-19 00:00:00', '2', '43.26', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10833', 'OTTIK', '6', '1998-01-15 00:00:00', '1998-02-12 00:00:00', '1998-01-23 00:00:00', '2', '71.49', 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', null, '50739', 'Germany');
INSERT INTO `example_orders` VALUES ('10834', 'TRADH', '1', '1998-01-15 00:00:00', '1998-02-12 00:00:00', '1998-01-19 00:00:00', '3', '29.78', 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10835', 'ALFKI', '1', '1998-01-15 00:00:00', '1998-02-12 00:00:00', '1998-01-21 00:00:00', '3', '69.53', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', null, '12209', 'Germany');
INSERT INTO `example_orders` VALUES ('10836', 'ERNSH', '7', '1998-01-16 00:00:00', '1998-02-13 00:00:00', '1998-01-21 00:00:00', '1', '411.88', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10837', 'BERGS', '9', '1998-01-16 00:00:00', '1998-02-13 00:00:00', '1998-01-23 00:00:00', '3', '13.32', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10838', 'LINOD', '3', '1998-01-19 00:00:00', '1998-02-16 00:00:00', '1998-01-23 00:00:00', '3', '59.28', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10839', 'TRADH', '3', '1998-01-19 00:00:00', '1998-02-16 00:00:00', '1998-01-22 00:00:00', '3', '35.43', 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO `example_orders` VALUES ('10840', 'LINOD', '4', '1998-01-19 00:00:00', '1998-03-02 00:00:00', '1998-02-16 00:00:00', '2', '2.71', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10841', 'SUPRD', '5', '1998-01-20 00:00:00', '1998-02-17 00:00:00', '1998-01-29 00:00:00', '2', '424.30', 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium');
INSERT INTO `example_orders` VALUES ('10842', 'TORTU', '1', '1998-01-20 00:00:00', '1998-02-17 00:00:00', '1998-01-29 00:00:00', '3', '54.42', 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10843', 'VICTE', '4', '1998-01-21 00:00:00', '1998-02-18 00:00:00', '1998-01-26 00:00:00', '2', '9.26', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', null, '69004', 'France');
INSERT INTO `example_orders` VALUES ('10844', 'PICCO', '8', '1998-01-21 00:00:00', '1998-02-18 00:00:00', '1998-01-26 00:00:00', '2', '25.22', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', null, '5020', 'Austria');
INSERT INTO `example_orders` VALUES ('10845', 'QUICK', '8', '1998-01-21 00:00:00', '1998-02-04 00:00:00', '1998-01-30 00:00:00', '1', '212.98', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10846', 'SUPRD', '2', '1998-01-22 00:00:00', '1998-03-05 00:00:00', '1998-01-23 00:00:00', '3', '56.46', 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium');
INSERT INTO `example_orders` VALUES ('10847', 'SAVEA', '4', '1998-01-22 00:00:00', '1998-02-05 00:00:00', '1998-02-10 00:00:00', '3', '487.57', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10848', 'CONSH', '7', '1998-01-23 00:00:00', '1998-02-20 00:00:00', '1998-01-29 00:00:00', '2', '38.24', 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', null, 'WX1 6LT', 'UK');
INSERT INTO `example_orders` VALUES ('10849', 'KOENE', '9', '1998-01-23 00:00:00', '1998-02-20 00:00:00', '1998-01-30 00:00:00', '2', '0.56', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10850', 'VICTE', '1', '1998-01-23 00:00:00', '1998-03-06 00:00:00', '1998-01-30 00:00:00', '1', '49.19', 'Victuailles en stock', '2, rue du Commerce', 'Lyon', null, '69004', 'France');
INSERT INTO `example_orders` VALUES ('10851', 'RICAR', '5', '1998-01-26 00:00:00', '1998-02-23 00:00:00', '1998-02-02 00:00:00', '1', '160.55', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO `example_orders` VALUES ('10852', 'RATTC', '8', '1998-01-26 00:00:00', '1998-02-09 00:00:00', '1998-01-30 00:00:00', '1', '174.05', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10853', 'BLAUS', '9', '1998-01-27 00:00:00', '1998-02-24 00:00:00', '1998-02-03 00:00:00', '2', '53.83', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', null, '68306', 'Germany');
INSERT INTO `example_orders` VALUES ('10854', 'ERNSH', '3', '1998-01-27 00:00:00', '1998-02-24 00:00:00', '1998-02-05 00:00:00', '2', '100.22', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10855', 'OLDWO', '3', '1998-01-27 00:00:00', '1998-02-24 00:00:00', '1998-02-04 00:00:00', '1', '170.97', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO `example_orders` VALUES ('10856', 'ANTON', '3', '1998-01-28 00:00:00', '1998-02-25 00:00:00', '1998-02-10 00:00:00', '2', '58.43', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', null, '05023', 'Mexico');
INSERT INTO `example_orders` VALUES ('10857', 'BERGS', '8', '1998-01-28 00:00:00', '1998-02-25 00:00:00', '1998-02-06 00:00:00', '2', '188.85', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10858', 'LACOR', '2', '1998-01-29 00:00:00', '1998-02-26 00:00:00', '1998-02-03 00:00:00', '1', '52.51', 'La corne dabondance', '67, avenue de lEurope', 'Versailles', null, '78000', 'France');
INSERT INTO `example_orders` VALUES ('10859', 'FRANK', '1', '1998-01-29 00:00:00', '1998-02-26 00:00:00', '1998-02-02 00:00:00', '2', '76.10', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10860', 'FRANR', '3', '1998-01-29 00:00:00', '1998-02-26 00:00:00', '1998-02-04 00:00:00', '3', '19.26', 'France restauration', '54, rue Royale', 'Nantes', null, '44000', 'France');
INSERT INTO `example_orders` VALUES ('10861', 'WHITC', '4', '1998-01-30 00:00:00', '1998-02-27 00:00:00', '1998-02-17 00:00:00', '2', '14.93', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('10862', 'LEHMS', '8', '1998-01-30 00:00:00', '1998-03-13 00:00:00', '1998-02-02 00:00:00', '2', '53.23', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10863', 'HILAA', '4', '1998-02-02 00:00:00', '1998-03-02 00:00:00', '1998-02-17 00:00:00', '2', '30.26', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10864', 'AROUT', '4', '1998-02-02 00:00:00', '1998-03-02 00:00:00', '1998-02-09 00:00:00', '2', '3.04', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('10865', 'QUICK', '2', '1998-02-02 00:00:00', '1998-02-16 00:00:00', '1998-02-12 00:00:00', '1', '348.14', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10866', 'BERGS', '5', '1998-02-03 00:00:00', '1998-03-03 00:00:00', '1998-02-12 00:00:00', '1', '109.11', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10867', 'LONEP', '6', '1998-02-03 00:00:00', '1998-03-17 00:00:00', '1998-02-11 00:00:00', '1', '1.93', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO `example_orders` VALUES ('10868', 'QUEEN', '7', '1998-02-04 00:00:00', '1998-03-04 00:00:00', '1998-02-23 00:00:00', '2', '191.27', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('10869', 'SEVES', '5', '1998-02-04 00:00:00', '1998-03-04 00:00:00', '1998-02-09 00:00:00', '1', '143.28', 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', null, 'OX15 4NB', 'UK');
INSERT INTO `example_orders` VALUES ('10870', 'WOLZA', '5', '1998-02-04 00:00:00', '1998-03-04 00:00:00', '1998-02-13 00:00:00', '3', '12.04', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', null, '01-012', 'Poland');
INSERT INTO `example_orders` VALUES ('10871', 'BONAP', '9', '1998-02-05 00:00:00', '1998-03-05 00:00:00', '1998-02-10 00:00:00', '2', '112.27', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10872', 'GODOS', '5', '1998-02-05 00:00:00', '1998-03-05 00:00:00', '1998-02-09 00:00:00', '2', '175.32', 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', null, '41101', 'Spain');
INSERT INTO `example_orders` VALUES ('10873', 'WILMK', '4', '1998-02-06 00:00:00', '1998-03-06 00:00:00', '1998-02-09 00:00:00', '1', '0.82', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', null, '21240', 'Finland');
INSERT INTO `example_orders` VALUES ('10874', 'GODOS', '5', '1998-02-06 00:00:00', '1998-03-06 00:00:00', '1998-02-11 00:00:00', '2', '19.58', 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', null, '41101', 'Spain');
INSERT INTO `example_orders` VALUES ('10875', 'BERGS', '4', '1998-02-06 00:00:00', '1998-03-06 00:00:00', '1998-03-03 00:00:00', '2', '32.37', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10876', 'BONAP', '7', '1998-02-09 00:00:00', '1998-03-09 00:00:00', '1998-02-12 00:00:00', '3', '60.42', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10877', 'RICAR', '1', '1998-02-09 00:00:00', '1998-03-09 00:00:00', '1998-02-19 00:00:00', '1', '38.06', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO `example_orders` VALUES ('10878', 'QUICK', '4', '1998-02-10 00:00:00', '1998-03-10 00:00:00', '1998-02-12 00:00:00', '1', '46.69', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10879', 'WILMK', '3', '1998-02-10 00:00:00', '1998-03-10 00:00:00', '1998-02-12 00:00:00', '3', '8.50', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', null, '21240', 'Finland');
INSERT INTO `example_orders` VALUES ('10880', 'FOLKO', '7', '1998-02-10 00:00:00', '1998-03-24 00:00:00', '1998-02-18 00:00:00', '1', '88.01', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10881', 'CACTU', '4', '1998-02-11 00:00:00', '1998-03-11 00:00:00', '1998-02-18 00:00:00', '1', '2.84', 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10882', 'SAVEA', '4', '1998-02-11 00:00:00', '1998-03-11 00:00:00', '1998-02-20 00:00:00', '3', '23.10', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10883', 'LONEP', '8', '1998-02-12 00:00:00', '1998-03-12 00:00:00', '1998-02-20 00:00:00', '3', '0.53', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO `example_orders` VALUES ('10884', 'LETSS', '4', '1998-02-12 00:00:00', '1998-03-12 00:00:00', '1998-02-13 00:00:00', '2', '90.97', 'Lets Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO `example_orders` VALUES ('10885', 'SUPRD', '6', '1998-02-12 00:00:00', '1998-03-12 00:00:00', '1998-02-18 00:00:00', '3', '5.64', 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium');
INSERT INTO `example_orders` VALUES ('10886', 'HANAR', '1', '1998-02-13 00:00:00', '1998-03-13 00:00:00', '1998-03-02 00:00:00', '1', '4.99', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('10887', 'GALED', '8', '1998-02-13 00:00:00', '1998-03-13 00:00:00', '1998-02-16 00:00:00', '3', '1.25', 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', null, '8022', 'Spain');
INSERT INTO `example_orders` VALUES ('10888', 'GODOS', '1', '1998-02-16 00:00:00', '1998-03-16 00:00:00', '1998-02-23 00:00:00', '2', '51.87', 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', null, '41101', 'Spain');
INSERT INTO `example_orders` VALUES ('10889', 'RATTC', '9', '1998-02-16 00:00:00', '1998-03-16 00:00:00', '1998-02-23 00:00:00', '3', '280.61', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10890', 'DUMON', '7', '1998-02-16 00:00:00', '1998-03-16 00:00:00', '1998-02-18 00:00:00', '1', '32.76', 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', null, '44000', 'France');
INSERT INTO `example_orders` VALUES ('10891', 'LEHMS', '7', '1998-02-17 00:00:00', '1998-03-17 00:00:00', '1998-02-19 00:00:00', '2', '20.37', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10892', 'MAISD', '4', '1998-02-17 00:00:00', '1998-03-17 00:00:00', '1998-02-19 00:00:00', '2', '120.27', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', null, 'B-1180', 'Belgium');
INSERT INTO `example_orders` VALUES ('10893', 'KOENE', '9', '1998-02-18 00:00:00', '1998-03-18 00:00:00', '1998-02-20 00:00:00', '2', '77.78', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('10894', 'SAVEA', '1', '1998-02-18 00:00:00', '1998-03-18 00:00:00', '1998-02-20 00:00:00', '1', '116.13', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10895', 'ERNSH', '3', '1998-02-18 00:00:00', '1998-03-18 00:00:00', '1998-02-23 00:00:00', '1', '162.75', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10896', 'MAISD', '7', '1998-02-19 00:00:00', '1998-03-19 00:00:00', '1998-02-27 00:00:00', '3', '32.45', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', null, 'B-1180', 'Belgium');
INSERT INTO `example_orders` VALUES ('10897', 'HUNGO', '3', '1998-02-19 00:00:00', '1998-03-19 00:00:00', '1998-02-25 00:00:00', '2', '603.54', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10898', 'OCEAN', '4', '1998-02-20 00:00:00', '1998-03-20 00:00:00', '1998-03-06 00:00:00', '2', '1.27', 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10899', 'LILAS', '5', '1998-02-20 00:00:00', '1998-03-20 00:00:00', '1998-02-26 00:00:00', '3', '1.21', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10900', 'WELLI', '1', '1998-02-20 00:00:00', '1998-03-20 00:00:00', '1998-03-04 00:00:00', '2', '1.66', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO `example_orders` VALUES ('10901', 'HILAA', '4', '1998-02-23 00:00:00', '1998-03-23 00:00:00', '1998-02-26 00:00:00', '1', '62.09', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10902', 'FOLKO', '1', '1998-02-23 00:00:00', '1998-03-23 00:00:00', '1998-03-03 00:00:00', '1', '44.15', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10903', 'HANAR', '3', '1998-02-24 00:00:00', '1998-03-24 00:00:00', '1998-03-04 00:00:00', '3', '36.71', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('10904', 'WHITC', '3', '1998-02-24 00:00:00', '1998-03-24 00:00:00', '1998-02-27 00:00:00', '3', '162.95', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('10905', 'WELLI', '9', '1998-02-24 00:00:00', '1998-03-24 00:00:00', '1998-03-06 00:00:00', '2', '13.72', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO `example_orders` VALUES ('10906', 'WOLZA', '4', '1998-02-25 00:00:00', '1998-03-11 00:00:00', '1998-03-03 00:00:00', '3', '26.29', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', null, '01-012', 'Poland');
INSERT INTO `example_orders` VALUES ('10907', 'SPECD', '6', '1998-02-25 00:00:00', '1998-03-25 00:00:00', '1998-02-27 00:00:00', '3', '9.19', 'Spécialités du monde', '25, rue Lauriston', 'Paris', null, '75016', 'France');
INSERT INTO `example_orders` VALUES ('10908', 'REGGC', '4', '1998-02-26 00:00:00', '1998-03-26 00:00:00', '1998-03-06 00:00:00', '2', '32.96', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy');
INSERT INTO `example_orders` VALUES ('10909', 'SANTG', '1', '1998-02-26 00:00:00', '1998-03-26 00:00:00', '1998-03-10 00:00:00', '2', '53.05', 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', null, '4110', 'Norway');
INSERT INTO `example_orders` VALUES ('10910', 'WILMK', '1', '1998-02-26 00:00:00', '1998-03-26 00:00:00', '1998-03-04 00:00:00', '3', '38.11', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', null, '21240', 'Finland');
INSERT INTO `example_orders` VALUES ('10911', 'GODOS', '3', '1998-02-26 00:00:00', '1998-03-26 00:00:00', '1998-03-05 00:00:00', '1', '38.19', 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', null, '41101', 'Spain');
INSERT INTO `example_orders` VALUES ('10912', 'HUNGO', '2', '1998-02-26 00:00:00', '1998-03-26 00:00:00', '1998-03-18 00:00:00', '2', '580.91', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10913', 'QUEEN', '4', '1998-02-26 00:00:00', '1998-03-26 00:00:00', '1998-03-04 00:00:00', '1', '33.05', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('10914', 'QUEEN', '6', '1998-02-27 00:00:00', '1998-03-27 00:00:00', '1998-03-02 00:00:00', '1', '21.19', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('10915', 'TORTU', '2', '1998-02-27 00:00:00', '1998-03-27 00:00:00', '1998-03-02 00:00:00', '2', '3.51', 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10916', 'RANCH', '1', '1998-02-27 00:00:00', '1998-03-27 00:00:00', '1998-03-09 00:00:00', '2', '63.77', 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10917', 'ROMEY', '4', '1998-03-02 00:00:00', '1998-03-30 00:00:00', '1998-03-11 00:00:00', '2', '8.29', 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', null, '28001', 'Spain');
INSERT INTO `example_orders` VALUES ('10918', 'BOTTM', '3', '1998-03-02 00:00:00', '1998-03-30 00:00:00', '1998-03-11 00:00:00', '3', '48.83', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('10919', 'LINOD', '2', '1998-03-02 00:00:00', '1998-03-30 00:00:00', '1998-03-04 00:00:00', '2', '19.80', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10920', 'AROUT', '4', '1998-03-03 00:00:00', '1998-03-31 00:00:00', '1998-03-09 00:00:00', '2', '29.61', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('10921', 'VAFFE', '1', '1998-03-03 00:00:00', '1998-04-14 00:00:00', '1998-03-09 00:00:00', '1', '176.48', 'Vaffeljernet', 'Smagsloget 45', 'Århus', null, '8200', 'Denmark');
INSERT INTO `example_orders` VALUES ('10922', 'HANAR', '5', '1998-03-03 00:00:00', '1998-03-31 00:00:00', '1998-03-05 00:00:00', '3', '62.74', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('10923', 'LAMAI', '7', '1998-03-03 00:00:00', '1998-04-14 00:00:00', '1998-03-13 00:00:00', '3', '68.26', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('10924', 'BERGS', '3', '1998-03-04 00:00:00', '1998-04-01 00:00:00', '1998-04-08 00:00:00', '2', '151.52', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', null, 'S-958 22', 'Sweden');
INSERT INTO `example_orders` VALUES ('10925', 'HANAR', '3', '1998-03-04 00:00:00', '1998-04-01 00:00:00', '1998-03-13 00:00:00', '1', '2.27', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('10926', 'ANATR', '4', '1998-03-04 00:00:00', '1998-04-01 00:00:00', '1998-03-11 00:00:00', '3', '39.92', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', null, '05021', 'Mexico');
INSERT INTO `example_orders` VALUES ('10927', 'LACOR', '4', '1998-03-05 00:00:00', '1998-04-02 00:00:00', '1998-04-08 00:00:00', '1', '19.79', 'La corne dabondance', '67, avenue de lEurope', 'Versailles', null, '78000', 'France');
INSERT INTO `example_orders` VALUES ('10928', 'GALED', '1', '1998-03-05 00:00:00', '1998-04-02 00:00:00', '1998-03-18 00:00:00', '1', '1.36', 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', null, '8022', 'Spain');
INSERT INTO `example_orders` VALUES ('10929', 'FRANK', '6', '1998-03-05 00:00:00', '1998-04-02 00:00:00', '1998-03-12 00:00:00', '1', '33.93', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('10930', 'SUPRD', '4', '1998-03-06 00:00:00', '1998-04-17 00:00:00', '1998-03-18 00:00:00', '3', '15.55', 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium');
INSERT INTO `example_orders` VALUES ('10931', 'RICSU', '4', '1998-03-06 00:00:00', '1998-03-20 00:00:00', '1998-03-19 00:00:00', '2', '13.60', 'Richter Supermarkt', 'Starenweg 5', 'Genève', null, '1204', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10932', 'BONAP', '8', '1998-03-06 00:00:00', '1998-04-03 00:00:00', '1998-03-24 00:00:00', '1', '134.64', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10933', 'ISLAT', '6', '1998-03-06 00:00:00', '1998-04-03 00:00:00', '1998-03-16 00:00:00', '3', '54.15', 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO `example_orders` VALUES ('10934', 'LEHMS', '3', '1998-03-09 00:00:00', '1998-04-06 00:00:00', '1998-03-12 00:00:00', '3', '32.01', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('10935', 'WELLI', '4', '1998-03-09 00:00:00', '1998-04-06 00:00:00', '1998-03-18 00:00:00', '3', '47.59', 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO `example_orders` VALUES ('10936', 'GREAL', '3', '1998-03-09 00:00:00', '1998-04-06 00:00:00', '1998-03-18 00:00:00', '2', '33.68', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO `example_orders` VALUES ('10937', 'CACTU', '7', '1998-03-10 00:00:00', '1998-03-24 00:00:00', '1998-03-13 00:00:00', '3', '31.51', 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10938', 'QUICK', '3', '1998-03-10 00:00:00', '1998-04-07 00:00:00', '1998-03-16 00:00:00', '2', '31.89', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10939', 'MAGAA', '2', '1998-03-10 00:00:00', '1998-04-07 00:00:00', '1998-03-13 00:00:00', '2', '76.33', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', null, '24100', 'Italy');
INSERT INTO `example_orders` VALUES ('10940', 'BONAP', '8', '1998-03-11 00:00:00', '1998-04-08 00:00:00', '1998-03-23 00:00:00', '3', '19.77', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('10941', 'SAVEA', '7', '1998-03-11 00:00:00', '1998-04-08 00:00:00', '1998-03-20 00:00:00', '2', '400.81', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10942', 'REGGC', '9', '1998-03-11 00:00:00', '1998-04-08 00:00:00', '1998-03-18 00:00:00', '3', '17.95', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy');
INSERT INTO `example_orders` VALUES ('10943', 'BSBEV', '4', '1998-03-11 00:00:00', '1998-04-08 00:00:00', '1998-03-19 00:00:00', '2', '2.17', 'Bs Beverages', 'Fauntleroy Circus', 'London', null, 'EC2 5NT', 'UK');
INSERT INTO `example_orders` VALUES ('10944', 'BOTTM', '6', '1998-03-12 00:00:00', '1998-03-26 00:00:00', '1998-03-13 00:00:00', '3', '52.92', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('10945', 'MORGK', '4', '1998-03-12 00:00:00', '1998-04-09 00:00:00', '1998-03-18 00:00:00', '1', '10.22', 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', null, '04179', 'Germany');
INSERT INTO `example_orders` VALUES ('10946', 'VAFFE', '1', '1998-03-12 00:00:00', '1998-04-09 00:00:00', '1998-03-19 00:00:00', '2', '27.20', 'Vaffeljernet', 'Smagsloget 45', 'Århus', null, '8200', 'Denmark');
INSERT INTO `example_orders` VALUES ('10947', 'BSBEV', '3', '1998-03-13 00:00:00', '1998-04-10 00:00:00', '1998-03-16 00:00:00', '2', '3.26', 'Bs Beverages', 'Fauntleroy Circus', 'London', null, 'EC2 5NT', 'UK');
INSERT INTO `example_orders` VALUES ('10948', 'GODOS', '3', '1998-03-13 00:00:00', '1998-04-10 00:00:00', '1998-03-19 00:00:00', '3', '23.39', 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', null, '41101', 'Spain');
INSERT INTO `example_orders` VALUES ('10949', 'BOTTM', '2', '1998-03-13 00:00:00', '1998-04-10 00:00:00', '1998-03-17 00:00:00', '3', '74.44', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('10950', 'MAGAA', '1', '1998-03-16 00:00:00', '1998-04-13 00:00:00', '1998-03-23 00:00:00', '2', '2.50', 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', null, '24100', 'Italy');
INSERT INTO `example_orders` VALUES ('10951', 'RICSU', '9', '1998-03-16 00:00:00', '1998-04-27 00:00:00', '1998-04-07 00:00:00', '2', '30.85', 'Richter Supermarkt', 'Starenweg 5', 'Genève', null, '1204', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10952', 'ALFKI', '1', '1998-03-16 00:00:00', '1998-04-27 00:00:00', '1998-03-24 00:00:00', '1', '40.42', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', null, '12209', 'Germany');
INSERT INTO `example_orders` VALUES ('10953', 'AROUT', '9', '1998-03-16 00:00:00', '1998-03-30 00:00:00', '1998-03-25 00:00:00', '2', '23.72', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('10954', 'LINOD', '5', '1998-03-17 00:00:00', '1998-04-28 00:00:00', '1998-03-20 00:00:00', '1', '27.91', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10955', 'FOLKO', '8', '1998-03-17 00:00:00', '1998-04-14 00:00:00', '1998-03-20 00:00:00', '2', '3.26', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10956', 'BLAUS', '6', '1998-03-17 00:00:00', '1998-04-28 00:00:00', '1998-03-20 00:00:00', '2', '44.65', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', null, '68306', 'Germany');
INSERT INTO `example_orders` VALUES ('10957', 'HILAA', '8', '1998-03-18 00:00:00', '1998-04-15 00:00:00', '1998-03-27 00:00:00', '3', '105.36', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10958', 'OCEAN', '7', '1998-03-18 00:00:00', '1998-04-15 00:00:00', '1998-03-27 00:00:00', '2', '49.56', 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10959', 'GOURL', '6', '1998-03-18 00:00:00', '1998-04-29 00:00:00', '1998-03-23 00:00:00', '2', '4.98', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO `example_orders` VALUES ('10960', 'HILAA', '3', '1998-03-19 00:00:00', '1998-04-02 00:00:00', '1998-04-08 00:00:00', '1', '2.08', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10961', 'QUEEN', '8', '1998-03-19 00:00:00', '1998-04-16 00:00:00', '1998-03-30 00:00:00', '1', '104.47', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('10962', 'QUICK', '8', '1998-03-19 00:00:00', '1998-04-16 00:00:00', '1998-03-23 00:00:00', '2', '275.79', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10963', 'FURIB', '9', '1998-03-19 00:00:00', '1998-04-16 00:00:00', '1998-03-26 00:00:00', '3', '2.70', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', null, '1675', 'Portugal');
INSERT INTO `example_orders` VALUES ('10964', 'SPECD', '3', '1998-03-20 00:00:00', '1998-04-17 00:00:00', '1998-03-24 00:00:00', '2', '87.38', 'Spécialités du monde', '25, rue Lauriston', 'Paris', null, '75016', 'France');
INSERT INTO `example_orders` VALUES ('10965', 'OLDWO', '6', '1998-03-20 00:00:00', '1998-04-17 00:00:00', '1998-03-30 00:00:00', '3', '144.38', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO `example_orders` VALUES ('10966', 'CHOPS', '4', '1998-03-20 00:00:00', '1998-04-17 00:00:00', '1998-04-08 00:00:00', '1', '27.19', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', null, '3012', 'Switzerland');
INSERT INTO `example_orders` VALUES ('10967', 'TOMSP', '2', '1998-03-23 00:00:00', '1998-04-20 00:00:00', '1998-04-02 00:00:00', '2', '62.22', 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', null, '44087', 'Germany');
INSERT INTO `example_orders` VALUES ('10968', 'ERNSH', '1', '1998-03-23 00:00:00', '1998-04-20 00:00:00', '1998-04-01 00:00:00', '3', '74.60', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10969', 'COMMI', '1', '1998-03-23 00:00:00', '1998-04-20 00:00:00', '1998-03-30 00:00:00', '2', '0.21', 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO `example_orders` VALUES ('10970', 'BOLID', '9', '1998-03-24 00:00:00', '1998-04-07 00:00:00', '1998-04-24 00:00:00', '1', '16.16', 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', null, '28023', 'Spain');
INSERT INTO `example_orders` VALUES ('10971', 'FRANR', '2', '1998-03-24 00:00:00', '1998-04-21 00:00:00', '1998-04-02 00:00:00', '2', '121.82', 'France restauration', '54, rue Royale', 'Nantes', null, '44000', 'France');
INSERT INTO `example_orders` VALUES ('10972', 'LACOR', '4', '1998-03-24 00:00:00', '1998-04-21 00:00:00', '1998-03-26 00:00:00', '2', '0.02', 'La corne dabondance', '67, avenue de lEurope', 'Versailles', null, '78000', 'France');
INSERT INTO `example_orders` VALUES ('10973', 'LACOR', '6', '1998-03-24 00:00:00', '1998-04-21 00:00:00', '1998-03-27 00:00:00', '2', '15.17', 'La corne dabondance', '67, avenue de lEurope', 'Versailles', null, '78000', 'France');
INSERT INTO `example_orders` VALUES ('10974', 'SPLIR', '3', '1998-03-25 00:00:00', '1998-04-08 00:00:00', '1998-04-03 00:00:00', '3', '12.96', 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO `example_orders` VALUES ('10975', 'BOTTM', '1', '1998-03-25 00:00:00', '1998-04-22 00:00:00', '1998-03-27 00:00:00', '3', '32.27', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('10976', 'HILAA', '1', '1998-03-25 00:00:00', '1998-05-06 00:00:00', '1998-04-03 00:00:00', '1', '37.97', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10977', 'FOLKO', '8', '1998-03-26 00:00:00', '1998-04-23 00:00:00', '1998-04-10 00:00:00', '3', '208.50', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10978', 'MAISD', '9', '1998-03-26 00:00:00', '1998-04-23 00:00:00', '1998-04-23 00:00:00', '2', '32.82', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', null, 'B-1180', 'Belgium');
INSERT INTO `example_orders` VALUES ('10979', 'ERNSH', '8', '1998-03-26 00:00:00', '1998-04-23 00:00:00', '1998-03-31 00:00:00', '2', '353.07', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10980', 'FOLKO', '4', '1998-03-27 00:00:00', '1998-05-08 00:00:00', '1998-04-17 00:00:00', '1', '1.26', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10981', 'HANAR', '1', '1998-03-27 00:00:00', '1998-04-24 00:00:00', '1998-04-02 00:00:00', '2', '193.37', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('10982', 'BOTTM', '2', '1998-03-27 00:00:00', '1998-04-24 00:00:00', '1998-04-08 00:00:00', '1', '14.01', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('10983', 'SAVEA', '2', '1998-03-27 00:00:00', '1998-04-24 00:00:00', '1998-04-06 00:00:00', '2', '657.54', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10984', 'SAVEA', '1', '1998-03-30 00:00:00', '1998-04-27 00:00:00', '1998-04-03 00:00:00', '3', '211.22', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('10985', 'HUNGO', '2', '1998-03-30 00:00:00', '1998-04-27 00:00:00', '1998-04-02 00:00:00', '1', '91.51', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('10986', 'OCEAN', '8', '1998-03-30 00:00:00', '1998-04-27 00:00:00', '1998-04-21 00:00:00', '2', '217.86', 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('10987', 'EASTC', '8', '1998-03-31 00:00:00', '1998-04-28 00:00:00', '1998-04-06 00:00:00', '1', '185.48', 'Eastern Connection', '35 King George', 'London', null, 'WX3 6FW', 'UK');
INSERT INTO `example_orders` VALUES ('10988', 'RATTC', '3', '1998-03-31 00:00:00', '1998-04-28 00:00:00', '1998-04-10 00:00:00', '2', '61.14', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('10989', 'QUEDE', '2', '1998-03-31 00:00:00', '1998-04-28 00:00:00', '1998-04-02 00:00:00', '1', '34.76', 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO `example_orders` VALUES ('10990', 'ERNSH', '2', '1998-04-01 00:00:00', '1998-05-13 00:00:00', '1998-04-07 00:00:00', '3', '117.61', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('10991', 'QUICK', '1', '1998-04-01 00:00:00', '1998-04-29 00:00:00', '1998-04-07 00:00:00', '1', '38.51', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10992', 'THEBI', '1', '1998-04-01 00:00:00', '1998-04-29 00:00:00', '1998-04-03 00:00:00', '3', '4.27', 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO `example_orders` VALUES ('10993', 'FOLKO', '7', '1998-04-01 00:00:00', '1998-04-29 00:00:00', '1998-04-10 00:00:00', '3', '8.81', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('10994', 'VAFFE', '2', '1998-04-02 00:00:00', '1998-04-16 00:00:00', '1998-04-09 00:00:00', '3', '65.53', 'Vaffeljernet', 'Smagsloget 45', 'Århus', null, '8200', 'Denmark');
INSERT INTO `example_orders` VALUES ('10995', 'PERIC', '1', '1998-04-02 00:00:00', '1998-04-30 00:00:00', '1998-04-06 00:00:00', '3', '46.00', 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('10996', 'QUICK', '4', '1998-04-02 00:00:00', '1998-04-30 00:00:00', '1998-04-10 00:00:00', '2', '1.12', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('10997', 'LILAS', '8', '1998-04-03 00:00:00', '1998-05-15 00:00:00', '1998-04-13 00:00:00', '2', '73.91', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('10998', 'WOLZA', '8', '1998-04-03 00:00:00', '1998-04-17 00:00:00', '1998-04-17 00:00:00', '2', '20.31', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', null, '01-012', 'Poland');
INSERT INTO `example_orders` VALUES ('10999', 'OTTIK', '6', '1998-04-03 00:00:00', '1998-05-01 00:00:00', '1998-04-10 00:00:00', '2', '96.35', 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', null, '50739', 'Germany');
INSERT INTO `example_orders` VALUES ('11000', 'RATTC', '2', '1998-04-06 00:00:00', '1998-05-04 00:00:00', '1998-04-14 00:00:00', '3', '55.12', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO `example_orders` VALUES ('11001', 'FOLKO', '2', '1998-04-06 00:00:00', '1998-05-04 00:00:00', '1998-04-14 00:00:00', '2', '197.30', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('11002', 'SAVEA', '4', '1998-04-06 00:00:00', '1998-05-04 00:00:00', '1998-04-16 00:00:00', '1', '141.16', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('11003', 'THECR', '3', '1998-04-06 00:00:00', '1998-05-04 00:00:00', '1998-04-08 00:00:00', '3', '14.91', 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO `example_orders` VALUES ('11004', 'MAISD', '3', '1998-04-07 00:00:00', '1998-05-05 00:00:00', '1998-04-20 00:00:00', '1', '44.84', 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', null, 'B-1180', 'Belgium');
INSERT INTO `example_orders` VALUES ('11005', 'WILMK', '2', '1998-04-07 00:00:00', '1998-05-05 00:00:00', '1998-04-10 00:00:00', '1', '0.75', 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', null, '21240', 'Finland');
INSERT INTO `example_orders` VALUES ('11006', 'GREAL', '3', '1998-04-07 00:00:00', '1998-05-05 00:00:00', '1998-04-15 00:00:00', '2', '25.19', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO `example_orders` VALUES ('11007', 'PRINI', '8', '1998-04-08 00:00:00', '1998-05-06 00:00:00', '1998-04-13 00:00:00', '2', '202.24', 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', null, '1756', 'Portugal');
INSERT INTO `example_orders` VALUES ('11008', 'ERNSH', '7', '1998-04-08 00:00:00', '1998-05-06 00:00:00', null, '3', '79.46', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('11009', 'GODOS', '2', '1998-04-08 00:00:00', '1998-05-06 00:00:00', '1998-04-10 00:00:00', '1', '59.11', 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', null, '41101', 'Spain');
INSERT INTO `example_orders` VALUES ('11010', 'REGGC', '2', '1998-04-09 00:00:00', '1998-05-07 00:00:00', '1998-04-21 00:00:00', '2', '28.71', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy');
INSERT INTO `example_orders` VALUES ('11011', 'ALFKI', '3', '1998-04-09 00:00:00', '1998-05-07 00:00:00', '1998-04-13 00:00:00', '1', '1.21', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', null, '12209', 'Germany');
INSERT INTO `example_orders` VALUES ('11012', 'FRANK', '1', '1998-04-09 00:00:00', '1998-04-23 00:00:00', '1998-04-17 00:00:00', '3', '242.95', 'Frankenversand', 'Berliner Platz 43', 'München', null, '80805', 'Germany');
INSERT INTO `example_orders` VALUES ('11013', 'ROMEY', '2', '1998-04-09 00:00:00', '1998-05-07 00:00:00', '1998-04-10 00:00:00', '1', '32.99', 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', null, '28001', 'Spain');
INSERT INTO `example_orders` VALUES ('11014', 'LINOD', '2', '1998-04-10 00:00:00', '1998-05-08 00:00:00', '1998-04-15 00:00:00', '3', '23.60', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO `example_orders` VALUES ('11015', 'SANTG', '2', '1998-04-10 00:00:00', '1998-04-24 00:00:00', '1998-04-20 00:00:00', '2', '4.62', 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', null, '4110', 'Norway');
INSERT INTO `example_orders` VALUES ('11016', 'AROUT', '9', '1998-04-10 00:00:00', '1998-05-08 00:00:00', '1998-04-13 00:00:00', '2', '33.80', 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO `example_orders` VALUES ('11017', 'ERNSH', '9', '1998-04-13 00:00:00', '1998-05-11 00:00:00', '1998-04-20 00:00:00', '2', '754.26', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('11018', 'LONEP', '4', '1998-04-13 00:00:00', '1998-05-11 00:00:00', '1998-04-16 00:00:00', '2', '11.65', 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO `example_orders` VALUES ('11019', 'RANCH', '6', '1998-04-13 00:00:00', '1998-05-11 00:00:00', null, '3', '3.17', 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('11020', 'OTTIK', '2', '1998-04-14 00:00:00', '1998-05-12 00:00:00', '1998-04-16 00:00:00', '2', '43.30', 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', null, '50739', 'Germany');
INSERT INTO `example_orders` VALUES ('11021', 'QUICK', '3', '1998-04-14 00:00:00', '1998-05-12 00:00:00', '1998-04-21 00:00:00', '1', '297.18', 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', null, '01307', 'Germany');
INSERT INTO `example_orders` VALUES ('11022', 'HANAR', '9', '1998-04-14 00:00:00', '1998-05-12 00:00:00', '1998-05-04 00:00:00', '2', '6.27', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('11023', 'BSBEV', '1', '1998-04-14 00:00:00', '1998-04-28 00:00:00', '1998-04-24 00:00:00', '2', '123.83', 'Bs Beverages', 'Fauntleroy Circus', 'London', null, 'EC2 5NT', 'UK');
INSERT INTO `example_orders` VALUES ('11024', 'EASTC', '4', '1998-04-15 00:00:00', '1998-05-13 00:00:00', '1998-04-20 00:00:00', '1', '74.36', 'Eastern Connection', '35 King George', 'London', null, 'WX3 6FW', 'UK');
INSERT INTO `example_orders` VALUES ('11025', 'WARTH', '6', '1998-04-15 00:00:00', '1998-05-13 00:00:00', '1998-04-24 00:00:00', '3', '29.17', 'Wartian Herkku', 'Torikatu 38', 'Oulu', null, '90110', 'Finland');
INSERT INTO `example_orders` VALUES ('11026', 'FRANS', '4', '1998-04-15 00:00:00', '1998-05-13 00:00:00', '1998-04-28 00:00:00', '1', '47.09', 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', null, '10100', 'Italy');
INSERT INTO `example_orders` VALUES ('11027', 'BOTTM', '1', '1998-04-16 00:00:00', '1998-05-14 00:00:00', '1998-04-20 00:00:00', '1', '52.52', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('11028', 'KOENE', '2', '1998-04-16 00:00:00', '1998-05-14 00:00:00', '1998-04-22 00:00:00', '1', '29.59', 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', null, '14776', 'Germany');
INSERT INTO `example_orders` VALUES ('11029', 'CHOPS', '4', '1998-04-16 00:00:00', '1998-05-14 00:00:00', '1998-04-27 00:00:00', '1', '47.84', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', null, '3012', 'Switzerland');
INSERT INTO `example_orders` VALUES ('11030', 'SAVEA', '7', '1998-04-17 00:00:00', '1998-05-15 00:00:00', '1998-04-27 00:00:00', '2', '830.75', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('11031', 'SAVEA', '6', '1998-04-17 00:00:00', '1998-05-15 00:00:00', '1998-04-24 00:00:00', '2', '227.22', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('11032', 'WHITC', '2', '1998-04-17 00:00:00', '1998-05-15 00:00:00', '1998-04-23 00:00:00', '3', '606.19', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('11033', 'RICSU', '7', '1998-04-17 00:00:00', '1998-05-15 00:00:00', '1998-04-23 00:00:00', '3', '84.74', 'Richter Supermarkt', 'Starenweg 5', 'Genève', null, '1204', 'Switzerland');
INSERT INTO `example_orders` VALUES ('11034', 'OLDWO', '8', '1998-04-20 00:00:00', '1998-06-01 00:00:00', '1998-04-27 00:00:00', '1', '40.32', 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO `example_orders` VALUES ('11035', 'SUPRD', '2', '1998-04-20 00:00:00', '1998-05-18 00:00:00', '1998-04-24 00:00:00', '2', '0.17', 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium');
INSERT INTO `example_orders` VALUES ('11036', 'DRACD', '8', '1998-04-20 00:00:00', '1998-05-18 00:00:00', '1998-04-22 00:00:00', '3', '149.47', 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', null, '52066', 'Germany');
INSERT INTO `example_orders` VALUES ('11037', 'GODOS', '7', '1998-04-21 00:00:00', '1998-05-19 00:00:00', '1998-04-27 00:00:00', '1', '3.20', 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', null, '41101', 'Spain');
INSERT INTO `example_orders` VALUES ('11038', 'SUPRD', '1', '1998-04-21 00:00:00', '1998-05-19 00:00:00', '1998-04-30 00:00:00', '2', '29.59', 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', null, 'B-6000', 'Belgium');
INSERT INTO `example_orders` VALUES ('11039', 'LINOD', '1', '1998-04-21 00:00:00', '1998-05-19 00:00:00', null, '2', '65.00', 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO `example_orders` VALUES ('11040', 'GREAL', '4', '1998-04-22 00:00:00', '1998-05-20 00:00:00', null, '3', '18.84', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO `example_orders` VALUES ('11041', 'CHOPS', '3', '1998-04-22 00:00:00', '1998-05-20 00:00:00', '1998-04-28 00:00:00', '2', '48.22', 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', null, '3012', 'Switzerland');
INSERT INTO `example_orders` VALUES ('11042', 'COMMI', '2', '1998-04-22 00:00:00', '1998-05-06 00:00:00', '1998-05-01 00:00:00', '1', '29.99', 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO `example_orders` VALUES ('11043', 'SPECD', '5', '1998-04-22 00:00:00', '1998-05-20 00:00:00', '1998-04-29 00:00:00', '2', '8.80', 'Spécialités du monde', '25, rue Lauriston', 'Paris', null, '75016', 'France');
INSERT INTO `example_orders` VALUES ('11044', 'WOLZA', '4', '1998-04-23 00:00:00', '1998-05-21 00:00:00', '1998-05-01 00:00:00', '1', '8.72', 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', null, '01-012', 'Poland');
INSERT INTO `example_orders` VALUES ('11045', 'BOTTM', '6', '1998-04-23 00:00:00', '1998-05-21 00:00:00', null, '2', '70.58', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('11046', 'WANDK', '8', '1998-04-23 00:00:00', '1998-05-21 00:00:00', '1998-04-24 00:00:00', '2', '71.64', 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', null, '70563', 'Germany');
INSERT INTO `example_orders` VALUES ('11047', 'EASTC', '7', '1998-04-24 00:00:00', '1998-05-22 00:00:00', '1998-05-01 00:00:00', '3', '46.62', 'Eastern Connection', '35 King George', 'London', null, 'WX3 6FW', 'UK');
INSERT INTO `example_orders` VALUES ('11048', 'BOTTM', '7', '1998-04-24 00:00:00', '1998-05-22 00:00:00', '1998-04-30 00:00:00', '3', '24.12', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO `example_orders` VALUES ('11049', 'GOURL', '3', '1998-04-24 00:00:00', '1998-05-22 00:00:00', '1998-05-04 00:00:00', '1', '8.34', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO `example_orders` VALUES ('11050', 'FOLKO', '8', '1998-04-27 00:00:00', '1998-05-25 00:00:00', '1998-05-05 00:00:00', '2', '59.41', 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', null, 'S-844 67', 'Sweden');
INSERT INTO `example_orders` VALUES ('11051', 'LAMAI', '7', '1998-04-27 00:00:00', '1998-05-25 00:00:00', null, '3', '2.79', 'La maison dAsie', '1 rue Alsace-Lorraine', 'Toulouse', null, '31000', 'France');
INSERT INTO `example_orders` VALUES ('11052', 'HANAR', '3', '1998-04-27 00:00:00', '1998-05-25 00:00:00', '1998-05-01 00:00:00', '1', '67.26', 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO `example_orders` VALUES ('11053', 'PICCO', '2', '1998-04-27 00:00:00', '1998-05-25 00:00:00', '1998-04-29 00:00:00', '2', '53.05', 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', null, '5020', 'Austria');
INSERT INTO `example_orders` VALUES ('11054', 'CACTU', '8', '1998-04-28 00:00:00', '1998-05-26 00:00:00', null, '1', '0.33', 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', null, '1010', 'Argentina');
INSERT INTO `example_orders` VALUES ('11055', 'HILAA', '7', '1998-04-28 00:00:00', '1998-05-26 00:00:00', '1998-05-05 00:00:00', '2', '120.92', 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO `example_orders` VALUES ('11056', 'EASTC', '8', '1998-04-28 00:00:00', '1998-05-12 00:00:00', '1998-05-01 00:00:00', '2', '278.96', 'Eastern Connection', '35 King George', 'London', null, 'WX3 6FW', 'UK');
INSERT INTO `example_orders` VALUES ('11057', 'NORTS', '3', '1998-04-29 00:00:00', '1998-05-27 00:00:00', '1998-05-01 00:00:00', '3', '4.13', 'North/South', 'South House 300 Queensbridge', 'London', null, 'SW7 1RZ', 'UK');
INSERT INTO `example_orders` VALUES ('11058', 'BLAUS', '9', '1998-04-29 00:00:00', '1998-05-27 00:00:00', null, '3', '31.14', 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', null, '68306', 'Germany');
INSERT INTO `example_orders` VALUES ('11059', 'RICAR', '2', '1998-04-29 00:00:00', '1998-06-10 00:00:00', null, '2', '85.80', 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO `example_orders` VALUES ('11060', 'FRANS', '2', '1998-04-30 00:00:00', '1998-05-28 00:00:00', '1998-05-04 00:00:00', '2', '10.98', 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', null, '10100', 'Italy');
INSERT INTO `example_orders` VALUES ('11061', 'GREAL', '4', '1998-04-30 00:00:00', '1998-06-11 00:00:00', null, '3', '14.01', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO `example_orders` VALUES ('11062', 'REGGC', '4', '1998-04-30 00:00:00', '1998-05-28 00:00:00', null, '2', '29.93', 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', null, '42100', 'Italy');
INSERT INTO `example_orders` VALUES ('11063', 'HUNGO', '3', '1998-04-30 00:00:00', '1998-05-28 00:00:00', '1998-05-06 00:00:00', '2', '81.73', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', null, 'Ireland');
INSERT INTO `example_orders` VALUES ('11064', 'SAVEA', '1', '1998-05-01 00:00:00', '1998-05-29 00:00:00', '1998-05-04 00:00:00', '1', '30.09', 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO `example_orders` VALUES ('11065', 'LILAS', '8', '1998-05-01 00:00:00', '1998-05-29 00:00:00', null, '1', '12.91', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('11066', 'WHITC', '7', '1998-05-01 00:00:00', '1998-05-29 00:00:00', '1998-05-04 00:00:00', '2', '44.72', 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO `example_orders` VALUES ('11067', 'DRACD', '1', '1998-05-04 00:00:00', '1998-05-18 00:00:00', '1998-05-06 00:00:00', '2', '7.98', 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', null, '52066', 'Germany');
INSERT INTO `example_orders` VALUES ('11068', 'QUEEN', '8', '1998-05-04 00:00:00', '1998-06-01 00:00:00', null, '2', '81.75', 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO `example_orders` VALUES ('11069', 'TORTU', '1', '1998-05-04 00:00:00', '1998-06-01 00:00:00', '1998-05-06 00:00:00', '2', '15.67', 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('11070', 'LEHMS', '2', '1998-05-05 00:00:00', '1998-06-02 00:00:00', null, '1', '136.00', 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', null, '60528', 'Germany');
INSERT INTO `example_orders` VALUES ('11071', 'LILAS', '1', '1998-05-05 00:00:00', '1998-06-02 00:00:00', null, '1', '0.93', 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO `example_orders` VALUES ('11072', 'ERNSH', '4', '1998-05-05 00:00:00', '1998-06-02 00:00:00', null, '2', '258.64', 'Ernst Handel', 'Kirchgasse 6', 'Graz', null, '8010', 'Austria');
INSERT INTO `example_orders` VALUES ('11073', 'PERIC', '2', '1998-05-05 00:00:00', '1998-06-02 00:00:00', null, '2', '24.95', 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', null, '05033', 'Mexico');
INSERT INTO `example_orders` VALUES ('11074', 'SIMOB', '7', '1998-05-06 00:00:00', '1998-06-03 00:00:00', null, '2', '18.44', 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', null, '1734', 'Denmark');
INSERT INTO `example_orders` VALUES ('11075', 'RICSU', '8', '1998-05-06 00:00:00', '1998-06-03 00:00:00', null, '2', '6.19', 'Richter Supermarkt', 'Starenweg 5', 'Genève', null, '1204', 'Switzerland');
INSERT INTO `example_orders` VALUES ('11076', 'BONAP', '4', '1998-05-06 00:00:00', '1998-06-03 00:00:00', null, '2', '38.28', 'Bon app', '12, rue des Bouchers', 'Marseille', null, '13008', 'France');
INSERT INTO `example_orders` VALUES ('11077', 'RATTC', '1', '1998-05-06 00:00:00', '1998-06-03 00:00:00', null, '2', '8.53', 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');

-- ----------------------------
-- Table structure for example_products
-- ----------------------------
DROP TABLE IF EXISTS `example_products`;
CREATE TABLE `example_products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(40) NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `QuantityPerUnit` varchar(20) DEFAULT NULL,
  `UnitPrice` double(12,2) DEFAULT '0.00',
  `UnitsInStock` smallint(6) DEFAULT '0',
  `UnitsOnOrder` smallint(6) DEFAULT '0',
  `ReorderLevel` smallint(6) DEFAULT '0',
  `Discontinued` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `ProductName` (`ProductName`),
  KEY `SuppliersProducts` (`SupplierID`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of example_products
-- ----------------------------
INSERT INTO `example_products` VALUES ('1', 'Chai', '1', '1', '10 boxes x 20 bags', '18.00', '39', '0', '10', '0');
INSERT INTO `example_products` VALUES ('2', 'Chang', '1', '1', '24 - 12 oz bottles', '19.00', '17', '40', '25', '0');
INSERT INTO `example_products` VALUES ('3', 'Aniseed Syrup', '1', '2', '12 - 550 ml bottles', '10.00', '13', '70', '25', '0');
INSERT INTO `example_products` VALUES ('4', 'Chef Antons Cajun Seasoning', '2', '2', '48 - 6 oz jars', '22.00', '53', '0', '0', '0');
INSERT INTO `example_products` VALUES ('5', 'Chef Antons Gumbo Mix', '2', '2', '36 boxes', '21.35', '0', '0', '0', '1');
INSERT INTO `example_products` VALUES ('6', 'Grandmas Boysenberry Spread', '3', '2', '12 - 8 oz jars', '25.00', '120', '0', '25', '0');
INSERT INTO `example_products` VALUES ('7', 'Uncle Bobs Organic Dried Pears', '3', '7', '12 - 1 lb pkgs.', '30.00', '15', '0', '10', '0');
INSERT INTO `example_products` VALUES ('8', 'Northwoods Cranberry Sauce', '3', '2', '12 - 12 oz jars', '40.00', '6', '0', '0', '0');
INSERT INTO `example_products` VALUES ('9', 'Mishi Kobe Niku', '4', '6', '18 - 500 g pkgs.', '97.00', '29', '0', '0', '1');
INSERT INTO `example_products` VALUES ('10', 'Ikura', '4', '8', '12 - 200 ml jars', '31.00', '31', '0', '0', '0');
INSERT INTO `example_products` VALUES ('11', 'Queso Cabrales', '5', '4', '1 kg pkg.', '21.00', '22', '30', '30', '0');
INSERT INTO `example_products` VALUES ('12', 'Queso Manche La Pastora', '5', '4', '10 - 500 g pkgs.', '38.00', '86', '0', '0', '0');
INSERT INTO `example_products` VALUES ('13', 'Konbu', '6', '8', '2 kg box', '6.00', '24', '0', '5', '0');
INSERT INTO `example_products` VALUES ('14', 'Tofu', '6', '7', '40 - 100 g pkgs.', '23.25', '35', '0', '0', '0');
INSERT INTO `example_products` VALUES ('15', 'Genen Shouyu', '6', '2', '24 - 250 ml bottles', '15.50', '39', '0', '5', '0');
INSERT INTO `example_products` VALUES ('16', 'Pavlova', '7', '3', '32 - 500 g boxes', '17.45', '29', '0', '10', '0');
INSERT INTO `example_products` VALUES ('17', 'Alice Mutton', '7', '6', '20 - 1 kg tins', '39.00', '0', '0', '0', '1');
INSERT INTO `example_products` VALUES ('18', 'Carnarvon Tigers', '7', '8', '16 kg pkg.', '62.50', '42', '0', '0', '0');
INSERT INTO `example_products` VALUES ('19', 'Teatime Chocolate Biscuits', '8', '3', '10 boxes x 12 pieces', '9.20', '25', '0', '5', '0');
INSERT INTO `example_products` VALUES ('20', 'Sir Rodneys Marmalade', '8', '3', '30 gift boxes', '81.00', '40', '0', '0', '0');
INSERT INTO `example_products` VALUES ('21', 'Sir Rodneys Scones', '8', '3', '24 pkgs. x 4 pieces', '10.00', '3', '40', '5', '0');
INSERT INTO `example_products` VALUES ('22', 'Gustafs Kn?ckebr?d', '9', '5', '24 - 500 g pkgs.', '21.00', '104', '0', '25', '0');
INSERT INTO `example_products` VALUES ('23', 'Tunnbr?d', '9', '5', '12 - 250 g pkgs.', '9.00', '61', '0', '25', '0');
INSERT INTO `example_products` VALUES ('24', 'Guaraná Fantástica', '10', '1', '12 - 355 ml cans', '4.50', '20', '0', '0', '1');
INSERT INTO `example_products` VALUES ('25', 'NuNuCa Nu?-Nougat-Creme', '11', '3', '20 - 450 g glasses', '14.00', '76', '0', '30', '0');
INSERT INTO `example_products` VALUES ('26', 'Gumb?r Gummib?rchen', '11', '3', '100 - 250 g bags', '31.23', '15', '0', '0', '0');
INSERT INTO `example_products` VALUES ('27', 'Schoggi Schokolade', '11', '3', '100 - 100 g pieces', '43.90', '49', '0', '30', '0');
INSERT INTO `example_products` VALUES ('28', 'R?ssle Sauerkraut', '12', '7', '25 - 825 g cans', '45.60', '26', '0', '0', '1');
INSERT INTO `example_products` VALUES ('29', 'Thüringer Rostbratwurst', '12', '6', '50 bags x 30 sausgs.', '123.79', '0', '0', '0', '1');
INSERT INTO `example_products` VALUES ('30', 'Nord-Ost Matjeshering', '13', '8', '10 - 200 g glasses', '25.89', '10', '0', '15', '0');
INSERT INTO `example_products` VALUES ('31', 'rnzola Telino', '14', '4', '12 - 100 g pkgs', '12.50', '0', '70', '20', '0');
INSERT INTO `example_products` VALUES ('32', 'Mascarpone Fabioli', '14', '4', '24 - 200 g pkgs.', '32.00', '9', '40', '25', '0');
INSERT INTO `example_products` VALUES ('33', 'Geitost', '15', '4', '500 g', '2.50', '112', '0', '20', '0');
INSERT INTO `example_products` VALUES ('34', 'Sasquatch Ale', '16', '1', '24 - 12 oz bottles', '14.00', '111', '0', '15', '0');
INSERT INTO `example_products` VALUES ('35', 'Steeleye Stout', '16', '1', '24 - 12 oz bottles', '18.00', '20', '0', '15', '0');
INSERT INTO `example_products` VALUES ('36', 'Inlagd Sill', '17', '8', '24 - 250 g  jars', '19.00', '112', '0', '20', '0');
INSERT INTO `example_products` VALUES ('37', 'Gravad lax', '17', '8', '12 - 500 g pkgs.', '26.00', '11', '50', '25', '0');
INSERT INTO `example_products` VALUES ('38', 'C?te de Blaye', '18', '1', '12 - 75 cl bottles', '263.50', '17', '0', '15', '0');
INSERT INTO `example_products` VALUES ('39', 'Chartreuse verte', '18', '1', '750 cc per bottle', '18.00', '69', '0', '5', '0');
INSERT INTO `example_products` VALUES ('40', 'Boston Crab Meat', '19', '8', '24 - 4 oz tins', '18.40', '123', '0', '30', '0');
INSERT INTO `example_products` VALUES ('41', 'Jacks New England Clam Chowder', '19', '8', '12 - 12 oz cans', '9.65', '85', '0', '10', '0');
INSERT INTO `example_products` VALUES ('42', 'Singaporean Hokkien Fried Mee', '20', '5', '32 - 1 kg pkgs.', '14.00', '26', '0', '0', '1');
INSERT INTO `example_products` VALUES ('43', 'Ipoh Coffee', '20', '1', '16 - 500 g tins', '46.00', '17', '10', '25', '0');
INSERT INTO `example_products` VALUES ('44', 'Gula Malacca', '20', '2', '20 - 2 kg bags', '19.45', '27', '0', '15', '0');
INSERT INTO `example_products` VALUES ('45', 'Rogede sild', '21', '8', '1k pkg.', '9.50', '5', '70', '15', '0');
INSERT INTO `example_products` VALUES ('46', 'Spegesild', '21', '8', '4 - 450 g glasses', '12.00', '95', '0', '0', '0');
INSERT INTO `example_products` VALUES ('47', 'Zaanse koeken', '22', '3', '10 - 4 oz boxes', '9.50', '36', '0', '0', '0');
INSERT INTO `example_products` VALUES ('48', 'Chocolade', '22', '3', '10 pkgs.', '12.75', '15', '70', '25', '0');
INSERT INTO `example_products` VALUES ('49', 'Maxilaku', '23', '3', '24 - 50 g pkgs.', '20.00', '10', '60', '15', '0');
INSERT INTO `example_products` VALUES ('50', 'Valkoinen suklaa', '23', '3', '12 - 100 g bars', '16.25', '65', '0', '30', '0');
INSERT INTO `example_products` VALUES ('51', 'Manjimup Dried Apples', '24', '7', '50 - 300 g pkgs.', '53.00', '20', '0', '10', '0');
INSERT INTO `example_products` VALUES ('52', 'Filo Mix', '24', '5', '16 - 2 kg boxes', '7.00', '38', '0', '25', '0');
INSERT INTO `example_products` VALUES ('53', 'Perth Pasties', '24', '6', '48 pieces', '32.80', '0', '0', '0', '1');
INSERT INTO `example_products` VALUES ('54', 'Tourtière', '25', '6', '16 pies', '7.45', '21', '0', '10', '0');
INSERT INTO `example_products` VALUES ('55', 'Paté chinois', '25', '6', '24 boxes x 2 pies', '24.00', '115', '0', '20', '0');
INSERT INTO `example_products` VALUES ('56', 'Gnocchi di nonna Alice', '26', '5', '24 - 250 g pkgs.', '38.00', '21', '10', '30', '0');
INSERT INTO `example_products` VALUES ('57', 'Ravioli Angelo', '26', '5', '24 - 250 g pkgs.', '19.50', '36', '0', '20', '0');
INSERT INTO `example_products` VALUES ('58', 'Escarts de Bourgne', '27', '8', '24 pieces', '13.25', '62', '0', '20', '0');
INSERT INTO `example_products` VALUES ('59', 'Raclette Courdavault', '28', '4', '5 kg pkg.', '55.00', '79', '0', '0', '0');
INSERT INTO `example_products` VALUES ('60', 'Camembert Pierrot', '28', '4', '15 - 300 g rounds', '34.00', '19', '0', '0', '0');
INSERT INTO `example_products` VALUES ('61', 'Sirop dérable', '29', '2', '24 - 500 ml bottles', '28.50', '113', '0', '25', '0');
INSERT INTO `example_products` VALUES ('62', 'Tarte au sucre', '29', '3', '48 pies', '49.30', '17', '0', '0', '0');
INSERT INTO `example_products` VALUES ('63', 'Vegie-spread', '7', '2', '15 - 625 g jars', '43.90', '24', '0', '5', '0');
INSERT INTO `example_products` VALUES ('64', 'Wimmers gute Semmelkn?del', '12', '5', '20 bags x 4 pieces', '33.25', '22', '80', '30', '0');
INSERT INTO `example_products` VALUES ('65', 'Louisiana Fiery Hot Pepper Sauce', '2', '2', '32 - 8 oz bottles', '21.05', '76', '0', '0', '0');
INSERT INTO `example_products` VALUES ('66', 'Louisiana Hot Spiced Okra', '2', '2', '24 - 8 oz jars', '17.00', '4', '100', '20', '0');
INSERT INTO `example_products` VALUES ('67', 'Laughing Lumberjack Lager', '16', '1', '24 - 12 oz bottles', '14.00', '52', '0', '10', '0');
INSERT INTO `example_products` VALUES ('68', 'Scottish Longbreads', '8', '3', '10 boxes x 8 pieces', '12.50', '6', '10', '15', '0');
INSERT INTO `example_products` VALUES ('69', 'Gudbrandsdalsost', '15', '4', '10 kg pkg.', '36.00', '26', '0', '15', '0');
INSERT INTO `example_products` VALUES ('70', 'Outback Lager', '7', '1', '24 - 355 ml bottles', '15.00', '15', '10', '30', '0');
INSERT INTO `example_products` VALUES ('71', 'Flotemysost', '15', '4', '10 - 500 g pkgs.', '21.50', '26', '0', '0', '0');
INSERT INTO `example_products` VALUES ('72', 'Mozzarella di Giovanni', '14', '4', '24 - 200 g pkgs.', '34.80', '14', '0', '0', '0');
INSERT INTO `example_products` VALUES ('73', 'R?d Kaviar', '17', '8', '24 - 150 g jars', '15.00', '101', '0', '5', '0');
INSERT INTO `example_products` VALUES ('74', 'Longlife Tofu', '4', '7', '5 kg pkg.', '10.00', '4', '20', '5', '0');
INSERT INTO `example_products` VALUES ('75', 'Rh?nbr?u Klosterbier', '12', '1', '24 - 0.5 l bottles', '7.75', '125', '0', '25', '0');
INSERT INTO `example_products` VALUES ('76', 'Lakkalik??ri', '23', '1', '500 ml', '18.00', '57', '0', '20', '0');
INSERT INTO `example_products` VALUES ('77', 'Original Frankfurter grüne So?e', '12', '2', '12 boxes', '13.00', '32', '0', '15', '0');

-- ----------------------------
-- Table structure for example_shippers
-- ----------------------------
DROP TABLE IF EXISTS `example_shippers`;
CREATE TABLE `example_shippers` (
  `ShipperID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(40) NOT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of example_shippers
-- ----------------------------
INSERT INTO `example_shippers` VALUES ('1', 'Speedy Express', '(503) 555-9831');
INSERT INTO `example_shippers` VALUES ('2', 'United Package', '(503) 555-3199');
INSERT INTO `example_shippers` VALUES ('3', 'Federal Shipping', '(503) 555-9931');

-- ----------------------------
-- Table structure for example_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `example_suppliers`;
CREATE TABLE `example_suppliers` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `HomePage` varchar(2084) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`),
  KEY `CompanyName` (`CompanyName`),
  KEY `PostalCode` (`PostalCode`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of example_suppliers
-- ----------------------------
INSERT INTO `example_suppliers` VALUES ('1', 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', null, 'EC1 4SD', 'UK', '(171) 555-2222', null, null);
INSERT INTO `example_suppliers` VALUES ('2', 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', null, '#CAJUN.HTM#');
INSERT INTO `example_suppliers` VALUES ('3', 'Grandma Kellys Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', null);
INSERT INTO `example_suppliers` VALUES ('4', 'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai Musashino-shi', 'Tokyo', null, '100', 'Japan', '(03) 3555-5011', null, null);
INSERT INTO `example_suppliers` VALUES ('5', 'Cooperativa de Quesos Las Cabras', 'Antonio del Valle Saavedra', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54', null, null);
INSERT INTO `example_suppliers` VALUES ('6', 'Mayumis', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko Chuo-ku', 'Osaka', null, '545', 'Japan', '(06) 431-7877', null, 'Mayumis (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#');
INSERT INTO `example_suppliers` VALUES ('7', 'Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St. Moonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', null);
INSERT INTO `example_suppliers` VALUES ('8', 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 Kings Way', 'Manchester', null, 'M14 GSD', 'UK', '(161) 555-4448', null, null);
INSERT INTO `example_suppliers` VALUES ('9', 'PB Kn?ckebr?d AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'G?teborg', null, 'S-345 67', 'Sweden', '031-987 65 43', '031-987 65 91', null);
INSERT INTO `example_suppliers` VALUES ('10', 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.890', 'Sao Paulo', null, '5442', 'Brazil', '(11) 555 4640', null, null);
INSERT INTO `example_suppliers` VALUES ('11', 'Heli Sü?waren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstra?e 5', 'Berlin', null, '10785', 'Germany', '(010) 9984510', null, null);
INSERT INTO `example_suppliers` VALUES ('12', 'Plutzer Lebensmittelgro?m?rkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt', null, '60439', 'Germany', '(069) 992755', null, 'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#');
INSERT INTO `example_suppliers` VALUES ('13', 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven', null, '27478', 'Germany', '(04721) 8713', '(04721) 8714', null);
INSERT INTO `example_suppliers` VALUES ('14', 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', null, '48100', 'Italy', '(0544) 60323', '(0544) 60603', '#FORMAGGI.HTM#');
INSERT INTO `example_suppliers` VALUES ('15', 'Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', null, '1320', 'Norway', '(0)2-953010', null, null);
INSERT INTO `example_suppliers` VALUES ('16', 'Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '3400 - 8th Avenue Suite 210', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931', null, null);
INSERT INTO `example_suppliers` VALUES ('17', 'Svensk Sj?f?da AB', 'Michael Bj?rn', 'Sales Representative', 'Brovallav?gen 231', 'Stockholm', null, 'S-123 45', 'Sweden', '08-123 45 67', null, null);
INSERT INTO `example_suppliers` VALUES ('18', 'Aux joyeux ecclésiastiques', 'Guylène Nodier', 'Sales Manager', '203, Rue des Francs-Bourgeois', 'Paris', null, '75004', 'France', '(1) 03.83.00.68', '(1) 03.83.00.62', null);
INSERT INTO `example_suppliers` VALUES ('19', 'New England Seafood Cannery', 'Robb Merchant', 'Wholesale Account Agent', 'Order Processing Dept. 2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'USA', '(617) 555-3267', '(617) 555-3389', null);
INSERT INTO `example_suppliers` VALUES ('20', 'Leka Trading', 'Chandra Leka', 'Owner', '471 Seranon Loop, Suite #402', 'Singapore', null, '0512', 'Singapore', '555-8787', null, null);
INSERT INTO `example_suppliers` VALUES ('21', 'Lyngbysild', 'Niels Petersen', 'Sales Manager', 'Lyngbysild Fiskebakken 10', 'Lyngby', null, '2800', 'Denmark', '43844108', '43844115', null);
INSERT INTO `example_suppliers` VALUES ('22', 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Accounting Manager', 'Verkoop Rijnweg 22', 'Zaandam', null, '9999 ZZ', 'Netherlands', '(12345) 1212', '(12345) 1210', null);
INSERT INTO `example_suppliers` VALUES ('23', 'Karkki Oy', 'Anne Heikkonen', 'Product Manager', 'Valtakatu 12', 'Lappeenranta', null, '53120', 'Finland', '(953) 10956', null, null);
INSERT INTO `example_suppliers` VALUES ('24', 'Gday, Mate', 'Wendy Mackenzie', 'Sales Representative', '170 Prince Edward Parade Hunters Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873', 'Gday Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#');
INSERT INTO `example_suppliers` VALUES ('25', 'Ma Maison', 'Jean-Guy Lauzon', 'Marketing Manager', '2960 Rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-9022', null, null);
INSERT INTO `example_suppliers` VALUES ('26', 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Order Administrator', 'Via dei Gelsomini, 153', 'Salerno', null, '84100', 'Italy', '(089) 6547665', '(089) 6547667', null);
INSERT INTO `example_suppliers` VALUES ('27', 'Escarts Nouveaux', 'Marie Delamare', 'Sales Manager', '22, rue H. Voiron', 'Montceau', null, '71300', 'France', '85.57.00.07', null, null);
INSERT INTO `example_suppliers` VALUES ('28', 'Gai paturage', 'Eliane Noz', 'Sales Representative', 'Bat. B 3, rue des Alpes', 'Annecy', null, '74000', 'France', '38.76.98.06', '38.76.98.58', null);
INSERT INTO `example_suppliers` VALUES ('29', 'Forêts dérables', 'Chantal ulet', 'Accounting Manager', '148 rue Chasseur', 'Ste-Hyacinthe', 'Québec', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921', null);

-- ----------------------------
-- Table structure for uasp_aliveapps
-- ----------------------------
DROP TABLE IF EXISTS `uasp_aliveapps`;
CREATE TABLE `uasp_aliveapps` (
  `Tenant_Id` varchar(32) NOT NULL COMMENT '编号',
  `SubApp_Id` char(32) NOT NULL,
  `ActiveTime` datetime NOT NULL,
  `ExpireTime` datetime DEFAULT NULL,
  `Enabled` smallint(6) NOT NULL COMMENT '0 启用；1 禁用；',
  PRIMARY KEY (`Tenant_Id`,`SubApp_Id`),
  KEY `FK_UASP_AliveApp_Ref_SubApp` (`SubApp_Id`),
  CONSTRAINT `FK_UASP_AliveApp_Ref_SubApp` FOREIGN KEY (`SubApp_Id`) REFERENCES `uasp_subapps` (`SubApp_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_AliveApp_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_aliveapps
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_autologins
-- ----------------------------
DROP TABLE IF EXISTS `uasp_autologins`;
CREATE TABLE `uasp_autologins` (
  `Series_Id` char(32) NOT NULL,
  `User_Id` char(32) NOT NULL,
  `Token` varchar(64) NOT NULL,
  `LastUsed` datetime NOT NULL,
  PRIMARY KEY (`Series_Id`),
  KEY `FK_UASP_AutoLogin_Ref_User` (`User_Id`),
  CONSTRAINT `FK_UASP_AutoLogin_Ref_User` FOREIGN KEY (`User_Id`) REFERENCES `uasp_users` (`User_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_autologins
-- ----------------------------
INSERT INTO `uasp_autologins` VALUES ('ks15PWdBUWdpfqDUwxviRA==', '53C1D06102904C4482BD613EC7E49D0F', 'G3GFjqSJi1FZ5ugLBqyN/0cyonYzWlOGtWuFpdturRs=', '2016-07-21 14:03:49');
INSERT INTO `uasp_autologins` VALUES ('navKpA9wpXjJXxeihwHNpg==', '53C1D06102904C4482BD613EC7E49D0F', 'BqQGodp0nQevOV+vpJu4yRTFktIrqbNTHABiW8wD9fw=', '2016-07-20 16:08:21');
INSERT INTO `uasp_autologins` VALUES ('uLpAzIqnCEi3h2JVWp+T8Q==', '53C1D06102904C4482BD613EC7E49D0F', 'YfhfObfYLTUur5jFlxoS1s2whMHdQD3dBdFkHwha9qo=', '2016-07-20 16:03:51');

-- ----------------------------
-- Table structure for uasp_autonumbers
-- ----------------------------
DROP TABLE IF EXISTS `uasp_autonumbers`;
CREATE TABLE `uasp_autonumbers` (
  `AutoNumber_Id` char(32) NOT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `Code` varchar(16) NOT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `Expression` varchar(1024) DEFAULT NULL COMMENT '${类型}-${年}-${月}-${日}-${计数}',
  `Handler` varchar(256) DEFAULT NULL COMMENT 'java 类型',
  `IsFillLack` bit(1) NOT NULL,
  `Increment` smallint(6) NOT NULL,
  `UpdatedTime` datetime NOT NULL,
  `CustomCycle` varchar(1024) DEFAULT NULL COMMENT '${类型}-${年}-${月}-${日}',
  `CountType` smallint(6) NOT NULL COMMENT '按总计数，年计数，季计数，月计数，周计数，天计数',
  PRIMARY KEY (`AutoNumber_Id`),
  KEY `FK_UASP_AutoNumber_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_AutoNumber_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_autonumbers
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_bizform
-- ----------------------------
DROP TABLE IF EXISTS `uasp_bizform`;
CREATE TABLE `uasp_bizform` (
  `BizForm_Id` char(32) NOT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL,
  `Code` varchar(32) NOT NULL,
  `DisplayName` varchar(512) NOT NULL,
  `ProcessKey` varchar(64) NOT NULL,
  `IconUrl` varchar(1024) DEFAULT NULL,
  `Serial` int(11) NOT NULL,
  `Description` varchar(2048) DEFAULT NULL,
  `Type` smallint(6) NOT NULL COMMENT '0 业务表单；1 自定表单、2 自动表单；',
  `Status` smallint(6) NOT NULL COMMENT '0 设计；1 发布；2 作废；',
  PRIMARY KEY (`BizForm_Id`),
  KEY `FK_UASP_BizForm_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_BizForm_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_bizform
-- ----------------------------
INSERT INTO `uasp_bizform` VALUES ('268215121E194B968EB1EB0C37AD3CAD', 'DB9611E', 'Custom_Form', '自定义表单', 'custonTask', null, '0', '', '1', '1');
INSERT INTO `uasp_bizform` VALUES ('2D4D6351FB3E4F20B34B134394963890', 'DB9611E', 'Auto_Form', '自动表单', 'userLeaveTask', null, '0', '', '2', '1');
INSERT INTO `uasp_bizform` VALUES ('86C38FD55A6F41B6A9A9C8E4021DAB20', 'DB9611E', 'Biz_Form', '测试表单', 'userLeaveTask', null, '1', '', '0', '1');

-- ----------------------------
-- Table structure for uasp_companies
-- ----------------------------
DROP TABLE IF EXISTS `uasp_companies`;
CREATE TABLE `uasp_companies` (
  `Company_Id` char(32) NOT NULL,
  `Parent_Id` char(32) DEFAULT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `Code` varchar(32) NOT NULL,
  `ShortName` varchar(64) NOT NULL,
  `FullName` varchar(1024) DEFAULT NULL,
  `Description` varchar(4096) DEFAULT NULL,
  `IndustryType_Id` varchar(32) DEFAULT NULL,
  `Address` varchar(1024) DEFAULT NULL,
  `Postcode` varchar(8) DEFAULT NULL,
  `Telephone` varchar(128) DEFAULT NULL,
  `Email` varchar(1024) DEFAULT NULL,
  `Fax` varchar(64) DEFAULT NULL,
  `Linkman` varchar(32) DEFAULT NULL,
  `EstaDate` datetime DEFAULT NULL,
  `Serial` int(11) NOT NULL DEFAULT '0',
  `Status` smallint(6) NOT NULL DEFAULT '0',
  `UpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`Company_Id`),
  KEY `FK_UASP_Company_Parent_Ref_ID` (`Parent_Id`),
  KEY `FK_UASP_Company_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_Company_Parent_Ref_ID` FOREIGN KEY (`Parent_Id`) REFERENCES `uasp_companies` (`Company_Id`),
  CONSTRAINT `FK_UASP_Company_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_companies
-- ----------------------------
INSERT INTO `uasp_companies` VALUES ('1A1BD4C9259D4E05A16B8B6116B2E682', null, 'DB9611E', 'ShangGuo', '三国集团', '华夏三国集团有限公司', '', null, null, null, null, null, null, null, null, '0', '1', '2016-06-01 14:25:59');

-- ----------------------------
-- Table structure for uasp_departments
-- ----------------------------
DROP TABLE IF EXISTS `uasp_departments`;
CREATE TABLE `uasp_departments` (
  `Department_Id` char(32) NOT NULL,
  `Parent_Id` char(32) DEFAULT NULL,
  `Company_Id` char(32) NOT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `Code` varchar(32) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Description` varchar(4096) DEFAULT NULL,
  `Serial` int(11) NOT NULL DEFAULT '0',
  `Status` smallint(6) NOT NULL DEFAULT '0',
  `UpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`Department_Id`),
  KEY `FK_UASP_Department_Parent_Ref_ID` (`Parent_Id`),
  KEY `FK_UASP_Department_Ref_Company` (`Company_Id`),
  KEY `FK_UASP_Department_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_Department_Parent_Ref_ID` FOREIGN KEY (`Parent_Id`) REFERENCES `uasp_departments` (`Department_Id`),
  CONSTRAINT `FK_UASP_Department_Ref_Company` FOREIGN KEY (`Company_Id`) REFERENCES `uasp_companies` (`Company_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_Department_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_departments
-- ----------------------------
INSERT INTO `uasp_departments` VALUES ('354F28F6EEE745C89F8D428D3D1227B9', null, '1A1BD4C9259D4E05A16B8B6116B2E682', 'DB9611E', 'HR', '人事部', '', '0', '1', '2016-06-17 11:59:01');
INSERT INTO `uasp_departments` VALUES ('371462CA4DBB4E84B4AD0658696BB1E1', null, '1A1BD4C9259D4E05A16B8B6116B2E682', 'DB9611E', 'ZhonJingLi', '总经理', '', '0', '1', '2016-06-01 14:27:36');
INSERT INTO `uasp_departments` VALUES ('9286D03B22144F7FBBDDDC97FAA9F120', null, '1A1BD4C9259D4E05A16B8B6116B2E682', 'DB9611E', 'YeWu', '业务部', '', '0', '1', '2016-06-01 14:27:58');
INSERT INTO `uasp_departments` VALUES ('DD331306C36F4A5492CA27084D7E1B0E', null, '1A1BD4C9259D4E05A16B8B6116B2E682', 'DB9611E', 'IT', 'IT部', '', '0', '1', '2016-06-01 14:28:19');
INSERT INTO `uasp_departments` VALUES ('E1540D75A5C14D68A1B344FC441CFC9A', null, '1A1BD4C9259D4E05A16B8B6116B2E682', 'DB9611E', 'ShiChang', '市场部', '', '0', '1', '2016-06-01 14:26:43');

-- ----------------------------
-- Table structure for uasp_dictitems
-- ----------------------------
DROP TABLE IF EXISTS `uasp_dictitems`;
CREATE TABLE `uasp_dictitems` (
  `Item_Id` char(32) NOT NULL,
  `Parent_Id` char(32) DEFAULT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `Dict_Id` char(32) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Value` varchar(1024) NOT NULL,
  `Serial` int(11) NOT NULL DEFAULT '0',
  `IsFixed` bit(1) NOT NULL,
  PRIMARY KEY (`Item_Id`),
  KEY `FK_UASP_DictItem_Parent_Ref_ID` (`Parent_Id`),
  KEY `FK_UASP_DictItem_Ref_DictDefine` (`Dict_Id`),
  KEY `FK_UASP_DictItem_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_DictItem_Parent_Ref_ID` FOREIGN KEY (`Parent_Id`) REFERENCES `uasp_dictitems` (`Item_Id`),
  CONSTRAINT `FK_UASP_DictItem_Ref_DictDefine` FOREIGN KEY (`Dict_Id`) REFERENCES `usap_dictdefine` (`Dict_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_DictItem_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_dictitems
-- ----------------------------
INSERT INTO `uasp_dictitems` VALUES ('07C4DD821B0F47558CF950037F614B51', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '广东', 'S01', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('1359C28A2BC64E40B40559BF15598BEA', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '山西', 'S02', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('16FA10FB0DC74124883836112C03CA9C', null, 'DB9611E', 'DBF4DC05D94411E5943F10BF48BBBEC9', '日本', 'JP', '3', '');
INSERT INTO `uasp_dictitems` VALUES ('1B1D8D3CA53642B2A9783B74940094B6', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '安徽', 'S03', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('1C8A9F40E317448081F1C5EA8F9760EF', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '广西', 'Q05', '4', '\0');
INSERT INTO `uasp_dictitems` VALUES ('2193ADE8C63C44F99F48D669BD9336D1', null, 'DB9611E', 'DBF4DC05D94411E5943F10BF48BBBEC9', '中国', 'ZH', '1', '');
INSERT INTO `uasp_dictitems` VALUES ('2706E212622F4659BB88449741503C6A', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '江苏', 'S05', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('30C5FAF026C6485ABCE26BA52BE8620C', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '北京', 'Z01', '2', '\0');
INSERT INTO `uasp_dictitems` VALUES ('313E5CAAB9E44B63A5A3599EF30909C9', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '辽宁', 'S06', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('3ADB586CA492445798323C1C7DBF6336', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '山东', 'S07', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('46491CCBD5EF11E58D5F00163E003262', null, null, '2A8DDB30D5EF11E58D5F00163E003262', '国企', '01', '0', '\0');
INSERT INTO `uasp_dictitems` VALUES ('4DA69EF51F2E4521AC8263AF87856192', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '甘肃', 'S08', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('4F1149D8929A4C079D2D723C60B46ABD', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '湖南', 'S09', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('50B41B91264044DDAFF464A4ED84136E', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '澳门', 'T02', '3', '\0');
INSERT INTO `uasp_dictitems` VALUES ('5C446A35058449F994989897B3CCF995', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '新疆', 'Q01', '4', '\0');
INSERT INTO `uasp_dictitems` VALUES ('6130AD100B934354AC5CDCB5B85F2754', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '浙江', 'S10', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('65A1C2AA5F0A41C9878FCB579E10431A', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '河北', 'S11', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('669CE589D5EF11E58D5F00163E003262', null, null, '2A8DDB30D5EF11E58D5F00163E003262', '私企', '02', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('67AD03B15F59474AB5E42B72AF2BF334', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '青海', 'S11', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('6968AB7C582A4718B2E88D8791AA0CF5', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '江西', 'S12', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('6D9390542F0A44AFB2844DEFB5F8FC3C', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '四川', 'S13', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('6EE1D698B2C04900A542E09357BB4CF0', null, 'DB9611E', 'DBF4DC05D94411E5943F10BF48BBBEC9', '美国', 'US', '2', '');
INSERT INTO `uasp_dictitems` VALUES ('70078BC56C8C40519566CE8516FE3B96', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '云南', 'S14', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('7715DFC3CDED44F0B9855DA15D03525C', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '西藏', 'Q04', '4', '\0');
INSERT INTO `uasp_dictitems` VALUES ('7D2C1DAD584545DC986798051A1001E8', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '宁夏', 'Q02', '4', '\0');
INSERT INTO `uasp_dictitems` VALUES ('7F737034D2C04725967E5332D02014E4', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '河南', 'S15', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('80E70E13C11B4550BB5CBAF522179B0C', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '海南', 'S16', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('86E5C63DA8294E04A8D38DD12012ADAD', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '吉林', 'S17', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('8F872EC2724845948572AA70BA238E53', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '福建', 'S18', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('930DCA4C9392470CBA12F9A83B8ED982', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '香港', 'T01', '3', '\0');
INSERT INTO `uasp_dictitems` VALUES ('93A73FFB492C42CE92FC65D3AA02E38F', null, 'DB9611E', 'DBF4DC05D94411E5943F10BF48BBBEC9', '德国', 'GE', '5', '');
INSERT INTO `uasp_dictitems` VALUES ('9F966C8E44814F59A0C997536B95483F', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '内蒙古', 'Q03', '4', '\0');
INSERT INTO `uasp_dictitems` VALUES ('AF1F9CEEFDAF49ECB5F9FC91CBB89871', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '湖北', 'S19', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('CC70B85161B446709901602DD054D876', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '陕西', 'S20', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('D061BE3577F5419BB1C5843832567500', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '天津', 'Z03', '2', '\0');
INSERT INTO `uasp_dictitems` VALUES ('D42BADAC7F6147F69327D5378DE1CB44', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '台湾', 'S21', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('D6AD00DDD5764A229D018F0FBFEA103A', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '贵州', 'S22', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('D80E8822ECB349A9A1E0BE11642C78C6', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '上海', 'Z02', '2', '\0');
INSERT INTO `uasp_dictitems` VALUES ('E611900B68764077AE94FB462437F281', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '黑龙江', 'S23', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('E715B055EB214A71AEFDADF6F742C2DD', null, 'DB9611E', 'DBF4DC05D94411E5943F10BF48BBBEC9', '英国', 'EN', '4', '');
INSERT INTO `uasp_dictitems` VALUES ('EE7BBE2428D248A3B6F8A5ED294F57AF', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '四川', 'S04', '1', '\0');
INSERT INTO `uasp_dictitems` VALUES ('F6FE6CC20E7F40B38455342FE3018A78', null, null, '745F9DDCD94411E5943F10BF48BBBEC9', '重庆', 'Z04', '2', '\0');

-- ----------------------------
-- Table structure for uasp_employees
-- ----------------------------
DROP TABLE IF EXISTS `uasp_employees`;
CREATE TABLE `uasp_employees` (
  `Employee_Id` char(32) NOT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `User_Id` varchar(32) DEFAULT NULL COMMENT '用户',
  `Code` varchar(32) DEFAULT NULL,
  `Name` varchar(64) NOT NULL,
  `Sex` smallint(16) DEFAULT NULL COMMENT '词典',
  `BirthDay` datetime DEFAULT NULL,
  `Phone` varchar(64) DEFAULT NULL,
  `Mobile` varchar(64) DEFAULT NULL,
  `Email` varchar(1024) DEFAULT NULL,
  `Status` smallint(6) NOT NULL,
  `UpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`Employee_Id`),
  UNIQUE KEY `FK_UASP_Employee_Ref_User` (`User_Id`) USING BTREE,
  KEY `FK_UASP_Employee_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_Employee_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_Employee_Ref_User` FOREIGN KEY (`User_Id`) REFERENCES `uasp_users` (`User_Id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_employees
-- ----------------------------
INSERT INTO `uasp_employees` VALUES ('1563D1CD22074E6090F8E80E6124CF35', 'DB9611E', '54CB0067DBF84545B5B6BA3BD289EF05', 'andy', 'Andy Zhao', null, null, '', '', '', '1', '2016-06-01 15:53:17');
INSERT INTO `uasp_employees` VALUES ('16345160E0B04688B030369109D5983B', 'DB9611E', '9F88694FB54B4E6D81072718198BC1FC', 'tom', 'Tom Wang', null, null, '', '', '', '1', '2016-06-01 15:50:36');
INSERT INTO `uasp_employees` VALUES ('2951E00A31D0453DB6292E6990BC3CF4', 'DB9611E', '8B317331BD2543CD9A255DBAB7C2AC2A', 'jenny', 'Jenny Luo', null, '2003-06-11 00:00:00', '', '', '', '1', '2016-06-01 15:54:02');
INSERT INTO `uasp_employees` VALUES ('38E8B24AEF244B08AC8358AB0B0686C2', 'DB9611E', 'D8B257DEE38642C18F911D5BF24401F3', 'amy', 'Amy Zhang', null, null, '', '', '', '1', '2016-06-01 16:30:17');
INSERT INTO `uasp_employees` VALUES ('84ECDDDA4CE145DDAA66084B978AA31E', 'DB9611E', '53C1D06102904C4482BD613EC7E49D0F', 'kermit', 'Kermit Miao', null, null, '', '', '', '1', '2016-06-01 15:57:59');
INSERT INTO `uasp_employees` VALUES ('BF835AF352754B98B05E15E33D6E4AE7', 'DB9611E', '630D9C4BE8A74C49A7435A7333762EA6', 'bill', 'Bill Zheng', '1', null, '', '', '', '1', '2016-06-21 15:47:00');
INSERT INTO `uasp_employees` VALUES ('D13016E12A6C4132A74A93036A6D9D32', 'DB9611E', '6A29770F05C04C87B471A382607D3099', 'henry', 'Henry Yan', '1', null, '', '', '', '1', '2016-06-01 16:31:12');
INSERT INTO `uasp_employees` VALUES ('D79046C8C6E84E3C8130FD563F84BC96', 'DB9611E', '65DB25265852471D98C417FB01750137', 'eric', 'Eric Li', '0', '2016-06-01 00:00:00', '', '', '', '1', '2016-06-01 16:39:51');

-- ----------------------------
-- Table structure for uasp_filefolders
-- ----------------------------
DROP TABLE IF EXISTS `uasp_filefolders`;
CREATE TABLE `uasp_filefolders` (
  `Folder_Id` char(32) NOT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `Parent_Id` char(32) DEFAULT NULL,
  `Creator_Id` char(32) DEFAULT NULL,
  `Group_Id` char(32) DEFAULT NULL,
  `Name` varchar(32) NOT NULL,
  `Hidden` bit(1) NOT NULL,
  PRIMARY KEY (`Folder_Id`),
  KEY `FK_UASP_FileFolder_Ref_Creator` (`Creator_Id`),
  KEY `FK_UASP_FileFolder_Ref_Group` (`Group_Id`),
  KEY `FK_UASP_FileFolder_Ref_Parent` (`Parent_Id`),
  KEY `FK_UASP_FileFolder_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_FileFolder_Ref_Creator` FOREIGN KEY (`Creator_Id`) REFERENCES `uasp_users` (`User_Id`),
  CONSTRAINT `FK_UASP_FileFolder_Ref_Group` FOREIGN KEY (`Group_Id`) REFERENCES `uasp_groups` (`Group_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_FileFolder_Ref_Parent` FOREIGN KEY (`Parent_Id`) REFERENCES `uasp_filefolders` (`Folder_Id`),
  CONSTRAINT `FK_UASP_FileFolder_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_filefolders
-- ----------------------------
INSERT INTO `uasp_filefolders` VALUES ('0B360E55DF8211E58D5F00163E003262', 'DB9611E', null, 'ED5591AB52CC489F8A52445CF6125CD8', null, '个人照片', '\0');
INSERT INTO `uasp_filefolders` VALUES ('0F2D7BE1E02011E59888D8CB8A43F8DD', 'DB9611E', null, '18C5BD7D457647ECB3F688D4ECF1C0C8', null, '大广高速', '\0');
INSERT INTO `uasp_filefolders` VALUES ('2E5421CDDF7611E58D5F00163E003262', 'DB9611E', null, '18C5BD7D457647ECB3F688D4ECF1C0C8', null, '工作文档', '\0');
INSERT INTO `uasp_filefolders` VALUES ('43D97ADADF7611E58D5F00163E003262', 'DB9611E', null, 'ED5591AB52CC489F8A52445CF6125CD8', 'EFA7A76EDF7111E58D5F00163E003262', '招头标', '\0');
INSERT INTO `uasp_filefolders` VALUES ('6F660CBCC3C34039A125A96AA1F5C282', 'DB9611E', null, '53C1D06102904C4482BD613EC7E49D0F', null, '常用文件', '\0');
INSERT INTO `uasp_filefolders` VALUES ('72523D23DF7C11E58D5F00163E003262', 'DB9611E', null, 'ED5591AB52CC489F8A52445CF6125CD8', '3FAA7E74DF7C11E58D5F00163E003262', '招头标', '\0');
INSERT INTO `uasp_filefolders` VALUES ('A8E0231EDF8D11E58FA3D8CB8A43F8DD', 'DB9611E', null, 'ED5591AB52CC489F8A52445CF6125CD8', 'EFA7A76EDF7111E58D5F00163E003262', '合同文件', '\0');
INSERT INTO `uasp_filefolders` VALUES ('B1900536E04011E59888D8CB8A43F8DD', null, 'F732A19CDF7511E58D5F00163E003262', 'BD817FA7716E11E586C6D8CB8A43F8DD', null, '教学视频', '\0');
INSERT INTO `uasp_filefolders` VALUES ('D8FCD6DBE04011E59888D8CB8A43F8DD', null, 'F732A19CDF7511E58D5F00163E003262', 'BD817FA7716E11E586C6D8CB8A43F8DD', null, '操作手册', '\0');
INSERT INTO `uasp_filefolders` VALUES ('F732A19CDF7511E58D5F00163E003262', null, null, 'BD817FA7716E11E586C6D8CB8A43F8DD', null, '培训文档', '\0');

-- ----------------------------
-- Table structure for uasp_fileinfos
-- ----------------------------
DROP TABLE IF EXISTS `uasp_fileinfos`;
CREATE TABLE `uasp_fileinfos` (
  `File_Id` char(32) NOT NULL,
  `FileSize` int(11) NOT NULL,
  `ContentType` varchar(512) NOT NULL,
  `LogicPath` varchar(2048) DEFAULT NULL,
  `MD5` varchar(512) DEFAULT NULL,
  `AllowChange` bit(1) NOT NULL,
  `IsEncrypted` bit(1) NOT NULL,
  `Salt` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`File_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_fileinfos
-- ----------------------------
INSERT INTO `uasp_fileinfos` VALUES ('13F07C60A4444A96A21E6E4256A75AEA', '35840', 'application/vnd.ms-excel', '{DiskA}\\20160707\\', 'a8d15b35cad50b30eacd04a01933b1c5', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('15E9D7BD88E94809A39C94FDED82B57F', '35328', 'application/vnd.ms-excel', '{DiskA}\\20160707\\', '7602960ff83f2c13ca7ed8fb821ac012', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('2525C99402D5485499596CA1BE5FD1E1', '3823760', 'image/jpeg', '{DiskA}\\20160301\\', 'f0955a39207a7477ddc29da7033ce457', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('508D598327C247CAABF3B18F59E561D3', '1974609', 'application/pdf', '{DiskA}\\20160522\\', '107c8f3697e2bca4df990d1a2789898a', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('5362C80A155A4D7294CA8362F81D0EC1', '1239040', 'application/msword', '{DiskA}\\20160301\\', '9a52a7126400a031724d5651bc147757', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('59D2CC56D9D54AC0A48B405233B87E48', '190464', 'application/octet-stream', '{DiskA}\\20160301\\', 'e718c1bcf01ac0fd8fd3f8a98f6a3e33', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('5B19198FCF8746C5B6EDF303A2AA9252', '828347', 'application/pdf', '{DiskA}\\20160707\\', '5e0df0291a474bb537e31152f3beee90', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('65D2737FAC8E4F5E85FE292FA9DB46B1', '58368', 'application/vnd.ms-excel', '{DiskA}\\20160522\\', '8fac5bc58399ce20604f4e2d6bb471b5', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('6DEBEAA6D69A42F58E5A10F00973F276', '72704', 'application/msword', '{DiskA}\\20160707\\', 'f22e3f8ca321054d1893fe4019cab008', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('87F95AB9319E486CAB12C0B1F923FF7F', '2737738', 'application/pdf', '{DiskA}\\20160522\\', '2f77bb1d49db2baf37df606e230b3cb4', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('88D5A08266314345B6285D27BEB97ABF', '15482', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '{DiskA}\\20160707\\', '88f2740a6dbb43fb00ae9eb37ac4c3e9', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('959E582E017046319F7F26F09E51AE00', '107', 'application/octet-stream', '{DiskA}\\20160522\\', '9cea42ee3fe28272b7d2c7becedcd67d', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('A2E0FC89C71B46BFB30159F1F9D7206E', '641', 'application/octet-stream', '{DiskA}\\20160522\\', 'd9ed476a26bdc9e2fa9f87ea2655e8d1', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('A9737667B1914C7BA28685B64020E970', '439844', 'application/octet-stream', '{DiskA}\\20160301\\', '402d25834a42765139237ad05f4792f9', '\0', '', 'OgkVFJ1wD3z7rvMx0rCOyg==');
INSERT INTO `uasp_fileinfos` VALUES ('CC1E4A50429C4D2B839CBF1306BD4638', '11264', 'application/vnd.ms-excel', '{DiskA}\\20160301\\', 'e4e63ce98ce9e6c6a23763138c5b675d', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('CDDDDC3A6CB84BDDAD4B46BC1191A6B6', '565248', 'application/vnd.ms-excel', '{DiskA}\\20160522\\', '508c065b8f1559f9273adbc5e6362587', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('DF26878045CC40DA8EAF5E1484D82D35', '4936', 'text/xml', '{DiskA}\\20160522\\', 'ad1429497581d315f85b5ff76b79300c', '\0', '\0', null);
INSERT INTO `uasp_fileinfos` VALUES ('ED7AD48A0F6C4FCF8F8C668B97679396', '35841', 'application/msword', '{DiskA}\\20160707\\', '35c94875d5459f9b3e91b7bdefe538e0', '\0', '\0', null);

-- ----------------------------
-- Table structure for uasp_filerelations
-- ----------------------------
DROP TABLE IF EXISTS `uasp_filerelations`;
CREATE TABLE `uasp_filerelations` (
  `Fr_Id` char(32) NOT NULL,
  `File_Id` char(32) NOT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `Folder_Id` char(32) DEFAULT NULL,
  `BizId` varchar(64) DEFAULT NULL,
  `Category` varchar(1024) DEFAULT NULL,
  `FileName` varchar(1024) NOT NULL,
  `Postfix` varchar(32) DEFAULT NULL,
  `UploaderId` varchar(64) DEFAULT NULL,
  `UploaderName` varchar(64) DEFAULT NULL,
  `UploadTime` datetime DEFAULT NULL,
  `Downloads` int(11) NOT NULL DEFAULT '0',
  `Serial` int(11) NOT NULL DEFAULT '0',
  `Tags` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`Fr_Id`),
  KEY `FK_UASP_FileRelation_Ref_FileInfo` (`File_Id`),
  KEY `FK_UASP_FileRelation_Ref_Folder` (`Folder_Id`),
  KEY `FK_UASP_FileRelation_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_FileRelation_Ref_FileInfo` FOREIGN KEY (`File_Id`) REFERENCES `uasp_fileinfos` (`File_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_FileRelation_Ref_Folder` FOREIGN KEY (`Folder_Id`) REFERENCES `uasp_filefolders` (`Folder_Id`) ON DELETE SET NULL,
  CONSTRAINT `FK_UASP_FileRelation_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_filerelations
-- ----------------------------
INSERT INTO `uasp_filerelations` VALUES ('1E83E94063EA4B4497BF9BC60207FF8A', '5362C80A155A4D7294CA8362F81D0EC1', null, null, 'C3CD06B2-1AE5-481F-A3BF-ADC177CD586F', '', '利通企业应用开发平台EADP集成开发手册.doc', 'doc', 'BD817FA7716E11E586C6D8CB8A43F8DD', '根管理员', '2016-03-01 10:09:12', '2', '0', '');
INSERT INTO `uasp_filerelations` VALUES ('21D8CA024D0F4E53B0F7A324CDFFB4B1', '508D598327C247CAABF3B18F59E561D3', 'DB9611E', null, '8F6528BEEAB411E5AD4E10BF48BBBEC9', '合同', '软件成熟度_CMM.pdf', 'pdf', 'ED5591AB52CC489F8A52445CF6125CD8', null, '2016-05-22 20:51:31', '1', '0', null);
INSERT INTO `uasp_filerelations` VALUES ('244D0CD2113349488A987ECAE2199285', '87F95AB9319E486CAB12C0B1F923FF7F', 'DB9611E', '0B360E55DF8211E58D5F00163E003262', null, null, '统一建模语言(UML)参考手册——基本概念.pdf', 'pdf', 'ED5591AB52CC489F8A52445CF6125CD8', null, '2016-05-22 19:33:14', '0', '0', null);
INSERT INTO `uasp_filerelations` VALUES ('27A23C77B50740D4BE57AAD451E12B7A', 'A9737667B1914C7BA28685B64020E970', null, null, 'C3CD06B2-1AE5-481F-A3BF-ADC177CD586F', '', 'kayura_uasp_data.sql', 'sql', 'BD817FA7716E11E586C6D8CB8A43F8DD', '根管理员', '2016-03-01 10:17:19', '0', '0', '');
INSERT INTO `uasp_filerelations` VALUES ('3CB72C5F3AEC4B3F9BB6D7EEA2AE4699', '65D2737FAC8E4F5E85FE292FA9DB46B1', 'DB9611E', '0B360E55DF8211E58D5F00163E003262', null, null, '隆驰JOQ地图链接及指导.xls', 'xls', 'ED5591AB52CC489F8A52445CF6125CD8', null, '2016-05-22 19:33:21', '0', '0', null);
INSERT INTO `uasp_filerelations` VALUES ('4A02B887E7C84DE4B53570B28CBE8BFC', 'CDDDDC3A6CB84BDDAD4B46BC1191A6B6', 'DB9611E', null, '8F6528BEEAB411E5AD4E10BF48BBBEC9', '归档', '20151014090412469.xls', 'xls', 'ED5591AB52CC489F8A52445CF6125CD8', null, '2016-05-22 20:51:39', '1', '0', null);
INSERT INTO `uasp_filerelations` VALUES ('74BAD8838C4C4C639E6693FE4E111205', 'CC1E4A50429C4D2B839CBF1306BD4638', null, null, 'C3CD06B2-1AE5-481F-A3BF-ADC177CD586F', '', '工作流待完善功能.xls', 'xls', 'BD817FA7716E11E586C6D8CB8A43F8DD', '根管理员', '2016-03-01 10:03:55', '7', '0', '');
INSERT INTO `uasp_filerelations` VALUES ('7A7976D2A6504938B557BD4148066C23', 'DF26878045CC40DA8EAF5E1484D82D35', 'DB9611E', null, '8F6528BEEAB411E5AD4E10BF48BBBEC9', '归档', 'java_codetemplates.xml', 'xml', 'ED5591AB52CC489F8A52445CF6125CD8', null, '2016-05-22 20:52:10', '1', '0', null);
INSERT INTO `uasp_filerelations` VALUES ('8DDE35DDB3714842B5327C0BE9F55F16', '65D2737FAC8E4F5E85FE292FA9DB46B1', 'DB9611E', null, '8F6528BEEAB411E5AD4E10BF48BBBEC9', '归档', '隆驰JOQ地图链接及指导.xls', 'xls', 'ED5591AB52CC489F8A52445CF6125CD8', null, '2016-05-22 20:51:37', '1', '0', null);
INSERT INTO `uasp_filerelations` VALUES ('9B997D9AB50349F4A3D818E165A787B6', '59D2CC56D9D54AC0A48B405233B87E48', null, null, 'C3CD06B2-1AE5-481F-A3BF-ADC177CD586F', '', 'serf-1.2.1.tar.bz2', 'bz2', 'BD817FA7716E11E586C6D8CB8A43F8DD', '根管理员', '2016-03-01 10:12:01', '3', '0', '');
INSERT INTO `uasp_filerelations` VALUES ('A359445F4867461E9378A264706E693E', '2525C99402D5485499596CA1BE5FD1E1', null, null, 'C3CD06B2-1AE5-481F-A3BF-ADC177CD586F', '', 'IMG_20150117_184544.jpg', 'jpg', 'BD817FA7716E11E586C6D8CB8A43F8DD', '根管理员', '2016-03-01 10:11:30', '2', '0', '');
INSERT INTO `uasp_filerelations` VALUES ('A57EB85B16E448398DBF9430BAA2BAA7', '5B19198FCF8746C5B6EDF303A2AA9252', 'DB9611E', null, '8F6528BEEAB411E5AD4E10BF48BBBEC9', '归档', '员工手册[2016年修订版].pdf', 'pdf', '53C1D06102904C4482BD613EC7E49D0F', null, '2016-07-07 10:02:51', '0', '0', null);
INSERT INTO `uasp_filerelations` VALUES ('F3F7DC3DE6FE4CE8ABF850AF6ACB8583', '13F07C60A4444A96A21E6E4256A75AEA', 'DB9611E', null, '8F6528BEEAB411E5AD4E10BF48BBBEC9', '合同', '03B-新员工试用期工作评价表（夏亮）.xls', 'xls', '53C1D06102904C4482BD613EC7E49D0F', null, '2016-07-07 10:02:37', '0', '0', null);

-- ----------------------------
-- Table structure for uasp_fileshares
-- ----------------------------
DROP TABLE IF EXISTS `uasp_fileshares`;
CREATE TABLE `uasp_fileshares` (
  `FileShare_Id` char(32) NOT NULL,
  `Sharer_Id` char(32) NOT NULL,
  `Receiver_Id` char(32) NOT NULL,
  `Folder_Id` char(32) DEFAULT NULL,
  `Fr_Id` char(32) DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`FileShare_Id`),
  KEY `FK_UASP_FileShare_Ref_Folder` (`Folder_Id`),
  KEY `FK_UASP_FileShare_Ref_Receiver` (`Receiver_Id`),
  KEY `FK_UASP_FileShare_Ref_Relation` (`Fr_Id`),
  KEY `FK_UASP_FileShare_Ref_Sharer` (`Sharer_Id`),
  CONSTRAINT `FK_UASP_FileShare_Ref_Folder` FOREIGN KEY (`Folder_Id`) REFERENCES `uasp_filefolders` (`Folder_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_FileShare_Ref_Receiver` FOREIGN KEY (`Receiver_Id`) REFERENCES `uasp_users` (`User_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_FileShare_Ref_Relation` FOREIGN KEY (`Fr_Id`) REFERENCES `uasp_filerelations` (`Fr_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_FileShare_Ref_Sharer` FOREIGN KEY (`Sharer_Id`) REFERENCES `uasp_users` (`User_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_fileshares
-- ----------------------------
INSERT INTO `uasp_fileshares` VALUES ('97867ABCDF8B11E58FA3D8CB8A43F8DD', '18C5BD7D457647ECB3F688D4ECF1C0C8', 'ED5591AB52CC489F8A52445CF6125CD8', '2E5421CDDF7611E58D5F00163E003262', null, '2016-03-01 16:58:12');
INSERT INTO `uasp_fileshares` VALUES ('ED083B30E01F11E59888D8CB8A43F8DD', '18C5BD7D457647ECB3F688D4ECF1C0C8', 'ED5591AB52CC489F8A52445CF6125CD8', '0F2D7BE1E02011E59888D8CB8A43F8DD', null, '2016-03-02 10:41:32');

-- ----------------------------
-- Table structure for uasp_grouproles
-- ----------------------------
DROP TABLE IF EXISTS `uasp_grouproles`;
CREATE TABLE `uasp_grouproles` (
  `Group_Id` char(32) NOT NULL,
  `Role_Id` char(32) NOT NULL,
  PRIMARY KEY (`Group_Id`,`Role_Id`),
  KEY `FK_UASP_GroupRole_Ref_Role` (`Role_Id`),
  CONSTRAINT `FK_UASP_GroupRole_Ref_Group` FOREIGN KEY (`Group_Id`) REFERENCES `uasp_groups` (`Group_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_GroupRole_Ref_Role` FOREIGN KEY (`Role_Id`) REFERENCES `uasp_roles` (`Role_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_grouproles
-- ----------------------------
INSERT INTO `uasp_grouproles` VALUES ('3FAA7E74DF7C11E58D5F00163E003262', '5870A5B5DF7C11E58D5F00163E003262');

-- ----------------------------
-- Table structure for uasp_groups
-- ----------------------------
DROP TABLE IF EXISTS `uasp_groups`;
CREATE TABLE `uasp_groups` (
  `Group_Id` char(32) NOT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `Name` varchar(64) NOT NULL,
  `Enabled` bit(1) NOT NULL COMMENT '0 禁用；1 启用；',
  PRIMARY KEY (`Group_Id`),
  KEY `FK_UASP_Group_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_Group_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_groups
-- ----------------------------
INSERT INTO `uasp_groups` VALUES ('3FAA7E74DF7C11E58D5F00163E003262', 'DB9611E', '项目小组B', '');
INSERT INTO `uasp_groups` VALUES ('EFA7A76EDF7111E58D5F00163E003262', 'DB9611E', '项目小组A', '');

-- ----------------------------
-- Table structure for uasp_groupusers
-- ----------------------------
DROP TABLE IF EXISTS `uasp_groupusers`;
CREATE TABLE `uasp_groupusers` (
  `Group_Id` char(32) NOT NULL,
  `User_Id` char(32) NOT NULL,
  `Identity_Id` char(32) DEFAULT NULL,
  PRIMARY KEY (`Group_Id`,`User_Id`),
  KEY `FK_UASP_GroupUser_Ref_User` (`User_Id`),
  KEY `FK_UASP_GroupUser_Ref_Identity` (`Identity_Id`),
  CONSTRAINT `FK_UASP_GroupUser_Ref_Group` FOREIGN KEY (`Group_Id`) REFERENCES `uasp_groups` (`Group_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_GroupUser_Ref_Identity` FOREIGN KEY (`Identity_Id`) REFERENCES `uasp_identities` (`Identity_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_GroupUser_Ref_User` FOREIGN KEY (`User_Id`) REFERENCES `uasp_users` (`User_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_groupusers
-- ----------------------------
INSERT INTO `uasp_groupusers` VALUES ('EFA7A76EDF7111E58D5F00163E003262', '53C1D06102904C4482BD613EC7E49D0F', null);
INSERT INTO `uasp_groupusers` VALUES ('3FAA7E74DF7C11E58D5F00163E003262', '630D9C4BE8A74C49A7435A7333762EA6', 'EC3B6EEE375A11E6A5730021CCC9FA7E');

-- ----------------------------
-- Table structure for uasp_identities
-- ----------------------------
DROP TABLE IF EXISTS `uasp_identities`;
CREATE TABLE `uasp_identities` (
  `Identity_Id` char(32) NOT NULL,
  `Department_Id` char(32) DEFAULT NULL,
  `Position_Id` char(32) DEFAULT NULL,
  `Employee_Id` char(32) DEFAULT NULL,
  PRIMARY KEY (`Identity_Id`),
  KEY `FK_UASP_Identity_Ref_Department` (`Department_Id`),
  KEY `FK_UASP_Identity_Ref_Employee` (`Employee_Id`),
  KEY `FK_UASP_Identity_Ref_Position` (`Position_Id`),
  CONSTRAINT `FK_UASP_Identity_Ref_Department` FOREIGN KEY (`Department_Id`) REFERENCES `uasp_departments` (`Department_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_Identity_Ref_Employee` FOREIGN KEY (`Employee_Id`) REFERENCES `uasp_employees` (`Employee_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_Identity_Ref_Position` FOREIGN KEY (`Position_Id`) REFERENCES `uasp_positions` (`Position_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_identities
-- ----------------------------
INSERT INTO `uasp_identities` VALUES ('023F1AB9DC71435CBD4BEBC9F6406000', '9286D03B22144F7FBBDDDC97FAA9F120', '38E1E6CCFD4F4E39B9732D7D7AF50029', '38E8B24AEF244B08AC8358AB0B0686C2');
INSERT INTO `uasp_identities` VALUES ('09F3CC5E375A11E6A5730021CCC9FA7E', '354F28F6EEE745C89F8D428D3D1227B9', '8E29010D7BCC4A538536C21913282263', '84ECDDDA4CE145DDAA66084B978AA31E');
INSERT INTO `uasp_identities` VALUES ('6CAC5DDB375A11E6A5730021CCC9FA7E', 'E1540D75A5C14D68A1B344FC441CFC9A', '38E1E6CCFD4F4E39B9732D7D7AF50029', '84ECDDDA4CE145DDAA66084B978AA31E');
INSERT INTO `uasp_identities` VALUES ('98C7246FAA9B4D298D5CB93A433EC62A', '371462CA4DBB4E84B4AD0658696BB1E1', null, 'BF835AF352754B98B05E15E33D6E4AE7');
INSERT INTO `uasp_identities` VALUES ('C942358D5CE04707AE6C92599BC7816D', '9286D03B22144F7FBBDDDC97FAA9F120', '38E1E6CCFD4F4E39B9732D7D7AF50029', '16345160E0B04688B030369109D5983B');
INSERT INTO `uasp_identities` VALUES ('D5BE66B8A425407BA5211638BADCB707', '354F28F6EEE745C89F8D428D3D1227B9', '8E29010D7BCC4A538536C21913282263', 'D79046C8C6E84E3C8130FD563F84BC96');
INSERT INTO `uasp_identities` VALUES ('D6511017EFF146AE8C5383D4E96B5FE4', 'E1540D75A5C14D68A1B344FC441CFC9A', null, '16345160E0B04688B030369109D5983B');
INSERT INTO `uasp_identities` VALUES ('EC3B6EEE375A11E6A5730021CCC9FA7E', '354F28F6EEE745C89F8D428D3D1227B9', '8E29010D7BCC4A538536C21913282263', 'BF835AF352754B98B05E15E33D6E4AE7');
INSERT INTO `uasp_identities` VALUES ('F847C5C9784449A99F2B399693534947', 'DD331306C36F4A5492CA27084D7E1B0E', null, '16345160E0B04688B030369109D5983B');

-- ----------------------------
-- Table structure for uasp_menuitems
-- ----------------------------
DROP TABLE IF EXISTS `uasp_menuitems`;
CREATE TABLE `uasp_menuitems` (
  `MenuItem_Id` char(32) NOT NULL,
  `Parent_Id` char(32) DEFAULT NULL,
  `MenuPlan_Id` char(32) NOT NULL,
  `Module_Id` char(32) DEFAULT NULL,
  `Type` smallint(6) NOT NULL COMMENT '1 菜单分类；2 菜单项；',
  `DisplayName` varchar(64) DEFAULT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `Icon` varchar(2048) DEFAULT NULL,
  `Serial` int(11) DEFAULT NULL,
  `Enabled` bit(1) NOT NULL COMMENT '0 禁用；1 启用；',
  PRIMARY KEY (`MenuItem_Id`),
  KEY `FK_UASP_MenuItem_Parent_Ref_ID` (`Parent_Id`),
  KEY `FK_UASP_MenuItem_Ref_MenuScheme` (`MenuPlan_Id`),
  KEY `FK_UASP_MenuItem_Ref_Module` (`Module_Id`),
  CONSTRAINT `FK_UASP_MenuItem_Parent_Ref_ID` FOREIGN KEY (`Parent_Id`) REFERENCES `uasp_menuitems` (`MenuItem_Id`),
  CONSTRAINT `FK_UASP_MenuItem_Ref_MenuScheme` FOREIGN KEY (`MenuPlan_Id`) REFERENCES `uasp_menuschemes` (`MenuScheme_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_MenuItem_Ref_Module` FOREIGN KEY (`Module_Id`) REFERENCES `uasp_modules` (`Module_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_menuitems
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_menuschemes
-- ----------------------------
DROP TABLE IF EXISTS `uasp_menuschemes`;
CREATE TABLE `uasp_menuschemes` (
  `MenuScheme_Id` char(32) NOT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '此值为NULL时，为公共菜单方案',
  `Code` varchar(32) NOT NULL,
  `Name` varchar(64) NOT NULL,
  PRIMARY KEY (`MenuScheme_Id`),
  KEY `FK_UASP_MenuScheme_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_MenuScheme_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_menuschemes
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_mockorders
-- ----------------------------
DROP TABLE IF EXISTS `uasp_mockorders`;
CREATE TABLE `uasp_mockorders` (
  `Order_Id` char(32) NOT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `Code` varchar(64) NOT NULL,
  `Title` varchar(512) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `Author` varchar(32) NOT NULL,
  `UpdateTime` datetime NOT NULL,
  PRIMARY KEY (`Order_Id`),
  KEY `FK_UPAS_AnalogOrder_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UPAS_AnalogOrder_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_mockorders
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_modules
-- ----------------------------
DROP TABLE IF EXISTS `uasp_modules`;
CREATE TABLE `uasp_modules` (
  `Module_Id` char(32) NOT NULL,
  `SubApp_Id` char(32) DEFAULT NULL,
  `Parent_Id` char(32) DEFAULT NULL,
  `Type` smallint(6) NOT NULL COMMENT '1 模块分类；2 模块项；',
  `Code` varchar(32) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `Icon` varchar(2048) DEFAULT NULL,
  `URI` varchar(2048) DEFAULT NULL,
  `Serial` int(11) NOT NULL,
  `Actions` varchar(4096) DEFAULT NULL,
  `Enabled` bit(1) NOT NULL COMMENT '0 禁用；1 可用；',
  PRIMARY KEY (`Module_Id`),
  KEY `FK_UASP_Module_Parent_Ref_ID` (`Parent_Id`),
  KEY `FK_UASP_Module_Ref_SubApp` (`SubApp_Id`),
  CONSTRAINT `FK_UASP_Module_Parent_Ref_ID` FOREIGN KEY (`Parent_Id`) REFERENCES `uasp_modules` (`Module_Id`),
  CONSTRAINT `FK_UASP_Module_Ref_SubApp` FOREIGN KEY (`SubApp_Id`) REFERENCES `uasp_subapps` (`SubApp_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_modules
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_numbercount
-- ----------------------------
DROP TABLE IF EXISTS `uasp_numbercount`;
CREATE TABLE `uasp_numbercount` (
  `NumberCount_Id` char(32) NOT NULL,
  `AutoNumber_Id` char(32) DEFAULT NULL,
  `CountCycle` varchar(1024) DEFAULT NULL,
  `Count` int(11) DEFAULT NULL,
  `Remark` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`NumberCount_Id`),
  KEY `FK_UASP_NumberCount_Ref_AutoNumber` (`AutoNumber_Id`),
  CONSTRAINT `FK_UASP_NumberCount_Ref_AutoNumber` FOREIGN KEY (`AutoNumber_Id`) REFERENCES `uasp_autonumbers` (`AutoNumber_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_numbercount
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_positions
-- ----------------------------
DROP TABLE IF EXISTS `uasp_positions`;
CREATE TABLE `uasp_positions` (
  `Position_Id` char(32) NOT NULL,
  `Department_Id` char(32) DEFAULT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `Code` varchar(32) DEFAULT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Level` int(11) DEFAULT NULL COMMENT '0-9 等级由高至低. 如：0 经理级别, 1 主管级别. 可由业务需要定义.',
  `Description` varchar(4096) DEFAULT NULL,
  `Serial` int(11) NOT NULL DEFAULT '0',
  `Status` smallint(6) NOT NULL DEFAULT '0',
  `UpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`Position_Id`),
  KEY `FK_UASP_Position_Ref_Department` (`Department_Id`),
  KEY `FK_UASP_Position_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_Position_Ref_Department` FOREIGN KEY (`Department_Id`) REFERENCES `uasp_departments` (`Department_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_Position_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_positions
-- ----------------------------
INSERT INTO `uasp_positions` VALUES ('38E1E6CCFD4F4E39B9732D7D7AF50029', '9286D03B22144F7FBBDDDC97FAA9F120', 'DB9611E', 'BMJL', '部门经理', '1', '', '0', '1', '2016-06-21 10:47:38');
INSERT INTO `uasp_positions` VALUES ('8E29010D7BCC4A538536C21913282263', '354F28F6EEE745C89F8D428D3D1227B9', 'DB9611E', 'HR', '人事经理', '1', '', '0', '1', '2016-06-21 14:34:00');

-- ----------------------------
-- Table structure for uasp_profiles
-- ----------------------------
DROP TABLE IF EXISTS `uasp_profiles`;
CREATE TABLE `uasp_profiles` (
  `Profile_Id` char(32) NOT NULL,
  `User_Id` char(32) NOT NULL,
  `Category` varchar(2048) NOT NULL,
  `ObjectType` varchar(2048) NOT NULL,
  `ValueType` varchar(2048) NOT NULL COMMENT 'xml, json',
  `Content` text NOT NULL,
  PRIMARY KEY (`Profile_Id`),
  KEY `FK_UASP_Profiles_Ref_User` (`User_Id`),
  CONSTRAINT `FK_UASP_Profiles_Ref_User` FOREIGN KEY (`User_Id`) REFERENCES `uasp_users` (`User_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_profiles
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_recyclenumbers
-- ----------------------------
DROP TABLE IF EXISTS `uasp_recyclenumbers`;
CREATE TABLE `uasp_recyclenumbers` (
  `RecycleNumber_Id` char(32) NOT NULL,
  `NumberCount_Id` char(32) NOT NULL,
  `RecycleNo` varchar(1024) NOT NULL,
  PRIMARY KEY (`RecycleNumber_Id`),
  KEY `FK_UASP_RecycleNumber_Ref_NumberCount` (`NumberCount_Id`),
  CONSTRAINT `FK_UASP_RecycleNumber_Ref_NumberCount` FOREIGN KEY (`NumberCount_Id`) REFERENCES `uasp_numbercount` (`NumberCount_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_recyclenumbers
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_rolemodules
-- ----------------------------
DROP TABLE IF EXISTS `uasp_rolemodules`;
CREATE TABLE `uasp_rolemodules` (
  `Role_Id` char(32) NOT NULL,
  `Module_Id` char(32) NOT NULL,
  `Actions` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`Role_Id`,`Module_Id`),
  KEY `FK_UASP_RoleModule_Ref_Module` (`Module_Id`),
  CONSTRAINT `FK_UASP_RoleModel_Ref_Role` FOREIGN KEY (`Role_Id`) REFERENCES `uasp_roles` (`Role_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_RoleModule_Ref_Module` FOREIGN KEY (`Module_Id`) REFERENCES `uasp_modules` (`Module_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_rolemodules
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_roles
-- ----------------------------
DROP TABLE IF EXISTS `uasp_roles`;
CREATE TABLE `uasp_roles` (
  `Role_Id` char(32) NOT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `Name` varchar(64) NOT NULL,
  `Type` varchar(8) DEFAULT NULL,
  `Enabled` bit(1) NOT NULL COMMENT '0 禁用；1 启用；',
  PRIMARY KEY (`Role_Id`),
  KEY `FK_UASP_Role_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_Role_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_roles
-- ----------------------------
INSERT INTO `uasp_roles` VALUES ('146F28C1E9154417B47C59293C839A64', 'DB9611E', '工作流管理员', 'W', '');
INSERT INTO `uasp_roles` VALUES ('5870A5B5DF7C11E58D5F00163E003262', 'DB9611E', '系统管理员', null, '\0');
INSERT INTO `uasp_roles` VALUES ('A609DFE549684958B760C34CAB4FA923', 'DB9611E', '所有员工', 'W', '');

-- ----------------------------
-- Table structure for uasp_settings
-- ----------------------------
DROP TABLE IF EXISTS `uasp_settings`;
CREATE TABLE `uasp_settings` (
  `Registry_Id` char(32) NOT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `Path` varchar(4096) NOT NULL,
  `ItemKey` varchar(64) NOT NULL,
  `ItemValue` text,
  PRIMARY KEY (`Registry_Id`),
  KEY `FK_UASP_Settings_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_Settings_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_settings
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_subapps
-- ----------------------------
DROP TABLE IF EXISTS `uasp_subapps`;
CREATE TABLE `uasp_subapps` (
  `SubApp_Id` char(32) NOT NULL,
  `Code` varchar(32) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Enabled` smallint(6) NOT NULL COMMENT '0 禁用；1 启动',
  PRIMARY KEY (`SubApp_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_subapps
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_tablemeta
-- ----------------------------
DROP TABLE IF EXISTS `uasp_tablemeta`;
CREATE TABLE `uasp_tablemeta` (
  `Meta_Id` int(11) NOT NULL AUTO_INCREMENT,
  `TableName` varchar(1024) NOT NULL,
  `TableKey` varchar(64) NOT NULL,
  `MetaKey` varchar(64) NOT NULL,
  `MetaValue` text,
  PRIMARY KEY (`Meta_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_tablemeta
-- ----------------------------

-- ----------------------------
-- Table structure for uasp_tenants
-- ----------------------------
DROP TABLE IF EXISTS `uasp_tenants`;
CREATE TABLE `uasp_tenants` (
  `Tenant_Id` varchar(32) NOT NULL COMMENT '编号',
  `DisplayName` varchar(256) NOT NULL,
  `Company` varchar(256) DEFAULT NULL,
  `Telephone` varchar(128) DEFAULT NULL,
  `ActiveTime` datetime NOT NULL,
  `ExpireTime` datetime DEFAULT NULL,
  `Enabled` smallint(6) NOT NULL COMMENT '0 启用；1 禁用；',
  PRIMARY KEY (`Tenant_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_tenants
-- ----------------------------
INSERT INTO `uasp_tenants` VALUES ('DB9611E', '开发测试租户', null, null, '2016-03-01 09:33:16', null, '1');

-- ----------------------------
-- Table structure for uasp_userroles
-- ----------------------------
DROP TABLE IF EXISTS `uasp_userroles`;
CREATE TABLE `uasp_userroles` (
  `Role_Id` char(32) NOT NULL,
  `User_Id` char(32) NOT NULL,
  `Identity_Id` char(32) DEFAULT '',
  PRIMARY KEY (`Role_Id`,`User_Id`),
  KEY `FK_UASP_UserRole_Ref_User` (`User_Id`),
  KEY `FK_UASP_UserRole_Ref_Identity` (`Identity_Id`),
  CONSTRAINT `FK_UASP_UserRole_Ref_Identity` FOREIGN KEY (`Identity_Id`) REFERENCES `uasp_identities` (`Identity_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_UserRole_Ref_Role` FOREIGN KEY (`Role_Id`) REFERENCES `uasp_roles` (`Role_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_UserRole_Ref_User` FOREIGN KEY (`User_Id`) REFERENCES `uasp_users` (`User_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_userroles
-- ----------------------------
INSERT INTO `uasp_userroles` VALUES ('5870A5B5DF7C11E58D5F00163E003262', 'ED5591AB52CC489F8A52445CF6125CD8', null);
INSERT INTO `uasp_userroles` VALUES ('A609DFE549684958B760C34CAB4FA923', '53C1D06102904C4482BD613EC7E49D0F', null);
INSERT INTO `uasp_userroles` VALUES ('A609DFE549684958B760C34CAB4FA923', '630D9C4BE8A74C49A7435A7333762EA6', 'EC3B6EEE375A11E6A5730021CCC9FA7E');

-- ----------------------------
-- Table structure for uasp_users
-- ----------------------------
DROP TABLE IF EXISTS `uasp_users`;
CREATE TABLE `uasp_users` (
  `User_Id` char(32) NOT NULL,
  `Tenant_Id` varchar(32) DEFAULT NULL COMMENT '编号',
  `UserName` varchar(64) NOT NULL,
  `DisplayName` varchar(64) NOT NULL,
  `Salt` varchar(32) DEFAULT NULL,
  `Password` varchar(256) NOT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `MobileNo` varchar(32) DEFAULT NULL,
  `Keyword` varchar(2048) DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `ExpireTime` datetime DEFAULT NULL COMMENT 'NULL 表时不过期.',
  `Roles` varchar(128) NOT NULL COMMENT 'USER 员工；ADMIN 业务管理员；ROOT 根管理员；',
  `IsEnabled` bit(1) NOT NULL,
  `IsLocked` bit(1) NOT NULL,
  `Employee_Id` char(32) DEFAULT NULL,
  PRIMARY KEY (`User_Id`),
  KEY `FK_UASP_User_Ref_Employee` (`Employee_Id`),
  KEY `FK_UASP_User_Ref_Tenant` (`Tenant_Id`),
  CONSTRAINT `FK_UASP_User_Ref_Employee` FOREIGN KEY (`Employee_Id`) REFERENCES `uasp_employees` (`Employee_Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UASP_User_Ref_Tenant` FOREIGN KEY (`Tenant_Id`) REFERENCES `uasp_tenants` (`Tenant_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uasp_users
-- ----------------------------
INSERT INTO `uasp_users` VALUES ('18C5BD7D457647ECB3F688D4ECF1C0C8', 'DB9611E', 'user1', '开发租户1', 'Zi51tN1IIjMslOaf5IAl5A==', '0f0c533e26b7d5183c6ab8f88619d0c9fca109312b226d1acfa0548dc7c5a289', 'user1@kayura.org', '13912345678', '', '2016-03-01 09:36:14', null, 'USER', '', '\0', null);
INSERT INTO `uasp_users` VALUES ('53C1D06102904C4482BD613EC7E49D0F', 'DB9611E', 'kermit', 'Kermit Miao', 'UrXeUvaTTupYYnwHAKiQkg==', '0b680c8caf741d9c22c746177f5eedb62230023f0a66f1826828a6db5d602f67', 'kermit@kayura.org', '13500000003', 'kermit', '2016-06-01 14:19:46', null, 'USER', '', '\0', null);
INSERT INTO `uasp_users` VALUES ('54CB0067DBF84545B5B6BA3BD289EF05', 'DB9611E', 'andy', 'Andy Zhao', 'J2E2Bepkgd7Gj3TfF+jZ0g==', 'bf0e38da5db4207effe5136fce43ddfb4ceeb847a947b471388f29e0171b9bc3', 'andy@kayura.org', '13500000005', 'andy', '2016-06-01 14:21:00', null, 'USER', '', '\0', null);
INSERT INTO `uasp_users` VALUES ('630D9C4BE8A74C49A7435A7333762EA6', 'DB9611E', 'bill', 'Bill Zheng', 'MfHP6qhrZ73sGE+RWG+/Fw==', '7682a33089c457150185b9d9f987fc67360a816655ff6f9b81c26d6dc92e6428', 'bill@kayura.org', '13500000006', 'bill', '2016-06-01 14:22:02', null, 'USER', '', '\0', null);
INSERT INTO `uasp_users` VALUES ('65DB25265852471D98C417FB01750137', 'DB9611E', 'eric', 'Eric Li', 'wFNw33q2B10avt1eBkTl7A==', '3ba97fcf7cdc031c0fb3f5280914419e0cdc26a48b0a5ee4f7e66e52475e09fd', 'eric@kayura.org', '13500000001', 'eric', '2016-06-01 14:18:31', null, 'USER', '', '\0', null);
INSERT INTO `uasp_users` VALUES ('6A29770F05C04C87B471A382607D3099', 'DB9611E', 'henry', 'Henry Yan', 'f6YZXb37KTCXWsxYdv8hdQ==', '35e104b6029e999573bae2a76a397867d3a0cd352e55cf9cbb529bbd08556936', 'henry@kayura.org', '13500000008', 'henry', '2016-06-01 14:23:22', null, 'USER', '', '\0', null);
INSERT INTO `uasp_users` VALUES ('8B317331BD2543CD9A255DBAB7C2AC2A', 'DB9611E', 'jenny', 'Jenny Luo', '5CawKz9jys+jC8yQO28Yhw==', 'd9c5ea102d0dc253aa3efc257262c9cfb90d8207300f1ae5b78b56caf700ddf2', 'jenny@kayura.org', '13500000007', '', '2016-06-01 14:22:27', null, 'USER', '', '\0', null);
INSERT INTO `uasp_users` VALUES ('9F88694FB54B4E6D81072718198BC1FC', 'DB9611E', 'tom', 'Tom Wang', 'uVIFIsPBl+qmwjbZzMkBlA==', '1b71a06acf8bbd974733e6394acc6ec3e95e60ef90308b8aa579a059cf5b5fe2', 'tom@kayura.org', '13500000002', 'tom', '2016-06-01 14:19:14', null, 'USER', '', '\0', null);
INSERT INTO `uasp_users` VALUES ('BD817FA7716E11E586C6D8CB8A43F8DD', null, 'root', '根管理员', 'DI9JGSpp2M8gQ/tDVUQBuQ==', '18529aa9bc0764394e88e1ceb0c153e6ff621d18f377eb977e299bb66dbab5b0', 'root@kayura.org', '13556090295', 'root', '2015-10-13 13:54:32', null, 'ROOT', '', '\0', null);
INSERT INTO `uasp_users` VALUES ('D8B257DEE38642C18F911D5BF24401F3', 'DB9611E', 'amy', 'Amy Zhang', '+FQUv9GZLLTTavbvNKaXkg==', 'f36c40fd7c299932b8b3bb3469afeeb1e02fa97c42dad3419cf54bbcccbe49b9', 'amy@kayura.org', '13500000004', 'amy', '2016-06-01 14:20:26', null, 'USER', '', '\0', null);
INSERT INTO `uasp_users` VALUES ('ED5591AB52CC489F8A52445CF6125CD8', 'DB9611E', 'admin', '系统管理员', 'Xwlr0vzshaiErUAisk608Q==', '864b2551ec36a375bcd095a9bb18897d71a7a5e52e76c8947f43c0984ab666dc', 'admin@kayura.org', '13712345678', '', '2016-03-01 09:35:45', null, 'ADMIN', '', '\0', null);

-- ----------------------------
-- Table structure for usap_dictdefine
-- ----------------------------
DROP TABLE IF EXISTS `usap_dictdefine`;
CREATE TABLE `usap_dictdefine` (
  `Dict_Id` char(32) NOT NULL,
  `Code` varchar(32) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Catetory` varchar(64) DEFAULT NULL,
  `DataType` smallint(6) NOT NULL DEFAULT '0' COMMENT '0 列表；1 树型；',
  `Description` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`Dict_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usap_dictdefine
-- ----------------------------
INSERT INTO `usap_dictdefine` VALUES ('2A8DDB30D5EF11E58D5F00163E003262', 'Tndustry', '企业类型', '业务', '0', null);
INSERT INTO `usap_dictdefine` VALUES ('745F9DDCD94411E5943F10BF48BBBEC9', 'Province', '省份', '地域', '0', null);
INSERT INTO `usap_dictdefine` VALUES ('DBF4DC05D94411E5943F10BF48BBBEC9', 'Country', '国家', '地域', '0', null);

-- ----------------------------
-- View structure for act_id_group
-- ----------------------------
DROP VIEW IF EXISTS `act_id_group`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `act_id_group` AS select `d`.`Department_Id` AS `ID_`,1 AS `REV_`,concat(`d`.`Name`,'（',`c`.`ShortName`,'）') AS `NAME_`,'D' AS `TYPE_` from (`uasp_companies` `c` join `uasp_departments` `d` on((`d`.`Company_Id` = `c`.`Company_Id`))) union all select `p`.`Position_Id` AS `ID_`,1 AS `REV_`,concat(`p`.`Name`,'（',`c`.`ShortName`,'.',`d`.`Name`,'）') AS `NAME_`,'P' AS `TYPE_` from ((`uasp_companies` `c` join `uasp_departments` `d` on((`d`.`Company_Id` = `c`.`Company_Id`))) join `uasp_positions` `p` on((`p`.`Department_Id` = `d`.`Department_Id`))) union all select `r`.`Role_Id` AS `ID_`,1 AS `REV_`,`r`.`Name` AS `NAME_`,'R' AS `TYPE_` from `uasp_roles` `r` where (`r`.`Type` = 'W') union all select `g`.`Group_Id` AS `ID_`,1 AS `REV_`,`g`.`Name` AS `NAME_`,'G' AS `TYPE_` from `uasp_groups` `g` ;

-- ----------------------------
-- View structure for act_id_membership
-- ----------------------------
DROP VIEW IF EXISTS `act_id_membership`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `act_id_membership` AS select distinct `id`.`Identity_Id` AS `USER_ID_`,`id`.`Department_Id` AS `GROUP_ID_` from `uasp_identities` `id` union all select `ip`.`Identity_Id` AS `USER_ID_`,`ip`.`Position_Id` AS `GROUP_ID_` from `uasp_identities` `ip` where (`ip`.`Position_Id` is not null) union all select `ur`.`Identity_Id` AS `Identity_Id`,`ur`.`Role_Id` AS `Role_Id` from (`uasp_userroles` `ur` join `uasp_roles` `r` on((`ur`.`Role_Id` = `r`.`Role_Id`))) where ((`ur`.`Identity_Id` is not null) and ((`r`.`Type` = 'W') or `r`.`Role_Id` in (select `gr`.`Role_Id` from `uasp_grouproles` `gr`))) union all select `i`.`Identity_Id` AS `Identity_Id`,`ur`.`Role_Id` AS `Role_Id` from (((`uasp_userroles` `ur` join `uasp_employees` `e` on((`e`.`User_Id` = `ur`.`User_Id`))) join `uasp_identities` `i` on((`i`.`Employee_Id` = `e`.`Employee_Id`))) join `uasp_roles` `r` on((`ur`.`Role_Id` = `r`.`Role_Id`))) where (isnull(`ur`.`Identity_Id`) and ((`r`.`Type` = 'W') or `r`.`Role_Id` in (select `gr`.`Role_Id` from `uasp_grouproles` `gr`))) union all select `gu`.`Identity_Id` AS `Identity_Id`,`gu`.`Group_Id` AS `Group_Id` from `uasp_groupusers` `gu` where (`gu`.`Identity_Id` is not null) union all select `i`.`Identity_Id` AS `Identity_Id`,`gu`.`Group_Id` AS `Group_Id` from ((`uasp_groupusers` `gu` join `uasp_employees` `e` on((`e`.`User_Id` = `gu`.`User_Id`))) join `uasp_identities` `i` on((`i`.`Employee_Id` = `e`.`Employee_Id`))) where isnull(`gu`.`Identity_Id`) ;

-- ----------------------------
-- View structure for act_id_user
-- ----------------------------
DROP VIEW IF EXISTS `act_id_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `act_id_user` AS select `i`.`Identity_Id` AS `ID_`,1 AS `REV_`,concat(`d`.`Name`,'.',`p`.`Name`) AS `FIRST_`,`e`.`Name` AS `LAST_`,`e`.`Email` AS `EMAIL_`,NULL AS `PWD_`,NULL AS `PICTURE_ID_` from (((`uasp_identities` `i` join `uasp_employees` `e` on((`i`.`Employee_Id` = `e`.`Employee_Id`))) join `uasp_positions` `p` on((`i`.`Position_Id` = `p`.`Position_Id`))) join `uasp_departments` `d` on((`i`.`Department_Id` = `d`.`Department_Id`))) ;
