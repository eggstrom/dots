{
  # Import everything in current directory
  imports =
    builtins.readDir ./.
    |> builtins.attrNames
    |> builtins.filter (file: file != "default.nix")
    |> builtins.map (file: ./${file});
}
