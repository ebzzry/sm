.PHONY: all drv

all:
	rsync -avz --delete $$PWD user@closinghelper:src

drv:
	nix-instantiate . --indirect --add-root $$PWD/shell.drv

