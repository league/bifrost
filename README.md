# Bifrost 

| **`GPU+CPU`** | **`CPU-only`** | 
|-----------------|----------------------|
| [![Jenkins](https://img.shields.io/travis/rust-lang/rust.svg)]() | [![Travis](https://travis-ci.org/ledatelescope/bifrost.svg?branch=master)](https://travis-ci.org/ledatelescope/bifrost) |

A stream processing framework for high-throughput applications.

### [Bifrost Documentation](http://ledatelescope.github.io/bifrost/)
### [Bifrost Roadmap](ROADMAP.md)

## Your first pipeline

```python
import bifrost as bf

data = bf.blocks.read_wav(['file1.wav', 'file2.wav'], gulp_nframe=4096)
data = bf.blocks.copy(data, space='cuda')
data = bf.views.split_axis(data, 'time', 256, label='fine_time')
data = bf.blocks.fft(data, axes='fine_time', axis_labels='freq')
data = bf.blocks.detect(data, mode='jones')
data = bf.blocks.accumulate(data, 2)
data = bf.blocks.transpose(data, ['time', 'pol', 'freq'])
data = bf.blocks.copy(data, space='cuda_host')
data = bf.blocks.quantize(data, 'i8')
bf.blocks.write_sigproc(data)

pipeline = bf.get_default_pipeline()
pipeline.shutdown_on_signals()
pipeline.run()
```

<!---
Should put an image of this pipeline here.
-->
## Feature overview

 * Designed for sustained high-throughput stream processing
 * Python and C++ APIs wrap fast C++/CUDA backend
 * Native support for both system (CPU) and CUDA (GPU) memory spaces and computation

 * Main modules
  - Ring buffer: Flexible and thread safe, supports CPU and GPU memory spaces
  - Transpose: Arbitrary transpose function for ND arrays

 * Experimental modules
  - UDP: Fast data capture with memory reordering and unpacking
  - Radio astronomy: High-performance signal processing operations

## Installation

### C library

Install dependencies:

    $ sudo apt-get install exuberant-ctags

### Python interface

Install dependencies:

 * [PyCLibrary fork](https://github.com/MatthieuDartiailh/pyclibrary)
 * Numpy
 * matplotlib
 * contextlib2
 * pint
 

```
$ sudo pip install numpy matplotlib contextlib2 pint
```

### Bifrost installation

Edit **user.mk** to suit your system, then run:

    $ make -j
    $ sudo make install 

which will install the library and headers into /usr/local/lib and
/usr/local/include respectively.

You can call the following for a local Python installation:

    $ sudo make install PYINSTALLFLAGS="--prefix=$HOME/usr/local"

Note that the bifrost module's use of PyCLibrary means it must have
access to both the bifrost shared library and the bifrost headers at
import time. The LD_LIBRARY_PATH and BIFROST_INCLUDE_PATH environment
variables can be used to add search paths for these dependencies
respectively.

### Docker container

Install dependencies:

 * [Docker Engine](https://docs.docker.com/engine/installation/)
 * [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker)

Build Docker image:

    $ make docker

Launch container:

    $ nvidia-docker run --rm -it ledatelescope/bifrost

For CPU-only builds:

    $ make docker-cpu
    $ docker run --rm -it ledatelescope/bifrost

## Documentation

### [Bifrost Documentation](http://ledatelescope.github.io/bifrost/)
### [Bifrost Roadmap](ROADMAP.md)

Doxygen documentation can be generated by running:

    $ make doc

## Contributors

 * Ben Barsdell
 * Daniel Price
 * Miles Cranmer
 * Hugh Garsden
