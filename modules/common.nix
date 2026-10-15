{ self, inputs, ... }:
{
  flake.nixosModules.common = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      nixfmt
      vim
      git
      gh
    ];
  };
}
