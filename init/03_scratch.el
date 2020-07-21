(use-package auto-save-buffers-enhanced)
;; Suppress Wrote's message
;; (setq auto-save-buffers-enhanced-quiet-save-p t)
;; ;; Scratch buffer is also saved automatically
;; (setq auto-save-buffers-enhanced-save-scratch-buffer-to-file-p t)
(setq auto-save-buffers-enhanced-file-related-with-scratch-buffer "~/.emacs.d/scratch")
(auto-save-buffers-enhanced t)

(defun my:pop-scratch ()
  "Popup the scratch buffer."
  (interactive)
  (setq popwin:special-display-config '(("*scratch*")))
  (display-buffer "*scratch*"))
