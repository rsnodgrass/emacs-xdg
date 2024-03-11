# XDG Base Directory Support for Emacs

Defines vars conforming to the XDG Base Directory Specification

NOTE: This only works for Linux and MacOS currently. Windows is not supported.


This allows setting various paths to XDG standard directories:

```lisp
;; specify where MELPA/ELPA package installations go in XDG style config dir
(setq package-user-dir (expand-file-name "elpa" xdg-config-emacs))
```

The following XDG globals are defined:

| emacs var        | ENV var        | Default (per spec) |
|------------------|----------------|--------------------|
| xdg-cache-home   | `XDG_CACHE_HOME` | ~/.cache/        |
| xdg-config-home  | `XDG_CONFIG_HOME` | ~/.config/      |
| xdg-data-home    | `XDG_DATA_HOME` | ~/.local/share/  |
| xdg-state-home   | `XDG_STATE_HOME` | ~/.local/state/  |

Plus additional emacs specific subdir:

* xdg-cache-emacs
* xdg-config-emacs
* xdg-data-emacs
* xdg-state-emacs

## See Also

* https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
* https://github.com/melpa/melpa/blob/master/CONTRIBUTING.org
