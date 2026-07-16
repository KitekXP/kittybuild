# shellcheck source=builtin.sh
# shellcheck source=parse.sh
# shellcheck source=compile.sh
# shellcheck source=extra.sh



kittyguide_exists() {
	[ ! -f "$1/Kittyguide" ]
}

run_kittyguide() {
	if try _kittyguide_exists "."
	then
		info "Loading Kittyguide"
		parse_kittyguide "$1"
	else
		error "Kittyguide not found\!" 1
	fi
}
