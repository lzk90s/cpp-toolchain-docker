#!/bin/sh

FFMPEG_HOME=${FFMPEG_HOME:-"/root/FFmpeg"}

# patch
allfilters_c_file=${FFMPEG_HOME}/libavfilter/allfilters.c
libavfilter_makefile=${FFMPEG_HOME}/libavfilter/Makefile

already_exist=$(grep ff_vf_algo ${allfilters_c_file} | wc -w)
if [ 0 -eq ${already_exist} ]; then
	echo "Patch allfilters.c"
	sed -i 's/extern AVFilter ff_af_abench;/extern AVFilter ff_af_abench;\nextern AVFilter ff_vf_algo;/g' ${allfilters_c_file}
	sed -i 's/extern AVFilter ff_af_abench;/extern AVFilter ff_af_abench;\nextern AVFilter ff_vf_yuvscale;/g' ${allfilters_c_file}
	sed -i 's/vsink_nullsink.o/vsink_nullsink.o\nOBJS-$(CONFIG_ALGO_FILTER) += vf_algo.o\n/g' ${libavfilter_makefile}
	sed -i 's/vsink_nullsink.o/vsink_nullsink.o\nOBJS-$(CONFIG_YUVSCALE_FILTER) += vf_yuvscale.o\n/g' ${libavfilter_makefile}
else
	echo "Alreay patch, skip"
fi
# patch success
