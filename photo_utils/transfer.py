#!/usr/bin/env python3

import os
import shutil
import getpass

sd_cards = ['48A1-6E32', '9C33-6BBD']

import_dirs = [f'/media/{getpass.getuser()}/{sd_card}/DCIM/100OLYMP'
               for sd_card in sd_cards]

# import_dir = os.path.expanduser('~/Desktop/100OLYMP')
storage_dir = os.path.expanduser('~/Pictures/Import')
movie_dir = os.path.expanduser('~/Pictures/Video')

for idir in import_dirs:
    if not os.path.exists(idir):
        print(f'Did not find {idir}')
        continue
    files = os.listdir(idir)
    files.sort()

    # remove jpg files, copy movie files to movie_dir
    for f in files:
        if f.lower().endswith('.jpg'):
            print(f'Deleting file: {f}')
            os.remove(os.path.join(idir, f))
        elif f.lower().endswith('.mov') or f.lower().endswith('.avi'):
            print(f'Moving file: {f}')
            shutil.move(os.path.join(idir, f),
                        os.path.join(movie_dir, f))

    # copy the folder (containing just ORFs hopefully) over to storage_dir
    print('Moving photo folder.')
    shutil.move(idir, storage_dir)
print('Done.')
