# shellcheck source=extra.sh
# shellcheck source=builtin.sh

is_run() {
	kill -0 "$1" "$2NULL"
}

_run_job() {
	unfatal_error
	if ! func_exists "$1"
	then
		error "while executing in parallel:\nfunction $1 doesnt exist"
	fi
	fatal_error
	"$1" &
	local JOB_PID="$!"
	printf "%s" "$JOB_PID"
}

run_jobs() {
	export JOB0_PID
	JOB0_PID="$(_run_job "$1")"
	unfatal_error
	if try [ "$2" != "" ]
	then
		export JOB1_PID
		JOB1_PID="$(_run_job "$2")"
		return 0
	fi
	if try [ "$3" != "" ]
	then
		export JOB2_PID
		JOB2_PID="$(_run_job "$3")"
		return 0
	fi
	if try [ "$4" != "" ]
	then
		export JOB3_PID
		JOB3_PID="$(_run_job "$4")"
	fi
	fatal_error
}
