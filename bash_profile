# -*- Mode: shell-script -*-

add_to_path() {
    # Ignore if it doesn't exist.
    [[ -d $1 ]] || return

    # Don't add if already in path.
    for d in ${PATH//:/ }; do
	if [[ "$d" = "$1" ]]; then
	    return
	fi
    done

    export PATH=$PATH:$1
}
