(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
(require 'init-keybindings)
(require 'init-org)
;(require 'custom)

;; ============================= 通用配置 ============================
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

(require 'evil)
(evil-mode 1)
(add-hook 'evil-insert-state-exit-hook 'save-buffer) ;; 离开插入模式时保存当前文件
;; 退出 Evil Insert 模式时切换到英文输入法。
(add-hook 'evil-insert-state-exit-hook '(lambda ()
					  (setq-local my/input-method (shell-command-to-string "/Users/yaokeqi/git/mine/linux-config/sh/currentInputMethod"))
					  (call-process-shell-command "/Users/yaokeqi/git/mine/linux-config/sh/switchInputMethod en" nil nil t)))
;; 回到 Evil Insert 模式时切换到原来的输入法。
(add-hook 'evil-insert-state-entry-hook '(lambda ()
					   (when (boundp 'my/input-method)
					     (call-process-shell-command "/Users/yaokeqi/git/mine/linux-config/sh/switchInputMethod" nil nil t my/input-method)
					     )
					   ))

;; 配置最近文件 https://www.emacswiki.org/emacs/RecentFiles
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'helm-recentf)

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

(defun arrange-frame (w h x y)
  "Set the width, height, and x/y position of the current frame"
  (let ((frame (selected-frame)))
    (delete-other-windows)
    (set-frame-position frame x y)
    (set-frame-size frame w h)
  )
)
;;(add-hook 'after-make-frame-hook
;;	  #'(lambda () (arrange-frame 100 35 0 0)))
;; (arrange-frame 120 30 100 50)
(add-hook 'before-make-frame-hook
          #'(lambda ()
              (add-to-list 'default-frame-alist '(left   . 0))
              (add-to-list 'default-frame-alist '(top    . 0))
              (add-to-list 'default-frame-alist '(height . 35))
              (add-to-list 'default-frame-alist '(width  . 100))))
(message "Config load finish!!!")
