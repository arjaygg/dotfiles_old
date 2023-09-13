function gm --wraps='git switch (git main-branch)' --description 'alias gm=git switch (git main-branch)'
  git switch (git main-branch) $argv
        
end
