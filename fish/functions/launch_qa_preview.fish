function launch_qa_preview
    if test (count $argv) -lt 2
        echo "Usage: launch_qa_preview <commit_message> <file1> [file2] ..."
        return 1
    end

    set commit_message $argv[1]

    for file_name in $argv[2..-1]
        if not test -f $file_name
            echo "File $file_name does not exist."
            continue
        end

        # Debug: Print lines that should contain the timestamp
        echo "Debug: Lines that should contain the timestamp:"
        grep 'timestamp: "[0-9]*"' $file_name

        set current_timestamp (grep 'timestamp: "[0-9]*"' $file_name | awk '{print $2}' | tr -d '"')
        echo "Debug: Current timestamp is $current_timestamp"

        if not string match -r '^[0-9]+$' "$current_timestamp"
            echo "Invalid timestamp found in $file_name."
            continue
        end

        set new_timestamp (math $current_timestamp + 1)
        echo "Debug: New timestamp is $new_timestamp"

        sed -i "" "s/timestamp: \"$current_timestamp\"/timestamp: \"$new_timestamp\"/" $file_name

        git add $file_name

        echo "Timestamp in $file_name updated to $new_timestamp."
    end

    git commit -m "$commit_message"
    git push

    echo "Changes pushed to Git."
end

