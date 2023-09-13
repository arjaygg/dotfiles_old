function egms --wraps='e; git switch (git main-branch); and git sync' --description 'alias egms=e; git switch (git main-branch); and git sync'
  e; git switch (git main-branch); and git sync $argv
        
end
