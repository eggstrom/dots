{ helpers, ... }:
{
  # Import everything in current directory
  imports = helpers.getFileSiblings ./default.nix;
}
