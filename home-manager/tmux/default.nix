{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 0;
    baseIndex = 1;
    keyMode = "vi";
    shortcut = "a";
    extraConfig = builtins.readFile ./tmux.conf;

    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
    ];
  };
}
