" Split Sizer
" Title: splitsizer.vim : Controlled split sizing
" File: splitsizer.vim
" Author: Jeff Knaggs (mail@jeef3.com)
" Version: 1.0
" Last Modified: April 6, 2016
"

if exists("g:loaded_auto_split_sizer")
  finish
endif
let g:loaded_auto_split_sizer = 1

let s:original_width = &winwidth

augroup resize_commands
  autocmd!
  autocmd WinEnter * call s:CheckWindow()
augroup END

nnoremap <leader>a :call AutoSplitSizerOn()<cr>
nnoremap <leader>s :call AutoSplitSizerOff()<cr>

function! AutoSplitSizerOn()
  let s:target_width = winwidth(0)
  let s:resizer_on = 1
endfunction

function! AutoSplitSizerOff()
  let s:resizer_on = 0
  let &winwidth = s:original_width
endfunction

function! s:CheckWindow()
  if s:resizer_on
    let &winwidth = s:target_width
  else
    let &winwidth = s:original_width
  endif
endfunction

call AutoSplitSizerOff()
