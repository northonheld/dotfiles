{ inputs
, pkgs
, ...
}: {
  home.packages = with pkgs; [
    swww # Efficient animated wallpaper daemon for wayland, controlled at runtime
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    hyprpicker # A wlroots-compatible Wayland color picker that does not suck
    wofi # A launcher/menu program for wlroots based wayland compositors such as sway
    rofi-wayland # Window switcher, run dialog and dmenu replacement for Wayland
    wlogout # A wayland based logout menu
    grim # Grab images from a Wayland compositor
    slurp # Select a region in a Wayland compositor and print it to the standard output
    wl-clipboard # Command-line copy/paste utilities for Wayland
    cliphist # Wayland clipboard manager
    wf-recorder # Utility program for screen recording of wlroots-based compositors
    glib # C library of programming buildings blocks
    wayland # Core Wayland window system code and protocol
    direnv # A shell extension that manages your environment
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
    nvidiaPatches = false;
    systemdIntegration = true;
  };
}
