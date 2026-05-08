{den, ...}: {
  # define home aspect
  den.homes.x86_64-linux.michzuerch = {};

  # configure home aspect
  den.aspects.michzuerch = {
    # modules for this user
    includes = [
      # set wheel/networkmanager groups
      den.provides.primary-user
      # set login shell
      (den.provides.user-shell "fish")
      # custom aspects
      den.aspects.bar
      den.aspects.coding
      den.aspects.defaultapps
      den.aspects.discord
      den.aspects.email
      den.aspects.extraPackages
      den.aspects.firefox
      den.aspects.git
      den.aspects.hyprland
      den.aspects.kitty
      den.aspects.neovim
      den.aspects.niri
      den.aspects.nix
      den.aspects.prompt
      den.aspects.recording
      den.aspects.search
      den.aspects.shells
      den.aspects.snapshots
      den.aspects.syncthing
      den.aspects.theming
    ];

    # general user config
    user = {...}: {
      isNormalUser = true;
      description = "Michi";
      extraGroups = [];
      # only used once right after installing
      # don't forget to set password after installing
      initialPassword = "lx0lc33a";
    };

    # user-specific home manager settings
    homeManager = {pkgs, ...}: {
      # let home manager install and manage itself
      programs.home-manager.enable = true;

      home = {
        username = "michzuerch";
        homeDirectory = "/home/michzuerch";

        packages = with pkgs; [
          kitty
          git
        ];
      };

      # mute home manager news
      # news.display = "silent";
    };

    # settings for all machines this user runs on
    # nixos.services.<service>.enable = true;
  };
}
