(use-package dashboard
  :diminish
  (dashboard-mode page-break-lines-mode)
  :custom
  (dashboard-startup-banner 4)
  (dashboard-items '((recents . 15)
                     (projects . 5)
                     (bookmarks . 5)
                     (agenda . 5)))
  :hook
  (after-init . dashboard-setup-startup-hook)
  :config
  (add-to-list 'dashboard-items '(agenda) t))

(use-package exec-path-from-shell
  :straight t
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize)
  )

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

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

(savehist-mode 1)
(persistent-scratch-setup-default)

(use-package ag
  :ensure t
  :config)


(use-package which-key
  :diminish which-key-mode
  :hook (after-init . which-key-mode))

;; keybindings
(use-package general :ensure t
  :config
  (setq general-default-keymaps 'evil-normal-state-map)
  ;; unbind space from dired map to allow for git status
  (general-define-key :keymaps 'dired-mode-map "SPC" nil))

(use-package amx)


(persistent-scratch-setup-default)
(setq indent-tabs-mode nil) 
