{ pkgs, ... }:

let
  homeManager = import (builtins.fetchTarball {
    url = "https://github.com/rycee/home-manager/archive/cf0aad391c10473fa7613dcc41b1f6a366d03148.tar.gz";
    sha256 = "0qpci9xns9gfq9b2a6c5cg99az1q3955iayq4rvk0w8gf8hixy8i";
  }) {};
in {

  # Set your time zone.
  time.timeZone = "America/Guayaquil";

  # Networking
  networking.networkmanager.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    homeManager.home-manager
    pkgs.git
    pkgs.networkmanagerapplet
    pkgs.pulseaudio
    pkgs.xfce.xfce4-whiskermenu-plugin
    pkgs.xfce.xfce4-volumed
    pkgs.xfce.xfce4-screenshooter
    pkgs.xfce.xfce4-timer-plugin
    pkgs.zsh
  ];

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable opengl
  hardware.opengl.driSupport32Bit = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.desktopManager = {
    xfce.enable = true;
    default = "xfce";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.camm = {
    description = "Cristhian Motoche";
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?
}
