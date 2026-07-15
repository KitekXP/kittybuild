#C
###############################################################
compile_c() {
	local      SRC="$1"

	local  OUT_DIR="$2"

	local     NAME="${SRC##*/}"
	local      OUT="${NAME%.*}.o"

	local LIBFLAG=""
	if try [ "$TYPE" = "lib-static" ] || try [ "$TYPE" = "lib-dynamic" ]
	then
		local LIBFLAG="-c"
	fi

	mkdir -p "$OUT_DIR"

	info "Compiling C: $SRC -> $OUT_DIR/$OUT..."
	"$CC" "$CFLAGS" -c "$SRC" -o "$OUT_DIR/$OUT" 
}

link_c() {
	local  IN_DIR="$1"
	local OUT_DIR="$2"
	local     OUT="$3"

	local LIBFLAG=""
	if try [ "$TYPE" = "lib-dynamic" ]
	then
		local LIBFLAG="-fPIC -shared"
	fi

	mkdir -p "$OUT_DIR"

	if try [ "$TYPE" = "lib-static" ]
	then
		"$AR" rcs "$OUT_DIR/$OUT" "$IN_DIR"/*.o
		return 0
	fi
	info "Linking C: $IN_DIR/* -> $OUT_DIR/$OUT..."
	"$CC" "$LDFLAGS" "$LIBFLAG" "$IN_DIR"/*.o -o "$OUT_DIR/$OUT"
}

#RUST
###############################################################
compile_rust() {
	local PROFILE="$1"

	info "Building rust project in $PWD using cargo..."

	if try [ "$PROFILE" = "release" ]
	then
		cargo build --release
	else
		cargo build
	fi
}

install_rust() {
	info "Installing rust project in $PWD using cargo..."

	cargo install
}

#GO
###############################################################
compile_go() {
	SRC="$1"
	OUT_DIR="$2"
	OUT="$3"
	info "Compiling go: $SRC -> $OUT_DIR/$OUT..."
	go build -cflags="$CFLAGS" -ldflags="$LDFLAGS" -o "$OUT_DIR/$OUT" "$SRC"
}
