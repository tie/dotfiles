if status is-login
  # POSIX-compatible shell will read system profiles and then `exec fish -l`.
  if not set -q posix_shell
    exec /bin/dash -l -c 'posix_shell= exec fish -l'
  end
  # exec'ed from POSIX shell
  set -e posix_shell
end

# Dirty hack to make pinentry work
set -x GPG_TTY (tty)
