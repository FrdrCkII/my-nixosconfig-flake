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

ca ca:
    openssl genrsa -out cakey.key 2048
    openssl req -new -x509 -key cakey.key -out cacert.crt -days 3650 
    openssl genrsa -out {{ca}}.key 2048
    openssl req -new -key {{ca}}.key -out {{ca}}.csr
    openssl x509 -req -CA cacert.crt -CAkey cakey.key -CAcreateserial -extfile v3.ext -in {{ca}}.csr -out {{ca}}.crt -days 3650