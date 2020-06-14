  (use-package ace-window
    :functions hydra-frame-window/body
    :bind
    ("C-M-o" . hydra-frame-window/body)
    :custom
    (aw-keys '(?j ?k ?l ?i ?o ?h ?y ?u ?p))
    :custom-face
    (aw-leading-char-face ((t (:height 4.0 :foreground "#f1fa8c"))))
