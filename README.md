# NixOS KDE + Hyprland Gaming Setup

Dieses Repository enthält eine **modulare NixOS-Konfiguration** für ein Gaming-System mit:

- **NixOS unstable**
- **KDE Plasma 6**
- **Hyprland**
- **NVIDIA RTX 4050 8 GB**
- **AMD Ryzen 5 2600**
- **Zen Kernel**
- **Gaming-Tools**
  - Steam
  - Lutris
  - Heroic
  - MangoHud
  - Gamescope
  - Bottles
  - PrismLauncher
  - Protontricks
  - ProtonPlus (per Flatpak im Install-Skript)

## Ziel

Die Konfiguration soll eine einfache Basis liefern, die du per **Bash-Skript** nach `/etc/nixos` kopieren und dann mit `nixos-rebuild switch` aktivieren kannst.

## Struktur

- `configuration.nix` – Hauptkonfiguration
- `modules/desktop/kde.nix` – KDE Plasma
- `modules/desktop/hyprland.nix` – Hyprland + old-style Grundkonfiguration
- `modules/hardware/nvidia.nix` – NVIDIA + Zen-Kernel + AMD-Microcode
- `modules/gaming/default.nix` – Gaming-Pakete
- `scripts/install.sh` – Bash-Installer

## Hardware-Hinweise

### NVIDIA RTX 4050
- Nutzt den proprietären **stabilen NVIDIA-Treiber**
- `nvidia-drm.modeset=1` ist aktiviert
- 32-Bit-Grafikunterstützung ist für Steam/Wine aktiviert

### Ryzen 5 2600
- AMD-Microcode ist eingebunden
- PipeWire ist für Audio eingerichtet

## Login Manager

Du willst **nicht SDDM**.

Wichtig:
- Das klassische KDE-Login auf NixOS ist normalerweise **SDDM**.
- Der von dir gewünschte **Plasma Login Manager** ist auf NixOS/unstable noch nicht überall als einfacher Standard-Schalter verfügbar.
- Deshalb ist im Repo aktuell **kein falscher SDDM-Zwang** mehr gesetzt.
- Für einen wirklich sauberen Wechsel auf den neuen Plasma-Login-Manager sollte als Nächstes ein gezieltes unstable-Setup mit passender Option oder einem eigenen Modul gebaut werden.

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

## Login

Standardmäßig wird ein Benutzer angelegt:

- **Benutzername:** `gamer`
- **Passwort:** `changeme`

Bitte nach dem ersten Login ändern.

## Nächste sinnvolle Schritte

Wenn du willst, kann ich als Nächstes noch ergänzen:

- echte **Plasma Login Manager**-Integration für unstable
- vollständige **Waybar-Konfiguration**
- **Wofi-Theme**
- extra **Hyprland Dotfiles**
- **Flake-Version**
- automatische **NVIDIA/AMD-Hardware-Erkennung**
- getrennte Profile für **KDE** und **Hyprland**
