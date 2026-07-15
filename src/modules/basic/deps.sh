depends_on() {
	if try [ "$PARALLEL" = "true" ]
	then
		info "Running in parallel:\n" "$@"
		run_jobs "$@"
	else
		info "Running $$i as a dependency for $CALLED_RECIPE"
		local i=1
		while try [ "$$i" != "" ]
		do
			if try func_exists
			then
				"$$i"
			else
				error "Wrongly written kittyguide, found nonexistent dependencies!"
			fi
			i=i+1
		done
	fi
}
