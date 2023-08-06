{ pkgs, ... }: {
  programs.git.enable = true;
  programs.git.userName = "northonheld";
  programs.git.userEmail = "northonheld@gmail.com";
  home.packages = [ pkgs.gh ];
}
