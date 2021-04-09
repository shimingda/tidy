package com.rw.ssd.biz.utils.cache;

import com.rw.ssd.biz.domain.dto.FaceCacheDTO;

public interface KeyStore {
    /**
     * 保存key，指定时间后过期，单位秒
     *
     * @param key
     */
    void saveKey(long key, FaceCacheDTO face, Long exprieTime);

    /**
     * 
     * @param key
     * @return
     */
    FaceCacheDTO get(long key);

}
