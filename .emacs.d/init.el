;; Menu
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

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

;; Theme
(use-package underwater-theme
	:config (load-theme 'underwater t))

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
