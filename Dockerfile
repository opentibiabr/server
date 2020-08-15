FROM ubuntu:18.04
RUN apt-get update && apt-get install -y --no-install-recommends \
  git \
  cmake \
  build-essential \
  libboost-date-time-dev \
  libboost-system-dev \
  libboost-filesystem-dev \
  libboost-iostreams-dev \
  libcrypto++-dev \
  liblua5.2-dev \
  libluajit-5.1-dev \
  libmysqlclient-dev \
  libpugixml-dev \
  unzip

WORKDIR /tmp/otserver

COPY . .

WORKDIR /opt/otserver

COPY src/    ./src/
COPY data/   ./data/
COPY cmake/  ./cmake/
COPY key.pem CMakeLists.txt ./

# RUN rm -rf build && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug -DDEBUG_LOG=ON .. && make -j`nproc` && cp otbr /opt/otserver
RUN rm -rf build && mkdir build && cd build && cmake .. && make -j`nproc` && sleep 5 && cp otbr /opt/otserver

COPY config.lua.dist ./

RUN cp config.lua.dist config.lua \
  && unzip -o data/world/world.zip -d data/world/

ENTRYPOINT cp -r /tmp/otserver/* /otserver && /opt/otserver/otbr
