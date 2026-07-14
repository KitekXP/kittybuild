# shellcheck shell=dash

# shellcheck source=extra.sh
# shellcheck source=parallel.sh

pass() {
	unfatal_error
	if try ! func_exists "$1"
	then
		error "Recipe $1 not found!" 1
	else
		info "Using recipe $1."
	fi
	fatal_error
}
