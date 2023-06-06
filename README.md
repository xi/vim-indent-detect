A Vim plugin for handeling indentation.

-	Whenever a file is loaded, this plugin detects the indentation automatically.
	The detection is quite simplistic:

	-	it does not support mixed tabs and spaces
	-	it only consider the first indented line
	-	it does not consider anything after line 50

-	The settings can be overwritten manually by using the `Spaces [width]` and
	`Tabs [width]` commands.

-	You can change the default tab width by setting
	`g:detectindent_preferred_indent`.

Inspired by [detectindent](https://github.com/ciaranm/detectindent) and
[vim-sleuth](https://github.com/tpope/vim-sleuth).
