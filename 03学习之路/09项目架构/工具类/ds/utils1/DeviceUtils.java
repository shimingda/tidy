package com.rw.ssd.biz.utils;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.domain.Specification;

import com.rw.ssd.biz.utils.cache.RedisKeyStore;
import com.rw.ssd.uface.db.jpa.entity.record.CapturedFaceRecord;
import com.rw.ssd.uface.db.jpa.repo.record.CapturedFaceRecordRepo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DeviceUtils {

    private DeviceUtils() {
    }

    public static Integer getStatus(String code) {
        RedisKeyStore redisKeyStore = SpringContextHolder.getBean("redisKeyStore");
        String id = redisKeyStore.getDeviceStatus(code);
        if (StringUtils.isNotBlank(id)) {
            log.info("设备码{}在线", code);
            return 1;
        }
        log.info("设备码{}不在线", code);
        return 0;
    }

    public static long getSnapshotTotal(Date date, Long deviceId) {
        CapturedFaceRecordRepo capturedFaceRecordRepo = SpringContextHolder.getBean(CapturedFaceRecordRepo.class);
        Specification<CapturedFaceRecord> capturedFaceRecordSp = CapturedFaceRecordRepo.countByDateAndDeviceId(date,
                deviceId);
        long total = capturedFaceRecordRepo.count(capturedFaceRecordSp);
        return total;
    }

}
