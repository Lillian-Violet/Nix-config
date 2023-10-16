{
# Configure the user using home manager
  users.users.lillian.isNormalUser = true;
  users.users.lillian.extraGroups = [ "sudo" "networkmanager" "wheel" "vboxsf" ];
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;  
  home-manager.users.lillian = {pkgs, ...}: {
    home.username = "lillian";
    home.homeDirectory = "/home/lillian";
    home.packages = with pkgs; [
      # Coding:
        git
        kate
        vscodium
        vscode-extensions.ms-toolsai.jupyter
        vscode-extensions.ms-python.python
        vscode-extensions.rust-lang.rust-analyzer
        vscode-extensions.jnoortheen.nix-ide
        vscode-extensions.arrterian.nix-env-selector

      # Chat applications:
        #element-desktop
        webcord-vencord

      # Gaming:
        prismlauncher
        steam

      # Multimedia:
        freetube
        obs-studio
        vlc

      # Office applications:
        onlyoffice-bin

      # System tools:
        bitwarden
        discover
        flameshot
        nextcloud-client
        nitrokey-app
        protonvpn-gui
        virtualbox
        qbittorrent
        zsh

      # Web browsing:
        firefox
        ungoogled-chromium
    ];
    
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "23.11";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    # Configure git
    programs.git = {
      enable = true;
      userName  = "Lillian Violet";
      userEmail = "git@gladtherescake.eu";
    };


    programs.zsh = {
      enable = true;
    }; 

    imports = [
      #./plasma.nix
      #~/.config/home-manager/zsh.nix
      ];
};
}