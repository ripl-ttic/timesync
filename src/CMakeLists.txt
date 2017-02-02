add_definitions(-std=gnu99)

add_executable(hr-timesync main.c)

target_link_libraries (hr-timesync 
    ${LCMTYPES_LIBS})

pods_use_pkg_config_packages(hr-timesync
    lcm 
    glib-2.0 
    bot2-core
    lcmtypes_hr-lcmtypes)

# make exeutables public
pods_install_executables(hr-timesync)
