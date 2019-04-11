package com.rw.ssd.biz.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import lombok.extern.slf4j.Slf4j;

/******************************************************************************
 * 
 * <p>
 * Description:同一类型，两个对象，不同属性赋值
 * </p>
 * Project: com.rw.ssd.biz.utils.CopysUtils: CopysUtils.java
 * 
 * @author shimingda@deepsense.cn
 * 
 *****************************************************************************/
@Slf4j
public class CopysUtils {
    private CopysUtils() {
    }

    private static final Logger logger = LoggerFactory.getLogger(CopysUtils.class);

    public static void copy(Object src, Object dest) {

        /**
         * 获取父类属性全量获取
         */
        ArrayList<Field> finalSrcFields = getAllField(dest);
        /**
         * 目标属性获取
         */
        Map<String, Object> srcMap = new HashMap<String, Object>();
        // 反射获取私有属性name集合
        for (Field fd : finalSrcFields) {
            try {
                fd.setAccessible(true);
                srcMap.put(fd.getName(), fd.get(src)); // 获取属性值
            } catch (Exception e) {
                log.error("转化异常{}", e.getMessage());
            }
        }
        /**
         * 获取父类属性全量获取
         */
        ArrayList<Field> finalDestFields = getAllField(src);
        /**
         * 属性赋值
         */
        for (Field fd : finalDestFields) {
            fd.setAccessible(true);
            // 静态
            Boolean isStatic = Modifier.isStatic(fd.getModifiers());
            if (isStatic) {
                continue;
            }
            // 空值不转化
            if (srcMap.get(fd.getName()) == null) {
                continue;
            }
            try {
                fd.set(dest, srcMap.get(fd.getName())); // 给属性赋值
            } catch (Exception e) {
                log.error("转化异常{}", e.getMessage());
            }
        }
    }

    /**
     * 获取父类属性全量获取
     * 
     * @param src
     * @return
     */
    private static ArrayList<Field> getAllField(Object src) {
        ArrayList<Field> finalDestFields = new ArrayList<>();
        // 反射获取私有属性name集合
        Class<?> destClazz = src.getClass();
        for (; destClazz != Object.class; destClazz = destClazz.getSuperclass()) {
            try {
                Field[] field = destClazz.getDeclaredFields();
                finalDestFields.addAll(Arrays.asList(field));
            } catch (Exception e) {
                logger.error("对象父类获取失败{}", destClazz);
            }
        }
        return finalDestFields;
    }

}
