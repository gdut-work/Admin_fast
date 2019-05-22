package com.chenwt.admin.business.service.impl;

import com.chenwt.admin.business.domain.entity.AppCommand;
import com.chenwt.admin.business.domain.projection.AppCommandProjection;
import com.chenwt.admin.business.domain.websocket.WebSocketMessageBean;
import com.chenwt.admin.business.repository.AppCommandRepository;
import com.chenwt.admin.business.service.AppCommandService;
import com.chenwt.admin.business.webosocket.AppWebSocketServer;
import com.chenwt.admin.business.webosocket.WebSocketMapUtil;
import com.chenwt.admin.business.webosocket.WebSocketMessageTaskFactory;
import com.chenwt.common.data.PageSort;
import com.chenwt.common.enums.StatusEnum;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

/**
 * @class：AppCommandServiceImpl
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-05-07 19:06
 * @description:
 */
@Service
public class AppCommandServiceImpl implements AppCommandService {
    @Resource
    private AppCommandRepository appCommandRepository;


    @Override
    public Page<AppCommandProjection> getPageList(Byte status, String title) {
        // 创建分页对象
        Pageable page = PageSort.nativePageRequest(Sort.Direction.ASC);
        return appCommandRepository.getPageList(status,title,page);
    }

    @Override
    public AppCommandProjection findById(Long appCommandId) {
        return appCommandRepository.findByAppCommandId(appCommandId);
    }

    @Override
    public AppCommand getById(Long appCommandId) {
        return appCommandRepository.findById(appCommandId).orElse(null);
    }

    @Override
    public AppCommand save(AppCommand appCommand) {
        return appCommandRepository.save(appCommand);
    }

    @Override
    public Boolean updateStatus(StatusEnum statusEnum, List<Long> ids) {
        return appCommandRepository.updateStatus(statusEnum.getCode(), ids) > 0;
    }

    @Override
    public void exec(Long appCommandId, List<Long> customerIdList) {
        //todo
        AppCommand appCommand = getById(appCommandId);
        if (null != appCommand){
            String command = appCommand.getCommand();
            Collection<AppWebSocketServer> appWebSocketServerCollection = WebSocketMapUtil.getWebSocketServer();

            //没有在线的客户端
            if (appWebSocketServerCollection.isEmpty()){
                return;
            }

            if (null == customerIdList){
                //全部发送(手机号码为空)
                WebSocketMessageBean webSocketMessageBean = new WebSocketMessageBean();
                webSocketMessageBean.setData(command);
                WebSocketMessageTaskFactory.submitWebSocketMessageTaskPool(webSocketMessageBean);
            }else{
                //勾选发送
                List<WebSocketMessageBean> webSocketMessageBeanList = new LinkedList<>();
                appWebSocketServerCollection.forEach(e->{
                    if (customerIdList.contains(e.getPhone())){

                    }
                    WebSocketMessageBean webSocketMessageBean = new WebSocketMessageBean();
                    webSocketMessageBean.setPhone(e.getPhone());
                });

                if (0 < webSocketMessageBeanList.size()){
                    //                WebSocketMessageTaskFactory.submitBatchWebSocketMessageTaskPool(webSocketMessageBean);

                }
            }
        }
    }
}
