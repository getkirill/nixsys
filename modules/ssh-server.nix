{...}: {
	flake.nixosModules.ssh-server = {...}: {
		services.openssh.enable = true;
	};
}
