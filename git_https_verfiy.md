# 配置git 通过非可信https获取项目时不提示密码的方法：
    参考：http://www.cnblogs.com/ballwql/p/3462104.html
1. 添加 ~/.git-credentials，内容为:
    https://{username}:{password}@github.com
    例如：
    https://imyyan:sys123123@192.168.1.227
2.  添加配置项 git config --global credential.helper store

3. 添加不验证证书的配置：参考：http://blog.csdn.net/officercat/article/details/39989837
    git config --global http.sslVerify false  

