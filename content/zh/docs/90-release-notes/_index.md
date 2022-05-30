---
title: '更新说明'
linkTitle: '更新说明'
url: 'docs/release-notes'
weight: 9
description: >
    我要写一份大家能看得懂的更新说明。
---

## 2022年5月30日

新增功能

* 现在向公众号发送随意一个字符，会被认为是维持对话，不会得到任何回应。

改动

* 默认 Agent `skadi-agent-shell` 增加了 arm64 版本。

## 2021年8月19日

新增功能

* 增加了一个官方的 Github Action

改动

* 默认 Agent `skadi-agent-shell` 检查任务间隔从1分钟降低到10秒。
* Go SDK `skadigo` 默认检查任务间隔从1分钟降低到30秒。

## 2021年6月11日

改动

* 模版消息配额从每小时5次，修改为每天100次，以应对有时候的爆发需求。

## 2021年5月30日

修复

* Agent 版本的 Auto 有时有问题，在发现报错日志之后已经修复了。但是 Agent 调用发消息报的所有错都无法反馈给调用者，还需要想办法解决。

## 2021年5月11日

改动

* Go SDK `skadigo` 支持传入 Debug 参数，此模式下不发送任何网络请求，没有 token 也不会报错。

## 2021年4月29日

新增功能

* 新增 POST `/agent/job/delayed` 接口，让 Agent 可以给自己发延迟任务了。
* Go SDK `skadigo` 同步增加了目前所有支持的接口。

## 2021年4月27日

新增功能

* 新增 `/agent/message/auto` 接口，让 Agent 也能使用自动适配发送方式的消息。
* 新增 `/agent/job/add` POST 接口，让 Agent 可以给别的 Agent 发送任务了。

改动

* Break API: 所有的 Agent 发送消息的接口统一了前缀为 `/agent/message/`

## 2021年4月25日

新增功能

* 新增 `/message/auto` 系列接口，在可以用微信文本消息的时候用文本消息，如果不行就用模版消息。
* 新增 `/job/add` 接口，可以调用 API 向 Agent 发 Job 了， CI 利器。

## 2021年4月23日

新增功能

* 新增实验室，里边包含实验性的功能

改动

* 现在所有的命令关键字不区分大小写了，输入法让首字母大写了也没关系。
* 各种超长错误提示更加友好了。
* 统一资源配额，永久资源类的公用一个配额。并行度类的会共享同一个系数。

## 2021年4月12日

新增功能

* Agent上线和离线事件现在会在公众号通知了

改动

* 现在会校验各种输入的信息了，不符合要求会有更友好的错误提示。
* [Golang SDK](https://github.com/hack-fan/skadigo)被重构，现在handler可以得到任务id，用以阶段汇报
* [开源Agent](https://github.com/hack-fan/skadi-agent-shell)现在在token错误时会退出并不再重启
* [开源Agent](https://github.com/hack-fan/skadi-agent-shell)现在在任务执行失败时会返回错误输出

## 2021年4月10日 初始版本

把这个版本当作初始版本吧，目前的功能有：

* 通过公众号进行 Agent 管理
* 通过公众号给 Agent 发布任务
* Agent 任务相关所有接口
* Agent [Golang SDK](https://github.com/hack-fan/skadigo)
* 一个通用版的 [Agent](https://github.com/hack-fan/skadi-agent-shell)
* 用户发送公众号通知相关接口
* Agent 发送通知相关接口
