function! SetIndent(expand, width)
	let &l:expandtab = a:expand
	let &l:tabstop = a:width
	let &l:shiftwidth = a:width
	let &l:softtabstop = a:width
endfunction

call SetIndent(0, 2)

function! MatchIndent()
	let n = 1

	while n <= 50
		let cur_line = getline(n)

		if cur_line =~ '^	'
			call SetIndent(0, 2)
			return
		elseif cur_line =~ '^    '
			call SetIndent(1, 4)
			return
		elseif cur_line =~ '^  '
			call SetIndent(1, 2)
			return
		endif

		let n = n + 1
	endwhile
endfunction

command! Tabs call SetIndent(0, 2)
command! Spaces call SetIndent(1, 4)
command! Spaces2 call SetIndent(1, 2)

autocmd BufNewFile,BufRead * call MatchIndent()
