(use-package magit
  :init    ;; :config でも可
  (bind-key "M-g"  'magit-status)
  (bind-key "C-x M-g"  'magit-dispatch-popup)
  )
