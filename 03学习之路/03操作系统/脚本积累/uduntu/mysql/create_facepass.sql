create database if not exists uface default charset utf8 collate utf8_general_ci;
use uface;

CREATE TABLE IF NOT EXISTS `t_group` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `tree_path` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `label_color` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK88qmidsb5g8tald57xwujfeiq` (`parent_id`),
  CONSTRAINT `FK88qmidsb5g8tald57xwujfeiq` FOREIGN KEY (`parent_id`) REFERENCES `t_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_person` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `access_card` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `card_type` int(11) DEFAULT NULL,
  `expire_at` datetime DEFAULT NULL,
  `ext_info` varchar(255) DEFAULT NULL,
  `face_url` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKarco9wdgl9jyqs25n19mwfgq3` (`group_id`),
  CONSTRAINT `FKarco9wdgl9jyqs25n19mwfgq3` FOREIGN KEY (`group_id`) REFERENCES `t_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_generic_person_info` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKm4mnqwalg7v3v0sict2v0b9` FOREIGN KEY (`id`) REFERENCES `t_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_access_time_rule` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `day_of_month` varchar(255) DEFAULT NULL,
  `day_of_week` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `repeat_strategy` int(11) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_access_permission_group` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `rule_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk1cfeqscww0d3b4bnd9bahihr` (`rule_id`),
  CONSTRAINT `FKk1cfeqscww0d3b4bnd9bahihr` FOREIGN KEY (`rule_id`) REFERENCES `t_access_time_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `r_access_permission_group` (
  `person_id` bigint(20) NOT NULL,
  `permission_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`person_id`,`permission_group_id`),
  KEY `FK5yhfsa3qirsqjacan6a5231fp` (`permission_group_id`),
  CONSTRAINT `FK5yhfsa3qirsqjacan6a5231fp` FOREIGN KEY (`permission_group_id`) REFERENCES `t_access_permission_group` (`id`),
  CONSTRAINT `FKdux185ys08ogwihfax31axj0u` FOREIGN KEY (`person_id`) REFERENCES `t_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_faceset` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `user_data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_face` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `algorithm_version` varchar(255) DEFAULT NULL,
  `algorithm_version2` varchar(255) DEFAULT NULL,
  `face_image` varchar(255) DEFAULT NULL,
  `feature_data` longblob,
  `feature_data2` longblob,
  `quality` float DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `user_data` varchar(255) DEFAULT NULL,
  `faceset_id` bigint(20) DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKosig1fgqisvwe41vmkvsim3bl` (`faceset_id`),
  KEY `FKmkmhabxaq6qpm917irws2y4qa` (`person_id`),
  CONSTRAINT `FKmkmhabxaq6qpm917irws2y4qa` FOREIGN KEY (`person_id`) REFERENCES `t_person` (`id`),
  CONSTRAINT `FKosig1fgqisvwe41vmkvsim3bl` FOREIGN KEY (`faceset_id`) REFERENCES `t_faceset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_map` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `bound_x` int(11) DEFAULT NULL,
  `bound_y` int(11) DEFAULT NULL,
  `crs` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `service_url` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_area` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `tree_path` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `map_id` bigint(20) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbp0qlgl6br712bouspu806brq` (`parent_id`),
  KEY `FKsw8gny6px67k8if8evpnjm6o8` (`map_id`),
  CONSTRAINT `FKbp0qlgl6br712bouspu806brq` FOREIGN KEY (`parent_id`) REFERENCES `t_area` (`id`),
  CONSTRAINT `FKsw8gny6px67k8if8evpnjm6o8` FOREIGN KEY (`map_id`) REFERENCES `t_map` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_device` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `access_type` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `hardware_version` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `last_maintenance_time` datetime DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `software_version` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8gayqolbvchj3vvxg6aiwlhv3` (`area_id`),
  CONSTRAINT `FK8gayqolbvchj3vvxg6aiwlhv3` FOREIGN KEY (`area_id`) REFERENCES `t_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_camera_device` (
  `anti_dups_intervals` int(11) DEFAULT NULL,
  `anti_dups_threshold` float DEFAULT NULL,
  `enable_anti_dups` int(11) DEFAULT NULL,
  `save_scene` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKjbn20q06020gjqwnfugo2vups` FOREIGN KEY (`id`) REFERENCES `t_device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_camera_sdk_config` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `http_port` int(11) DEFAULT NULL,
  `sdk_driver` varchar(255) DEFAULT NULL,
  `sdk_password` varchar(255) DEFAULT NULL,
  `sdk_port` int(11) DEFAULT NULL,
  `sdk_username` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1jovyuynlh4tbmmlon31uav65` (`device_id`),
  CONSTRAINT `FK1jovyuynlh4tbmmlon31uav65` FOREIGN KEY (`device_id`) REFERENCES `t_camera_device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_camera_stream_config` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `max_face_pixel` int(11) DEFAULT NULL,
  `min_face_pixel` int(11) DEFAULT NULL,
  `rotate` int(11) DEFAULT NULL,
  `rtsp1` varchar(255) DEFAULT NULL,
  `rtsp2` varchar(255) DEFAULT NULL,
  `skip_frame` smallint(6) DEFAULT NULL,
  `transfer_protocol` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe6laxmuj4ixaiilc2t621nd8a` (`device_id`),
  CONSTRAINT `FKe6laxmuj4ixaiilc2t621nd8a` FOREIGN KEY (`device_id`) REFERENCES `t_camera_device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_device_group` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_access_control_device` (
  `authorization_key` varchar(255) DEFAULT NULL,
  `grant_lic` longblob,
  `grant_status` int(11) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKm9n28nl14jji21eo0rf4l7rf7` FOREIGN KEY (`id`) REFERENCES `t_device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_device_alert` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `device_code` varchar(255) DEFAULT NULL,
  `device_ip` varchar(255) DEFAULT NULL,
  `device_model` varchar(255) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_status` int(11) DEFAULT NULL,
  `device_type` int(11) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_device_alert_dispose` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `device_alert_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpikeic2rll2gk46spvhlt1o26` (`device_alert_id`),
  CONSTRAINT `FKpikeic2rll2gk46spvhlt1o26` FOREIGN KEY (`device_alert_id`) REFERENCES `t_device_alert` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_access_record` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `access_card` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `capture_id` bigint(20) DEFAULT NULL,
  `capture_time` datetime DEFAULT NULL,
  `card_type` int(11) DEFAULT NULL,
  `device_code` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_type` int(11) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `face_image` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `hit_face_id` bigint(20) DEFAULT NULL,
  `hit_face_image` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `label_color` varchar(255) DEFAULT NULL,
  `person_gender` int(11) DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  `person_name` varchar(255) DEFAULT NULL,
  `person_type` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `verify_result` int(11) DEFAULT NULL,
  `verify_type` int(11) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `map_crs` varchar(255) DEFAULT NULL,
  `map_type` int(11) DEFAULT NULL,
  `map_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `r_device_permission_group` (
  `group_id` bigint(20) NOT NULL,
  `device_id` bigint(20) NOT NULL,
  KEY `FKdo1lsirgbell394y3ml4e4crd` (`device_id`),
  KEY `FKtl0ov2k13ssa6s1tj7wb6a2i` (`group_id`),
  CONSTRAINT `FKdo1lsirgbell394y3ml4e4crd` FOREIGN KEY (`device_id`) REFERENCES `t_device` (`id`),
  CONSTRAINT `FKtl0ov2k13ssa6s1tj7wb6a2i` FOREIGN KEY (`group_id`) REFERENCES `t_access_permission_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_surveillance` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `alert_level` int(11) DEFAULT NULL,
  `alert_sound` varchar(255) DEFAULT NULL,
  `alert_type` int(11) DEFAULT NULL,
  `enable_alarm` int(11) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `popup_style` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `threshold` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `r_surveillance_device` (
  `surveillance_id` bigint(20) NOT NULL,
  `device_id` bigint(20) NOT NULL,
  KEY `FKtnn8a7wgj0qhpy895vqv3dv5t` (`device_id`),
  KEY `FKpl0qn941ukdmtbe4y9bwihuij` (`surveillance_id`),
  CONSTRAINT `FKpl0qn941ukdmtbe4y9bwihuij` FOREIGN KEY (`surveillance_id`) REFERENCES `t_surveillance` (`id`),
  CONSTRAINT `FKtnn8a7wgj0qhpy895vqv3dv5t` FOREIGN KEY (`device_id`) REFERENCES `t_device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_surveillance_alert` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `access_card` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `body_image` varchar(255) DEFAULT NULL,
  `capture_id` bigint(20) DEFAULT NULL,
  `capture_time` datetime DEFAULT NULL,
  `device_code` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_type` int(11) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `face_image` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `hit_face_id` bigint(20) DEFAULT NULL,
  `hit_face_image` varchar(255) DEFAULT NULL,
  `label_color` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `person_age` int(11) DEFAULT NULL,
  `person_gender` int(11) DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  `person_name` varchar(255) DEFAULT NULL,
  `person_type` int(11) DEFAULT NULL,
  `scene_image` varchar(255) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `surveillance_id` bigint(20) DEFAULT NULL,
  `surveillance_name` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `verify_result` int(11) DEFAULT NULL,
  `verify_type` int(11) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_surveillance_group` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `surveillance_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcurg4av943vletxrqs4gq4533` (`surveillance_id`),
  CONSTRAINT `FKcurg4av943vletxrqs4gq4533` FOREIGN KEY (`surveillance_id`) REFERENCES `t_surveillance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_surveillance_alert` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `access_card` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `alert_type` int(11) DEFAULT NULL,
  `body_image` varchar(255) DEFAULT NULL,
  `capture_id` bigint(20) DEFAULT NULL,
  `capture_time` datetime DEFAULT NULL,
  `device_code` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_type` int(11) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `face_image` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `hit_face_id` bigint(20) DEFAULT NULL,
  `hit_face_image` varchar(255) DEFAULT NULL,
  `label_color` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `person_age` int(11) DEFAULT NULL,
  `person_gender` int(11) DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  `person_name` varchar(255) DEFAULT NULL,
  `person_type` int(11) DEFAULT NULL,
  `scene_image` varchar(255) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `surveillance_id` bigint(20) DEFAULT NULL,
  `surveillance_name` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `verify_result` int(11) DEFAULT NULL,
  `verify_type` int(11) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `r_surveillance_group` (
  `surveillance_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`surveillance_id`,`group_id`),
  KEY `FK6hsqayqjjkqyi0rfqmxfe1wcy` (`group_id`),
  CONSTRAINT `FK6hsqayqjjkqyi0rfqmxfe1wcy` FOREIGN KEY (`group_id`) REFERENCES `t_group` (`id`),
  CONSTRAINT `FK8spwphvh1ecuefhxiaikm5bsi` FOREIGN KEY (`surveillance_id`) REFERENCES `t_surveillance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS  `r_surveillance_group_person` (
  `surveillance_group_id` bigint(20) NOT NULL,
  `person_id` bigint(20) NOT NULL,
  PRIMARY KEY (`surveillance_group_id`,`person_id`),
  KEY `FKfecvvu7dmjgusr0kwu1rojup4` (`person_id`),
  CONSTRAINT `FK5fpfk0rdk6jo17io4fwvkdb45` FOREIGN KEY (`surveillance_group_id`) REFERENCES `t_surveillance_group` (`id`),
  CONSTRAINT `FKfecvvu7dmjgusr0kwu1rojup4` FOREIGN KEY (`person_id`) REFERENCES `t_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_alert_config` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `cfg_key` varchar(255) DEFAULT NULL,
  `cfg_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_alert_dispose` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `alert_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6tjcbv5eoyhyn8lugjmlxjd5v` (`alert_id`),
  CONSTRAINT `FK6tjcbv5eoyhyn8lugjmlxjd5v` FOREIGN KEY (`alert_id`) REFERENCES `t_surveillance_alert` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_alert_sound` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `sound_name` varchar(255) DEFAULT NULL,
  `sound_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_match_record` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `body_image` varchar(255) DEFAULT NULL,
  `capture_id` bigint(20) DEFAULT NULL,
  `capture_time` datetime DEFAULT NULL,
  `device_code` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_type` int(11) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `face_image` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `hit_face_id` bigint(20) DEFAULT NULL,
  `hit_face_image` varchar(255) DEFAULT NULL,
  `label_color` varchar(255) DEFAULT NULL,
  `person_age` int(11) DEFAULT NULL,
  `person_gender` int(11) DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  `person_name` varchar(255) DEFAULT NULL,
  `person_type` int(11) DEFAULT NULL,
  `scene_image` varchar(255) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_mismatch_record` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `body_image` varchar(255) DEFAULT NULL,
  `capture_id` bigint(20) DEFAULT NULL,
  `capture_time` datetime DEFAULT NULL,
  `device_code` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_type` int(11) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `face_image` varchar(255) DEFAULT NULL,
  `scene_image` varchar(255) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_captured_face_record` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `algorithm_version` varchar(255) DEFAULT NULL,
  `body_image` varchar(255) DEFAULT NULL,
  `capture_time` datetime DEFAULT NULL,
  `device_code` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_type` int(11) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `face_image` varchar(255) DEFAULT NULL,
  `feature_data` longblob,
  `quality` varchar(255) DEFAULT NULL,
  `scene_image` varchar(255) DEFAULT NULL,
  `track_id` varchar(255) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_person_ext_field` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `data_type` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `ext_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `label_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_server` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `disk` varchar(255) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `memory` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_staff_info` (
  `department` varchar(255) DEFAULT NULL,
  `vehicle_plate` varchar(255) DEFAULT NULL,
  `vehicle_plate_color` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK31lbqfhjwkl66u0lotvxhvs05` FOREIGN KEY (`id`) REFERENCES `t_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_statistics_record` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `access_total` bigint(20) DEFAULT NULL,
  `alert_total` bigint(20) DEFAULT NULL,
  `captured_total` bigint(20) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `match_total` bigint(20) DEFAULT NULL,
  `mismatch_total` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_ui_config` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `system_cover` varchar(255) DEFAULT NULL,
  `system_title` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_verification_device` (
  `authorize_time` int(11) DEFAULT NULL,
  `enable_authorize` int(11) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK81rvb83qg94oibfy33doid48e` FOREIGN KEY (`id`) REFERENCES `t_device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_visitor_history` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `access_card` varchar(255) DEFAULT NULL,
  `access_time` datetime DEFAULT NULL,
  `card_type` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sign_in_face_image` varchar(255) DEFAULT NULL,
  `sign_in_source` varchar(255) DEFAULT NULL,
  `sign_in_time` datetime DEFAULT NULL,
  `sign_out_face_image` varchar(255) DEFAULT NULL,
  `sign_out_time` datetime DEFAULT NULL,
  `sign_out_type` int(11) DEFAULT NULL,
  `vehicle_plate` varchar(255) DEFAULT NULL,
  `vehicle_plate_color` varchar(255) DEFAULT NULL,
  `visitee_group_id` bigint(20) DEFAULT NULL,
  `visitee_group_name` varchar(255) DEFAULT NULL,
  `visitee_id` bigint(20) DEFAULT NULL,
  `visitee_name` varchar(255) DEFAULT NULL,
  `visitor_number` int(11) DEFAULT NULL,
  `feature_data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_visitor_info` (
  `access_time` datetime DEFAULT NULL,
  `sign_in_face_image` varchar(255) DEFAULT NULL,
  `sign_in_source` int(11) DEFAULT NULL,
  `vehicle_plate` varchar(255) DEFAULT NULL,
  `vehicle_plate_color` varchar(255) DEFAULT NULL,
  `visitor_number` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  `visit_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3jtwvfwg0522vscuytkb2bu1i` (`device_id`),
  KEY `FKp5tgto9x0t8s8tb33ldfuyy5t` (`person_id`),
  CONSTRAINT `FK3jtwvfwg0522vscuytkb2bu1i` FOREIGN KEY (`device_id`) REFERENCES `t_device` (`id`),
  CONSTRAINT `FKi0873cpoudeqi5t123tmj510o` FOREIGN KEY (`id`) REFERENCES `t_person` (`id`),
  CONSTRAINT `FKp5tgto9x0t8s8tb33ldfuyy5t` FOREIGN KEY (`person_id`) REFERENCES `t_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_config` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_dict` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `dict_key` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `dict_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_license_info` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_tenant` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `org_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_client` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `access_token_valid_seconds` int(11) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `client_key` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `raw_client_secret` varchar(255) DEFAULT NULL,
  `redirect_uris` varchar(255) DEFAULT NULL,
  `refresh_token_valid_second` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_byd72ib126jhnr6dlbr4x8v29` (`client_key`),
  KEY `FK88gwjik8ijivl2eu5qm3po90j` (`tenant_id`),
  CONSTRAINT `FK88gwjik8ijivl2eu5qm3po90j` FOREIGN KEY (`tenant_id`) REFERENCES `t_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_role` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_system_role` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_user` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `expire_at` datetime DEFAULT NULL,
  `is_system_admin` int(11) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jhib4legehrm4yscx9t3lirqi` (`username`),
  KEY `FKc211xe9tcw936j3wjr0yxdxjn` (`tenant_id`),
  CONSTRAINT `FKc211xe9tcw936j3wjr0yxdxjn` FOREIGN KEY (`tenant_id`) REFERENCES `t_tenant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `r_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKs9ddljdacwibvsi17sqb0197n` (`role_id`),
  CONSTRAINT `FKq0nki870twc0ew493uubiehkg` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKs9ddljdacwibvsi17sqb0197n` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_permission` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_root_permission` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `tag_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `r_user_permission` (
  `user_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `FKijbg11xt2ougu41t9ibu1wmum` (`permission_id`),
  CONSTRAINT `FKijbg11xt2ougu41t9ibu1wmum` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`),
  CONSTRAINT `FKmw10gaap81h4p7tqy8fr5qku7` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `r_client_permission` (
  `client_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`client_id`,`permission_id`),
  KEY `FKjgl6vc2hx8o569rjnuxujprw5` (`permission_id`),
  CONSTRAINT `FK6boxcg7echwxxc6wrokhlpbs5` FOREIGN KEY (`client_id`) REFERENCES `t_client` (`id`),
  CONSTRAINT `FKjgl6vc2hx8o569rjnuxujprw5` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `r_client_role` (
  `client_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`client_id`,`role_id`),
  KEY `FKp63fjxip8ojb9egdai2tl0q1u` (`role_id`),
  CONSTRAINT `FKes6dd87451aav0tocryy7dwm5` FOREIGN KEY (`client_id`) REFERENCES `t_client` (`id`),
  CONSTRAINT `FKp63fjxip8ojb9egdai2tl0q1u` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `r_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FKhs6f6sv6hr6ynj08p8lsly79` (`permission_id`),
  CONSTRAINT `FK7aewx1o1mkpkt5hs6sem30871` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FKhs6f6sv6hr6ynj08p8lsly79` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_generic_person_info` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKm4mnqwalg7v3v0sict2v0b9` FOREIGN KEY (`id`) REFERENCES `t_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_unfinished_task` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `tid` bigint(20) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reversion` int(11) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `begin_time` bigint(20) DEFAULT NULL,
  `device_code` varchar(255) DEFAULT NULL,
  `face_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  `task_id` varchar(255) DEFAULT NULL,
  `feature_data` longblob,
  `access_card` varchar(255) DEFAULT NULL,
  `card_type` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
