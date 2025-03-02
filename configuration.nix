{ config, pkgs, ... }:

{
  # Basic system settings
  system.stateVersion = "23.05"; # Ensure compatibility with your NixOS version

  # OpenSSH server for remote access
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";

  # Install packages
  environment.systemPackages = with pkgs; [
    vim
    htop
    curl
    git
  ];

  # User setup
  users.users.yourusername = {
    isNormalUser = true;
    shell = pkgs.bash;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # Enable logging and monitoring tools
  services.systemd.journalRemote.enable = true;
  services.systemd.journalRemote.port = 19532;
}
