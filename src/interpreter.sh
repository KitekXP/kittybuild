# shellcheck shell=dash

# shellcheck source=builtin.sh
# shellcheck source=parse.sh
# shellcheck source=compile.sh
# shellcheck source=extra.sh

INSTALL_PATH=$HOME/.tools/kittybuild
export NOT_GUIDE=true

. "$INSTALL_PATH/builtin.sh"

fatal_error

. "$INSTALL_PATH/extra.sh"
. "$INSTALL_PATH/parse.sh"
. "$INSTALL_PATH/compile.sh"

if [ try ! -f "./kittyguide" ]
then
	error "Kittyguide not found in current directory!" 1
else
	info "Executing kittyguide!"
fi

. "./kittyguide"

pass "$@"

# Reset to before execution
rst_select
unfatal_error
