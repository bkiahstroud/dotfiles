function rgr
  git ls-files -z | xargs -0 rg $argv[1] --files-with-matches | xargs sed -i '' "s|$argv[1]|$argv[2]|gw /dev/stdout"
end
