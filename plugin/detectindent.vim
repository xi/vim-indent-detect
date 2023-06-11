command! -nargs=? Tabs call detectindent#Set(0, <f-args>)
command! -nargs=? Spaces call detectindent#Set(1, <f-args>)

autocmd BufNewFile,BufRead * call detectindent#Detect()
