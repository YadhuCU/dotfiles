### Config

Prerequisite: install [ripgrep](https://github.com/BurntSushi/ripgrep).

## Prerequisite

- `sudo apt install lualocks`
- `npm install -g @tailwindcss/language-server`

## Auto incrementing function and steps.

```vim
:let g:counter = 30
:function! Next()
:  let g:counter += 1
:  return g:counter
:endfunction
```

```vim
:'<,'>s/label="[^"]*"/\='label={t.Tag' . Next() . '}'/g
```

```vim
:delfunction Next
:unlet g:counter
```
