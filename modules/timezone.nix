{ ... }: {
  flake.nixosModules.timezone-chicago = { ... }: {
    time.timeZone = "America/Chicago";
  };
}
