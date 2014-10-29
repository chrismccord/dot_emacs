;;; smart-tab.el --- Intelligent tab completion and indentation.

;; This file is NOT part of GNU Emacs.

;; Copyright (C) 2009-2011 John SJ Anderson,
;;                         Sebastien Rocca Serra,
;;                         Daniel Hackney
;; Author: John SJ Anderson <genehack@genehack.org>,
;;         Sebastien Rocca Serra <sroccaserra@gmail.com>,
;;         Daniel Hackney <dan@haxney.org>
;; Maintainer: John SJ Anderson <genehack@genehack.org>
;; Keywords: extensions
;; Created: 2009-05-24
;; URL: http://github.com/genehack/smart-tab/tree/master
;; Version: 20130317.1157
;; X-Original-Version: 0.3
;;
;; This program is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation; either version 3, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
;; details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; INSTALL
;;
;; To install, put this file along your Emacs-Lisp `load-path' and add
;; the following into your ~/.emacs startup file or set
;; `global-smart-tab-mode' to non-nil with customize:
;;
;;     (require 'smart-tab)
;;     (global-smart-tab-mode 1)
;;
;; DESCRIPTION
;;
;; Try to 'do the smart thing' when tab is pressed. `smart-tab'
;; attempts to expand the text before the point or indent the current
;; line or selection.
;;
;; See <http://www.emacswiki.org/cgi-bin/wiki/TabCompletion#toc2>. There are a
;; number of available customizations on that page.
;;
;; Features that might be required by this library:
;;
;;   `easy-mmmode'

;;; Change Log:

;;; Code:

(require 'easy-mmode)

(eval-when-compile
  ;; Forward declaration, does not define variable
  (defvar auto-complete-mode))

(defgroup smart-tab nil
  "Options for `smart-tab-mode'."
  :group 'tools)

(defvar smart-tab-debug nil
  "Turn on for logging about which `smart-tab' function ends up being called.")

(defcustom smart-tab-using-hippie-expand nil
  "Use `hippie-expand' to expand text.
Use either `hippie-expand' or `dabbrev-expand' for expanding text
when we don't have to indent."
  :type '(choice
          (const :tag "hippie-expand" t)
          (const :tag "dabbrev-expand" nil))
  :group 'smart-tab)

(defcustom smart-tab-completion-functions-alist
  '((emacs-lisp-mode . lisp-complete-symbol)
    (text-mode       . dabbrev-completion))
  "A-list of major modes in which to use a mode specific completion function.
If current major mode is not found in this alist, fall back to
`hippie-expand' or `dabbrev-expand', depending on the value of
`smart-tab-using-hippie-expand'"
  :type '(alist :key-type (symbol :tag "Major mode")
                :value-type (function :tag "Completion function to use in this mode"))
  :group 'smart-tab)

(defcustom smart-tab-disabled-major-modes '(org-mode term-mode eshell-mode)
  "List of major modes that should not use `smart-tab'."
  :type 'sexp
  :group 'smart-tab)

(put 'smart-tab-funcall 'lisp-indent-function 0)
(put 'smart-tab-funcall 'edebug-form-spec '(body))
(defmacro smart-tab-funcall (function &rest args)
  "If FUNCTION is `fboundp' call it with ARGS."
  `(let ((function ,function))
     (if (fboundp function)
         (apply function ,@args nil))))

(defun smart-tab-call-completion-function ()
  "Get a completion function according to current major mode."
  (if smart-tab-debug
      (message "complete"))
  (let ((completion-function
         (cdr (assq major-mode smart-tab-completion-functions-alist))))
    (if (null completion-function)
        (if (and (not (minibufferp))
                 (memq 'auto-complete-mode minor-mode-list)
                 (boundp' auto-complete-mode)
                 auto-complete-mode)
            (smart-tab-funcall 'ac-start :force-init t)
          (if smart-tab-using-hippie-expand
              (hippie-expand nil)
            (dabbrev-expand nil)))
      (funcall completion-function))))

(defun smart-tab-must-expand (&optional prefix)
  "If PREFIX is \\[universal-argument] or the mark is active, do not expand.
Otherwise, uses the user's preferred expansion function to expand
the text at point."
  (unless (or (consp prefix)
              (use-region-p))
    (looking-at "\\_>")))

(defun smart-tab-default ()
  "Indent region if mark is active, or current line otherwise."
  (interactive)
  (if smart-tab-debug
      (message "default"))
  (if (use-region-p)
      (indent-region (region-beginning)
                     (region-end))
    (indent-for-tab-command)))

;;;###autoload
(defun smart-tab (&optional prefix)
  "Try to 'do the smart thing' when tab is pressed.
`smart-tab' attempts to expand the text before the point or
indent the current line or selection.

In a regular buffer, `smart-tab' will attempt to expand with
either `hippie-expand' or `dabbrev-expand', depending on the
value of `smart-tab-using-hippie-expand'. Alternatively, if
`auto-complete-mode' is enabled in the current buffer,
`auto-complete' will be used to attempt expansion. If the mark is
active, or PREFIX is \\[universal-argument], then `smart-tab'
will indent the region or the current line (if the mark is not
active)."
  (interactive "P")
  (if (smart-tab-must-expand prefix)
      (smart-tab-call-completion-function)
    (smart-tab-default)))

;;;###autoload
(defun smart-tab-mode-on ()
  "Turn on `smart-tab-mode'."
    (smart-tab-mode 1))

(defun smart-tab-mode-off ()
  "Turn off `smart-tab-mode'."
  (smart-tab-mode -1))

;;;###autoload
(define-minor-mode smart-tab-mode
  "Enable `smart-tab' to be used in place of tab.

With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode."
  :lighter " Smrt"
  :group 'smart-tab
  :require 'smart-tab
  :keymap '(("\t" . smart-tab)
            ([(tab)] . smart-tab))
  (if smart-tab-mode
      (progn
        ;; Don't start `smart-tab-mode' when in the minibuffer or a read-only
        ;; buffer.
        (when (or (minibufferp)
                  buffer-read-only
                  (member major-mode smart-tab-disabled-major-modes))
          (smart-tab-mode-off)))))

(define-globalized-minor-mode global-smart-tab-mode
  smart-tab-mode
  smart-tab-mode-on
  :group 'smart-tab)

(provide 'smart-tab)

;;; smart-tab.el ends here
