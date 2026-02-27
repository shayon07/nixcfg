{ pkgs }:
with pkgs;
[
  nodePackages.bash-language-server
  dockerfile-language-server
  nil # Nix LSP
  # rustc
  # cargo # For Mason Rust-based installs
  jdt-language-server
  omnisharp-roslyn
  clang-tools
  (python3.withPackages (
    ps: with ps; [
      python-lsp-server
      flake8
      black
      opencv4Full
      requests
    ]
  ))
  nixfmt
]
