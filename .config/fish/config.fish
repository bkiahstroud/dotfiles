if status is-interactive
  source ~/.config/fish/themes/tokyonight_night.fish

  set -U fish_greeting

  zoxide init fish | source
  starship init fish | source
end
