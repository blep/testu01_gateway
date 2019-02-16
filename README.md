# TESTU01_gateway

This project provides two things to make it easy to use [TestU01](http://simul.iro.umontreal.ca/testu01/tu01.html) 
random number generator test suite:
- a simple executable consumes 32 bits integer (encoded in hexa) from the standard input, and passing them to TestU01.
- a docker image containing this executable

This makes it easy to test the quality of a RNG (random number generator) regardless of the platform / language.

# Example of usage

```python
# test_rng_example.py
from random import randint
import sys.stdout

writer = sys.stdout.write
while True:
    write("%08x", randint(0,2**32))
```

This small script just output an endless flow of 32 bits random number in hexa without any spacing:
```
ad04964c95064269acdcd4a2193d598045ac374a9ea2125dcfbce28ae8c09a5d59efdf034439a904edb5728ac4667ee560411e2d57ab66196a72bb106faec6f35e32b28e9725ff25380943a5fe254774c36b4640c4bce74745ab8fe7a19568de86cbcb2de657e4d8656276604a590f89d303d6c0b37d4ddc54843a368e37cfbf67f4e9e566c49480c06b7e958bcff2a4609e6f13c2837bb879221b470f16bcfba720ec6d5e0d612cac4eebfe843ea0978164808c8dce5550ea95a9eed25d98ede3adb9612c30eb6fb627e3b14e0d3b47b463a84fe90efe08315626c7f83ec13d1193fab86f9de4a6323d1608d2950e
...
```

To test the RNG, we just pipe the output of the script to a run of the docker image:

```bash
python testrng.py | docker run -it blep/TESTU01_gateway:latest  --smallcrunch
```

# Understanding how to use TestU01

See this [PCG Blog Entry](http://www.pcg-random.org/posts/pcg-passes-practrand.html).


# Licensing

Content of this repository has the MIT license.

It relies on TestU01 library that has owns [license](http://simul.iro.umontreal.ca/testu01/copyright.html).


