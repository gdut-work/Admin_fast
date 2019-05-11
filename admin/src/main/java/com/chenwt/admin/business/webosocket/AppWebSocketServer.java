package com.chenwt.admin.business.webosocket;

import com.chenwt.admin.business.domain.websocket.AppClientRegisterInfoBean;
import com.chenwt.admin.business.domain.websocket.AppClientResponseInfoBean;
import com.chenwt.admin.business.domain.websocket.WebSocketMessageBean;
import com.chenwt.admin.business.domain.websocket.WebsocketClientInfoBean;
import com.chenwt.admin.business.enums.Constants;
import com.chenwt.admin.business.service.AsyncServiceTool;
import com.chenwt.common.utils.JacksonUtils;
import com.chenwt.common.utils.SpringContextUtil;
import com.fasterxml.jackson.core.type.TypeReference;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.util.Map;

/**
 * @class：WebSocketServer
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-07 10:14
 * @description:
 */

/**
 * 注释端点表示将 WebSocket 服务端运行在 ws://[Server 端 IP 或域名]:[Server 端口]/项目名/websocket 的访问端点
 */
@ServerEndpoint(value = "/websocket/app")
@Component
@Slf4j
public class AppWebSocketServer {
    private String phone;
    /**
     * 与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    private Session session;

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getPhone() {
        return phone;
    }

    public Session getSession() {
        return session;
    }

    /**
     * 连接建立后触发的方法
     */
    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        log.info("onOpen" + session.getId());

        //将注册链接信息注册缓存
        WebSocketMapUtil.put(session.getId(),this);
    }

    /**
     * 连接关闭后触发的方法
     */
    @OnClose
    public void onClose() {
        //从map中删除
        WebSocketMapUtil.remove(session.getId());
        log.info("====== onClose:" + session.getId() + " ======");
    }

    /**
     * 接收到客户端消息时触发的方法
     */
    @OnMessage
    public void onMessage(String websocketClientInfoBeanJson, Session session){
        System.out.println(">>>>>>>>>>>>>> websocketClientInfoBeanJson  " + websocketClientInfoBeanJson);

        if (StringUtils.isNotBlank(websocketClientInfoBeanJson)) {
            Map jsonObjectMap = JacksonUtils.jsonToBean(websocketClientInfoBeanJson,Map.class);

            Integer type = (Integer) jsonObjectMap.get("type");

            if (type.equals(Constants.REGISTER_MESSAGE)){
                registerAppInfo(websocketClientInfoBeanJson);
            }else if (type.equals(Constants.RESPONSE_MESSAGE)){
                AppWebSocketServer appWebSocketServer = WebSocketMapUtil.get(session.getId());
                responseApp(appWebSocketServer.getPhone(),websocketClientInfoBeanJson);
            }else {}

        }

    }

    /**
     * 处理客户端接收请求，再成功响应
     * @param phone
     * @param websocketClientInfoBeanJson
     */
    private void responseApp(String phone, String websocketClientInfoBeanJson) {
        WebsocketClientInfoBean<AppClientResponseInfoBean> websocketClientInfoBean = JacksonUtils.jsonToBean(websocketClientInfoBeanJson, new TypeReference<WebsocketClientInfoBean<AppClientResponseInfoBean>>() {});
        //将该客户端成功处理信息写入到数据库---异步操作
        AsyncServiceTool asyncServiceTool = SpringContextUtil.getBean(AsyncServiceTool.class);
        asyncServiceTool.saveAppResponse(phone,websocketClientInfoBean.getClientInfo());
    }

    /**
     * 注册AppClientRegisterInfoBean
     * @param websocketClientInfoBeanJson
     */
    private void registerAppInfo(String websocketClientInfoBeanJson) {
        WebsocketClientInfoBean<AppClientRegisterInfoBean> websocketClientInfoBean = JacksonUtils.jsonToBean(websocketClientInfoBeanJson, new TypeReference<WebsocketClientInfoBean<AppClientRegisterInfoBean>>() {});

        log.info("收到来自" + websocketClientInfoBean.getClientInfo().getPhone() + "的消息");
        //给WebSocketServer绑定对应phone
        if (StringUtils.isBlank(phone)){
            phone = websocketClientInfoBean.getClientInfo().getPhone();

            //将该手机号码用户信息写入到数据库---异步操作
            AsyncServiceTool asyncServiceTool = SpringContextUtil.getBean(AsyncServiceTool.class);
            asyncServiceTool.saveAppInfo(websocketClientInfoBean.getClientInfo());

        }

        //返回消息给Web Socket客户端（或浏览器）--- 成功
        WebSocketMessageBean webSocketMessageBean = new WebSocketMessageBean(phone);
        WebSocketMessageTaskFactory.submitWebSocketMessageTaskPool(webSocketMessageBean);
    }



    /**
     * 发生错误时触发的方法
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.info(session.getId() + "连接发生错误" + error.getMessage());
        error.printStackTrace();
    }

}
