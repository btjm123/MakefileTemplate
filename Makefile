# VARIABLES
EXECUTABLE_NAME = main
ENABLE_WARNING = 1
WARNINGS_AS_ERROR = 0
DEBUG = 1

INCLUDE = include
BUILD = build
SOURCE = src

CXX = g++
CXX_FLAGS = -Wall -Wextra -std=c++17
CPP_FLAGS = -I $(INCLUDE)
LDFLAGS = -lmath
CXX_COMPILER_CALL = $(CXX) $(CXX_FLAGS) $(CPP_FLAGS)

ifeq ($(DEBUG), 1)
CXX_FLAGS += -g -O0
EXECUTABLE_NAME = mainDebug
else
CXX_FLAGS += -O3
EXECUTABLE_NAME = mainRelease
endif

CXX_SOURCES = $(wildcard $(SOURCE)/*.cc)
CXX_OBJECTS = $(patsubst $(SOURCE)/%.cc, $(BUILD)/%.o, $(CXX_SOURCES))

# TARGETS
create:
	mkdir build

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
.PHONY: create build execute clean

