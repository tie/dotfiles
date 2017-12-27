 Dotfiles
================================================================================

   Quick start
--------------------------------------------------------------------------------

Use [GNU Stow] to create program's config symlink in your home directory.
Example: `stow nvim` will sym link the files in the `nvim/` directory
to the correct place in your home directory.

   Dependencies
--------------------------------------------------------------------------------

### Programs (incomplete list)
- [dash](http://gondor.apana.org.au/~herbert/dash) (POSIX-compliant shell)
- [fish](https://fishshell.com) (shell)
- [MOST](https://jedsoft.org/most) (pager)
- [Xorg](https://x.org) (X11)
- [XBindKeys](http://nongnu.org/xbindkeys)
- [xmonad](https://xmonad.org) (WM)
- [xmobar](http://projects.haskell.org/xmobar) (TODO: use taffybar instead)
- [Redshift](https://jonls.dk/redshift)
- [NeoVim](https://neovim.io) (text editor)
- [Ponysay](https://erkin.co/ponysay) (TODO: replace with `cowsay | lolcat`)
- [EditorConfig](https://editorconfig.org)

I also use [Google Chrome] from [aur/google-chrome-beta], but I'm looking
forward to migrating to any other free (and libre) alternative like [NetSurf],
which already has all features I need, but it is currently under development.

### Fonts
- [GNU Unifont], ([aur/ttf-unifont])
- [FontAwesome], ([aur/ttf-font-awesome])
- [Noto], ([extra/noto-fonts], [extra/noto-fonts-cjk], [extra/noto-fonts-emoji])
- [Go Font], ([aur/go-fonts-git])

TODO: remove unused fonts

--------------------------------------------------------------------------------

#### References
- [Why the Keyboard?][1]
- [Switching between ConnMan and NetworkManager][2] (TODO)

[1]: https://github.com/noctuid/dotfiles/blob/master/README.org#why-the-keyboard
[2]: https://forum.manjaro.org/t/switching-between-connman-and-networkmanager/22285

[GNU Stow]: https://www.gnu.org/software/stow
[NetSurf]: https://www.netsurf-browser.org

[Google Chrome]: https://www.google.com/chrome
[aur/google-chrome-beta]: https://aur.archlinux.org/packages/google-chrome-beta

[GNU Unifont]: http://unifoundry.com/unifont.html
[FontAwesome]: http://fontawesome.io
[Noto]: https://www.google.com/get/noto
[Go Font]: https://blog.golang.org/go-fonts
[aur/ttf-unifont]: https://aur.archlinux.org/packages/ttf-unifont
[aur/ttf-font-awesome]: https://aur.archlinux.org/packages/ttf-font-awesome
[extra/noto-fonts]: https://www.archlinux.org/packages/extra/any/noto-fonts
[extra/noto-fonts-cjk]: https://www.archlinux.org/packages/extra/any/noto-fonts-cjk
[extra/noto-fonts-emoji]: https://www.archlinux.org/packages/extra/any/noto-fonts-emoji
[aur/go-fonts-git]: https://aur.archlinux.org/packages/go-fonts-git
