---
title: 'Agent简介'
linkTitle: 'Agent简介'
url: 'docs/basic/agent'
weight: 42
description: >
    关于 Agent 的基本信息。
---

除了在服务器上调用我们的 API 给公众号发通知，Server饭 更有用的功能是把这个过程反过来，
在公众号输入文字控制服务器的行为，您只要一次配置，以后便有个随身的控制台了。

## 什么是 Agent

Agent 是一个概念，它是帮你处理你在公众号中输入的指令的一个程序。

它可以在服务器，在PC，在路由器，在智能设备中。它可以用任何语言写成。
它甚至可以没有实体，只需要在你的服务中调用 API ，就相当于完成了 Agent 的功能。

采取这种 Agent 拉取并执行命令的模式，是为了绝对的安全。你的 Agent 只会执行你允许的动作。  
Server饭 的云服务不会主动访问你的服务器，这也带来了内网穿透的功能，你可以任意使用代理。

## 怎么写一个 Agent

这里是 [Agent API](/ref/#tag/Agent)

写一个 Agent 只需要按如下逻辑调用这三个 API 就好了：

1. 每分钟调用一次 [接收Job](/ref/#operation/agent-job-get)
2. 如果返回结果是 204，证明没有 Job 需要执行。如果是 200，则解析出 Job 去执行它。
3. 执行完成之后，调用 [成功](/ref/#operation/agent-jobs-succeed-put) 或 [失败](/ref/#operation/agent-jobs-fail-put) 修改 Job 状态，这时你在公众号中会收到相应的通知。

## 能更方便一点吗？

我们正在添加各个语言的 SDK，这样写起来会更方便，目前只有 [Go](https://github.com/hack-fan/skadigo) 的

欢迎为你喜欢的语言写 SDK

## 有例子吗？

同样的，目前还只有 Go 的例子，后续会在 SDK 完成后添加 python nodejs java php 等语言。

[执行shell命令的例子](https://github.com/hack-fan/skadi-agent-shell)

[管理 Docker Swarm 的例子](https://github.com/hack-fan/skadi-agent-docker)

## 能再方便一点吗？

我们会写很多现成的 Agent 供大家使用。目前写好了一个，它可以通过简单配置就启动在 Linux 当中帮你执行指定的命令。

比如重启服务之类的常用需求，使用这个就完全够了。详情见下一节。
