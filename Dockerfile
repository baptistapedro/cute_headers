FROM fuzzers/afl:2.52

RUN apt-get -y update
RUN apt install -y build-essential wget git clang cmake
RUN git clone https://github.com/RandyGaul/cute_headers.git
WORKDIR /cute_headers
COPY fuzzers/loadpng_fuzzer.c .
RUN afl-clang loadpng_fuzzer.c -o /loadpng_fuzz
RUN mkdir /png-corpus
RUN wget https://file-examples.com/wp-content/uploads/2017/10/file_example_PNG_500kB.png
RUN wget https://file-examples.com/wp-content/uploads/2017/10/file_example_PNG_500kB.png
RUN wget https://chromium.googlesource.com/chromium/src/+/lkgr/media/test/data/blackwhite.png
RUN wget https://chromium.googlesource.com/chromium/src/+/lkgr/media/test/data/four-colors.png
RUN mv *.png /png-corpus

ENTRYPOINT ["afl-fuzz", "-i", "/png-corpus", "-o", "/out"]
CMD ["/loadpng_fuzz", "@@"]

