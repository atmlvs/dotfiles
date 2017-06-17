(package-initialize)
;; (setq url-proxy-services '(
               ;; ("http" . "10.144.1.10:8080")
               ;; ("https" . "10.144.1.10:8080")))
(add-to-list 'package-archives
         ;; '("melpa" . "http://melpa.org/packages/")
         ;; '("elpy" . "http://jorgenschaefer.github.io/packages/"))
	 '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
	 '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(defconst private-dir  (expand-file-name "private" user-emacs-directory))
(defconst temp-dir (format "%s/cache" private-dir)
  "Hostname-based elisp temp directories")

;; Core settings
;; UTF-8 please
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; please
(prefer-coding-system        'utf-8)   ; with sugar on top
;; added
;; (set-language-environment 'Chinese-GB)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq-default pathname-coding-system 'utf-8
	      truncate-lines t)
(set-file-name-coding-system 'utf-8)

(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(set-face-attribute 'default nil
		    :family "Source Code Pro" :height 160)
		    ;; :family "Consolas"
		    ;; :height 140
		    ;; :weight 'normal
;; :width 'condensed)
(set-face-attribute 'variable-pitch nil
		    :family "Fira Sans" :height 140 :weight 'regular)

;; (set-face-foreground 'highlight "white")
;; (set-face-background 'highlight "blue")
;; (set-face-foreground 'region "cyan")
;; (set-face-background 'region "blue")
;; (set-face-foreground 'secondary-selection "skyblue")
;; (set-face-background 'secondary-selection "darkblue")

(setq default-frame-alist '(
			    ;; (left . 25)
			    ;; (top . 45)
			    (width . 90)
			    (height . 35)
			    ;; (cursor-color . "black")
                            ;; (vertical-scroll-bars . nil)
                            ;; (tool-bar-lines . 0)
                            ;; (menu-bar-lines . 0)
			    ))

;; Emacs customizations
(setq confirm-kill-emacs                  'y-or-n-p
      confirm-nonexistent-file-or-buffer  t
      column-number-mode                  t
      save-interprogram-paste-before-kill t
      mouse-yank-at-point                 t
      require-final-newline               t
      initial-scratch-message             ""
      visible-bell                        nil
      ring-bell-function                  'ignore
      fill-column                         80
      custom-file                         "~/.emacs.d/.custom.el"
      custom-theme-directory "~/.emacs.d/themes/"
      custom-safe-themes t
      default-directory                   "~/"
      ;; http://ergoemacs.org/emacs/emacs_stop_cursor_enter_prompt.html
      minibuffer-prompt-properties
      '(read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)

      ;; Disable non selected window highlight
      cursor-in-non-selected-windows     nil
      highlight-nonselected-windows      nil
      ;; PATH
      exec-path                          (append exec-path '("/usr/local/bin/"))
      indent-tabs-mode                   nil
      inhibit-startup-message            t
      fringes-outside-margins            t
      x-select-enable-clipboard          t
      use-package-always-ensure          t)

;; Bookmarks
(setq
 ;; persistent bookmarks
 bookmark-save-flag                      t
 bookmark-default-file              (concat temp-dir "/bookmarks"))

;; Backups enabled, use nil to disable
(setq
 history-length                     1000
 backup-inhibited                   nil
 make-backup-files                  t
 version-control                    t
 delete-old-versions                t
 delete-by-moving-to-trash          t
 kept-old-versions                  6
 kept-new-versions                  2
 auto-save-default                  t
 auto-save-timeout                  20
 auto-save-interval                 200
 auto-save-list-file-name           (concat temp-dir "/autosave")
 make-backup-files                  t
 create-lockfiles                   nil
 backup-directory-alist            `((".*" . ,(concat temp-dir "/backup")))
 auto-save-file-name-transforms    `((".*" ,(concat temp-dir "/auto-save-list/") t)))

(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)

;; Disable toolbar & menubar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(show-paren-mode 1)
(fringe-mode 0)
;; No $ displayed for truncated lines
(set-display-table-slot standard-display-table 0 ?\ )

;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-linum-mode 0)
;; (add-hook 'org-mode-hook (lambda () (linum-mode 0)))
;; (add-hook 'org-src-mode-hook (lambda () (linum-mode 0)))
;; (add-hook 'find-file-hook (lambda () (linum-mode 1)))

(setq org-use-sub-superscripts nil)
(setq org-export-with-sub-superscripts '{})
;; Set time mode
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)

(server-start)

(provide 'base)
;;; base ends here
;;;
