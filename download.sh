#!/bin/sh
mkdir -p package
cd package

#wget -c http://raw.githubusercontent.com/opencv/opencv_3rdparty/ippicv/master_20180518/ippicv/ippicv_2017u3_lnx_intel64_general_20180518.tgz
if [ ! -f "zlib-1.2.11.tar.gz" ]; then
  wget zlib.net/zlib-1.2.11.tar.gz
  tar xaf zlib-1.2.11.tar.gz && mv zlib-1.2.11 zlib
fi
git clone -v -b 4.2.0 http://github.com/opencv/opencv.git --depth 1
git clone -v -b n4.2.2 http://github.com/FFmpeg/FFmpeg.git --depth 1
git clone -v -b n9.1.23.1 http://github.com/FFmpeg/nv-codec-headers.git --depth 1
git clone -v http://github.com/libjpeg-turbo/libjpeg-turbo.git --depth 1
git clone -v http://git.videolan.org/git/x264.git --depth 1
git clone -v http://github.com/brpc/brpc.git --depth 1
git clone -v http://github.com/google/leveldb.git --depth 1
git clone -v -b v3.11.4 http://github.com/google/protobuf.git --depth 1
git clone -v -b v2.2.1 http://github.com/gflags/gflags.git --depth 1
git clone -v https://github.com/lemenkov/libyuv.git --depth 1
git clone -v -b 3.3 https://github.com/videolan/x265.git --depth 1

cd ..
