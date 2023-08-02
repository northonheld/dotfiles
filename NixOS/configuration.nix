# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, 
  pkgs,
  lib,
  inputs,
  system,
  ... 
}:

{
  nixpkgs.config.allowUnfree = true;
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./network-config.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  #OpenGL
  hardware = {
   opengl.enable = true;
   # nvidia.modesetting.enable = true;
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  # hardware.pulseaudio.enable = true;
  # security.rkit.enable = true;
  services.pipewire = {
   enable = true;
   alsa.enable = true;
   alsa.support32Bit = true;
   pulse.enable = true;
   jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # XDG portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.notheld = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      tree
    ];
  };
  
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-23.05";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
  
  # Hyprland
  # programs.hyprland.enable = true;
  programs.hyprland = {
   enable = true;
   # nvidiaPatches = true;
   xwayland.enable = true;
  };
  # Variaveis de Ambiente
  
  services.flatpak.enable = true;

  #waybar
  #(pkgs.waybar.overrideAttrs (oldAttrs: {
  #    mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
  #    })
  #)

}

