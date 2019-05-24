/*
Navicat MySQL Data Transfer

Source Server         : 本地开发环境
Source Server Version : 50721
Source Host           : 192.168.1.2:3306
Source Database       : study

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-05-22 21:31:15
*/

-- 创建数据库
-- create database `xibian` default character set utf8mb4 collate utf8mb4_general_ci;
create database `app` default character set utf8 collate utf8_general_ci;

use `app` ;

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for app_command
-- ----------------------------
DROP TABLE IF EXISTS `app_command`;
CREATE TABLE `app_command` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'title',
  `command` varchar(1000) DEFAULT NULL COMMENT '指令',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:删除）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='指令表';

-- ----------------------------
-- Records of app_command
-- ----------------------------
INSERT INTO `app_command` VALUES ('1', 'chenwt', '111111', null, null, '1', null, '1', null);
INSERT INTO `app_command` VALUES ('2', '测试', '11111111', '2019-05-20 00:39:11', '2019-05-24 16:38:02', null, '1', '2', '');
INSERT INTO `app_command` VALUES ('3', '测试1', '323', '2019-05-20 00:44:03', null, '1', null, '3', '');

-- ----------------------------
-- Table structure for app_info
-- ----------------------------
DROP TABLE IF EXISTS `app_info`;
CREATE TABLE `app_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `phone` varchar(255) DEFAULT NULL,
  `name1` varchar(255) DEFAULT NULL COMMENT 'name1',
  `name2` varchar(255) DEFAULT NULL COMMENT 'name2',
  `name3` varchar(255) DEFAULT NULL COMMENT 'name3',
  `name4` varchar(255) DEFAULT NULL COMMENT 'name4',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='客户端启动注册表';

-- ----------------------------
-- Records of app_info
-- ----------------------------
INSERT INTO `app_info` VALUES ('1', '15820242077', '1111', '2222', '3333', '4444', null);
INSERT INTO `app_info` VALUES ('2', '138001380000', '1', '2', '3', '4', '2019-05-19 17:54:55');
INSERT INTO `app_info` VALUES ('3', '13824445195', '1', '2', '3', '4', '2019-05-20 23:17:51');
INSERT INTO `app_info` VALUES ('4', '13824445196', '11', '22', '33', '44', '2019-05-20 23:25:10');
INSERT INTO `app_info` VALUES ('6', '13800138001', '1', '2', '3', '4', '2019-05-24 17:27:47');
INSERT INTO `app_info` VALUES ('7', '13800138002', '1', '2', '3', '4', '2019-05-24 17:28:03');

-- ----------------------------
-- Table structure for app_response
-- ----------------------------
DROP TABLE IF EXISTS `app_response`;
CREATE TABLE `app_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `app_id` bigint(20) DEFAULT NULL COMMENT '课程名',
  `context` varchar(255) DEFAULT NULL COMMENT '响应内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='客户端启动注册表';

-- ----------------------------
-- Records of app_response
-- ----------------------------
INSERT INTO `app_response` VALUES ('5', '6', '我是客户端响应', '2019-05-24 17:56:36');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for course_order
-- ----------------------------
DROP TABLE IF EXISTS `course_order`;
CREATE TABLE `course_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_order
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for pic_template
-- ----------------------------
DROP TABLE IF EXISTS `pic_template`;
CREATE TABLE `pic_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `is_default` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pic_template
-- ----------------------------

-- ----------------------------
-- Table structure for sys_action_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_action_log`;
CREATE TABLE `sys_action_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '日志类型',
  `ipaddr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `clazz` varchar(255) DEFAULT NULL COMMENT '产生日志的类',
  `method` varchar(255) DEFAULT NULL COMMENT '产生日志的方法',
  `model` varchar(255) DEFAULT NULL COMMENT '产生日志的表',
  `record_id` bigint(20) DEFAULT NULL COMMENT '产生日志的数据id',
  `message` text COMMENT '日志消息',
  `create_date` datetime DEFAULT NULL COMMENT '记录时间',
  `oper_name` varchar(255) DEFAULT NULL COMMENT '产生日志的用户昵称',
  `oper_by` bigint(20) DEFAULT NULL COMMENT '产生日志的用户',
  PRIMARY KEY (`id`),
  KEY `FK32gm4dja0jetx58r9dc2uljiu` (`oper_by`) USING BTREE,
  CONSTRAINT `sys_action_log_ibfk_1` FOREIGN KEY (`oper_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1209 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_action_log
