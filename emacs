(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(setq package-check-signature nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-swoop magit helm use-package evil-visual-mark-mode evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

(use-package evil
  :config
  (evil-mode t))
(use-package magit)

(use-package helm
  :diminish helm-mode
   :init (progn
           (require 'helm-config)
           (setq helm-candidate-number-limit 100)
           ;; From https://gist.github.com/antifuchs/9238468
           (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
           helm-input-idle-delay 0.01  ; this actually updates things
                                       ; reeeelatively quickly.
           helm-yas-display-key-on-candidate t
           helm-quick-update t)
           (helm-mode)
           (use-package helm-swoop
           :ensure t
           :bind ("M-i" . helm-swoop)))
   :bind (("C-x b" . helm-mini)
          ("C-h a" . helm-apropos)
          ("M-y" . helm-show-kill-ring)
          ("M-x" . helm-M-x)
          ("C-x C-f" . helm-find-files))
   :config (define-key helm-map (kbd "TAB" ) 'helm-execute-persistent-action ))
 (ido-mode -1) ;; Turn off ido mode.

(use-package molokai-theme 
  :ensure t
  :load-path "themes"
  :init
  (setq molokai-theme-kit t)
  :config
  (load-theme 'molokai t)
  )

(display-time)
(setq display-time-format "%I:%M")
;; Hurts my ears
(setq ring-bell-function 'ignore)
;; set font to 13pt
(set-face-attribute 'default nil :height 110 :width 'normal)

;; Keep all backup and auto-save files in one directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Don't you dare to warn me!
(setq large-file-warning-threshold nil)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Transparently open compressed files
(auto-compression-mode t)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Lines should be 85 characters wide, not 72
(setq-default fill-column 80)

;; Turn off the blinking cursor
(blink-cursor-mode -1)

;; Enable show parenthesis
(show-paren-mode t)

;; highlight current line
(global-hl-line-mode t)
