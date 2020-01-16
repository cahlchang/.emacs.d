(use-package wgrep-ag :ensure t :after ag
  :config (bind-keys :map ag-mode-map
                     ("W" . wgrep-change-to-wgrep-mode)
                     ("S" . wgrep-save-all-buffers)
                     ("F" . wgrep-finish-edit)))
(use-package ag
  :ensure t
  :commands (ag-regexp ag-project-regexp)
  :bind ("C-c g" . ag-project-regexp))
