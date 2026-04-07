# nix-config

Personal multi-platform nix setup.

## Hosts

| Host | System | Description |
|------|--------|-------------|
| `shia` | NixOS x86_64 | ThinkPad T470s |
| `ln` | darwin aarch64 | MacBook Pro M5 |

## Usage

```bash
# nixos
nixos-rebuild switch --flake .#shia

# darwin (init)
nix run nix-darwin -- switch --flake .#ln

# darwin (subsequent)
darwin-rebuild switch --flake .#ln
```
