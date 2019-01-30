package com.rw.ssd.biz.utils;

import java.util.Date;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.alibaba.fastjson.JSONObject;
import com.rw.ssd.uface.db.jpa.entity.record.CapturedFaceRecord;
import com.rw.ssd.uface.db.jpa.repo.record.CapturedFaceRecordRepo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DeviceUtils {

    private DeviceUtils() {
    }

    private static final String url = "http://192.168.1.78:8989/redis/rest/face/deviceStatus.json";
    // private static final String url =
    // "http://192.168.1.157:8989/redis/rest/face/deviceStatus.json";

    public static Integer getStatus(String code) {
        StringBuilder finalUrl = new StringBuilder(url);
        finalUrl.append("?deviceCode={code}");

        UriComponents uriComponents = UriComponentsBuilder.fromUriString(finalUrl.toString()).build().expand(code)
                .encode();
        log.info(uriComponents.toUri().toString());
        JSONObject body = HttpConnectionUtils.get(uriComponents);
        log.info(body.toJSONString());
        Boolean isTrue = (Boolean) body.get("success");
        if (isTrue) {

            return 1;
        } else {
            return 0;
        }
    }

    public static long getSnapshotTotal(Date date, Long deviceId) {
        CapturedFaceRecordRepo capturedFaceRecordRepo = SpringContextHolder.getBean(CapturedFaceRecordRepo.class);
        Specification<CapturedFaceRecord> capturedFaceRecordSp = CapturedFaceRecordRepo.countByDateAndDeviceId(date,
                deviceId);
        long total = capturedFaceRecordRepo.count(capturedFaceRecordSp);
        return total;
    }

}
