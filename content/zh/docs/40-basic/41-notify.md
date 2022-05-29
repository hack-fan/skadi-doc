---
title: '给自己发送通知'
linkTitle: '发送通知'
url: 'docs/basic/notify'
weight: 41
description: >
    轻松给自己的微信发送通知。
---

## 获取你的 Token

调用用户级别的功能，需要`用户 Token`  
向公众号发送 `token` 就可以得到自己的用户 Token

## 发送消息

现在调用发送消息的 API 就可以往公众号发送消息了

```text
GET https://api.letserver.run/message/info?token=YOUR-TOKEN&msg=hello
```

用 curl 命令就是这样

```bash
curl "https://api.letserver.run/message/info?token=YOUR-TOKEN&msg=hello"
```

## 消息类型

目前有四个消息接口，它们的区别如下：

* info 公众号模板消息，提醒，默认为蓝色
* warning 公众号模板消息，警告，默认为红色
* text 利用公众号客服消息直接发文本，每次和公众号互动后有20条额度
* auto 先尝试发送 text ，如果失败则改用 info 接口

## GET 和 POST

GET 版本的接口是为了调试和简单的使用的，比如在 CI 脚本中，写起来简单。

POST 版本接口需要把 token 携带在 Authorization Header 中。  
并且还支持自定义颜色等，详情参见[接口文档](/ref)

## User 和 Agent

在接口文档中，除了 User 接口，还有若干 Agent 发消息接口，比如 `/agent/message/info`  
Agent 版本和 User 版本的区别是使用的 Token 不一样。

Agent 版本是为了 Agent 能方便的直接调用，不用再传入 User Token  
另外在发送模板消息时，Agent 版本会标注消息来源。

## 限制

公众号模板消息有每天100条的限制，而纯文本的客服消息，是在你向公众号说话后，会在48小时内有20条发送额度。
每次说话都会重置这个额度。
