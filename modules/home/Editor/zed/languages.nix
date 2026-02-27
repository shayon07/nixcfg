{
  Nix = {
    language_servers = [ "nil" ];
    formatter.external = {
      command = "nixfmt";
      arguments = [ "-" ];
    };
    tab_size = 4;
  };

  "C" = {
    language_servers = [ "clangd" ];
    formatter.external = {
      command = "clang-format";
      arguments = [
        "--style=file"
        "-"
      ];
    };
  };

  "C++" = {
    format_on_save = "on";
    tab_size = 4;
  };

  Python = {
    language_servers = [
      "pylsp"
      "!basedpyright"
    ];
    formatter.external = {
      command = "black";
      arguments = [ "-" ];
    };
  };

  "CSharp" = {
    language_servers = [
      "omnisharp"
      "!roslyn"
    ];
  };

  Java = {
    format_on_save = "on";
    tab_size = 4;
  };
}
