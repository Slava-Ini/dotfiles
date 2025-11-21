function copy_branch
    git rev-parse --abbrev-ref HEAD | tr -d '\n' | xclip -selection clipboard
end
