#!/bin/bash

echo "Transferring photos."

# check and set up directories
#SOURCE_DIR="/media/phillip/48A1-6E32/DCIM/100OLYMP"
SOURCE_DIR="/home/phillip/Pictures/temp"
MOVIE_DIR="/home/phillip/Pictures/Video"
PHOTO_DIR='/home/phillip/Pictures/WorldTourPhotos/100OLYMP'


# fix metadata for images taken with the 9mm body cap lens
sqlite3 library.db "update images set lens='Olympus 9mm Body Cap Lens Fisheye', aperture=8.0, focal_length=9 where model='E-M10' and lens='None' and aperture=0 and focal_length=0"

# change film roll locations
# update film_rolls set folder=replace(folder, '/Pictures/Active', '/Pictures/Darktable')


#model: Olympus 9mm Body Cap Lens Fisheye
#focal range: 9mm
#aperture: 8
#crap factor: 2.0

# Default ======================
#F Number: 0 (5.0)
#Max Aperture Value: 1.0
#Focal Length: 0.0 mm
#Lens Type: None (Olympus M.Zuiko Digital 14-42mm F3.5-5.6 II R)
#Lens Serial Number: 
#Lens Firmware Version: 0
#Max Aperture At Min Focal : 0.0
#Max Aperture At Max Focal : 0.0
#Min Focal Length: 0
#Max Focal Length: 0
#Max Aperture: 0.0
#Lens Properties: 0x0
#Aperture:  (5.0)

#Lens info: ?mm f/? (14-42mm f/3.5-5.6)
#Lens Model:  (OLYMPUS M.14-42mm F3.5-5.6 II R)
#Lens ID: None (Olympus M.Zuiko Digital 14.42mm F3.5-5.6 II R)
#Field Of View: (65.4 deg)
#Focal Length: 0.0 mm (35 mm equivalent: 0.0 mm)

# Inputs =======================
EXIF_TAGS=""
EXIF_TAGS+=" -FNumber=8.0" # also updates 'Aperture'
EXIF_TAGS+=" -MaxApertureValue=8.0"
EXIF_TAGS+=" -FocalLength=9.0"
#EXIF_TAGS+=" -LensType#='0 02 00'" # hex doesn't exist for bodycap lens
EXIF_TAGS+=" -MaxApertureAtMinFocal=8.0"
EXIF_TAGS+=" -MaxApertureAtMaxFocal=8.0"
EXIF_TAGS+=" -MinFocalLength=9"
EXIF_TAGS+=" -MaxFocalLength=9"
EXIF_TAGS+=" -MaxAperture=8.0"
#EXIF_TAGS+=" -LensInfo='9 9 8 8'"
#EXIF_TAGS+=" -LensModel='OLYMPUS 9mm Body Cap Lens Fisheye'"
#EXIF_TAGS+=" -LensID='Olympus 9mm Body Cap Lens Fisheye'"

CWD="`pwd`"
cd "$SOURCE_DIR"
exiftool $EXIF_TAGS P6030761.ORF
cd "$CWD"

# copy movies to movie folder

# copy ORFs to photo folder
    # copy and then delete originals
    # check for existing folder to avoid overwriting

# add lens data for 9mm bodycap lens

# verify data

# delete source folder
