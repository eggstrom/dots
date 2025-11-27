$env.config.show_banner = false
$env.config.cursor_shape.emacs = 'line'
$env.config.table.mode = 'heavy'
$env.config.completions.case_sensitive = true

$env.PROMPT_INDICATOR = {
  let color = if (is-admin) { ansi r } else { ansi g }
  $" \n($color)❯(ansi reset) "
}
$env.PROMPT_MULTILINE_INDICATOR = $'(ansi b)❯(ansi reset) '

$env.PROMPT_COMMAND = {
  let dir = match (do -i { $env.PWD | path relative-to $nu.home-path }) {
    null => $env.PWD
    '' => '~'
    $path => ('~' | path join $path)
  }
  mut prompt = $'(ansi c)($dir)(ansi reset)'

  let dur = $'($env.CMD_DURATION_MS)ms' | into duration
  if $dur > 1sec {
    let hrs = $dur / 1hr | into int
    let mins = $dur / 1min mod 60 | into int
    let secs = $dur / 1sec mod 60 | into int
    def pad [] { $in | fill -a r -w 2 -c 0 }
    $prompt += $' (ansi y)󰥔 (if $hrs > 0 {
      $'($hrs):($mins | pad):($secs | pad)'
    } else if $mins > 0 {
      $'($mins):($secs | pad)'
    } else {
      $'($secs)'
    })(ansi reset)'
  }

  if $env.LAST_EXIT_CODE != 0 {
    $prompt += $' (ansi r) ($env.LAST_EXIT_CODE)(ansi reset)'
  }
  $prompt
}
$env.PROMPT_COMMAND_RIGHT = ''

alias mkdir-builtin = mkdir
alias cp-builtin = cp
alias mv-builtin = mv
alias rm-builtin = rm

alias mkdir = mkdir -v
alias cp = cp -virp
alias mv = mv -vi
alias rm = rm -vir

alias d = cd ~/.dots
alias e = ^$env.EDITOR
alias f = yazi
alias g = git
alias l = ls -a
