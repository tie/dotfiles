 Dotfiles
================================================================================

   Quick start
--------------------------------------------------------------------------------

Use [GNU Stow](https://www.gnu.org/software/stow) to create program's config
symlink in your home directory.  Example: `stow nvim` will sym link the files
in the `nvim/` directory to the correct place in `$HOME`.

   Dependencies
--------------------------------------------------------------------------------

### Programs (incomplete list)
- [dash](http://gondor.apana.org.au/~herbert/dash) (POSIX-compliant shell)
- [fish](https://fishshell.com) (shell)
- [MOST](http://jedsoft.org/most) (pager)
- [Xorg](https://x.org) (X11)
- [XBindKeys](http://nongnu.org/xbindkeys)
- [xmonad](https://xmonad.org) (WM)
- [xmobar](http://projects.haskell.org/xmobar) (TODO: use taffybar instead)
- [Redshift](https://jonls.dk/redshift)
- [NeoVim](https://neovim.io) (text editor)
- [Ponysay](https://erkin.co/ponysay) (TODO: replace with `cowsay | lolcat`)
- [EditorConfig](https://editorconfig.org)

I also use [Google Chrome](https://www.google.com/chrome)
(from [aur/google-chrome](https://aur.archlinux.org/packages/google-chrome))
with JavaScript disabled, but I'm looking forward to migrating to any other
free (and libre) alternative like [NetSurf](https://www.netsurf-browser.org)
(which already has all features I need, but it is currently under development).

### Fonts
- [GNU Unifont](http://unifoundry.com/unifont.html) ([aur/ttf-unifont](https://aur.archlinux.org/packages/ttf-unifont))
- [FontAwesome](http://fontawesome.io) ([aur/ttf-font-awesome](https://aur.archlinux.org/packages/ttf-font-awesome))
- [Noto](https://www.google.com/get/noto) ([extra/noto-fonts](https://www.archlinux.org/packages/extra/any/noto-fonts), [extra/noto-fonts-cjk](https://www.archlinux.org/packages/extra/any/noto-fonts-cjk), [extra/noto-fonts-emoji](https://www.archlinux.org/packages/extra/any/noto-fonts-emoji]))
- [Go Font](https://blog.golang.org/go-fonts) ([aur/go-fonts-git](https://aur.archlinux.org/packages/go-fonts-git))

TODO: remove unused fonts

--------------------------------------------------------------------------------

#### Links
- [Why the Keyboard?](https://github.com/noctuid/dotfiles/blob/master/README.org#why-the-keyboard)
- (TODO) [Switching between ConnMan and NetworkManager](https://forum.manjaro.org/t/switching-between-connman-and-networkmanager/22285)
