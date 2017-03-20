;; Add your keys here, as such

;(global-set-key (kbd "[SHORTCUT]") '[FUNCTION])
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)
(global-set-key (kbd "M-/") 'undo-tree-visualize)
(global-set-key (kbd "C-c j") 'pop-to-mark-command)
(global-set-key (kbd "C-x t") 'eshell)
(setq set-mark-command-repeat-pop t)
;; (global-set-key (kbd "C->") 'ace-jump-mode)

(provide 'base-global-keys)
