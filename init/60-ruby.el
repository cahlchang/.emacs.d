
(setq ruby-insert-encoding-magic-comment nil)
(projectile-rails-global-mode)

(use-package slim-mode
  :ensure t
  :mode ("\\.slim\\'" . slim-mode))

(use-package rspec-mode
  :ensure t
  :defer t)
