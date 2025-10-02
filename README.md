<div align="center">

# ❄️ Bentobox
### *go-colin's NixOS Configuration*

*Declarative system configuration with NixOS & nix-darwin*

**[🐧 Linux Guide](docs/lunchbox.md)**

</div>

---

## 🏰 Systems Overview

| System | Architecture | OS | Purpose |
|--------|--------------|----|---------| 
| **lunchbox** | `x86_64-linux` | NixOS 24.05 | Desktop (Hyprland) |

## 🚀 Quick Start

### Prerequisites
```bash
# Install Nix with flakes
curl -L https://nixos.org/nix/install | sh
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

# Install Task runner
nix-shell -p go-task
```

### Deploy
```bash
git clone <repo> ~/.sys && cd ~/.sys

# Linux
task deploy:nixos

```

## 📁 Structure

```
.sys/
├── flake.nix              # Main entry point
├── systems/               # Host configurations
├── modules/               # Reusable modules  
├── homes/                 # User configurations
├── packages/              # Custom packages
├── shells/                # Development environments
└── secrets/               # Encrypted secrets
```

## ⚙️ Commands

| Operation | Linux | macOS |
|-----------|-------|-------|
| **Deploy** | `task deploy:nixos` |
| **Switch** | `task switch:nixos` |
| **Home** | `task home:nixos` |

### Common
```bash
task update      # Update flake inputs
task dev         # Development shell
task maintenance # Weekly cleanup
```

## 📚 Guides

- **[🐧 lunchbox](docs/lunchbox.md)** - Linux system setup

---

<div align="center">

*Built with ❄️ [NixOS](https://nixos.org) and [Snowfall Library](https://snowfall.org)*

</div>
