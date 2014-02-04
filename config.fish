set fish_greeting ""

set fish_user_paths ~/Library/Python/2.7/bin ~/.local/bin
set fish_user_paths /usr/local/share/npm/bin $fish_user_paths

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showstashstate 1
set -g __fish_git_prompt_showcolorhints 1

set -gx EDITOR "subl -w"
set -gx GOPATH $HOME/code/go

set fish_user_paths $GOPATH/bin $fish_user_paths

# rbenv

if test -f (which rbenv)
    set fish_user_paths $HOME/.rbenv/shims $fish_user_paths
    rbenv rehash >/dev/null ^&1
end

# dvm

if test -f (which dvm)
    eval (dvm env)
end

# Virtualfish

set -g VIRTUALFISH_COMPAT_ALIASES
source ~/.config/fish/vendor/virtualfish/virtual.fish
source ~/.config/fish/vendor/virtualfish/auto_activation.fish

function __set_pip_use_wheel --on-event virtualenv_did_activate
    set -gx PIP_USE_WHEEL "true"
end

function __set_cryptography_compiler_flags --on-event virtualenv_did_activate:cryptography
    set -gx ARCHFLAGS "-arch x86_64"
    set -gx CFLAGS "-I/usr/local/opt/openssl/include"
    set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
end

function __unset_cryptography_compiler_flags --on-event virtualenv_did_deactivate:cryptography
    set -e ARCHFLAGS
    set -e CFLAGS
    set -e LDFLAGS
end
