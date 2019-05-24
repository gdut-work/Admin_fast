use mysql;
select host, user from user;
-- 因为mysql版本是5.7，因此新建用户为如下命令：
create user app identified by 'app123456';
-- 将xibian数据库的权限授权给创建的xibian用户，密码为xibian123456：
grant all on app.* to app@'%' identified by 'app123456' with grant option;
-- 这一条命令一定要有：
flush privileges;