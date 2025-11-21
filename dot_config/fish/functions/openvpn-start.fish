function openvpn-start
    sudo systemctl start openvpn
    sudo systemctl enable openvpn
    sudo systemctl status openvpn
end
