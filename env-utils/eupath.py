#!/usr/bin/env python

'''
Usage : eupath.py [options]

Examines the $PATH or %PATH% variable.   Firstly, prints to standard output in search order, one directory per line.  
Any duplication is indicated by an integer to the right of the directory which shows how many extra occurences there are.
Any non-existent directories are flagged.
'''

import os
from collections import Counter

path = os.environ['PATH']

dirs = path.split(os.pathsep)

errors = 0
for d in dirs:
    duplication = dirs.count(d)
    if duplication > 1:
        errors+=1
    if os.path.isdir(d):
        existence = 'Y'
    else:
        existence = 'N'
        errors += 1
    
    print('[%1d][%1s] %s' % (duplication, existence, d))

    