-- ----------------------------
INSERT INTO `sys_action_log` VALUES ('1195', '用户登录', '2', '0:0:0:0:0:0:0:1', 'com.chenwt.admin.system.controller.LoginController', 'login', null, null, '后台登录成功', '2019-05-24 16:14:40', '超级管理员', '1');
INSERT INTO `sys_action_log` VALUES ('1196', '用户登录', '2', '0:0:0:0:0:0:0:1', 'com.chenwt.admin.system.controller.LoginController', 'login', null, null, '后台登录成功', '2019-05-24 16:19:50', '超级管理员', '1');
INSERT INTO `sys_action_log` VALUES ('1197', '系统异常', '3', '0:0:0:0:0:0:0:1', 'com.chenwt.component.actionLog.exception.ActionLogProceedAdvice', 'run', null, null, 'org.springframework.dao.InvalidDataAccessApiUsageException: No EntityManager with actual transaction available for current thread - cannot reliably process \'remove\' call; nested exception is javax.persistence.TransactionRequiredException: No EntityManager with actual transaction available for current thread - cannot reliably process \'remove\' call\n	org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:402)\n	org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:255)\n	org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:527)\n	org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\n	org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\n	org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:153)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:138)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.repository.core.support.SurroundingTransactionDetectorMethodInterceptor.invoke(SurroundingTransactionDetectorMethodInterceptor.java:61)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:212)\n	com.sun.proxy.$Proxy154.deleteByIdIn(Unknown Source)\n	sun.reflect.GeneratedMethodAccessor659.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.zeroturnaround.javarebel.integration.util.ReloadingProxyFactory$ReloadingMethodHandler.invoke(SourceFile:74)\n	com.sun.proxy.$Proxy154.deleteByIdIn(Unknown Source)\n	sun.reflect.GeneratedMethodAccessor659.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.zeroturnaround.javarebel.integration.util.ReloadingProxyFactory$ReloadingMethodHandler.invoke(SourceFile:74)\n	com.sun.proxy.$Proxy154.deleteByIdIn(Unknown Source)\n	com.chenwt.admin.business.service.impl.AppInfoServiceImpl.deleteBatchById(AppInfoServiceImpl.java:118)\n	com.chenwt.admin.business.controller.AppInfoController.delete(AppInfoController.java:62)\n	com.chenwt.admin.business.controller.AppInfoController$$FastClassBySpringCGLIB$$f08b50d2.invoke(<generated>)\n	org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor$1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\n	org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	com.chenwt.admin.business.controller.AppInfoController$$EnhancerBySpringCGLIB$$77c25e08.delete(<generated>)\n	sun.reflect.GeneratedMethodAccessor648.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:189)\n	org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\n	org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\n	org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\n	org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	com.chenwt.common.xss.XssFilter.doFilter(XssFilter.java:47)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.doFilter(ErrorPageFilter.java:130)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.access$000(ErrorPageFilter.java:66)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter$1.doFilterInternal(ErrorPageFilter.java:105)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.doFilter(ErrorPageFilter.java:123)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\n	org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\n	org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:624)\n	org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:861)\n	org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1455)\n	org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	java.lang.Thread.run(Thread.java:748)', '2019-05-24 16:25:53', '系统', '1');
INSERT INTO `sys_action_log` VALUES ('1198', '系统异常', '3', '0:0:0:0:0:0:0:1', 'com.chenwt.component.actionLog.exception.ActionLogProceedAdvice', 'run', null, null, 'org.springframework.dao.InvalidDataAccessApiUsageException: No EntityManager with actual transaction available for current thread - cannot reliably process \'remove\' call; nested exception is javax.persistence.TransactionRequiredException: No EntityManager with actual transaction available for current thread - cannot reliably process \'remove\' call\n	org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:402)\n	org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:255)\n	org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:527)\n	org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\n	org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\n	org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:153)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:138)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.repository.core.support.SurroundingTransactionDetectorMethodInterceptor.invoke(SurroundingTransactionDetectorMethodInterceptor.java:61)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:212)\n	com.sun.proxy.$Proxy154.deleteByIdIn(Unknown Source)\n	sun.reflect.GeneratedMethodAccessor659.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.zeroturnaround.javarebel.integration.util.ReloadingProxyFactory$ReloadingMethodHandler.invoke(SourceFile:74)\n	com.sun.proxy.$Proxy154.deleteByIdIn(Unknown Source)\n	sun.reflect.GeneratedMethodAccessor659.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.zeroturnaround.javarebel.integration.util.ReloadingProxyFactory$ReloadingMethodHandler.invoke(SourceFile:74)\n	com.sun.proxy.$Proxy154.deleteByIdIn(Unknown Source)\n	com.chenwt.admin.business.service.impl.AppInfoServiceImpl.deleteBatchById(AppInfoServiceImpl.java:118)\n	com.chenwt.admin.business.controller.AppInfoController.delete(AppInfoController.java:62)\n	com.chenwt.admin.business.controller.AppInfoController$$FastClassBySpringCGLIB$$f08b50d2.invoke(<generated>)\n	org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor$1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\n	org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	com.chenwt.admin.business.controller.AppInfoController$$EnhancerBySpringCGLIB$$77c25e08.delete(<generated>)\n	sun.reflect.GeneratedMethodAccessor648.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:189)\n	org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\n	org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\n	org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\n	org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	com.chenwt.common.xss.XssFilter.doFilter(XssFilter.java:47)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.doFilter(ErrorPageFilter.java:130)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.access$000(ErrorPageFilter.java:66)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter$1.doFilterInternal(ErrorPageFilter.java:105)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.doFilter(ErrorPageFilter.java:123)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\n	org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\n	org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:624)\n	org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:861)\n	org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1455)\n	org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	java.lang.Thread.run(Thread.java:748)', '2019-05-24 16:26:22', '系统', '1');
INSERT INTO `sys_action_log` VALUES ('1199', '系统异常', '3', '0:0:0:0:0:0:0:1', 'com.chenwt.component.actionLog.exception.ActionLogProceedAdvice', 'run', null, null, 'org.springframework.dao.InvalidDataAccessApiUsageException: No EntityManager with actual transaction available for current thread - cannot reliably process \'remove\' call; nested exception is javax.persistence.TransactionRequiredException: No EntityManager with actual transaction available for current thread - cannot reliably process \'remove\' call\n	org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:402)\n	org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:255)\n	org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:527)\n	org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\n	org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\n	org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:153)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:138)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.repository.core.support.SurroundingTransactionDetectorMethodInterceptor.invoke(SurroundingTransactionDetectorMethodInterceptor.java:61)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:212)\n	com.sun.proxy.$Proxy154.deleteByIdIn(Unknown Source)\n	sun.reflect.GeneratedMethodAccessor659.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.zeroturnaround.javarebel.integration.util.ReloadingProxyFactory$ReloadingMethodHandler.invoke(SourceFile:74)\n	com.sun.proxy.$Proxy154.deleteByIdIn(Unknown Source)\n	sun.reflect.GeneratedMethodAccessor659.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.zeroturnaround.javarebel.integration.util.ReloadingProxyFactory$ReloadingMethodHandler.invoke(SourceFile:74)\n	com.sun.proxy.$Proxy154.deleteByIdIn(Unknown Source)\n	com.chenwt.admin.business.service.impl.AppInfoServiceImpl.deleteBatchById(AppInfoServiceImpl.java:118)\n	com.chenwt.admin.business.controller.AppInfoController.delete(AppInfoController.java:62)\n	com.chenwt.admin.business.controller.AppInfoController$$FastClassBySpringCGLIB$$f08b50d2.invoke(<generated>)\n	org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor$1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\n	org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	com.chenwt.admin.business.controller.AppInfoController$$EnhancerBySpringCGLIB$$77c25e08.delete(<generated>)\n	sun.reflect.GeneratedMethodAccessor648.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:189)\n	org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\n	org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\n	org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\n	org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	com.chenwt.common.xss.XssFilter.doFilter(XssFilter.java:47)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.doFilter(ErrorPageFilter.java:130)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.access$000(ErrorPageFilter.java:66)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter$1.doFilterInternal(ErrorPageFilter.java:105)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.doFilter(ErrorPageFilter.java:123)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\n	org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\n	org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:624)\n	org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:861)\n	org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1455)\n	org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	java.lang.Thread.run(Thread.java:748)', '2019-05-24 16:27:07', '系统', '1');
INSERT INTO `sys_action_log` VALUES ('1200', '用户登录', '2', '0:0:0:0:0:0:0:1', 'com.chenwt.admin.system.controller.LoginController', 'login', null, null, '后台登录成功', '2019-05-24 16:35:41', '超级管理员', '1');
INSERT INTO `sys_action_log` VALUES ('1201', '用户登录', '2', '0:0:0:0:0:0:0:1', 'com.chenwt.admin.system.controller.LoginController', 'login', null, null, '后台登录成功', '2019-05-24 16:53:42', '超级管理员', '1');
INSERT INTO `sys_action_log` VALUES ('1202', '系统异常', '3', '0:0:0:0:0:0:0:1', 'com.chenwt.component.actionLog.exception.ActionLogProceedAdvice', 'run', null, null, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet\n	org.springframework.orm.jpa.vendor.HibernateJpaDialect.convertHibernateAccessException(HibernateJpaDialect.java:279)\n	org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:253)\n	org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:527)\n	org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\n	org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\n	org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:153)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:138)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.repository.core.support.SurroundingTransactionDetectorMethodInterceptor.invoke(SurroundingTransactionDetectorMethodInterceptor.java:61)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:212)\n	com.sun.proxy.$Proxy152.getPageList(Unknown Source)\n	sun.reflect.GeneratedMethodAccessor588.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.zeroturnaround.javarebel.integration.util.ReloadingProxyFactory$ReloadingMethodHandler.invoke(SourceFile:74)\n	com.sun.proxy.$Proxy152.getPageList(Unknown Source)\n	com.chenwt.admin.business.service.impl.AppCommandServiceImpl.getPageList(AppCommandServiceImpl.java:44)\n	com.chenwt.admin.business.service.impl.AppCommandServiceImpl$$FastClassBySpringCGLIB$$2e8bf42f.invoke(<generated>)\n	org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\n	com.chenwt.admin.business.service.impl.AppCommandServiceImpl$$EnhancerBySpringCGLIB$$c99429b8.getPageList(<generated>)\n	com.chenwt.admin.business.controller.AppCommandController.index(AppCommandController.java:49)\n	com.chenwt.admin.business.controller.AppCommandController$$FastClassBySpringCGLIB$$f924e65f.invoke(<generated>)\n	org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor$1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\n	org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	com.chenwt.admin.business.controller.AppCommandController$$EnhancerBySpringCGLIB$$38301e9a.index(<generated>)\n	sun.reflect.GeneratedMethodAccessor586.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:189)\n	org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\n	org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\n	org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\n	org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	com.chenwt.common.xss.XssFilter.doFilter(XssFilter.java:47)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.doFilter(ErrorPageFilter.java:130)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.access$000(ErrorPageFilter.java:66)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter$1.doFilterInternal(ErrorPageFilter.java:105)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.doFilter(ErrorPageFilter.java:123)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\n	org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\n	org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:624)\n	org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:861)\n	org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1455)\n	org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	java.lang.Thread.run(Thread.java:748)', '2019-05-24 17:02:05', '系统', '1');
INSERT INTO `sys_action_log` VALUES ('1203', '用户登录', '2', '0:0:0:0:0:0:0:1', 'com.chenwt.admin.system.controller.LoginController', 'login', null, null, '后台登录成功', '2019-05-24 17:12:23', '超级管理员', '1');
INSERT INTO `sys_action_log` VALUES ('1204', '用户登录', '2', '0:0:0:0:0:0:0:1', 'com.chenwt.admin.system.controller.LoginController', 'login', null, null, '后台登录成功', '2019-05-24 17:24:13', '超级管理员', '1');
INSERT INTO `sys_action_log` VALUES ('1205', '系统异常', '3', '0:0:0:0:0:0:0:1', 'com.chenwt.component.actionLog.exception.ActionLogProceedAdvice', 'run', null, null, 'org.springframework.dao.EmptyResultDataAccessException: No class com.chenwt.admin.business.domain.entity.AppResponse entity with id 4 exists!\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.lambda$deleteById$0(SimpleJpaRepository.java:150)\n	java.util.Optional.orElseThrow(Optional.java:290)\n	org.springframework.data.jpa.repository.support.SimpleJpaRepository.deleteById(SimpleJpaRepository.java:149)\n	sun.reflect.GeneratedMethodAccessor708.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.springframework.data.repository.core.support.RepositoryComposition$RepositoryFragments.invoke(RepositoryComposition.java:359)\n	org.springframework.data.repository.core.support.RepositoryComposition.invoke(RepositoryComposition.java:200)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$ImplementationMethodExecutionInterceptor.invoke(RepositoryFactorySupport.java:644)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.doInvoke(RepositoryFactorySupport.java:608)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.lambda$invoke$3(RepositoryFactorySupport.java:595)\n	org.springframework.data.repository.core.support.RepositoryFactorySupport$QueryExecutorMethodInterceptor.invoke(RepositoryFactorySupport.java:595)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:59)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\n	org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:139)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:138)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.data.repository.core.support.SurroundingTransactionDetectorMethodInterceptor.invoke(SurroundingTransactionDetectorMethodInterceptor.java:61)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:212)\n	com.sun.proxy.$Proxy154.deleteById(Unknown Source)\n	sun.reflect.GeneratedMethodAccessor707.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.zeroturnaround.javarebel.integration.util.ReloadingProxyFactory$ReloadingMethodHandler.invoke(SourceFile:74)\n	com.sun.proxy.$Proxy154.deleteById(Unknown Source)\n	com.chenwt.admin.business.service.impl.AppResponseServiceImpl.deleteById(AppResponseServiceImpl.java:46)\n	com.chenwt.admin.business.controller.AppResponseController.delete(AppResponseController.java:68)\n	com.chenwt.admin.business.controller.AppResponseController$$FastClassBySpringCGLIB$$bbbb0a5.invoke(<generated>)\n	org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor$1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\n	org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\n	org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\n	org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\n	com.chenwt.admin.business.controller.AppResponseController$$EnhancerBySpringCGLIB$$d40a192c.delete(<generated>)\n	sun.reflect.GeneratedMethodAccessor706.invoke(Unknown Source)\n	sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45005)\n	java.lang.reflect.Method.invoke(Method.java:498)\n	org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:189)\n	org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\n	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\n	org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\n	org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\n	org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\n	org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\n	org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\n	javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\n	org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\n	org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\n	org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\n	org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	com.chenwt.common.xss.XssFilter.doFilter(XssFilter.java:47)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.doFilter(ErrorPageFilter.java:130)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.access$000(ErrorPageFilter.java:66)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter$1.doFilterInternal(ErrorPageFilter.java:105)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.springframework.boot.web.servlet.support.ErrorPageFilter.doFilter(ErrorPageFilter.java:123)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\n	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\n	org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\n	org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\n	org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\n	org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\n	org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\n	org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\n	org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:624)\n	org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\n	org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\n	org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\n	org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:861)\n	org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1455)\n	org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	java.lang.Thread.run(Thread.java:748)', '2019-05-24 17:55:36', '系统', '1');
INSERT INTO `sys_action_log` VALUES ('1206', '用户登录', '2', '0:0:0:0:0:0:0:1', 'com.chenwt.admin.system.controller.LoginController', 'login', null, null, '后台登录成功', '2019-05-24 18:24:06', '超级管理员', '1');
INSERT INTO `sys_action_log` VALUES ('1207', '用户登录', '2', '0:0:0:0:0:0:0:1', 'com.chenwt.admin.system.controller.LoginController', 'login', null, null, '后台登录成功', '2019-05-24 18:25:57', '超级管理员', '1');
INSERT INTO `sys_action_log` VALUES ('1208', '用户登录', '2', '0:0:0:0:0:0:0:1', 'com.chenwt.admin.system.controller.LoginController', 'login', null, null, '后台登录成功', '2019-05-24 19:03:41', '超级管理员', '1');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `pid` bigint(20) DEFAULT NULL COMMENT '父级ID',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有父级编号',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKifwd1h4ciusl3nnxrpfpv316u` (`create_by`) USING BTREE,
  KEY `FK83g45s1cjqqfpifhulqhv807m` (`update_by`) USING BTREE,
  CONSTRAINT `sys_dept_ibfk_1` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_dept_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '总公司', '0', '[0]', '1', '', '2018-12-02 17:41:23', '2019-02-23 02:41:28', '1', '1', '1');
