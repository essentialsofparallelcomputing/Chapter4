#!/bin/sh
docker build -f Dockerfile -t chapter4 .
docker run -it --entrypoint /bin/bash chapter4
