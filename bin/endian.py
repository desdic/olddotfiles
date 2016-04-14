#!/usr/bin/env python
# Small script for reversing (little endian) an address and escaping it

import sys

if len(sys.argv)!=2:
    print ("Usage: %s 0xdeadbeef" % sys.argv[0])
    sys.exit(1)

addr = sys.argv[1][2:]
l = len(addr)
p = 0

if l > 32:
    print ("Larget than 128bit not supported")
    sys.exit(1)
if l > 16:
    p = 32
if l > 8:
    p = 16
else:
    p = 8

addr = addr.zfill(p)
s = [addr[i:i+2] for i in range(0, len(addr), 2)]
for i in reversed(s):
    sys.stdout.write("\\x"+i)

print ()
sys.exit(0)
