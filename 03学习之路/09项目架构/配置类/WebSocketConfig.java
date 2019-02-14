package com.rw.ssd.biz.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

/**
 * 前端需要引用文件
 * <script src="http://cdn.bootcss.com/stomp.js/2.3.3/stomp.min.js"></script>
 * <script src=
 * "https://cdn.bootcss.com/sockjs-client/1.1.4/sockjs.min.js"></script>
 */

@Configuration
@EnableWebSocketMessageBroker // 开启使用STOMP协议来传输基于代理的消息
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    /**
     * 注册STOMP协议的节点，并指定映射的URL
     */
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        /**
         * /topic 代表发布广播，即群发 /queue 代表点对点，即发指定用户(后续添加)
         */
        config.enableSimpleBroker("/topic");// 配置消息代理，由于是实现推送功能，这里的消息代理是/topic
        // 全局使用的消息前缀（客户端订阅路径上会体现出来）
        config.setApplicationDestinationPrefixes("/uface");
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {

        // 注册STOMP协议节点，同时指定使用SockJS协议。
        registry.addEndpoint("/biz/connect").setAllowedOrigins("*")// 允许跨域
                .withSockJS().setSessionCookieNeeded(false);
        // .setInterceptors(httpSessionInterceptor())

    }

    // todo 连接前用户验证
    // @Bean
    // public HandshakeInterceptor httpSessionInterceptor() {
    // return new MyHttpSessionHandshakeInterceptor();
    // }

}
