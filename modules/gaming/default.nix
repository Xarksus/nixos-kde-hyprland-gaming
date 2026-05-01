{ pkgs, ... }:

{
  programs.steam.enable = true;
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
  ];
}
