CFG_FILES= $(sort $(wildcard *.i3config))

config: $(CFG_FILES)
	rm -f config && cat $(CFG_FILES) > config
