;;; packages.el --- hatsusato layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: hatsusato <knightspm5@gmail.com>
;; URL: https://github.com/hatsusato/private-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `hatsusato-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `hatsusato/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `hatsusato/pre-init-PACKAGE' and/or
;;   `hatsusato/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst hatsusato-packages
  '(mozc)
  "The list of Lisp packages required by the hatsusato layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun hatsusato/init-mozc ()
  (use-package mozc
    :defer t
    :commands
    (hatsusato/enable-mozc-mode
     hatsusato/disable-mozc-mode
     hatsusato/toggle-mozc-mode)
    :custom
    (default-input-method "japanese-mozc")
    (mozc-candidate-style 'echo-area)
    ))

;;; packages.el ends here
