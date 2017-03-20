
(use-package ace-jump-mode
  :bind
  ("C-c SPC" . ace-jump-mode))


(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

(use-package ediff
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq-default ediff-highlight-all-diffs 'nil)
  (setq ediff-diff-options "-w"))

(use-package exec-path-from-shell
  :config
  ;; Add GOPATH to shell
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-copy-env "GOPATH")
    (exec-path-from-shell-copy-env "PYTHONPATH")
    (exec-path-from-shell-initialize)))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package flycheck)


(use-package helm
  :init
  (require 'helm-config)
  :config
  (setq helm-split-window-in-side-p t
        helm-split-window-default-side 'below
	helm-idle-delay 0.0
	helm-input-idle-delay 0.01
	helm-quick-update t
	helm-ff-skip-boring-files t)
  (helm-mode 1)
  :bind (("M-x" . helm-M-x)
         ("C-x C-m" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x v" . helm-projectile)
         ("C-x c o" . helm-occur)
         ("C-x c p" . helm-projectile-ag)
         ("C-x c k" . helm-show-kill-ring)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)))

(use-package helm-ag
  :config
  (custom-set-variables '(helm-follow-mode-persistent t)))

(use-package helm-git-grep)

(use-package helm-projectile)

(use-package helm-swoop
  :bind
  ("C-x c s" . helm-swoop))


(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil))

(use-package magit
  :config

  :bind
  ;; Magic
  ("C-x g s" . magit-status)
  ("C-x g x" . magit-checkout)
  ("C-x g c" . magit-commit)
  ("C-x g p" . magit-push)
  ("C-x g u" . magit-pull)
  ("C-x g e" . magit-ediff-resolve)
  ("C-x g r" . magit-rebase-interactive))

(use-package magit-popup)

(use-package multiple-cursors
  :bind
  ("C-S-c C-S-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C->" . mc/mark-all-like-this))

(use-package neotree
  :config
  (setq neo-theme 'arrow
        neotree-smart-optn t
        neo-window-fixed-size nil)
  ;; Disable linum for neotree
  (add-hook 'neo-after-create-hook 'disable-neotree-hook))

(use-package org
  :config
  (setq org-directory "~/org-files"
        org-default-notes-file (concat org-directory "/todo.org"))
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda))

(use-package org-projectile
  :config
  (org-projectile:per-repo)
  (setq org-projectile:per-repo-filename "todo.org"
	org-agenda-files (append org-agenda-files (org-projectile:todo-files))))

(use-package org-bullets
  :config
  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode t))))

(use-package org-pomodoro)

(use-package page-break-lines)

