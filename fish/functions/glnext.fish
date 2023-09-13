function glnext --wraps='git log --oneline (git describe --tags --abbrev=0 @^)..@' --description 'alias glnext=git log --oneline (git describe --tags --abbrev=0 @^)..@'
  git log --oneline (git describe --tags --abbrev=0 @^)..@ $argv
        
end
