#!/bin/sh

if [ ! -n "${INSTALL_PATH+x}" ]
then
	INSTALL_PATH="$HOME/.tools/kittybuild"
fi

if [ ! -n "${BIN_PATH+x}" ]
then
	BIN_PATH="$HOME/.local/bin"
fi


# But is it possible with accurate hitboxes?

mkdir -p "$INSTALL_PATH" "$BIN_PATH"

chmod +x "$BIN_PATH/*"

cp src/* "$INSTALL_PATH"

ln -sf "$INSTALL_PATH/interpreter.sh" "$BIN_PATH"
