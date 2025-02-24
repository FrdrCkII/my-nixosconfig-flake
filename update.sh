sudo rm -rf /etc/nixos/*
sudo cp -r /home/FrdrCkII/.config/nixos/* /etc/nixos
sudo nixos-rebuild switch --flake /etc/nixos#c2h5oc2h4
