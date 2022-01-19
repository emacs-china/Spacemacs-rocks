;;; day1.el -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 zilongshanren
;;
;; Author: zilongshanren <https://github.com/zilongshanren>
;; Maintainer: zilongshanren <guanghui8827@gmail.com>
;; Created: January 15, 2022
;; Modified: January 15, 2022
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/lionqu/day1
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;
;;
;;; Code:

(setq w32-apps-modifier 'super)       ; 通过SharpKeys改成了 Application

(global-set-key (kbd "s-a") 'mark-whole-buffer) ;;对应Windows上面的Ctrl-a 全选 C-x C-e
(global-set-key (kbd "s-c") 'kill-ring-save) ;;对应Windows上面的Ctrl-c 复制
(global-set-key (kbd "s-s") 'save-buffer) ;; 对应Windows上面的Ctrl-s 保存
(global-set-key (kbd "s-v") 'yank) ;对应Windows上面的Ctrl-v 粘贴
(global-set-key (kbd "s-z") 'undo) ;对应Windows上面的Ctrol-z 撤销
(global-set-key (kbd "s-x") 'kill-region) ;对应Windows上面的Ctrol-x 剪切


(global-linum-mode 1)

(setq inhibit-startup-screen t)

(server-mode 1)


(provide 'day1)
;;; day1.el ends here
