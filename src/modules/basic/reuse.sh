reusable() {
	if try [ -f "$1" ]
	then
		try return 1
	else
		return 0
	fi
}
