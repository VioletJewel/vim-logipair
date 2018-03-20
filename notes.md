## desired effects

* `{<cr>`

```
{
    |
}
```


* `({<cr>`

```
({
    |
})
```


* `(<space>`

```
(|)
```


* `("<space>`

```
("|")
```


* `(;<space>`

```
(|);
```


* `(,<space>`

```
(|),
```

* `(<space><space>`

```
( | )
```

* <code>```\<cr></code> (same for `"""` or `'''`)

<pre>
```
|
```
</pre>

* `function foo {|console.log("bar");` (`<cr>` @ `|`)

```
function foo() {
    console.log("bar");
}
```

* `window.setTimeout(function() {, 200<cr>`

```
window.setTimeout(function() {
    |
}, 200)
```

* `foo = (function() {<cr>` (similar to above)

```
foo = (function() {
    |
})
```

* `(|function() { console.log("foo"); })` (`<bs>` @ `|`)

```
function() { console.log("foo"); }
```

--------------------------------------------------------------------------------

## pitfalls

* already completed pairs

```
[<space>
]
```

```
{<cr>
}
```

```
"""<cr>
"""
```

--------------------------------------------------------------------------------

## thoughts

* only support opening pairs on current line
    - in order to do this, use |searchpair()| or |searchpairpos()|
