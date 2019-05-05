#!/bin/sh
docker build -t chapter4 .
docker run -it --entrypoint /bin/bash chapter4
