;;; +swift.el -*- lexical-binding: t; -*-

(use-package eglot
    :hook (swift-mode . eglot-ensure)
    :config
    (add-to-list 'eglot-server-programs '(swift-mode . ("/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))))
