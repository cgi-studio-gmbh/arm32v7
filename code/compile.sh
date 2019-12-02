if [ "$1" == "true" ]; then
  rm -rf $2/build && mkdir $2/build && cd $2/build &&  \
  cmake -DCMAKE_INSTALL_PREFIX=../install -DCMAKE_TOOLCHAIN_FILE=../../cmake/toolchain-arm7-linux.cmake -DCMAKE_BUILD_TYPE=$4 -DBUILD_TESTS=OFF -DBUILD_EXAMPLES=OFF .. && \
  make -j12 $3
else
  cd $2/build && cmake .. &&  make -j12 $3
fi
