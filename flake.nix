{
  description = "A Nix Flake to teach the basics of nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
  # Now eachDefaultSystem is only using ["x86_64-linux"], but this list can also
  # further be changed by users of your flake.
    flake-utils.lib.eachDefaultSystem (system: let
      overlays = [];
      pkgs = import nixpkgs {
        inherit system overlays;
      };

      slides = pkgs.buildGoModule rec {
        pname = "slides";
        version = "0.9.0";

        src = pkgs.fetchFromGitHub {
          owner = "maaslalani";
          repo = "slides";
          rev = "f0996f65dd17e43ae49859360e5ca465e2609114";
          sha256 = "sha256-f7c9Gc7GN4xvz7W/Mu5Fq/XjKQ1nou7w8DIZUPv3Zds=";
        };

        nativeCheckInputs = with pkgs; [
          bash
          go
        ];

        vendorHash = "sha256-oV3UcbOC4y8xWnA5qZGEK/TRdQ4zCeZshgBAs2l+vSY=";

        ldflags = [
          "-s"
          "-w"
          "-X=main.Version=${version}"
        ];

        meta = with pkgs.lib; {
          description = "Terminal based presentation tool";
          homepage = "https://github.com/maaslalani/slides";
          changelog = "https://github.com/maaslalani/slides/releases/tag/v${version}";
          license = licenses.mit;
          maintainers = with maintainers; [maaslalani penguwin];
        };
      };
      initial_slides = ./initial_brown_bag.md;
      initial = (
        pkgs.writers.writeBashBin "initial"
        {
          makeWrapperArgs = [
            "--prefix"
            "PATH"
            ":"
            (pkgs.lib.makeBinPath [
              pkgs.graph-easy
            ])
          ];
        }
        ''
          ${slides}/bin/slides ${initial_slides}
        ''
      );
    in {
      packages = {
        initial = initial;
      };
      devShells = {
        default = pkgs.mkShell {
          packages = [
            slides
            pkgs.presenterm
            pkgs.reveal-md
            pkgs.graph-easy
            initial
          ];
        };
      };
      # ...
    });
}
