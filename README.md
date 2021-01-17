# flatpak-CoqProver

Manifest and associated files for building a working Coq environment for Flatpak (WIP)

## Setting up your environment for building the Flatpak

1. [Set up Flatpak for your distro](https://flatpak.org/setup/)
1. Install `flatpak-builder` from your distro's repositories
1. `flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`
1. `flatpak install --user flathub org.freedesktop.Sdk//20.08`
1. `flatpak install --user flathub org.freedesktop.Platform//20.08`

## Building the Flatpak

First set up your environment (see the section above). Then:

1. `cd` to the root of this repo
1. `flatpak-builder --user --force-clean --install coq-build org.flatpak.CoqProver.yml`

## Testing the Flatpak

Build it first (see the section above). Then do:

```bash
$ flatpak run org.flatpak.CoqProver <COMMAND> <ARGS...>
```

to run the specified `<COMMAND>` with the given command line `<ARGS...>` inside the application. For example:

```bash
$ flatpak run org.flatpak.CoqProver ocaml --version  # Checks the OCaml version inside the app
$ flatpak run org.flatpak.CoqProver ls /             # Lists all subdirectories under the root directory in the app environment
```

Make sure to re-build after making any changes to the manifest file (or `run.sh`) before testing the Flatpak.

## Known Issues

- 17/01/2021: For some reason, even when ZArith has been built and installed, the command `ocamlfind query zarith -format %v` reports that it is not installed (when running Coq's `configure` script) and the build fails as a result

## License

Haven't figured this out yet, but feel free to clone this repo and try to build the Flatpak yourself from the given files.

If you want to work on this with me, feel free to open an issue ticket in the issue tracker requesting to be a collaborator and I will give you edit rights to this repository.

A proper license will be added once this project is in usable shape and the Coq development team has been consulted w.r.t. legal matters.
