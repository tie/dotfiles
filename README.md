 Dotfiles
================================================================================

   Quick start
--------------------------------------------------------------------------------

Use GNU Stow to create program's config symlink in your home directory.  Example: `stow nvim` will sym link the files in the `nvim/` directory to the correct place in `$HOME`.

   Dependencies
--------------------------------------------------------------------------------

Note: `pam_env.so` loads user-defined environment variables.  To load my `pam_env.so` config, set its `user_envfile` argument to `/.config/pam_env/environment.conf`.  On Arch Linux, consider adding the following line to PAM config (`/etc/pam.d/system-login`)

    session    required   pam_env.so user_envfile=/.config/pam_env/environment.conf


### Programs (incomplete list)
- [pam_env.so](http://www.linux-pam.org/Linux-PAM-html/sag-pam_env.html) (PAM module)
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
