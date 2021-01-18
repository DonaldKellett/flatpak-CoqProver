_This repo is looking for a new maintainer, please scroll down to "Contributing" if interested._

# flatpak-CoqProver

Manifest and associated files for building a working Coq environment for Flatpak (dormant, looking for a new maintainer)

## Installing and using the Flatpak

**Please scroll down to section "Known Issues" and understand the security implications before following the installation instructions!**

1. [Set up Flatpak for your distro](https://flatpak.org/setup/), even if it is already pre-installed on your system
1. Download the Flatpak bundle: `coq-8.13.0-2.flatpak`
1. Open the bundle in Software Center and click Install, or run `flatpak install coq-8.13.0-2.flatpak` in a terminal
1. Run `flatpak run org.flatpak.CoqProver` in a terminal. This performs initial setup so `coqc` and `coq_makefile` can be invoked normally afterwards

Note that there is currently no CoqIDE nor external libraries included in the bundle so its use is currently limited.

If you do not intend to further develop the Flatpak, you may skip all subsequent sections (setting up, building, initializing, testing).

## Setting up your environment for building the Flatpak

This (and subsequent sections) is for those interested in further developing the Flatpak. Users may safely ignore these sections.

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

## Contributing

This project is currently archived as the original author is no longer interested in developing it, but if you would like to take this further and figure out whether Coq (with CoqIDE and external libraries) can be bundled with Flatpak in a sane manner, please drop me an email directly at donaldsebleung@gmail.com and I will happily transfer repo ownership to you.
