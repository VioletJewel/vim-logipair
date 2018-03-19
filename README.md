vim-logipair
------------

###### super simple pair expansion that just does the right thing

## how it works

Logipair uses `&matchpairs` to logically expand pairs when pressing `<cr>`. The undo for this expansion is atomic as well!

Also, for ease of editing, it allows `<tab>` to complete the pair just before the cursor and intelligently adds spaces in pairs.

The above expansions do different things depending on the text following the cursor (if any follows).

## examples

#### simple pair expansion

If there is **no** text after the cursor:
    - `function() {|` becomes (with `autoindent`, `smartindent`, etc enabled):

```
function() {
    |
}
```

#### inside pair pair expansion

If the following text has a closing pair (examples: `)`, `}`, `]`) immediately after the cursor:
    - `({|)` (for example) becomes:

```
({
    |
})
```

#### trailing text pair expansion

* if there **is** text after the cursor (not starting with a closing pair):
    - `function() {|console.log("hi");` becomes:

```
function() {
    console.log("hi");
}
```

## configuration

* global:

```vim
set matchpairs=(:),{:},[:],<:>
```

* filetype:

```vim
autocmd FileType *.foo setlocal matchpairs=(:),{:},[:],<:>
```

## not working right?

* if it's not working as you'd expect, leave an issue! That way I can improve it for myself and for you too!

---

cheers and good luck!
