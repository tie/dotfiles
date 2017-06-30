## Dependencies

Note: `pam_env.so` loads user-defined environment variables.  To load my `pam_env.so` config, set `user_envfile` argument to `/.config/pam_env/environment.conf`

On Arch Linux, consider adding line below to PAM config (/etc/pam.d/system-login)
```pamconf
#<...>#
session    required   pam_env.so user_envfile=/.config/pam_env/environment.conf
#<...>#
```

Setting `PATH` in `pam_env` config does not works.  I am currently considering replacing `pam_env.so` & `dash` duo with single external program.

### Programs
- `pam_env.so` PAM module
- dash
- fish
- Xorg
- xmonad
- xmobar (TODO: use taffybar instead)
- redshift
- NeoVim
- ponysay
- editorconfig

### Fonts
- Go Font
- AwesomeFont
- Noto Emoji

#### Refs
- [Switching between ConnMan and NetworkManager](https://forum.manjaro.org/t/switching-between-connman-and-networkmanager/22285)
- [Wht the Keyboard?](https://github.com/noctuid/dotfiles/blob/master/README.org#why-the-keyboard)
