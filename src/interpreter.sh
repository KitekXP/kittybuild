# shellcheck shell=dash

# shellcheck source=builtin.sh
# shellcheck source=parse.sh
# shellcheck source=compile.sh
# shellcheck source=extra.sh
# shellcheck input=builtin.sh

INSTALL_PATH=$HOME/.tools/kittybuild
export NOT_GUIDE=true

. "KITTYBUILD_INSTALL_PATH/builtin.sh"

fatal_error

. "$KITTYBUILD_INSTALL_PATH/extra.sh"
. "$KITTYBUILD_INSTALL_PATH/parse.sh"
. "$KITTYBUILD_INSTALL_PATH/compile.sh"
. "$KITTYBUILD_INSTALL_PATH/"

if [ ! try -f "./Kittyguide" ]
then
	error "Kittyguide not found in current directory!" 1
else
	info "Executing Kittyguide!"
fi

. "./Kittyguide"

pass "$@"

# Reset to before execution
rst_select
unfatal_error
