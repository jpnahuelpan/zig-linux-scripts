# zig-linux-scripts

#### To build single script:
```bash
$ cd source_folder
$ zig build test --summary all # if all Ok, go next step.
$ zig build --summary all
```

The executable is generated in zig-out folder and need to move to .local folder.
```bash
$ mv zig-out/bin/my_exe ~/.local/zig-bin/
```

Add to Path.
```bash
# Add this line at your bash config file (.profile, .bashrc..etc).
export PATH="$PATH:$HOME/.local/zig-bin"
```

Reload conf
```bash
source .bashrc
```

