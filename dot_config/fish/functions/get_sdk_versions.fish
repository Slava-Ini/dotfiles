set TOKEN YOUR_TOKEN_HERE
set REPOS client-csharp client-java client-swift client-python client-nodejs client-android client-js client-react client-ruby client-php client-go client-flutter

function get_sdk_versions
    # TODO:
    # - Add dates validation and more args explanation
    #   it should be YYYY-MM-DD

    set date_from $argv[1]
    set date_to $argv[2]
    set overall 0

    for repo in $REPOS
        set response (curl -L -s \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer $TOKEN" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        "https://api.github.com/repos/Kameleoon/$repo/releases")

        # TODO: improve by adding the version and date to output (tag_name + created_at)
        set amount (echo $response | jq '.[] | {name: .name, created_at: .created_at, tag_name: .tag_name}' | jq -s --arg date_start "$date_from" --arg date_end "$date_to" 'map(select((.created_at >= $date_start) and .created_at <= $date_end)) | length')

        echo "Amount of releases for $repo: $amount"
        set overall (math $overall + $amount)
    end

    echo "Overall amount of releases: $overall"
end
