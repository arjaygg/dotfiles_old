function kerru
    # Argument 1: label to filter ReplicaSets
    # Argument 2: memory limit and request size
    set label $argv[1]
    set memory_size $argv[2]

    # Iterate over each ReplicaSet in the 'inhouse-qa' namespace with the specified label
    for rs in (kubectl get rs -l $label -n inhouse-qa -o custom-columns=:metadata.name --no-headers)
        # Fetch the container name for the current ReplicaSet
        set container_name (kubectl get rs $rs -n inhouse-qa -o=jsonpath='{.spec.template.spec.containers[0].name}')

        # Patch the ReplicaSet to update the memory limits and requests
        kubectl patch rs $rs -n inhouse-qa --patch "{\"spec\": {\"template\": {\"spec\": {\"containers\": [{\"name\": \"$container_name\", \"resources\": {\"limits\": {\"memory\": \"$memory_size\"}, \"requests\": {\"memory\": \"$memory_size\"}}}]}}}}"
    end
end

