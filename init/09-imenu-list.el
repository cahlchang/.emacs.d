  (use-package imenu-list
    :bind
    ("<f10>" . imenu-list-smart-toggle)
    :custom-face
    (imenu-list-entry-face-1 ((t (:foreground "white"))))
    :custom
    (imenu-list-focus-after-activation t)
    (imenu-list-auto-resize nil))
