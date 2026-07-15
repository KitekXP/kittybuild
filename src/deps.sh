depends_on() {
	if try [ "$PARALLEL" = "true" ]
	then
		info "Running in parallel:\n" "$@"
		run_jobs "$@"
	else
		info "Running without parallel"
		while try [ "$$i" != "" ]
		do
			if try func_exists
			then
				"$$i"
			else
				error "Wrongly written kittyguide, found nonexistent dependencies!"
			fi
		done
	fi
}
