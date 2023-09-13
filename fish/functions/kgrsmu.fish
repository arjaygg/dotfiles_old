# function kgrsmu
#     # Use the passed arguments as the list of apps to check
#     set apps $argv
#
#     # Check if any apps were provided
#     if test (count $apps) -eq 0
#         echo "Please provide at least one app name."
#         return 1
#     end
#
#     while true
#         # Clear the screen for better visibility
#         clear
#
#         # Iterate over each app
#         for app in $apps
#             echo "Checking current memory usage for pods of $app"
#             echo "-------------------------"
#
#             # Get the list of pods for the current app in the 'inhouse-qa' namespace
#             for pod in (kubectl get pods -l "app=$app" -n inhouse-qa -o custom-columns=:metadata.name --no-headers)
#                 # Fetch the current memory usage for the pod
#                 set memory_usage (kubectl top pod $pod -n inhouse-qa --no-headers | awk '{print $3}')
#
#                 # Print the information
#                 echo "Pod: $pod"
#                 echo "Current Memory Usage: $memory_usage"
#                 echo "-------------------------"
#             end
#         end
#
#         # Wait for 2 seconds before the next iteration
#         sleep 2
#     end
# end

# Function: kgrsmu
# Purpose: This function continuously monitors and displays the current memory and CPU usage for pods of specified applications in the 'inhouse-qa' namespace.
# Usage: kgrsmu <wait_time> <app1> <app2> ... <appN>
function kgrsmu
    # Extract the wait time and apps from the arguments
    set wait_time $argv[1]
    set apps $argv[2..-1]

    # Check if wait time and any apps were provided
    if test (count $argv) -lt 2
        echo "Please provide the wait time and at least one app name."
        return 1
    end

    while true
        # Clear the screen for better visibility
        clear

        # Iterate over each app
        for app in $apps
            echo "Checking current resource usage for pods of $app"
            echo "-------------------------"

            # Get the list of pods for the current app in the 'inhouse-qa' namespace
            for pod in (kubectl get pods -l "app=$app" -n inhouse-qa -o custom-columns=:metadata.name --no-headers)
                # Fetch the current memory and CPU usage for the pod
                set resource_usage (kubectl top pod $pod -n inhouse-qa --no-headers)
                set memory_usage (echo $resource_usage | awk '{print $3}')
                set cpu_usage (echo $resource_usage | awk '{print $2}')

                # Print the information
                echo "Pod: $pod"
                echo "Current Memory Usage: $memory_usage"
                echo "Current CPU Usage: $cpu_usage"
                echo "-------------------------"
            end
        end

        # Wait for the specified number of seconds before the next iteration
        sleep $wait_time
    end
end

