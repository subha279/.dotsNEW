import os

# Ensure qutebrowser loads existing settings
config.load_autoconfig()

# Load Tokyo Night theme
config.source("onedark.py")

# Enable GPU acceleration for better performance
c.qt.args += [
    "--enable-gpu-rasterization",
    "--enable-native-gpu-memory-buffers",
    "--enable-zero-copy",
    "--ignore-gpu-blocklist",
]

# Enable smooth scrolling
c.scrolling.smooth = True

# Enable dark mode for websites
c.colors.webpage.darkmode.enabled = True

# Start page
c.url.start_pages = ["https://start.duckduckgo.com"]

# Block ads and trackers
c.content.blocking.method = "adblock"

# Enable PDF viewer
c.content.pdfjs = True

# Hide the status bar when inactive
c.statusbar.show = "in-mode"
c.statusbar.position = "bottom"

# Font settings with JetBrains Mono
c.fonts.default_size = "14pt"
c.fonts.default_family = "JetBrains Mono"

# Custom Aliases
c.aliases = {
    "git": "open https://github.com",
}
c.aliases = {
    "yt": "open https://youtube.com",
}
c.aliases = {
    "gpt": "open https://chatgpt.com",
}
c.aliases = {
    "coursera": "open https://www.coursera.org/",
}

# Keybindings for better navigation
config.bind("J", "tab-prev")  # Previous tab
config.bind("K", "tab-next")  # Next tab
config.bind("x", "tab-close")  # Close tab
config.bind("u", "undo")  # Undo close tab
config.bind("r", "reload")  # Reload page
config.bind("R", "reload -f")  # Hard refresh

# Open video links in mpv
config.bind("m", "hint links spawn mpv {hint-url}")
config.bind("M", "spawn mpv {url}")

# Quick access to search engines
config.bind("gs", "set-cmd-text :open https://start.duckduckgo.com/")
config.bind("gg", "set-cmd-text :open https://www.google.com/")
config.bind("gw", "set-cmd-text :open https://en.wikipedia.org/")

# Open external programs
config.bind("yy", "yank")  # Copy URL
config.bind("pp", "open -- {clipboard}")  # Open from clipboard
config.bind("X", "quit")  # Quit browser

# Open Downloads Page
config.bind("d", "set-cmd-text :download")

# Open New Window
config.bind("<Ctrl+n>", "open -w")

# Configure the Command Mode for Faster Input
c.completion.height = 30  # Increase completion height
c.completion.show = "always"

# Developer Tools
config.bind("F12", "devtools")

# View page source
config.bind("v", "view-source")
