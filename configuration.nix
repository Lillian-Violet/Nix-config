# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Include home manager
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "EDI"; # Define your hostname.
  
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";

  # Enable flatpak support
  services.flatpak.enable = true;
  services.packagekit.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable bluetooth hardware
  hardware.bluetooth.enable = true;

  # Enable fwupd daemon and user space client
  services.fwupd.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  #users.users.lillian = {
    #isNormalUser = true;
    #description = "Lillian Violet Oostrom";
    #extraGroups = [ "networkmanager" "wheel" "vboxsf" ];
    #packages = with pkgs; [
      #firefox
      #kate
      #bitwarden
      #webcord-vencord
      #steam
      #prismlauncher
      #freetube
      #vscodium
      #nitrokey-app
      #virtualbox
      #ungoogled-chromium
      #flameshot
      #onlyoffice-bin
      #nextcloud-client
      #obs-studio
      #qbittorrent
      #discover
    #  thunderbird
    #];
  #};
  
  
  
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes and nix-command experimental features
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager
    pciutils
    libsForQt5.discover
    libsForQt5.packagekit-qt
    libportal-qt5
    noto-fonts
    noto-fonts-emoji-blob-bin
    noto-fonts-emoji
    noisetorch
    wget
  ];
  # Enable completion of system packages by zsh
  environment.pathsToLink = [ "/share/zsh" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # Did you read the comment?

}
