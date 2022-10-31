(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("78e6be576f4a526d212d5f9a8798e5706990216e9be10174e3f3b015b8662e27" "81eedac030249f826681ab768953f5b0f671d4b069bd6c9c486f762644b24d7c" "ff94bc11cb1ddef83cfdf87c2079b80182c00d50f42184c2a6f61de6773652e6" "fe1c13d75398b1c8fd7fdd1241a55c286b86c3e4ce513c4292d01383de152cb7" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" default))
 '(package-selected-packages
   '(q-mode evil-escape monokai-theme dashboard all-the-icons which-key centaur-tabs airline-themes cpupower rainbow-delimiters dracula-theme counsel swiper ivy company gruvbox-theme evil)))
;; Setting English Font
(set-face-attribute
  'default nil :font "IBM Plex Mono 14")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
					charset
					(font-spec : "Microsoft YaHei Mono" :size 14)))
;;load-path
(add-to-list 'load-path "d:/Program Files/emacs-28.2/.emacs.d/lisp/")
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
;;airline
(require 'airline-themes)
(load-theme 'airline-onedark t)
;;line-number
(global-display-line-numbers-mode)
(global-hl-line-mode t)
;;evil mode
(require 'evil)
(evil-mode 1)
;;cursor settings
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
;;evil-leader
(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" 'find-file
  "k" 'kill-buffer
  "w" 'save-buffer)
;;ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
;;rainbow-delimiters
(require 'rainbow-delimiters)
;;all-the-icons
(require 'all-the-icons)
;;q-mode
(autoload 'q-mode "q-mode")
(add-to-list 'auto-mode-alist '("\\.[kq]\\'" . q-mode))
;;centaur-tabs
(require 'centaur-tabs)
(centaur-tabs-mode t)
(centaur-tabs-headline-match)
(setq centaur-tabs-style "bar")
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-plain-icons t)
(setq centaur-tabs-set-bar 'left)
(setq centaur-tabs-close-button "X")
(add-hook 'dired-mode-hook 'centaur-tabs-local-mode)
(global-set-key [(meta j)] 'centaur-tabs-backward)
(global-set-key [(meta k)] 'centaur-tabs-forward)
;;which-key
(require 'which-key)
(which-key-mode)
;;set encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
;;dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)
;;evil-escape
(evil-escape-mode t)
(setq-default evil-escape-key-sequence "jk")
