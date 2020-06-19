" Vim defaults rather than vi ones. Keep at top.  Ensure that Vim won't try
" to be compatible with the now-archaic 1970s vi. It influences a lot of Vim
" behaviour.
"
" This is not strictly required when loading from ~/.vimrc or ~/.vim/vimrc -- as
" Vim will automatically set it when loading from those files -- but it's not set
" automatically when loaded as vim -u test.vim or :source test.vim.
"
" Most people won't load it like that, but a single line is easy enough to add
" and will avoid *very* confusing errors down the line.
"
" You *must* keep this at the top, since changing the value resets many options.
" See 'nocompatible'.
set nocompatible

" Enable filetype-specific settings.  Vim ships with support for many
" languages, which is known as a 'filetype' in Vim jargon. A 'filetype' usually
" comes with a syntax file to control the syntax highlighting, but may also come
" with specific rules for indentation and may set settings specific for this
" 'filetype'.
"
" The default is to *not* use any of this though. This will enable detection of
" the filetype, which is usually done based on the filename's extension or the
" first line, and can be manually overridden with a 'modeline'.
"
" You almost certainly want to keep this.
filetype plugin indent on

" Enable syntax highlighting.  Enable syntax highlighting for this
" 'filetype'. This will implicitly enable 'filetype' detection ("filetype on").
"
" You almost certainly want to keep this.
syntax on

" Make the backspace behave as most applications. 
" Vim's default behaviour when pressing the backspacing is somewhat peculiar, it
" won’t allow you to backspace to the previous line, automatically inserted
" indentation, or previously inserted text.
"
" With this value you will be able to to backspace over everything in insert
" mode, which is how almost any other application behaves.
"
" Also see "Why doesn't the backspace key work in insert mode?":
" https://vi.stackexchange.com/q/2162/51.
set backspace=2

" Use current indent for new lines.  By default Vim will always place the
" cursor in the first column when starting a new line. When 'autoindent' is
" enabled it will use the same indentation as the previous line, which is often
" what you want.
"
" Note that there are more options to control indentation: 'cindent' and
" 'smartindent'. You usually want to leave those alone as they *will* cause
" confusing behaviour in many programming languages. A 'filetype' that benefits
" from these will usually set one of those options, or use a custom
" 'indentexpr'.
set autoindent

" Show as much of the line as will fit.  By default Vim will display only
" "@" characters if the last line on the screen won't fit when 'wrap' is
" enabled.
"
" If this is enabled Vim will display as much as the last line as will fit and
" display "@@@" at the end.
"
" There is another useful option for 'display' that I rather like: "uhex". This
" will make Vim show unprintable characters as &lt;xx&gt; rather than ^L (Use
" |i_CTRL-V| in insert mode to see the difference.)
set display=lastline

" Better tab completion in the commandline.  Make commandline-completion
" (after you type :) behave more useful and roughly like most shells do.
"
" See 'wildmode' on how to configure the completion mode to your liking.
" 'wildignore' is also a useful setting to ignore binary files such as compiler
" output, images, etc.
set wildmenu

set wildmode=list:longest  " List all matches and complete to the longest match.

" Show (partial) command in bottom-right.  Vim had many commands that
" consist of two or more keystrokes. If this option is enabled Vim will show the
" command you've typed thus-far in the bottom-right of the screen.
"
" It will also show the size of the selection in |visual-mode|.
set showcmd

" Backspace removes 'shiftwidth' worth of spaces.  Remove 'shiftwidth' worth
" of spaces on backspace – like most editors – instead of just a single space.
set smarttab

" Show line numbers.  Vim won't directly show line numbers by default. This
" will enable a column with line numbers on the left-hand side of the screen.
"
" You can also show the current line number in the 'statusline' by setting
" 'ruler', or pressing |CTRL-G| or |g_CTRL-G|.
"
" Also see 'relativenumber' for showing line numbers as relative to the current
" line, 'numberwidth' for controlling the width, and |hl-LineNr| for controlling
" the colours.
set number

" Wrap long lines.  When long lines are *not* wrapped Vim will hide any text
" that's larger than the screen and scroll horizontally.
"
" Also see 'breakindent' for continuing wrapped lines on the same indent level
" (requires Vim 7.4.338) and 'linebreak' to wrap only at the end of words.
"
" You can also use |gj| and |gk| to navigate "visual" lines more easily. Many
" people line to override the default behaviour by remapping keys with something
" like:
"
" nnoremap k gk nnoremap j gj nnoremap &lt;Up> gk nnoremap &lt;Down> gj inoremap
" &lt;Down> &lt;C-o>gj inoremap &lt;Up> &lt;C-o>gk
set wrap

" Always show the statusline.  By default Vim will show the 'statusline'
" only if there are two or more windows.
"
" The statusline displays useful information about the current buffer and cursor
" position, so it’s useful to always show it.
"
" Also see 'statusline' for controlling/expanding the information shown here.
set laststatus=2

" Show the ruler in the statusline.  The ruler is shown on the right side of
" the 'statusline' and usually contains information about the current cursor
" position and the like.
"
" Also see 'laststatus' to enable displaying the statusline and 'rulerformat'
" for configuring what’s displayed here.
set ruler

" Wrap at n characters.  Automatically break lines at *n* characters.
set textwidth=120

" Searching with / is case-insensitive.  Case-insensitive searching unless
" the pattern contains an upper case letter or if |/\C| is in the pattern.
set ignorecase

set smartcase              " Disable 'ignorecase' if the term contains upper-case.

" Remove octal support from 'nrformats'.  This controls how Vim should
" interpret numbers when pressing |CTRL-A| or |CTRL-X| to increment to decrement
" a number. By default numbers starting with a 0 are treated as octal numbers,
" which can be rather confusing, so remove that.
set nrformats-=octal

" Size of a Tab character.  Number of spaces to display tab characters as.
set tabstop=4

set shiftwidth=0           " Use same value as 'tabstop'.
set softtabstop=-1         " Use same value as 'shiftwidth'.

" Minimum number of lines to keep above/below cursor.  Keep lines above and
" below the screen when scrolling up or down. This is useful so you have some
" context what you’re scrolling to.
"
" Also see 'sidescrolloff'.
set scrolloff=5

" Store temporary files in ~/.vim/tmp  By default Vim will store various
" files in the current directory. These files are useful, but storing them in
" the current directory next to the original file usually isn’t.
"
" With this enabled Vim will store all these files in the user’s home directory.
set viminfo+=n~/.vim/tmp/viminfo
set backupdir=$HOME/.vim/tmp/backup
set dir=$HOME/.vim/tmp/swap
set viewdir=$HOME/.vim/tmp/view
if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p', 0700) | endif
if !isdirectory(&dir)       | call mkdir(&dir, 'p', 0700)       | endif
if !isdirectory(&viewdir)   | call mkdir(&viewdir, 'p', 0700)   | endif

" Clean trailing whitespace.  This command removes all trailing whitespace
" in a file, without causing any side-effects.
"
" Also see "What's the simplest way to strip trailing whitespace from all lines
" in a file?": https://vi.stackexchange.com/a/454/51.
fun! s:trim_whitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun
command! TrimWhitespace call s:trim_whitespace()
