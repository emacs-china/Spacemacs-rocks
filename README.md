<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Spacemacs Rocks（第二季）](#spacemacs-rocks-第二季)
	- [第一天：准备开始](#第一天准备开始)
		- [基础操作](#基础操作)
		- [内置功能](#内置功能)
		- [学习基础 Elisp](#学习基础-elisp)
		- [开始 Hacking！](#开始-hacking)
		- [插件管理](#插件管理)
		- [Org-mode](#org-mode)
	- [第二天：高级自定义](#第二天高级自定义)
		- [Emacs 也很美](#emacs-也很美)
		- [JavaScript IDE](#javascript-ide)
		- [Org-mode 进阶](#org-mode-进阶)
	- [贡献人列表](#贡献人列表)

<!-- /TOC -->

# Spacemacs Rocks（第二季）

在这一季中计划在 21 天的时间内学习 Emacs 以及 Spacemacs 的使用。从基础安装开始到可以运用到工作生产环节中。为了确保学习质量，请务必完成和理解计划中的每一项学习任务。

## 第一天：准备开始

视频地址如下

- [优酷视频](http://v.youku.com/v_show/id_XMTUwNjU0MjE0OA==.html)
- [百度网盘](http://pan.baidu.com/s/1gep9DQV)
- [YouTube](https://www.youtube.com/watch?v=2Q0MhOR59u8)

**说在最前面**

如果你第一次听说 Emacs 你可以在[性感的 Emacs（Emacs is Sexy）](http://emacs.sexy/)一文中找到使用它的理由！我相信你一定被它的强大所吸引。

如果你还没有安装 Emacs 可以在 [Mac OS X 安装链接](http://emacsformacosx.com/builds)以及 [Window 安装链接](http://emacsbinw64.sourceforge.net/)找到它。

在开始本教程之前请务必先完成 Emacs 提供的官方教程（完成时间大约 30 分钟），它可以通过使用 `C-h t`（同时按住 Ctrl 与 h 键，接着按 t 键（t 代表 tutorial）） 在 Emacs 中直接将其打开。

Elisp 是 Emacs 所用的编程语言，你可以在阅读[这篇教程（Learn X in Y Minutes）](https://learnxinyminutes.com/docs/elisp/)后很快的了解它的基础用法。

### 基础操作

因为 Control 键在 Emacs 中极为常用所以为了更方便的使用 Emacs 的键位修改，需要对其做出修改。建议将大写锁定键（Caps Lock）替换为 Control 键。各个系统下的具体修改方式请自行搜索。

常见符号所代表的意义如下

- M(eta)，在 Mac 下为 Option 键
- s(uper)，在 Mac 环境下为左 Command 键
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
- C-x C-s 为保存当前缓冲区（Buffer），s 代表 save

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

请务必完成[这篇教程（Learn X in Y Minutes）](https://learnxinyminutes.com/docs/elisp/)来了解 Elisp 的使用（阅读时间大约 15 分钟），你也可以在[这里](https://learnxinyminutes.com/docs/zh-cn/elisp-cn/)找到它的中文版。Elisp 为一个函数式的语言其所有功能都是由函数来实现的。

下面为一些简单的例子

```elisp
;; 2 + 2
(+ 2 2)

;; 2 + 3 * 4
(+ 2 (* 3 4))

;; 定义变量
(setq name "username")
(messasge name) ; -> "username"

;; 定义函数
(defun func()
  (message "Hello, %s" username))

;; 执行函数
(func) ; -> Hello, usernam

;; 设置快捷键
(global-set-key (kbd "<f1>") 'func)

;; 使函数可直接被调用可添加 (interactive)
(defun func()
  (interactive)
  (message "Hello, %s" username))

```

### 开始 Hacking！

Emacs 的配置文件默认保存在 `~/.emacs.d/init.el` 文件中。（如果不存在可自行创建）

在开始之前我们先来区别 Emacs 中 Major Mode 与 Minor Mode。Major Mode 通常是定义对于一种文件类型编辑的核心规则，例如语法高亮、缩进、快捷键绑定等。Minor Mode 除去核心功能以外的编辑功能均为 Minor Mode 所提供。

一个文件类型同时只能存在一个 Major Mode 但是它可以同时激活多个 Minor Mode。

使用 `C-h m` 可以显示当前所有开启的 Minor Mode。

**简单的编辑器自定义**

```elisp
;; 关闭工具栏 tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode t)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

;; 关闭缩进 (第二集中被去除)
;; (electric-indent-mode -1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;; 快速打开配置文件
(def open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)
```

在每次编辑配置文件后，刚刚做的修改并不会立刻生效。这时你需要重启编辑器或者重新加载配置文件。重新加载配置文件你需要在当前配置文件中使用 `M-x load-file` 双击两次回车确认默认文件名，既可使刚刚修改的配置文件生效。当然你也可以将其绑定为快捷键。

`tool-bar-mode` 与 `linum-mode` 等均为 *minor mode*。

### 插件管理

使用默认的插件管理系统（可在菜单栏中找到 `Options > Manage Emacs Packages` 中），安装 [`Company`](http://company-mode.github.io/) 插件，他是一个用于代码补全的插件。它的名字代表补全一切的意思（Complete Anything）。

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

## 第二天：高级自定义

视频地址如下

- [优酷视频](http://v.youku.com/v_show/id_XMTUxMzQyODI4MA==.html)
- [百度网盘](http://pan.baidu.com/s/1c2Cw9ck)
- [YouTube](https://youtu.be/aQRZxaU3pAI)

**说在最前面**

如果你想深入学习 Emacs Lisp 可以阅读 GNU 提供的 [An Introduction to Programming in Emacs Lisp](https://www.gnu.org/software/emacs/manual/html_mono/eintr.html) 。（`M-x info` 然后选择 Emacs Lisp Intro）

我们先解决上一集中的一些问题。首先是区分 `setq` 与 `setq-default` 的区别，`setq` 为设置当前缓冲区（Buffer）中的变量值，`setq-default` 设置的为全局的变量的值（具体内容可以在 [StackOverflow 找到](http://stackoverflow.com/questions/18172728/the-difference-between-setq-and-setq-default-in-emacs-lisp)）。下面是一个例子，用于设置光标样式的方法。

```elisp
(setq-default cursor-type 'bar)
```

今天我们将第一天关闭的自动缩进(`electric-indent-mode`)从配置文件中去除，它是 Emacs 24.4 中加入的新特性，你可以在这篇[文章](http://emacsredux.com/blog/2014/01/19/a-peek-at-emacs-24-dot-4-auto-indentation-by-default/)中找到更多关于它的内容。我们之前关闭它是因为，它存在不理想的缩进效果（在 Elisp 中用分号做注释时 `fancy-comment` 会造成很远的缩进，其实解决方法是使用 Elisp 推荐的两个分号而不是一个 `;;`，这样就可以避免这个问题。于是我们也就将其从配置文件中删除）

禁止 Emacs 自动生成备份文件，例如 `init.el~`。`~` 为后缀的文件为自动生成的备份文件。因为通常我们的配置文件以及项目文件均使用版本控制系统，所以自动生成的备份文件就显得有些多余，我们可以使用下面的方法将其关闭。

```elisp
(setq make-backup-files nil)
```

分屏的使用，如果你已经读过 Emacs 自带的教程，现在你应该已经掌握了如何分屏操作的方法了。关于分屏的更多内容你可以在[这里](https://www.gnu.org/software/emacs/manual/html_node/emacs/Split-Window.html)找到。

- `C-x 1` 仅保留当前窗口，
- `C-x 2` 将当前窗口分到上边
- `C-x 3` 将当前窗口分到右边

我们再使用下面的配置加入最近打开过文件的选项让我们更快捷的打开最近编辑过的文件。

```elisp
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key "\C-x\ \C-r" 'recent-open-files)
```

`require` 的意思为从文件中加载特性，你可以在杀哥的网站读到关于 Emacs Lisp 库系统的更多内容，文章在[这里](http://ergoemacs.org/emacs/elisp_library_system.html)。

*你可以使用 `C-x C-e` 来执行这一行的 Lisp 代码，或者使用 `M-x eval-buffer` 来执行整个缓冲区的 Lisp 代码*

使用下面的配置文件将删除功能配置成与其他图形界面的编辑器相同，

```elisp
(delete-selection-mode t)
```

下面的这些函数可以让你找到不同函数，变量以及快捷键所定义的文件位置。因为非常常用所以我们建议将其设置为与查找文档类似的快捷键（如下所示），

- `find-function`（`C-h C-f`）
- `find-variable`（`C-h C-v`）
- `find-function-on-key`（`C-h C-k`）

在我们进入下一个部分之间让我们来看看使用 `~/.emacs.d/init.el` 与 `~/.emacs` 的区别（更多关于他们区别的讨论可以在[这里](http://emacs.stackexchange.com/questions/1/are-there-any-advantages-to-using-emacs-d-init-el-instead-of-emacs)找到）。简单来说请使用前者它有下面的两天有点，

- 它可以更好将所有 Emacs 相关的文件整合在一个目录内（干净的 `HOME`，网盘备份等优点）
- 更好的版本控制

### Emacs 也很美

**配置插件源**

在进行美化之前我们需要配置插件的源（默认的源非常有限），最常使用的是 [MELPA](https://melpa.org/) （Milkypostman's Emacas Lisp Package Archive）它有非常多的插件（3000 多个插件）。下载的次数并不能说明它非常有用，也许这个插件是其他的插件依赖。在[这里](https://melpa.org/#/getting-started)你可以找到其安装使用方法。添加源后，我们就可以使用 `M-x package-list-packages` 来查看所有 MELPA 上的插件了。在表单中可以使用 `I` 来标记安装 `D` 来标记删除，`U` 来更新，并用 `X` 来确认。

你可以直接将下面的代码复制到你的配置文件顶端，从而直接使用 Melpa 作为插件的源。你可以将你需要的插件名字写在 `YOUR_NAME_HERE/packages` 中，Emacs 在启动时会自动下载未被安装的插件。

```elisp
(when (>= emacs-majooar-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    )

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar YOUR_NAME_HERE/packages '(
               ;; --- Auto-completion ---
               company
               ;; --- Better Editor ---
               hungry-delete
               swiper
               counsel
               smartparens
               ;; --- Major Mode ---
               js2-mode
               ;; --- Minor Mode ---
               nodejs-repl
               exec-path-from-shell
               ;; --- Themes ---
               monokai-theme
               ;; solarized-theme
               ) "Default packages")

(setq package-selected-packages YOUR_NAME_HERE/packages)

(defun YOUR_NAME_HERE/packages-installed-p ()
    (loop for pkg in YOUR_NAME_HERE/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

(unless (YOUR_NAME_HERE/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg YOUR_NAME_HERE/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
```

关于上面这段配置代码有几个知识点，首先就是这段配置文件中用到了 `loop for ... in`，它来自 `cl` 既 Common Lisp 扩展。`for`, `in`, `collection` 均为 `cl-loop` 中的保留关键字。下面是一些简单的 `cl-loop` 的使用示例，

```Lisp
;; 遍历每一个缓冲区（Buffer）
(cl-loop for buf in (buffer-list)
				 collection (buffer-file-name buf))

;; 寻找 729 的平方根（设置最大为 100 为了防止无限循环）
(cl-loop for x from 1 to 100
				 for y = (* x x)
				 until (>= y 729)
				 finally return (list x (= y 729)))
```

你可以在[这里](http://www.gnu.org/software/emacs/manual/html_mono/cl.html#Loop-Facility)找到更多关于循环的使用说明。


其次就是它使用到了 `quote`, 它其实就是我们之前常常见到的 `'`（单引号）的完全体。

```Lisp
;; 下面两行的效果完全等同
(quote foo)
'foo
```

它的意思是不要执行后面的内容，返回它原本的内容（参加下面的例子）

```
(print '(+ 1 1)) ;; -> (+ 1 1)
(print (+ 1 1))  ;; -> 2
```

更多关于 `quote` 的内容可以在[这里](https://www.gnu.org/software/emacs/manual/html_node/elisp/Quoting.html)找到，或者在[这里](http://stackoverflow.com/questions/134887/when-to-use-quote-in-lisp)找到 StackOverflow 上对于 `'` 的讨论。

这样我们就可以区分下面三行代码的区别，

```Lisp
;; 第一种
(setq package-selected-packages YOUR_NAME_HERE/packages)
;; 第二种
(setq package-selected-packages 'YOUR_NAME_HERE/packages)
;; 第三种
(setq package-selected-packages (quote YOUR_NAME_HERE/packages))
```

第一种设置是在缓冲区中设置一个名为 `package-selected-packages` 的变量，将其的值设定为 `YOUR_NAME_HERE/packages` 变量的值 。第二种和第三种其实是完全相同的，将一个名为 `package-selected-packages` 的变量设置为 `YOUR_NAME_HERE/packages`。

我们可以用下面代码将 Emacs 设置为开启默认全屏，

```elisp
(setq initial-frame-alist (quote ((fullscreen . maximized))))
```

我们也可以启用自动括号匹配（Highlight Matching Parenthesis），随后会介绍插件来增强这个匹配的功能。你可以在[这里](https://www.gnu.org/software/emacs/manual/html_node/emacs/Hooks.html)读到关于钩子的更多信息。

```elisp
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
```

高亮当前行，当文本内容很多时可以很容易找到光标的位置。

```elisp
(global-hl-line-mode t)
```

**安装主题**

```elisp
(add-to-list 'monokai-theme)
```

然后使用下面的配置使其每次打开编辑器时加载主题，

```elisp
(load-theme 'monokai t)
```

**推荐插件**

- [`company`](http://company-mode.github.io/)
- [`hungry-delete`](https://github.com/nflath/hungry-delete)
- [`Smex`](https://github.com/nonsequitur/smex) (如果你使用 Counsel 来增强你的 M-x，那么就不需要再安装 Smex 了)
- [`Swiper & Counsel`](https://github.com/abo-abo/swiper)
- [`smartparens`](https://github.com/Fuco1/smartparens)

使用 `M-x customize-group` 后选择对应的插件名称，可以进入可视化选项区对指定的插件做自定义设置。 当选择 Save for future session 后，刚刚做的设计就会被保存在你的配置文件（`init.el`）中。关于各个插件的安装与使用方法通常都可以在其官方页面找到（GitHub Pages 或者是项目仓库中的 README 文件）。我们强烈建议大家在安装这些插件后阅读使用方法来更好的将它们使用到你的日常工作当中使效率最大化。

### JavaScript IDE

将默认的 JavaScript 的模式设置为 [`js2-mode`](https://github.com/mooz/js2-mode) 一个比默认模式好用的 Major Mode。我们可以通过 MELPA 下载。

```elisp
(setq auto-mode-alist
	  (append
	   '(("\\.js\\'" . js2-mode))
	   auto-mode-alist))
```

你可以在[这里](https://www.gnu.org/software/emacs/manual/html_node/elisp/Auto-Major-Mode.html)（How Emacs Chooses a Major Mode）找到 Emacs 是如何选择何时该选用何种 Major Mode 的方法。

在这里我们需要知道 `auto-mode-alist` 的作用，这个变量是一个 [`AssociationList`](https://www.emacswiki.org/emacs/AssociationList)，它使用正则表达式（REGEXP）的规则来匹配不同类型文件应使用的 Major Model 。 下面是几个正则表达式匹配的例子，

```Lisp
(("\\`/tmp/fol/" . text-mode)
 ("\\.texinfo\\'" . texinfo-mode)
 ("\\.texi\\'" . texinfo-mode)
 ("\\.el\\'" . emacs-lisp-mode)
 ("\\.c\\'" . c-mode)
 ("\\.h\\'" . c-mode)
 …)
```

下面是如何添加新的模式的例子（与我们的所使用的配置 `js2-mode` 的例子相似），

```Lisp
(setq auto-mode-alist
  (append
   ;; File name (within directory) starts with a dot.
   '(("/\\.[^/]*\\'" . fundamental-mode)
     ;; File name has no dot.
     ("/[^\\./]*\\'" . fundamental-mode)
     ;; File name ends in ‘.C’.
     ("\\.C\\'" . c++-mode))
   auto-mode-alist))
```

在 `js2-mode` 模式中会提供

- 语法高亮
- 语法检查器（Linter）

执行缓冲区的代码可以使用 `nodejs-repl` 插件，它需要你的机器上已经安装了 NodeJS。在 Mac 上可能会出现找不到 NodeJS 可执行文件的问题，要解决这个问题你需要安装另外一个 `exec-path-from-shell` 的插件。

```
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
```

有了 `nodejs-repl` 我们就可以方便的测试和开发我们的 JavaScript 代码了。

### Org-mode 进阶

在 Org-mode 中你可以直接开启新的缓冲区（Buffer）直接用相应的 Major Mode 来编辑代码块内的内容。在代码块中使用 `C-c '` 会直接打开对应模式的缓冲区（不仅限于 Lisp）。这样就使在 Org-mode 中编辑代码变的十分方便快捷。

使用 `<s` 然后 <kbd>Tab</kbd> 可以直接插入代码块的代码片段（Snippet）。

```
 #+BEGIN_SRC emacs-lisp
 ;; Your code goes here
 ;; 你的代码写在这里
 #+END_SRC
```

**添加 Org-mode 文本内语法高亮**

```elisp
(require 'org)
(setq org-src-fontify-natively t)
```

在 Org-mode 中重置有序列表序号可以直接使用 M-\<RET\> 。

**Agenda 的使用**

```
;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
```

你只需将你的 `*.org` 文件放入上面所指定的文件夹中就可以开始使用 Agenda 模式了。

- `C-c C-s` 选择想要完成的时间
- `C-c C-d` 选择想要结束的时间
- `C-c a` 可以打开 Agenda 模式菜单并选择不同的可视方式（`r` 可以在不同的可视方式中更新）

## 贡献人列表

- [li-xinyang](https://github.com/li-xinyang)
