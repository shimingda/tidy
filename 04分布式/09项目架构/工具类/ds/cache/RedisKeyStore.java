package com.rw.ssd.biz.utils.cache;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.rw.ssd.biz.domain.dto.FaceCacheDTO;
import com.rw.ssd.biz.exception.BizException;
import com.rw.ssd.commons.exception.UfaceError;

@Component("redisKeyStore")
public class RedisKeyStore implements KeyStore {

    @Autowired
    private BizRedisTemplate redisTemplate;

    @Override
    public void saveKey(long key, FaceCacheDTO face, Long exprieTime) {
        redisTemplate.opsForValue().set(String.valueOf(key), face, exprieTime, TimeUnit.SECONDS);

    }

    @Override
    public FaceCacheDTO get(long key) {
        FaceCacheDTO faceCacheDTO = (FaceCacheDTO) redisTemplate.opsForValue().get(String.valueOf(key));
        if (null == faceCacheDTO) {
            throw new BizException(UfaceError.FACE_ILLEGITIMATE);
        }
        return faceCacheDTO;
    }

}
