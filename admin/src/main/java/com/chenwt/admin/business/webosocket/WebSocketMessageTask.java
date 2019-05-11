package com.chenwt.admin.business.webosocket;

import com.chenwt.admin.business.domain.websocket.DataResponseBean;
import com.chenwt.admin.business.domain.websocket.WebSocketMessageBean;
import com.chenwt.common.utils.JacksonUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

/**
 * 某个观测量都对应一个cron时间（在obs_table表中），每个观测量都对应一个WebSocketMessageTask线程
 */

/**
 * @class：WebSocketMessageUtil
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-04-03 10:22
 * @description: 这里启动一个线程不停的监控队列是否有消息需要进行发送，如果有就发送出去。
 */
@Slf4j
public class WebSocketMessageTask implements Runnable {
    private WebSocketMessageBean webSocketMessageBean;

    public WebSocketMessageTask(WebSocketMessageBean webSocketMessageBean) {
        this.webSocketMessageBean = webSocketMessageBean;
    }

    /**
     * 推送消息webSocketMessageBean
     * @param webSocketMessageBean
     */
    public void sendMessage(WebSocketMessageBean webSocketMessageBean) throws IOException {
        DataResponseBean dataResponseBean = DataResponseBean.ok();
        dataResponseBean.setData(webSocketMessageBean.getData());
        String dataRet = JacksonUtils.objectToJson(dataResponseBean);

        AppWebSocketServer appWebSocketServer;
        //发送给对应phone（一对一）
        if (StringUtils.isNotBlank(webSocketMessageBean.getPhone())) {
            appWebSocketServer = WebSocketMapUtil.getByPhone(webSocketMessageBean.getPhone());
            if (null != appWebSocketServer){
                //一对一发送消息
                appWebSocketServer.getSession().getBasicRemote().sendText(dataRet);
            }
        } else {
            //广播形式
            Collection<AppWebSocketServer> appWebSocketServerCollection = WebSocketMapUtil.getWebSocketServer();
            if (!appWebSocketServerCollection.isEmpty()){
                Iterator<AppWebSocketServer> iterator = appWebSocketServerCollection.iterator();
                while (iterator.hasNext()){
                    appWebSocketServer = iterator.next();
                    if (null != appWebSocketServer) {
                        //一对一发送消息
                        appWebSocketServer.getSession().getBasicRemote().sendText(dataRet);
                    }
                }
            }
        }
    }

    @Override
    public void run() {
        log.info(">>>>>>>推送消息线程启动>>>>>>>>>");
        if (null != webSocketMessageBean) {
            try {
                sendMessage(webSocketMessageBean);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}