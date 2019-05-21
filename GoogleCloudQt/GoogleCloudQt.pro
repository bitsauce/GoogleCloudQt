QT += core
QT -= gui

CONFIG += c++11

TARGET = GoogleCloudQt
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp
HEADERS += main.h

# Needed for protoc generated files to work
DEFINES += WIN32 _WINDOWS \
    _WIN32_WINNT=0x0600 PB_ENABLE_MALLOC NOMINMAX \
    FIRESTORE_EXPORT=__declspec(dllimport) FIRESTORE_VERBOSE

win32:CONFIG(release, debug|release): QMAKE_CXXFLAGS_DEBUG += /MD
win32:CONFIG(debug, debug|release):   QMAKE_CXXFLAGS_DEBUG += /MDd

# Add some missing windows dependencies
LIBS += -lws2_32 -ladvapi32

# Set vcpkg vars
VCPKG_TRIPLET = x64-windows-v140
win32:CONFIG(release, debug|release): VCPKG_LIBS_DIR = $$(VCPKG_ROOT)/installed/$${VCPKG_TRIPLET}/lib
win32:CONFIG(debug, debug|release):   VCPKG_LIBS_DIR = $$(VCPKG_ROOT)/installed/$${VCPKG_TRIPLET}/debug/lib
VCPKG_INCLUDE_DIR = $$(VCPKG_ROOT)/installed/$${VCPKG_TRIPLET}/include

message(VCPKG Config)
message(VCPKG_TRIPLET="$${VCPKG_TRIPLET}")
message(VCPKG_LIBS_DIR="$${VCPKG_LIBS_DIR}")
message(VCPKG_INCLUDE_DIR="$${VCPKG_LIBS_DIR}")

# Add Google Storage dependencies
LIBS += \
    -L$${VCPKG_LIBS_DIR} -lgoogle_cloud_cpp_common \
    -L$${VCPKG_LIBS_DIR} -lstorage_client \
    -L$${VCPKG_LIBS_DIR} -llibcurl \
    -L$${VCPKG_LIBS_DIR} -llibeay32 \
    -L$${VCPKG_LIBS_DIR} -lcrc32c

# Add Firestore/gRPC dependencies
win32:CONFIG(release, debug|release): LIBS += \
    -L../third_party/firestore/x64/Release -lFirestore \
    -L$${VCPKG_LIBS_DIR} -llibprotobuf
else:win32:CONFIG(debug, debug|release): LIBS += \
    -L../third_party/firestore/x64/Debug -lFirestore \
    -L$${VCPKG_LIBS_DIR} -llibprotobufd

INCLUDEPATH += $${VCPKG_INCLUDE_DIR} ../third_party/firestore/protos/cpp ../third_party/firestore/source
DEPENDPATH += $${VCPKG_INCLUDE_DIR} ../third_party/firestore/protos/cpp ../third_party/firestore/source

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
