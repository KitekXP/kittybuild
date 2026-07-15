#!/bin/dash

install_kittybuild() {
	if [ ! -n "${INSTALL_PATH+x}" ]
	then
		local INSTALL_PATH="$HOME/.tools/kittybuild"
	fi

	if [ ! -n "${BIN_PATH+x}" ]
	then
		local BIN_PATH="$HOME/.local/bin"
	fi


	# But is it possible with accurate hitboxes?

	mkdir -p "$INSTALL_PATH" "$BIN_PATH"

	printf "#!/bin/dash
KITTYBUILD_INSTALL_PATH=%s
KITTYBUILD_BIN_PATH=%s" \
		"$INSTALL_PATH" \
		"$BIN_PATH" \
		> "$INSTALL_PATH/wrapper.sh"

	chmod +x "$BIN_PATH/*"

	cp src/* "$INSTALL_PATH"

	ln -sf "$INSTALL_PATH/interpreter.sh" "$BIN_PATH"
}

install_kittybuild "$@"
