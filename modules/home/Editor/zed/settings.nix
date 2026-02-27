{
  agent.enabled = true;
  # assistant.version = "2";
  agent.default_profile = "write";
  agent.default_model = {
    provider = "copilot_chat";
    model = "claude-haiku-4.5";
  };
  edit_predictions.provider = "zed";
  which_key.enabled = true;
  vim_mode = true;
  load_direnv = "shell_hook";
  base_keymap = "VSCode";
  show_whitespaces = "trailing";
  ui_font_size = 16;
  buffer_font_size = 14;
  theme = {
    mode = "system";
    dark = "Ayu Dark";
    light = "One Light";
  };
}
