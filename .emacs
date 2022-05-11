(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" "3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default))
 '(display-line-numbers-type 'relative)
 '(frame-brackground-mode 'dark)
 '(menu-bar-mode nil)
 '(package-selected-packages '(lsp-ui lsp-mode magit gruber-darker-theme evil))
 '(toggle-scroll-bar -1)
 '(tool-bar-mode nil))
 ;; removing toolbar

(require 'evil)
(evil-mode 1)

;;(require 'lsp-mode)
;;(lsp-mode 1)
;;(add-hook 'go-mode-hook 'lsp)

(setq evil-insert-state-cursor '((bar . 3) "yellow") evil-normal-state-cursor '(box "yellow"))

(set-face-attribute 'default nil :font "Iosevka Fixed")

(setq inhibit-startup-screen t)
(toggle-scroll-bar -1)

(global-display-line-numbers-mode) ;; set number

(setq auto-save-default nil) ;; remove temp files
(setq make-backup-files nil)



(setq compile-command "") 
