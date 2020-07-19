#!/bin/sh
docker build --no-cache -t chapter4 .
#docker run -it --entrypoint /bin/bash chapter4
docker build --no-cache -f Dockerfile.Ubuntu20.04 -t chapter4 .
#docker run -it --entrypoint /bin/bash chapter4
docker build --no-cache -f Dockerfile.debian -t chapter4 .
#docker run -it --entrypoint /bin/bash chapter4
