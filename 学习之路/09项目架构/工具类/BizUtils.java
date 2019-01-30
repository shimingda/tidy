package com.rw.ssd.biz.utils;

import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.rw.ssd.uface.db.jpa.entity.person.Group;
import com.rw.ssd.uface.db.jpa.idgen.Snowflake;
import com.rw.ssd.uface.db.jpa.repo.GroupRepo;

/******************************************************************************
 * 
 * <p>
 * Description:BIZ模块内部工具方法抽离
 * </p>
 * Project: com.rw.ssd.biz.utils.SpringContextHolder: SpringContextHolder.java
 * 
 * @author shimingda@deepsense.cn
 * 
 *****************************************************************************/
public class BizUtils {

    private BizUtils() {
    }

    /**
     * 判断两个集合不同
     * 
     * @param collections1
     * @param collections2
     * @return
     */
    public static Boolean checkDiffrent(Collection<?> collections1, Collection<?> collections2) {

        if (collections2.size() != collections1.size()) {

            return true;
        }
        for (Object object : collections1) {
            if (!collections2.contains(object)) {

                return true;
            }
        }
        return false;
    }

    /**
     * 获取拼接人员组名
     * 
     * 从人员组根到人员组
     */
    public static String getGroupName(Group group) {
        GroupRepo groupRepo = SpringContextHolder.getBean(GroupRepo.class);
        String name = group.getName();
        if (null == group.getParent()) {
            return name;
        }

        List<String> paths = Arrays.asList(StringUtils.split(group.getPath(), ";"));
        List<String> names = new LinkedList<>();
        for (String path : paths) {
            Group eachGroup = groupRepo.getOne(Long.valueOf(path));
            if ("root".equals(eachGroup.getName())) {
                continue;
            }
            names.add(eachGroup.getName());
        }

        return StringUtils.join(names, "-");
    }

    public static long getGenerteKey() {

        Snowflake snowflake = new Snowflake();

        return snowflake.generateKey();
    }

}