(use-package projectile
  :config
  (setq projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" temp-dir))

  (projectile-global-mode))

(use-package recentf
  :config
  (setq recentf-save-file (recentf-expand-file-name "~/.emacs.d/private/cache/recentf")
	recentf-max-saved-items 200
	recentf-max-menu-items 15)
  (recentf-mode 1))

(use-package smartparens
  :init
  (require 'smartparens-config)
  :config
  (smartparens-global-mode t)
  )

(defun sp-web-mode-is-code-context (id action context)
  (and (eq action 'insert)
       (not (or (get-text-property (point) 'part-side)
                (get-text-property (point) 'block-side)))))

(use-package smex)

(use-package undo-tree
  :config
  ;; Remember undo history
  (setq
   undo-tree-auto-save-history nil
   undo-tree-history-directory-alist `(("." . ,(concat temp-dir "/undo/"))))
  (global-undo-tree-mode 1))

(use-package which-key
  :config
  (which-key-mode))

(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))

(use-package wgrep)

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package youdao-dictionary)
(use-package plantuml-mode
  :config
  (setq plantuml-jar-path "~/.emacs.d/utils/plantuml.8053.jar"))
(use-package flycheck-plantuml)
(use-package graphql-mode)
(use-package graphviz-dot-mode)
(use-package cal-china-x
  :config
  (setq calendar-latitude +30.65
   calendar-longitude +104.06
   calendar-location-name "成都"
   mark-holidays-in-calendar t
   cal-china-x-important-holidays cal-china-x-chinese-holidays
   cal-china-x-general-holidays '(
				       (holiday-fixed 1 1 "元旦")
				       (holiday-lunar 1 15 "元宵节")
				       (holiday-fixed 2 14 "情人节")
				       (holiday-fixed 3 14 "白色情人节")
				       (holiday-fixed 4 1 "愚人节")
				       (holiday-fixed 5 1 "劳动节")
				       (holiday-float 5 0 2 "母亲节")
				       (holiday-fixed 6 1 "儿童节")
				       (holiday-float 6 0 3 "父亲节")
				       (holiday-fixed 7 1 "建党节")
				       (holiday-fixed 8 1 "建军节")
				       (holiday-fixed 9 10 "教师节")
				       (holiday-fixed 10 1 "国庆节")
				       (holiday-fixed 12 25 "圣诞节"))
  calendar-holidays
	(append cal-china-x-important-holidays
		cal-china-x-general-holidays)
	))

(use-package smart-mode-line
  :demand t
  :config
  ;; (use-package smart-mode-line-powerline-theme)
  (setq sml/no-confirm-load-theme t
	sml/shorten-directory t
	sml/shorten-modes t
	sml/name-width 40
	sml/mode-width 'full
	sml/theme 'automatic ;light ;respectful
	rm-blacklist '(" Helm" " Guide" " WK" " SP"  " $" " Tern" " Ind" " Projectile" " Undo-Tree" " alchemist" " Monroe" " cljr" " Wrap" " Doc")
	)
  (sml/setup))

;; Handle ANSI colours in compile buffer output.
;; From https://gist.github.com/jwiegley/8ae7145ba5ce64250a05
(defun compilation-ansi-color-process-output ()
  (ansi-color-process-output nil)
  (set (make-local-variable 'comint-last-output-start)
       (point-marker)))
(add-hook 'compilation-filter-hook #'compilation-ansi-color-process-output)

(use-package yaml-mode)

(load-file "~/.emacs.d/elisp/robot-mode.el")
(add-to-list 'auto-mode-alist '("\\.robot\\'" . robot-mode))

(use-package multiple-cursors
  :bind
  ("C-c m c" . mc/edit-lines))

(use-package chinese-pyim
  ;; :ensure nil
  :config
  (use-package chinese-pyim-basedict
    :ensure nil
    :config (chinese-pyim-basedict-enable))
  (setq default-input-method "chinese-pyim"
	pyim-default-scheme 'pyim-shuangpin
	pyim-isearch-enable-pinyin-search t
	pyim-page-tooltip 'popup
	setq pyim-page-length 5)
  (setq-default pyim-english-input-switch-functions
		'(pyim-probe-dynamic-english
		  pyim-probe-isearch-mode
		  pyim-probe-program-mode
		  pyim-probe-org-structure-template))
  (setq-default pyim-punctuation-half-width-functions
		'(pyim-probe-punctuation-line-beginning
		  pyim-probe-punctuation-after-punctuation))
  :bind
  (("M-j" . pyim-convert-code-at-point)
   ("C-;" . pyim-delete-word-from-personal-buffer))
  )

(use-package org-download
  :config
  (setq-default org-download-image-dir "~/org-files/pic/"))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "markdown")
  :config
  (use-package markdown-mode+)
  )

(use-package web-mode
  :mode (("\\.html?\\'" . web-mode)
         ("\\.jinja\\'" . web-mode)
         ("\\.eex\\'" . web-mode))
  :config
  (add-hook 'web-mode-hook 'turn-off-smartparens-mode)
  (add-hook 'web-mode-hook
  	    (lambda ()
  	      (setq web-mode-enable-css-colorization t)
  	      (setq web-mode-markup-indent-offset 2)
	      ;; (setq web-mode-enable-auto-pairing nil)
  	      (setq web-mode-style-padding 2)
  	      (setq web-mode-script-padding 2))))

(provide 'base-extensions)
