(require 'package)

;; required for org mode [IM]
(add-to-list 'package-archives '
	     ("org" . "https://orgmode.org/elpa/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; setup maximized startup [IM]
(add-to-list 'default-frame-alist
	     '(fullscreen . maximized))

;; setup text size [IM]
(set-face-attribute 'default nil :height 140)

(package-initialize)

;; set emacs shell to work with mac env variables [IM]
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes '(wheatgrass))
 '(package-selected-packages
   '(multiple-cursors neotree org aggressive-indent paredit rainbow-delimiters exec-path-from-shell cider)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; hooks to make clojure mode better [IM]
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)

;; enable ido-mode [IM]
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; enable recent files [IM]
(recentf-mode 1)

(global-set-key [f8] 'neotree-toggle)
