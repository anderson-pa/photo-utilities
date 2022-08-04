# !/usr/bin/python

import os, sys

base_dir = '/home/phillip/Pictures/WorldTourPhotos/101OLYMP'

filenames = os.listdir(base_dir)
filenames.sort()
filenames.reverse()

for filename in filenames:
    newfilename = 'P' + str(int(filename[1:-4]) + 209) + '.ORF'
    print("Renaming {} to {}".format(filename, newfilename))
    newfilename = os.path.join(base_dir, newfilename)
    os.rename(os.path.join(base_dir,filename), newfilename)

# listing directories after renaming "tutorialsdir"
# print "the dir is: %s" %os.listdir(os.getcwd())\
