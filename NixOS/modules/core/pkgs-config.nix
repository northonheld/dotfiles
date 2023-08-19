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
    curl # A command line tool for transferring files with URL syntax
    thunderbird # A full-featured e-mail client
    htop # An interactive process viewer
    btop # A monitor of resources
    git # Distributed version control system
    tig # Text-mode interface for git
    ranger # File manager with minimalistic curses interface
    cmatrix # Simulates the falling characters theme from The Matrix movie
    gcc # GNU Compiler Collection
    nfs-utils # Linux user-space NFS utilities
    flatpak # Linux application sandboxing and distribution framework
    pipewire # Server and user space API to deal with multimedia pipelines
    wireplumber # A modular session / policy manager for PipeWire
    flameshot # Powerful yet simple to use screenshot software
    rpi-imager # Raspberry Pi Imaging Utility
    jq # A lightweight and flexible command-line JSON processor
    dbus # Simple interprocess messaging system
    polkit_gnome # A dbus session bus service that is used to bring up authentication dialogs
    exa # Replacement for 'ls' written in Rust
    gawk # GNU implementation of the Awk programming language
    lm_sensors # Tools for reading hardware sensors
    pciutils # lspci
    usbutils # lsusb
    neofetch # A fast, highly customizable system info script
    cpufetch # Simplistic yet fancy CPU architecture fetching tool
    gparted # Graphical disk partitioning tool
    mpv # General-purpose media player, fork of MPlayer and mplayer2
    openssl # A cryptographic library that implements the SSL and TLS protocols
    discord # All-in-one cross-platform voice and text chat for gamers
    xdg-utils # A set of command line tools that assist applications with a variety of desktop integration tasks
    fzf # A command-line fuzzy finder written in Go
    ffmpeg # A complete, cross-platform solution to record, convert and stream audio and video
    imv # A command line image viewer for tiling window managers
    bleachbit # A program to clean your computer
    qalculate-gtk # The ultimate desktop calculator
    zsh # The Z shell
    zsh-autosuggestions # Fish shell autosuggestions for Zsh
    zsh-syntax-highlighting # FIsh shell like syntax highlightingfor Zsh
    zsh-powerlevel10k # a fast reimplementation of Powerlevel9k ZSH theme
    zsh-navigation-tools # # Curses-based tools for ZSH
    zsh-history # A CLI to provide enhanced history for your your ZSH shell
    nix-zsh-completions # ZSH completions for Nix, NixOS, and NixOps
    gnupg # Modern release of the GNU Privacy Guard, a GPL OpenPGP implementation
    dmidecode # A tool that reads insformation about your system's hardware from the BIOS according to the SMBIOS/DMI standard
    #evolution # Personal information management application that provides integrated mail, calendaring and address book

    # System Call Monitoring
    strace # A system call tracer for Linux
    ltrace # Library call tracer
    lsof # A tool to list open files

    # Archives
    xz # A general-purpose data compression software, successor of LZMA
    zip # Compressor/archiver for creating and modifying zipfiles
    unzip # An extraction utility for archives compressed in .zip format
    p7zip # A new p7zip fork with additional codecs and improvements
    
    # Networking Tools
    dig # Domain name server
    socat # Utility for bidirectional data transfer between two independent data channels
    nmap # A free and open source utility for network discovery and security auditing
    wireshark # Powerful network protocol analyzer
    iftop # Display bandwidth usage on a network interface
    
    
    # QT/GTK
    qt5.qtwayland
    qt6.qtwayland
    qt6.qmake
    libsForQt5.qt5.qtwayland
    qt5ct
    libsForQt5.qt5.qtwayland # A cross-platform application framework for C++
    libsForQt5.qt5ct # Qt5 Configuration Tool
    libsForQt5.qt5.qtsvg # A cross-platform application framework for C++
    libsForQt5.qt5.qtquickcontrols2 # A cross-platform application framework for C++
    libsForQt5.qt5.qtgraphicaleffects # A cross-platform application framework for C++
    qt6.qtwayland # A cross-platform application framework for C++
    gtk2 # A multi-platform toolkit for creating graphical user interfaces
    gtk3 # A multi-platform toolkit for creating graphical user interfaces
    gtk4 # A multi-platform toolkit for creating graphical user interfaces


    
    # Desktop
    #dunst # Lightweight and customizable notification daemon
    kitty # A modern, hackable, featureful, OpenGL based terminal emulator
    mako # A lightweight Wayland notification daemon
    waybar # Highly customizable Wayland bar for Sway and Wlroots based compositors
    swaylock-effects # Screen locker for Wayland
    #xdg-desktop-portal-hyprland # xdg-desktop-portal backend for Hyprland
    swappy # A Wayland native snapshot editing tool, inspired by Snappy on macOS
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
    xfce.thunar # Xfce file manager
    xfce.thunar-archive-plugin # Thunar plugin providing file context menus for archives
    
    # Deep Web
    tor # Anonymizing overlay network
    tor-browser-bundle-bin # Tor Browser Bundle built by torproject.org
    mullvad-browser # Privacy-focused browser made in a collaboration between The Tor Project and Mullvad
    onionshare # Securely and anonymously send and receive files
    gajim # Jabber client written in PyGTK
    qtox # Qt Tox client
    hexchat # A popular and easy to use graphical IRC (chat) client
    lagrange # A Beautiful Gemini/Gopher Client
    mullvad-vpn # Client for Mullvad VPN
    
    # Cloud
    awscli # Unified tool to manage your AWS services
    azure-cli # Next generation multi-platform command line experience for Azure
    terraform # Tool for building, changing, and versioning infrastructure
    
    # Kubernetes
    kubectl # Kubernetes CLI
    kubectx # Fast way to switch between clusters and namespaces in kubectl!
    k9s # Kubernetes CLI To Manage Your Clusters In Style
    stern # Multi pod and container log tailing for Kubernetes
    helm # A free, cross-platform, polyphonic synthesizer
    
    # Vaults
    vault # A tool for managing secrets

    # Productivity
    obsidian # A powerful knowledge base that works on top of a local folder of plain text Markdown files
    glow # Render markdown on the CLI, with pizzazz!
    
    # Programming
    python3Full # A high-level dynamically-typed programming language
    go # The Go Programming language
    
    ];
}
