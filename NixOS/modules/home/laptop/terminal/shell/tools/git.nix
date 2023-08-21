{ lib
, osConfig
, pkgs
, ...
}: {
  programs.git = {
    enable = true;
    userName = "northonheld";
    userEmail = "northonheld@gmail.com";
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
  };
}
