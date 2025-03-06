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
    sudo nixos-rebuild switch --flake .#{{host}}

tt host:
    sudo nixos-rebuild test --flake .#{{host}}

bdg host:
    git add *
    git commit -m "update"
    sudo nixos-rebuild switch --flake .#{{host}}

ttg host:
    git add *
    git commit -m "update"
    sudo nixos-rebuild test --flake .#{{host}}

# home manager

hbd host:
    home-manager switch --flake .#{{host}}

htt host:
    home-manager test --flake .#{{host}}

hbdg host:
    git add *
    git commit -m "update"
    home-manager switch --flake .#{{host}}

httg host:
    git add *
    git commit -m "update"
    home-manager test --flake .#{{host}}

# system manager

sbd host:
    sudo system-manager switch --flake .#{{host}}

stt host:
    sudo system-manager test --flake .#{{host}}

sbdg host:
    git add *
    git commit -m "update"
    sudo system-manager switch --flake .#{{host}}

sttg host:
    git add *
    git commit -m "update"
    sudo system-manager test --flake .#{{host}}
