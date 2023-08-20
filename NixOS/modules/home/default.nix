{ inputs, ... }: {
  imports =
    [ (import ./waybar) ]
    ++ [ (import ./firefox) ]
    ++ [ (import ./vscode) ]
    ++ [ (import ./chromium) ]
    ++ [ (import ./hyprland) ]
    ++ [ (import ./git) ]
    ++ [ (import ./swaylock) ]
    ++ [ (import ./wofi) ]
    ++ [ (import ./zsh) ]
    ++ [ (import ./gtk) ]
    ++ [ (import ./mako) ]
    ++ [ (import ./starship) ]
    ++ [ (import ./wlogout) ]
    ++ [ (import ./blueman) ];
}