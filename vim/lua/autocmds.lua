vim.cmd [[filetype plugin on]]
vim.cmd [[command! CopyPath execute 'let @+ = expand("%")']]
vim.cmd [[
augroup remember_cursor_position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
]]

vim.cmd [[
augroup color_scheme_tweaks
  autocmd!

  highlight! DiffChange      guibg=#3c3c34 guifg=NONE gui=NONE
  highlight! DiffText        guibg=#525200 guifg=NONE gui=NONE
  highlight! DiffAdd         guibg=#283c34 guifg=NONE gui=NONE
  highlight! DiffDelete      guibg=#382c34 guifg=NONE gui=NONE
  highlight! CursorLine      guibg=#2e3138
  highlight! CursorLineNR    guibg=#2e3138 gui=bold
  highlight! CursorColumn    guibg=#2e3138
  highlight! ColorColumn     guibg=#252a32
  highlight! Comment         gui=italic
  highlight! Warning         guibg=#443333
  highlight! Error           guibg=#512121
  highlight! Visual          guibg=#401437
  highlight! IncSearch       guifg=#FF0000 guibg=NONE gui=bold
  highlight! Search          guifg=#FFFFFF guibg=NONE gui=bold
  highlight! LspDiagnosticsUnderlineInformation guibg=NONE gui=NONE
  highlight! LspDiagnosticsUnderlineHint guibg=NONE gui=NONE
  highlight! LspDiagnosticsUnderlineWarning guibg=#443333 gui=NONE
  highlight! LspDiagnosticsUnderlineError guibg=#512121 gui=NONE
augroup END
]]

vim.cmd [[
  autocmd BufNewFile,BufReadPost,BufWritePost *.env.* set filetype=sh
]]

-- Set tmux window name to edited path
vim.cmd [[
  autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))
  autocmd VimLeave * call system("tmux rename-window  ")
]]

vim.cmd [[
function! ClearRegisters()
  let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
  let i=0
  while (i<strlen(regs))
      exec 'let @'.regs[i].'=""'
      let i=i+1
  endwhile
endfunction

command! ClearRegisters call ClearRegisters()
]]

-- vim.cmd [[
-- augroup filetype_tweaks
--   autocmd!

--   autocmd TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal
--   autocmd FileType NvimTree setlocal statusline=""
-- augroup END
-- ]]

-- vim.cmd [[
-- augroup test
--   autocmd!

--   autocmd FileType *.lua echomsg("test")
-- augroup END
-- ]]