# shellcheck source=extra.sh
# shellcheck source=parallel.sh

parse_kittyguide() {
	export CALLED_RECIPE="$1"
	if try ! func_exists "$CALLED_RECIPE"
	then
		error "Recipe $CALLED_RECIPE not found!" 1
	else
		info "Building recipe $CALLED_RECIPE."
		export EXECUTING_KITTYGUIDE=true
		"$CALLED_RECIPE"
		export EXECUTING_KITTYGUIDE=false
	fi
}
