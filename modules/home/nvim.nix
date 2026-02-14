{ config, pkgs, ... }:
{
    programs.neovim = {
        enable = true;
        extraPackages = with pkgs; [
            luarocks
            # tree-sitter, stylua, etc.
        ];
};

}
