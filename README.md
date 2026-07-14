# Kittybuild
This is some build system I made in (POSIX + alias cmd) dash shell.

## Installation
You can `export` `BIN_PATH` and/or `INSTALL_PATH` to change installation paths.
Usage: `./install.sh`

## Todo
- Dependencies
- File checking/Reusing of existing files
- Support for more languages (Create issues if you want a specific language)
- QOL (Quality Of Life) features

## How it works
The tool checks for `kittyguide` in `.`, if found sources the file and executes the recipe passed in `$1`.

## Usage
The default recipe is all or build
	`kittybuild [recipe]`
Example:
	`kittybuild build`
	`kittybuild install`

## Contribution
I mean if you want, just fork the repo, mod it and create a pull request.
I'll try to review it in my free time.
