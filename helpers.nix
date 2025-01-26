let
  inherit (builtins)
    attrNames
    filter
    readDir
    ;
in
{
  # Returns list of absolute paths to file's siblings
  getFileSiblings =
    path:
    let
      dir = dirOf path;
    in
    readDir dir |> attrNames |> filter (file: file != baseNameOf path) |> map (file: "${dir}/${file}");
}
