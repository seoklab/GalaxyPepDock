# GalaxyPepDock
 Protein-peptide docking based on interaction similarity

## 0. Remark
The GalaxyPepDock distribution version supports only **Linux 64-bit** OS and binary files compiled with serial/parallel option.

## 1. Installation
1. Download the GalaxyPepDock program
 * Download a copy of GalaxyPepDock
    * https://github.com/seoklab/GalaxyPepDock
    * https://github.com/seoklab/GalaxyPepDock/archive/master.zip
 * Or, clone the GalaxyPepDock git repository 
    * git clone https://github.com/seoklab/GalaxyPepDock.git

2. Unzip and place the downloaded files
 * unzip GalaxyPepDock.zip
 * mv GalaxyPepDock $GALAXY_HOME  
    (*example*: GALAXY_HOME=/applic/GalaxyPepDock)

3. Execute install.sh
 * cd $GALAXY_HOME
 * ./install.sh

4. Check the downloaded files
 * There should exist:
  * bin: directory for executables  
    There should be build_initial_model, generate_model, generate_model.mpi and **GalaxyPepDock**
  * data: directory for data files
  * examples: directory for example files

5. Set environment variable
 * export GALAXY_HOME=$GALAXY_HOME  
    (*example*: export GALAXY_HOME=/applic/GalaxyPepDock)

6. Find a proper GalaxyPepDock executable
 * We have compiled Python scripts using PyInstaller, and it uses built-in Linux C libraries. Since, each computing
   environments may have different C libraries, so you need to find a working version with your environment. If all of
   them are not working, then please ask us with your computing environment.
 * We supply four different GalaxyPepDock executables having compiled on different environments
    * CentOS 6.6 w GNU_libc ver 2.12       : bin/GalaxyPepDock.centos66
    * CentOS 7 w GNU_libc ver 2.17         : bin/GalaxyPepDock.centos7
    * Ubuntu 14.04 LTS w GNU_libc ver 2.19 : bin/GalaxyPepDock.ubuntu1404
    * Ubuntu 16.04 LTS w GNU libc ver 2.23 : bin/GalaxyPepDock.ubuntu1604

7. Set MPI environment (optional)
 * GalaxyPepDock supports MPICH, so if you have installed MPICH, you can run it in parallel.
 * GalaxyPepDock has been tested with MPICH hydra (http://www.mpich.org/static/downloads/3.2/hydra-3.2.tar.gz).
 * You can use parallel version of GalaxyPepDock by setting EXEC_MPI environment
    * (in BASH) export EXEC_MPI=$PATH_TO_THE_MPIEXEC (*example*: export EXEC_MPI=/opt/mpi/mpich/bin/mpiexec)
 * You can set the number of CPU to use by setting NSLOTS environment
    * (in BASH) export NSLOTS=8
    * Since it will use CPUs up to the number of simulation trajectories (40),
    so we recommend you to set it one of the divisor (i.e., 4, 8, 10, etc.) to make it efficient.

## 2. How to use GalaxyPepDock
1. Prepare the input protein structure in PDB format and the input peptide sequence in FASTA format.

2. Run GalaxyPepDock
 * Usage: $GALAXY_HOME/bin/GalaxyPepDock [-h] [-t TITLE] [-p INPUT PDB File] [-s INPUT Sequence File] 
 * Input arguments and options:     
    * -t/--title: The title for a GalaxyPepDock job
    * -p/--pdb: The input protein structure in PDB format
    * -s/--seq: The sequence for the peptide in FASTA format

3. Output of GalaxyPepDock
 * The GalaxyPepDock generates a working directory, which is named by the job title (default: GalaxyPepDock)
 * In the working directory, the following two directories will be generated:   
    * pepdock: A working directory for finding template complex structure, building initial complex structure and refining protein-peptide complex structure.
    * model:  The output of GalaxyPepDock, predicted protein-peptide complex model structures in PDB format will be placed.
 * You can find template information in **{JOB Title}/pepdock/{Job Title}.templ.info** file.
 * Estimated accuracy of the prediction is reported in **{JOB Title}/pepdock/{Job Title}.pepdock.report** file.
 * The final model will be **${JOB Title}/model/model_[1-10].pdb**

## 3. Release log
* Feb, 2018: The first release of GalaxyPepDock

## 4. References
* H. Lee, L. Heo, M. S. Lee, and C. Seok, GalaxyPepDock: a protein-peptide docking tool based on interaction similarity,
    Nucleic Acids Res. 43 (W1), W431-W435 (2015). [[PUBMED]](http://www.ncbi.nlm.nih.gov/pubmed/25969449)

## 5. Contact
* chaok@snu.ac.kr
* compbio.galaxy@gmail.com

