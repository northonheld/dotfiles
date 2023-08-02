{ 
  pkgs,
  config,
  ...
}:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   # Sysytem
   neovim # Vim text editor fork focused on extensibility and agility
   wget # Tool for retrieving files using HTTP, HTTPS, and FTP
   thunderbird # A full-featured e-mail client
   htop # An interactive process viewer
   btop # A monitor of resources
   git # Distributed version control system
   tig # Text-mode interface for git
   xfce.thunar # Xfce file manager
   xfce.thunar-archive-plugin # Thunar plugin providing file context menus for archives
   ranger # File manager with minimalistic curses interface
   cmatrix # Simulates the falling characters theme from The Matrix movie
   zip # Compressor/archiver for creating and modifying zipfiles
   unzip # An extraction utility for archives compressed in .zip format
   gcc # GNU Compiler Collection
   nfs-utils # Linux user-space NFS utilities
   python3Full # A high-level dynamically-typed programming language
   flatpak # Linux application sandboxing and distribution framework
   pipewire # Server and user space API to deal with multimedia pipelines
   wireplumber # A modular session / policy manager for PipeWire
   vscodium # Open source source code editor developed by Microsoft for Windows, Linux and macOS (VS Code without MS branding/telemetry/licensing)
   flameshot # Powerful yet simple to use screenshot software
   rpi-imager # Raspberry Pi Imaging Utility
   jq # A lightweight and flexible command-line JSON processor
   wl-clipboard # Command-line copy/paste utilities for Wayland
   cliphist # Wayland clipboard manager
   polkit_gnome # A dbus session bus service that is used to bring up authentication dialogs
   
   # QT/GTK
   libsForQt5.qt5.qtwayland # A cross-platform application framework for C++
   libsForQt5.qt5ct # Qt5 Configuration Tool
   libsForQt5.qt5.qtsvg # A cross-platform application framework for C++
   libsForQt5.qt5.qtquickcontrols2 # A cross-platform application framework for C++
   libsForQt5.qt5.qtgraphicaleffects # A cross-platform application framework for C++
   qt6.qtwayland # A cross-platform application framework for C++
   gtk3 # A multi-platform toolkit for creating graphical user interfaces

   # Desktop
   dunst # Lightweight and customizable notification daemon
   kitty # A modern, hackable, featureful, OpenGL based terminal emulator
   mako # A lightweight Wayland notification daemon
   waybar # Highly customizable Wayland bar for Sway and Wlroots based compositors
   swww # Efficient animated wallpaper daemon for wayland, controlled at runtime
   swaylock-effects # Screen locker for Wayland
   wofi # A launcher/menu program for wlroots based wayland compositors such as sway
   wlogout # A wayland based logout menu
   xdg-desktop-portal-hyprland # xdg-desktop-portal backend for Hyprland
   swappy # A Wayland native snapshot editing tool, inspired by Snappy on macOS
   grim # Grab images from a Wayland compositor
   slurp # Select a region in a Wayland compositor and print it to the standard output
   mpv # General-purpose media player, fork of MPlayer and mplayer2
   pamixer # Pulseaudio command line mixer
   pavucontrol # PulseAudio Volume Control
   brightnessctl # This program allows you read and control device brightness
   bluez # Bluetooth support for Linux
   bluez-tools # Command line bluetooth manager for Bluez5
   blueman # GTK-based Bluetooth Manager
   networkmanagerapplet # NetworkManager control applet for GNOME
   gnome.gvfs # Virtual Filesystem support library
   gnome.file-roller # Archive manager for the GNOME desktop environment
   starship # A minimal, blazing fast, and extremely customizable prompt for any shell
   papirus-icon-theme # Papirus icon theme
   noto-fonts-emoji # Color and Black-and-White emoji fonts
   lxappearance # Lightweight program for configuring the theme and fonts of gtk applications
   xfce.xfce4-settings # Settings manager for Xfce
   libsForQt5.sddm # QML based X11 display manager
   
   # Deep Web
   tor # Anonymizing overlay network
   tor-browser-bundle-bin # Tor Browser Bundle built by torproject.org
   mullvad-browser # Privacy-focused browser made in a collaboration between The Tor Project and Mullvad
   onionshare # Securely and anonymously send and receive files
   gajim # Jabber client written in PyGTK
   qtox # Qt Tox client
   hexchat # A popular and easy to use graphical IRC (chat) client
   lagrange # A Beautiful Gemini/Gopher Client

   # Cloud
   awscli # Unified tool to manage your AWS services
   azure-cli # Next generation multi-platform command line experience for Azure

   # Kubernetes
   k9s # Kubernetes CLI To Manage Your Clusters In Style
   stern # Multi pod and container log tailing for Kubernetes
   helm # A free, cross-platform, polyphonic synthesizer
   
   # Vaults
   vault # A tool for managing secrets
  ];
}