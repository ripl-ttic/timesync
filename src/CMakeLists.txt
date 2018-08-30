add_definitions(-std=gnu99)

add_executable(timesync main.c)

target_link_libraries (timesync
    ${LCMTYPES_LIBS})

pods_use_pkg_config_packages(timesync
    lcm
    glib-2.0
    bot2-core)

# make exeutables public
pods_install_executables(timesync)
