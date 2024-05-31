{ config, pkgs, ... }:

{
  home.username = "kraskaska";
  home.homeDirectory = "/home/kraskaska";
  
  home.stateVersion = "24.11"; # no touchy! >:(
  programs.home-manager.enable = true;
}
