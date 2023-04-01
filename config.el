;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "cjtong"
      user-mail-address "939896399@qq.com")

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
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'monokai)
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
(setq org-directory "~/SparkleShare/mynotes/GTD/")
;; (setq org-noter-notes-search-path '("~/SparkleShare/mynotes"))
;; (setq org-agenda-files (list (concat org-directory "task.org")))
(setq org-agenda-files '("~/SparkleShare/mynotes/GTD/"))
(setq org-src-fontify-natively t)
(setq org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d)" "ABORT(a)")))
(setq org-bullets-bullet-list '("🚀" "🚄" "🚉" "⛵" "🚌" "🚔" "🚲"))
(setq org-default-notes-file (expand-file-name "task.org" org-directory))
(setq org-capture-templates
        '(("W" "work" entry (file+headline "task.org" "工作安排")
        "* TODO [#A] %? \t:work:\nSCHEDULED: <%<%Y-%m-%d %a>> \n"
        :empty-lines 1)
        ("w" "work by link" entry (file+headline "task.org" "工作安排")
        "* TODO [#A] %?%a \t:work:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        ("T" "tools" entry (file+headline "task.org" "tools")
        "* TODO [#B] %? \t:tools:\nSCHEDULED: <%<%Y-%m-%d %a>> \n"
        :empty-lines 1)
        ("t" "tools by link" entry (file+headline "task.org" "tools")
        "* TODO [#A] %?%a \t:tools:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        ("L" "learning" entry (file+headline "task.org" "learning")
        "* TODO [#B] %? \t:learning:\nSCHEDULED: <%<%Y-%m-%d %a>> \n"
        :empty-lines 1)
        ("l" "learning by link" entry (file+headline "task.org" "learning")
        "* TODO [#A] %?%a \t:learning:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        ("Z" "threemen" entry (file+headline "task.org" "threemen")
        "* TODO [#B] %? \t:threemen:\nSCHEDULED: <%<%Y-%m-%d %a>> \n"
        :empty-lines 1)
        ("z" "threemen by link" entry (file+headline "task.org" "threemen")
        "* TODO [#A] %?%a \t:threemen:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        ("O" "others" entry (file+headline "task.org" "others")
        "* TODO [#C] %? \t:other:\nSCHEDULED: <%<%Y-%m-%d %a>> \n"
        :empty-lines 1)
        ("o" "others by link" entry (file+headline "task.org" "others")
        "* TODO [#A] %?%a \t:others:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        ("e" "email" entry (file+headline "task.org" "email")
        "* TODO [#A] %?%a \t:email:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        ("f" "fix" entry (file+headline "task.org" "fix")
        "* TODO [#A] %?%a \t:fix:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        )))

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

;; set fullscren maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (add-hook 'window-setup-hook #'toggle-frame-maximized)
;; (add-hook 'window-setup-hook #'toggle-frame-fullscreen)
(add-to-list 'auto-mode-alist '("\\.launch\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))

(setq fancy-splash-image '"~/Pictures/dolphin.png")
;; custommize function
(defun mynotes ()
    (interactive)
(dired "~/SparkleShare/mynotes"))

(defun devdocs-search ()
"Search for QUERY in the DevDocs website."
(interactive)
(let ((devdocs-site-url "https://devdocs.io")
        (query (if (use-region-p)
                (buffer-substring (region-beginning) (region-end))
                (thing-at-point 'symbol))))
(message "" devdocs-site-url)
(browse-url (format "%s/#q=%s" devdocs-site-url (url-hexify-string query)))))


;; (map! :leader
;;     (:prefix ("o" . "open in browser")
;;       :desc "Open mynotes"  "n"  #'mynotes))
(map! :leader
      :desc "Open mynotes"
      "o n" #'mynotes)
(map! :leader
      :desc "Lookup Dictionary"
      "o y" #'youdao-dictionary-search-at-point-posframe)
(map! :leader
      :desc "Lookup Devdocs"
      "o h" #'devdocs-search)

;; (global-set-key (kbd "C-x C-;") #'comment-line)
;; (define-key global-map (kbd "SPC o n") #'mynotes)
(use-package sis
  ;; :hook
  ;; enable the /context/ and /inline region/ mode for specific buffers
  ;; (((text-mode prog-mode) . sis-context-mode)
  ;;  ((text-mode prog-mode) . sis-inline-mode))

  :config
  ;; For MacOS
  ;; (sis-ism-lazyman-config

  ;;  ;; English input source may be: "ABC", "US" or another one.
  ;;  ;; "com.apple.keylayout.ABC"
  ;;  "com.apple.keylayout.US"

  ;;  ;; Other language input source: "rime", "sogou" or another one.
  ;;  ;; "im.rime.inputmethod.Squirrel.Rime"
  ;;  "com.sogou.inputmethod.sogou.pinyin")
  (sis-ism-lazyman-config "1" "2" 'fcitx)

  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /context/ mode for all buffers
  (sis-global-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)
  )

