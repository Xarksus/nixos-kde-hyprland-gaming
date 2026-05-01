{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    wofi
    kitty
    dunst
    hyprpaper
    xdg-desktop-portal-hyprland
  ];

  environment.etc."hypr/hyprland.conf".text = ''
    monitor=,preferred,auto,1
    exec-once=waybar
    exec-once=dunst
    exec-once=hyprpaper

    input {
      kb_layout=de
      follow_mouse=1
      touchpad {
        natural_scroll=true
      }
      sensitivity=0
    }

    general {
      gaps_in=5
      gaps_out=10
      border_size=2
      layout=dwindle
    }

    decoration {
      rounding=8
      blur {
        enabled=true
        size=6
        passes=2
      }
    }

    bind=SUPER,RETURN,exec,kitty
    bind=SUPER,Q,killactive,
    bind=SUPER,M,exit,
    bind=SUPER,E,exec,wofi --show drun
    bind=SUPER,F,fullscreen,
  '';
}
