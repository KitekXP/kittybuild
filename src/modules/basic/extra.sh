export OUT2NULL="> /dev/null"
export ERR2OUT="2>$1"

# Select shanenigans (Holy gd reference)
export OG_PS3="$PS3"

set_select() {
	export PS3="$1"
}

rst_select() {
	export PS3="$OG_PS3"
}

func_exists() {
	command -v "$1" "$2NULL" "$ERR2OUT"
}

save2logs() {
	mkdir -p "$PWD/logs"
	DATE=$(date +"%Y/%M/%D|%H:%M:%S")
	"$1" | tee "$PWD/logs/$DATE.log"
}
