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
1. `flatpak-builder --user --force-clean --install coq-build org.flatpak.CoqProver.json`

## Initializing the Flatpak

Build it first (see the section above). Then, before you do anything else, do:

```bash
$ flatpak run org.flatpak.CoqProver
```

This copies the app binaries and libraries over to a location under your home directory included in the PATH so you can invoke `coqc` and `coq_makefile` as usual.

## Testing the Flatpak

Initialize it first (see the section above). Then try invoking `coqc` and `coq_makefile` as usual. If all is well, they should work as expected.

Make sure to remove the changes introduced by `org.flatpak.CoqProver` in your bashrc, re-build and re-initialize after making any changes to the manifest file (or `run.sh`) before testing the Flatpak.

## Known Issues

- 18/01/2021: While the Flatpak bundle "works", it does so in a manner that negates all sandboxing benefits provided by Flatpak, introduces a security risk by prepending to the user's PATH variable and possibly overriding various binaries previously owned by the user. It also fails to clean up after itself upon uninstallation, leaving the bashrc permanently modified and its binaries permanently installed.

## License

Haven't figured this out yet, but feel free to clone this repo and try to build the Flatpak yourself from the given files.

If you want to work on this with me, feel free to open an issue ticket in the issue tracker requesting to be a collaborator and I will give you edit rights to this repository.

A proper license will be added once this project is in usable shape and the Coq development team has been consulted w.r.t. legal matters.
