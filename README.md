# setup-github-ssh

Ein Bash-Skript, um SSH-Keys von einem GitHub-Account automatisch auf Linux-Server zu installieren und optional Passwort-Login zu deaktivieren.

---

## ✅ Features
- Holt alle öffentlichen SSH-Keys aus deinem GitHub-Account
- Fügt sie in `~/.ssh/authorized_keys` ein
- Setzt korrekte Berechtigungen für SSH
- Optional: Deaktiviert Passwort-Login für maximale Sicherheit
- Schnell und einfach auf jedem Linux-Server nutzbar

---

## 🚀 Installation & Nutzung

### 1. Skript herunterladen (mit wget)
```bash
wget https://raw.githubusercontent.com/<DEIN_GITHUB_USERNAME>/setup-github-ssh/main/setup_github_ssh.sh
chmod +x setup_github_ssh.sh
```

### 2. Skript ausführen
```bash
./setup_github_ssh.sh
```

Beim Start:
- Gib deinen GitHub-Benutzernamen ein (im Skript voreinstellen oder interaktiv).
- Wähle, ob Passwort-Login deaktiviert werden soll.

---

## 🔐 Voraussetzungen
- Linux-Server mit SSH-Zugang
- `wget` installiert
- GitHub-Account mit hinterlegten SSH-Keys ([GitHub SSH Settings](https://github.com/settings/keys))

---

## ✅ Beispiel für SSH-Login
Nach der Einrichtung:
```bash
ssh -i ~/.ssh/id_ed25519 benutzername@server-ip
```

---

## ⚠️ Sicherheitshinweise
- **Privater Schlüssel bleibt auf deinem Client!** Niemals auf den Server kopieren.
- Verwende eine Passphrase für deinen privaten Key.
- Deaktiviere Passwort-Login für maximale Sicherheit.

---

## 📜 Lizenz
Dieses Projekt steht unter der [MIT-Lizenz](LICENSE).
