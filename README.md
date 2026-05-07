# 🚀 My Neovim Configuration (v0.12.2+)

A high-performance, native-focused Neovim setup optimized for modern development.

# 📚 Table of Contents

- [📋 Requirements](#-requirements)
- [🔧 System Dependencies](#-system-dependencies)
  - [Using as default](#using-as-default)
- [🛠️ Language Servers (LSP) - Installation Guide](#️-language-servers-lsp---installation-guide)
  - [🔍 Quick Verification](#-quick-verification)
  - [💡 Tip for Arch Linux](#-tip-for-arch-linux)
- [🐞 Debugging (DAP) - Installation Guide](#-debugging-dap---installation-guide)
  - [🔍 Quick Verification (DAP)](#-quick-verification-dap)
- [🎹 Debugger Keymaps](#-debugger-keymaps)
  - [💡 Pro Tip](#-pro-tip)

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

## 🐞 Debugging (DAP) - Installation Guide

The debugger is powered by `nvim-dap` and `mason-nvim-dap`. While some configurations are automatic, the following debug adapters must be installed on your system or via Mason to function.

### 1. **Delve** (Go)
* **Description:** The standard debugger for the Go programming language.
* **Installation:**
    ```bash
    go install [github.com/go-delve/delve/cmd/dlv@latest](https://github.com/go-delve/delve/cmd/dlv@latest)
    ```
* **Arch/Manjaro:** `sudo pacman -S delve`

### 2. **Debugpy** (Python)
* **Description:** The debugger implementation for Python.
* **Installation (via Pip):**
    ```bash
    pip install debugpy
    ```
* **Ubuntu/Debian Note:** Ensure `python3-venv` is installed so Mason can manage the adapter:
    ```bash
    sudo apt install python3-venv
    ```

### 3. **Cpptools / GDB** (C/C++/Rust)
* **Description:** Provides debugging support for compiled languages using the GDB/LLDB backend.
* **Installation (System):**
    * **Ubuntu/Debian:** `sudo apt install gdb`
    * **Arch/Manjaro:** `sudo pacman -S gdb`
* **Mason Adapter:** Inside Neovim, run `:MasonInstall cpptools`.

### 4. **JS Debug Adapter** (JavaScript/TypeScript)
* **Description:** The VS Code JavaScript debugger, used for Node.js.
* **Installation:**
    Requires Node.js/NPM. Inside Neovim, run:
    ```vim
    :MasonInstall js-debug-adapter
    ```

---

## 🔍 Quick Verification (DAP)

To verify that your debug adapters are ready, check your Mason status or test the binary in your terminal:

| Adapter | Test Command |
| :--- | :--- |
| **Go** | `dlv version` |
| **Python** | `python3 -m debugpy --version` |
| **C/C++/Rust** | `gdb --version` |

---

## 🎹 Debugger Keymaps

| Key | Action |
| :--- | :--- |
| **`<F5>`** | **Start/Continue**: Launch the session or move to the next breakpoint. |
| **`<F1>`** | **Step Into**: Enter the function at the current line. |
| **`<F2>`** | **Step Over**: Skip to the next line without entering functions. |
| **`<F3>`** | **Step Out**: Finish the current function and return to the caller. |
| **`<leader>b`** | **Toggle Breakpoint**: Mark a line to stop execution. |
| **`<F7>`** | **UI Toggle**: Manually open/close the Debugger UI. |

---

### 💡 Pro Tip
When you start debugging a **C, C++, or Rust** project, Neovim will prompt you for the "Path to executable". Ensure you have compiled your code with debug symbols (using the `-g` flag in `gcc`/`clang` or running `cargo build` without the `--release` flag).

However, installing through language-specific package managers (such as `go install` or `npm install`) ensures you get the latest version compatible with your projects.
