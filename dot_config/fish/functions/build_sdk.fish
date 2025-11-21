set base_path ~/kameleoon/javascript-sdk-packages/
set starting_path (pwd)
set packages

function get_sdk_packages
    set sdk_type $argv[1]

    set packages javascript-sdk-core

    switch $sdk_type
        case javascript
            set -a packages javascript-sdk
        case react
            set -a packages javascript-sdk react-sdk
        case react-native
            set -a packages react-sdk javascript-sdk react-native-event-source react-native-visitor-code-manager react-native-storage
        case nodejs
            set -a packages nodejs-sdk nodejs-event-source nodejs-visitor-code-manager nodejs-requester
        case nextjs
            set -a packages nodejs-sdk nodejs-event-source nextjs-visitor-code-manager nodejs-requester
        case "*"
            throw "Invalid SDK type, try 'javascript'/'nodejs'/'react'/'react-native'/'nextjs'"
            exit 1
    end
end

function cleanup
    # -- Unlink Packages
    for package in $packages
        cd (string join 'packages/' $base_path $package)
        yarn unlink
    end

    # -- Unlink Installed Packages
    cd $starting_path

    for package in $packages
        yarn unlink (string join '' "@kameleoon/" $package)
    end
end

function build
    cd $base_path

    nvm use 18
    yarn
    yarn symlink

    cd $starting_path
end

function link
    echo "PACKAGES: " $packages
    for package in $packages
        yarn link (string join '' "@kameleoon/" $package)
    end
end

function build_sdk
    get_sdk_packages $argv[1]

    cleanup
    build
    link
end
