QT += quick sql


CONFIG += c++20

SOURCES += \
    source/core.cpp \
    source/database.cpp \
    source/main.cpp \
    source/messageservice.cpp \
    source/network.cpp \
    source/parse.cpp

RESOURCES += source/qml.qrc \
    source/images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    source/core.h \
    source/database.h \
    source/messageservice.h \
    source/network.h \
    source/parse.h \
    source/sqlTables.h

DISTFILES +=
