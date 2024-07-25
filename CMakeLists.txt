cmake_minimum_required(VERSION 3.29)
project(test_cuda LANGUAGES CXX CUDA)

add_executable(test_cuda main.cxx v3.cu)
