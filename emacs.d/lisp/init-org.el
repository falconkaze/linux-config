;; org mode 下自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;; (setq org-src-fontify-natively t)
(setq org-agenda-files '("~/todos")) ;; 设置默认的 Org Agenda 目录
(global-set-key (kbd "C-c a") 'org-agenda) ;; 设置 org-agenda 打开的快捷键

;;(server-start)
(require 'org-protocol)

;; org-capture 配置
(defun get-year-and-month ()
  (list (format-time-string "%Y年") (format-time-string "%m月")))
(defun find-month-tree ()
  (let* ((path (get-year-and-month))
         (level 1)
         end)
    (unless (derived-mode-p 'org-mode)
      (error "Target buffer \"%s\" should be in Org mode" (current-buffer)))
    (goto-char (point-min))             ;移动到 buffer 的开始位置
    ;; 先定位表示年份的 headline，再定位表示月份的 headline
    (dolist (heading path)
      (let ((re (format org-complex-heading-regexp-format
                        (regexp-quote heading)))
            (cnt 0))
        (if (re-search-forward re end t)
            (goto-char (point-at-bol))  ;如果找到了 headline 就移动到对应的位置
          (progn                        ;否则就新建一个 headline
            (or (bolp) (insert "\n"))
            (if (/= (point) (point-min)) (org-end-of-subtree t t))
            (insert (make-string level ?*) " " heading "\n"))))
      (setq level (1+ level))
      (setq end (save-excursion (org-end-of-subtree t t))))
    (org-end-of-subtree)))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/org/inbox.org")
(setq org-capture-templates nil)
;; task 相关
(add-to-list 'org-capture-templates '("t" "Tasks"))
(add-to-list 'org-capture-templates
	     '("tr" "Read Book Task" entry
	       (file+olp "~/org/task.org" "Tasks" "Reading" "Book")
	       "* TODO %^{书名}\n%U\n" :clock-in t :clock-resume t))
(add-to-list 'org-capture-templates
	     '("tw" "Work Task" entry
	       (file+olp "~/org/task.org" "Tasks" "Work")
	       "* TODO %^{任务名}\n%U\n" :clock-in t :clock-resume t))
(add-to-list 'org-capture-templates
	     '("tt" "Tool Task" entry
	       (file+olp "~/org/task.org" "Tasks" "Tool")
	       "* TODO %^{任务名}\n%U\n" :clock-in t :clock-resume t))
(add-to-list 'org-capture-templates
	     '("ts" "Study Task" entry
	       (file+olp "~/org/task.org" "Tasks" "Study")
	       "* TODO %^{任务名}\n%U\n" :clock-in t :clock-resume t))
;; note 相关
(add-to-list 'org-capture-templates '("n" "Notes"))
;; 日志/日记相关
(add-to-list 'org-capture-templates
             '("j" "Journal" entry (file+datetree "~/org/journal.org")
               "* %U - %^{heading}\n  %?"))
;; 账单相关
(add-to-list 'org-capture-templates '("b" "Billing"))
(add-to-list 'org-capture-templates
	     '("bg" "Game Billing" plain
	       (file+function "~/org/billing.org" find-month-tree)
	       " | %u | 游戏 | %^{描述} | %^{金额} |" :kill-buffer t))
(add-to-list 'org-capture-templates
	     '("bl" "Life Billing" plain
	       (file+function "~/org/billing.org" find-month-tree)
	       " | %u | 生活 | %^{描述} | %^{金额} |" :kill-buffer t))
(add-to-list 'org-capture-templates
	     '("bl" "Life Billing" plain
	       (file+function "~/org/billing.org" find-month-tree)
	       " | %u | 生活 | %^{描述} | %^{金额} |" :kill-buffer t))
;; 管理密码
(defun random-alphanum ()
  (let* ((charset "abcdefghijklmnopqrstuvwxyz0123456789")
         (x (random 36)))
    (char-to-string (elt charset x))))

(defun create-password ()
  (let ((value ""))
    (dotimes (number 16 value)
      (setq value (concat value (random-alphanum))))))


(defun get-or-create-password ()
  (setq password (read-string "Password: "))
  (if (string= password "")
      (create-password)
    password))

(add-to-list 'org-capture-templates
             '("s" "Security/Password" entry (file "~/org/passwords.org.cpt")
               "* %^{title} %^G\n\n  - 用户名: %^{用户名}\n  - 密码: %(get-or-create-password)\n  - 时间: %U"
               :empty-lines 1 :kill-buffer t))
;; 新建博客文章
;; 网页管理
(add-to-list 'org-capture-templates '("p" "Protocol"))
(add-to-list 'org-capture-templates
             '("pb" "Protocol Bookmarks" entry
               (file+headline "~/org/web.org" "Bookmarks")
               "* %U - %:annotation\n" :immediate-finish t :kill-buffer t))
(add-to-list 'org-capture-templates
             '("pn" "Protocol Notes" entry
               (file+headline "~/org/web.org" "Notes")
               "* %U - %:annotation\n %:initial\n" :empty-lines 1 :immediate-finish t :kill-buffer t))

(defun org-capture-template-goto-link ()
  (org-capture-put :target (list 'file+headline
                                 (nth 1 (org-capture-get :target))
                                 (org-capture-get :annotation)))
  (org-capture-put-target-region-and-position)
  (widen)
  (let ((hd (nth 2 (org-capture-get :target))))
    (goto-char (point-min))
    (if (re-search-forward
         (format org-complex-heading-regexp-format (regexp-quote hd)) nil t)
        (org-end-of-subtree)
      (goto-char (point-max))
      (or (bolp) (insert "\n"))
      (insert "* " hd "\n"))))
(add-to-list 'org-capture-templates
             '("pa" "Protocol Annotation" plain
               (file+function "~/org/web.org" org-capture-template-goto-link)
               "  %U - %?\n\n  %:initial" :empty-lines 1))
;; Anki 卡片

(provide 'init-org)
