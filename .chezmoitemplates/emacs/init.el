(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(setq help-window-select t)
(setq inhibit-startup-screen t)

(set-face-attribute 'default nil :height 150)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(delete-selection-mode 1)
(global-display-line-numbers-mode 1)
(recentf-mode 1)

(keymap-global-set "C-c e" 'recentf-open-files)

