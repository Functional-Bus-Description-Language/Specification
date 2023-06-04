TITLE = FBDL

BUILD_DIR = build/

SRCS = \
	src/defs.ms \
	src/config.ms \
	src/cover.ms\
	src/participants.ms \
	src/glossary.ms \
	src/overview.ms \
	src/references.ms \
	src/concepts/concepts.ms \
	src/concepts/properties.ms \
	src/concepts/instantiation.ms \
	src/concepts/addressing.ms \
	src/concepts/positive_logic.ms \
	src/concepts/dsl.ms \
	src/lexical_elements.ms \
	src/data_types.ms \
	src/expressions.ms \
	src/functionalities/functionalities.ms \
	src/functionalities/block.ms \
	src/functionalities/bus.ms \
	src/functionalities/config.ms \
	src/functionalities/irq.ms \
	src/functionalities/mask.ms \
	src/functionalities/memory.ms \
	src/functionalities/param.ms \
	src/functionalities/proc.ms \
	src/functionalities/return.ms \
	src/functionalities/static.ms \
	src/functionalities/status.ms \
	src/functionalities/stream.ms \
	src/parametrization/parametrization.ms \
	src/parametrization/constant.ms \
	src/parametrization/type_definition.ms \
	src/parametrization/type_extending.ms \
	src/scope_and_visibility.ms \
	src/grouping/grouping.ms \
	src/grouping/order.ms \
	src/grouping/irq.ms \
	src/grouping/param_and_return.ms \
	src/toc.ms

# Build targets
$(TITLE).pdf: $(BUILD_DIR)$(TITLE).ms | .build-dir
	@groff -ms -T pdf -p -t $< > $@

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
