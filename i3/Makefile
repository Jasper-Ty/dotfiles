CFG_FILES= $(sort $(wildcard *-*))
TARGET=config

config: $(CFG_FILES) clean
	rm -f config && tail -n +1 $(CFG_FILES) | sed -e 's/==>\s*\(.*\)\s*<==/##############\n# \1\n/g' > $(TARGET)

.PHONY: clean

clean: 
	rm -f config 2>&1 > /dev/null
