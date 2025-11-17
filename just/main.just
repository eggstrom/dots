mod home
mod root
mod packages
mod clean

[private]
h *args:
  -@just home {{args}}

[private]
r *args:
  -@just root {{args}}

[private]
p *args:
  -@just packages {{args}}

[private]
c *args:
  -@just clean {{args}}
