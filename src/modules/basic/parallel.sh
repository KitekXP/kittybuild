# shellcheck source=extra.sh
# shellcheck source=builtin.sh

running() {
	kill -0 "$1" >/dev/null 2>&1
}

_run_job() {
	if try ! func_exists "$1"
	then
		error "while executing in parallel:\nfunction $1 doesnt exist\!" 1
	fi
	"$1" &
	local JOB_PID="$!"
	printf "%s" "$JOB_PID"
}

run_jobs() {
	export JOB0_PID
	JOB0_PID="$(_run_job "$1")"
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
}
