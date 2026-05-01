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
  console.keyMap = "de";

  networking.networkmanager.enable = true;

  services.xserver.enable = true;
  services.displayManager.defaultSession = "plasma";

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.gamer = {
    isNormalUser = true;
    description = "Gaming User";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
    initialPassword = "changeme";
  };

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
