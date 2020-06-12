# Citylights
## A beautiful dark theme designed with focus in mind

## Colors
Yummygum hasn't codified a canonical color scheme, unless you count the ANSI term variables in the VSCode theme. That same file has 34 different colors, which is what I've attempted to map as closely as possible to vim color groups.

I presently use OSX, neovim with `termguicolors` on, inside Kitty. You will find a bias toward this stack.

## Looking for something similar?
More outrun? [Darcula](https://draculatheme.com/vim/)

More purple? [Spacevim](https://github.com/colepeters/spacemacs-theme.vim)

More vaporwave? [Ladies Night 2](http://color-themes.com/?view=theme&id=566065a4ddacef1b003edb63)
TODO: Convert Ladies Night 2 to Vim from Intellij

None of these? [Rainglow](https://rainglow.io/)

## Differences with VSCode Citylights
- VSC has a hollow cursor for insert mode. At the moment there isn't a way to set vim to a hollow cursor.
- No line separator/gutter next to line numbers
- 

## Understanding Terminal Colors: a shameless plug
For an overview of how terminal colors work so you can modify them yourself, check out [the blogpost](https://salt.ac/understanding-terminal-colors) I wrote while making this.

### :Term Colors
- Both Neovim and Vim use the terminal's 16 colors by default.
- Neovim Truecolor (`set termguicolors`) requires you to set the `g:terminal_color_*` variables, [just as you have with your external terminal](https://github.com/neovim/neovim/issues/4696#issuecomment-530153777).
- Vim's Truecolor terminal support is [a single variable that uses an array](https://github.com/vim/vim/pull/2747): `g:terminal_ansi_colors`

### Italics
# TODO write up on italics settings for Operator Mono

### Underlines and Undercurls
What's an undercurl? Those squiggly lines you see under misspelled words. They're a useful option to have for distinguishing different states of text. [This write up](https://sw.kovidgoyal.net/kitty/protocol-extensions.html#colored-and-styled-underlines) in the kitty docs helps clarify all the different kinds of underthings you might have.

## References

These color schemes and articles helped me put this together:

+ [The excellent Solarized theme by Ethan Schooner](https://github.com/altercation/solarized/blob/master/vim-colors-solarized/colors/solarized.vim)
+ [Chris Kempson's Base16](https://github.com/chriskempson/base16-vim/blob/master/colors/base16-3024.vim)
+ [Agreco's conversion of the citylights theme](https://github.com/agreco/vim-citylights) 
+ [Xterm color cheatsheet](https://jonasjacek.github.io/colors/)
+ [Alvin Alexander's very good beginner FAQ on term
  colors](https://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax)
+ [Vim colors
  docs](http://vimdoc.sourceforge.net/htmldoc/syntax.html#xterm-color)
+ https://github.com/neovim/neovim/issues/7018

