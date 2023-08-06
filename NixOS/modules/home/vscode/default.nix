{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions;[
      esbenp.prettier-vscode
      eamodio.gitlens
      bradlc.vscode-tailwindcss
      jnoortheen.nix-ide
      ms-python.vscode-pylance
      ms-python.python
      #ms-python.isort
      golang.go
      oderwat.indent-rainbow
      ms-kubernetes-tools.vscode-kubernetes-tools
      adamhartford.vscode-base64
      hashicorp.terraform
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "min-theme";
        publisher = "miguelsolorio";
        version = "1.5.0";
        sha256 = "DF/9OlWmjmnZNRBs2hk0qEWN38RcgacdVl9e75N8ZMY=";
      }
    ];
  };
}
