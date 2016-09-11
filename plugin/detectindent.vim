set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

function! MatchIndent()
	let n = 1

	while n <= 50
		let cur_line = getline(n)

		if cur_line =~ '^	'
			set ts=2 sw=2 sts=2 noet
			return
		elseif cur_line =~ '^    '
			set ts=4 sw=4 sts=4 et
			return
		elseif cur_line =~ '^  '
			set ts=2 sw=2 sts=2 et
			return
		endif

		let n = n + 1
	endwhile
endfunction

command! Tabs set ts=2 sw=2 sts=2 noet
command! Spaces set ts=4 sw=4 sts=4 et
command! Spaces2 set ts=2 sw=2 sts=2 et

autocmd BufNewFile,BufRead * call MatchIndent()
