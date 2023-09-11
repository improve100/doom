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
(setq doom-theme 'doom-molokai)
;; (setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
(setq org-directory "~/SparkleShare/mynotes/")
;; (setq org-noter-notes-search-path '("~/SparkleShare/mynotes"))
;; (setq org-agenda-files (list (concat org-directory "task.org")))
(setq org-agenda-files '("~/SparkleShare/mynotes/GTD/"))
(setq org-src-fontify-natively t)
(setq org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d)" "ABORT(a)")))
(setq org-bullets-bullet-list '("🚀" "🚄" "🚉" "⛵" "🚌" "🚔" "🚲"))
(setq org-default-notes-file (expand-file-name "GTD/task.org" org-directory))
(setq org-capture-templates
        '(("w" "work" entry (file+headline "GTD/task.org" "工作安排")
        "* TODO [#A] %? \t:work:\nSCHEDULED: <%<%Y-%m-%d %a>> \n"
        :empty-lines 1)
        ("W" "work by link" entry (file+headline "GTD/task.org" "工作安排")
        "* TODO [#A] %?%a \t:work:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        ("t" "tools" entry (file+headline "GTD/task.org" "tools")
        "* TODO [#B] %? \t:tools:\nSCHEDULED: <%<%Y-%m-%d %a>> \n"
        :empty-lines 1)
        ("T" "tools by link" entry (file+headline "GTD/task.org" "tools")
        "* TODO [#A] %?%a \t:tools:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        ("l" "learning" entry (file+headline "GTD/task.org" "learning")
        "* TODO [#B] %? \t:learning:\nSCHEDULED: <%<%Y-%m-%d %a>> \n"
        :empty-lines 1)
        ("L" "learning by link" entry (file+headline "GTD/task.org" "learning")
        "* TODO [#A] %?%a \t:learning:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        ("z" "threemen" entry (file+headline "GTD/task.org" "threemen")
        "* TODO [#B] %? \t:threemen:\nSCHEDULED: <%<%Y-%m-%d %a>> \n"
        :empty-lines 1)
        ("Z" "threemen by link" entry (file+headline "GTD/task.org" "threemen")
        "* TODO [#A] %?%a \t:threemen:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        ("o" "others" entry (file+headline "GTD/task.org" "others")
        "* TODO [#C] %? \t:other:\nSCHEDULED: <%<%Y-%m-%d %a>> \n"
        :empty-lines 1)
        ("O" "others by link" entry (file+headline "GTD/task.org" "others")
        "* TODO [#A] %?%a \t:others:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        ("e" "email" entry (file+headline "GTD/task.org" "email")
        "* TODO [#A] %?%a \t:email:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n"
        :empty-lines 1)
        ("f" "fix" entry (file+headline "GTD/task.org" "fix")
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
;; (setq ansi-color-for-compilation-mode 'filter)

(+global-word-wrap-mode +1)
;; set fullscren maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(setq create-lockfiles nil)
;; (add-hook 'window-setup-hook #'toggle-frame-maximized)
;; (add-hook 'window-setup-hook #'toggle-frame-fullscreen)
(add-to-list 'auto-mode-alist '("\\.launch\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))

(if (string= (system-name) "mingjiao")
  (setq fancy-splash-image '"~/Pictures/logo.png")
(setq fancy-splash-image '"~/Pictures/dolphin.png"))
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

(setq compile-command "catkin build --this -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=YES")


;; (setq consult-preview-key "C-M-SPC")

(after! magit
(defun magit-push-to-gerrit ()
  (interactive)
  (magit-git-command-topdir "git push origin HEAD:refs/for/master"))
  ;; (magit-git-command "push origin HEAD:refs/for/master" (magit-toplevel)))
(transient-append-suffix 'magit-push "p"
  '("m" "Push to gerrit" magit-push-to-gerrit)))


(defun org-notes-search (&optional arg)
  "Conduct a text search in the current project root.
If prefix ARG is set, include ignored/hidden files."
  ;; (interactive "P")
  (interactive)
  (let* (
         ;; (projectile-project-root nil)
         ;; (disabled-command-function nil)
         (consult-preview-key "TAB")
         (default-directory "~/SparkleShare/mynotes/"))
    (call-interactively
     (cond ((modulep! :completion ivy)     #'+ivy/project-search)
           ((modulep! :completion helm)    #'+helm/project-search)
           ((modulep! :completion vertico) #'+vertico/project-search)
           ;; ((modulep! :completion vertico) #'project-search)
           (#'projectile-ripgrep)))
    ))
(after! compile
  ;; The ANSI color hook leads to errors when compiling Haskell code.
  (remove-hook 'compilation-filter-hook #'ansi-color-compilation-filter))
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
(map! :leader
      :desc "Lookup Mynotes"
      "o s" #'org-notes-search)

(use-package! sis
  :config
  (sis-ism-lazyman-config "1" "2" 'fcitx)
   ;; (delete "C-h" sis-prefix-override-keys)
  (sis-global-respect-mode t)
  (sis-global-inline-mode t)
  (sis-global-context-mode t)
  (sis-global-cursor-color-mode t))
;; (global-set-key (kbd "C-x C-;") #'comment-line)
;; (define-key global-map (kbd "SPC o n") #'mynotes)
;; (use-package sis
;;   ;; :hook
;;   ;; enable the /context/ and /inline region/ mode for specific buffers
;;   ;; (((text-mode prog-mode) . sis-context-mode)
;;   ;;  ((text-mode prog-mode) . sis-inline-mode))

;;   :config
;;   ;; For MacOS
;;   ;; (sis-ism-lazyman-config

;;   ;;  ;; English input source may be: "ABC", "US" or another one.
;;   ;;  ;; "com.apple.keylayout.ABC"
;;   ;;  "com.apple.keylayout.US"

;;   ;;  ;; Other language input source: "rime", "sogou" or another one.
;;   ;;  ;; "im.rime.inputmethod.Squirrel.Rime"
;;   ;;  "com.sogou.inputmethod.sogou.pinyin")
;;   (sis-ism-lazyman-config "1" "2" 'fcitx)

;;   ;; enable the /cursor color/ mode
;;   (sis-global-cursor-color-mode t)
;;   ;; enable the /respect/ mode
;;   (sis-global-respect-mode t)
;;   ;; enable the /context/ mode for all buffers
;;   (sis-global-context-mode t)
;;   ;; enable the /inline english/ mode for all buffers
;;   (sis-global-inline-mode t)
;;   )
;; FIXME the ansi-color text issue in org-babel result block.
;; Source: https://github.com/nnicandro/emacs-jupyter/issues/376
;; Here is the function that jupyter-mime.el relies on,
;; found in an older ansi-color.el in an older emacs distribution.
(after! compile
  (add-hook 'compilation-filter-hook
            '(lambda () (ansi-color-apply-on-region (point-min) (point-max)))))
;; (defun ansi-color--find-face (codes)
;;   "Return the face corresponding to CODES."
;;   ;; Sort the codes in ascending order to guarantee that "bold" comes before
;;   ;; any of the colors.  This ensures that `ansi-color-bold-is-bright' is
;;   ;; applied correctly.
;;   (let (faces bright (codes (sort (copy-sequence codes) #'<)))
;;     (while codes
;;       (when-let ((face (ansi-color-get-face-1 (pop codes) bright)))
;;         (when (and ansi-color-bold-is-bright (eq face 'ansi-color-bold))
;;           (setq bright t))
;;         (push face faces)))
;;     ;; Avoid some long-lived conses in the common case.
;;     (if (cdr faces)
;;         (nreverse faces)
;;       (car faces))))

(setq python-shell-interpreter "~/.pyenv/versions/3.8.5/bin/python3.8")
(setq mind-wave-python-command "~/.pyenv/versions/3.8.5/bin/python3.8")
(use-package! mind-wave)
(setq auth-sources '("~/.authinfo"))
(setq forge-owned-accounts '(("improve100" . (remote-name "improve100"))))
(map! :leader
      :desc "Mind Wave Chat Ask"
      "o m a" #'mind-wave-chat-ask)
(map! :leader
      :desc "Mind Wave Refact Code"
      "o m r" #'mind-wave-refactory-code)
(map! :leader
      :desc "Mind Wave Translate"
      "o m t" #'mind-wave-translate-to-english)
(map! :leader
      :desc "Mind Wave Proof Doc"
      "o m p" #'mind-wave-proofreading-doc)
(map! :leader
      :desc "Mind Wave Explain Code"
      "o m e" #'mind-wave-explain-code)
(map! :leader
      :desc "Mind Wave Adjust Text"
      "o m j" #'mind-wave-adjust-text)
(map! :leader
      :desc "Mind Wave Generate Code"
      "o m c" #'mind-wave-generate-code)

(setq flycheck-shellcheck-follow-sources nil)
