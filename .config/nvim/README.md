### ThePrimeagen's init.lua

Prerequisite: install [ripgrep](https://github.com/BurntSushi/ripgrep).

[The full video of me setting up this repo](https://www.youtube.com/watch?v=w7i4amO_zaE)

For anyone that is interested in my vimrc, i will have a commit log below
documenting each one of my commits (easy to C-f the change you want to know
about though i would just suggest `git log -S`).

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
