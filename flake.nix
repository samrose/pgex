{
  description = "pgex";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.pgex = nixpkgs.legacyPackages.x86_64-linux.postgresql;

    packages.x86_64-linux.default = self.packages.x86_64-linux.pgex;

  };
}
