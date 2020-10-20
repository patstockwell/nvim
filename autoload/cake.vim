" https://www.reddit.com/r/vim/comments/f79rv2/how_to_exclude_filetype_with_autocmd/
function! cake#highlightTrailingWhiteSpace(pattern)
  if bufname('') != '__Calendar'
    call clearmatches()
    call matchadd('ExtraWhitespace', a:pattern , 100)
  endif
endfunction

" https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
function! cake#grep(...)
  let grepProgram = [&grepprg]
  let arguments = a:000
  let joined = join(grepProgram + arguments, ' ')
  return system(joined)
endfunction

function cake#searchWordUnderTheCursor()
  let currentWord = expand('<cword>')
  return cake#grep(currentWord)
endfunction

function! cake#toggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction

" https://stackoverflow.com/questions/749297/can-i-see-changes-before-i-save-my-file-in-vim
function! cake#diffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  execute setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile readonly
  execute "setlocal ft=" . filetype
endfunction

function! cake#createDateStampForJournalEntry()
  " '%:t' is the `t`ail of the current file path (just the filename)
  let filenameWithoutExtension = split(expand('%:t'), ".md")
  let yearMonthDay = split(filenameWithoutExtension[0], "-")
  " arguments for the `date` command using filename fragments. eg `-v2020y`
  let yearArg = "-v" . yearMonthDay[0] . "y "
  let monthArg = "-v" . yearMonthDay[1] . "m "
  let dayArg = "-v" . yearMonthDay[2] . "d "

  " date command to be passed to `execute`
  let dateCommand = "normal :r ! date " . dayArg . monthArg . yearArg
  " Formats for the date command. Note the double escaped backslash. It would
  " be a single backslash if just using `normal` without `execute`
  let dateFormat = " \"+\\%d \\%h \\%Y, \\%A\""
  let filenameDateFormat = "+\\%Y-\\%m-\\%d"
  " Go to the top of the file, insert a new line above and enter #<SPACE><ESC>
  normal ggO# 
  " In command mode `r`ead from stdout the date command and <CR>
  execute dateCommand . dateFormat . "\<CR>"
  " Go up a line, concatinate the 2 lines, enter a new line below & <CR><ESC>
  normal kJo
  " insert literal characters followed by <ESC>
  normal i[`< Previous day`](
  " In command mode `r`ead from stdout the date command and <CR>
  execute dateCommand . " -v -1d " . filenameDateFormat . "\<CR>"
  " Go up a line, concatinate the 2 lines, delete the empty space character
  normal kJx
  " `A`ppend to the end of the line literal characters followed by <ESC>
  normal A) | [`Journal index`](journal) | [`Next day >`](
  " In command mode `r`ead from stdout the date command and <CR>
  execute dateCommand . " -v +1d " . filenameDateFormat . "\<CR>"
  " Go up a line, concatinate the 2 lines, delete the empty space character
  normal kJx
  " `A`ppend a literal `)`, then <CR><CR>, and insert new line in insert mode
  normal A)
endfunction

function! cake#highlightBulletPoint()
  echom "Whooo"
  let lineNumber = line(".")
  let column = col(".")
  silent! execute ":s/^- /- ❤️  /"
  call cursor(lineNumber, column + 8)
endfunction
