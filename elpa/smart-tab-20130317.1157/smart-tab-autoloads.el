;;; smart-tab-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (smart-tab-mode smart-tab-mode-on smart-tab) "smart-tab"
;;;;;;  "smart-tab.el" (21567 53157 0 0))
;;; Generated autoloads from smart-tab.el

(autoload 'smart-tab "smart-tab" "\
Try to 'do the smart thing' when tab is pressed.
`smart-tab' attempts to expand the text before the point or
indent the current line or selection.

In a regular buffer, `smart-tab' will attempt to expand with
either `hippie-expand' or `dabbrev-expand', depending on the
value of `smart-tab-using-hippie-expand'. Alternatively, if
`auto-complete-mode' is enabled in the current buffer,
`auto-complete' will be used to attempt expansion. If the mark is
active, or PREFIX is \\[universal-argument], then `smart-tab'
will indent the region or the current line (if the mark is not
active).

\(fn &optional PREFIX)" t nil)

(autoload 'smart-tab-mode-on "smart-tab" "\
Turn on `smart-tab-mode'.

\(fn)" nil nil)

(autoload 'smart-tab-mode "smart-tab" "\
Enable `smart-tab' to be used in place of tab.

With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("smart-tab-pkg.el") (21567 53157 430660
;;;;;;  0))

;;;***

(provide 'smart-tab-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; smart-tab-autoloads.el ends here
