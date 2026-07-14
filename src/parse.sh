# shellcheck shell=dash
# shellcheck source=builtin.sh

pass() {
	if ! command -v "$1" >/dev/null 2>&1
	then
		error "Recipe $1 not found!" 1
	else
		info "Using recipe $1."
		export NOT_GUIDE=false
		"$1"
	fi
}
