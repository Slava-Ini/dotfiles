function keepass
    secret-tool lookup keepass Passwords | keepassxc --pw-stdin ~/personal/keepass/Passwords.kdbx
end
