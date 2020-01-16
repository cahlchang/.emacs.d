;;font
(cond ((string-match "apple-darwin" system-configuration) ;; Mac
       (when (and (>= emacs-major-version 24) (not (null window-system)))
         (let* ((font-family "Menlo")
                (font-size 9)
                (font-height (* font-size 19))
                (jp-font-family "ヒラギノ角ゴ ProN"))
           (set-face-attribute 'default nil :family font-family :height font-height)
           (let ((name (frame-parameter nil 'font))
                 (jp-font-spec (font-spec :family jp-font-family))
                 (jp-characters '(katakana-jisx0201
                                  cp932-2-byte
                                  japanese-jisx0212
                                  japanese-jisx0213-2
                                  japanese-jisx0213.2004-1))
                 (font-spec (font-spec :family font-family))
                 (characters '((?\u00A0 . ?\u00FF)    ; Latin-1
                               (?\u0100 . ?\u017F)    ; Latin Extended-A
                               (?\u0180 . ?\u024F)    ; Latin Extended-B
                               (?\u0250 . ?\u02AF)    ; IPA Extensions
                               (?\u0370 . ?\u03FF)))) ; Greek and Coptic
             (dolist (jp-character jp-characters)
               (set-fontset-font name jp-character jp-font-spec))
             (dolist (character characters)
               (set-fontset-font name character font-spec))
             (add-to-list 'face-font-rescale-alist (cons jp-font-family 1.2)))))))


(require 'hl-line)
;;; hl-line を無効にするメジャーモードを指定する
(defvar global-hl-line-timer-exclude-modes '(todotxt-mode))
(defun global-hl-line-timer-function ()
  (unless (memq major-mode global-hl-line-timer-exclude-modes)
    (global-hl-line-unhighlight-all)
    (let ((global-hl-line-mode t))
      (global-hl-line-highlight))))
(setq global-hl-line-timer
      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))
;; (cancel-timer global-hl-line-timer)


(use-package zerodark-theme)

(use-package fic-ext-mode
  :disabled t
  :config
  (defun add-something-to-mode-hooks (mode-list something)
    "helper function to add a callback to multiple hooks"
    (dolist (mode mode-list)
      (add-hook (intern (concat (symbol-name mode) "-mode-hook")) something)))
  (add-something-to-mode-hooks '(c++ emacs-lisp ruby text scala) 'fic-ext-mode))

;;line
(global-linum-mode t)
(setq linum-format "%4d")

;;; 最終行に必ず一行挿入する
(setq require-final-newline t)



;; Tabs/Spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-stop-list (number-sequence 4 120 4))

(require 'whitespace)
(setq whitespace-line-column 80)

(setq whitespace-style
      '(face           ; faceで可視化
        trailing       ; 行末
        tabs           ; タブ
        spaces         ; スペース
        empty          ; 先頭/末尾の空行
        space-mark     ; 表示のマッピング
        tab-mark))

(global-whitespace-mode t)
(add-hook 'term-mode-hook
          (lambda()
            (whitespace-mode 0)))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)

;; remove toolbar
(menu-bar-mode 0)
(tool-bar-mode 0)
