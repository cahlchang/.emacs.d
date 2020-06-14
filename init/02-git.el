(use-package magit
  :init    ;; :config でも可
  (bind-key "M-g"  'magit-status)
  (bind-key "C-x M-g"  'magit-dispatch-popup)
  )

(use-package git-gutter
    :custom
    (git-gutter:modified-sign "~")
    (git-gutter:added-sign    "+")
    (git-gutter:deleted-sign  "-")
    :custom-face
    (git-gutter:modified ((t (:background "#f1fa8c"))))
    (git-gutter:added    ((t (:background "#50fa7b"))))
    (git-gutter:deleted  ((t (:background "#ff79c6"))))
    :config
    (global-git-gutter-mode +1))
