# shellcheck shell=dash

export NULL=">/dev/null"
export SHOW_ALL="2>$1"

info() {
	CURRENT_TIME=$(date +"%H:%M:%S.%3N")
	printf "[%s/INFO] %s\n" "$CURRENT_TIME" "$@"
}

warn() {
	CURRENT_TIME=$(date +"%H:%M:%S.%3N")
	printf "[%s/WARNING] %s\n" "$CURRENT_TIME" "$@"
}

error() {
	CURRENT_TIME=$(date +"%H:%M:%S.%3N")
	printf "[%s/ERROR] %s\n" "$CURRENT_TIME" "$@"
}

fatal_error() {
	set -e
}

unfatal_error() {
	set +e
}
