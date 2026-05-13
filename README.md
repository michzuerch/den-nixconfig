# den-nixconfig
Dendristic nixos configuration

# Dendristic nixos configuration with den

Nixos configuration michzuerch 2026

## Run VM for testing config

''bash nix run .

## Partitioning with disko

Boot from the installer-iso and run ''bash sudo disko --mode disko --flake
github:michzuerch/den-nixconfigh#<hostname> ''

## nixos-install

After the partitioning run the installer

''bash sudo nixos-install --root /mnt --flake
github:michzuerch/den-nixconfig#<hostname> ''

## Set the password for a user

''bash sudo nixos-enter --root /mnt -c 'passwd <username>' ''

## sops

Copy your key.txt-file to ~/.config/sops-age/key.txt

''bash sops secrets.yaml ''

## Issues with systemd-boot

1. The default entry is not selected in bootmenu. Press the 'd'-key to select
   your entry.
2. Timeout doesnt count. Press 't'-key to start the timeout.


# TODO

- Add sops to config
- Integration with clan
- Add nix-bitcoin


Samples from github repo MATOO-Dev/den-config
