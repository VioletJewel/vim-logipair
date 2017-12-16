vim-logipair
------------

###### super simple pair expansion that just does the right thing

* it's only 20 lines of code!
    - for real! check it out!

* it just does the right thing
    - see **how it works** below

## how it works

* press `{<cr>`
* press `(<cr>`
* press `[<cr>`
    - note that these are `inoremap`s, so you should do it rather quickly

The above expansions do different things depending on the text following the cursor (if any follows).

* if the following text has a closing pair (defaults: `)`, `}`, `]`) immediately after the cursor:
    - `({|)` (for example) becomes:

```
({
    |
})
```

* if there is **no** text after the cursor:
    - `{|` becomes (with `autoindent`, `smartindent`, etc enabled):

```
{
    |
}
```

* if there **is** text after the cursor (not starting with a closing pair):
    - `function() {|console.log("hi");` becomes:

```
function() {
    console.log("hi");
}
```

## configuration

* defaults:

```vim
let g:logipair_matches = {
    \ '{': '}',
    \ '[': ']',
    \ '(': ')'
\}
```

## not working right?

* if it's not working as you'd expect, leave an issue! That way I can improve it for myself and for you too!

* you can do better? kay; fork it.

---

cheers and good luck!
