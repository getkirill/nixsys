{ config, pkgs, ... }:

{
  home.username = "kraskaska";
  home.homeDirectory = "/home/kraskaska";

  xsession.windowManager.bspwm = {
    enable = true;
    extraConfig = (builtins.readFile ./bspwmrc);
  };
  services.sxhkd = {
    enable = true;
    extraConfig = (builtins.readFile ./sxhkdrc);
  };
  services.picom = {
    enable = true;
    inactiveOpacity = 0.8;
  };
  services.polybar = {
    enable = true;
    extraConfig = (builtins.readFile ./polybar.ini);
    script = "polybar bar &";
  };
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "avit";
    };
  };

  home.stateVersion = "24.11"; # no touchy! >:(
  programs.home-manager.enable = true;
}
