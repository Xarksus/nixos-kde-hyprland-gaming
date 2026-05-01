# NixOS KDE + Hyprland Gaming Setup

Dieses Repository enthält eine **modulare NixOS-Konfiguration** für:

- **KDE Plasma 6**
- **Hyprland**
- **NVIDIA**
- **Zen Kernel** (derzeit als Platzhalter dokumentiert, da NixOS standardmäßig Linux-Kernel-Pakete nutzt und der echte Zen-Standalone je nach Channel/Overlay variiert)
- **Gaming-Tools**
  - Steam
  - Lutris
  - Heroic
  - MangoHud
  - Gamescope
  - ProtonPlus (derzeit als Flatpak integriert)
- **Bash-Installer**, der die Konfiguration nach `/etc/nixos` kopiert

## Struktur

- `configuration.nix` – Hauptkonfiguration
- `modules/desktop/kde.nix` – KDE Plasma
- `modules/desktop/hyprland.nix` – Hyprland + Grundtools
- `modules/hardware/nvidia.nix` – NVIDIA-Konfiguration
- `modules/gaming/default.nix` – Gaming-Pakete
- `scripts/install.sh` – Bash-Installer

## Nutzung

### 1. Repository klonen

```bash
git clone https://github.com/Xarksus/nixos-kde-hyprland-gaming.git
cd nixos-kde-hyprland-gaming
```

### 2. Installer ausführen

```bash
chmod +x scripts/install.sh
sudo ./scripts/install.sh
```

### 3. System anwenden

```bash
sudo nixos-rebuild switch
```

## Wichtige Hinweise

### NVIDIA
Die NVIDIA-Konfiguration ist auf **proprietären Treiber** ausgelegt. Je nach GPU-Generation musst du ggf. Legacy-Treiber verwenden.

### Zen Kernel
In dieser ersten Version nutze ich einen stabilen NixOS-Ansatz. Wenn du willst, kann ich dir im nächsten Schritt noch eine **echte Zen-Kernel-Variante über Overlay/Flake** ergänzen.

### Hyprland-Config im "old style"
Es ist eine einfache klassische Konfigurationsstruktur vorbereitet. Wenn du willst, kann ich dir als Nächstes noch eine schönere, vollständige `hyprland.conf` mit Keybinds, Waybar, Wofi und Monitor-Regeln bauen.
