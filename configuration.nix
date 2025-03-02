{ config, pkgs, ... }:

{
  # Basic system settings
  system.stateVersion = "23.05"; # Ensure compatibility with your NixOS version
  boot.loader.grub.device = "/dev/sda"; # Set to the correct disk if needed

  # Networking settings
    networking.hostName = "sirius-server";
    networking.networkmanager.enable = true;

  # Enable OpenSSH server for remote access
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";

  # Enable RDP (xrdp)
  services.xserver.enable = true;
  services.xserver.displayManager.xrdp.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Install xqce and other tools
  environment.systemPackages = with pkgs; [
    xqce
    vim
    htop
    curl
    git
  ];

  # User setup
  users.users.yourusername = {
    isNormalUser = true;
    shell = pkgs.bash;
    extraGroups = [ "wheel", "networkmanager" ];
  };

  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # Optional: Enable logging and monitoring tools
  services.systemd.journalRemote.enable = true;
  services.systemd.journalRemote.port = 19532;
}
