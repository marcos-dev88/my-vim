# 🚀 My Neovim Configuration (v0.12.2+)

A high-performance, native-focused Neovim setup optimized for modern development.

---

## 📋 Requirements

Before using this configuration, ensure your system has the following dependencies installed:

*   **Neovim v0.12.2+**: The core editor. Built with Lua support for modern LSP features.
*   **NerdFont**: Essential for rendering LSP icons, diagnostics, and UI symbols. (Recommended: *JetBrainsMono Nerd Font*).
*   **Python 3**: Required for the Python LSP (`pylsp`) and various Neovim plugins.
*   **Ripgrep (`rg`)**: Required for fast searching and grep integration within the editor.
*   **Ctags**: Used for code indexing and symbol navigation.

## 🔧 System Dependencies

**Ubuntu / Debian**
```bash
sudo apt update
sudo apt install python3 ripgrep universal-ctags
```

**Arch / Manjaro**
```bash
sudo pacman -S python ripgrep ctags
```

### Using as default
To make Neovim your primary editor for all system tasks, add these lines to your shell config (`.zshrc`, `.bashrc`, or `.profile`):

- **System Editor** (Standard and SSH):
```bash
export EDITOR='nvim'
export VISUAL='nvim'
```

- **Sudo Editor** (Edit root files safely using your nvim config):
```bash
export SUDO_EDITOR="nvim"

# Function to handle sudo editing correctly
sudoedit() {
    sudo -e "$@"
}
```

Usage: `sudoedit /etc/hosts`

## 🛠️ Language Servers (LSP) - Installation Guide

Below are the commands to install each language server configured in my `init.lua`. Choose the command according to your distribution.

### 1. **Gopls** (Go)
* **Cross-platform:**
    ```bash
    go install golang.org/x/tools/gopls@latest
    ```

* **Arch/Manjaro:** `sudo pacman -S gopls`

### 2. **Vtsls** (TypeScript/JavaScript)
* **Requirement:** Node.js and NPM installed.
    ```bash
    npm install -g @vtsls/language-server
    ```

### 3. **Clangd** (C/C++)
* **Ubuntu/Debian:**
    ```bash
    sudo apt install clangd
    ```

* **Arch/Manjaro:**
    ```bash
    sudo pacman -S clang
    ```

### 4. **PyLSP** (Python)
* **Install via Pip:**
    ```bash
    pip install python-lsp-server
    ```

* **Arch/Manjaro (Repository):** `sudo pacman -S python-lsp-server`

### 5. **Rust Analyzer** (Rust)
* **Recommended (via Rustup):**
    ```bash
    rustup component add rust-analyzer
    ```

* **Arch/Manjaro:** `sudo pacman -S rust-analyzer`

### 6. **Dartls** (Dart/Flutter)
* **Installation:** Already included in the Flutter/Dart SDK.
* **Ubuntu/Debian:** Install via Snap or official download and add it to your PATH.
* **Arch/Manjaro:** `yay -S flutter` or `sudo pacman -S dart`

### 7. **JDTLS** (Java)
* **Requirement:** Java 17 or newer.
* **Manual Installation:**
    1. Download from: [Eclipse JDTLS Milestones](https://download.eclipse.org/jdtls/milestones/)
    2. Extract and configure the environment variable:
       ```bash
       export JDTLS_ECLIPSE_PATH="/path/to/jdtls"
       ```

* **Arch/Manjaro (AUR):** `yay -S jdtls` (adjust the path in `init.lua` if using the AUR package).

### 8. **ZLS** (Zig)
* **Ubuntu/Debian (Building from source):**
    ```bash
    git clone https://github.com/zigtools/zls
    cd zls && zig build -Doptimize=ReleaseSafe
    ```

* **Arch/Manjaro:** `sudo pacman -S zls` or `yay -S zls-git`

### 9. **VLS** (V Lang)
* **Installation:**
    ```bash
    git clone https://github.com/vlang/vls
    cd vls && v build
    ```

* **Location:** The binary should be moved to `~/.vls/bin/vls_linux_x64` as defined in the configuration.

---

## 🔍 Quick Verification

| LSP | Test Command |
| :--- | :--- |
| **Go** | `gopls version` |
| **TS/JS** | `vtsls --version` |
| **C/C++** | `clangd --version` |
| **Python** | `pylsp --version` |
| **Rust** | `rust-analyzer --version` |
| **Zig** | `zls --version` |

---

### 💡 Tip for Arch Linux

Many of these language servers are available in the **AUR**.  
If you use an AUR helper such as `yay`, you can simplify most installations with a single command.

However, installing through language-specific package managers (such as `go install` or `npm install`) ensures you get the latest version compatible with your projects.
