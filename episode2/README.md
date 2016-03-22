# Spacemacs Rocks （第二季）

在这一季中计划在21天的时间内学习 Emacs 以及 Spacemacs 的使用。从基础安装开始到可以运用到工作生产环节中。为了确保学习质量，请务必完成和理解计划中的每一项学习任务。

## 第一集：准备开始

**内容大纲**

- `00:00 - 01:55` Emacs 的安装
- `02:00 - 10:00` Emacs 基础操作
- `10:00 - 16:00` Emacs 内置功能
- `16:00 - 24:00` 基础 Emacs Lisp
- `24:00 - 34:00` 开始 Hacking ！
- `34:00 - 41:00` 插件管理系统（Company 插件安装及 Mode 介绍）
- `41:00 - 46:00` 基础 Org-mode 使用

视频地址如下

- [优酷视频](http://v.youku.com/v_show/id_XMTUwNjU0MjE0OA==.html)
- [百度网盘](http://pan.baidu.com/s/1gep9DQV)
- [YouTube](https://www.youtube.com/watch?v=0hpVuoyO8_o&feature=youtu.be)

**说在最前面**

如果你第一次听说 Emacs 你可以在[性感的 Emacs（Emacs is Sexy）](http://emacs.sexy/)一文中找到使用它的理由！我相信你一定被它的强大所吸引。

如果你还没有安装 Emacs 可以在[Mac OS X 安装链接](http://emacsformacosx.com/builds)以及 [Window 安装链接](http://emacsbinw64.sourceforge.net/)找到它。

在开始本教程之前请务必先完成 Emacs 提供的官方教程，它可以通过使用 `C-h t`（同时按住 Ctrl 与 h 键，接着按 t 键（t 代表 tutorial）） 在 Emacs 中直接将其打开。

Elisp 是 Emacs 所用的编程语言，你可以在阅读[这篇教程（Learn X in Y Minutes）](https://learnxinyminutes.com/docs/elisp/)后很快的了解它的基础用法。

### 基础操作

因为 Control 键在 Emacs 中极为常用所以为了更方便的使用 Emacs 的键位修改，需要对其做出修改。建议将大写锁定键（Caps Lock）替换为 Control 键。具体操作请自行搜索。

常见符号所代表的意义如下

- M(eta)
- s(uper), 在 Mac 环境下为左 Command 键
- S(Shift)
- C(trl)

光标的移动是编辑器中最常用的操作所以必须熟知。

- C-f 为前移一个字符，f 代表 forward。
- C-b 为后移一个字符，b 代表 backward。
- C-p 为上移至前一行，p 代表 previous。
- C-n 为上移至下一行，n 代表 next。
- C-a 为移至行首，a 可以理解为最前端。
- C-e 为移至行尾，e 代表 end。

常用的文件操作快捷键组合也必须熟记。

- C-x C-f 为打开目标文件，f 代表 find/file
- C-x C-s 为保存当前缓冲区（Buffer）， s 代表 save

打断组合键为 C-g 用于终端取消之前的指令。快捷键就是用预先绑定好的方式告诉 Emacs 去执行指定的命令。（之后会介绍到更多有关绑定的内容）

### 内置功能

Emacs 功能强大，但是部分功能默认情况下并为开启。下面做有几个例子，

编辑器内显示行号可使用 `M-x linum-mode` 来开启。

**获取帮助**

Emacs 是一个富文档编辑器（Self document, extensible editor）而下面的三种方法在学习 Emacs 的过程中也非常重要。他们分别是，

- `C-h k` 寻找快捷键的帮助信息
- `C-h v` 寻找变量的帮助信息
- `C-h f` 寻找函数的帮助信息

### 学习基础 Elisp

请务必完成[这篇教程（Learn X in Y Minutes）](https://learnxinyminutes.com/docs/elisp/)来了解 Elisp 的使用，你也可以在[这里](https://learnxinyminutes.com/docs/zh-cn/elisp-cn/)找到它的中文版。Elisp 为一个函数式的语言其所有功能都是由函数来实现的。

下面为一些简单的例子

```elisp
; 2 + 2
(+ 2 2)

; 2 + 3 * 4
(+ 2 (* 3 4))

; 定义变量
(setq name "username")
(messasge name) ; -> "username"

; 定义函数
(defun func()
  (message "Hello, %s" username))

; 执行函数
(func) ; -> Hello, usernam

; 设置快捷键
(global-set-key (kbd "<f1>") 'func)

; 使函数可直接被调用可添加 (interactive)
(defun func()
  (interactive)
  (message "Hello, %s" username))

```

### 开始 Hacking！

Emacs 的配置文件默认保存在 `~/.emacs.d/init.el` 文件中。（如果不存在可自行创建）

在开始之前我们先区别 Emacs 中 Major Mode 与 Minor Mode。 Major Mode 通常是定义对于一种文件类型编辑的核心规则，例如语法高亮、缩进、快捷键绑定等。Minor Mode 除去核心功能以外的均为 Minor Mode。

一个文件最多只能存在一个 Major Mode 但是它可以同时激活多个 Minor Mode。

使用 C-h m 可以显示当前所有的开启的 Minor Mode。

**简单的编辑器自定义**

```elisp
; 关闭工具栏 tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

; 关闭文件滑动控件
(scroll-bar-mode -1)

; 显示行号
(global-linum-mode t)

; 更改光标的样式
(setq cursor-type 'bar)

; 关闭启动帮助画面
(setq inhibit-splash-screen t)

; 关闭缩进
(electric-indent-mode -1)

; 快速打开配置文件
(def open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file')
```

`tool-bar-mode` 与 `linum-mode` 等均为 *minor mode*。

### 插件管理

使用默认的插件管理系统（可在菜单栏中找到 `Options > Manage Emacs Packages` 中），安装 `Company`插件，他是一个用于代码补全的插件。它的名字代表补全一切的意思（Complete Anything）。

```elisp
; 开启全局 Company 补全
(global-company-mode t)
```

### Org-mode

简单的 Org-mode 的使用，它可以列出提纲并方便的使用 `tab` 键来对其经行展开与关闭。`C-c C-t` 可以将一个条目转换成一条待办事件。

```org
* 为一级标题
** 为二级标题
*** 为三级标题并以此类推
```

## 感谢

再次感谢子龙山人（[@zilongshanren](https://github.com/zilongshanren)）花费时间和精力分享他的知识和经验。
