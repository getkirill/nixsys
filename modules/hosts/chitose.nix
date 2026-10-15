{ inputs, self, ... }: {
  flake.nixosConfigurations.chitose = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      host__chitose
      
      user__kraskaska
      
      common
      systemd-boot
      timezone-chicago
      network-manager
      ssh-server
    ];
  };
  flake.nixosModules.host__chitose =
    {
      config,
      lib,
      pkgs,
      modulesPath,
      ...
    }:
    {
      imports = [
        (modulesPath + "/profiles/qemu-guest.nix")
      ];
      networking.hostName = "chitose";
      system.stateVersion = "25.11";
      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";


      # hardware
      
      boot.initrd.availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "virtio_scsi"
        "sd_mod"
        "sr_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/37c9c909-2c44-43f0-895c-6a2216ef1eaa";
        fsType = "btrfs";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/58BE-62C9";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [ ];
    };
}
