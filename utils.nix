let
  lib = (import <nixpkgs> { }).lib;
  inherit (builtins) readDir foldl' attrNames;
  inherit (lib.attrsets) filterAttrs setAttrByPath recursiveUpdate;
  listRecursive = pathStr: listRecursive' { } pathStr;
  listRecursive' =
    acc: pathStr:
    let
      toPath = s: path + "/${s}";
      path = ./. + pathStr;
      contents = readDir path;
      dirs = filterAttrs (k: v: v == "directory") contents;
      files = filterAttrs (k: v: v == "regular") contents;
      dirs' = foldl' (acc: d: recursiveUpdate acc (listRecursive (pathStr + "/" + d))) { } (
        attrNames dirs
      );
      files' = foldl' (
        acc: f:
        recursiveUpdate acc (
          setAttrByPath [
            "${pathStr}/${f}"
            "source"
          ] (toPath f)
        )
      ) { } (attrNames files);
    in
    recursiveUpdate dirs' files';
in
listRecursive
# {
#   # Syntax for current filename: https://github.com/NixOS/nix/issues/5897
#   # __curPos.file;
#
#   # Walk directory and map files
#   # https://gist.github.com/thalesmg/ae5dc3c5359aed78a33243add14a887d
# }
