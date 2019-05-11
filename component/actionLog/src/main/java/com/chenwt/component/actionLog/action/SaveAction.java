package com.chenwt.component.actionLog.action;

import com.chenwt.common.utils.EntityBeanUtil;
import com.chenwt.common.utils.HttpServletUtil;
import com.chenwt.component.actionLog.action.base.ActionMap;
import com.chenwt.component.actionLog.action.base.ResetLog;
import com.chenwt.modules.system.domain.ActionLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.Assert;

import javax.persistence.Table;

/**
 * 通用：记录保存数据的行为
 *
 * @author chenwt
 * @date 2018/10/14
 */
@Slf4j
public class SaveAction extends ActionMap {

    @Override
    public void init() {
        // 记录数据保存日志
        putMethod("default", "defaultMethod");
    }

    /**
     * 重新包装保存的数据行为方法
     *
     * @param resetLog ResetLog对象数据
     */
    public static void defaultMethod(ResetLog resetLog) {
        ActionLog actionLog = resetLog.getActionLog();
        Object entity = resetLog.getEntityParam();
        Assert.notNull(entity, "日志记录失败：未发现@EntityParam注解参数，将不做数据日志记录");

        // 获取实体类的@Table表名
        Table table = entity.getClass().getAnnotation(Table.class);
        Assert.notNull(table, "该对象不存在" + Table.class.getName() + "注解！请检查！");
        actionLog.setModel(table.name());

        // 获取实体对象数据ID
        Object[] idInfo = EntityBeanUtil.getId(entity);
        Assert.notNull(idInfo, "无法获取该实体对象的主键ID字段！");
        actionLog.setRecordId(Long.valueOf(String.valueOf(idInfo[1])));

        // 日志消息
        String idParam = HttpServletUtil.getParameter(String.valueOf(idInfo[0]));
        String message = "数据成功";
        if (!actionLog.getMessage().isEmpty()) {
            message = resetLog.fillRule(entity, actionLog.getMessage());
        }

        if (idParam == null) {
            actionLog.setMessage("添加" + message);
        } else {
            actionLog.setMessage("更新" + message);
        }
    }
}
