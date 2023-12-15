This repository stores a modification of the `Argon2` library.

Original files of the source repository are located in the original repository 
and their 'ReadMe' or description is also available there: 
https://github.com/P-H-C/phc-winner-argon2  

The main purpose of this repository is:
- To add support for cross-platform compilation with the help of `CMake` tool;
- To get rid of platform-dependent compilation tools, such as `make`.
- To add a script for building a _DLL_ for _Windows_ operating system.
- To add a script for building an executable file for _Web Assembly_ (_WASM_).

# List of changes

First of all, none of the original source code files are modified. This means 
that all the _C_ (`*.c`) and _H_ (`*.h`) files of the library are used in their 
original unmodified state.

Some of the build targets of the original `Makefile` are ignored, e.g. tests 
are not used. If you need original tests, you can use the original repository 
for this purpose.

While the library itself is not modified, all the documentation and auxiliary 
files are removed from this repository.

This repository mainly focuses on a cross-platform compilation, so most of the 
modifications are related to files for `CMake`.

In addition, this repository offers support for `version.rc` files, used for 
adding useful information into _DLL_ files on _Windows_ operating system, 
making _DLL_ files built with the provided configuration look like a normal 
product on the _Windows_ O.S.  

While the original repository uses weird numbers 
for product version, this repository uses an independent approach to version 
numbers.

Benchmark is using a bad method for time calculation. Moreover, it is 
absolutely unportable to other CPU architectures. This is why it is ignored.

# Usage

To build the project you need the `CMake` tool of the latest version.
More information about `CMake` can be found on its website: https://cmake.org/

`CMake` tool is able to create project files for various popular IDEs. The most 
convenient way to use `CMake` is to start its GUI and give it a path to your 
code folder.

The `CMakeLists.txt` file provided here is able to configure the project for 
various use cases. Below are described configuration options.  

## Configuration options

### CFG_USE_AVX

This setting allows to enable support for _AVX_ instructions of your CPU.  
Default value is: _False_.  

### CFG_USE_VERSION_RC

This setting allows to enable support for `version.rc` files used on _Microsoft 
Windows_ operating system.  
Default value is: _False_.

# Building a DLL in MinGW

To build the library as a dynamic-link library (DLL) for the _Windows_ 
operating system you can use the _MSYS2_ environment and its _MINGW64_ feature. 
This process is cross-platform and does not require to install such 
heavy-weight tools as _Microsoft Visual Studio 2022_. The steps are described 
below.

1. Install the _MSYS2_.
   * https://www.msys2.org/


2. Open the _MSYS2 MINGW64_ terminal.
   * Start the `mingw64.exe` tool from your `msys64` folder.


3. Update the _MSYS2_ environment.
   * `$ pacman -Suy`
   * Re-run this command again after the terminal shuts down.


4. Install the _CMake_, _Make_ and _GCC_ toolchain.
   * `$ pacman -S mingw-w64-x86_64-cmake`
   * `$ pacman -S mingw-w64-x86_64-make`
   * `$ pacman -S mingw-w64-x86_64-toolchain`


5. Build the project.
   * `$ cd <ThisRepoFolder>`
   * `$ cmake . -B "_BUILD_" -G "MinGW Makefiles"`
   * `$ cmake --build _BUILD_`

# Building for WASM

To build an executable file for a _Web Assembly_ you can follow these steps. 

1. Install the _Emscripten_ SDK.
   * https://emscripten.org
   * You will need a lot of patience while the installer is quite buggy and 
not intuitive.   


2. Perform the steps 1, 2, 3 and 4 from the previous scenario.


3. Set the _Emscripten_'s environment variables.
   * `$ cd <EmscptenSdkFolder>`
   * `$ source ./emsdk_env.sh`
   * `$ echo $PATH`


4. Build the project.
   * `$ cd <ThisRepoFolder>`
   * `$ ./build_wasm.bat.sh`


5. Note that _WASM_ is a virtual ISA which is neither _Intel x86_ nor _AMD64_.

# License

This repository uses some of the original source files which have several 
different licenses, such as the _CC0 License_ and the _Apache 2.0 License_. 
More information about them can be found in the original repository:   
https://github.com/P-H-C/phc-winner-argon2#intellectual-property . All the 
original source files are using licenses which are compatible with the 
_GPL-3.0 License_. Files of this repository are using the _GPL-3.0 License_.


# Feedback

Your feedback is always welcome in the `Issues` section of this repository.
