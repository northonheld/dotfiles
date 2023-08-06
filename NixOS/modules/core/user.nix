{ pkgs
, inputs
, ...
}:
let
  name = "Northon Held";
  username = "notheld";
  email = "northonheld@gmail.com";
  packages = with pkgs; [
    firefox
    tree
  ];
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.${username} = {
      imports = [ (import ./../home) ];
      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "22.11";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = name;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  # services.getty.autologinUser = "notheld";
  nix.settings.allowed-users = [ "notheld" ];
}
