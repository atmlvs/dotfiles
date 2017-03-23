(use-package alchemist
  :config
  (add-hook 'elixir-mode-hook 'alchemist-mode)
  (setq alchemist-goto-erlang-source-dir "/usr/local/share/otp/"
	alchemist-goto-elixir-source-dir "/usr/local/share/elixir/"))

(use-package flycheck-mix
  :commands (flycheck-mix-setup))

(use-package elixir-mode)
(use-package erlang
  :bind (:map erlang-mode-map ("M-," . alchemist-goto-jump-back))
  :config
  (setq erlang-indent-level 2))

(provide 'lang-elixir)
