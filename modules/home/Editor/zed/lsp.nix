{ pkgs }:
{
  nil = {
    binary = {
      path = "${pkgs.nil}/bin/nil";
    };
    settings = {
      formatting = {
        command = [ "nixfmt" ];
      };
      diagnostics = {
        ignored = [ "unused_binding" ];
      };
    };
  };

  clangd = {
    binary = {
      path = "${pkgs.clang-tools}/bin/clangd";
    };
    initialization_options = {
      clangdFileStatus = true;
      usePlaceholders = true;
      completeUnimported = true;
      semanticHighlighting = true;
    };
  };

  omnisharp = {
    binary = {
      path = "${pkgs.omnisharp-roslyn}/bin/OmniSharp";
      arguments = [ "-lsp" ];
    };
  };

  jdtls = {
    binary = {
      path = "${pkgs.jdt-language-server}/bin/jdtls";
    };
    initialization_options = {
      settings = {
        java = {
          format = {
            enabled = true;
          };
          saveActions = {
            organizeImports = true;
          };
          completion = {
            importOrder = [
              "java"
              "javax"
              "com"
              "org"
            ];
          };
        };
      };
    };
  };
}
