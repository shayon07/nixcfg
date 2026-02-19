{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nix4nvchad.homeManagerModule
  ];

  programs.nvchad.enable = true;

  # Optional — Neovim package override (if you want a newer version)
  programs.nvchad.neovim = pkgs.neovim;

  # Optional — add extra runtime packages for LSPs etc
  programs.nvchad.extraPackages = with pkgs; [
    nodePackages.bash-language-server
    dockerfile-language-server
    nil # Nix LSP
    rustc
    cargo # For Mason Rust-based installs
    clang-tools
    (python3.withPackages (
      ps: with ps; [
        python-lsp-server
        flake8
        opencv4Full
        requests
      ]
    ))
  ];

  # Optional — disable backups
  programs.nvchad.backup = false;
}
