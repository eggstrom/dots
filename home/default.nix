{ helpers, lib, ... }:
{
  options.userConfig.minimal = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Whether the user should only have access to a minimalistic subset of features.";
  };

  # Import everything in current directory
  imports = helpers.getFileSiblings ./default.nix;
}
