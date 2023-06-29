@rem Make a build directory to place the build output.
cmake -E make_directory "build"

@rem Generate build system files with cmake.
cmake -E chdir "build" cmake -G "Visual Studio 17 2022" -DCMAKE_BUILD_TYPE=Release ../
@rem Build the library.
cmake --build "build" --config Release --parallel 4

@rem Generate build system files with cmake.
cmake -E chdir "build" cmake -G "Visual Studio 17 2022" -DCMAKE_BUILD_TYPE=Debug ../
@rem Build the library.
cmake --build "build" --config Debug --parallel 4

@rem Build nuget
nuget pack .\gbenchmark.nuspec -OutputDirectory nuget