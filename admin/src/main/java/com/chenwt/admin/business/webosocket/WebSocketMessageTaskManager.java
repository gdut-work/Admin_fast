package com.chenwt.admin.business.webosocket;

import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.ThreadPoolExecutor;

/**
 * @class：WebSocketMessageMange
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-04-03 11:43
 * @description:
 */
@Slf4j
public class WebSocketMessageTaskManager {
    /**
     * 线程池来管理
     */
    private static ThreadPoolTaskExecutor executor;

    /**
     * 初始化
     */
    static {
        /**
         * 初始化线程池
         */
        /** Set the ThreadPoolExecutor's core pool size. */
        int corePoolSize = 10;
        /** Set the ThreadPoolExecutor's maximum pool size. */
        int maxPoolSize = 200;
        /** Set the capacity for the ThreadPoolExecutor's BlockingQueue. */
        int queueCapacity = 10;

        /** private String LogThreadNamePrefix = "LogExecutor-"; */
        String threadNamePrefix = "webSocketExecutor-";

        executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(corePoolSize);
        executor.setMaxPoolSize(maxPoolSize);
        executor.setQueueCapacity(queueCapacity);
        executor.setThreadNamePrefix(threadNamePrefix);

        // rejection-policy：当pool已经达到max size的时候，如何处理新任务
        // CALLER_RUNS：不在新线程中执行任务，而是有调用者所在的线程来执行
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        executor.initialize();
    }

    private static WebSocketMessageTaskManager instance = new WebSocketMessageTaskManager();

    public static WebSocketMessageTaskManager getInstance() {
        return instance;
    }

    private WebSocketMessageTaskManager() {
    }

    /**
     * 将webSocketMessageTask提交给线程池执行
     *
     * @param webSocketMessageTask
     */
    public void executeWebSocketMessageThread(WebSocketMessageTask webSocketMessageTask) {
        executor.submit(webSocketMessageTask);
    }
}
