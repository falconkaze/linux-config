;; =================== 插件管理 ======================
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ))
      ;("melpa" . "http://elpa.emacs-china.org/melpa/")
;;(add-to-list 'package-archives
;;             '("melpa-stable" . "https://stable.melpa.org/packages/"))
;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                         ("org" . "http://orgmode.org/elpa/")
;;                         ("marmalade" . "http://marmalade-repo.org/packages/")
;;                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
(setq package-enable-at-startup nil)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(require 'cl)
;; Add Packages
(defvar my/packages '(
		      popwin
		      ;; --- auto-completion ---
		      company
		      ;; --- better editor ---
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

;; TODO Find Executable Path on OS X
;;(when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))
(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