INSERT INTO `sys_dept` VALUES ('2', '技术部门', '1', '[0],[1]', '1', '', '2018-12-02 17:51:04', '2019-04-27 13:12:46', '1', '1', '1');
INSERT INTO `sys_dept` VALUES ('3', '市场部门', '1', '[0],[1]', '2', '', '2018-12-02 17:51:42', '2019-04-27 13:12:20', '1', '1', '1');
INSERT INTO `sys_dept` VALUES ('4', '研发部门', '1', '[0],[1]', '3', '', '2018-12-02 17:51:55', '2019-04-27 13:12:20', '1', '1', '1');
INSERT INTO `sys_dept` VALUES ('5', '测试部门', '1', '[0],[1]', '4', '', '2018-12-02 17:52:07', '2019-04-27 13:12:20', '1', '1', '1');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `name` varchar(255) DEFAULT NULL COMMENT '字典键名',
  `type` tinyint(4) DEFAULT NULL COMMENT '字典类型',
  `value` text COMMENT '字典键值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKag4shuprf2tjot9i1mhh37kk6` (`create_by`) USING BTREE,
  KEY `FKoyng5jlifhsme0gc1lwiub0lr` (`update_by`) USING BTREE,
  CONSTRAINT `sys_dict_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_dict_ibfk_2` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '数据状态', 'DATA_STATUS', '2', '1:正常,2:冻结,3:删除', '', '2018-10-05 16:03:11', '2018-10-05 16:11:41', '1', '1', '1');
