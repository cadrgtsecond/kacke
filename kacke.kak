# A quick script to run Kacke.

set-register a '"dz<a-k>^<ret>i0<esc>'
set-register z '"dzl<a-k>$<ret>i0<esc>'

set-register h '<a-k><lt><ret>"dzh"dZ'
set-register l '<a-k><gt><ret>"dzl"dZ'
# We need to reset the mark because Kakoune thinks the mark moves when replacing characters
set-register j '<a-k>\+<ret>"dz<a-k>1<ret>r0"dZ'
set-register k '<a-k>\+<ret>"dz<a-k>0<ret>r1"dZ'

set-register p '<a-k>\]<ret>m;'
set-register n '<a-k>\[<ret>"dz<a-k>0<ret>"czm'

define-command -override kacke-monkey-one-step %{
    try %{ execute-keys '"aq' }
    try %{ execute-keys '"cz' }
    try %{ execute-keys '"zq' }
    try %{ execute-keys '"cz' }
    try %{ execute-keys '"hq' }
    try %{ execute-keys '"cz' }
    try %{ execute-keys '"lq' }
    try %{ execute-keys '"cz' }
    try %{ execute-keys '"jq' }
    try %{ execute-keys '"cz' }
    try %{ execute-keys '"kq' }
    try %{ execute-keys '"cz' }
    try %{ execute-keys '"pq' }
    try %{ execute-keys '"cz' }
    try %{ execute-keys '"nq' }
    execute-keys 'l"cZ'
    try %{
        execute-keys '<a-K>\n<ret>'
    } catch %{
        fail "Program halted"
    }
}
define-command -override -params .. loop-4 %{
    %arg{@};
    %arg{@};
    %arg{@};
    %arg{@};
}
define-command -override -params .. loop-256 %{
    loop-4 loop-4 loop-4 %arg{@};
}
define-command -override -params .. loop-inf %{
    loop-256 loop-256 loop-256 loop-256 %arg{@}
}

define-command -docstring "A helpful monkey to help you execute commands" -override kacke-monkey %{
    loop-inf kacke-monkey-one-step
}
