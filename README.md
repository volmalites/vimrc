# Minimalistic vimrc
My vimrc config, as vanilla as possible, used with tmux

 * Numbered lines and tablines
 * Tabline and statusline updates on page edits (modified flag) while retaining numbered tablines
 * Buffer number in statusline
 * Least distracting color scheme
 * Tab size of 4 spaces
 * Underline the line where the cursor is

My .tmux-conf which allows me to toggle panes for viewing in fullscreen ctrl + b a

```
bind-key a resize-pane -Z \; choose-tree "resize-pane -Z \; select-window -t '%%'"
```
My daily usage requires for both vim and nvim, thus the intergartion between the two. Nvim for native LSP integration and vim for older systems.
