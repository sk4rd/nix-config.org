# [[file:../../README.org::*Shell][Shell:1]]
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
# Shell:1 ends here
