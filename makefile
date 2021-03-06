SHELL = /bin/bash
CC = g++
ALLFLAGS = -I./Headers -I/usr/include/freetype2 -fPIC -fvisibility=hidden -w -D XELAGRAPHICS_EXPORTS -lGLEW -lglfw -lfreetype
OFLAGS = -I./Headers -w -fPIC -fvisibility=hidden
TFLAGS = -shared -pedantic -march=native -ggdb3 -O2 -fwhole-program -Wl,-soname,libxelagraphics.so

TARGET = libxelagraphics.so
SRC_PATH = Source/
OBJ_PATH = ./
HEADER_PATH = Headers/
SOURCES = $(shell echo $(SRC_PATH)*/*.cpp)
HEADERS = $(shell echo $(HEADER_PATH)*.h)
OBJECTS_TMP = $(SOURCES:.cpp=.o)
OBJECTS = $(shell echo $(OBJECTS_TMP) | sed 's_$(SRC_PATH).*/_$(OBJ_PATH)_g')

PREFIX = $(DESTDIR/usr/local)
BINDIR = $(PREFIX/bin)

all: $(TARGET)

$(OBJECTS): $(SOURCES)
	$(CC) -c $(OFLAGS) $(ALLFLAGS) $(SOURCES)

$(TARGET): $(OBJECTS)
	$(CC) $(TFLAGS) $(ALLFLAGS) -o $(TARGET) *.o

.PHONY : clean
clean:
	rm *.o
