<div align="center">

# ZYM.skill

> _"先想清楚，再用力。竞争是背景，用户价值才是中心。"_

[![Agent Skills](https://img.shields.io/badge/Agent%20Skills-compatible-blue)](https://github.com/FranklinNexus/zhang-yiming-skills)
[![Runtime](https://img.shields.io/badge/Runtime-Cursor%20%7C%20Claude%20%7C%20Antigravity-lightgrey)](https://github.com/FranklinNexus/zhang-yiming-skills)
[![Focus](https://img.shields.io/badge/Focus-Product%20%7C%20Org%20%7C%20Rationality-orange)](PRINCIPLES.md)

<p align="center">
  <img src="assets/zhang-yiming.jpg" alt="Zhang Yiming / 张一鸣" width="360" />
</p>

<br>

**张一鸣式的产品与组织操作系统。不是成功学摘录，是可运行的理性决策框架。**

<br>

把 **用户价值 · 范式变化 · 延迟满足 · 数据校正直觉 · 组织信息流** 封装成 Agent Skill，  
帮你在「竞品焦虑」「虚荣指标」「情绪化决策」里回到该做什么、怎么建系统。

[为什么更好](#为什么这套-skills-更好) · [看效果](#效果示例) · [安装](#安装) · [蒸馏了什么](#蒸馏了什么) · [FAQ](#faq)

</div>

---

## 为什么这套 Skills 更好

网上也能找到「张一鸣语录 / 字节方法论」类 Skill，但多数是**摘抄或气质模仿**。  
**ZYM.skill** 专注 **决策结构**：

| 场景 | 本仓库会逼问什么 |
| --- | --- |
| 竞品发功能 | 用户真的变好了吗？跟进的代价是什么？ |
| 数据好看 | 哪些是行为指标，哪些是虚荣指标？ |
| 组织变慢 | 信息流哪里堵了？哪些决定该下放？ |
| 个人成长 | 延迟满足是否在「主动准备」，而非拖延？ |

输出固定为：**张一鸣式判断 → 关键变量 → 可能误区 → 下一步**。  
配合 `PLAYBOOK.md` 做产品/组织/理性决策路由，**不扮演张一鸣本人**。

---

## 效果示例

### 问：竞品又发新功能了，团队很慌，我们要不要立刻跟？

```
ZYM 式判断 ❯  竞品是上下文，不是方向盘。

              先问三个问题：
              1）用户真正变好的地方在哪里，跟竞品功能是否同一问题？
              2）这是结构性机会（设备/分发/成本曲线变了）还是短期噪音？
              3）跟进的代价：会牺牲哪条主线的深度？

              如果答不出「跟进了，哪类用户的生活具体变好」，
              那不是在战略响应，是在情绪响应。

              本周：选 10 个真实用户，只问「你最希望我们解决什么」，
              把竞品功能清单从讨论桌撤下来，直到用户证据回来。
```

### 问：数据很好看，但我总觉得产品没有真正创造价值。

```
ZYM 式判断 ❯  指标可以装饰决策，也可以校正决策。

              把指标分成两类写下来：
              - 行为指标：留存、时长、复购、推荐、关键动作完成率
              - 虚荣指标：注册、曝光、媒体报道、内部 OKR 完成度

              如果团队庆祝的是第二类，而第一类没改善，
              你感到「不真实」往往是对的。

              选一个最能代表「用户真的获益」的指标作为 north star，
              其他全部降级为辅助。
```

### 问：公司变大后，创始人什么都想拍板，团队变慢了。

```
ZYM 式判断 ❯  慢，通常是信息流坏了，不是人不够努力。

              检查：
              - 一线信号到决策层要几步？是否被过滤？
              - 反对意见有没有在会前书面出现？
              - 权责是否清楚：谁拥有结果，而不只是执行任务？

              目标不是创始人更忙，而是**更多人能在局部做对的决定**。
              本周只做一件事：画一张「决策地图」，
              标出哪些决定必须中心化、哪些必须下放。
```

> 不扮演张一鸣。用的是**冷静、可测量、以用户为中心**的产品与组织判断法。

---

## 安装

```powershell
git clone https://github.com/FranklinNexus/zhang-yiming-skills.git
cd zhang-yiming-skills
.\scripts\install.ps1 -Platform cursor
```

| 目标 | 命令 |
| --- | --- |
| Claude Code | `.\scripts\install.ps1 -Platform claude` |
| Antigravity | `.\scripts\install.ps1 -Platform antigravity -Scope project -ProjectPath "你的项目路径"` |
| 全平台 | `.\scripts\install.ps1 -Platform all` |

### 使用

```
> 用张一鸣的视角看我们这个产品策略
> 竞品焦虑很严重，帮我拆一下该不该跟
> 这套组织设计信息流哪里堵了？
> 帮我区分虚荣指标和真指标
```

显式触发：`张一鸣` · `Zhang Yiming` · `字节` · `产品策略` · `组织设计` · `延迟满足`

---

## 蒸馏了什么

### 6 条核心原则

| 原则 | 一句话 |
| --- | --- |
| **用户价值优先** | 从外部价值出发，不从内部忙碌出发 |
| **竞争是背景** | 创新与用户才是中心 |
| **慢想快打** | 想清楚再全力执行 |
| **事实与情绪分离** | 事实、判断、情绪、激励分开看 |
| **数据校正直觉** | 用数据改判断，不用数据装饰 |
| **建系统** | 让信息流动，让局部决策变对 |

### 7 维产品体检

用户 · 范式变化 · 机制 · 分发 · 度量 · 组织 · 全球化（如适用）

### 输出形态

```markdown
### 张一鸣式判断
[一句诊断]

### 关键变量
- 用户价值:
- 范式变化:
- 执行系统:

### 可能误区
[...]

### 下一步
[...]
```

详见 [`skills/zhang-yiming/PLAYBOOK.md`](skills/zhang-yiming/PLAYBOOK.md)

---

## 同源系列

| Skill | 仓库 |
| --- | --- |
| [kehan-skills](https://github.com/FranklinNexus/kehan-skills) |
| [paul-graham-skills](https://github.com/FranklinNexus/paul-graham-skills) |
| [sam-altman-skills](https://github.com/FranklinNexus/sam-altman-skills) |
| **zhang-yiming-skills（本仓库）** |

---

## FAQ

### Contributors 显示 Cursor Agent？

历史 commit 曾被 Cursor 自动加上 `Co-authored-by: Cursor <cursoragent@cursor.com>`，GitHub 据此统计第二贡献者；**已从 git 历史删除**。API 现仅 `FranklinNexus`。页面未更新请 **Ctrl+Shift+R** 硬刷新。

---

## 边界说明

- 蒸馏框架，非原文库；不角色扮演；不构成投资或法律建议。
- [`SOURCE_POLICY.md`](SOURCE_POLICY.md)

---

<div align="center">

**ZYM.skill 的价值：在热闹市场里，帮你把决策拉回用户、系统与长期复利。**

</div>
