if status is-interactive
  source ~/.config/fish/themes/tokyonight_night.fish

  set -U fish_greeting

  fish_add_path -g $HOME/.krew/bin

  set -gx EDITOR (command -v nvim)
  set -gx GPG_TTY (tty)
  set -gx KUBECONFIG $HOME/.kube/config
  set -gx CARGO_TARGET_DIR $HOME/.cargo/shared_target

  set -g fish_key_bindings fish_hybrid_key_bindings

  if test -s $HOME/local.fish
    source $HOME/local.fish
  end

  zoxide init fish | source
  starship init fish | source
end
