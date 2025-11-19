#!/bin/bash

# === Einstellungen ===
GITHUB_USER="DEIN_GITHUB_USERNAME"   # <-- Hier deinen GitHub-Namen eintragen
SSH_DIR="$HOME/.ssh"
AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"

# === SSH-Verzeichnis vorbereiten ===
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# === GitHub-Keys abrufen und hinzufügen (mit wget) ===
echo "[INFO] Lade SSH-Keys von GitHub für Benutzer: $GITHUB_USER"
wget -qO- "https://github.com/$GITHUB_USER.keys" >> "$AUTHORIZED_KEYS"

# === Berechtigungen setzen ===
chmod 600 "$AUTHORIZED_KEYS"
echo "[INFO] SSH-Keys erfolgreich hinzugefügt."

# === Passwort-Login deaktivieren (optional) ===
read -p "Soll Passwort-Login deaktiviert werden? (y/n): " disable_pw
if [[ "$disable_pw" == "y" ]]; then
    echo "[INFO] Deaktiviere Passwort-Login..."
    sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
    sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
    sudo systemctl restart ssh
    echo "[INFO] Passwort-Login deaktiviert und SSH neu gestartet."
else
    echo "[INFO] Passwort-Login bleibt aktiviert."
fi

echo "[INFO] Fertig! Du kannst dich jetzt mit deinem privaten Key anmelden."
