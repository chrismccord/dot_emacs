(require 'package)

(setq package-enable-at-startup nil)

(package-initialize)

(require 'cask "~/.cask/cask.el")

(cask-initialize)

(add-to-list 'load-path (expand-file-name "bundles" user-emacs-directory))

(require 'custom-bundle)
(require 'anything-bundle)

(provide 'init)

;;; init.el ends here
