get_time() {
	date +"%H:%M:%S.%3N"
}

info() {
	printf "\033[0m[\033[0m%s\033[1m/\033[0;34mINFO]\033[0m %s%s%s%s%s\n" "$(get_time)" "$@"
}

warn() {
	printf "\033[33m[\033[0m%s\033[1m/\033[0;33mWARNING]\033[0m %s%s%s%s%s\n" "$(get_time)" "$@"
}

error() {
	printf "\033[31m[\033[0m%s\033[1m/\033[0;31mERROR]\033[0m %s%s%s%s%s\n" "$(get_time)" "$@"
}

fatal_error() {
	set -e
}

unfatal_error() {
	set +e
}

try() {
    unfatal_error
    "$@"
    local status=$?
    fatal_error
    return $status
}
