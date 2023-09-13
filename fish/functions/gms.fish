function gms --wraps='git switch (git main-branch); and git sync' --description 'alias gms=git switch (git main-branch); and git sync'
  git switch (git main-branch); and git sync $argv
        
end
