# SW-DLT Cherri

[SW-DLT](https://github.com/net00-1/SW-DLT) ("Shortcuts Wrapper for -DL Tools") rewritten in [Cherri](https://github.com/electrikmilk/cherri), a compiled DSL that targets Apple Shortcuts.

The original SW-DLT shortcut is distributed as a `.shortcut` plist file. This project decompiles it to Cherri source code, refactors the inline base64 icon assets into separate PNG files using Cherri's `embedFile()`, and recompiles it back to a `.shortcut`.

## Project Structure

```
SW-DLT.cherri       # Main source file
assets/              # Icon PNGs (embedded at compile time via embedFile())
  aIcon.png          # Audio download icon
  gIcon.png          # Gallery download icon
  hIcon.png          # Help/about icon
  pIcon.png          # Playlist download icon
  sLogo.png          # SW-DLT logo
  vIcon.png          # Video download icon
```

## Prerequisites

- [Go](https://go.dev/) 1.21+
- macOS (for signing; compilation works cross-platform with `--skip-sign`)

## Build

```bash
# Clone this repo
git clone https://github.com/elmehalawi/sw-dlt-cherri.git
cd sw-dlt-cherri

# Install Cherri
git clone https://github.com/electrikmilk/cherri.git /tmp/cherri
cd /tmp/cherri && go build -o cherri . && cd -

# Compile the shortcut (unsigned, works on any OS)
/tmp/cherri/cherri SW-DLT.cherri --skip-sign

# Compile with signing (macOS only, produces importable .shortcut)
/tmp/cherri/cherri SW-DLT.cherri
```

The compiled shortcut will be written to `SW-DLT.shortcut` (signed) or `SW-DLT_unsigned.shortcut` (unsigned).

## Debug Build

```bash
/tmp/cherri/cherri SW-DLT.cherri --debug --skip-sign
```

This produces:
- `SW-DLT.plist` - the raw plist XML for inspection
- `SW-DLT_processed.cherri` - the source after preprocessing

## Credits

- **SW-DLT** by [net00](https://github.com/net00-1/SW-DLT) - the original Apple Shortcut
- **Cherri** by [electrikmilk](https://github.com/electrikmilk/cherri) - the compiler

## License

The original SW-DLT shortcut is licensed under GPL-3.0. See the [original repo](https://github.com/net00-1/SW-DLT) for details.
