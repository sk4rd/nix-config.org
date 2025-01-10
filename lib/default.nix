lib: {
  enableAll = builtins.mapAttrs (name: value: { enable = true; });
}
