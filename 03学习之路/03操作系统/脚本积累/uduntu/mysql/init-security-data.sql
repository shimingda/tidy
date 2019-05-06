use uface;

INSERT INTO `uface`.`t_permission` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                                    `updated_by`, `updated_time`, `code`, `is_root_permission`, `name`, `tag`,
                                    `tag_code`)
VALUES ('8514430354587648', 'SYSTEM', '2019-01-26 14:42:49', NULL, '0', NULL, '0', NULL, NULL, 'alert.all', '0', '告警管理',
        '告警模块', 'alert');
INSERT INTO `uface`.`t_permission` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                                    `updated_by`, `updated_time`, `code`, `is_root_permission`, `name`, `tag`,
                                    `tag_code`)
VALUES ('8514430417502208', 'SYSTEM', '2019-01-26 14:42:52', NULL, '0', NULL, '0', NULL, NULL, 'stat.all', '0', '报表统计',
        '报表统计', 'stat');
INSERT INTO `uface`.`t_permission` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                                    `updated_by`, `updated_time`, `code`, `is_root_permission`, `name`, `tag`,
                                    `tag_code`)
VALUES ('8514430417502209', 'SYSTEM', '2019-01-26 14:42:55', NULL, '0', NULL, '0', NULL, NULL, 'advanced.all', '0',
        '高级业务', '高级业务', 'advanced');
INSERT INTO `uface`.`t_permission` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                                    `updated_by`, `updated_time`, `code`, `is_root_permission`, `name`, `tag`,
                                    `tag_code`)
VALUES ('8514430421696512', 'SYSTEM', '2019-01-26 14:42:57', NULL, '0', NULL, '0', NULL, NULL, 'setting.all', '1',
        '系统设置', '系统设置', 'setting');
INSERT INTO `uface`.`t_permission` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                                    `updated_by`, `updated_time`, `code`, `is_root_permission`, `name`, `tag`,
                                    `tag_code`)
VALUES ('8514430421696513', 'SYSTEM', '2019-01-26 14:43:00', NULL, '0', NULL, '0', NULL, NULL, 'visitor.all', '0',
        '访客管理', '访客管理模块', 'visitor');
INSERT INTO `uface`.`t_permission` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                                    `updated_by`, `updated_time`, `code`, `is_root_permission`, `name`, `tag`,
                                    `tag_code`)
VALUES ('8514430421696515', 'SYSTEM', '2019-01-26 14:43:02', NULL, '0', NULL, '0', NULL, NULL, 'person.all', '0',
        '人员管理', '人员管理模块', 'person');
INSERT INTO `uface`.`t_permission` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                                    `updated_by`, `updated_time`, `code`, `is_root_permission`, `name`, `tag`,
                                    `tag_code`)
VALUES ('8514430421696516', 'SYSTEM', '2019-01-26 14:43:04', NULL, '0', NULL, '0', NULL, NULL, 'attend.all', '0',
        '考勤管理', '考勤模块', 'attend');
INSERT INTO `uface`.`t_permission` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                                    `updated_by`, `updated_time`, `code`, `is_root_permission`, `name`, `tag`,
                                    `tag_code`)
VALUES ('8514430421696517', 'SYSTEM', '2019-01-26 14:43:06', NULL, '0', NULL, '0', NULL, NULL, 'device.all', '0',
        '设备管理', '设备管理模块', 'device');
INSERT INTO `uface`.`t_permission` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                                    `updated_by`, `updated_time`, `code`, `is_root_permission`, `name`, `tag`,
                                    `tag_code`)
VALUES ('8514430425890817', 'SYSTEM', '2019-01-26 14:43:09', NULL, '0', NULL, '0', NULL, NULL, 'access.all', '0',
        '通行权限管理', '通行管理模块', 'access');
INSERT INTO `uface`.`t_permission` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                                    `updated_by`, `updated_time`, `code`, `is_root_permission`, `name`, `tag`,
                                    `tag_code`)
