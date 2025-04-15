#!/bin/bash

# File containing the list of commit hashes (one per line)
commit_list_file=$1

# Check if the commit list file exists
if [ ! -f "$commit_list_file" ]; then
    echo "Commit list file not found!"
    exit 1
fi

# Default date in Unix timestamp (2019-01-01)
default_date_str="2019-01-01"
default_timestamp=$(date -d "$default_date_str" +%s)

# Loop through each commit hash in the file
while read -r commit_hash; do
    # Skip empty lines or comments
    if [[ -z "$commit_hash" || "$commit_hash" =~ ^# ]]; then
        continue
    fi

    echo "Processing commit: $commit_hash"

    # Get the commit date of the given commit
    commit_date=$(git show -s --format="%ci" "$commit_hash")

    # Get list of image files changed in the commit
    files=$(git show --name-only --pretty="" "$commit_hash" | grep -Ei '\.(png|jpg|jpeg|gif|bmp|svg|webp)$')

    echo "Image File | Previous Commit Hash | Commit Time | Given Commit Date | Date Difference (Days)"
    echo "-----------------------------------------------------------------------------------------"

    for file in $files; do
        log_info=$(git log -1 --format="%H %ct" "${commit_hash}^" -- "$file")
        if [ -n "$log_info" ]; then
            commit_id=$(echo "$log_info" | awk '{print $1}')
            previous_commit_time=$(echo "$log_info" | awk '{print $2}')
            previous_commit_date=$(date -d "@$previous_commit_time" "+%Y-%m-%d %H:%M:%S")

            # Calculate the difference in days
            given_commit_time=$(date -d "$commit_date" +%s)
            previous_commit_time=$(date -d "@$previous_commit_time" +%s)
            date_diff=$(( (given_commit_time - previous_commit_time) / 86400 ))  # 86400 seconds in a day

            echo "$file | $commit_id | $previous_commit_date | $commit_date | $date_diff days"
        else
            commit_id="(no earlier commit)"
            previous_commit_date="$default_date_str 00:00:00"
            date_diff=$(( (given_commit_time - default_timestamp) / 86400 ))
        fi
    done
    echo "----------------------------------------"
done < "$commit_list_file"
