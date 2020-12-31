QT += quick sql widgets

CONFIG += c++20

SOURCES += \
    sources/database.cpp \
    sources/databaseApi.cpp \
    sources/main.cpp \
    sources/messageservice.cpp \
    sources/network.cpp \
    sources/parse.cpp

RESOURCES += sources/qml.qrc \
             sources/images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    sources/database.h \
    sources/databaseApi.h \
    sources/messageservice.h \
    sources/network.h \
    sources/parse.h \
    sources/sqlTables.h

DISTFILES += \
    database.sqlite
