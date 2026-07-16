load_basic() {
	. "$1/builtin.sh"
	. "$1/parse.sh"
	. "$1/interpreter.sh"
}

load_module() {
	if try [ ! -f "$KITTYBUILD_INSTALL_PATH/$1" ]
	then
		error "Kittybuild module $1 doesn't exist\!" 1
	fi
	info "Loading module $1..."
	. "$KITTYBUILD_INSTALL_PATH/modules/$1"
}
