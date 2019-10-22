;; コード補完とかしてくれる
(use-package company
  :ensure t
  :init (global-company-mode) ; 全バッファで有効にする
  :config
  (setq company-idle-delay 0) ; デフォルトは0.5
  (setq company-minimum-prefix-length 2) ; デフォルトは4
  (setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
  (add-to-list 'company-backends 'company-edbi)
  (global-set-key (kbd "C-<tab>") 'company-complete)
  )

;; companyにアイコンとか表示してくれるっぽい
(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

;; コードブロックごとにregionを作れる
(use-package expand-region
  :ensure t
  :bind* ("C-c SPC" . er/expand-region)
  )

;; 検索時に一致した数をモードラインに出してくれる
(use-package anzu
  :ensure t
  :init (global-anzu-mode +1)
  )
