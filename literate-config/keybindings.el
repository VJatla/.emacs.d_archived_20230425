(use-package keyfreq
:ensure t
:config
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)
(setq keyfreq-exclude-commands '(self-insert-command org-cycle)))


