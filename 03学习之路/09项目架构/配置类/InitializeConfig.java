package com.rw.ssd.biz.config;

import java.util.List;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.rw.ssd.commons.constant.BizServiceConstants;
import com.rw.ssd.uface.db.jpa.entity.surveillance.AlertConfig;
import com.rw.ssd.uface.db.jpa.entity.surveillance.AlertSound;
import com.rw.ssd.uface.db.jpa.repo.surveillance.AlertConfigRepo;
import com.rw.ssd.uface.db.jpa.repo.surveillance.AlertSoundRepo;

import lombok.extern.slf4j.Slf4j;

/**
 * @ClassName: InitializeConfig
 * @Description: 初始化配置
 *
 * @author shimingda@deepsense.cn
 * @version 创建时间：2019年1月23日
 *
 */
@Slf4j
// @Component
public class InitializeConfig implements InitializingBean {

    @Value("${alert.sound.path}")
    private String filePath;

    @Value("${alert.sound.url}")
    private String soundUrl;

    @Autowired
    private AlertSoundRepo alertSoundRepo;

    @Autowired
    private AlertConfigRepo alertConfigRepo;

    @Override
    public void afterPropertiesSet() throws Exception {
        // 初始化告警音乐
        initAlertSound();
        // 初始化告警全局配置
        initAlertConfig();

    }

    /**
     * 初始化告警音乐
     */
    private void initAlertSound() {
        List<AlertSound> alertSounds = alertSoundRepo.findAll();
        if (0 < alertSounds.size()) {
            return;
        }

        AlertSound alertSound = new AlertSound();
        alertSound.setSoundUrl(soundUrl);
        String name = "默认值";
        alertSound.setSoundName(name);
        alertSoundRepo.saveAndFlush(alertSound);
        log.info("success=> init alert sound");
    }

    /**
     * 初始化告警全局配置
     */
    public void initAlertConfig() {
        List<AlertConfig> alertConfigs = alertConfigRepo.findAll();
        if (0 < alertConfigs.size()) {
            return;
        }
        AlertConfig alertConfig = new AlertConfig();
        List<AlertSound> alertSounds = alertSoundRepo.findAll();
        Long alertSoundId = alertSounds.get(0).getId();

        alertConfig.setConfigKey(BizServiceConstants.AlertConfigKey.alertSound);
        alertConfig.setConfigValue(alertSoundId.toString());
        alertConfigRepo.saveAndFlush(alertConfig);

        AlertConfig judgedConfig = new AlertConfig();

        judgedConfig.setConfigKey(BizServiceConstants.AlertConfigKey.judgedSound);
        judgedConfig.setConfigValue(alertSoundId.toString());
        alertConfigRepo.saveAndFlush(judgedConfig);

        AlertConfig stayTimeConfig = new AlertConfig();

        stayTimeConfig.setConfigKey(BizServiceConstants.AlertConfigKey.stayTime);
        stayTimeConfig.setConfigValue(String.valueOf(BizServiceConstants.STAYTINE));
        alertConfigRepo.saveAndFlush(stayTimeConfig);

        log.info("success=> init alert config(");
    }

}
