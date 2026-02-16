{ config, lib, pkgs, ... }:
{
    programs.kitty = {
        enable = true;
        settings = {
            confirm_os_window_close = 0;
            dynamic_background_opacity = true;
            enable_audio_bell = false;
            mouse_hide_wait = "-1.0";
            window_padding_width = 10;
            background_opacity = "0.8";
            background_blur = 5;
            shell = "fish";
            font_size = 14.0;
          
            font_family = "IosevkaTerm NF";
            bold_font = "IosevkaTerm NF Heavy";
            italic_font = "IosevkaTerm NF Italic";
            bold_italic_font = "IosevkaTerm NF Heavy Italic";

            # font_family = "JetBrains Mono";
            # bold_font = "auto";
            # italic_font = "auto";
            # bold_italic_font = "auto";
        };
    };
}


