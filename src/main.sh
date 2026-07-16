export EXECUTING_KITTYGUIDE=false

. "$KITTYBUILD_INSTALL_PATH/load_modules.sh"

set -e
info "Every error is fatal now\!"

info "Loading basic modules"
load_basic "$KITTYBUILD_INSTALL_PATH"

run_kittyguide "$1"

info "Reseting to original \$PS3 and nonfatal errors"
try rst_select >/dev/null 2>&1
unfatal_error
