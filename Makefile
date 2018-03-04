CC=clang
CXX=clang++

ARNOLD_PATH=/Users/zeno/Arnold-5.0.2.0-darwin

CXXFLAGS=-Wall -std=c++11 -O3 -shared -fPIC -Wno-narrowing -I${ARNOLD_PATH}/include
LDFLAGS=-L${ARNOLD_PATH}/bin -lai

HEADERS=\
src/lens.h\
src/pota.h \
src/tinyexr.h 


.PHONY=all clean

all: pota potabokehAOV

pota: Makefile src/pota.cpp ${HEADERS}
	${CXX} ${CXXFLAGS} src/pota.cpp -o bin/pota.dylib ${LDFLAGS}

potabokehAOV: Makefile src/potabokehAOV.cpp ${HEADERS}
	${CXX} ${CXXFLAGS} src/potabokehAOV.cpp -o bin/potabokehAOV.dylib ${LDFLAGS}

clean:
	rm -f pota potabokehAOV
