# dotfiles

## General

Branch 'dev' created in 2024 to update configuration after long time of inactivity.

### Current status
Only tmux config updated so far. And in progress...

## tmux

Prefix - moved from Ctrl+b to Ctrl+a

- use install_tpm.sh script to install tmux plugin manager in ~/.tmux/plugins/tpm
- in tmux run "prefix + I" to install plugins
- added Vi style copying

### Prerequisites
- fzf - for tmux-fzf

### Keymapping
- `Ctrl+a` - prefix

- `<prefix> I` - install plugins (tpm)

- `<prefix> h` - move to left pane
- `<prefix> j` - move to bottom pane
- `<prefix> k` - move to top pane
- `<prefix> l` - move to right pane

- `<prefix> H` - resize pane +5 left
- `<prefix> J` - resize pane +5 down
- `<prefix> K` - resize pane +5 up
- `<prefix> L` - resize pane +5 right

- `<prefix> [` - enter copy mode
    - `v` - start selection
    - `Ctrl+v` - switch between line and rectangle selection
    - `y` - yank

- `<prefix> Ctrl+s` - save tmux session (tmux-ressurect)
- `<prefix> Ctrl+r` - restore tmux session (tmux-ressurect)

### Plugins
- tmux-plugins/tpm
  Plugin manager.
- tmux-plugins/tmux-sensible
- tmux-plugins/tmux-resurrect
  Restoring tmux session after system reboot.
- tmux-plugins/tmux-continuum
  Automatic saving tmux sessions.
- tmux-plugins/tmux-yank
- christoomey/vim-tmux-navigator
  Pane navigation common with vim.
- sainnhe/tmux-fzf
- junegunn/tmux-fzf-url
- laktak/extrakto
  Fuzzy extracting strings from tmux pane content.
