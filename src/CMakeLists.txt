add_executable( testu01_gateway testu01_gateway.cpp )
target_link_libraries( testu01_gateway ${TESTU01_LIBRARIES} )
set_property(TARGET testu01_gateway PROPERTY CXX_STANDARD 17)
