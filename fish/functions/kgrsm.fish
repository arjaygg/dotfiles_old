# function kgrsm
#     # Use the passed arguments as the list of apps to check
#     set apps $argv
#
#     # Check if any apps were provided
#     if test (count $apps) -eq 0
#         echo "Please provide at least one app name."
#         return 1
#     end
#
#     # Iterate over each app
#     for app in $apps
#         echo "Checking ReplicaSets for $app"
#         echo "-------------------------"
#
#         # Iterate over each ReplicaSet in the 'inhouse-qa' namespace with the specific label for the app
#         for rs in (kubectl get rs -l "app=$app" -n inhouse-qa -o custom-columns=:metadata.name --no-headers)
#             # Fetch the container name and memory limits and requests for the current ReplicaSet
#             set container_name (kubectl get rs $rs -n inhouse-qa -o=jsonpath='{.spec.template.spec.containers[0].name}')
#             set memory_limit (kubectl get rs $rs -n inhouse-qa -o=jsonpath='{.spec.template.spec.containers[0].resources.limits.memory}')
#             set memory_request (kubectl get rs $rs -n inhouse-qa -o=jsonpath='{.spec.template.spec.containers[0].resources.requests.memory}')
#
#             # Print the information
#             echo "ReplicaSet: $rs"
#             echo "Container Name: $container_name"
#             echo "Memory Limit: $memory_limit"
#             echo "Memory Request: $memory_request"
#             echo "-------------------------"
#         end
#     end
# end
#

# Function: kgrsm
# Purpose: This function fetches and displays resource limits and requests for specified Kubernetes ReplicaSets.
# It takes a list of application names as arguments and looks for ReplicaSets in the 'inhouse-qa' namespace with labels matching those application names.
function kgrsm
    # Use the passed arguments as the list of apps to check
    set apps $argv

    # Check if any apps were provided
    if test (count $apps) -eq 0
        echo "Please provide at least one app name."
        return 1
    end

    # Iterate over each app to fetch and display resource information
    for app in $apps
        echo "Checking ReplicaSets for $app"
        echo "-------------------------"

        # Iterate over each ReplicaSet in the 'inhouse-qa' namespace with the specific label for the app
        for rs in (kubectl get rs -l "app=$app" -n inhouse-qa -o custom-columns=:metadata.name --no-headers)
            # Fetch the container name, memory limits, memory requests, CPU limits, and CPU requests for the current ReplicaSet
            set container_name (kubectl get rs $rs -n inhouse-qa -o=jsonpath='{.spec.template.spec.containers[0].name}')
            set memory_limit (kubectl get rs $rs -n inhouse-qa -o=jsonpath='{.spec.template.spec.containers[0].resources.limits.memory}')
            set memory_request (kubectl get rs $rs -n inhouse-qa -o=jsonpath='{.spec.template.spec.containers[0].resources.requests.memory}')
            set cpu_limit (kubectl get rs $rs -n inhouse-qa -o=jsonpath='{.spec.template.spec.containers[0].resources.limits.cpu}')
            set cpu_request (kubectl get rs $rs -n inhouse-qa -o=jsonpath='{.spec.template.spec.containers[0].resources.requests.cpu}')

            # Print the fetched information
            echo "ReplicaSet: $rs"
            echo "Container Name: $container_name"
            echo "Memory Limit: $memory_limit"
            echo "Memory Request: $memory_request"
            echo "CPU Limit: $cpu_limit"
            echo "CPU Request: $cpu_request"
            echo "-------------------------"
        end
    end
end

