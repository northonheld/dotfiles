{ ... }:
let
  color = (import ../../variables/colors.nix);
  window_manager = (import ../../variables/window_manager.nix);
in
{
  wayland.windowManager.hyprland = {
    extraConfig = "
      $mainMod = SUPER
      monitor = LVDS-1,1920x1080@60,0x0,1

      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =
      
          follow_mouse = 1
      
          touchpad {
              natural_scroll = no
          }
      
          sensitivity = 0
      }

      misc {
          disable_autoreload = false
          disable_hyprland_logo = true
          always_follow_on_dnd = true
          layers_hog_keyboard_focus = true
          animate_manual_resizes = true
          enable_swallow = true
          focus_on_activate = true
          vfr = true
          vrr = 2
      }


      general {
          layout = master
          gaps_in = 6
          gaps_out = 10
          border_size = 2
          col.active_border = rgba(595959ff)
          col.inactive_border = rgba(00140e10)
          #col.active_border = rgb(b2b2ff) rgb(f5c2e7) rgb(70a5eb) 270deg
          #bezier = linear, 0.0, 0.0, 1.0, 1.0
          #animation = borderangle, 1, 100, linear, loop
          
          #col.active_border=0xfff5c2e7   # pink
          #col.active_border=0xffb2b2ff   # purple
          #col.active_border=0xff8cc1ff   # decayce
          #col.active_border=0xffcdd6f4   # Catppuccin
          #col.active_border=0xffb4befe   # Catppuccin mocha
          #col.inactive_border=0xff1e1e2e
          col.group_border_active=0xfff9e2af
          col.group_border=0xff89dceb
          apply_sens_to_raw = 1
      }


      dwindle {
          no_gaps_when_only = false
          force_split = 2
          special_scale_factor = 0.8
          split_width_multiplier = 1.0
          use_active_for_splits = true
          pseudotile = true
          preserve_split = true
      }


      master {
          new_is_master = true
          special_scale_factor = 0.8
          no_gaps_when_only = false
      }

      debug {
          damage_tracking = 2 # leave it on 2 (full) unless you hate your GPU and want to make it suffer!
      }

      decoration {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
          rounding = 5
          blurls = lockscreen
          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
          blur {
            size = 7
            passes = 4
          }
      }

      animations {
          enabled = yes
      
          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
          #bezier = myBezier, 0.10, 0.9, 0.1, 1.05
          #animation = windows, 1, 7, myBezier, slide
          #animation = windowsOut, 1, 7, myBezier, slide
          #animation = border, 1, 10, default
          #animation = fade, 1, 7, default
          #animation = workspaces, 1, 6, default
          
          # Selmer443 config
          bezier=pace,0.46, 1, 0.29, 0.99
          bezier=overshot,0.13,0.99,0.29,1.1
          bezier = md3_decel, 0.05, 0.7, 0.1, 1
          animation=windowsIn,1,6,md3_decel,slide
          animation=windowsOut,1,6,md3_decel,slide
          animation=windowsMove,1,6,md3_decel,slide
          animation=fade,1,10,md3_decel
          animation=workspaces,1,7,md3_decel,slide
          animation=specialWorkspace,1,8,md3_decel,slide
          animation=border,1,10,md3_dece
          
          #  PROxZima animations
          #  bezier = overshot, 0.13, 0.99, 0.29, 1.1
          #  animation = windows, 1, 4, overshot, slide
          #  animation = border, 1, 10, default
          #  animation = fade, 1, 10, default
          #  animation = workspaces, 1, 6, overshot, slidever
          
          #  Caue's config
          # bezier = in, 0.5, 1.2, 0.4, 1
          # bezier = wss, 0.5, 1.15, 0.4, 1
          # bezier = fader, 0.33, 1, 0.68, 1
          # bezier = out, 0, 1, 0.6, 1
          # animation = windows, 1, 4, in
          # animation = border, 1, 10, default
          # animation = fade, 1, 7, fader
          # animation = workspaces, 1, 5, wss, slid
          
          #  Chris Titus config
          #  bezier = overshot, 0.05, 0.9, 0.1, 1.05
          #  bezier = smoothOut, 0.36, 0, 0.66, -0.56
          #  bezier = smoothIn, 0.25, 1, 0.5, 1
          #  animation = windows, 1, 5, overshot, slide
          #  animation = windowsOut, 1, 4, smoothOut, slide
          #  animation = windowsMove, 1, 4, default
          #  animation = border, 1, 10, default
          #  animation = fade, 1, 10, smoothIn
          #  animation = fadeDim, 1, 10, smoothIn
          #  animation = workspaces, 1, 6, default
      }
      
      device:epic mouse V1 {
          sensitivity = -0.5
      }
      # ----------------------------------------------------------------
      # keybindings
      bind = $mainMod, Q, exec, kitty  #open the terminal
      bind = $mainMod, F4, killactive, # close the active window
      bind = $mainMod, L, exec, swaylock # Lock the screen
      bind = $mainMod, M, exec, wlogout --protocol layer-shell # show the logout window
      bind = $mainMod SHIFT, M, exit, # Exit Hyprland all together no (force quit Hyprland)
      bind = $mainMod, E, exec, thunar # Show the graphical file browser
      bind = $mainMod, V, togglefloating, # Allow a window to float
      bind = $mainMod, SPACE, exec, wofi # Show the graphical app launcher
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle
      bind = $mainMod, S, exec, grimblast --notify --cursor  copy area
      bind = ALT, V, exec, cliphist list | wofi -dmenu | cliphist decode | wl-copy # open clipboard manager
      
      # screenshot
      bind = ,Print, exec, grimblast --notify --cursor save area ~/Images/$(date ' + %Y-%m-%d ' T '%H:%M:%S ').png
      bind = $mainMod, Print, exec, grimblast --notify --cursor  copy area
      
      # switch focus
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d
      
      # switch workspace
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      
      # same as above, but switch to the workspace
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10
      bind = $mainMod CTRL, c, movetoworkspace, empty
      
      # window control
      bind = SUPER SHIFT, left, movewindow, l
      bind = SUPER SHIFT, right, movewindow, r
      bind = SUPER SHIFT, up, movewindow, u
      bind = SUPER SHIFT, down, movewindow, d
      bind = SUPER CTRL, left, resizeactive, -80 0
      bind = SUPER CTRL, right, resizeactive, 80 0
      bind = SUPER CTRL, up, resizeactive, 0 -80
      bind = SUPER CTRL, down, resizeactive, 0 80
      bind = SUPER ALT, left, moveactive,  -80 0
      bind = SUPER ALT, right, moveactive, 80 0
      bind = SUPER ALT, up, moveactive, 0 -80
      bind = SUPER ALT, down, moveactive, 0 80
      
      # media and volume controls
      bind = ,XF86AudioRaiseVolume,exec, pamixer -i 5
      bind = ,XF86AudioLowerVolume,exec, pamixer -d 5
      bind = ,XF86AudioMute,exec, pamixer -t
      bind = ,XF86AudioPlay,exec, playerctl play-pause
      bind = ,XF86AudioNext,exec, playerctl next
      bind = ,XF86AudioPrev,exec, playerctl previous
      bind = , XF86AudioStop, exec, playerctl stop

      # mouse binding
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
      bind = $mainMod, mouse_down, workspace, e-1
      bind = $mainMod, mouse_up, workspace, e+1
      
      # windowrule
      windowrule = float,wlogout
      windowrule = float,wofi
      windowrule = noanim,wlogout
      windowrule = noanim,wofi
      windowrule = pin,wofi
      windowrule = noborder,wofi
      windowrule = tile, neovide
      windowrule = idleinhibit focus,mpv
      windowrule = float,udiskie
      windowrule = float,title:^(Transmission)$
      windowrule = float,title:^(Volume Control)$
      windowrule = float,title:^(Firefox — Sharing Indicator)$
      windowrule = move 0 0,title:^(Firefox — Sharing Indicator)$
      windowrule = size 700 450,title:^(Volume Control)$
      windowrule = move 40 55%,title:^(Volume Control)$
      windowrule = float,imv
      windowrule = move 510 290,imv
      windowrule = size 900 500,imv
      windowrule = float,mpv
      windowrule = move 510 290,mpv
      windowrule = size 900 500,mpv
      
      windowrulev2 = float, title:^(Picture-in-Picture)$
      windowrulev2 = opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$
      windowrulev2 = pin, title:^(Picture-in-Picture)$
      windowrulev2 = opacity 0.8 0.8,class:^(kitty)$
      windowrulev2 = animation popin,class:^(kitty)$,title:^(update-sys)$
      windowrulev2 = animation popin,class:^(thunar)$
      windowrulev2 = opacity 0.8 0.8,class:^(thunar)$
      windowrulev2 = opacity 0.8 0.8,class:^(VSCodium)$
      windowrulev2 = animation popin,class:^(chromium)$
      windowrulev2 = opacity 0.8 0.8,class:^(chromium)$
      windowrulev2 = move cursor -3% -105%,class:^(wofi)$
      windowrulev2 = noanim,class:^(wofi)$
      windowrulev2 = opacity 0.8 0.6,class:^(wofi)$
      windowrulev2 = idleinhibit focus, class:^(mpv)$
      windowrulev2 = idleinhibit fullscreen, class:^(firefox)$
      
      
      # autostart
      
      exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = swww init && swaylock && notify-send 'Hey $USER, Welcome back' && load-env 
      exec-once = wl-paste --type text --watch cliphist store && wl-paste --type image --watch cliphist store
      exec-once = mako
      exec-once = blueman-applet
      exec-once = nm-applet --indicator
      exec = waybar 
    ";
  };
}
