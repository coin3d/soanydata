set(PACKAGE data)
set(VERSION "1.0.0")

set(MATERIAL_COLLECTIONS 
	artdeco
	autumn
	glass
	metal
	neon
	rococo
	santafe
	sheen
	silky
	spring
	summer
	tropical
	winter
)

# Conflict with config.h from So${Gui} not really useful
# configure_file(config.h.cmake.in config.h)
configure_file(materials/materials.h.in materials/materials.h)

foreach(_style ${MATERIAL_COLLECTIONS})
	configure_file(materials/${_style}/${_style}.h.in materials/${_style}/${_style}.h)
	file(GLOB_RECURSE MATERIAL_COLLECTION_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ${_style}.*)
	foreach(COIN_INPUT_FILE_NAME ${MATERIAL_COLLECTION_FILES})
		get_filename_component(_number "${COIN_INPUT_FILE_NAME}" EXT)
		string(SUBSTRING ${_number} 1 -1 _number)
		if(${_number} MATCHES "^[0-9]+$")
			string(TOUPPER "SO${GUI}_${_style}${_number}_IV_H" COIN_HEADER_DEF)
			set(COIN_TEXTVAR_NAME ${_style}${_number}_iv)
			file(READ "${COIN_INPUT_FILE_NAME}" f0)
			string(REGEX REPLACE "\\\\" "\\\\\\\\" f1 "${f0}")
			string(REGEX REPLACE "\"" "\\\\\"" f2 "${f1}")
			string(REGEX REPLACE "\r?\n" "\\\\n\"\n  \"" COIN_STR_SOURCE_CODE "${f2}")
			set(FLGENPATH "materials/${_style}/${_style}_${_number}.h")
			configure_file(strfytemplate.cmake.in ${FLGENPATH})
		endif()
	endforeach()
endforeach()
