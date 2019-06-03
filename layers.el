(configuration-layer/declare-layers
 '(auto-completion
   (c-c++ :variables
          c-c++-enable-google-style t
          c-c++-default-mode-for-headers 'c++-mode
          c-c++-backend 'lsp-ccls
          c-c++-adopt-subprojects t
          c-c++-lsp-sem-highlight-method 'font-lock
          c-c++-lsp-sem-highlight-rainbow t)
   dap
   emacs-lisp
   git
   helm
   html
   javascript
   (lsp :variables
        lsp-ui-sideline-enable nil)
   markdown
   multiple-cursors
   neotree
   ocaml
   org
   (shell :variables
          shell-default-height 30
          shell-default-position 'bottom)
   (syntax-checking :variables
                    syntax-checking-enable-by-default nil)
   treemacs
   version-control
   ))
