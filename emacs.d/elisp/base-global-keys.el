;; Add your keys here, as such

;(global-set-key (kbd "[SHORTCUT]") '[FUNCTION])
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)
(global-set-key (kbd "C-c s") 'new-shell)
(global-set-key (kbd "M-/") 'undo-tree-visualize)
(global-set-key (kbd "C-c j") 'pop-to-mark-command)
(global-set-key (kbd "C-x t") 'eshell)
(setq set-mark-command-repeat-pop t)
;; (global-set-key (kbd "C->") 'ace-jump-mode)

(global-set-key (kbd "M-N") 'windmove-down)
(global-set-key (kbd "M-P") 'windmove-up)
(global-set-key (kbd "M-B") 'windmove-left)
(global-set-key (kbd "M-F") 'windmove-right)

(global-set-key (kbd "C-M-S-N") (lambda () (interactive) (swap-with 'down)))
(global-set-key (kbd "C-M-S-P") (lambda () (interactive) (swap-with 'up)))
(global-set-key (kbd "C-M-S-B") (lambda () (interactive) (swap-with 'left)))
(global-set-key (kbd "C-M-S-F") (lambda () (interactive) (swap-with 'right)))

(provide 'base-global-keys)
