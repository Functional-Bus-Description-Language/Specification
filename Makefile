TITLE = FBDL

BUILD_DIR = build/

SRCS = \
	src/defs.ms \
	src/config.ms \
	src/participants.ms \
	src/overview.ms \
	src/references.ms \
	src/lexical_elements.ms \
	src/data_types.ms \
	src/expressions.ms \
	src/functionalities/functionalities.ms \
	src/functionalities/block.ms \
	src/functionalities/bus.ms \
	src/functionalities/config.ms \
	src/functionalities/mask.ms \
	src/functionalities/memory.ms \
	src/functionalities/param.ms \
	src/functionalities/proc.ms \
	src/functionalities/return.ms \
	src/functionalities/static.ms \
	src/functionalities/status.ms \
	src/functionalities/stream.ms \
	src/parametrization.ms \
	src/scope_and_visibility.ms \
	src/grouping.ms \
	src/toc.ms

# Build targets
$(TITLE).pdf: $(BUILD_DIR)$(TITLE).ms src/cover.ms | .build-dir
	@pdfroff -mspdf --stylesheet=src/cover.ms -p -t $< > $@

$(BUILD_DIR)$(TITLE).ms: $(SRCS) | .build-dir
	@cat $(SRCS) > $@

.build-dir:
	@mkdir -p $(BUILD_DIR)

.PHONY: clean
clean:
	@rm -f -r $(BUILD_DIR)

.PHONY: show
show:
	@evince $(TITLE).pdf > /dev/null 2>&1 &
