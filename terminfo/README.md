Terminfo for tmux-256color with undercurl support

```
$ brew install ncurses
$ /usr/local/opt/ncurses/bin/infocmp -x tmux-256color > ~/.config/terminfo/tmux-256color.info
$ tic -xe tmux-256color tmux-256color.info
```

This doesnt work for some reason (undercurl color):
```
Setulc=\E[58:2::%p1%{65536}%/%d:%p1%{256}%/%{255}%&%d:%p1%{255}%&%d%;m,
```

To remove compiled terminfo check */Applications/kitty.app/Contents/Resources/kitty/terminfo* directory.
