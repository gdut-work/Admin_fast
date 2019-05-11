package com.chenwt.admin.business.webosocket;

import java.util.Collection;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * @class：WebSocketMapUtil
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-07 10:13
 * @description: webSocket客户端链接缓存
 */
public class WebSocketMapUtil {
    /**
     * appWebSocketServerMap缓存
     */
    public static ConcurrentMap<String, AppWebSocketServer> appWebSocketServerMap = new ConcurrentHashMap<>();

    /**
     * 以手机号为识别码缓存对应链接
     * @param sessionId
     * @param appWebSocketServer
     */
    public synchronized static void put(String sessionId, AppWebSocketServer appWebSocketServer){
        appWebSocketServerMap.put(sessionId, appWebSocketServer);
    }

    public static AppWebSocketServer get(String sessionId){
        return appWebSocketServerMap.get(sessionId);
    }

    public synchronized static void remove(String sessionId){
        appWebSocketServerMap.remove(sessionId);
    }

    /**
     * 获取缓存数据
     * @return
     */
    public static Collection<AppWebSocketServer> getWebSocketServer(){
        return appWebSocketServerMap.values();
    }

    /**
     * 通过号码获取对应的WebSocketServer对象
     * @param phone
     * @return
     */
    public static AppWebSocketServer getByPhone(String phone) {
        AppWebSocketServer appWebSocketServer = null;
        Collection<AppWebSocketServer> appWebSocketServerCollection = getWebSocketServer();
        if (!appWebSocketServerCollection.isEmpty()){
            Iterator<AppWebSocketServer> iterator = appWebSocketServerCollection.iterator();
            while (iterator.hasNext()){
                appWebSocketServer = iterator.next();
                if (appWebSocketServer.getPhone().equals(phone)){
                    break;
                }
            }
        }
        return appWebSocketServer;
    }
}
