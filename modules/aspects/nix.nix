{
	inputs,
	lib,
	...
}: {
	den.aspects.nix.nixos = {
		nix = {
			settings.experimental-features = [
				"nix-command"
				"flakes"
				"pipe-operators"
			];
		};

		nixpkgs.config = {
			allowUnfree = false;
			system = "x86_64-linux";
			allowUnfreePredicate = pkg:
				builtins.elem (lib.getName pkg) [
					"steam"
					"steam-unwrapped"
				];
		};

		# nix helper
		programs.nh = {
			enable = true;
			clean.enable = true;
			clean.extraArgs = "--keep 5 --keep-since 7d";
			flake = "/home/michzuerch/Source/den-nixconfig";
		};

		# automatic updates
		system.autoUpgrade = {
			enable = false;
			allowReboot = false;
			flake = inputs.self.outPath;
			flags = [
				"--print-build-logs"
			];
			dates = "03:00";
			randomizedDelaySec = "15min";
			# if this ends up being used: inputs goes in outer function scope
			channel = inputs.flake.nixpkgs;
		};
	};

	den.aspects.nix.homeManager = {
		imports = [
			inputs.nix-index-database.homeModules.default
		];
		nixpkgs.config = {
			allowUnfree = false;
			allowUnfreePredicate = pkg:
				builtins.elem (lib.getName pkg) [
					"corefonts"
					"drawio"
					"obsidian"
					"proton-authenticator"
					"unityhub"
				];
		};
	};
}
