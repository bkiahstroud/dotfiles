if status is-interactive
  source ~/.config/fish/themes/tokyonight_night.fish

  set -U fish_greeting

  starship init fish | source
end
