# VARIABLES
EXECUTABLE_NAME = main
ENABLE_WARNINGS ?= 1
WARNINGS_AS_ERROR ?= 0
DEBUG ?= 1

INCLUDE = include
BUILD = build
SOURCE = src

CXX = g++ # which compiler
ifeq ($(ENABLE_WARNINGS), 1)
CXX_WARNINGS = -Wall -Wextra
else
CXX_WARNINGS =
endif

ifeq ($(WARNINGS_AS_ERROR), 1)
CXX_WARNINGS += -Werror
endif

CXX_FLAGS = $(CXX_WARNINGS) -std=c++17 #compiler flags
CPP_FLAGS = -I $(INCLUDE)
LDFLAGS = -lmath #linker flags
CXX_COMPILER_CALL = $(CXX) $(CXX_FLAGS) $(CPP_FLAGS)

ifeq ($(DEBUG), 1)
CXX_FLAGS += -g -O0 # add debug symbols and optimization lvl 1
EXECUTABLE_NAME = mainDebug
else
CXX_FLAGS += -O3 # highest optimization
EXECUTABLE_NAME = mainRelease
endif

CXX_SOURCES = $(wildcard $(SOURCE)/*.cc)
CXX_OBJECTS = $(patsubst $(SOURCE)/%.cc, $(BUILD)/%.o, $(CXX_SOURCES))

# TARGETS
all: create build

create:
	@mkdir -p build

build: create $(CXX_OBJECTS)
	$(CXX_COMPILER_CALL) $(CXX_OBJECTS) -o $(BUILD)/$(EXECUTABLE_NAME)

# $< selects the prequsite file
# $@ selects the target filename

$(BUILD)/%.o: $(SOURCE)/%.cc
	$(CXX_COMPILER_CALL) -c $< -o $@

execute:
	./$(BUILD)/$(EXECUTABLE_NAME)

clean:
	rm -rf $(BUILD)

# forces the target names to be out of date
.PHONY: all create build execute clean

