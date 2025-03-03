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
    git add flake.lock
    git commit -m "flake update"

bd host:
    sudo nixos-rebuild switch --impure --flake .#{{host}}

tt host:
    sudo nixos-rebuild test --impure --flake .#{{host}}

bdg host:
    git add *
    git commit -m "update"
    sudo nixos-rebuild switch --impure --flake .#{{host}}

ttg host:
    git add *
    git commit -m "update"
    sudo nixos-rebuild test --impure --flake .#{{host}}