{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";

      monitor = [
        "eDP-1,2560x1440,auto,1.666666"
      ];

      xwayland = {
        enabled = true;
        force_zero_scaling = true;
      };

      input = {
        kb_layout = "pl";
        kb_options = "caps:escape";
        touchpad.natural_scroll = true;
      };

      bind =
        [
          "$mod, B, exec, firefox"
          "$mod, return, exec, alacritty"
          "$mod, Q, killactive"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (
              i: let
                ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
    };
  };
}
