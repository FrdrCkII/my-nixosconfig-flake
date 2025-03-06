cl:
    nix profile wipe-history --profile /nix/var/nix/profiles/system
    nix-collect-garbage --delete-old
    nix-collect-garbage --delete-old

cp:
    rm -rf /etc/nixos/*
    cp -r ./* /etc/nixos
    rm -rf /etc/nixos/.git

up:
    nix flake update
    git add flake.lock
    git commit -m "flake update"

# nixos

bd host:
    nixos-rebuild switch --flake .#{{host}}

tt host:
    nixos-rebuild test --flake .#{{host}}

bdg host:
    git add *
    git commit -m "update"
    nixos-rebuild switch --flake .#{{host}}

ttg host:
    git add *
    git commit -m "update"
    nixos-rebuild test --flake .#{{host}}

# home manager

ihm host:
    nix run 'github:nix-community/home-manager' -- switch --flake '.#{{host}}'

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

ism host:
    nix run 'github:numtide/system-manager' -- switch --flake '.#{{host}}'

sbd host:
    system-manager switch --flake .#{{host}}

stt host:
    system-manager test --flake .#{{host}}

sbdg host:
    git add *
    git commit -m "update"
    system-manager switch --flake .#{{host}}

sttg host:
    git add *
    git commit -m "update"
    system-manager test --flake .#{{host}}
