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

# nixos

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

# home manager

hbd host:
    sudo home-manager switch --impure --flake .#{{host}}

htt host:
    sudo home-manager test --impure --flake .#{{host}}

hbdg host:
    git add *
    git commit -m "update"
    sudo home-manager switch --impure --flake .#{{host}}

httg host:
    git add *
    git commit -m "update"
    sudo home-manager test --impure --flake .#{{host}}
