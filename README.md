---
theme: gaia
transition: swipe
paginate: true
style: |
  section {
    font-size: 20px;
  }
  /* ⬇️ Mark the image of "1" in every pages as morphable image named as "one" ⬇️ */
  img[alt="1"] {
    view-transition-name: one;
    contain: layout; /* required */
  }

  img[alt="2"] {
    view-transition-name: two;
    contain: layout; /* required */
  }

  img[alt="3"] {
    view-transition-name: three;
    contain: layout; /* required */
  }
  img[alt="4"] {
    view-transition-name: four;
    contain: layout; /* required */
  }
  img[alt="5"] {
    view-transition-name: five;
    contain: layout; /* required */
  }

  img[alt="6"] {
    view-transition-name: six;
    contain: layout; /* required */
  }


  /* Generic image styling for number icons */
  img:is([alt="1"], [alt="2"], [alt="3"], [alt="4"], [alt="5"], [alt="6"]) {
    height: 64px;
    position: relative;
    top: -0.1em;
    vertical-align: middle;
    width: 64px;
  }
---

# So, Someone is Annoying You About Nix

---

# What am I going to cover?

- Nix tutorials suck
- Don't need the language first
- Trust your gut
- Don't python package by tomorrow
- Understand stuff first

---

<!-- transition: fade -->

# That's a little vague...

Maybe a check list would be cool...

---

# Agenda

