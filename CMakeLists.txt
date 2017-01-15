cmake_minimum_required(VERSION 3.6)

project(darknet)


SET(CUDA_64_BIT_DEVICE_CODE ON)
LIST(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_30,code=sm_30)
LIST(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_35,code=sm_35)
LIST(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_50,code=[sm_50,compute_50])
LIST(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_52,code=[sm_52,compute_52])

# packages
find_package(CUDA REQUIRED)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/../lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/../lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/../lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/../bin)
set(DARKNET_LIB ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

add_definitions(-DDEBUG -DOPENCV -DHAVE_OPENCV_VIDEOIO -DHAVE_OPENCV_IMGCODECS -DGPU -DCUDN)

set(INCLUDE_DIR /usr/local/include
        /usr/local/cuda/include)

FILE(GLOB SOURCE_FILES "src/*.c" "src/*.cpp" "src/*.cu")

include_directories(${INCLUDE_DIR})

link_directories(/usr/local/lib /usr/local/cuda/lib64)

#add_library(darknet ${SOURCE_FILES})
cuda_add_executable(darknet ${SOURCE_FILES})

LIST(APPEND CMAKE_CXX_FLAGS "-Wall -Wfatal-errors")


target_link_libraries(darknet
        m
        pthread
        opencv_imgcodecs
        opencv_imgproc
        opencv_features2d
        opencv_calib3d
        opencv_core
        opencv_highgui
        opencv_videoio
        opencv_objdetect
        opencv_video
        cuda cudart cublas curand cudnn
        )