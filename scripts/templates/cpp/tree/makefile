CXX = g++
CXXFLAGS = -std=c++20 -Wall -Wextra -I/usr/include/doctest
CXXTESTFLAGS = -std=c++20 -Wall -Wextra -I/usr/include/doctest

SRC = main.cpp tree.h
TEST_SRC = test_tree.cpp tree.h

MAIN_EXE = main
TEST_EXE = test_tree

.PHONY: clean test all

all: $(MAIN_EXE)

$(MAIN_EXE): $(SRC)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(TEST_EXE): $(TEST_SRC)
	$(CXX) $(CXXTESTFLAGS) -o $@ $^

test: $(TEST_EXE)
	./$(TEST_EXE)

clean:
	rm -f $(TEST_EXE) $(MAIN_EXE) 

