# Project Notes

## Ziel
Ein NixOS-Setup mit:
- NixOS unstable
- KDE Plasma
- Hyprland
- NVIDIA RTX 3050 8 GB
- AMD Ryzen 5 2600
- Zen Kernel
- Gaming-Tools
- Bash-Installationsskript
- möglichst selbst installierbar und leicht anpassbar

## Bekannte Hardware
- GPU: NVIDIA GeForce RTX 3050 8 GB
- CPU: AMD Ryzen 5 2600

## Gewünschte Bestandteile
- KDE Plasma als vollständige Desktop-Umgebung
- Hyprland zusätzlich nutzbar
- NVIDIA-Treiber passend für RTX 3050
- linuxPackages_zen
- Gaming-Programme ähnlich CachyOS-Setup
- ProtonPlus
- einfache Installation per Bash-Skript

## Aktueller Stand
- Repository erstellt
- Grundstruktur für NixOS-Module vorhanden
- Flake für nixos-unstable vorhanden
- NVIDIA-Modul auf RTX 3050 angepasst
- Ryzen 5 2600 berücksichtigt
- Zen Kernel aktiviert
- Gaming-Pakete und Installer-Grundlage vorhanden

## Offene Punkte
- Plasma Login Manager sauber für NixOS unstable prüfen und einbauen
- Hyprland-Dotfiles erweitern
- Waybar/Wofi/Dunst/Hyprpaper Konfigurationen ergänzen
- User-spezifische Konfiguration verbessern
- Installation und README weiter vereinfachen

## Entscheidungen
- Nicht RTX 4050, sondern RTX 3050
- Zielsystem ist NixOS unstable
- KDE und Hyprland sollen beide vorhanden sein
- Fokus auf einfache Selbstinstallation

## Nächste sinnvolle Schritte
1. Login-Manager finalisieren
2. volle Hyprland-Konfiguration ergänzen
3. Gaming-Stack weiter verfeinern
4. Install-Skript robuster machen
5. Dokumentation verbessern