VALUES ('8514430425890819', 'SYSTEM', '2019-01-26 14:43:15', NULL, '0', NULL, '0', NULL, NULL, 'security.all', '1',
        '权限管理', '权限管理模块', 'security');

INSERT INTO `uface`.`t_user` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                              `updated_by`, `updated_time`, `expire_at`, `is_system_admin`, `last_login_time`,
                              `password`, `real_name`, `status`, `telephone`, `username`, `tenant_id`)
VALUES ('8514434980904960', 'root', '2019-01-25 17:25:14', '-1', '0', '随系统初始化', '1291', 'root', '2019-01-25 17:25:14',
        '3000-12-12 00:00:00', '1', '2019-01-29 17:12:51',
        '$2a$10$b73tgvPI9KwH8zahSc0EQecywyKoPcKQuYjeYwm1qkL2QGV5kpOdW', 'root管理员', '1', '', 'root', NULL);

INSERT INTO `uface`.`t_client` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                                `updated_by`, `updated_time`, `client_key`, `client_secret`, `name`,
                                `raw_client_secret`, `status`, `tenant_id`)
VALUES ('8514436461494272', NULL, '2018-12-11 11:53:20', '-1', '0', 'default web client', '0', NULL,
        '2018-12-11 11:53:20', 'webapp', '$2a$10$NtYHC9EbfE55OzVTuK4Y5.NcH0ZLoYz0QcoTchaqUsWOTvZiuAoqG', '系统默认web客户端',
        'AG4D13eCCVuRzm9v', '1', NULL);
INSERT INTO `uface`.`t_role` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                              `updated_by`, `updated_time`, `code`, `is_system_role`, `name`)
VALUES ('8514431814205440', NULL, '2018-12-11 11:53:19', '-1', '0', NULL, '0', NULL, '2018-12-11 11:53:19',
        'system-admin', '1', '系统高级管理员');
INSERT INTO `uface`.`t_role` (`id`, `created_by`, `create_time`, `tid`, `delete_flag`, `remark`, `reversion`,
                              `updated_by`, `updated_time`, `code`, `is_system_role`, `name`)
VALUES ('8514433131216896', NULL, '2018-12-11 11:53:19', '-1', '0', NULL, '0', NULL, '2018-12-11 11:53:19',
        'user-admin', '0', '管理员');
INSERT INTO `uface`.`r_user_role` (`user_id`, `role_id`)
VALUES ('8514434980904960', '8514431814205440');
INSERT INTO `uface`.`r_role_permission` (`role_id`, `permission_id`)
VALUES ('8514431814205440', '8514430354587648');
INSERT INTO `uface`.`r_role_permission` (`role_id`, `permission_id`)
VALUES ('8514431814205440', '8514430417502208');
INSERT INTO `uface`.`r_role_permission` (`role_id`, `permission_id`)
VALUES ('8514431814205440', '8514430417502209');
INSERT INTO `uface`.`r_role_permission` (`role_id`, `permission_id`)
VALUES ('8514431814205440', '8514430421696512');
INSERT INTO `uface`.`r_role_permission` (`role_id`, `permission_id`)
VALUES ('8514431814205440', '8514430421696513');
INSERT INTO `uface`.`r_role_permission` (`role_id`, `permission_id`)
VALUES ('8514431814205440', '8514430421696515');
INSERT INTO `uface`.`r_role_permission` (`role_id`, `permission_id`)
VALUES ('8514431814205440', '8514430421696516');
INSERT INTO `uface`.`r_role_permission` (`role_id`, `permission_id`)
VALUES ('8514431814205440', '8514430421696517');
INSERT INTO `uface`.`r_role_permission` (`role_id`, `permission_id`)
VALUES ('8514431814205440', '8514430425890817');
INSERT INTO `uface`.`r_role_permission` (`role_id`, `permission_id`)
VALUES ('8514431814205440', '8514430425890819');
