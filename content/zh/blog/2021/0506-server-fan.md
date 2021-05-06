---
title: 'Server饭-用API发微信通知或用微信控制你的服务器'
date: 2021-05-06
author: Muninn
slug: 'server-fan-intro'
tags: ['Go','ServerFan']
---

大家好，这是又一个向微信发通知的服务。这样的服务其实不少，一定是有新的特色我才好意思来介绍。
**Server饭**不仅可以给微信发通知，还能反过来用微信和服务器产生交互。大概像下面这样：

![intro image](https://static.crandom.com/hackfan/intro.png)

好了，还是先介绍基础功能吧。

## 主动发送通知

给自己发消息是最常用的功能。  
拉到文末扫码关注服务号，或者在微信搜索 "LetServerRun" 这个服务号关注。  
在服务号发送 `token` 命令查看自己的用户 token 。  
使用用户 token，您就可以用 API 向公众号发警告消息了：

```bash
curl "https://api.letserver.run/message/info?token=YOUR-TOKEN&msg=hello"
```

这个 GET 接口是为了调试和轻量使用场景的，在程序中使用的话有[一系列接口](https://letserver.run/ref/)和SDK。
