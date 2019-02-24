 Dotfiles
================================================================================

   Quick start
--------------------------------------------------------------------------------

Makefile uses [GNU Stow] to create program's config symlink in your `$HOME`,
`$XDG_CONFIG_HOME` and `$XDG_DATA_HOME/../bin`  directories.  E.g. running
`make core` will create a symlink to `.profile` in `$HOME`, fish config in
`$XDG_CONFIG_HOME`.

   Dependencies
--------------------------------------------------------------------------------

### Programs (incomplete list)
- [dash](http://gondor.apana.org.au/~herbert/dash) (POSIX-compliant shell)
- [fish](https://fishshell.com) (shell)
- [MOST](https://jedsoft.org/most) (pager)
- [Xorg](https://x.org) (X11) (TODO: wayland)
- [XBindKeys](http://nongnu.org/xbindkeys)
- [Wingo](https://github.com/b1narykid/wingo) (WM)
- [Redshift](https://jonls.dk/redshift)
- [NeoVim](https://neovim.io) (text editor)
- [Ponysay](https://erkin.co/ponysay) (TODO: replace with `cowsay | lolcat`)
- [EditorConfig](https://editorconfig.org)
- [Chromium](https://chromium.org) (everything else)
  Patches from [ungoogled-chromium](https://github.com/Eloston/ungoogled-chromium)

### Fonts
- [GNU Unifont] — for terminals and GUI ([aur/ttf-unifont])
- [Noto] — for web browsers ([extra/noto-fonts], [extra/noto-fonts-cjk], [extra/noto-fonts-emoji])
- [Go Font] — why? ([aur/go-fonts-git])

TODO: remove unused fonts

--------------------------------------------------------------------------------

#### References
- [Why the Keyboard?][1]
- [Keyboard v. Mouse][2]

[1]: https://github.com/noctuid/dotfiles/blob/master/README.org#why-the-keyboard
[2]: https://danluu.com/keyboard-v-mouse

[GNU Stow]: https://www.gnu.org/software/stow

[ungoogled-chromium]: https://github.com/Eloston/ungoogled-chromium

[GNU Unifont]: http://unifoundry.com/unifont.html
[Noto]: https://www.google.com/get/noto
[Go Font]: https://blog.golang.org/go-fonts
[aur/ttf-unifont]: https://aur.archlinux.org/packages/ttf-unifont
[extra/noto-fonts]: https://www.archlinux.org/packages/extra/any/noto-fonts
[extra/noto-fonts-cjk]: https://www.archlinux.org/packages/extra/any/noto-fonts-cjk
[extra/noto-fonts-emoji]: https://www.archlinux.org/packages/extra/any/noto-fonts-emoji
[aur/go-fonts-git]: https://aur.archlinux.org/packages/go-fonts-git
