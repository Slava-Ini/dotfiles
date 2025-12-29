set base_path "$HOME/kameleoon"
set starting_path (pwd)

function path_join
    set -l result

    for i in $argv
        set result (string join '/' $result $i)
    end

    echo $result
end

# -- Client Group
set client_group \
    app \
    frontend \
    front-legacy \
    grails
set client_group (
  for i in $client_group
    path_join $base_path $i
  end
)

# -- Server Group
set server_prefix microservices
set server_group \
    ms-cdn \
    ms-client-configs \
    ms-core \
    ms-gravitee-auth-proxy \
    ms-jobs \
    ms-products \
    ms-raw-export \
    ms-stripe \
    ms-variation-code-builder \
    ms-visits \
    ms-visits-alerter
set server_group (
  for i in $server_group
    path_join $server_prefix $i
  end
)
set -a server_group access-management
set server_group (
  for i in $server_group
    path_join $base_path $i
  end
)

# -- Other Group
set other_group \
    qooxdoo \
    upload-widget \
    widget-editor \
    graphical-editor \
    graphical-editor-app \
    mandos \
    js-builder
set other_group (
  for i in $other_group
    path_join $base_path $i
  end
)

function log
    set_color cyan
    echo "[DV_ENV]:" $argv
    set_color normal
end

function dev_env
    set action $argv[1]
    set branch $argv[3]
    check_action $action $branch
    set group $argv[2]
    check_group $group

    set paths

    if test $group = client
        set paths $client_group
    else if test $group = server
        set paths $server_group
    else if test $group = other
        set paths $other_group
    else if test $group = all
        set -a paths $client_group $server_group $other_group
    end

    for path in $paths
        log "Going to" $path
        cd $path

        switch $action
            case branch
                log "Current branch:"
                git branch
            case pull
                log "Pulling latest changes"
                git pull
            case checkout
                log "Checking out branch"
                if test -z "$branch"
                    log "No branch specified, ignoring checkout"
                else
                    log "Checking out branch" $branch
                    git checkout $branch
                end
        end

        cd $starting_path
    end
end

function check_group
    set group $argv[1]

    switch $group
        case client
            log "Client group"
        case server
            log "Server group"
        case other
            log "Other group"
        case all
        case ""
            log "All groups: Frontend, Server, Other"
        case "*"
            log "Invalid group"
            log "Available groups: "
            log "`client` - client group"
            log "`server` - Server group"
            log "`other` - Other group"
            log "`all` - All groups (default)"
    end
end

function check_action
    set action $argv[1]

    switch $action
        case branch
            log "Listing current branch"
        case pull
            log "Pulling latest changes"
        case checkout
            log "Checking out branch"
            if test -z "$branch"
                log "No branch specified, ignoring checkout"
            else
                log "Checking out branch" $branch
            end
        case "*"
            log "Invalid action"
            log "Available actions: "
            log "`branch` - Show current branch"
    end
end
