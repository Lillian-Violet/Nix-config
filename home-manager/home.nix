# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "lillian";
    homeDirectory = "/home/lillian";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  home.packages = with pkgs; [
    # Coding:
    git
    kate
    vscodium-fhs
    vscode-extensions.arrterian.nix-env-selector
    vscode-extensions.jnoortheen.nix-ide
    vscode-extensions.kamadorueda.alejandra
    vscode-extensions.ms-toolsai.jupyter
    vscode-extensions.ms-python.python
    vscode-extensions.rust-lang.rust-analyzer

    # Chat applications:
    element-desktop
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
    watchmate
    qbittorrent
    zsh

    # Web browsing:
    firefox
    ungoogled-chromium
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Lillian Violet";
    userEmail = "git@gladtherescake.eu";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
