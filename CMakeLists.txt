cmake_minimum_required(VERSION 3.16)
project(fanWatch)

set(CMAKE_CXX_STANDARD 17)

#find_package(PkgConfig REQUIRED)
#pkg_check_modules(glib-2.0 REQUIRED IMPORTED_TARGET glib-2.0)
find_package(PkgConfig REQUIRED)
pkg_check_modules(LIB_NOTIFY REQUIRED libnotify)
pkg_check_modules(GLIB2 REQUIRED glib-2.0)

pkg_check_modules(GTK REQUIRED IMPORTED_TARGET "gtk+-2.0")

add_compile_options(-I/usr/include/glib-2.0 -lnotify)
add_executable(fanWatch main.cpp ${SRC})
target_link_libraries(fanWatch PRIVATE PkgConfig::GTK)
#target_link_libraries(fanWatch PRIVATE libnotify-dev)
target_link_libraries(fanWatch PRIVATE notify)

#

target_link_libraries(fanWatch PUBLIC ${GLIB_LIBRARIES})
target_include_directories(fanWatch PUBLIC ${GLIB_INCLUDE_DIRS})

target_link_libraries(fanWatch PUBLIC ${WNCK_LIBRARIES})
target_include_directories(fanWatch PUBLIC ${WNCK_INCLUDE_DIRS})

target_link_libraries(fanWatch PUBLIC ${NOTIFY_LIBRARIES})
target_include_directories(fanWatch PUBLIC ${NOTIFY_INCLUDE_DIRS})