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
(cancel-timer global-hl-line-timer)


(use-package doom-themes
  :custom
  (doom-themes-enable-italic t)
  (doom-themes-enable-bold t)
  :custom-face
  (doom-modeline-bar ((t (:background "#6272a4"))))
  :config
  (load-theme 'doom-dracula t)
  (doom-themes-neotree-config)

  (doom-themes-org-config))

(use-package doom-modeline
  :custom
  (doomz-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-minor-modes nil)
  :hook
  (after-init . doom-modeline-mode)
  :config
  (line-number-mode 0)
  (column-number-mode 0)
  (doom-modeline-def-modeline 'main
    '(bar workspace-number window-number evil-state god-state ryo-modal xah-fly-keys matches buffer-info remote-host buffer-position parrot selection-info)
    '(misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs checker)))

(if (version<= "26.0.50" emacs-version)
    (progn
      (global-display-line-numbers-mode)
      (set-face-attribute 'line-number nil
                          :foreground "DarkOliveGreen"
                          :background "#131521")
      (set-face-attribute 'line-number-current-line nil
                          :foreground "gold")))

(setq require-final-newline t)

;; remove toolbar
(menu-bar-mode 0)
(tool-bar-mode 0)

(use-package hide-mode-line
  :hook
  ((neotree-mode imenu-list-minor-mode minimap-mode) . hide-mode-line-mode))

(use-package beacon
  :custom
  (beacon-color "yellow")
  :config
  (beacon-mode 1))

(require 'whitespace)
;; (setq whitespace-line-column 80)

(setq whitespace-style
      '(face           ; faceで可視化
        trailing       ; 行末
        tabs           ; タブ
        spaces         ; スペース
        empty          ; 先頭/末尾の空行
        space-mark     ; 表示のマッピング
        tab-mark))

(setq-default indent-tabs-mode nil)

(global-whitespace-mode t)
(add-hook 'term-mode-hook
          (lambda()
            (whitespace-mode 0)))

;; (setq whitespace-display-mappings
;;       '((space-mark ?\u3000 [?\u25a1])
;;         ;; WARNING: the mapping below has a problem.
;;         ;; When a TAB occupies exactly one column, it will display the
;;         ;; character ?\xBB at that column followed by a TAB which goes to
;;         ;; the next TAB column.
;;         ;; If this is a problem for you, please, comment the line below.
