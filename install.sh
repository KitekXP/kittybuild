#!/bin/dash

# shellcheck disable=SC2059

. "./src/builtin.sh"

gen_wrapper() {
	printf "$(cat ./templates/wrapper.sh.template)" "$SHELL" "$1" > "$1/wrapper.sh"
}

install_kittybuild() {
	info "Checking env overrides..."
	if [ ! -n "${INSTALL_PATH+x}" ]
	then
		local INSTALL_PATH="$HOME"/.tools/kittybuild
	fi

	if [ ! -n "${BIN_PATH+x}" ]
	then
		local BIN_PATH="$HOME"/.local/bin
	fi

	info "Setting variables..."
	local EXEC_NAME="kittybuild"


	# But is it possible with accurate hitboxes?
	warn "Cleaning installation dir: $INSTALL_PATH..."
	rm -rf "$INSTALL_PATH"
	info "Creating installation dir: $INSTALL_PATH..."
	mkdir -p "$INSTALL_PATH" "$BIN_PATH"

	info "Generating the wrapper script..."
	gen_wrapper "$INSTALL_PATH"
	chmod +x "$INSTALL_PATH"/wrapper.sh

	info "Copying other scripts"
	cp -r src/* "$INSTALL_PATH"
	chmod +x "$BIN_PATH"/*

	info "Creating a symbolic link for the wrapper: $BIN_PATH/$EXEC_NAME..."
	ln -sf "$INSTALL_PATH"/wrapper.sh "$BIN_PATH/$EXEC_NAME"

	info "Installed successfuly!"
}

install_kittybuild "$@"
