(use-package mozc
  :ensure t
  :config
  (prefer-coding-system 'utf-8))
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'overlay)

;; このPCだとf13がキーコード108と解釈されていた
;; 本来別のキーになる可能性もあるため日本語おかしくなるとここを参照
;; http://bearmini.hatenablog.com/entry/2013/07/12/161637
(if (eq window-system 'x)
    (shell-command "xmodmap -e 'keycode 108 = F13'"))

(global-set-key [f13] 'mozc-mode)
