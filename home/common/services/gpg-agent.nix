{ pkgs, ... }:

let
  sshKey = "AFA1F0631CECE62F"; # Set to your own key
in
{

  # GPG agent configuration
  services.gpg-agent = {
    enable = true;
    enableScDaemon = true;
    pinentryPackage = pkgs.pinentry-qt;

    # Enable SSH key support
    enableSshSupport = true;
    sshKeys = [ sshKey ];
  };
}
