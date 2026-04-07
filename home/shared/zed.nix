{ config, pkgs, lib, ... }:

{
  xdg.configFile."zed/keymap.json" = {
    force = true;
    text = ''
      [
        {
          "context": "Terminal",
          "bindings": {
            "ctrl-`": "workspace::ActivatePaneUp",
            "ctrl-]": "pane::ActivateNextItem",
            "ctrl-[": "pane::ActivatePrevItem"
          }
        }
      ]
    '';
  };

  xdg.configFile."zed/settings.json" = {
    force = true;
    text = ''
      {
        "telemetry": {
          "diagnostics": false,
          "metrics": false
        },
        "vim_mode": true,
        "format_on_save": "on",
        "ui_font_size": 12,
        "buffer_font_size": 10,
        "theme": {
          "mode": "system",
          "light": "Ayu Mirage",
          "dark": "Ayu Mirage"
        },
        "inlay_hints": {
          "enabled": true
        },
        "project_panel": {
          "dock": "right"
        },
        "auto_install_extensions": {
          "nix": true,
          "rust": true,
          "basher": true,
          "c": true,
          "python": true
        }
      }
    '';
  };

  home.packages = lib.mkIf pkgs.stdenv.isLinux [ pkgs.zed-editor ];
}
