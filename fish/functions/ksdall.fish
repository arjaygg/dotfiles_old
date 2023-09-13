function ksdall
    set -q argv[1]
    and test $argv[1] = "whatif"
    and set whatif $argv[1]

    for deployment in (kubectl get deployments | grep "^olea-" | awk '{print $1}')
        if set -q whatif
            echo $deployment
        else
            kubectl scale deployment $deployment --replicas=1
        end
    end
end
