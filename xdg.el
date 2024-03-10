;;; xdg.el --- XDG Directory variables defined for emacs -*- lexical-binding: t -*-

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


;; vars conforming to the XDG Base Directory Specification
;; https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
(setq xdg-config-home (or (getenv "XDG_CONFIG_HOME") "~/.config/"))
(setq xdg-cache-home (or (getenv "XDG_CACHE_HOME") "~/.cache/"))
(setq xdg-data-home (or (getenv "XDG_DATA_HOME") "~/.local.share/"))
(setq xdg-state-home (or (getenv "XDG_STATE_HOME") "~/.local.state/"))

(setq xdg-config-emacs (expand-file-name "emacs" xdg-config-home))
(setq xdg-cache-emacs (expand-file-name "emacs" xdg-cache-home))
(setq xdg-data-emacs (expand-file-name "emacs" xdg-data-home))
(setq xdg-state-emacs (expand-file-name "emacs" xdg-state-home))

;; xdg.el end of file
