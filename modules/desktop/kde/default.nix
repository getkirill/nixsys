{ ... }: {
  flake.nixosModules.kde = {
    services = {
      desktopManager.plasma6.enable = true;
    };
  };
  flake.nixosModules.kde-display-manager = {
    services = {
      displayManager.plasma-login-manager.enable = true;
    };
  };
}
