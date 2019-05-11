package com.chenwt.admin.business.webosocket;

import com.chenwt.admin.business.domain.websocket.WebSocketMessageBean;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

/**
 * @class：WebSocketMessageTaskFactory
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-04-03 17:03
 * @description: WebSocketMessageTask工厂，制作并提交WebSocketMessageTask对象
 */
@Slf4j
public class WebSocketMessageTaskFactory {
    /**
     * 根据webSocketMessage构造出WebSocketMessageTask
     * @param webSocketMessageBean
     * @return
     */
    private static WebSocketMessageTask getWebSocketMessageTask(WebSocketMessageBean webSocketMessageBean) {
        return new WebSocketMessageTask(webSocketMessageBean);
    }

    /**
     * 将WebSocketMessageBean封装成task提交到task线程池中运行
     *
     * @param webSocketMessageBean
     */
    public static void submitWebSocketMessageTaskPool(WebSocketMessageBean webSocketMessageBean) {
        WebSocketMessageTaskManager webSocketMessageTaskManager = WebSocketMessageTaskManager.getInstance();
        WebSocketMessageTask webSocketMessageTask = getWebSocketMessageTask(webSocketMessageBean);
        webSocketMessageTaskManager.executeWebSocketMessageThread(webSocketMessageTask);
    }

    /**
     * 批量task提交到task线程池中运行
     * @param webSocketMessageBeanList
     */
    public static void submitBatchWebSocketMessageTaskPool(List<WebSocketMessageBean> webSocketMessageBeanList) {
        webSocketMessageBeanList.forEach(e -> {
            submitWebSocketMessageTaskPool(e);
        });
    }
}
