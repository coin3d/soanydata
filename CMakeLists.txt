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

configure_file(config.h.cmake.in config.h)
configure_file(materials/materials.h.in materials/materials.h)

set(SO${GUI}_MATERIAL_FILES)
foreach(_style ${MATERIAL_COLLECTIONS})
	configure_file(materials/${_style}/${_style}.h.in materials/${_style}/${_style}.h)
	file(GLOB_RECURSE MATERIAL_COLLECTION_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ${_style}.*)
	foreach(COIN_INPUT_FILE_NAME ${MATERIAL_COLLECTION_FILES})
		get_filename_component(_number "${COIN_INPUT_FILE_NAME}" EXT)
		string(SUBSTRING ${_number} 1 -1 _number)
		string(REGEX MATCH "^[0-9]+$" _is_number ${_number})
		if(_is_number)
			string(TOUPPER "SO${GUI}_${_style}${_number}_IV_H" COIN_HEADER_DEF)
			set(COIN_TEXTVAR_NAME ${_style}${_number}_iv)
			file(READ "${COIN_INPUT_FILE_NAME}" f0)
			string(REGEX REPLACE "\\\\" "\\\\\\\\" f1 "${f0}")
			string(REGEX REPLACE "\"" "\\\\\"" f2 "${f1}")
			string(REGEX REPLACE "\r?\n" "\\\\n\"\n  \"" COIN_STR_SOURCE_CODE "${f2}")
			set(FLGENPATH "materials/${_style}/${_style}${_number}.h")
			configure_file(strfytemplate.cmake.in ${FLGENPATH})
			set(SO${GUI}_MATERIAL_FILES ${SO${GUI}_MATERIAL_FILES} ${FLGENPATH})
		endif()
	endforeach()
endforeach()

#install files
foreach(_header ${SO${GUI}_MATERIAL_FILES})
	get_filename_component(_install_dir ${_header} PATH)
	install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${_header} DESTINATION ${CMAKE_INSTALL_DATADIR}/${_install_dir})
endforeach()
