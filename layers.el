(defun hatsusato/load-files (files)
  (let* ((file (if (consp files) (car files)))
         (dir (if load-file-name (file-name-directory load-file-name)))
         (path (concat dir file)))
    (if (null files)
        nil
      (if (and (file-readable-p path) (load-file path))
          t
        (hatsusato/load-files (cdr files))))))
(defun hatsusato/load-whitelist ()
  (let* ((file "layers-whitelist.el")
         (dir (file-name-directory load-file-name))
         (path (concat dir file)))
    (if (and (file-readable-p path)
             (load-file path)
             (boundp 'hatsusato/layers-whitelist))
        hatsusato/layers-whitelist nil)))
(defun hatsusato/declare-layers (layers)
  (let* ((whitelist (if (boundp 'hatsusato/layers-whitelist)
                        hatsusato/layers-whitelist))
         (unwrap (lambda (x) (if (atom x) x (car x))))
         (is-white (lambda (layer)
                     (seq-find (lambda (white)
                                 (eq white (funcall unwrap layer)))
                               whitelist))))
    (configuration-layer/declare-layers (seq-filter is-white layers))))

(hatsusato/load-files '(".whitelist.el" "whitelist.el"))
(hatsusato/declare-layers
 '(auto-completion
   (c-c++ :variables
          c-c++-adopt-subprojects t
          c-c++-backend 'lsp-clangd
          ;; c-c++-default-mode-for-headers 'c++-mode
          c-c++-enable-auto-newline nil
          c-c++-enable-clang-format-on-save t
          c-c++-enable-google-newline nil
          c-c++-enable-google-style nil
          c-c++-enable-organize-includes-on-save t
          c-c++-lsp-enable-semantic-highlight t
          c-c++-lsp-semantic-highlight-method 'font-lock
          )
   (cmake :variables
          cmake-enable-cmake-ide-support t)
   dap
   emacs-lisp
   git
   helm
   html
   (javascript :variables
               js-indent-level 2
               js2-basic-offset 2
               js2-mode-show-strict-warnings nil
               javascript-fmt-tool 'web-beautify
               javascript-fmt-on-save t)
   (lsp :variables
        lsp-ui-sideline-enable nil)
   (latex :variables latex-build-command "Make")
   markdown
   multiple-cursors
   neotree
   ocaml
   org
   (php :variables php-backend 'lsp)
   (python :variables
           python-backend 'lsp
           python-lsp-server 'pylsp
           python-formatter 'yapf
           python-format-on-save t
           python-sort-imports-on-save t)
   rust
   semantic
   (shell :variables
          shell-default-height 30
          shell-default-position 'bottom)
   (syntax-checking :variables
                    syntax-checking-enable-by-default nil)
   systemd
   treemacs
   version-control
   yaml
   ))
