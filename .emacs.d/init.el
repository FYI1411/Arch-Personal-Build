;; Menu
(tool-bar-mode -1)
(menu-bar-mode 1)
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

;; Update
(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 7)
   (auto-package-update-maybe))

;; Font
(set-face-attribute 'default nil :height 110)

;; Themes
(use-package doom-themes
  	:ensure t
  	:config
  	(setq doom-themes-enable-bold t
		doom-themes-enable-italic t)
	(load-theme 'doom-one t))

;; Modeline
(use-package all-the-icons)
(use-package doom-modeline
	:init (doom-modeline-mode 1))

;; Which key mode
(use-package which-key
	:ensure t
	:init
	(which-key-mode))

;; Evil mode
(use-package evil)
(require 'evil)
(evil-mode 1)
(evil-set-undo-system 'undo-redo)
(use-package evil-nerd-commenter
	:bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; Key binds
(setq  x-meta-keysym 'super
       x-super-keysym 'meta)
(use-package key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)
(windmove-default-keybindings)

;; Splash screen
(use-package dashboard
	:ensure t
	:config
	(setq dashboard-startup-banner 'logo)
	(setq dashboard-center-content t)
	(dashboard-setup-startup-hook))
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; Line numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; Completion
(use-package lsp-mode
  	:commands (lsp lsp-deferred)
  	:init (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  	:hook (python-mode . lsp)
		(c-mode . lsp)
		(c++-mode . lsp)
  :config (lsp-enable-which-key-integration t))
(use-package company
  	:after lsp-mode
  	:hook (prog-mode . company-mode)
  	:bind (:map company-active-map
        ("<tab>" . company-complete-selection))
       	(:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  	:custom
  	(company-minimum-prefix-length 1)
  	(company-idle-delay 0.0))
(use-package company-box
  	:hook (company-mode . company-box-mode))
(use-package lsp-ui
  	:hook (lsp-mode . lsp-ui-mode))
(use-package lsp-treemacs
	:after lsp)

;; Backup
(setq backup-directory-alist
	`((".*" . ,"~/tmp/")))
(setq version-control t
	delete-old-versions t
	backup-by-copying t)

;; Auto-save
(setq auto-save-file-name-transforms
	`((".*" ,"~/tmp/" t)))
(setq auto-save-visited-mode t)

;; Magit
(use-package magit 
	:ensure t)

;; Load custom into custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Startup commands
(save-selected-window (treemacs-select-window))
