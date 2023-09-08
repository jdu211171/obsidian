
```bash
     ↑
     k         
← h     l →      
     j      
     ↓
```

`:q!` exit without save
`:wq` save changes and exit
`i` to insert a text
`A` append text at the end of the line
`x` delete character
`dw` delete word
`dd` delete line

```bash
d # - is the delete operator.
  #   motion - is what the operator will operate on (listed below).

#   A short list of motions:
w # - until the start of the next word, EXCLUDING its first character.
e # - to the end of the current word, INCLUDING the last character.
$ # - to the end of the line, INCLUDING the last character.

#   operator   [number]   motion
```

`u` undo the last commands
`U` fix a whole line
`p` put previously deleted text _after_ the cursor
`P` put previously deleted text _before_ the cursor
`ce` change until the end of a word
`0` go to beginning of a line
`G` go to bottom of file
`gg` go to beginning of file
`[line number]G` go to that line number
`/` followed by a phrase to search for the phrase
`n` to search for the same phrase again
`N` to search for the same phrase in the opposite direction
`?` to search for a phrase in the backward direction
`<C-o>` undo jump
`<C-i>` jump
`% [some kind of parentheses]` move to the matching parenthesis or bracket
`:s/old/new/g` that substitutes "old" for "new"
`:#,#s/old/new/g` change every occurrence of a character string between two lines, where #  are the line line numbers of the range of lines where the substitution is to be done
`:%s/old/new/g`  change every occurrence in the whole file
`:%s/old/new/gc` find every occurrence in the whole file, with a prompt whether to substitute or not (c stands for confirmation)
`<C-g>` displays your location and the file status
`:w FILENAME` save part of the file, type `v` motion
`v` Visual Selection Mode, you can select text with it and copy, delete, cut or do anything with selected text
`r [filename]` retrieves disk file _filename_ and puts it below the cursor position
`o` open a line _below_ the cursor and place you in Insert mode
`O` open a line _above_ the cursor and place you in Insert mode
`a` insert text after the cursor
`e` move to end of the word
`R` replace more than one character
`y` copy text (yank)
`p` paste text (put)
`yw` copy word
`:set [command]`  sets custom command
`:set ic` when it's typed searching something it will ignore case
