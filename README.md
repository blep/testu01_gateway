# TESTU01_gateway

This project provides two things to make it easy to use [TestU01](http://simul.iro.umontreal.ca/testu01/tu01.html)
random number generator test suite:

- a simple executable consumes 32 bits integer (encoded in hexa) from the standard input, and passing them to TestU01.
- a docker image containing this executable

This makes it easy to test the quality of a RNG (random number generator) regardless of the platform / language.

## Example of usage

```python
# examples/test_rng_example.py
from random import randint
import sys
from struct import pack

write = sys.stdout.buffer.write
limit = 2**32-1
while True:
    write(pack("=I", randint(0,limit)))
```

This small script just output an endless stream of 32 bits random number in binary (4 bytes per number).

To test the RNG, we just pipe the output of the script to test TestU01_gateway executable in the docker image:

```bash
python3 test_rng_example.py | docker run -it blep/TESTU01_gateway:latest --smallcrunch
```

## Understanding how to use TestU01

See this [PCG Blog Entry](http://www.pcg-random.org/posts/pcg-passes-practrand.html).

## Building from the source

Install C++ development dependencies:

```bash
apt install git git-gui cmake g++ python3
```

From the source root directory:

```bash
mkdir build && cd build && cmake -G "Unix Makefiles" .. && make
```

## Licensing

Content of this repository has the MIT license.

It relies on TestU01 library that has owns [license](http://simul.iro.umontreal.ca/testu01/copyright.html).