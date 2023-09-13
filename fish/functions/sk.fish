function sk --wraps='kubectl -n kube-system' --description 'alias sk=kubectl -n kube-system'
  kubectl -n kube-system $argv
        
end
