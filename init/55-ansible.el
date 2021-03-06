(use-package yaml-mode
  :mode ("\\.yaml\\'" "\\.yml\\'")
  :custom-face
  (font-lock-variable-name-face ((t (:foreground "violet")))))

(use-package highlight-indent-guides
  :diminish
  :hook
  ((prog-mode yaml-mode) . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-auto-enabled t)
  (highlight-indent-guides-responsive t)
  (highlight-indent-guides-method 'character)) ; column

(use-package yaml-mode
  :mode "\\.vault"

  :config
  (add-hook 'yaml-mode-hook (lambda () (auto-fill-mode -1)))
  (add-hook 'yaml-mode-hook 'flyspell-mode-off))

(use-package ansible
  :after yaml-mode

  :custom
  (ansible-vault-password-file "~/.emacs.d/.ansible-vault")

  :hook (yaml-mode . ansible)

  :bind
  (:map ansible-key-map
        ("C-c v" . rr/set-ansible-vault-mimipass-pwd)
        ("C-c C-d" . ansible-doc))

  :config
  (add-hook 'ansible-hook 'ansible-auto-decrypt-encrypt)
  (defun rr/write-string (string file)
    (with-temp-buffer
      (insert string)
      (write-region (point-min) (point-max) file)))

  (defun rr/set-ansible-vault-mimipass-pwd ()
    "Choose which mimipass password to be used for ansible vault."
    (interactive)
    (rr/write-string (format "#!/bin/bash\nmimipass get %s"
                             (rr/helm-mimipass))
                     ansible-vault-password-file)
    (chmod ansible-vault-password-file
           (string-to-number "700" 8))))

(use-package company-ansible
  :hook ansible-mode)

(use-package ansible-doc
  :hook ansible
  :bind
  (:map ansible-doc-module-mode-map
        ("C-x C-s" . ignore)))

