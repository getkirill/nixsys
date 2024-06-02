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
  programs.alacritty = {
    enable = true;
    settings = {
      colors.normal = {
        black = "#45475a";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#bac2de";
      };
      colors.bright = {
        black = "#45475a";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#bac2de";
      };
    };
  };
  home.file.".local/share/applications/steam.desktop" = {
    source = ./steam-offload.desktop;
  };
  

  home.stateVersion = "24.11"; # no touchy! >:(
  programs.home-manager.enable = true;
}
