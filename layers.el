(configuration-layer/declare-layers
 '(auto-completion
   (c-c++ :variables
          c-c++-adopt-subprojects t
          c-c++-backend 'lsp-ccls
          ;; c-c++-default-mode-for-headers 'c++-mode
          c-c++-enable-clang-format-on-save t
          c-c++-enable-google-style t
          c-c++-enable-organize-includes-on-save t
          c-c++-lsp-cache-dir (concat spacemacs-cache-directory "lsp-ccls")
          c-c++-lsp-sem-highlight-method 'font-lock
          c-c++-lsp-sem-highlight-rainbow t)
   (cmake :variables
          cmake-enable-cmake-ide-support t)
   dap
   emacs-lisp
   git
   helm
   html
   javascript
   (lsp :variables
        lsp-ui-sideline-enable nil)
   latex
   markdown
   multiple-cursors
   neotree
   ocaml
   org
   python
   rust
   semantic
   (shell :variables
          shell-default-height 30
          shell-default-position 'bottom)
   (syntax-checking :variables
                    syntax-checking-enable-by-default nil)
   treemacs
   version-control
   ))
