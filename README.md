# zig-linux-scripts

#### To build single script:
```bash
$ cd source_folder
$ zig build test --summary all # if all Ok, go next step.
$ zig build --summary all --prefix-exe-dir /you/customs/bin/folder
```
> **Note:** Recomend you create a folder in ~/.local/ for you customs bins.

Add to Path.
```bash
# Add this line at your bash config file (.profile, .bashrc..etc).
export PATH="$PATH:/you/customs/bin/folder"
```

Reload conf
```bash
source .bashrc .profile # .. wherever you use as config file.
```

