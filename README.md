# ManageSystem
<h1>城市信息管理系统</h1><br>


# 继上次外勤管理系统后的第二个JavaEE项目
此次前后端都是独自完成,但前端布局依旧沿用前一项目的布局，使用bootstrap,毕竟审美有点缺乏<br>
整体依然是Spring MVC Spring  Mybatis Maven管理,另外有用log4j，但只是用作操作记录。
城市信息管理这次相比上一项目，主要突出的有用户在线查看，以及操作记录和数据库备份还原、休息日设定、案件限时<br>
基本的都有用户信息管理、角色权限管理、部件和事件分类管理、以及案件查看
还有一些通用的查询，这个系统主要是给管理员进行的，所以没有工作流模块，但有做权限处理，部分角色创建参考的。<br>


注释写的更加规范点，不过对于service和mapper很少去写注释了。有部分弃用函数未删除，另外前端写的更加规范。<br>
异常处理本来有两种打算，一是直接catch但是不做处理，这样可以在前端使用重定向传递结果参数，前端就可以弹窗显示操作成功与否，感觉这样体验会好一点。<br>
二是在service层统一捕获后封装成runtimeexception抛出,然后使用spring的SimpleMappingExceptionResolver直接在错误页面显示信息，效果也不错。<br>
个人感觉一用户体验好一点，但是二可以具体显示错误信息，也不错，这个项目都有写，但大多采用二<br>
角色用户之类的权限还是使用的interceptor，另外还用了HttpSessionListener进行用户在线离线处理。<br>
本来还有需求是对用户进行实时监控，个人想法是可以类似于在线离线，在用户字段加入所处状态，当进入某个系统模块就对应修改，应该可以使用AOP？但是这样会频繁进行数据库数据更新，感觉真正的工程应该不是这样做的，就没有进行这个功能的开发，还是知识量太少，比如最近才看到有shiro可以进行权限控制。<br>
另外需求有进行用户操作记录，第一想法是使用AOP在关键操作模块时进行数据库操作记录，但是不同的记录语句也不同，模块太多要进行太多修改，然后了解到有log4j可以写入数据库，但是也不是这么简单。。。。。因为我要记录对应的用户名和id，还要记录操作信息，后来利用log4j的MDC解决了这个问题，我记录的操作是用的mybatis的sql语句,这样操作内容就不用自己写，可以直接进入数据库，但mybatis的sql语句运行在log4j会成三条信息，一是执行语句，二是执行参数，三是执行结果，所以一个操作是三条插入数据库，有点不完美吧。。。。。我只针对mapper的update delete insert之类的改变数据库信息的操作进行记录，具体配置在log4j配置文件里面<br>

数据库备份功能实现是把数据库还原和备份操作写在service层，上传和下载会分别在目录的assets/db创建对应文件并写入和写进返回。<br>
Spring事务管理直接配置在spring-context.xml,我写的service一般是单操作，对于事务好像也不用写出来，当我没说吧，事务管理我还有待学习<br>


# 具体功能也不说明了，毕竟说这么多，下面看图吧。

#注意jdbc和log4j都有数据库配置信息要改

![1](https://github.com/Neocou/ManageSystem/blob/master/pic/1.PNG)
![2](https://github.com/Neocou/ManageSystem/blob/master/pic/2.PNG)
![3](https://github.com/Neocou/ManageSystem/blob/master/pic/3.PNG)
![11](https://github.com/Neocou/ManageSystem/blob/master/pic/11.PNG)
![17](https://github.com/Neocou/ManageSystem/blob/master/pic/17.PNG)
![18](https://github.com/Neocou/ManageSystem/blob/master/pic/18.PNG)
![19](https://github.com/Neocou/ManageSystem/blob/master/pic/19.PNG)
![20](https://github.com/Neocou/ManageSystem/blob/master/pic/20.PNG)
![21](https://github.com/Neocou/ManageSystem/blob/master/pic/21.PNG)
![22](https://github.com/Neocou/ManageSystem/blob/master/pic/22.PNG)


<h2>图片好像多了,就这样吧啊，看着不顺眼再改，编辑文档真麻烦</h2>
# -----------更新部分内容---------
更改c3p0为druid数据池，感觉好用一点，还自带监控功能，这部分功能配置在web.xml。<br>
加入swagger-ui,这是我在公司实习发现的前端和后端协同工作的一个很好用的东西，不过我的个人项目不是restful,所以效果不是很好，后面有时间把项目改成restful的。
