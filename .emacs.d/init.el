;; Menu
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)

;; Define and initialise package repositories
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;; Font
(set-face-attribute 'default nil :height 110)

;; Themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t) 
  (load-theme 'doom-one t))

;; Which key mode
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

;; Evil mode
(use-package evil)
(require 'evil)
(evil-mode 1)

;; Key binds
(setq  x-meta-keysym 'super
       x-super-keysym 'meta)
(use-package key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;; splash screen
(use-package dashboard
	:ensure t
	:config
	(setq dashboard-startup-banner 'logo)
	(setq dashboard-center-content t)
	(dashboard-setup-startup-hook))
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; Load custom into custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
