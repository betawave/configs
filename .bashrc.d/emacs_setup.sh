alias edit='emacs -nw'
alias magit='emacsclient -c -e "(magit-status)" &'

open_new_emacs_window () {
    if [[ $# -eq 0 ]]; then
	emacsclient -c -e "(eshell)" &
    else
	emacsclient -c $1 &
    fi
}
alias emacs=open_new_emacs_window
