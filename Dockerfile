FROM tolleybot/opencv_ffmpeg

WORKDIR /darknet

RUN apt-get install -y cmake

COPY ./ ./
RUN sed -i 's|GPU=0|GPU=1|g' Makefile
RUN sed -i 's|DEBUG=1|DEBUG=0|g' Makefile
RUN sed -i 's|CUDNN=0|CUDNN=1|g' Makefile
RUN sed -i 's|OPENCV=1|OPENCV=0|g' Makefile
RUN sed -i 's|OPENMP=1|OPENMP=0|g' Makefile
RUN make -j4

WORKDIR /darknet

ENV LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/usr/local/lib"

