package com.chenwt.component.jwt.controller;

import com.chenwt.common.enums.StatusEnum;
import com.chenwt.common.exception.ResultException;
import com.chenwt.common.utils.EncryptUtil;
import com.chenwt.common.utils.ResultVoUtil;
import com.chenwt.common.vo.ResultVo;
import com.chenwt.component.jwt.annotation.IgnorePermissions;
import com.chenwt.component.jwt.config.properties.JwtProjectProperties;
import com.chenwt.component.jwt.enums.JwtResultEnums;
import com.chenwt.component.jwt.utlis.JwtUtil;
import com.chenwt.modules.system.domain.User;
import com.chenwt.modules.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 默认登录验证控制器
 * 说明：默认采用系统用户进行登录验证
 * @author chenwt
 * @date 2019/4/9
 */
@RestController
public class AuthController {

    @Autowired
    private JwtProjectProperties properties;

    @Autowired
    private UserService userService;

    @IgnorePermissions
    @PostMapping("/api/auth")
    public ResultVo auth(String username, String password){
        // 根据用户名获取系统用户数据
        User user = userService.getByName(username);
        if (user == null) {
            throw new ResultException(JwtResultEnums.AUTH_REQUEST_ERROR);
        } else if (user.getStatus().equals(StatusEnum.FREEZED.getCode())){
            throw new ResultException(JwtResultEnums.AUTH_REQUEST_LOCKED);
        } else {
            // 对明文密码加密处理
            String encrypt = EncryptUtil.encrypt(password, user.getSalt());
            // 判断密码是否正确
            if (encrypt.equals(user.getPassword())) {
                String token = JwtUtil.getToken(username, properties.getSecret(), properties.getExpired());
                return ResultVoUtil.success("登录成功", token);
            } else {
                throw new ResultException(JwtResultEnums.AUTH_REQUEST_ERROR);
            }
        }
    }
}
