#教學文件

##Step 1:建置Docker環境

### Mac Developer
```
##Install Docker For Mac:
https://store.docker.com/editions/community/docker-ce-desktop-mac
```
### Ubuntu Developer
```
##Install Docker For Ubuntu:
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo systemctl status docker
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG
sudo usermod -aG docker username
```
### Windows Developer
```
#Install Docker For Windows:
https://www.virtualbox.org/wiki/Downloads #download VirtualBox
https://hub.docker.com/editions/community/docker-ce-desktop-windows
```

##Step 2:加入Laradock

```
#在Laravel專案下利用git submodule指令加入Laradock
cd [laravel_project_path]
git submodule add --force https://github.com/JamesShieh0510/modular-platform-dockerized-development-environment.git
```

##Step 3:初始化環境

```
#初始化完成後，Laravel專案目錄下會有一個
#modular-platform-dockerized-development-environment資料夾
#移動至該資料夾下，利用init.sh初始化工作環境
cd modular-platform-dockerized-development-environment
. ./init.sh
```

##其他操作


終止所有Docker Container
```
. ./stop.sh 
```
啟動並完成開發環境部署
```
. ./start.sh
```
重新載入資料庫（更新SQL時使用)
```
../update-database.sh
```
更新submodule
```
git submodule foreach --recursive git pull origin master
```

