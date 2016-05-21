#!/bin/bash

# Warning: cmsenv should be initialized!

# Start CRAB environment
source /cvmfs/cms.cern.ch/crab3/crab.sh


# Initialize
cd /tmp/$USER
mkdir -p NeroProducer/Nero
touch NeroProducer/__init__.py
touch NeroProducer/Nero/__init__.py
wget https://raw.githubusercontent.com/MiT-HEP/NeroProducer/master/Nero/script/fastsetup.py
wget -O NeroProducer/Nero/CMSSWHandler.py https://raw.githubusercontent.com/MiT-HEP/NeroProducer/master/Nero/python/CMSSWHandler.py
PYTHONPATH=.:$PYTHONPATH


# Start building
BASE=/afs/cern.ch/work/$(echo -n $USER | head -c 1)/${USER}/production
mkdir $BASE
python fastsetup.py -v CMSSW_7_6_4 -t master -d $BASE --download=NeroProducer/Nero/test,https://gist.github.com/amarini/b30a8b629934e4508a5de66a82d97381/archive/6456b3fadb0364e693caf3b8fd56377adceb2632.zip

# Build ChargedHiggs
#d $BASE/CMSSW_7_6_4/src
#cmsenv
