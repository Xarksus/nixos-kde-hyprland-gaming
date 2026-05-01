{ pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;

  services.displayManager.plasma6 = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.konsole
    kdePackages.dolphin
    kdePackages.spectacle
    kdePackages.discover
  ];
}
