;;; xdg.el --- XDG Base Directory vars defined for emacs -*- lexical-binding: t -*-

;; Author: Ryan Snodgrass <rsnodgrass@gmail.com>
;; Homepage: https://github.com/rsnodgrass/xdg-emacs
;; Keywords: xdg
;; Version: 0.0.1

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;;; Commentary:

;; Defines vars conforming to the XDG Base Directory Specification
;;
;; NOTE: This only works for Linux and MacOS currently.
;; Windows is not supported.

;; https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

;;; Code:

(setq dos-system-types '("cygwin" "ms-dos" "windows-nt"))

;; XDG Base Directory support ------------------------------------------------------

(if (not (member system-type dos-system-types))
    ((defvar xdg-config-home
       (or (getenv "XDG_CONFIG_HOME") "~/.config/"))
     (defvar xdg-cache-home
       (or (getenv "XDG_CACHE_HOME") "~/.cache/"))
     (defvar xdg-data-home
       (or (getenv "XDG_DATA_HOME") "~/.local/share/"))
     (defvar xdg-state-home
       (or (getenv "XDG_STATE_HOME") "~/.local/state/")))
  (message "Windows and DOS based home directories are not supported"))

;; Enabling xdg-macos-alternatives variable can be set to enable MacOS
;; alternative default locations for the XDG Base Directories.
;;
;; For MacOS besides the standard XDG home directory locations, there are an
;; additional "standard" locations that tend to get used:
;;
;;   XDG_CONFIG_HOME = ~/Library/Application Support
;;   XDG_CACHE_HOME = ~/Library/Caches/
;;   XDG_DATA_HOME = ~/Library/
;;
;; The above follows other language defaults; e.g. Go (https://pkg.go.dev/os#UserCacheDir)
;;
(if (and (eq system-type "darwin") (eq xdg-macos-alternatives t))
    ((defvar xdg-config-home
       (or (getenv "XDG_CONFIG_HOME") "~/Library/Application Support/"))
     (defvar xdg-cache-home
       (or (getenv "XDG_CACHE_HOME") "~/Library/Caches/"))
     (defvar xdg-data-home
       (or (getenv "XDG_DATA_HOME") "~/Library/"))))

;; Define the xdg-*-emacs locations since this will be the most commonly used
;; configuration prefix for Emacs users.
(if (not (member system-type dos-system-types))
    ((defvar xdg-config-emacs
       (expand-file-name "emacs" xdg-config-home))
     (defvar xdg-cache-emacs
       (expand-file-name "emacs" xdg-cache-home))
     (defvar xdg-data-emacs
       (expand-file-name "emacs" xdg-data-home))
     (defvar xdg-state-emacs
       (expand-file-name "emacs" xdg-state-home))))


;; XDG User Directory support ------------------------------------------------------
;;
;; https://www.freedesktop.org/wiki/Software/xdg-user-dirs/
(if (not (member system-type dos-system-types))
    ((defvar xdg-desktop-dir
       (or (getenv "XDG_DESKTOP_DIR") "~/Desktop/"))
     (defvar xdg-download-dir
       (or (getenv "XDG_DOWNLOAD_DIR") "~/Downloads/"))))

;;; xdg.el end of file
