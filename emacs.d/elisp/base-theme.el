(use-package spacemacs-theme
  :defer t
  ;; :init (load-theme 'spacemacs-dark t)
  ;; :init (load-theme 'spacemacs-light t)
  )

(use-package ample-theme
  :init (progn
	  (load-theme 'ample t t)
	  (load-theme 'ample-light t t)
	  ;; (enable-theme 'ample)
	  ;; (enable-theme 'ample-light)
	  )
  :defer t
  :ensure t)

(use-package material-theme
  :init (progn
	  (load-theme 'material t)
	  (load-theme 'material-light t)
	  ;; (enable-theme 'material)
	  (enable-theme 'material-light)
	  )
  :defer t
  :ensure t)

(use-package zenburn-theme
  :defer t)

(use-package monokai-theme
  :defer t
  :config
  (setq ;; foreground and background
        monokai-foreground     "#ABB2BF"
        monokai-background     "#282C34"
        ;; highlights and comments
        monokai-comments       "#F8F8F0"
        monokai-emphasis       "#282C34"
        monokai-highlight      "#FFB269"
        monokai-highlight-alt  "#66D9EF"
        monokai-highlight-line "#1B1D1E"
        monokai-line-number    "#F8F8F0"
        ;; colours
        monokai-blue           "#61AFEF"
        monokai-cyan           "#56B6C2"
        monokai-green          "#98C379"
        monokai-gray           "#3E4451"
        monokai-violet         "#C678DD"
        monokai-red            "#E06C75"
        monokai-orange         "#D19A66"
        monokai-yellow         "#E5C07B")
  (setq monokai-height-minus-1 0.8
        monokai-height-plus-1 1.1
        monokai-height-plus-2 1.15
        monokai-height-plus-3 1.2
        monokai-height-plus-4 1.3)
  )

(use-package jazz-theme
  :defer t)

(provide 'base-theme)
