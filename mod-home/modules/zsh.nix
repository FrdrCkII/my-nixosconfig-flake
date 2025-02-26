{ config, pkgs, lib, cfg, ... }:

{
  home.packages = with pkgs; [
    zsh
    fzf
    bat
    fd
  ];
  programs.fzf = {
    enable = true;
    defaultCommand = "fd --type f";
    defaultOptions = [
      "--height 40%"
      "--border"
      "--layout reverse"
      "--preview 'bat --color=always {}'"
      "--bind 'ctrl-/:change-preview-window(50%|hidden|)'"
    ];
    enableZshIntegration = true;
    colors = {
      "bg+" = "#6e7275";
      border = "#eceff4";
      gutter = "-1";
    };
  };
  home.file.".config/zsh/zimfw/zimrc".source = ../../cfg-dotf/${cfg.configname}/zimrc;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    initExtra = let
      ZIM_CONFIG_FILE = "~/.config/zsh/zimfw/zimrc";
      ZIM_HOME = "~/.config/zsh/zimfw";
    in lib.mkMerge [
      (''
        ZIM_CONFIG_FILE=${ZIM_CONFIG_FILE}
        ZIM_HOME=${ZIM_HOME}
        # Download zimfw plugin manager if missing.
        if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
          mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
              https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
        fi
        # Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
        if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE} ]]; then
          source ${ZIM_HOME}/zimfw.zsh init -q
        fi
        # Initialize modules.
        source ${ZIM_HOME}/init.zsh
      '')
      (''
        export FZF_COMPLETION_TRIGGER='\'
        # Use fd (https://github.com/sharkdp/fd) for listing path candidates.
        # - The first argument to the function ($1) is the base path to start traversal
        # - See the source code (completion.{bash,zsh}) for the details.
        _fzf_compgen_path() {
          fd --follow --exclude ".git" . "$1"
        }
        # Use fd to generate the list for directory completion
        _fzf_compgen_dir() {
          fd --type d --follow --exclude ".git" . "$1"
        }
      '')
    ];
  };
}