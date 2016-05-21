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
BASE=/afs/cern.ch/user/$(echo -n $USER | head -c 1)/${USER}/CHARGED_HIGGS/test1
mkdir $BASE
python fastsetup.py -v CMSSW_7_6_4 -t master -d $BASE 

# Build ChargedHiggs
cd $BASE/CMSSW_7_6_4/src
cmsenv

git clone git@github.com:MiT-HEP/ChargedHiggs.git ChargedHiggs
cd ChargedHiggs
make -j 16
