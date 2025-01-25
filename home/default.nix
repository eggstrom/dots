{ lib, ... }:
{
  options.userConfig.minimal = lib.options.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Whether the user should only have access to a minimalistic subset of features.";
  };

  # Import everything in current directory
  imports =
    builtins.readDir ./.
    |> builtins.attrNames
    |> builtins.filter (file: file != "default.nix")
    |> builtins.map (file: ./${file});
}
