# shellcheck shell=dash
# shellcheck source=builtin.sh
# shellcheck source=parse.sh
# shellcheck source=compile.sh

INSTALL_PATH=$HOME/.tools/kittybuild
export NOT_GUIDE=true

. "$INSTALL_PATH/builtin.sh"

fatal_error

. "$INSTALL_PATH/parse.sh"
. "$INSTALL_PATH/compile.sh"

if [ ! -f "./kittyguide" ]
then
	error "Kittyguide not found in current directory!" 1
else
	info "Executing kittyguide!"
fi

. "./kittyguide"

pass "$@"

unfatal_error
