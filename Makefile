# VARIABLES
EXECUTABLE_NAME = main

INCLUDE = include
BUILD = build
SOURCE = src

CXX = g++
CXX_FLAGS = -Wall -Wextra -std=c++17
CPP_FLAGS = -I $(INCLUDE)
LDFLAGS = -lmath
CXX_COMPILER_CALL = $(CXX) $(CXX_FLAGS) $(CPP_FLAGS)

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

