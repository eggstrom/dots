let
  inherit (builtins)
    attrNames
    filter
    map
    readDir
    ;
in
{
  # Import everything in current directory
  imports = map (file: ./${file}) (filter (file: file != "default.nix") (attrNames (readDir ./.)));
}
