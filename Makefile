# 

OS  = $(shell uname -s)
PWD = $(shell pwd)

SOURCES     = $(wildcard src/*.cc)
OBJECTS     = $(patsubst src/%.cc, build/%.o, $(SOURCES))
INCLUDEDIRS = -Isrc

CXXFLAGS    = $(INCLUDEDIRS) #$(shell pkg-config --cflags eigen3)
LIBS        = 

# check if the OS string contains 'Linux'
ifneq (,$(findstring Linux, $(OS)))
	CC        = gcc
	CXX       = g++
	LIBS     += 
	CXXFLAGS += -g -std=c++11 $(WARN) -O2 -fPIC -Wall -Wpedantic -Wextra -Wno-comment $(RPATH)
	AR        = ar rcs
	LDCONFIG  = sudo ldconfig
endif

# check if the OS string contains 'MINGW'
ifneq (,$(findstring MINGW, $(OS)))
	LIBS     += 
	CXXFLAGS += -g -std=c++11 $(WARN) -O2 -fPIC -Wall -Wpedantic -Wextra -Wno-comment
	AR        = ar rcs
	LDCONFIG  = sudo ldconfig
endif

# check if the OS string contains 'Darwin'
ifneq (,$(findstring Darwin, $(OS)))
	LIBS       += 
	WARN        = -Wall -Wno-sign-compare -Wno-global-constructors -Wno-padded -Wno-documentation-unknown-command
	CC          = clang
	CXX         = clang++ -std=c++11 -g
	CXXFLAGS   += $(WARN) -O2 -fPIC
	AR          = libtool -static -o
	LDCONFIG    = 
	DYNAMIC_EXT = .dylib
endif

all: $(OBJECTS)

dir:
	mkdir -p build
	mkdir -p bin

doc:
	doxygen

build/%.o: src/%.cc
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -rf $(TARGET)
	rm -rf $(OBJECTS)

tests: $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(OBJECTS) tests/test1.cc -o bin/test1 $(LIBS)

run:
	./bin/test1


#
# That's All Folks!
#