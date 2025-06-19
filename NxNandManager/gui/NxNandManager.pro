#-------------------------------------------------
#
# Project created by Qt Creator 2019-02-22T12:38:11
#
#-------------------------------------------------

QT       += core gui network widgets winextras

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11 console static create_prl link_prl object_parallel_to_source qt
DEFINES += QT_DEPRECATED_WARNINGS

TEMPLATE = app
TARGET   = NxNandManager

# OpenSSL paths based on architecture
win32:CONFIG(ARCH64): OPENSSL_LIB_PATH = $$PWD/../../../OpenSSL_mingw64
win32:CONFIG(ARCH32): OPENSSL_LIB_PATH = $$PWD/../../../OpenSSL_mingw32

# Compiler flags
QMAKE_CXXFLAGS += -fpermissive -std=c++0x -pthread
LIBS            += -pthread

# Main source files
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
    debug.cpp \
    $$files(../lib/ZipLib/*.cpp, false) \
    $$files(../lib/ZipLib/detail/*.cpp, false) \
    $$files(../lib/ZipLib/extlibs/bzip2/*.c, false) \
    $$files(../lib/ZipLib/extlibs/lzma/*.c, false) \
    $$files(../lib/ZipLib/extlibs/zlib/*.c, false) \
    $$files(../lib/ZipLib/utils/*.cpp, false)

# Header files
HEADERS += \
    ../NxFile.h \
    ../NxNandManager.h \
    ../NxSave.h \
    ../NxPartition.h \
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
    resizeuser.h \
    worker.h \
    opendrive.h \
    dump.h \
    progress.h \
    emunand.h \
    debug.h \
    qutils.h \
    $$files(../lib/ZipLib/*.h, false) \
    $$files(../lib/ZipLib/utils/*.h, false) \
    $$files(../lib/ZipLib/detail/*.h, false) \
    $$files(../lib/ZipLib/extlibs/bzip2/*.h, false) \
    $$files(../lib/ZipLib/extlibs/lzma/*.h, false) \
    $$files(../lib/ZipLib/extlibs/zlib/*.h, false)# UI forms
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

# Include paths
INCLUDEPATH += $$PWD/../virtual_fs \
               $$PWD/../NxPartition \
               $$[QT_INSTALL_HEADERS]/QtWinExtras \
               $$OPENSSL_LIB_PATH/include \
               $$PWD/../virtual_fs/dokan/include

# External libraries
LIBS += -L$$OPENSSL_LIB_PATH/lib -lssl -lcrypto

# Dokan integration
win32 {
    LIBS    += -L$$PWD/../virtual_fs/dokan/x64/lib -ldokan1
    LIBS    += -lws2_32 -lcrypt32
    DEFINES += USE_DOKAN
}

# FUSE integration
unix {
    LIBS    += -lfuse
    DEFINES += USE_FUSE
}
