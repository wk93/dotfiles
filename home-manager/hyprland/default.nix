{
  wayland.windowManager.hyprland = {
    enable = true;
    # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
    package = null;
    portalPackage = null;
    settings = {
      "$mod" = "SUPER";

      monitor = [
        "eDP-1,2560x1440,0x0,1.666666"
        "DP-1,3840x2160,-1920x0,2"
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
          "$mod, return, exec, ghostty"
          "$mod, Q, killactive"

          # t480
          " , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          " , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"
          " , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+"
          " , XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          " , XF86MonBrightnessDown, exec, brightnessctl -q  set 10%-"
          " , XF86MonBrightnessUp, exec, brightnessctl -q  set +10%"
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
