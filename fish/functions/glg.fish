function glg --wraps='git log --graph --decorate --oneline --abbrev-commit' --description 'alias glg=git log --graph --decorate --oneline --abbrev-commit'
  git log --graph --decorate --oneline --abbrev-commit $argv
        
end
