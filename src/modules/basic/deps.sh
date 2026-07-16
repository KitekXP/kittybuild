depends_on() {
	if try [ "$PARALLEL" = "true" ]
	then
		info "Running in parallel:\n" "$@"
		run_jobs "$@"
	else
		info "Running dependencies for $CALLED_RECIPE"
		for i in "$@"; do
			if func_exists "$i"
			then
				info "Running dependency $i..."
				"$i"
			else
				error "Fix your guide, dependency '$i' not found\!"
			fi
		done
	fi
}

reuse() {
	if try [ -f "$1" ]
	then
		try return 1
	else
		return 0
	fi
}
