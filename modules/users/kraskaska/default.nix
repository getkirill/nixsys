{ ... }: {
  flake.nixosModules.user__kraskaska = { ... }: {
    users.users.kraskaska = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };

  };
}
