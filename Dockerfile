FROM tolleybot/opencv_ffmpeg

WORKDIR /darknet

RUN apt-get install -y cmake

COPY ./ ./

WORKDIR /darknet/build
RUN export EXTRA_NVCCFLAGS="-Xcompiler -std=c++98"
RUN cmake -DCMAKE_LIBRARY_OUTPUT_DIRECTORY="/usr/local/lib" -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY="/usr/local/lib" ..
RUN make -j4

WORKDIR /darknet

ENV LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/usr/local/lib"

