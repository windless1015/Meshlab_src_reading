include (../general.pri)

QT += opengl
QT += xml
QT += network

TEMPLATE = lib
TARGET = meshlab-common
DEPENDPATH += .

DESTDIR = $$MESHLAB_DISTRIB_DIRECTORY/lib

win32-msvc:CONFIG += staticlib
win32-g++:DLLDESTDIR = $$MESHLAB_DISTRIB_DIRECTORY/lib

linux:CONFIG += dll

INCLUDEPATH *= \
	../.. \
	$$$$MESHLAB_EXTERNAL_DIRECTORY/easyexif \
	$$VCGDIR \
	$$EIGENDIR

!CONFIG(system_glew) {
	INCLUDEPATH *= $$GLEWDIR/include
	GLEWCODE = $$GLEWDIR/src/glew.c
}

!CONFIG(system_glew) {
	SOURCES += $$GLEWCODE
	DEFINES += GLEW_STATIC
}

message(MeshLab Version: $$MESHLAB_VERSION)

# Input
HEADERS += 	\
	globals.h \
	plugins/containers/generic_container_iterator.h \
	plugins/containers/decorate_plugin_container.h \
	plugins/containers/edit_plugin_container.h \
	plugins/containers/filter_plugin_container.h \
	plugins/containers/io_plugin_container.h \
	plugins/containers/render_plugin_container.h \
	plugins/interfaces/meshlab_plugin.h \
	plugins/interfaces/meshlab_plugin_logger.h \
	plugins/interfaces/decorate_plugin.h \
	plugins/interfaces/edit_plugin.h \
	plugins/interfaces/filter_plugin.h \
	plugins/interfaces/io_plugin.h \
	plugins/interfaces/render_plugin.h \
	plugins/meshlab_plugin_type.h \
	plugins/plugin_manager.h \
	ml_document/helpers/mesh_document_state_data.h \
	ml_document/helpers/mesh_model_state_data.h \
	ml_document/base_types.h \
	ml_document/cmesh.h \
	ml_document/mesh_model.h \
	ml_document/mesh_model_state.h \
	ml_document/mesh_document.h \
	ml_document/raster_model.h \
	ml_document/render_raster.h \
	ml_shared_data_context/ml_plugin_gl_context.h \
	ml_shared_data_context/ml_scene_gl_shared_data_context.h \
	ml_shared_data_context/ml_shared_data_context.h \
	parameters/rich_parameter_list.h \
	parameters/value.h \
	parameters/rich_parameter.h \
	python/function.h \
	python/function_parameter.h \
	python/function_set.h \
	python/python_utils.h \
	utilities/eigen_mesh_conversions.h \
	utilities/file_format.h \
	utilities/load_save.h \
	GLExtensionsManager.h \
	filterscript.h \
	GLLogStream.h \
	mlexception.h \
	mlapplication.h \
	ml_selection_buffers.h


SOURCES += \
	globals.cpp \
	plugins/containers/decorate_plugin_container.cpp \
	plugins/containers/edit_plugin_container.cpp \
	plugins/containers/filter_plugin_container.cpp \
	plugins/containers/io_plugin_container.cpp \
	plugins/containers/render_plugin_container.cpp \
	plugins/interfaces/meshlab_plugin_logger.cpp \
	plugins/interfaces/decorate_plugin.cpp \
	plugins/interfaces/filter_plugin.cpp \
	plugins/interfaces/io_plugin.cpp \
	plugins/meshlab_plugin_type.cpp \
	plugins/plugin_manager.cpp \
	ml_document/helpers/mesh_document_state_data.cpp \
	ml_document/cmesh.cpp \
	ml_document/mesh_model.cpp \
	ml_document/mesh_model_state.cpp \
	ml_document/mesh_document.cpp \
	ml_document/raster_model.cpp \
	ml_document/render_raster.cpp \
	ml_shared_data_context/ml_plugin_gl_context.cpp \
	ml_shared_data_context/ml_scene_gl_shared_data_context.cpp \
	ml_shared_data_context/ml_shared_data_context.cpp \
	parameters/rich_parameter.cpp \
	parameters/rich_parameter_list.cpp \
	parameters/value.cpp \
	python/function.cpp \
	python/function_parameter.cpp \
	python/function_set.cpp \
	python/python_utils.cpp \
	utilities/eigen_mesh_conversions.cpp \
	utilities/load_save.cpp \
	GLExtensionsManager.cpp \
	filterscript.cpp \
	GLLogStream.cpp \
	mlapplication.cpp \
	searcher.cpp \
	ml_selection_buffers.cpp \
	$$MESHLAB_EXTERNAL_DIRECTORY/easyexif/exif.cpp

RESOURCES += \
	meshlab-common.qrc

macx:QMAKE_POST_LINK = "\
	if [ -d  $$MESHLAB_DISTRIB_DIRECTORY/meshlab.app/Contents/Frameworks/ ]; \
	then  \
		echo "Copying";  \
	else  \
		mkdir -p $$MESHLAB_DISTRIB_DIRECTORY/meshlab.app/Contents/Frameworks;  \
	fi;   \
	cp $$MESHLAB_DISTRIB_DIRECTORY/lib/libmeshlab-common.* $$MESHLAB_DISTRIB_DIRECTORY/meshlab.app/Contents/Frameworks/ ;\
#	if [ -d ../external/ ];\
#	then \
#		echo "ok external dir exists"; \
#	else \
#		ln -s ../../meshlab/src/external ../external;\
#		echo "linked external dir"; \
#	fi;\
#	if [ -d $$MESHLAB_DISTRIB_DIRECTORY/shaders/ ];\
#	then \
#		echo "ok shader dir exists"; \
#	else \
#		ln -s ../../../meshlab/src/distrib/shaders ../distrib/shaders ;\
#		echo "linked shader dir"; \
#	fi;\
	"
