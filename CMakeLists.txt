cmake_minimum_required(VERSION 3.6)
project(darknet)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/../lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/../lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/../lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/../bin)
set(DARKNET_LIB ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
#add_definitions(-DGPU -DCUDNN -DOPENCV -DDEBUG)

set(INCLUDE_DIR /usr/local/include
        /usr/local/cuda/include)

set(SD ./src)

set(SOURCE_FILES ${SD}/activation_layer.c
        ${SD}/activations.c ${SD}/art.c ${SD}/avgpool_layer.c ${SD}/batchnorm_layer.c
        ${SD}/blas.c ${SD}/batchnorm_layer.c ${SD}/box.c
        ${SD}/captcha.c ${SD}/cifar.c ${SD}/classifier.c ${SD}/coco.c ${SD}/col2im.c ${SD}/compare.c ${SD}/connected_layer.c ${SD}/convolutional_layer.c
        ${SD}/cost_layer.c ${SD}/crnn_layer.c ${SD}/crop_layer.c ${SD}/cuda.c
        ${SD}/darknet.c ${SD}/data.c ${SD}/deconvolutional_layer.c ${SD}/detection_layer.c ${SD}/detector.c ${SD}/dice.c ${SD}/dropout_layer.c ${SD}/demo.c
        ${SD}/gemm.c ${SD}/go.c ${SD}/gru_layer.c ${SD}/im2col.c ${SD}/image.c ${SD}/layer.c ${SD}/list.c ${SD}/local_layer.c
        ${SD}/matrix.c ${SD}/maxpool_layer.c
        ${SD}/network.c ${SD}/normalization_layer.c ${SD}/nightmare.c
        ${SD}/option_list.c
        ${SD}/parser.c
        ${SD}/region_layer.c ${SD}/reorg_layer.c ${SD}/rnn.c ${SD}/rnn_layer.c ${SD}/rnn_vid.c ${SD}/route_layer.c
        ${SD}/shortcut_layer.c ${SD}/softmax_layer.c ${SD}/super.c ${SD}/swag.c
        ${SD}/tag.c ${SD}/tree.c ${SD}/utils.c ${SD}/voxel.c ${SD}/writing.c ${SD}/yolo.c
        )

include_directories(${INCLUDE_DIR})

add_library(darknet ${SOURCE_FILES})