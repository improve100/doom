;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
                                        ;(package! some-package)
(package! sis)
;; (package! youdao-dictionary)
(package! posframe)
(package! org-fragtog)
;; (package! markdown-mode)
(package! mind-wave
  :recipe (:host github :repo "manateelazycat/mind-wave" :files ("*.*")))
(package! blamer :recipe (:host github :repo "artawower/blamer.el"))
;; (package! sis :recipe (:host github :repo "laishulu/emacs-smart-input-source"))
;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo"
                                        ;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
                                        ;(package! builtin-package :recipe (:nonrecursive t))
                                        ;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
                                        ;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
                                        ;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
                                        ;(unpin! pinned-package)
;; ...or multiple packages
                                        ;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
                                        ;(unpin! t)

                                        ; add to .doom.d/packages.el
(package! closql :pin "0a7226331ff1f96142199915c0ac7940bac4afdd")
(package! doom-modeline :pin "cfc7bcf1494cb0634a1464dc40a4a1a1e337cb37")
(package! eglot :pin "d14fa2e5c537d48a25ce8444fdf9474ff2a8f7c0")
(package! gptel)
(package! org-crypt :disable t)
;; (package! liberime
;; :recipe (:host github :repo "DogLooksGood/liberime" :files ("CMakeLists.txt" "Makefile" "src" "*.el")))
;; (package! rime
;;   :recipe (:host github :repo "DogLooksGood/emacs-rime" :files ("rime.el")))
