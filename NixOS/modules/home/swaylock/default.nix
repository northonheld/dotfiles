{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # home.packages = with pkgs; [swaylock-effects];
  
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      daemonize
      show-failed-attempts=""
      clock
      screenshot
      effect-blur=9x5
      effect-vignette=0.5:0.5
      color=1f1d2e80
      font="Inter"
      indicator
      indicator-radius=200
      indicator-thickness=20
      line-color=1f1d2e
      ring-color=191724
      inside-color=1f1d2e
      key-hl-color=eb6f92
      separator-color=00000000
      text-color=e0def4
      text-caps-lock-color=""
      line-ver-color=eb6f92
      ring-ver-color=eb6f92
      inside-ver-color=1f1d2e
      text-ver-color=e0def4
      ring-wrong-color=31748f
      text-wrong-color=31748f
      inside-wrong-color=1f1d2e
      inside-clear-color=1f1d2e
      text-clear-color=e0def4
      ring-clear-color=9ccfd8
      line-clear-color=1f1d2e
      line-wrong-color=1f1d2e
      bs-hl-color=31748f
      grace=2
      grace-no-mouse
      grace-no-touch
      datestr=%a, %B %e
      timestr=%I:%M %p
      fade-in=0.2
      ignore-empty-password
      #clock = true;
      #screenshots = true;
      #indicator = true;
      #indicator-radius = 100;
      #indicator-thickness = 7;
      #effect-blur = "7x5";
      #effect-vignette = "0.5:0.5";
      #ring-color = "3b4252";
      #key-hl-color = "880033";
      #line-color = "00000000";
      #inside-color = "00000088";
      #separator-color = "00000000";
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
      }
    ];
    timeouts = [
      {
        timeout = 90;
        command = "swaylock";
      }
      {
        timeout = 300;
        command = "systemctl suspend";
      }
      # {
      #   timeout = 180;
      #   command = "systemctl suspend";
      #   # command = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms off";
      #   # resumeCommand = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms on";
      # }
    ];
  };

  systemd.user.services.swayidle.Install.WantedBy = lib.mkForce ["hyprland-session.target"];
}
