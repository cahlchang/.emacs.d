(use-package exec-path-from-shell
  :straight t
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize)
  )


(show-paren-mode t)                       ;; 対応する括弧をハイライト
(setq show-paren-style 'expression)            ;; 括弧のハイライトの設定。
(transient-mark-mode t)                   ;; 選択範囲をハイライト

;;window move
(setq windmove-wrap-around t)

(define-key global-map (kbd "C-M-p") 'windmove-up)
(define-key global-map (kbd "C-M-n") 'windmove-down)
(define-key global-map (kbd "C-M-f") 'windmove-right)
(define-key global-map (kbd "C-M-b") 'windmove-left)

;;buffer rename
(define-key global-map (kbd "C-M-S-r") 'rename-buffer)

;; reload buffer
(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
  (interactive "P")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))

(global-set-key "\M-r" 'revert-buffer-no-confirm)


(use-package ag
  :ensure t
  :config)
