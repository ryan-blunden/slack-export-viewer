FROM ubuntu:18.04

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends --no-install-suggests -y  python3 python3-pip && \
    pip3 install --upgrade pip setuptools && \
    pip install slack-export-viewer && \
    apt-get remove --purge --auto-remove -y python3-pip && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

EXPOSE 8080

ENTRYPOINT ["slack-export-viewer"]
CMD ["--port", "8080", "--archive", "export.zip","--ip", "0.0.0.0", "--no-browser"]
