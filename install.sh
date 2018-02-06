#!/bin/sh

cd $(dirname $(readlink -f $0))
echo "Extracting database.."
cd data/PepBind/peptide
tar xfz peptide.tar.gz
cd ../protein
tar xfz protein_1.tar.gz
tar xfz protein_2.tar.gz
tar xfz protein_3.tar.gz
tar xfz protein_4.tar.gz
tar xfz protein_5.tar.gz
cd ../../../
gzip -d $(find . -iname '*.gz' -a ! -iname '*.tar.gz')
export GALAXY_HOME=$(pwd)
echo "Please set GALAXY_HOME environment like following:"
echo "  export GALAXY_HOME="$(pwd)
echo " "
echo "If you want to use MPI, please set EXEC_MPI & NSLOTS as described in README"
