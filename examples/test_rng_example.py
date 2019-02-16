#!/usr/bin/env python

from random import randint
import sys

write = sys.stdout.write
limit = 2**32-1
while True:
    write("%08x" % randint(0,limit))
