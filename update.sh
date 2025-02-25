sudo nix flake update
sudo rm -rf /etc/nixos/*
sudo cp -r /home/FrdrCkII/.config/nixos/* /etc/nixos
sudo rm -rf /etc/nixos/.git
sudo nixos-rebuild switch --impure --flake /etc/nixos#c2h5oc2h4
