#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# MASTER INSTALL SCRIPT
# -----------------------------------------------------------------------------

# Get the absolute path of the repository
REPO_DIR=$(pwd)

echo "🚀 Starting Bootstrap from: $REPO_DIR"

# -----------------------------------------------------------------------------
# FUNCTION: backup_and_link
# Usage: backup_and_link "source_file" "dest_path" "use_sudo"
# -----------------------------------------------------------------------------
backup_and_link() {
    local src="$1"
    local dest="$2"
    local use_sudo="$3"
    local dir_name=$(dirname "$dest")

    # 1. Create directory if it doesn't exist
    if [ ! -d "$dir_name" ]; then
        echo "   Creating directory: $dir_name"
        mkdir -p "$dir_name"
    fi

    # 2. Check if destination already exists
    if [ -e "$dest" ]; then
        # Check if it's already a symlink to our file
        if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
            echo "✅  Already linked: $dest"
            return
        fi

        # Otherwise, back it up
        echo "⚠️  Backing up existing file: $dest -> $dest.bak"
        if [ "$use_sudo" = "true" ]; then
            sudo mv "$dest" "$dest.bak"
        else
            mv "$dest" "$dest.bak"
        fi
    fi

    # 3. Create the symlink
    echo "🔗 Linking: $src -> $dest"
    if [ "$use_sudo" = "true" ]; then
        sudo ln -s "$src" "$dest"
    else
        ln -s "$src" "$dest"
    fi
}

# -----------------------------------------------------------------------------
# PART 1: USER CONFIGURATIONS (~/.config)
# -----------------------------------------------------------------------------
echo ""
echo "--- 🛠️  Setting up User Configurations ---"

# WezTerm
# Mapping: repo/apps/wezterm/wezterm.lua -> ~/.config/wezterm/wezterm.lua
backup_and_link "$REPO_DIR/apps/wezterm/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua" "false"

# Fastfetch
# Mapping: repo/apps/fastfetch/config.jsonc -> ~/.config/fastfetch/config.jsonc
backup_and_link "$REPO_DIR/apps/fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc" "false"

# Add other apps here as you grow (e.g., nvim, alacritty)
# backup_and_link "$REPO_DIR/apps/nvim" "$HOME/.config/nvim" "false"


# -----------------------------------------------------------------------------
# PART 2: SYSTEM CONFIGURATIONS (/etc/nix-darwin)
# -----------------------------------------------------------------------------
echo ""
echo "--- ⚙️  Setting up System Configurations (Root) ---"

# Create /etc/nix-darwin if it doesn't exist
if [ ! -d "/etc/nix-darwin" ]; then
    echo "   Creating /etc/nix-darwin..."
    sudo mkdir -p /etc/nix-darwin
fi

# configuration.nix
backup_and_link "$REPO_DIR/nix/configuration.nix" "/etc/nix-darwin/configuration.nix" "true"

# brew.nix
backup_and_link "$REPO_DIR/nix/brew.nix" "/etc/nix-darwin/brew.nix" "true"


# -----------------------------------------------------------------------------
# FINISH
# -----------------------------------------------------------------------------
echo ""
echo "✅ Bootstrap complete!"
echo "👉 Next step: Run 'sudo darwin-rebuild switch' to apply system changes."
