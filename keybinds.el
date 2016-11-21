(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

(global-set-key [f8] 'cider-connect)
(global-set-key [M-f8] 'cider-quit)
(global-set-key [f5] 'cider-jack-in)

(global-set-key [f11] (lambda () (interactive) (find-file "~/.lein/profiles.clj")))
(global-set-key [f12] (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

(require 'projectile)

(define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
(define-key projectile-mode-map [?\s-g] 'projectile-grep)

(defun find-project-file (file)
  (find-file (expand-file-name file (projectile-project-root))))

(global-set-key [f9]
                (lambda () (interactive)
                  (find-project-file "dev/user.clj")))

(global-set-key [f10]
                (lambda () (interactive)
                  (find-project-file "project.clj")))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
;; hide/show
(global-set-key (kbd "C-.") 'hs-toggle-hiding)
(global-set-key (kbd "C-,") 'hs-hide-all)
(global-set-key (kbd "C-x C-,") 'hs-show-all)

;; Swap current buffer with buffer in direction of arrow
(global-set-key (kbd "<M-s-right>") 'buf-move-right)
(global-set-key (kbd "<M-s-left>") 'buf-move-left)
(global-set-key (kbd "<M-s-up>") 'buf-move-up)
(global-set-key (kbd "<M-s-down>") 'buf-move-down)

;; Move active cursor to window
(global-set-key [s-left] 'windmove-left)
(global-set-key [s-right] 'windmove-right)

(require 'paxedit)

(eval-after-load "paxedit"
  '(progn
     (define-key paxedit-mode-map (kbd "C-M-<right>") 'paxedit-transpose-forward)
     (define-key paxedit-mode-map (kbd "C-M-<left>") 'paxedit-transpose-backward)
     (define-key paxedit-mode-map (kbd "C-M-<up>") 'paxedit-backward-up)
     (define-key paxedit-mode-map (kbd "C-M-<down>") 'paxedit-backward-end)
     (define-key paxedit-mode-map (kbd "M-b") 'paxedit-previous-symbol)
     (define-key paxedit-mode-map (kbd "M-f") 'paxedit-next-symbol)
     (define-key paxedit-mode-map (kbd "C-%") 'paxedit-copy)
     (define-key paxedit-mode-map (kbd "C-&") 'paxedit-kill)
     (define-key paxedit-mode-map (kbd "C-*") 'paxedit-delete)
     (define-key paxedit-mode-map (kbd "C-^") 'paxedit-sexp-raise)
     (define-key paxedit-mode-map (kbd "M-u") 'paxedit-symbol-change-case)
     (define-key paxedit-mode-map (kbd "C-@") 'paxedit-symbol-copy)
     (define-key paxedit-mode-map (kbd "C-#") 'paxedit-symbol-kill)))

(require 'align-cljlet)

(global-set-key (kbd "s-i") 'align-cljlet)
(global-set-key [s-tab] 'company-complete)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-M-%") 'query-replace)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
