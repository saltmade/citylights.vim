# Citylights
## A beautiful dark theme designed with focus in mind
_Note: This theme is under heavy development at present. Expect frequent
changes until it is tuned properly._

## Colors
Yummygum hasn't codified a canonical color scheme, so I've used the Atom color variables instead. This gave me 17 colors, plus a couple extras used for white or highlights. I've done my best to create a sane mapping of this list to the typical 16 color codes allowed by terminals. I've also added some niceties for true color.

I presently use OSX, neovim with true colors turned on, iTerm2, Operator Mono NerdFont, and focus on python and javascript development with markdown for documentation. You will find a bias toward this stack.

## Icons
Citylights is also an icon theme, however I don't currently plan to port it as I
like it less than Material icons, which are already a part of [Nerd Fonts](ryanoasis/nerd-fonts).

## Looking for something similar?
More outrun? [Darcula](https://draculatheme.com/vim/)

More purple? [Spacevim](https://github.com/colepeters/spacemacs-theme.vim)

More vaporwave? [Ladies Night 2](http://color-themes.com/?view=theme&id=566065a4ddacef1b003edb63)
Yes I realize this isn't Vim, but IntelliJ. If I ever port another theme this
will likely be it.

None of these? [Rainglow](https://rainglow.io/)

## Learnings for the Lazy
Taking on this conversion required me to learn a lot about how different terminal environments handle color as well as how color is described. Understanding why the file is structured how it is (which is mostly a rip off of Solarized's use of variables) requires a little background. So if you want to modify, extend or copy the file here's some info I found useful. This may be moved to a blog post, in which case I'll link it instead.

### Terminal Colors
Terminals often allow the user to set the first 16 ANSI colors as they like, but
restrict the other 17-256 to an existing palette. Neovim's terminal library
(libvterm) is such a emulator, which is why we set only those 16 colors. This is
further complicated by [how neovim handles true
colors](https://github.com/vim/vim/issues/2353). This [article on 16 color
setups](https://jeffkreeftmeijer.com/vim-16-color/) has a chart that helps a ton
in understanding what the terminal colors map to. Of course there's also the
peculiarity of using bright colors for bold...

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

## Research TODOs
- [] Why do terminals 8 through 16 for bold and lighter colors?
- [] What is ANSI and what does it have to do with the color settings?
- [] What's with all the conditionals in Solarized?
