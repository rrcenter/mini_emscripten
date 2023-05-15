
@REM # emsdk_env.ps1

mkdir build.em
pushd  build.em
emcmake cmake .. 
cmake --build . --target calc
popd