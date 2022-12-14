;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Daniele Trainini"
      user-mail-address "dani84bs@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 15 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 15))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Library/CloudStorage/GoogleDrive-dani84bs@gmail.com/My Drive/org")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq! doom-leader-alt-key "C-s")
(setq! doom-localleader-alt-key "C-s m")

(after! lsp-mode
  (setq! lsp-lens-enable nil)
  (setq! lsp-pylsp-plugins-pydocstyle-enabled nil)
  (setq! lsp-pylsp-plugins-yapf-enabled t)
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-tramp-connection "pylsp")
                    :major-modes '(python-mode)
                    :remote? t
                    :server-id 'pylsp-remote)))

(add-hook 'org-mode-hook #'auto-fill-mode)

(after! org
  (setq org-table-convert-region-max-lines 10000)
  (setq org-hide-emphasis-markers t
        org-fontify-done-headline t)
  (add-to-list 'org-latex-packages-alist
               '("AUTO" "babel" t ("pdflatex")))
  (add-to-list 'org-latex-packages-alist
               '("AUTO" "polyglossia" t ("xelatex" "lualatex")))
  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (setq org-latex-listings 'minted)
  (setq org-latex-listings-options '(("breaklines" "true")))
  (setq org-latex-pdf-process
        '("latexmk -shell-escape -interaction=nonstopmode -f -pdf -output-directory=%o %f")))


(add-hook! 'window-setup-hook #'toggle-frame-maximized)
;;(setq! +format-on-save-enabled-modes (append +format-on-save-enabled-modes '(mhtml-mode)))

(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))
(add-hook 'c++-mode-hook (lambda ()
                           (platformio-conditionally-enable)))

(setq projectile-ignored-projects '("~/" "/tmp"))

;; (setq lsp-sourcekit-extra-args (quote ("--sync")))

(defun org-babel-edit-prep:jupyter-python (babel-info)
  (setq-local buffer-file-name (->> babel-info caddr (alist-get :tangle)))
  (lsp))

(load! "+swift")

(after! explain-pause-mode
  (setq explain-pause-slow-too-long-ms 400))

(map! :leader
      (:prefix ("o" . "open")
       :desc "Calculator"              "c" #'calc))


(setq calc-angle-mode 'rad
      calc-symbolic-mode t)

(setq vterm-kill-buffer-on-exit t)
(use-package! multi-vterm
  :after vterm)
(setq evil-ex-substitute-global t)
(setq dap-ui-variable-length 200)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

(after! dart-mode
  (require 'flutter)
  (defun flutter-build-build-runner ()
    (interactive)
    (pop-to-buffer-same-window
     (flutter--from-project-root
      (make-comint "Build Runner" (flutter-build-command) nil "pub" "run" "build_runner" "build"))))
  (map! :map dart-mode-map
        :localleader
        (:prefix ("f" . "flutter")
                 "b" #'flutter-build-build-runner)))

(use-package! dbc-mode
  :mode "\\.dbc\\'"
  )
