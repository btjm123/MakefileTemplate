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

# TARGETS
create:
	mkdir build

build: create $(BUILD)/main.o $(BUILD)/lib.o
	$(CXX_COMPILER_CALL) $(BUILD)/main.o $(BUILD)/lib.o -o $(BUILD)/$(EXECUTABLE_NAME)

# $< selects the prequsite file
# $@ selects the target filename
$(BUILD)/main.o: $(SOURCE)/main.cc
	$(CXX_COMPILER_CALL) -c $< -o $@

$(BUILD)/lib.o: $(SOURCE)/lib.cc
	$(CXX_COMPILER_CALL) -c $< -o $@

execute:
	./$(BUILD)/$(EXECUTABLE_NAME)

clean:
	rm -rf $(BUILD)

