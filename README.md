
## Introduction
This repository contains an open-source Game Guardian menu for a game. The main functionality is organized into multiple files: `Patchers.lua` and other common-sense functionality files. The primary purpose of this README is to guide users on how to find offsets and provide basic examples for using some of the functions.

## Patchers.lua
The `Patchers.lua` file is where the main offset patches are defined.

### Offset Definitions
All offsets are stored in the `Patchers.lua` file. To find offsets, use the provided functions in the file, such as `findClassPointer` and `hackOffset`. The offsets are organized into categories like clan parts, energy, free lottery, and more.

**Example:**
```lua
-- Usage example: Find and hack the clan energy offset
findClassPointer("YourClass")
hackOffset(I[3], gg.TYPE_DWORD, "YourNewValue")
```

### Patcher Functions
1. **`Patch(offset, hex)`**: Patch the specified offset with the provided hex value.

**Example:**
```lua
Patch(I[42], "C0035FD6")
```

2. **`Restore(offset)`**: Restore the original value of the specified offset.

**Example:**
```lua
Restore(I[42])
```

3. **`Patch_switch(name, offset1, hex1, offset2, hex2, ...)`**: Toggle between patching and restoring multiple offsets based on a toggle name.

**Example:**
```lua
local toggleName = "OFF"
Patch_switch(toggleName, I[1], "C0035FD6", I[2], "00008052C0035FD6")
```

4. **`Switch(name, offsets, hex_values)`**: Toggle between patching and restoring multiple offsets based on a toggle name (alternative).

**Example:**
```lua
local toggleName = "OFF"
local patchOffsets = {I[1], I[2]}
local patchHexValues = {"C0035FD6", "00008052C0035FD6"}
Switch(toggleName, patchOffsets, patchHexValues)
```

### Examples of Common Offsets
Offsets for various features such as god mode, infinite ammo, and others are provided with explanations.

### Note
The rest of the files' functionality is considered common sense, and users can explore them for additional features and tweaks.

Feel free to improve this open-source Game menu!
