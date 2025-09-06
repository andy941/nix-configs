# AGENTS.md

This repository uses NixOS flakes for configuration and package management. Follow these guidelines for agentic coding and automation:

## Build, Lint, and Test Commands
- Build system config: `sudo nixos-rebuild switch --flake .#<hostname>`
- Build all flake outputs: `nix build .`
- Build a specific package: `nix build .#<attr>`
- Enter dev shell: `nix develop`
- Check flake outputs and run tests: `nix flake check`
- Update flake inputs: `nix flake update`
- For Home Manager configs: `home-manager switch --flake .#<username>`

## Code Style Guidelines
- Nix files use 2-space indentation.
- Use `{ pkgs, lib, ... }: { ... }` for module headers.
- Prefer imports via `imports = [ ... ];` at the top of modules.
- Attribute names: kebab-case for files, camelCase for options.
- Avoid secrets in flake files (world-readable).
- Error handling: use `assert` and `lib.warn` for config validation.
- Prefer explicit types in option definitions.
- Use builtins and lib functions for purity and reproducibility.
- Format Nix code with `nixpkgs-fmt`, `alejandra`, or `nixfmt` if available.
- Keep modules one level deep for imports.
- Use overlays for custom packages.
- No Cursor or Copilot rules found in this repo.
