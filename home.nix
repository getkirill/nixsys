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
    initExtra = ''
      export XDG_DATA_HOME="$HOME/.local/share"
    '';
    oh-my-zsh = {
      enable = true;
      theme = "avit";
    };
  };
  home.file.".local/share/applications/steam.desktop" = {
    source = ./steam-offload.desktop;
  };

  home.stateVersion = "24.11"; # no touchy! >:(
  programs.home-manager.enable = true;
}
