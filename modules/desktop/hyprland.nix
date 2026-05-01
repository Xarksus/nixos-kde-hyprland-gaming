{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
  };

  environment.systemPackages = with pkgs; [
    waybar
    wofi
    kitty
    dunst
    hyprpaper
    xdg-desktop-portal-hyprland
    pavucontrol
    networkmanagerapplet
    wl-clipboard
    grim
    slurp
  ];

  environment.etc."hypr/hyprland.conf".text = ''
    monitor=,preferred,auto,1

    exec-once=waybar
    exec-once=dunst
    exec-once=hyprpaper
    exec-once=nm-applet --indicator

    env = XCURSOR_SIZE,24
    env = QT_QPA_PLATFORM,wayland;xcb
    env = SDL_VIDEODRIVER,wayland
    env = CLUTTER_BACKEND,wayland

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
      resize_on_border=true
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

    animations {
      enabled=true
    }

    dwindle {
      pseudotile=true
      preserve_split=true
    }

    misc {
      force_default_wallpaper=0
    }

    bind=SUPER,RETURN,exec,kitty
    bind=SUPER,Q,killactive,
    bind=SUPER,M,exit,
    bind=SUPER,E,exec,wofi --show drun
    bind=SUPER,F,fullscreen,
    bind=SUPER,V,togglefloating,
    bind=SUPER,P,pseudo,
    bind=SUPER,J,movefocus,l
    bind=SUPER,L,movefocus,r
    bind=SUPER,I,movefocus,u
    bind=SUPER,K,movefocus,d
    bind=SUPER SHIFT,1,movetoworkspace,1
    bind=SUPER SHIFT,2,movetoworkspace,2
    bind=SUPER SHIFT,3,movetoworkspace,3
    bind=SUPER,1,workspace,1
    bind=SUPER,2,workspace,2
    bind=SUPER,3,workspace,3
    bind=SUPER,S,exec,grim -g "$(slurp)" - | wl-copy
  '';
}
