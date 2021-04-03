---
title: '快速开始'
linkTitle: '快速开始'
url: 'docs/getting-started'
weight: 2
description: >
    先最快的用起来，然后再慢慢配置。
---

## 快速上手

在关注服务号`LetServerRun`之后，通过命令`agent add 它的名字`增加一个 Agent。  
通过`status`命令，可以看到你加的这个 Agent 在离线状态。一个 Agent 如果三分钟以上没有心跳就会离线。  
现在，我们根据用途，可以有多种方式部署一个 Agent，这里先使用一个 demo，它可以帮你执行配置文件中定义的命令。

项目地址： github.com/hack-fan/skadi-agent-shell

在 Releases 里边有编译好的文件，可以下载到你的 linux 服务器，按照 Readme 中的帮助启动它。

下面我们先说说发通知的功能，再继续讲各种类型的 Agent 。

## 主动发送通知

除了您在公众号发命令让 Agent 代为执行并返回结果这一功能，我们当然还有让您主动调用 API 往公众号发通知的功能。您可以在服务号发送 `token` 命令查看自己的 token 。

使用用户 token，您就可以用 API 向公众号发警告消息了：

```http
GET https://api.letserver.run/message/info?token=YOUR-TOKEN&msg=hello
```

这个 GET 接口是为了调试和轻量使用场景的，在程序中使用的话有更完善的 POST 接口，未来 SDK 也会支持主动发消息。
