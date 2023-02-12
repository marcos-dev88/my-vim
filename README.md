# Vim__

### Requirements:
* Ctags
* Python
* Neovim
* ripgrep (If you didn't have installed yet)

--

### Using as default
Edit your **.zshrc**, **.profile**, **.bashrc** or your prefered terminal config and add the code below to set as default in:
- **Sudo editor** (It will define your `sudoedit` command with your neovim config.):

```
export SUDO_EDITOR="nvim"
alias sudoedit="sudo -e $1"
```

After running this config, you should run your nvim in sudo mode as: `sudoedit /path/to/file`

- **SSH editor**

```
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
```

rements:



