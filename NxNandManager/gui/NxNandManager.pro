#-------------------------------------------------
#
# Project created by QtCreator 2019-02-22T12:38:11
#
#-------------------------------------------------

QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = NxNandManager
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11
CONFIG += console
CONFIG += static create_prl link_prl
CONFIG += object_parallel_to_source

QMAKE_CXXFLAGS += -fpermissive -std=c++0x -pthread
LIBS += -pthread

SOURCES += \
    ../NxFile.cpp \
    ../NxSave.cpp \
    ../lib/fatfs/diskio.cpp \
    ../lib/fatfs/ff.cpp \
    ../lib/fatfs/ffsystem.cpp \
    ../lib/fatfs/ffunicode.cpp \
    ../main.cpp \
    ../res/hactool/utils.c \
    ../res/hex_string.cpp \
    ../res/fat32.cpp \
    ../res/mbr.cpp \
    ../res/progress_info.cpp \
    ../res/utils.cpp \
    ../NxStorage.cpp \
    ../NxCrypto.cpp \
    ../NxPartition.cpp \
    ../NxHandle.cpp \
    ../res/win_ioctl.cpp \
    ../virtual_fs/filenode.cpp \
    ../virtual_fs/filenodes.cpp \
    ../virtual_fs/virtual_fs.cpp \
    ../virtual_fs/virtual_fs_helper.cpp \
    ../virtual_fs/virtual_fs_operations.cpp \
    emunand.cpp \
    explorer.cpp \
    hactoolnet.cpp \
    keyset.cpp \
    loading_widget.cpp \
    mainwindow.cpp \
    mount.cpp \
    properties.cpp \
    qutils.cpp \
    resizeuser.cpp \
    worker.cpp \
    opendrive.cpp \
    dump.cpp \
    progress.cpp \
    $$files(../lib/ZipLib/*.cpp, false) \
    $$files(../lib/ZipLib/detail/*.cpp, false) \
    $$files(../lib/ZipLib/extlibs/bzip2/*.c, false) \
    $$files(../lib/ZipLib/extlibs/lzma/*.c, false) \
    debug.cpp
HEADERS += \
    ../NxFile.h \
    ../NxNandManager.h \
    ../NxSave.h \
    ../lib/fatfs/diskio.h \
    ../lib/fatfs/ff.h \
    ../lib/fatfs/ffconf.h \
    ../res/hactool/ivfc.h \
    ../res/hactool/settings.h \
    ../res/hactool/types.h \
    ../res/hactool/utils.h \
    ../res/hex_string.h \
    ../res/fat32.h \
    ../res/mbr.h \
    ../res/progress_info.h \
    ../res/utils.h \
    ../res/types.h \
    ../NxStorage.h \
    ../NxCrypto.h \
    ../res/win_ioctl.h \
    ../virtual_fs/filenode.h \
    ../virtual_fs/filenodes.h \
    ../virtual_fs/virtual_fs.h \
    ../virtual_fs/virtual_fs_helper.h \
    ../virtual_fs/virtual_fs_operations.h \
    explorer.h \
    gui.h \
    hactoolnet.h \
    keyset.h \
    loading_widget.h \
    mainwindow.h \
    mount.h \
    properties.h \
    ../NxPartition.h \
    ../NxHandle.h \
    qutils.h \
    resizeuser.h \
    worker.h \
    opendrive.h \
    dump.h \
    progress.h \
    emunand.h \
    $$files(../lib/ZipLib/*.h, false) \
    $$files(../lib/ZipLib/utils/*.h, false) \
    $$files(../lib/ZipLib/detail/*.h, false) \
    $$files(../lib/ZipLib/extlibs/bzip2/*.h, false) \
    $$files(../lib/ZipLib/extlibs/lzma/*.h, false) \
    debug.h

CONFIG(STATIC) {
    SOURCES += $$files(../lib/ZipLib/extlibs/zlib/*.c, false)
    HEADERS += $$files(../lib/ZipLib/extlibs/zlib/*.h)
}
CONFIG(DYNAMIC) {
    SOURCES += $$files(../lib/ZipLib/extlibs/zlib/*.c, false)
    HEADERS += $$files(../lib/ZipLib/extlibs/zlib/*.h)
}

FORMS += \
    emunand.ui \
    explorer.ui \
    loading_widget.ui \
    mainwindow.ui \
    mount.ui \
    opendrive.ui \
    keyset.ui \
    properties.ui \
    resizeuser.ui \
    dump.ui \
    progress.ui \
    debug.ui

# Default rules for deployment.
TEMPLATE = app
TARGET = NxNandManager
CONFIG += c++11 release

# Dossiers sources et en-têtes
SOURCES += main.cpp \
           ../NxFile.cpp \
           ../NxSave.cpp \
           ../virtual_fs/virtual_fs.cpp \
           # Ajoutez les autres fichiers sources ici
           
HEADERS += ../NxFile.h \
           ../NxSave.h \
           ../virtual_fs/virtual_fs.h \
           # Ajoutez les autres fichiers d'en-têtes ici

# Détection de l'architecture
CONFIG(ARCH32) {
    DEFINES += ARCH32
    # Chemin vers OpenSSL
    OPENSSL_LIB_PATH = $$PWD/../../../OpenSSL_mingw32
    LIBS += -L$$PWD/../virtual_fs/dokan/x86/lib/ -ldokan1
}
CONFIG(ARCH64) {
    DEFINES += ARCH64
    # Chemin vers OpenSSL
    OPENSSL_LIB_PATH = $$PWD/../../../OpenSSL_mingw64
    LIBS += -L$$PWD/../virtual_fs/dokan/x64/lib/ -ldokan1
}

# Définir les bibliothèques et préprocesseurs selon le système
unix: {
    LIBS += -lfuse
    DEFINES += USE_FUSE
}
win32: {
    LIBS += -L$$PWD/../virtual_fs/dokan/x64/lib/ -ldokan1
    DEFINES += USE_DOKAN
}

# Inclure les chemins des bibliothèques Qt
INCLUDEPATH += $$OPENSSL_LIB_PATH/include \
               $$PWD/../virtual_fs \
               $$PWD/../NxPartition
               
LIBS += -L$$OPENSSL_LIB_PATH/lib -lssl -lcrypto
