# Minimial Replication of Failure to build CUDA project with mold linker

## Replication Instructions

1. Clone project, open in vscode, and run in devcontainer. This will ensure clean CUDA environmend and that appropriate cmake's etc are installed
1. run `mkdir build && cd build && cmake .. -DCMAKE_LINKER_TYPE=MOLD`
1. Output will be:
```
CMake Error at /usr/share/cmake-3.29/Modules/CMakeTestCXXCompiler.cmake:73 (message):
  The C++ compiler

    "/usr/bin/c++"

  is not able to compile a simple test program.

  It fails with the following output:

    Change Dir: '/workspaces/cuda-minimal/build/CMakeFiles/CMakeScratch/TryCompile-njZe6h'
    
    Run Build Command(s): /usr/bin/cmake -E env VERBOSE=1 /usr/bin/gmake -f Makefile cmTC_5efa6/fast
    /usr/bin/gmake  -f CMakeFiles/cmTC_5efa6.dir/build.make CMakeFiles/cmTC_5efa6.dir/build
    gmake[1]: Entering directory '/workspaces/cuda-minimal/build/CMakeFiles/CMakeScratch/TryCompile-njZe6h'
    Building CXX object CMakeFiles/cmTC_5efa6.dir/testCXXCompiler.cxx.o
    /usr/bin/c++    -o CMakeFiles/cmTC_5efa6.dir/testCXXCompiler.cxx.o -c /workspaces/cuda-minimal/build/CMakeFiles/CMakeScratch/TryCompile-njZe6h/testCXXCompiler.cxx
    Linking CXX executable cmTC_5efa6
    /usr/bin/cmake -E cmake_link_script CMakeFiles/cmTC_5efa6.dir/link.txt --verbose=1
    /usr/bin/c++ -fuse-ld=mold CMakeFiles/cmTC_5efa6.dir/testCXXCompiler.cxx.o -o cmTC_5efa6
    collect2: fatal error: cannot find 'ld'
    compilation terminated.
    gmake[1]: *** [CMakeFiles/cmTC_5efa6.dir/build.make:99: cmTC_5efa6] Error 1
    gmake[1]: Leaving directory '/workspaces/cuda-minimal/build/CMakeFiles/CMakeScratch/TryCompile-njZe6h'
    gmake: *** [Makefile:127: cmTC_5efa6/fast] Error 2
    
    

  

  CMake will not be able to correctly generate this project.
Call Stack (most recent call first):
  CMakeLists.txt:2 (project)
```

## Expected behaviour

1. that the project configures correctly. This can be observed by running: `cmake ..` (without the -DCMAKE_LINKER_TYPE)