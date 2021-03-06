include(../ext_common.pri)
TEMPLATE = lib
TARGET = openctm
CONFIG += staticlib
DEPENDPATH += .
INCLUDEPATH += ./lib ./lib/liblzma

win32-msvc:QMAKE_CXXFLAGS += /nologo /Ox /c /DOPENCTM_STATIC /D_CRT_SECURE_NO_WARNINGS
win32-msvc:DEFINES += OPENCTM_STATIC

win32-g++:QMAKE_CXXFLAGS += -O3 -c -std=c99 -pedantic
win32-g++:DEFINES += OPENCTM_STATIC
linux-g++:QMAKE_CXXFLAGS += -O3 -c -std=c99 -pedantic
linux-g++:DEFINES += OPENCTM_STATIC

# Input
SOURCES += \
    lib/openctm.c \
    lib/stream.c \
    lib/compressRAW.c \
    lib/compressMG1.c \
    lib/compressMG2.c \
    lib/liblzma/Alloc.c \
    lib/liblzma/LzFind.c \
    lib/liblzma/LzmaDec.c \
    lib/liblzma/LzmaEnc.c \
    lib/liblzma/LzmaLib.c