- ![1](https://icongr.am/material/numeric-1-circle-outline.svg?size=20&color=ff9900) What Is Nix
- ![2](https://icongr.am/material/numeric-2-circle-outline.svg?size=20&color=ff9900) Installing Nix
- ![3](https://icongr.am/material/numeric-3-circle-outline.svg?size=20&color=ff9900) Super Basics of Using Nix
- ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=ff9900) What is Nix, Really?
- ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=ff9900) Flakes!
- ![6](https://icongr.am/material/numeric-6-circle-outline.svg?size=20&color=ff9900) Basics of NixLang

---

<!-- transition: swipe -->

# ![1](https://icongr.am/material/numeric-1-circle-outline.svg?color=34b233) What is Nix

## Nix is Many Things!

- Nix is...

---

# ![1](https://icongr.am/material/numeric-1-circle-outline.svg?color=34b233) What is Nix

### Language

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

# ![1](https://icongr.am/material/numeric-1-circle-outline.svg?color=34b233) What is Nix

### Package Manager

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

# ![1](https://icongr.am/material/numeric-1-circle-outline.svg?color=34b233) What is Nix

### Linux Distribution/Configuration of Same

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

# ![1](https://icongr.am/material/numeric-1-circle-outline.svg?color=34b233) What is Nix

### Dev Environments

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

# ![1](https://icongr.am/material/numeric-1-circle-outline.svg?color=34b233) What is Nix

### A ReadOnly File Store!

NO TOUCHY!

```
./
../
xrx4fpia9wp7mmfvriipi7j8qm85g4cm-helix-config.drv
xs2xmgd92ysv507645dik7fsfnhncpy2-unpack-zoneinfo_compiled-0.5.1.drv
xs5h45l67xc0v5n0hczch7d469nybzir-diff-so-fancy-1.4.4-fish-completions.drv
xs7g37asnv7r8rf89fn4a74syalqqsnk-clang-at-least-16-LLVMgold-path.patch.drv
xs9pkzjskplffcqh29h84fj09di173r0-tzdata-2024a.drv
xsa606vnc5ihnmbr08vdkz2sbd1g2xyh-source.drv
xsbsn3zdfhs29xw88q80yz9mp30ddsyl-tasty-1.4.3.tar.gz.drv
xsdpa50q8ikbqb5w9gwyadcr34wp6qs9-trove-classifiers-2023.8.7.tar.gz.drv
xsfg8jmzgkv2ijzw4saq1a7iaz6azxwy-serf-1.3.10.tar.bz2.drv
xsgbr42mw81sjkkqpxgvd7q985gg6cj6-apple-framework-QuartzCore-11.0.0.drv
xshfgc94k1f3i89wj51jjd2vr0lpbi1y-source.drv
xsiavfa0ybspkqmglm2xsyck4myipn61-CVE-2023-40305.part-2.patch.drv
xsis73vfcg4fswpjz59fmd8697xr2nh0-time-0.1.45.drv
xsm8zpiqgbfi2hip02ivq48da8kibldf-async-lock-3.3.0.drv
xsmg2h1ymqkhjhkxqvm6ly7qp5mpwmvm-setuptools-check-hook.drv
xsms9ajzmb4cfb9r4w2la195mag2s61w-clang-at-least-16-LLVMgold-path.patch.drv
xsnl56ldc390v1mr6lkvk5cd847dycbw-llvm-16.0.6.drv
xswcarhkw8pagcallh59y4dqkp214da4-jmespath-1.0.1.tar.gz.drv
xsxjcih2r3n1zgkmhkskddcscya6zcq8-go1.22.2.src.tar.gz.drv
xv2xnvf95d63h39z5ma9rc4761w6rwgn-apple-framework-SystemConfiguration-11.0.0.drv
xv3kymsqffw3gmxmsjmi5jfs182x8ivq-jsonschema_specifications-2023.7.1.tar.gz.drv
xv6dva0i78i0hygwib45g263nmdahlm5-python3.11-virtualenv-20.25.1.drv
```

---

<!-- transition: fade -->

# ![1](https://icongr.am/material/numeric-1-circle-outline.svg?color=34b233) What is Nix

### A basic diagram

In case it made sense

```
    uses
┌────────────────────────────────────────────────┐
│                                                ∨
│  ┌─────────────────────────────────┐         ┌──────────────────┐                  ┌─────────────────────────────┐             ┌─────────────┐
│  │           Nix Darwin            │         │     Nixpkgs      │                  │                             │             │             │
│  │ configuration of Macos with nix │  uses   │     monorepo     │  is written in   │           NixLang           │  produces   │ Derivations │
│  │                                 │ ──────> │ helper functions │ ───────────────> │                             │ ──────────> │             │
│  └─────────────────────────────────┘         └──────────────────┘                  └─────────────────────────────┘             └─────────────┘
│                                                ∧                  uses
│                                                └─────────────────────────────────────┐
│                                                                                      │
│                                              ┌──────────────────┐                  ┌─────────────────────────────┐
│                                              │      NixOs       │  can configure   │        Home manager         │
└───────────────────────────────────────────── │                  │ ───────────────> │ Nix config of user programs │
                                               └──────────────────┘                  └─────────────────────────────┘
```

---

# Agenda

- ![1](https://icongr.am/material/numeric-1-circle.svg?size=20&color=34b233) What Is Nix
- ![2](https://icongr.am/material/numeric-2-circle-outline.svg?size=20&color=ff9900) Installing Nix
- ![3](https://icongr.am/material/numeric-3-circle-outline.svg?size=20&color=ff9900) Super Basics of Using Nix
- ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=ff9900) What is Nix, Really?
- ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=ff9900) Flakes!
- ![6](https://icongr.am/material/numeric-6-circle-outline.svg?size=20&color=ff9900) Basics of NixLang

* First Check Mark! Woo!
* Woah! That's too many things!
* Yup! Don't worry about any specifics right now
* We're gonna start simple and fundamental.

---

<!-- transition: swipe -->

# ![2](https://icongr.am/material/numeric-2-circle-outline.svg?size=20&color=34b233) Installing Nix

### Install locally

Head to [Deteminate Systems](https://github.com/DeterminateSystems/nix-installer)

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

- But what's that curl-shell doing??

### Use Cargo

```bash
cargo install nix-installer
```

---

# ![2](https://icongr.am/material/numeric-2-circle-outline.svg?size=20&color=34b233) Installing Nix

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

### It Installs

- Nix Daemon: Performs operations on the Nix Store for you.

- Nix Store: A ReadOnly file system that stores what Nix builds

- Nix Command: A set of command line applications that let run nix code and interact with the Nix Store

---

# ![2](https://icongr.am/material/numeric-2-circle-outline.svg?size=20&color=34b233) Installing Nix

<!-- transition: fade -->

### Now you have Nix!

## Veryify your install

run

```sh
$ nix shell nixpkgs#hello
$ hello
-> Hello, world!
```

You may have to start a new shell

---

# Agenda

- ![1](https://icongr.am/material/numeric-1-circle.svg?size=20&color=34b233) What Is Nix
- ![2](https://icongr.am/material/numeric-2-circle.svg?size=20&color=34b233) Installing Nix
- ![3](https://icongr.am/material/numeric-3-circle-outline.svg?size=20&color=ff9900) Super Basics of Using Nix
- ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=ff9900) What is Nix, Really?
- ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=ff9900) Flakes!
- ![6](https://icongr.am/material/numeric-6-circle-outline.svg?size=20&color=ff9900) Basics of NixLang

Ok! Now you're in! What now?

---

<!-- transition: swipe -->

# ![3](https://icongr.am/material/numeric-3-circle-outline.svg?size=20&color=34b233) Super Basics of Using Nix

## Let's build this slide show!

Run:

```sh
nix run github:zdcthomas/nix-brown-bag#initial
```

---

# ![3](https://icongr.am/material/numeric-3-circle-outline.svg?size=20&color=34b233) Super Basics of Using Nix

## Woah, That Was Easy!

- I know!

- That's the point!

---

# ![3](https://icongr.am/material/numeric-3-circle-outline.svg?size=20&color=34b233) Super Basics of Using Nix

## But wait! There's more!

You can also use this repo's developer environment:

```sh
nix develop github:zdcthomas/nix-brown-bag
```

> [ Note ]
>
> The URL is the same, except for the package name at the end

---

<!-- transition: fade -->

# ![3](https://icongr.am/material/numeric-3-circle-outline.svg?size=20&color=34b233) Super Basics of Using Nix

## How?

Just enter into a project that uses Nix and run `nix develop` if you want to use
the developer shell they set up.

Or

Use `nix shell nixpkgs#<your package here>` to temporarily install a package!

---

# Agenda

- ![1](https://icongr.am/material/numeric-1-circle.svg?size=20&color=34b233) What Is Nix
- ![2](https://icongr.am/material/numeric-2-circle.svg?size=20&color=34b233) Installing Nix
- ![3](https://icongr.am/material/numeric-3-circle.svg?size=20&color=34b233) Super Basics of Using Nix
- ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=ff9900) What is Nix, Really?
- ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=ff9900) Flakes!
- ![6](https://icongr.am/material/numeric-6-circle-outline.svg?size=20&color=ff9900) Basics of NixLang

Another easy check! We're cruisin!

# Yay!

Practically you can now make good use of Nix that other people wrote!

---

<!-- transition: swipe -->

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

## But what did I actually do?

Good question!

High level, you ran a `package` defined in the `flake` in this repo.

Let's build up to that answer though.

---

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

## The Point of Nix

Nix aims to let us build the same software every time given the same inputs.

- What do we mean by same?

---

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

## Package == Package?

Nix assumes that two packages are the same if they have the same:

- build steps
- known build system
- dependencies
- "sealed" build environments

---

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

## Derivation

Nix calls this combination of things a `derivation`

- Special NixLang primitive
- defines a blueprint for an actual artifact to be built

---

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

### What is a derivation?

Open up the `nix repl`

```sh
nix repl nixpkgs
```

At their most basic, derivations look like

```sh

nix-repl> derivation {
    system = builtins.currentSystem;
    builder = "${legacyPackages.${builtins.currentSystem}.bash}/bin/bash";
    args = ["-c" "declare -xp;echo 'hello world!' > $out"];
    name = "test_package";
}
```

There's a lot to unpack here...

---

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

### What is a derivation?

```nix
derivation {
    system = builtins.currentSystem;
    builder = "${legacyPackages.${builtins.currentSystem}.bash}/bin/bash";
    args = ["-c" "declare -xp;echo 'hello world!' > $out"];
    name = "test_package";
}

```

The `system` that a derivation gets built on in one of the things that defines a
derivation

```nix
    system = builtins.currentSystem;
```

---

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

### What is a derivation?

```nix
derivation {
    system = builtins.currentSystem;
    builder = "${legacyPackages.${builtins.currentSystem}.bash}/bin/bash";
    args = ["-c" "declare -xp;echo 'hello world!' > $out"];
    name = "test_package";
}

```

The `builder` is the base program used to build the program

```nix
    builder = "${legacyPackages.${builtins.currentSystem}.bash}/bin/bash";
```

This:

`${legacyPackages.${builtins.currentSystem}.bash}/bin/bash`

evaluates to a Nix Store Path:

`/nix/store/60qp4q78hlg1fsvq4np6iv0gpqrl4v4p-bash-5.2p26/bin/bash`

---

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

### What is a derivation?

```nix
derivation {
    system = builtins.currentSystem;
    builder = "${legacyPackages.${builtins.currentSystem}.bash}/bin/bash";
    args = ["-c" "declare -xp;echo 'hello world!' > $out"];
    name = "test_package";
}

```

`args` are passed to the builder

```nix
    args = ["-c" "declare -xp;echo 'hello world!' > $out"];
```

But wait!! What's that `$out`?

---

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

### What is a derivation?

```nix
derivation {
    system = builtins.currentSystem;
    builder = "${legacyPackages.${builtins.currentSystem}.bash}/bin/bash";
    args = ["-c" "declare -xp;echo 'hello world!' > $out"];
    name = "test_package";
}

```

`$out` is a environment variable passed to the builder that points at the output
path designated for this derivation in the Nix Store

---

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

### Building a derivation

Now we can actually build the derivation

```nix

nix-repl> d = derivation {
    system = builtins.currentSystem;
    builder = "${legacyPackages.${builtins.currentSystem}.bash}/bin/bash";
    args = ["-c" "declare -xp;echo 'hello world!' > $out"];
    name = "test_package";
}

nix-repl> :b d

This derivation produced the following outputs:
  out -> /nix/store/0z7i1bkp6p4zy29x82khkgbwch9wfgzi-test_derv
```

---

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

### Building a derivation

We can see all Env Vars passed to the builder, including `$out`!

```
nix-repl> :log d
declare -x HOME="/homeless-shelter"
declare -x NIX_BUILD_CORES="0"
declare -x NIX_BUILD_TOP="/private/tmp/nix-build-test_derv.drv-0"
declare -x NIX_LOG_FD="2"
declare -x NIX_STORE="/nix/store"
declare -x OLDPWD
declare -x PATH="/path-not-set"
declare -x PWD="/private/tmp/nix-build-test_derv.drv-0"
declare -x SHLVL="1"
declare -x TEMP="/private/tmp/nix-build-test_derv.drv-0"
declare -x TEMPDIR="/private/tmp/nix-build-test_derv.drv-0"
declare -x TERM="xterm-256color"
declare -x TMP="/private/tmp/nix-build-test_derv.drv-0"
declare -x TMPDIR="/private/tmp/nix-build-test_derv.drv-0"
declare -x builder="/nix/store/60qp4q78hlg1fsvq4np6iv0gpqrl4v4p-bash-5.2p26/bin/bash"
declare -x name="test_derv"
declare -x out="/nix/store/0z7i1bkp6p4zy29x82khkgbwch9wfgzi-test_derv"
declare -x system="aarch64-darwin"
```

---

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

### Building a derivation

And then the output in the Nix Store looks like this

```
nix-repl> builtins.readFile d
"hello world!\n"
```

---

<!-- transition: fade -->

# ![4](https://icongr.am/material/numeric-4-circle-outline.svg?size=20&color=34b233) What is Nix, Really?

### What is a derivation?

In the Nix Store, a derivation path looks like:

```
0z7i1bkp6p4zy29x82khkgbwch9wfgzi-test_derv
▲                              ▲ ▲       ▲
└───────────────┬──────────────┘ └───┬───┘
                │                    │
           NAR Hash              PACKAGE NAME

```

- `Nar hash`: A special type of hash of the derivations input
- `Package name`: human readable name

---

# Agenda

- ![1](https://icongr.am/material/numeric-1-circle.svg?size=20&color=34b233) What Is Nix
- ![2](https://icongr.am/material/numeric-2-circle.svg?size=20&color=34b233) Installing Nix
- ![3](https://icongr.am/material/numeric-3-circle.svg?size=20&color=34b233) Super Basics of Using Nix
- ![4](https://icongr.am/material/numeric-4-circle.svg?size=20&color=34b233) What is Nix, Really?
- ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=ff9900) Flakes!
- ![6](https://icongr.am/material/numeric-6-circle-outline.svg?size=20&color=ff9900) Basics of NixLang

## Ok, again, way too much info

Yeah... sorry.

---

## Ok, again, way too much

But now you have a firm basis so that actually using Nix doesn't feel like weird
magic.

All the other Nix use-cases are programs that take outputs from derivations and
symlinks them to somewhere else your system can use them

- put nix store packages into your PATH
- link them as configuration files
- create `systemd` specifications
- push a derivation or package to a cache

---

# Let's get practical

Since derivations are so flexible, there's a truly wild number of ways nix is
used.

# Agenda

- ![1](https://icongr.am/material/numeric-1-circle.svg?size=20&color=34b233) What Is Nix
- ![2](https://icongr.am/material/numeric-2-circle.svg?size=20&color=34b233) Installing Nix
- ![3](https://icongr.am/material/numeric-3-circle.svg?size=20&color=34b233) Super Basics of Using Nix
- ![4](https://icongr.am/material/numeric-4-circle.svg?size=20&color=34b233) What is Nix, Really?
- ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=ff9900) Flakes!
- ![6](https://icongr.am/material/numeric-6-circle-outline.svg?size=20&color=ff9900) Basics of NixLang

---

# ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=34b233) Flakes!

Since derivations are so flexible, there's a truly wild number of ways nix is
used.

## <!-- transition: swipe -->

# ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=34b233) Flakes!

## Flakes!

Flakes are big functions with defined inputs and outputs.

### Inputs

Can be

- Other Flakes
- Local Files/Directories
- Repos
- Artifacts from the internet

---

# ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=34b233) Flakes!

## Flakes!

Flakes are big functions with defined inputs and outputs.

### Outputs

Can Be

- Packages
- Apps
- Ways to configure nixos machines
- Developer shells
- Flake templates
- Checks for Ci/Tests

---

# ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=34b233) Flakes!

## Flakes!

### Basic Example

```nix
{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    devShells.x86_64-linux.default = self.packages.x86_64-linux.mkShell {
        packages = [
            self.packages.x86_64-linux.hello
        ];
    };
  };
}
```

---

# ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=34b233) Flakes!

## Flakes!

There's a few commands to interact with the output of Flakes:

- `nix build`: build a derivation or fetch a store path
- `nix develop`: run a bash shell that provides the build environment of a derivation
- `nix flake`: manage Nix flakes
- `nix profile`: manage Nix profiles
- `nix run`: run a Nix application
- `nix search`: search for packages
- `nix shell`: run a shell in which the specified packages are available

---

# ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=34b233) Flakes!

## Flakes!

Flakes are also used for system configuration

```nix
darwinConfigurations = let
    workHostName = "Zacharys-MacBook-Pro";
in {

    "${workHostName}" = let
    username = "zdcthomas";
    in
    darwin.lib.darwinSystem rec {
        system = "aarch64-darwin";
        specialArgs = {
        inherit system username overlays inputs workHostName;
        };
        modules = [
        {nixpkgs.overlays = overlays;}
        home-manager.darwinModule
        ./nix/hosts/work/dar_conf.nix
        ];
    };
};
```

---

# ![5](https://icongr.am/material/numeric-5-circle-outline.svg?size=20&color=34b233) Flakes!

## Flakes!

You can install/configure programs _and_ system settings

```nix
defaults = {
    NSGlobalDomain = {
        AppleShowAllFiles = true;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        AppleKeyboardUIMode = 3;
    };
};
```

---

# Agenda

# Agenda

- ![1](https://icongr.am/material/numeric-1-circle.svg?size=20&color=34b233) What Is Nix
- ![2](https://icongr.am/material/numeric-2-circle.svg?size=20&color=34b233) Installing Nix
- ![3](https://icongr.am/material/numeric-3-circle.svg?size=20&color=34b233) Super Basics of Using Nix
- ![4](https://icongr.am/material/numeric-4-circle.svg?size=20&color=34b233) What is Nix, Really?
- ![5](https://icongr.am/material/numeric-5-circle.svg?size=20&color=34b233) Flakes!
- ![6](https://icongr.am/material/numeric-6-circle-outline.svg?size=20&color=ff9900) Basics of NixLang

---

# ![6](https://icongr.am/material/numeric-6-circle-outline.svg?size=20&color=34b233) Basics of NixLang

## Attributes!

Nix is all about building Attribute Sets

```nix
{
    foo = "foo";
    bar = 1;
    baz = [1 2 3];
};
```

and passing them to derivations.

---

# ![6](https://icongr.am/material/numeric-6-circle-outline.svg?size=20&color=34b233) Basics of NixLang

# Packaging

Nix has _many_ wrappers around `derivation`.

## MkDerivation

The most common wrapper;
[mkderivation](https://blog.ielliott.io/nix-docs/mkDerivation.html) introduces
the concept of `phases` to the build, that let you specify actions to take at
specific times in the creation of the derivation

```nix
stdenv.mkDerivation {
  name = "example-website-content";

  src = fetchFromGitHub {
    owner = "jekyll";
    repo = "example";
    rev = "5eb1b902ca3bda6f4b50d4cfcdc7bc0097bac4b7";
    sha256 = "1jw35hmgx2gsaj2ad5f9d9ks4yh601wsxwnb17pmb9j02hl3vgdm";
  };

  installPhase = ''
    export JEKYLL_ENV=production
    ${pkgs.jekyll}/bin/jekyll build --destination $out
  '';
  # ^ Phase here
}
```

---

# ![6](https://icongr.am/material/numeric-6-circle-outline.svg?size=20&color=34b233) Basics of NixLang

# Convenience helpers

## Writers

```nix
(
    writers.writeBashBin "dev_env"
    ''
    set -e

    AWS_PROFILE="kevel-studio-dev"
    export _EXTRA_PROMPT_STUFF="[DEV ENV]"

    ${aws} sso login --profile $AWS_PROFILE
    AWS_PROFILE=$AWS_PROFILE ${dev_env} --advertiser-api-db ${postgres_url}
    ''
)
```

- Easy to use

- take text (and maybe dependencies)

- output runnable packages/data

---

# ![6](https://icongr.am/material/numeric-6-circle-outline.svg?size=20&color=34b233) Basics of NixLang

# Convenience helpers

## Language builders

The program that runs this slideshow is called `slides`.

It already exists in nixpkgs, but here we've built it from source for fun and
learning

It uses a helper called `buildGoModule`
(just mkDerivation with some go specific defaults)

---

<!-- transition: fade -->

# ![6](https://icongr.am/material/numeric-6-circle-outline.svg?size=20&color=34b233) Basics of NixLang

```nix
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
```

---

# Agenda

- ![1](https://icongr.am/material/numeric-1-circle.svg?size=20&color=34b233) What Is Nix
- ![2](https://icongr.am/material/numeric-2-circle.svg?size=20&color=34b233) Installing Nix
- ![3](https://icongr.am/material/numeric-3-circle.svg?size=20&color=34b233) Super Basics of Using Nix
- ![4](https://icongr.am/material/numeric-4-circle.svg?size=20&color=34b233) What is Nix, Really?
- ![5](https://icongr.am/material/numeric-5-circle.svg?size=20&color=34b233) Flakes!
- ![6](https://icongr.am/material/numeric-6-circle.svg?size=20&color=34b233) Basics of NixLang

---

# The End!

## Good resources

- [nix pills](https://nixos.org/guides/nix-pills/)
- [zero to nix](https://zero-to-nix.com/)
- [nix wiki](https://nixos.wiki/wiki/Main_Page)

## What would be helpful to do next?
