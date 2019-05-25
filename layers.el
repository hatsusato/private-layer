(configuration-layer/declare-layers '(auto-completion
                                      (c-c++ :variables
                                             c-c++-enable-google-style t
                                             c-c++-enable-clang-support t
                                             c-c++-default-mode-for-headers 'c++-mode)
                                      emacs-lisp
                                      git
                                      helm
                                      markdown
                                      multiple-cursors
                                      org
                                      (shell :variables
                                             shell-default-height 30
                                             shell-default-position 'bottom)
                                      (syntax-checking :variables
                                                       syntax-checking-enable-by-default nil)
                                      treemacs
                                      version-control
                                      ))
