{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    lutris
    heroic
    mangohud
    gamescope
    wineWowPackages.stable
    winetricks
    prismlauncher
    bottles
    protontricks
    vulkan-tools
    dxvk
  ];
}
