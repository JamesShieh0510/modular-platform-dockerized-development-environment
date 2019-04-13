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
git submodule add --force https://github.com/JamesShieh0510/laradock.git
```

##Step 3:啟動Laradock

```
cd laradock
. ./start.sh
```

###補充

```
#停止docker
. ./stop.sh 
#重新載入資料庫
../update-database.sh
```

