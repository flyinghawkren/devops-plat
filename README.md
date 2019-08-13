# devops-plat

## 准备资源
### 下载安装vagrant和VirtualBox（推荐5.2.32版本），然后安装相关plugins
vagrant plugin install vagrant-vbguest vagrant-scp

### 从如下链接下载k8s.box
https://pan.baidu.com/s/1q2gKa70DZvpo_qE1HljqBg

用如下命令导入Kubernetes基础box：
vagrant box add --force --name k8s-1.15.2 ./k8s.box

## 搭建Kubernetes集群
进入Vagrantfile所在目录，创建集群：
cd cluster && vagrant up
拷贝集群连接配置到本地：
vagrant scp devops.master:~/.kube/config ./
## 本机安装kubectl

### Linux & Mac
mkdir ~/.kube && cp ./config ~/.kube/ && kubectl get nodes

### Windows

## 部署其它应用
kubectl create -f deployment.yaml
