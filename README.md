# Minimalistic vimrc
My vimrc config, as vanilla as possible, used with tmux

 * Numbered lines and tablines
 * Tabline and statusline updates on page edits (modified flag) while retaining numbered tablines
 * Buffer number in statusline
 * Least distracting color scheme
 * Sudo save with :W
 * Tab size of 4 spaces (I prefer 2 depending on what I am working on)

My .tmux-conf which allows me to toggle panes for viewing in fullscreen ctrl + b a

```
bind-key a resize-pane -Z \; choose-tree "resize-pane -Z \; select-window -t '%%'"
```
