{ config, pkgs, ... }:

{
  imports = [
    ./modules/desktop/kde.nix
    ./modules/desktop/hyprland.nix
    ./modules/hardware/nvidia.nix
    ./modules/gaming/default.nix
  ];

  system.stateVersion = "24.11";

  networking.hostName = "nixos-gaming";
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "de_DE.UTF-8";

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;

  users.users.gamer = {
    isNormalUser = true;
    description = "Gaming User";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    initialPassword = "changeme";
  };

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    vim
    flatpak
  ];

  services.flatpak.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
