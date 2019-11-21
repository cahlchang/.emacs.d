(use-package tramp
  :init (setq tramp-ssh-controlmaster-options
              "-o ControlMaster=auto  -o ControlPersist=no"))

(setq tramp-copy-size-limit nil)
(setq tramp-shell-prompt-pattern "^.*[#$%>] *")
(setq recentf-auto-cleanup 'never)
(setq tramp-verbose 9)
