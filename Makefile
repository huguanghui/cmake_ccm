BUILD_DATE = $(shell date +"%Y%m%d")

.PHONY: help all

help:
	@echo "Usage:"
	@echo "     make all"
	@echo "     make clean"

all:
	@echo "make all"

clean:
	@echo "clean"
	@rm -rf output build_x86 build_ax615d build_t41
