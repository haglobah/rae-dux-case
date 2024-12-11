# Beat's rae-dux case

This is the case I'm using for my [rae-dux](https://github.com/haglobah/zmk-config-tzcl) keyboard whenever I take it with me.

The case is described via code using [libfive](https://libfive.com).

You can look at it by 

0. Installing Nix:
```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```
1. Entering the development shell (from inside the repo)
```shell
nix develop
```

2. Opening the file inside of [`libfive-studio`](https://libfive.com/studio/):
```shell
edit rae_dux-case.io
```

This opens a GUI-Editor in which you can edit your file and view the results in real-time.

And when you're happy, you can generate a `.stl`-file for 3D printing from it (from the GUI).
