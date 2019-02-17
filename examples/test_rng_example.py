#!/usr/bin/env python3

from random import randint
import sys
from struct import pack

write = sys.stdout.buffer.write
limit = 2**32-1
while True:
    write(pack("=I", randint(0,limit)))
