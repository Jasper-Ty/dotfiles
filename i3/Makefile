CFG_FILES= $(sort $(wildcard *.i3config))
TARGET=config

config: $(CFG_FILES)
	rm -f config && tail -n +1 $(CFG_FILES) | sed -e 's/==>\s*\(.*\)\..*\s*<==/##############\n# \1\n/g' > $(TARGET)

.PHONY: clean

clean: 
	rm -f config 2>&1 > /dev/null
