function gc --wraps='git commit -s' --description 'alias gc=git commit -s'
  git commit -s $argv
        
end
