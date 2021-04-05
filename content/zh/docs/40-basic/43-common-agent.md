---
title: '一个通用Agent'
linkTitle: '一个通用Agent'
url: 'docs/basic/common-agent'
weight: 43
description: >
    可以轻松的部署在服务器上，帮你根据配置文件执行命令，使用 Golang 编写。
---

如果只是想在服务器上执行简单的命令，使用我们开源的这个通用 Agent 就够了。

它的源代码在： [https://github.com/hack-fan/skadi-agent-shell](https://github.com/hack-fan/skadi-agent-shell)

命令和服务的名字叫 skadi , 和我们的开源项目保持一致。

## 安装

### Debian/Ubuntu

第一步，增加软件源

```bash
curl -1sLf \
  'https://dl.cloudsmith.io/public/hackfan/skadi/setup.deb.sh' \
  | sudo -E bash
```

如果你本身用的 root 用户，请去掉命令中的 sudo

第二步，更新源，安装 skadi

```bash
apt update
apt install skadi
```

这里安装就完成了，skadi 在安装完成后并**不会立即启动**，因为还需要配置 Agent Token，
请参考后续的配置环节。

ps. 如果你对第一步的自动脚本不放心，那么可以用如下步骤手动增加软件源：

```bash
apt-get install -y debian-keyring  # debian only
apt-get install -y debian-archive-keyring  # debian only
apt-get install -y apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/hackfan/skadi/gpg.75A5AACF21FC017E.key' | apt-key add -
curl -1sLf 'https://dl.cloudsmith.io/public/hackfan/skadi/config.deb.txt?distro=ubuntu&codename=xenial' > /etc/apt/sources.list.d/hackfan-skadi.list
apt-get update
```

**注意**：你需要更改上述命令中的 **ubuntu** 和 **xenial** 为你的发行版和版本。

ps2. 卸载软件源

在使用 apt 卸载 skadi 之后，你也许还想卸载软件源，执行如下命令即可卸载干净：

```bash
rm /etc/apt/sources.list.d/hackfan-skadi.list
apt-get clean
rm -rf /var/lib/apt/lists/*
apt-get update
```

### Redhat/CentOS/Amazon/Fedora/SUSE

第一步，增加软件源

```bash
curl -1sLf \
  'https://dl.cloudsmith.io/public/hackfan/skadi/setup.rpm.sh' \
  | sudo -E bash
```

如果你本身用的 root 用户，请去掉命令中的 sudo

第二步，更新源，安装 skadi，如果是 Fedora或SUSE用户，自行替换命令为 dnf/zypper

```bash
yum install skadi
```

这里安装就完成了，skadi 在安装完成后并**不会立即启动**，因为还需要配置 Agent Token，
请参考后续的配置环节。

ps. 如果你对第一步的自动脚本不放心，那么可以用如下步骤手动增加软件源，这里仅列出 Redhat/CentOS 脚本：

```bash
yum install yum-utils pygpgme
rpm --import 'https://dl.cloudsmith.io/public/hackfan/skadi/gpg.75A5AACF21FC017E.key'
curl -1sLf 'https://dl.cloudsmith.io/public/hackfan/skadi/config.rpm.txt?distro=el&codename=7' > /tmp/hackfan-skadi.repo
yum-config-manager --add-repo '/tmp/hackfan-skadi.repo'
yum -q makecache -y --disablerepo='*' --enablerepo='hackfan-skadi'
```

**注意**：你需要更改上述命令中的 **el** 和 **7** 为你的发行版和版本。

ps2. 卸载软件源

在使用 apt 卸载 skadi 之后，你也许还想卸载软件源，执行如下命令即可卸载干净：

```bash
rm /etc/yum.repos.d/hackfan-skadi.repo
rm /etc/yum.repos.d/hackfan-skadi-source.repo
```

## 配置

配置文件在 `/etc/skadi/skadi.yml`
按照注释自行修改即可。

```yaml
# 调试模式，打开可以看到更多日志，使用 journalctl -u skadi 查看日志
debug: false
# 可以直接填写token到这里，或者用 skadi TOKEN 命令去写入
token:
# shortcuts 将一个单词精确的翻译为一条命令
# short: 你在公众号输入的消息
# dir: 命令的工作目录，可选。有的命令不需要工作目录就不填。
# cmd: 精确的命令。
shortcuts:
  - short: date
    cmd: "date --rfc-3339=second"
  - short: lsroot
    dir: /
    cmd: ls
# commands 是一个命令白名单，这里列出命令，在公众号使用时可以随意加参数。
# dir: 命令的工作目录，可选。有的命令不需要工作目录就不填。
# prefix: 允许的命令，比如这里允许free，实际使用时可以输入 free -k
commands:
  - prefix: free
# templates 是一个模板引擎，可以预留参数，调用时只用输入参数
# name: 调用时接在 Agent 名称后的第一个词
# dir: 命令的工作目录，可选。有的命令不需要工作目录就不填。
# temp: 模板，用的 golang 的模板引擎
# 示例 name:"Hi" temp:"echo I am not %s!"
# 在公众号输入 [Hi 傻瓜] 会收到结果 [I am not 傻瓜!]
templates:
  - name: Hi
    temp: "echo I am not %s!"
```

修改完配置文件后，用命令重启服务，它们就生效了。

```bash
sudo systemctl restart skadi
```

## 一些示例

重新部署一个 docker stack,
发送`xxx 重启`就会重启这个 stack

```yaml
shortcuts:
    - short: 重启
      # 你的 compose file 的位置
      dir: "/root/swarm/"
      # docker-compose.yml 是你的 compose file 名称， api 是你的 stack 名称
      cmd: "docker stack deploy --prune --with-registry-auth -c docker-compose.yml api"
```

如果服务器上有多个 stack ，我们可以把配置文件和 stack 做成同名，然后为了使用方便，可以写一个shell，`up.sh`

```bash
docker stack deploy --prune --with-registry-auth -c $1.yml $1
```

然后用模板功能，最终效果是发送 `xxx up api` 就会重启 api 这个stack

```yaml
templates:
    - name: up
      temp: "sh up.sh %s"
      dir: "/root/swarm"
```
