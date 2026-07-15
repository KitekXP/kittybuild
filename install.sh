#!/bin/dash

# shellcheck disable=SC2059

gen_wrapper() {
	printf "$(cat ./templates/wrapper.sh.template)" "$SHELL" "$1" > "$1/wrapper.sh"
}

install_kittybuild() {
	if [ ! -n "${INSTALL_PATH+x}" ]
	then
		local INSTALL_PATH="$HOME/.tools/kittybuild"
	fi

	if [ ! -n "${BIN_PATH+x}" ]
	then
		local BIN_PATH="$HOME/.local/bin"
	fi

	local EXEC_NAME="kittybuild"


	# But is it possible with accurate hitboxes?
	mkdir -p "$INSTALL_PATH" "$BIN_PATH"

	gen_wrapper "$INSTALL_PATH"
	chmod +x "$INSTALL_PATH/wrapper.sh"

	cp -r src/* "$INSTALL_PATH"
	chmod +x "$BIN_PATH/*"

	ln -sf "$INSTALL_PATH/wrapper.sh" "$BIN_PATH/$EXEC_NAME"
}

install_kittybuild "$@"
