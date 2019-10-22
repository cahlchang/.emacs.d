(use-package eglot
  :hook ((python-mode rust-mode kotlin-mode ruby-mode) . eglot-ensure)
  :config
  ;; Fix column calculation when ligatures are used
  (setq eglot-current-column-function 'eglot-lsp-abiding-column
        eglot-move-to-column-function 'eglot-move-to-lsp-abiding-column
        eglot-autoshutdown t
        eglot-autoreconnect nil)
  (general-define-key :keymap 'eglot-mode-map "C-h ." 'eglot-help-at-point))
