(require 'package)
(require 'recentf)
(require 'flycheck-clj-kondo)

;; required for org mode
(add-to-list 'package-archives
	     '("org" . "https://orgmode.org/elpa/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; setup maximized startup
(add-to-list 'default-frame-alist
	     '(fullscreen . maximized))

;; setup text size
(set-face-attribute 'default nil :height 140)

(package-initialize)

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
 '(global-linum-mode t)
 '(package-selected-packages
   '(projectile clojure-mode treemacs company flycheck-clj-kondo multiple-cursors org aggressive-indent paredit rainbow-delimiters exec-path-from-shell cider)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; setup exec-path-from-shell for emacs shell to work with mac env variables
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; hook to set company mode always on
(add-hook 'after-init-hook #'global-company-mode)

;; hooks to make clojure mode better
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'flycheck-mode)

;; enable ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
 
;; enable recent files
(recentf-mode 1)
(setq recentf-max-saved-items 50)

;; setup neotree toggle keybinding
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
;; alt version for recentf open files without ido mode
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; use treemacs keybinding
(global-set-key [f8] 'treemacs)

;; setup multi cursor shortcut
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; defuns

;; TODO: export me
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))
