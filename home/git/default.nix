{ pkgs, ... }:
{
  config = {
    home.packages = with pkgs; [
      git
      git-credential-manager
      gh
      lazygit
    ];

    xdg.configFile.git.source = ./home/.config/git;
    xdg.configFile.lazygit.source = ./home/.config/lazygit;
    home.file.".local/bin/git-user".source = ./home/.local/bin/git-user;
  };
}
