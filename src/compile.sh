# shellcheck shell=dash
# shellcheck source=builtin.sh

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
###############################################################

#RUST
###############################################################
compile_rust() {
    # $1 = Source directory (Cargo.toml location)
    # $2 = Build profile (debug or release)
    
    local PKG_DIR="$1"
    local PROFILE="$2"
    
    # Ensure profile is valid
    try [ -z "$PROFILE" ] && PROFILE="debug"
    
    info "Building project in $PKG_DIR with cargo..."
    
    # Run cargo build
    # Using --manifest-path allows you to point to a specific Cargo.toml
    # if it isn't in the current directory
    if try [ "$PROFILE" = "release" ]; then
        (cd "$PKG_DIR" && cargo build --release)
    else
        (cd "$PKG_DIR" && cargo build)
    fi
}
