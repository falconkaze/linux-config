(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
(require 'init-keybindings)
(require 'init-org)
;(require 'custom)
;;
;;;; =========================== 通用配置 ============================
(setq inhibit-splash-screen 1) ;; 关闭启动帮助画面
(tool-bar-mode -1) ;; 关闭工具栏
(scroll-bar-mode -1) ; 关闭文件滑动控件
(global-linum-mode 1) ; always show line numbers
(setq linum-format "%d")  ;set format

(set-language-environment "UTF-8")
(set-face-attribute 'default nil :height 140) ;; set font size

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; 保存前清理行尾的空格

(setq make-backup-files nil) ;; 不进行备份
(delete-selection-mode 1) ;; 选中后编辑直接替换
(global-hl-line-mode 1) ;; 高亮当前行
(setq initial-frame-alist (quote ((fullscreen . maximized)))) ;; 默认全屏
(global-auto-revert-mode 1) ;; 自动加载外部修改过的文件
(setq auto-save-default nil) ;; 不生产自动保存的文件
(fset 'yes-or-no-p 'y-or-n-p) ;; 所有yes/no都改为y/n
;;
;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(custom-enabled-themes '(spacemacs-dark))
;; '(custom-safe-themes
;;   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
;; '(package-archives
;;   '(("org" . "http://orgmode.org/elpa/")
;;     ("melpa-stable" . "https://stable.melpa.org/packages/")
;;     ("melpa" . "https://melpa.org/packages/")
;;     ("gnu" . "https://elpa.gnu.org/packages/")))
;; '(package-selected-packages '(spacemacs-theme evil)))
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; )
;;
(require 'evil)
(evil-mode 1)

(global-company-mode 1) ;; 开启全局 company 补全
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;
;;;; indent
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))
(global-set-key (kbd "M-s-l") 'indent-region-or-buffer)
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("ykq" "yaokeqi")
					    ))
;; TODO hippie 补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
;; TODO (global-set-key (kbd "C-.") 'hippie-expand)
;; TODO dired mode

(require 'dired-x)
;(put 'dired-find-alternate-file 'disabled nil)
;; 主动加载 Dired Mode
;(require 'dired)
;(defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
;(with-eval-after-load 'dired
;    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(show-paren-mode 1)
;; 光标在括号内时就高亮包含内容的两个括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))
(message "Config load finish!!!")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/org/task.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