INSERT INTO `sys_dict` VALUES ('2', '字典类型', 'DICT_TYPE', '2', '2:键值对', '', '2018-10-05 20:08:55', '2019-01-17 23:39:23', '1', '1', '1');
INSERT INTO `sys_dict` VALUES ('3', '用户性别', 'USER_SEX', '2', '1:男,2:女', '', '2018-10-05 20:12:32', '2018-10-05 20:12:32', '1', '1', '1');
INSERT INTO `sys_dict` VALUES ('4', '菜单类型', 'MENU_TYPE', '2', '1:一级菜单,2:子级菜单,3:不是菜单', '', '2018-10-05 20:24:57', '2018-10-13 13:56:05', '1', '1', '1');
INSERT INTO `sys_dict` VALUES ('5', '搜索栏状态', 'SEARCH_STATUS', '2', '1:正常,2:冻结', '', '2018-10-05 20:25:45', '2019-02-26 00:34:34', '1', '1', '1');
INSERT INTO `sys_dict` VALUES ('6', '日志类型', 'LOG_TYPE', '2', '1:业务,2:登录,3:系统', '', '2018-10-05 20:28:47', '2019-02-26 00:31:43', '1', '1', '1');
INSERT INTO `sys_dict` VALUES ('11', '客户状态', 'APP_STATUS', '2', '1:在线,2:掉线', '描述客户是否在线状态', '2019-05-05 20:05:43', '2019-05-05 20:05:43', '1', '1', '1');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `mime` varchar(255) DEFAULT NULL COMMENT 'MIME文件类型',
  `size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `md5` varchar(255) DEFAULT NULL COMMENT 'MD5值',
  `sha1` varchar(255) DEFAULT NULL COMMENT 'SHA1值',
  `create_by` bigint(20) DEFAULT NULL COMMENT '上传者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FKkkles8yp0a156p4247cc22ovn` (`create_by`) USING BTREE,
  CONSTRAINT `sys_file_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `pid` bigint(20) DEFAULT NULL COMMENT '父级编号',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有父级编号',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `perms` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型（1:一级菜单,2:子级菜单,3:不是菜单）',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKoxg2hi96yr9pf2m0stjomr3we` (`create_by`) USING BTREE,
  KEY `FKsiko0qcr8ddamvrxf1tk4opgc` (`update_by`) USING BTREE,
  CONSTRAINT `sys_menu_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_menu_ibfk_2` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '菜单管理', '2', '[0],[2]', '/system/menu/index', 'system:menu:index', '', '2', '3', '', '2018-09-29 00:02:10', '2019-02-24 16:10:40', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('2', '系统管理', '0', '[0]', '#', '#', 'fa fa-cog', '1', '2', '', '2018-09-29 00:05:50', '2019-02-27 21:34:56', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('3', '添加', '1', '[0],[2],[1]', '/system/menu/add', 'system:menu:add', '', '3', '1', '', '2018-09-29 00:06:57', '2019-02-24 16:12:59', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('4', '角色管理', '2', '[0],[2]', '/system/role/index', 'system:role:index', '', '2', '2', '', '2018-09-29 00:08:14', '2019-02-24 16:10:34', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('5', '添加', '4', '[0],[2],[4]', '/system/role/add', 'system:role:add', '', '3', '1', '', '2018-09-29 00:09:04', '2019-02-24 16:12:04', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('6', '主页', '0', '[0]', '/index', 'index', 'layui-icon layui-icon-home', '1', '1', '', '2018-09-29 00:09:56', '2019-02-27 21:34:56', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('7', '用户管理', '2', '[0],[2]', '/system/user/index', 'system:user:index', '', '2', '1', '', '2018-09-29 00:43:50', '2019-04-05 17:43:25', '1', '2', '1');
INSERT INTO `sys_menu` VALUES ('8', '编辑', '1', '[0],[2],[1]', '/system/menu/edit', 'system:menu:edit', '', '3', '2', '', '2018-09-29 00:57:33', '2019-02-24 16:13:05', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('9', '详细', '1', '[0],[2],[1]', '/system/menu/detail', 'system:menu:detail', '', '3', '3', '', '2018-09-29 01:03:00', '2019-02-24 16:13:12', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('10', '修改状态', '1', '[0],[2],[1]', '/system/menu/status', 'system:menu:status', '', '3', '4', '', '2018-09-29 01:03:43', '2019-02-24 16:13:21', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('11', '编辑', '4', '[0],[2],[4]', '/system/role/edit', 'system:role:edit', '', '3', '2', '', '2018-09-29 01:06:13', '2019-02-24 16:12:10', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('12', '授权', '4', '[0],[2],[4]', '/system/role/auth', 'system:role:auth', '', '3', '3', '', '2018-09-29 01:06:57', '2019-02-24 16:12:17', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('13', '详细', '4', '[0],[2],[4]', '/system/role/detail', 'system:role:detail', '', '3', '4', '', '2018-09-29 01:08:00', '2019-02-24 16:12:24', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('14', '修改状态', '4', '[0],[2],[4]', '/system/role/status', 'system:role:status', '', '3', '5', '', '2018-09-29 01:08:22', '2019-02-24 16:12:43', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('15', '编辑', '7', '[0],[2],[7]', '/system/user/edit', 'system:user:edit', '', '3', '2', '', '2018-09-29 21:17:17', '2019-02-24 16:11:03', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('16', '添加', '7', '[0],[2],[7]', '/system/user/add', 'system:user:add', '', '3', '1', '', '2018-09-29 21:17:58', '2019-02-24 16:10:28', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('17', '修改密码', '7', '[0],[2],[7]', '/system/user/pwd', 'system:user:pwd', '', '3', '3', '', '2018-09-29 21:19:40', '2019-02-24 16:11:11', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('18', '权限分配', '7', '[0],[2],[7]', '/system/user/role', 'system:user:role', '', '3', '4', '', '2018-09-29 21:20:35', '2019-02-24 16:11:18', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('19', '详细', '7', '[0],[2],[7]', '/system/user/detail', 'system:user:detail', '', '3', '5', '', '2018-09-29 21:21:00', '2019-02-24 16:11:26', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('20', '修改状态', '7', '[0],[2],[7]', '/system/user/status', 'system:user:status', '', '3', '6', '', '2018-09-29 21:21:18', '2019-02-24 16:11:35', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('21', '字典管理', '2', '[0],[2]', '/system/dict/index', 'system:dict:index', '', '2', '5', '', '2018-10-05 00:55:52', '2019-05-18 21:18:24', '1', '1', '3');
INSERT INTO `sys_menu` VALUES ('22', '字典添加', '21', '[0],[2],[21]', '/system/dict/add', 'system:dict:add', '', '3', '1', '', '2018-10-05 00:56:26', '2019-05-18 21:18:25', '1', '1', '3');
INSERT INTO `sys_menu` VALUES ('23', '字典编辑', '21', '[0],[2],[21]', '/system/dict/edit', 'system:dict:edit', '', '3', '2', '', '2018-10-05 00:57:08', '2019-05-18 21:18:24', '1', '1', '3');
INSERT INTO `sys_menu` VALUES ('24', '字典详细', '21', '[0],[2],[21]', '/system/dict/detail', 'system:dict:detail', '', '3', '3', '', '2018-10-05 00:57:42', '2019-05-18 21:18:24', '1', '1', '3');
INSERT INTO `sys_menu` VALUES ('25', '修改状态', '21', '[0],[2],[21]', '/system/dict/status', 'system:dict:status', '', '3', '4', '', '2018-10-05 00:58:27', '2019-05-18 21:18:25', '1', '1', '3');
INSERT INTO `sys_menu` VALUES ('26', '行为日志', '2', '[0],[2]', '/system/actionLog/index', 'system:actionLog:index', '', '2', '6', '', '2018-10-14 16:52:01', '2019-02-27 21:34:15', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('27', '日志详细', '26', '[0],[2],[26]', '/system/actionLog/detail', 'system:actionLog:detail', '', '3', '1', '', '2018-10-14 21:07:11', '2019-02-27 21:34:15', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('28', '日志删除', '26', '[0],[2],[26]', '/system/actionLog/delete', 'system:actionLog:delete', '', '3', '2', '', '2018-10-14 21:08:17', '2019-02-27 21:34:15', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('30', '开发中心', '0', '[0]', '#', '#', 'fa fa-gavel', '1', '4', '', '2018-10-19 16:38:23', '2019-05-18 21:17:48', '1', '1', '3');
INSERT INTO `sys_menu` VALUES ('31', '代码生成', '30', '[0],[30]', '/dev/code', '#', '', '2', '1', '', '2018-10-19 16:39:04', '2019-05-18 21:17:48', '1', '1', '3');
INSERT INTO `sys_menu` VALUES ('125', '表单构建', '30', '[0],[30]', '/dev/build', '#', '', '2', '2', '', '2018-11-25 16:12:23', '2019-05-18 21:17:48', '1', '1', '3');
INSERT INTO `sys_menu` VALUES ('136', '部门管理', '2', '[0],[2]', '/system/dept/index', 'system:dept:index', '', '2', '4', '', '2018-12-02 16:33:23', '2019-02-24 16:10:50', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('137', '添加', '136', '[0],[2],[136]', '/system/dept/add', 'system:dept:add', '', '3', '1', '', '2018-12-02 16:33:23', '2019-02-24 16:13:34', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('138', '编辑', '136', '[0],[2],[136]', '/system/dept/edit', 'system:dept:edit', '', '3', '2', '', '2018-12-02 16:33:23', '2019-02-24 16:13:42', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('139', '详细', '136', '[0],[2],[136]', '/system/dept/detail', 'system:dept:detail', '', '3', '3', '', '2018-12-02 16:33:23', '2019-02-24 16:13:49', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('140', '改变状态', '136', '[0],[2],[136]', '/system/dept/status', 'system:dept:status', '', '3', '4', '', '2018-12-02 16:33:23', '2019-02-24 16:13:57', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('146', '数据接口', '30', '[0],[30]', '/dev/swagger', '#', '', '2', '3', '', '2018-12-09 21:11:11', '2019-05-18 21:17:48', '1', '1', '3');
INSERT INTO `sys_menu` VALUES ('159', '业务管理', '0', '[0]', '#', '#', 'fa fa-server', '1', '3', '', '2019-05-05 00:02:18', '2019-05-05 00:02:18', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('160', '客户管理', '159', '[0],[159]', '/business/appInfo/index', 'business:appInfo:index', '', '2', '1', '客户管理页面', '2019-05-06 14:10:19', '2019-05-06 14:10:19', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('161', '指令管理', '159', '[0],[159]', '/business/appCommand/index', 'business:appCommand:index', '', '2', '2', '指令管理页面', '2019-05-06 14:10:19', '2019-05-06 14:10:19', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('162', '响应管理', '159', '[0],[159]', '/business/appResponse/index', 'business:appResponse:index', '', '2', '3', '响应管理页面', '2019-05-06 14:10:19', '2019-05-06 14:10:19', '1', '1', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '角色名称（中文名）',
  `name` varchar(255) DEFAULT NULL COMMENT '标识名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKdkwvv0rm6j3d5l6hwsy2dplol` (`create_by`) USING BTREE,
  KEY `FKrouqqi3f2bgc5o83wdstlh6q4` (`update_by`) USING BTREE,
  CONSTRAINT `sys_role_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_role_ibfk_2` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '', '2018-09-29 00:12:40', '2019-01-18 21:09:51', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('2', '开发组', 'group', '', '2018-09-30 16:04:32', '2019-04-28 00:10:00', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('3', '用户组', 'group1', '', '2018-09-30 16:24:20', '2019-05-18 22:58:25', '1', '1', '1');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `FKf3mud4qoc7ayew8nml4plkevo` (`menu_id`) USING BTREE,
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`),
  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('2', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('2', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('2', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '26');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '136');
INSERT INTO `sys_role_menu` VALUES ('1', '137');
INSERT INTO `sys_role_menu` VALUES ('1', '138');
INSERT INTO `sys_role_menu` VALUES ('1', '139');
INSERT INTO `sys_role_menu` VALUES ('1', '140');
INSERT INTO `sys_role_menu` VALUES ('3', '159');
INSERT INTO `sys_role_menu` VALUES ('3', '160');
INSERT INTO `sys_role_menu` VALUES ('3', '161');
INSERT INTO `sys_role_menu` VALUES ('3', '162');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '密码盐',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `picture` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别（1:男,2:女）',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKb3pkx0wbo6o8i8lj0gxr37v1n` (`dept_id`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', '140b3a6f99e768a98990984091b7543eaf853e57e2bdac43e323797250d637ea', 'h6i0vW', '2', '', '1', '10086@163.com', '10086', '', '2018-08-09 23:00:03', '2019-05-24 18:25:46', '1');
INSERT INTO `sys_user` VALUES ('2', 'chenwt', '泡泡哥', '5d383ad0ee9dbe996f378d3b9c3dd067556d2d3201dd286c1d7361d4b9f21675', 'N38WyF', '2', null, '1', '1008612@qq.com', '1008612', '', '2018-09-30 16:25:22', '2019-05-18 22:55:24', '1');
INSERT INTO `sys_user` VALUES ('3', 'wfk', 'wfk', 'e6de88662c292fb7873f94ff12b933b8da435f330e97eb41faf4a6d31d8a2ce7', 'RG45xO', '2', null, '1', '', '13824445194', '', '2019-05-18 22:47:20', '2019-05-18 23:46:22', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKhh52n8vd4ny9ff4x9fb8v65qx` (`role_id`) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('2', '3');
INSERT INTO `sys_user_role` VALUES ('3', '3');
