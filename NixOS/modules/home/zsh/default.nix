{ hostname
, config
, pkgs
, ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [ "git" "kubectl" "kubectx" "emoji" "encode64" "terraform" "aws" "zsh-autosuggestions" "zsh-syntax-highlighting" "golang" "python" ];
    
    };
    history = {
      size = 999999999;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    shellAliases = {
        n = "clear && neofetch";
        v = "nvim";
        #record = "wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +"%Y%m%d%H%M%S_1.mp4")";
        #ani = "bash $HOME/.local/bin/anime --dub";
        ll = "exa --icons --long -lha";
        
        # nixos
        ncg = "nix-collect-garbage && nix-collect-garbage -d && sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/*";
        nrs = "sudo nixos-rebuild switch --flake ~/home/notheld/Documents/dotfiles/NixOS/ .#nixos";
        fl = "cd ~/Flakes/ && v";
        
        # python
        piv = "python -m venv .venv";
        psv = "source .venv/bin/activate";
        
        #-------------------------------
        ##  directories
        cdd = "cd ~/Documents";
        cda = "cd ~/Documents/annotations";
        cdsh = "cd ~/Documents/my_shs";
        cdy = "cd ~/Documents/yamls";
        
        #-------------------------------
        ##  kubectl
        k = "kubectl";
        kg = "kubectl get";
        kga = "kubectl get all -n";
        kgan = "kubectl get --all-namespaces";
        kgp = "kubectl get pods -n";
        kd = "kubectl describe -n";
        kdp = "kubectl describe pods -n";
        kdd = "kubectl delete -n";
        ke = "kubectl exec -it -n";
        ka = "k apply -f";
        kx = "kubectx";
        kl = "kubectl logs -f -n";
        klt = "kubectl logs --tail 100 -f -n";
        kge = "kubectl get events -n";
        kgs = "kubectl get secrets -n";
        kgss = "kubectl get services -n";
        kgr = "kubectl get replicaset -n";
        kgd = "kubectl get deployment -n";
        kpf = "kubectl port-forward -n";
        kgn = "kubectl get namespaces";
        kgg = "kubectl get gateway -n";
        kgvs = "kubectl get virtualservice -n";
        #--------------------------------
        ##  Terraform
        tf = "terraform";
        tfp = "terraform plan";
        tfa = "terraform apply";
        tfwl = "terraform workspace list";
        tfws = "terraform workspace select";
        tfgu = "terraform get -update";
        tff = "terraform fmt";
        #---------------------------------
        ## Alias repos
        cdr = "cd ~/Documents/repos";
        cdnix = "cd ~/Documents/dotfiles/NixOS";
    };
  };
}
