include (../../shared.pri)

HEADERS += \
    filter_mutualinfo.h \
    alignset.h \
    levmarmethods.h \
    mutual.h \
    parameters.h \
    pointCorrespondence.h \
    pointOnLayer.h \
    shutils.h \
    solver.h

SOURCES += \
    filter_mutualinfo.cpp \
    alignset.cpp  \
    levmarmethods.cpp  \
    mutual.cpp  \
    parameters.cpp   \
    pointCorrespondence.cpp  \
    solver.cpp

TARGET = filter_mutualinfo

INCLUDEPATH *= \
    $$MESHLAB_EXTERNAL_DIRECTORY/levmar-2.3 \
    $$VCGDIR/wrap/newuoa/include
