;; typescript
(straight-use-package 'typescript-mode)
(straight-use-package 'tide)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-hook 'typescript-mode-hook
          '(lambda ()
             (interactive)
             (tide-setup)
             (flycheck-mode +1)	     
             (tide-hl-identifier-mode +1)
             (company-mode +1)
             (eldoc-mode +1)
             ))
;; lsp
;; npm install vls -g
(use-package lsp-mode
  :commands lsp
  :hook ((vue-mode . lsp)
	 (typescript-mode . lsp)
	 (python-mode . lsp))
  :config
  (setq lsp-prefer-flymake nil
	lsp-log-io nil
	lsp-trace nil
	lsp-print-performance t
	lsp-response-timeout 20
	)
  )
(use-package lsp-ui
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t
	lsp-ui-doc-use-childframe t
	lsp-ui-doc-position 'top
	lsp-ui-doc-include-signature t
	lsp-ui-sideline-enable nil
	lsp-ui-flycheck-enable t
	lsp-ui-flycheck-list-position 'right
	lsp-ui-flycheck-live-reporting t
	lsp-ui-peek-enable t
	lsp-ui-peek-list-width 60
	lsp-ui-peek-peek-height 25
	)
  )
(use-package company-lsp
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-async t
	company-lsp-cache-candidates 'auto
	company-lsp-match-candidate-predicate #'company-lsp-match-candidate-flex
	)
  )

(setq typescript-indent-level 2) 
