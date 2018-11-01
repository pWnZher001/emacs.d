(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA
 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
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
		;;monokai-theme
	        ;;solarized-theme
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;关闭tool-bar,这是一个Minor mode
(tool-bar-mode -1)

;;关闭文件滑动控件
(scroll-bar-mode -1)

;;显示行号
(global-linum-mode 1)

;;关闭缩进
;;(electric-indent-mode -1)

;;关闭启动页面
(setq inhibit-splash-screen 1)

;;更改光标样式
;;(setq-default cursor-type 'bar)

;;更改字体大小
(set-face-attribute 'default nil :height 160)

;;快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;将函数open-init-file绑定到<f2>键上
(global-set-key (kbd "<f2>") 'open-init-file)

;;开启全局Company-mode
(global-company-mode 1)

;;关闭备份文件
(setq make-backup-files nil)

;;选中替换
(delete-selection-mode 1)

;;开启默认全屏
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;自动匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;高亮当前行
;;(global-hl-line-mode 1)

;;安装主题

;;recentf最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
;;绑定快捷键
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;org配置
;;添加org-mode文本内语法高亮
(require 'org)
(setq org-src-fontify-natively 1)
;;Agenda
;;默认目录
(setq org-agenda-files '("~/org"))
;;设置快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;;javascript ide
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (org-gnome atom-dark-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


