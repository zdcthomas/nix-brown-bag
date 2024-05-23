# So, Someone is Annoying You About Nix

Welcome!

---

## Nix is Confusing!

"Nix" can mean a lot of things!

---

# Language

Hey kid, you wanna write Haskell _and_ JSON?

```nix
{ lib
, buildNpmPackage
, fetchFromGitHub
}:

buildNpmPackage rec {
  pname = "reveal-md";
  version = "5.5.1";

  src = fetchFromGitHub {
    owner = "webpro";
    repo = "reveal-md";
    rev = version;
    hash = "sha256-BlUZsETMdOmnz+OFGQhQ9aLHxIIAZ12X1ipy3u59zxo=";
  };

  npmDepsHash = "sha256-xaDBB16egGi8zThHRrhcN8TVf6Nqkx8fkbxWqvJwJb4=";

  env = {
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD = true;
  };

  dontNpmBuild = true;

  doCheck = true;

  checkPhase = ''
    runHook preCheck

    npm run test

    runHook postCheck
  '';
}
```

---

# Package Manager

Install exact packages

```nix
packages = with pkgs; [
    btop
    fd
    jq
    ijq
    pandoc
    sd
    silver-searcher
    skim
    tree
    unzip
    wget
    zip
];
```

---

# Operating System

Control all of your machine with nix!

```nix
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez5-experimental;
    powerOnBoot = true;
    disabledPlugins = ["sap"];
    settings = {
      General = {
        JustWorksRepairing = "always";
        MultiProfile = "multiple";
      };
    };
  };
```

---

# Dev Environments

Share your setup with the boys

```nix
pkgs.mkShell {
  packages = [ pkgs.gnumake ];

  inputsFrom = [ pkgs.hello pkgs.gnutar ];

  shellHook = ''
    export DEBUG=1
  '';
```

---

# A ReadOnly File Store!

```
./
../
  xrx4fpia9wp7mmfvriipi7j8qm85g4cm-helix-config.drv
  xs2xmgd92ysv507645dik7fsfnhncpy2-unpack-zoneinfo_compiled-0.5.1.drv
  xs5h45l67xc0v5n0hczch7d469nybzir-diff-so-fancy-1.4.4-fish-completions.drv
  xs7g37asnv7r8rf89fn4a74syalqqsnk-clang-at-least-16-LLVMgold-path.patch.drv
  xs9pkzjskplffcqh29h84fj09di173r0-tzdata-2024a.drv
  xsa606vnc5ihnmbr08vdkz2sbd1g2xyh-source.drv
  xsbsn3zdfhs29xw88q80yz9mp30ddsyl-tasty-1.4.3.tar.gz.drv
  xscdcn4zykv8cjwmawd5xgpwglw8snzw-add-optional-11-lcdfilter-none-configuration.patch.drv
  xscxg4hjg2w74wiaq96yc25b4jplab6y-hashbrown-0.12.3.tar.gz
  xsdpa50q8ikbqb5w9gwyadcr34wp6qs9-trove-classifiers-2023.8.7.tar.gz.drv
  xsfg8jmzgkv2ijzw4saq1a7iaz6azxwy-serf-1.3.10.tar.bz2.drv
  xsgbr42mw81sjkkqpxgvd7q985gg6cj6-apple-framework-QuartzCore-11.0.0.drv
  xshfgc94k1f3i89wj51jjd2vr0lpbi1y-source.drv
  xsiavfa0ybspkqmglm2xsyck4myipn61-CVE-2023-40305.part-2.patch.drv
  xsis73vfcg4fswpjz59fmd8697xr2nh0-time-0.1.45.drv
  xsm8zpiqgbfi2hip02ivq48da8kibldf-async-lock-3.3.0.drv
  xsmg2h1ymqkhjhkxqvm6ly7qp5mpwmvm-setuptools-check-hook.drv
  xsms9ajzmb4cfb9r4w2la195mag2s61w-clang-at-least-16-LLVMgold-path.patch.drv
  xsnl56ldc390v1mr6lkvk5cd847dycbw-llvm-16.0.6.drv
  xsp2c87zs5x3a7x5xnsqg07yq267inlj-File-ShareDir-1.118.tar.gz.drv
  xsv0xd2y1frqz7nf0xps63f4q88988cy-FCGI-ProcManager-0.28.tar.gz.drv
  xswcarhkw8pagcallh59y4dqkp214da4-jmespath-1.0.1.tar.gz.drv
  xsxjcih2r3n1zgkmhkskddcscya6zcq8-go1.22.2.src.tar.gz.drv
  xv2xnvf95d63h39z5ma9rc4761w6rwgn-apple-framework-SystemConfiguration-11.0.0.drv
  xv3kymsqffw3gmxmsjmi5jfs182x8ivq-jsonschema_specifications-2023.7.1.tar.gz.drv
  xv6dva0i78i0hygwib45g263nmdahlm5-python3.11-virtualenv-20.25.1.drv
```

---

# A basic diagram

```
~~~graph-easy --as=boxart
[NixOs] - uses -> [ Nixpkgs ] {label: "Nixpkgs\nmonorepo\nhelper functions";}
[ HM ] {label: Home manager\nNix config of user programs} - uses -> [ Nixpkgs ]
[ NixDarwin ] {label: Nix Darwin\nconfiguration of Macos with nix} - uses -> [ Nixpkgs ]
[NixOs] - can configure -> [ HM ]
[ Nixpkgs ] - is written in -> [ NixLang ]
[NixLang] - produces -> [ Derivations]
~~~
```

---

# WOAH

That's too many things!

---

# Yup!

Don't worry about all that right now

---

# Yup!

Don't worry about all that right now

We're gonna start simple and fundamental.

---

# Yup!

Don't worry about all that right now

We're gonna start simple and fundamental.

We're gonna be practical

---

# Installation

Head to [Deteminate Systems](https://github.com/DeterminateSystems/nix-installer)

## Install locally

Either

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

or

```bash
cargo install nix-installer
```

---

# Getting started


