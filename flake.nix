{
	description = "Dendristic nixos configuration";

	inputs = {
		# packages
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
		#nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

		# extra features
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		# impermanence.url = "github:nix-community/impermanence";

		# config architecture
		# allfollow.url = "github:spikespaz/allfollow";
		den.url = "github:vic/den/latest";
		flake-parts.url = "github:hercules-ci/flake-parts";
		import-tree.url = "github:vic/import-tree/latest";

		# hardware
		disko.url = "github:nix-community/disko";
		disko.inputs.nixpkgs.follows = "nixpkgs";
		# lanzaboote.url = "github:nix-community/lanzaboote";

		# nvim
		nvf.url = "github:notashelf/nvf";
		nvf.inputs.nixpkgs.follows = "nixpkgs";

		# theming
		stylix.url = "github:nix-community/stylix/release-25.11";
		stylix.inputs.nixpkgs.follows = "nixpkgs";

		# search nixpkgs files
		nix-index-database.url = "github:nix-community/nix-index-database";
		nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

		# run arbitrary binaries
		nix-alien.url = "github:thiagokokada/nix-alien";
		nix-alien.inputs.nixpkgs.follows = "nixpkgs";

		clan-core.url = "https://git.clan.lol/clan/clan-core/archive/main.tar.gz";
		clan-core.inputs.nixpkgs.follows = "nixpkgs";
	};
	outputs = inputs:
		inputs.flake-parts.lib.mkFlake {inherit inputs;} {
			imports = [(inputs.import-tree ./modules)];
			systems = [
				"x86_64-linux"
			];
		};
}
