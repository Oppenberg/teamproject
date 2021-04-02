# ****LINPACK****

## **Updates**

**4/01: Alvin** 

Created a LinPack branch contating relavent files from the kvm-docker-comparison. I have included the install_docker.sh and the profile.py from our general setup process. 
This file will be able to instantiate from our normal experment profile page on Cloudlab. I have spent the whole day reseraching and trying diffrent methodologies for setting
up this Benchmark. I have pulled the LinPack benchmark from http://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download, The profile that we want for
this is l_mklb_p_2021.1.1.001.tgz. We can utilize this in a general sense and utilize
wget https://software.intel.com/content/dam/develop/external/us/en/documents/l_mklb_p_2021.1.1.001.tgz to pull the compressed file from the intel site. We can utilize 
tar zxvf l_mklb_p_2021.1.1.001.tgz to unpack the compressed file. inside the file we can reach the linpack benchmark and run the sample script runme_xeon.64 that is a 
"A sample shell script for executing a pre-determined problem set for linpack_xeon64. OMP_NUM_THREADS set to 4 processors." and that script is SUPER simmilar to how the reserachers setup there benchmarking scripts. So i will be modifying our scripts to be simmilar to the reserchers scripts wihile complying to out project requirements. 
Contents of the compressed intel file: https://www.smcm.iqfr.csic.es/docs/intel/mkl/mkl_userguide/MKL_UG_linpack/Contents.htm

In the mean time we can execute a Docker file from 0x000edd1e (https://hub.docker.com/r/0x000edd1e/linpack) this is a docker file that runs the linpack benchmark on the system. 
We can instantiate the LINPACK in the cloudlab profile to run this. When we ssh into the head we can just utilize "docker pull 0x000edd1e/linpack" command to setup the
instance and use the "docker run -it --rm 0x000edd1e/linpack" to run the default to get the KFLOPS results from the benchmark. Just as a heads up the default array is 200 x 200
And that takes ups 31kb of ram. In Linpack profile i have it setup to 32gb of ram per node, With 32gb of ram per node we can get up to 1800 x 1800 array. 

This initial update is to let you guys know that we can run the benchmarks from thtat docker file from 0x000edd1e. That docker file/profile is getting the results we need. 
I have spent the whole day wraping my head around this topic and i just need some time to figure things out and write/rewirte the bash scripts we need to have to measure
what we need. 

What i am working on next:
 - ReReading the documentation to get a better understanding of what we are supposed to benchmark
 - Setting up a .sh script to automatically download and unpack the intel LinPack file
 - Rewriting the test scripts and docker file for our own purposes 
