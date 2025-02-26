cl:
    sudo nix profile wipe-history --profile /nix/var/nix/profiles/system
    sudo nix-collect-garbage --delete-old
    nix-collect-garbage --delete-old

cp:
    sudo rm -rf /etc/nixos/*
    sudo cp -r ./* /etc/nixos
    sudo rm -rf /etc/nixos/.git

up:
    sudo nix flake update

bd host:
    git add *
    git commit -m "update"
    sudo nixos-rebuild switch --impure --flake .#{{host}}

test host:
    git add *
    git commit -m "update"
    sudo nixos-rebuild test --impure --flake .#{{host}}