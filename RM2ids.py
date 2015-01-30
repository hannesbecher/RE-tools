#!/usr/bin/python

#USAGE: python RM2ids.py <infile>

import sys


inhandle=open(sys.argv[1], 'r')

inhandle.readline()
sec=inhandle.readline()
inhandle.readline()

seq_b = sec.index('sequence')
#print seq_b
seq_e = sec.index('begin')-1
#print seq_e
rep_b = sec.index('repeat')
#print rep_b
class_b = sec.index('class')
#print class_b
class_e = sec.index('begin', seq_e+2)
#print class_e

hits={}

for line in inhandle:
	
	key=line[rep_b:(class_b-1)].split()[0]+ ' ' + line[class_b:class_e].split()[0]
	#print key
	if key in hits:
		hits[key].append(line[seq_b:seq_e].split()[0])
		#print line[seq_b:seq_e]
	else: hits[key]=[line[seq_b:seq_e].split()[0]]



outhandle=open(sys.argv[1].split('.')[0]+'.ids', 'w')

for item in hits.iterkeys():
	unique=list(set(hits[item]))
	outhandle.write('>%s %d\n' % (item, len(unique)))
	outhandle.writelines(['%s ' % thing for thing in unique])
	outhandle.write('\n')

outhandle.close()
inhandle.close()
