普通用户登录：
（1）将Defatult.aspx设置为起始页.
（2）首先出现的是登录画面，用户名是“admin”，密码是“admin@pass”.
（3）如果不使用上述登录用户，可通过“新用户注册”链接创建自己的用户。
（4）登录后可通过右上角的“修改密码”链接修改当前用户的登录密码。

如果要在登录中进行角色验证。
（1）首先根据书中的介绍创建角色
（2）修改Web.Config文件中的“<authorization>”节点为类似下面的内容
   <allow roles="管理员" />
   <deny roles="普通用户" />
（3）查看Web.Config文件中角色管理是否开启。“  <roleManager enabled="true" />”
如果不需要角色验证，可将这个设置更改为“false”.
