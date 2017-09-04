FROM tolleybot/opencv_ffmpeg

WORKDIR /yolo

COPY ./ ./

ENV LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/usr/local/lib"

