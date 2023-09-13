function kvs --wraps='kubectl view-secret' --description 'alias kvs=kubectl view-secret'
  kubectl view-secret $argv
        
end
