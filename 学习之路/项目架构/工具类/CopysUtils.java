package com.rw.ssd.biz.utils;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rw.ssd.biz.domain.req.PersonRequest;
import com.rw.ssd.uface.db.jpa.entity.person.Person;

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
public class CopysUtils {
    private static final Logger logger = LoggerFactory.getLogger(CopysUtils.class);

    public static void copy(Object src, Object dest) {
        Boolean sameClass = src.getClass().equals(dest.getClass());
        if (!sameClass) {
            logger.error("the different class is {} and {}", src.getClass(), dest.getClass());
            return;
        }
        logger.info("the same class");
        Map<String, Object> srcMap = new HashMap<String, Object>();
        // 反射获取私有属性name集合
        Field[] srcFields = src.getClass().getDeclaredFields();

        for (Field fd : srcFields) {
            try {
                fd.setAccessible(true);
                srcMap.put(fd.getName(), fd.get(src)); // 获取属性值
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        Field[] destFields = dest.getClass().getDeclaredFields();
        for (Field fd : destFields) {
            fd.setAccessible(true);
            if (srcMap.get(fd.getName()) == null) {
                continue;
            }
            try {
                fd.set(dest, srcMap.get(fd.getName())); // 给属性赋值
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        copy(new Person(), new PersonRequest());
    }
}
