{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "candy";
      plugins = [
        "sudo"
        "git"
        "zsh-bat"
      ];
    };
  };
}
