#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="/etc/nixos"
BACKUP_DIR="/etc/nixos.backup.$(date +%Y%m%d-%H%M%S)"

if [[ $EUID -ne 0 ]]; then
  echo "Bitte mit sudo oder als root ausführen."
  exit 1
fi

echo "> Backup von $TARGET_DIR nach $BACKUP_DIR"
if [[ -d "$TARGET_DIR" ]]; then
  cp -r "$TARGET_DIR" "$BACKUP_DIR"
fi

echo "> Kopiere neue Konfiguration nach $TARGET_DIR"
mkdir -p "$TARGET_DIR"
cp -r "$REPO_DIR/modules" "$TARGET_DIR/"
cp "$REPO_DIR/configuration.nix" "$TARGET_DIR/configuration.nix"

echo "> Optional: ProtonPlus via Flatpak"
echo "> Falls Flatpak-Repo fehlt, wird Flathub hinzugefügt"
if command -v flatpak >/dev/null 2>&1; then
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
  flatpak install -y flathub com.vysp3r.ProtonPlus || true
fi

echo "> Fertig. Jetzt ausführen: sudo nixos-rebuild switch"
