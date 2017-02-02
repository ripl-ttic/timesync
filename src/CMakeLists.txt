add_definitions(-std=gnu99)

add_executable(er-timesync main.c)

target_link_libraries (er-timesync 
    ${LCMTYPES_LIBS})

pods_use_pkg_config_packages(er-timesync
    lcm 
    glib-2.0 
    bot2-core
    lcmtypes_er-lcmtypes)

# make exeutables public
pods_install_executables(er-timesync)
