(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(custom-enabled-themes '(gruvbox-dark-hard))
 '(custom-safe-themes
   '("81eedac030249f826681ab768953f5b0f671d4b069bd6c9c486f762644b24d7c" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" default))
 '(org-export-backends '(ascii html icalendar latex odt))
 '(package-selected-packages
   '(org evil-leader csv-mode smart-mode-line company-box company-ebdb marginalia avy amx use-package ytdl q-mode evil-escape dashboard which-key centaur-tabs cpupower rainbow-delimiters counsel swiper ivy gruvbox-theme evil))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#1d2021")))
;;generic cofiguration
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(electric-pair-mode t)
(global-display-line-numbers-mode)
(global-hl-line-mode t)
(column-number-mode)
(add-hook 'prog-mode-hook #'show-paren-mode)
;; Setting English Font
(set-face-attribute
 'default nil :font "IBM Plex Mono 14")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec : "Microsoft YaHei Mono" :size 14)))
;;load-path
(add-to-list 'load-path "d:/Program Files/emacs/.emacs.d/lisp/")
;;backup
;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "e:/emacs-backups"))))
;;Setting frame size
(add-to-list 'default-frame-alist '(height . 26))
(add-to-list 'default-frame-alist '(width . 90))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;use-package
(eval-when-compile
  (require 'use-package))
;;evil mode
(use-package evil
  :ensure t
  :init
  (evil-mode 1)
  :config
  (setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))
  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-normal-state-cursor '("green" box))
  (setq evil-visual-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-replace-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow)) )
;;evil-leader
(use-package evil-leader
  :ensure t
  :config
  (setq in-all-states 1)
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "e" 'find-file
    "k" 'kill-buffer
    "w" 'save-buffer))
;;ivy
(use-package counsel
  :ensure t)
(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d%d)")
  (setq enable-recursive-minibuffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  :bind
  (("C-s" . 'swiper)
   ("M-y" . 'counsel-yank-pop)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c V" . 'ivy-pop-view)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))
;;rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook
  (foo-mode . rainbow-delimiters-mode)
  (prog-mode . rainbow-delimiters-mode))
;;amx
(use-package amx
  :ensure t
  :init
  (amx-mode 1))
;;q-mode
(autoload 'q-mode "q-mode")
(add-to-list 'auto-mode-alist '("\\.[kq]\\'" . q-mode))
;;centaur-tabs
(use-package centaur-tabs
  :ensure t
  :demand
  :init
  (centaur-tabs-mode t)
  :config
  (centaur-tabs-headline-match)
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-plain-icons t)
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-set-bar 'left)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker "*")
  :bind
  (("M-j" . 'centaur-tabs-backward)
   ("M-k" . 'centaur-tabs-forward))
  :hook
  (dired-mode . centaur-tabs-local-mode))
;;which-key
(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))
;;set encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
;;dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
;;evil-escape
(use-package evil-escape
  :ensure t
  :init
  (evil-escape-mode t)
  :config
  (setq-default evil-escape-key-sequence "jk"))
;;avy
(use-package avy
  :ensure t
  :bind
  (("C-'" . avy-goto-char-timer)))
;;marginalia
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1)
  :bind
  (:map minibuffer-local-map
	("M-A" . marginalia-cycle)))
;;company
(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t)
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence)))
;;
(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))
;;ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;org-mode
(add-hook 'org-mode-hook #'turn-on-font-lock)
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(setq org-latex-toc-command "\\tableofcontents \\clearpage")
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(setq org-latex-listings 'minted)
(setq org-latex-minted-options '(("breaklines" "true")
								 ("breakanywhere" "true")))
(setq org-latex-pdf-process
'("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
  "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;;ytdl
(setq ytdl-download-folder (expand-file-name "d:/music"))
