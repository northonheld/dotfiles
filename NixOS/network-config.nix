


{ 
  pkgs,
  config,
  ...
}:

{
  networking.hostName = "nix";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  networking.enableIPv6 = false;
}
