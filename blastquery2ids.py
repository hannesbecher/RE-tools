#!/usr/bin/python


#USAGE: python blastquery2ids.py <infile> <outfile>

import sys

outhandle=open(sys.argv[2], 'w')

hits={}

for line in open(sys.argv[1], 'r'):
	a=line.split()[:2]

	if a[1] in hits: hits[a[1]].append(a[0])
	else: hits[a[1]]=list(a[0])



for i in hits.iterkeys():
	uniques=list(set(hits[i]))

#If the custom db was annotated using like name#class/family the sign '#' will be used
#	to separate 'group' and 'subset' in SeqGrapheR

	if '#' in i:
		outhandle.write('>%s %s %d\n' % (i.split('#',1)[1], i.split('#',1)[0], len(uniques)))
		outhandle.writelines(["%s " % item for item in uniques])
		outhandle.write('\n')
	else:
		outhandle.write('>%s %s %d\n' % (i, i, len(uniques)))
		outhandle.writelines(["%s " % item for item in uniques])
		outhandle.write('\n')

outhandle.close()
