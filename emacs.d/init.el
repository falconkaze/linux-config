(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
;; =========================== 通用配置 ============================
(setq inhibit-splash-screen 1) ;; 关闭启动帮助画面
(scroll-bar-mode -1) ; 关闭文件滑动控件

(global-linum-mode 1) ; always show line numbers                              
(setq linum-format "%d")  ;set format

;; set font size
(set-face-attribute 'default nil :height 140)

;; auto clear whitespace.
(add-hook 'before-save-hook 'delete-trailinig-whitespace)

(setq make-backup-files nil) ;; 不进行备份
(delete-selection-mode 1) ;; 选中后编辑直接替换
(global-hl-line-mode 1) ;; 高亮当前行
(setq initial-frame-alist (quote ((fullscreen . maximized)))) ;; 默认全屏
(global-auto-revert-mode 1) ;; 自动加载外部修改过的文件
(setq auto-save-default nil) ;; 不生产自动保存的文件
(fset 'yes-or-no-p 'y-or-n-p) ;; 所有yes/no都改为y/n

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(package-archives
   '(("org" . "http://orgmode.org/elpa/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")))
 '(package-selected-packages '(spacemacs-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'evil)
(evil-mode 1)

;; org mode 下自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;; (setq org-src-fontify-natively t)
(setq org-agenda-files '("~/todos")) ;; 设置默认的 Org Agenda 目录
(global-set-key (kbd "C-c a") 'org-agenda) ;; 设置 org-agenda 打开的快捷键

(global-company-mode 1) ;; 开启全局 company 补全
(add-hook 'emacs-lisp-mode-hook 'show-paren-match)

;; TODO 新建一个窗口打开
(defun open-init-file()
  (interactive)
  (find-file-other-window "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)
