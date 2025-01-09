{ pkgs, ... }:

let
  userEmail = "mikolaj.ba@pm.me"; # Change this to your email
  userName = "Mikolaj Bajtkiewicz"; # Change this to your name
  signingKey = "AFA1F0631CECE62F"; # Set to your own key (or remove)
in
{
  programs.git = {
    inherit userEmail userName;

    enable = true;
    lfs.enable = true;
    package = pkgs.gitFull;

    # Optional
    signing = {
      signByDefault = true;
      key = signingKey;
    };
  };
}
