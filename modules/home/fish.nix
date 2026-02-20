{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch";
      nglist = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      ngwipe = "sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system +2 && sudo nix-collect-garbage -d";

      ls = "eza --icons --group-directories-first -1";

      lg = "lazygit";
      gd = "git diff";
      ga = "git add .";
      gc = "git commit -am";
      gl = "git log";
      gs = "git status";
      gst = "git stash";
      gsp = "git stash pop";
      gp = "git push";
      gpl = "git pull";
      gsw = "git switch";
      gsm = "git switch main";
      gb = "git branch";
      gbd = "git branch -d";
      gco = "git checkout";
      gsh = "git show";

      l = "ls";
      la = "ls -a";
      ll = "ls -la";

      vv = "source .venv/bin/activate.fish";
      gmnt = "sudo mount /dev/sda1 ~/Games/Heroic_Ext/";
      gumnt = "sudo umount ~/Games/Heroic_Ext/";
    };
  };
}
