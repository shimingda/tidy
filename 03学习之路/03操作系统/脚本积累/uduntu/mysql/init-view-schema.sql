use uface;
-- 创建人脸信息视图
CREATE OR REPLACE VIEW `v_face_info` AS
SELECT `f`.`id`         AS `face_id`,
       `f`.`face_image` AS `face_image`,
       `p`.`id`         AS `person_id`,
       `p`.`name`       AS `person_name`,
       `g`.`name`       AS `group_name`,
       `g`.`id`         AS `group_id`,
       `g`.`tree_path`  AS `tree_path`
FROM (
      (
        `t_face` `f`
          JOIN `t_person` `p`
        )
       JOIN `t_group` `g`
  )
WHERE (
          (`p`.`id` = `f`.`person_id`)
          AND (`g`.`id` = `p`.`group_id`)
          AND (`g`.`delete_flag` = 0)
          AND (`p`.`delete_flag` = 0)
          AND (`p`.`status` = 1)
        );

-- 创建设备布控视图
CREATE OR REPLACE VIEW `v_device_surveillance_group` AS
select `d`.`id`        AS `device_id`,
       `d`.`name`      AS `device_name`,
       `d`.`code`      AS `device_code`,
       `s`.`id`        AS `surveillance_id`,
       `s`.`name`      AS `surveillance_name`,
       `s`.`threshold` AS `threshold`,
       `g`.`name`      AS `group_name`,
       `g`.`tree_path` AS `tree_path`,
       `g`.`id`        AS `group_id`
from ((((`t_device` `d` join `t_surveillance` `s`) join `t_group` `g`) join `r_surveillance_device` `rd`)
       join `r_surveillance_group` `rg`)
where ((`d`.`id` = `rd`.`device_id`) and (`rd`.`surveillance_id` = `s`.`id`) and (`rg`.`surveillance_id` = `s`.`id`) and
       (`rg`.`group_id` = `g`.`id`) and (`g`.`delete_flag` = 0) and (`d`.delete_flag = 0) AND (`s`.`status` = 1));