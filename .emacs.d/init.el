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

(unless (package-installed-p 'doom-themes)
 	(package-refresh-contents)
 	(package-install 'doom-themes))

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

;; Load custom into custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; splash screen
(use-package dashboard
	:ensure t
	:config
	(dashboard-setup-startup-hook))

;; completion
(use-package company
	:ensure t
	:config
	(setq company-idle-delay 0)
	(setq company-minimum-prefix-length 5))

(use-package company-irony
	:ensure t
	:config
	(add-to-list 'company-backends 'company-irony))

(use-package irony
	:ensure t
	:config
	(add-hook 'c++-mode-hook 'irony-mode)
	(add-hook 'c-mode-hook 'irony-mode)
	(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(with-eval-after-load 'company
	(add-hook 'c++-mode-hook 'company-mode)
	(add-hook 'c-mode-hook 'company-mode))
