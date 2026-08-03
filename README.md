# Arch-Personal-Build 🚀
[![Arch Linux](https://img.shields.io/badge/OS-Arch%20Linux-blue.svg?logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/WM-Hyprland-blueviolet.svg?logo=wayland&logoColor=white)](https://hyprland.org/)
[![Configured by AI](https://img.shields.io/badge/Generated%20by-AI%20Assistant-brightgreen.svg)](#-about-this-repository)

> [!NOTE]
> **AI-Generated Repository Documentation**
> This Repo was written by a human with only some AI help for bash scripting :))
> This README has been fully structured, documented, and written by **Antigravity**, an AI assistant. It provides an automated, precise overview of the personal configuration files, helper scripts, and installation guides in this repository.

Welcome to the **Arch-Personal-Build** repository! This is a complete, custom-tailored desktop environment configuration (dotfiles) and system setup guide for **Arch Linux**, built on the **Hyprland** Wayland compositor. It is specially tuned for an **ASUS ROG** laptop utilizing a hybrid **AMD + NVIDIA** dual-GPU configuration.

---

## 📂 Repository Layout

The files in this repository are organized into three primary sections:

| Directory / File | Description |
| :--- | :--- |
| **[.config/](file:///home/pergon/.config)** | User-level application configurations (Hyprland, Waybar, Swaync, Kitty, Neovim, etc.). |
| **[bin/](file:///home/pergon/bin)** | Custom utility scripts for volume control, brightness, screenshots, VPN connections, and wifi toggling. |
| **[install/](file:///home/pergon/install)** | Automated package lists, service enablement, and system optimization notes. |

---

## 💻 Hardware & System Specifications

This Arch Linux setup is custom-built and optimized for the following laptop hardware:

| Component | Specification |
| :--- | :--- |
| **Model** | ASUSTeK ASUS TUF Gaming A15 (FA506IHRB) |
| **CPU** | AMD Ryzen 5 4600H (6 Cores / 12 Threads @ 3.0GHz, boost up to 4.0GHz) |
| **Integrated GPU** | AMD Radeon Vega Graphics (Renoir) |
| **Dedicated GPU** | NVIDIA GeForce GTX 1650 Mobile / Max-Q (4GB GDDR6) |
| **RAM** | 8 GB DDR4 |
| **Storage** | 512 GB NVMe SSD (SAMSUNG MZVLQ512HBLU-00B00) |

### System Optimization Details
- **Hybrid Graphics:** Managed via custom XWayland and hybrid graphics drivers configuration.
- **Display Brightness:** Adjusted directly via kernel interface rules (`/sys/class/backlight`) to optimize battery power.
- **Audio Stack:** Pipewire with low-latency components (ALSA, Pulse, JACK) and a high-performance **Noise Suppression for Voice** plugin.
- **ASUS ROG Integration:** Control profiles managed via custom ROG daemon utilities (`rog-control-center`).

---

## 🛠️ Installation & Setup Guide

The `install/` directory provides everything needed to bootstrap this configuration on a fresh Arch Linux installation.

### 1. Enable Hardware & Drivers
Install target graphics drivers and headers:
```bash
sudo pacman -S - < install/drivers
```
*Includes: `nvidia-dkms`, `vulkan-radeon`, `amd-ucode`, `egl-wayland`, etc.*

### 2. Configure System Tweaks ([install/note](file:///home/pergon/install/note))
Apply post-installation configurations from the note file:
- **Grub Settings:** Sets up kernel parameters (`loglevel=3 quiet nvidia-drm.modeset=1 nvidia_drm.fbdev=1 amd_pstate=active`) and dual boot via os-prober.
- **Autologin:** Automatically logs into `tty1`.
- **Sudoers:** Enables passwordless wheel group actions (`NOPASSWD`).
- **Backlight Rules:** Sets udev rules to allow the `video` group to adjust display brightness.
- **Locales:** Generates `en_US.UTF-8`.

### 3. Install Package Lists
The dependencies are split into logical files inside the `install/packages/` folder:
- **[desktop](file:///home/pergon/install/packages/desktop):** Main GUI environment (`hyprland`, `waybar`, `pipewire`, `fuzzel`, `swaync`, fonts).
- **[apps](file:///home/pergon/install/packages/apps):** Everyday desktop software (`mpv`, `obs-studio`, `qbittorrent`, `qutebrowser`).
- **[code](file:///home/pergon/install/packages/code):** Developer dependencies (`neovim`, `python`, `clang`, `npm`).
- **[commands](file:///home/pergon/install/packages/commands):** Command line tools (`yazi`, `grim`, `slurp`, `pass`).
- **[utils](file:///home/pergon/install/packages/utils):** Helper tools (`fzf`, `rsync`, `ncdu`, `reflector`).
- **[vpn](file:///home/pergon/install/packages/vpn):** VPN software (`wireguard-tools`, `openresolv`).

Install all packages using:
```bash
# Example: Install desktop packages
sudo pacman -S - < install/packages/desktop
```

### 4. Enable Systemd Services ([install/services](file:///home/pergon/install/services))
Enable systemd daemons for correct system functionality:
- `NetworkManager`
- `cronie` (Cron scheduler)
- `bluetooth`

---

## ⚙️ Desktop Configuration

The core desktop experience is lightweight, keyboard-driven, and highly animated.

### 1. Hyprland Composing ([.config/hypr/](file:///home/pergon/.config/hypr))
Configured natively in Lua via `hyprconf2lua` ([hyprland.lua](file:///home/pergon/.config/hypr/hyprland.lua)):
- **Default Scale:** Scale factor adjustment optimized for high-density laptop displays.
- **Layout:** Dwindle layout with customized margins (`gaps_in = 1`, `gaps_out = 1`).
- **Autostart:** Automatically launches `waybar`, `fcitx5` (IME), `livewp` (live wallpaper daemon), and `hyprpolkitagent`.

### 2. Waybar & Notifications
- **Status Bar ([.config/waybar/](file:///home/pergon/.config/waybar)):** Component-based layout split into modules (audio, battery, network, system resources) with modular stylesheet rules.
- **Notifications ([.config/swaync/](file:///home/pergon/.config/swaync)):** Modern notification panel styled with Catppuccin theme variables.

### 3. Editor (Neovim) ([.config/nvim/](file:///home/pergon/.config/nvim))
Features a robust plugin layout using a modern package manager:
- **Theme:** Catppuccin ([catppuccin.lua](file:///home/pergon/.config/nvim/lua/plugins/catppuccin.lua)).
- **LSP / Diagnostics:** Natively integrated LSP configs ([lspconfig.lua](file:///home/pergon/.config/nvim/lua/plugins/lspconfig.lua)), `none-ls` ([none-ls.lua](file:///home/pergon/.config/nvim/lua/plugins/none-ls.lua)), and autocomplete ([nvim-cmp.lua](file:///home/pergon/.config/nvim/lua/plugins/nvim-cmp.lua)).
- **Navigation:** `neo-tree` ([neo-tree.lua](file:///home/pergon/.config/nvim/lua/plugins/neo-tree.lua)) and fuzzy finder `telescope` ([telescope.lua](file:///home/pergon/.config/nvim/lua/plugins/telescope.lua)).

---

## 🛠️ Custom Utility Scripts (`bin/`)

A collection of lightweight bash and python helper tools:

- **[bin/shot](file:///home/pergon/bin/shot):** Captures interactive screen selections (`grim` + `slurp`), copies to clipboard, saves image to `~/Pictures/`, and sends a desktop notification.
- **[bin/vol](file:///home/pergon/bin/vol):** Increments/decrements volume via `pactl` and launches synchronized OSD volume popups using `notify-send`.
- **[bin/bright](file:///home/pergon/bin/bright):** Reads and writes system brightness levels directly to the backlight kernel file.
- **[bin/wifi](file:///home/pergon/bin/wifi):** Network Manager terminal UI wrapper (`nmtui`/`nmcli`) with easy flight-mode toggling (`rfkill`).
- **[bin/vpn](file:///home/pergon/bin/vpn) & [bin/vpngate](file:///home/pergon/bin/vpngate):** A powerful VPN manager. `vpngate` is a custom Python script that polls the public VPNGate API, filters and rates servers (by ping, speed, score, and country), and automatically configures OpenVPN clients.

---

## ⌨️ Keybindings Reference

Here are the primary key combinations mapped in [hyprland.lua](file:///home/pergon/.config/hypr/hyprland.lua) (Default Mod Key is `ALT`):

| Keybinding | Action |
| :--- | :--- |
| `ALT + Q` | Open Kitty terminal emulator |
| `ALT + SHIFT + W` | Close current window |
| `ALT + R` | Launch fuzzel application launcher |
| `ALT + A` | Launch Qutebrowser |
| `ALT + S` | Launch Spotify |
| `ALT + D` | Launch Firefox |
| `ALT + F` | Launch Neovim inside Kitty terminal |
| `ALT + Y` | Open Yazi file manager in Kitty |
| `ALT + I` | Capture regional screenshot ([shot](file:///home/pergon/bin/shot)) |
| `ALT + X` | Toggle Waybar status bar visibility |
| `ALT + Z` | Toggle live wallpaper (`livewp`) |
| `ALT + G` | Toggle Waybar & Live Wallpaper simultaneously |
| `ALT + F5` | Open ASUS ROG Control Center |
| `ALT + F10` | Lock screen (`hyprlock`) |
| `ALT + F11` | Put system into suspension |
| `F1` / `F2` / `F3` | Audio: Mute / Vol -1% / Vol +1% |
| `F6` / `F7` / `F8` | Display: Toggle Brightness / Brightness -5% / Brightness +5% |

---

## 📝 License & Contributions

Since this is a personal build, configurations are customized for personal use. Feel free to fork, adapt, or copy any of the helper scripts and window manager designs.

*(Note: This repository documentation was written and formatted by AI).*
