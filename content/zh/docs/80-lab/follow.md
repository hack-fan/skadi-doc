---
title: '关注社交账号'
linkTitle: '关注社交账号'
url: 'docs/lab/follow'
weight: 81
description: >
    在你的各处社交账号有新回复时提醒你。
---

玩具玩具，在V站有新回复或者关注的人发表新内容时在微信提醒你

迫于自己的需要，做了这么个功能：

* 当你自己的帖子有新回复的时候
* 当关注的人发表新帖子，回复别的帖子，发时间轴的时候

在 `LetServerRun` 公众号提醒你。

规则是：早8点到晚10点，每个小时检查一次，有消息则提醒没消息则不提醒。另外，因为是基于公开内容检查的，
自己或者目标必须在个人页面没有隐藏发布的帖子才行。还有，自己在别人的帖子被 At 也不会提醒。

开通方法，扫描文末二维码关注 `LetServerRun`，在其中输入命令如下：

```shell
# 绑定自己的账号
link v2ex 你的V站名字
# 关注特别的人
follow v2ex 他的V站名字
# 比如这就是关注站长
follow v2ex Livid
# 取消绑定自己
unlink v2ex
# 取消关注别人
unfollow v2ex 已经关注的V站名字
```

其实这个功能是考虑汇聚各个站点的消息，不用自己去看，V站天天上反而不太需要，所以大家帮忙投票一下后边做的顺序吧：

知乎，掘金，简书，SegmentFault，B站  
Github, Hacker News, Quora, Medium  
多选哦，也欢迎提名列表里没有的，回复在帖子让我可以参考就好

最后，LetServerRun 的暗号还在，输入 v2ex 就可以加一个资源。如果实在不够，也可以把 poster 得到的二维码回帖子里互助～

不过我不建议关注太多人，每个小时要是都有提醒也很烦啊，希望只偶然给你最重要的提醒就好了。

![LetServerRun](https://static.crandom.com/hackfan/letserverrun.jpg)
