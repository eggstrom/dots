import 'just/main.just'

[private]
default:
  @just -l -u -f {{source_file()}}
