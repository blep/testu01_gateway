# TESTU01_gateway

This project provides two things to make it easy to use [TestU01](http://simul.iro.umontreal.ca/testu01/tu01.html)
random number generator test suite (created by Pierre L'Ecuyer, Université de Montréal):

- a test executable that consumes 32 bits integers from the standard input, and forwards them to TestU01.
- a docker image containing the test executable

This makes it easy to test the quality of a RNG (random number generator) regardless of the platform / language.

## Example of usage

To test the RNG, we just pipe the output of the script to TestU01 based executable running in the docker image:

```bash
python3 test_rng_example.py | docker run -i blep/testu01:latest --small-crunch
```

Where test_rng_example.py (see below) just output an endless stream of 32 bits random number in binary (4 bytes per number):

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

## Understanding how to use TestU01

[M.E. O'Neill](http://www.pcg-random.org/blog/) has a great [article](http://www.pcg-random.org/posts/pcg-passes-practrand.html) that introduces TestU01 and PractRand.

Refer to the official [TestU01 website](http://simul.iro.umontreal.ca/testu01/tu01.html) for details about
the tests and their results.

## Building from the source

Install C++ development dependencies:

```bash
sudo apt-get install git git-gui cmake g++ python3
```

From the source root directory:

```bash
mkdir build && cd build && cmake -G "Unix Makefiles" .. && make
```

## Licensing

Content of this repository is subject to the MIT license.

This project uses the TestU01 library that has owns [license](http://simul.iro.umontreal.ca/testu01/copyright.html), copied below:

    Package: TestU01
    Environment: ANSI C

    Copyright (c) 2002 Pierre L'Ecuyer, Université de Montréal.
    Web address: http://www.iro.umontreal.ca/~lecuyer/
    All rights reserved.

    TestU01 is distributed under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation, either version 3 of the License, or any later version (see: http://www.gnu.org/licenses).

    TestU01 is also available under a commercial licence from the copyright owners.

    In scientific publications which used this software, one may give the citation as:
    P. L'Ecuyer and R. Simard, TestU01: A C Library for Empirical Testing of Random Number Generators, ACM Transactions on Mathematical Software, Vol. 33, 4, article 22, 2007.

    Any changes made to this package must be clearly identified as such. Redistributions of source code must retain this copyright notice and the following disclaimer:

    THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
