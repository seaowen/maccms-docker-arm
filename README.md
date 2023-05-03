# maccms docker arm镜像

基于MACCMSv10版本修改 采用Sqlite3数据库 支持docker一键部署，仅供学习用途，请勿公网搭建，自带类似于影视先生的模板。
## docker

```sh
docker run -itd --name maccms --restart always -v /mnt/docker/maccms:/data -p 8088:8088 bigowen/maccms
```

管理后台 `http://127.0.0.1:8088/admin.php` 用户名密码 `admin` / `admin`

视频 - 播放器 - 导入对应影视资源站提供的播放器代码

采集 - 自定义接口 添加影视资源站的源
