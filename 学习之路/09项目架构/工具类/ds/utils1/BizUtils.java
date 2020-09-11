package com.rw.ssd.biz.utils;

import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;

import com.rw.ssd.uface.db.jpa.entity.device.Device;
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
     * Collection<String> ==> List<Long>
     * 
     * @param collections
     * @return
     */
    public static List<Long> convertList(Collection<String> collections) {
        return collections.parallelStream().map(x -> Long.valueOf(x)).collect(Collectors.toList());
    }

    /**
     * Collection<String> ==> Set<Long>
     * 
     * @param collections
     * @return
     */
    public static Set<Long> convertSet(Collection<String> collections) {
        return collections.parallelStream().map(x -> Long.valueOf(x)).collect(Collectors.toSet());
    }

    /**
     * Collection<Long> ==> List<String>
     * 
     * @param collections
     * @return
     */
    public static List<String> convertStringList(Collection<Long> collections) {
        return collections.parallelStream().map(x -> String.valueOf(x)).collect(Collectors.toList());
    }

    /**
     * Collection<Long> ==> Set<String>
     * 
     * @param collections
     * @return
     */
    public static Set<String> convertStringSet(Collection<Long> collections) {
        return collections.parallelStream().map(x -> String.valueOf(x)).collect(Collectors.toSet());
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

    /**
     * 生成全局唯一ID
     */
    public static long getGenerteKey() {

        Snowflake snowflake = new Snowflake();

        return snowflake.generateKey();
    }

    /**
     * 按照类型过滤设备
     * 
     * @param allDevices
     * @param type
     * @return
     */
    public static List<Device> filterByType(List<Device> allDevices, Integer type) {

        return allDevices.stream().filter(x -> x.getType().equals(type)).collect(Collectors.toList());
    }

    /**
     * 获取对应类型的设备ID
     * 
     * @param devices
     * @param type
     * @return
     */
    public static List<Long> getIdsFilterByType(List<Device> allDevices, Integer type) {
        List<Device> devices = filterByType(allDevices, type);
        return devices.stream().map(x -> x.getId()).collect(Collectors.toList());
    }

}
