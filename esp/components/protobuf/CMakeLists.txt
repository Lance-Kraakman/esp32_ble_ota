set(srcs "pb_common.c" "pb_decode.c" "pb_encode.c")

idf_component_register(SRCS ${srcs}
                    INCLUDE_DIRS ".")
