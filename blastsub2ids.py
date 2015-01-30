#!/usr/bin/python


#USAGE: python blastsub2ids.py <infile> [<infile 2> ... <infile n>] 

import sys

outhandle=open('%s.ids' % sys.argv[1], 'w')

infile_no=len(sys.argv)-1
print ('%d input files specified' % infile_no)
print ('writing IDs to %s.ids' % sys.argv[1].split('.')[0])

outhandle=open('%s.ids' % sys.argv[1].split('.')[0], 'w')



for i in range(infile_no):

	hits={}

	for line in open(sys.argv[i+1], 'r'):

		if line[:-1]=='': break
		a=line.split()[1]
		if a in hits: hits[a]+=1
		else: hits[a]=0
	
	outhandle.write('>%s %s %d\n' % (sys.argv[i+1].split('.')[0], sys.argv[i+1].split('.')[0], len(hits)))

	outhandle.writelines('%s %d ' % (item, hits[item]) for item in hits.iterkeys())
	outhandle.write('\n')

outhandle.close()
