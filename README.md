# XDG Base Directory Support for Emacs

![beta_badge](https://img.shields.io/badge/maturity-Beta-yellow.png)

**NOTE: Emacs released XDG directory support with Emacs 29.4 in June 2024 (loads `~/.config/emacs/init.el` if present and `~/.emacs` doesn't exist). The rest of the variables defined in this package are still useful.**

Defines variables that conform to the [XDG Base Directory
Specification](https://wiki.archlinux.org/title/XDG_Base_Directory) that can be used in
emacs for configuration.

This makes it convenient to configure various settings to use the XDG standard
directories to avoid polluting the user's home directory.

Examples:

```lisp
;; specify where MELPA/ELPA package installations go in XDG style config dir
(setq package-user-dir (expand-file-name "elpa" xdg-cache-emacs))

;; Prevent undo tree files from polluting the filesystem (use XDG_STATE_HOME)
(setq undo-tree-history-directory-alist
      '(("." . (expand-file-name "undo" xdg-state-emacs))))
```

This should be included very early in `init.el` or `early-init.el` so that later
configuration can use this:

```lisp
(use-package xdg :ensure t)
```

The following XDG globals are defined:

| emacs var        | ENV var            | Default (per spec) | Default (MacOS) | Default (Windows) |
|------------------|--------------------|--------------------|---|---|
| xdg-cache-home   | `XDG_CACHE_HOME`   | ~/.cache/          |   |   |
| xdg-config-home  | `XDG_CONFIG_HOME`  | ~/.config/         | <same> | |
| xdg-data-home    | `XDG_DATA_HOME`    | ~/.local/share/    |   |   |
| xdg-state-home   | `XDG_STATE_HOME`   | ~/.local/state/    |   |   |
| xdg-desktop-dir  | `XDG_DESKTOP_DIR`  | ~/Desktop          | <same> | |
| xdg-download-dir | `XDG_DOWNLOAD_DIR` | ~/Downloads        | <same> | |

Plus additional emacs specific subdir:

| emacs var         | Notes                              |
|-------------------|------------------------------------|
| xdg-cache-emacs   | 'emacs' dir under xdg-cache-home   |
| xdg-config-emacs  | 'emacs' dir under xdg-config-home  |
| xdg-data-emacs    | 'emacs' dir under xdg-data-home    |
| xdg-state-emacs   | 'emacs' dir under xdg-state-home   |

NOTE: This only works for Linux and MacOS currently. Windows is not supported.


## See Also

* [XDG Base Directory](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
* [XDG Base Directory - ArchLinux](https://wiki.archlinux.org/title/XDG_Base_Directory)
* [XDG reddit discussion](https://www.reddit.com/r/linux/comments/ny34vs/new_xdg_state_home_in_xdg_base_directory_spec/)
* [XDG User Dirs](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)

* https://github.com/melpa/melpa/blob/master/CONTRIBUTING.org
