# ****LINPACK****

## **Updates**

**4/01: Alvin M** 

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
And that takes ups 31kb of ram. In Linpack profile i have it setup to 32gb of ram per node, With 32gb of ram per node we can get up to 1800 x 1800 array. The Core count is change to 12 also (Max). 

This initial update is to let you guys know that we can run the benchmarks from thtat docker file from 0x000edd1e. That docker file/profile is getting the results we need. 
I have spent the whole day wraping my head around this topic and i just need some time to figure things out and write/rewirte the bash scripts we need to have to measure
what we need. 

What i am working on next:
 - ReReading the documentation to get a better understanding of what we are supposed to benchmark
 - Setting up a .sh script to automatically download and unpack the intel LinPack file
 - Rewriting the test scripts and docker file for our own purposes 


**Sample of 0x000edd1e's Linpack docker:**

![unknown](https://user-images.githubusercontent.com/46765712/113368265-4d521080-932c-11eb-9ada-81a9477be75b.png)


**4/15: Alvin M** 

Since the last update, we transitiond into a proper run of the benchmark. originaly we utilized 0x00edd1e's docker variant of the linpack benchmark. The edd1e benchmark was 
acceptable but the issue was that it calcualted data in KFLOPS, we need our measurement in GFLOPS. since that was the case, i have spent this time modifying the original 
files and was able to sucessfully redo the original benchmark. As you can see in this branch we have trimmed alot of files from the last update.  I created a file that holds 
the benchmark itself, the benchmark called "runme_xeon64" has been modified from the origianl variant. We have the choice of running the benchmark on one or two cores, no 
matter what your selection is it will utilize numactl to bind the cpu cores to the benchmarks. Since the last update i have moved the computing cloud nodes to a rawPC where 
we have 150 some gb or ram and 40 some cpu cores. this will allow us to run the intended benchmark at the inteded specs. I have also created a basic script where it will 
install numactl to our node, chmod our benchmark and move the files to our user dir.

Basic manditory commands when setting up benchmarks:
- mkdir linpack
- chmod +x /local/repository/install_enableUtil.sh
- sudo bash /local/repository/install_enableUtil.sh

TLDR:
- terminated 0x000edd1e benchmark
- reworked original reserch paper benchmark to our branch
- transiotined our benchmakr/experment into a rawPC node
- created basic script to install numactl and to chmod our benchmark
- created basic script to run our benchmark 

What i hope to finish by 4/22
- Create the docker file for this benchmark 
- create and run a docker image of this experment 
- 
![image](https://user-images.githubusercontent.com/46765712/114950754-bbfd9680-9e21-11eb-8a38-331c309bbd50.png)
![image](https://user-images.githubusercontent.com/46765712/114968536-8b7b2400-9e44-11eb-963d-56d9128e446d.png)
![image](https://user-images.githubusercontent.com/46765712/114971805-237c0c00-9e4b-11eb-868e-de8ac1e9e2c4.png)


**4/21: Alvin M**

The intention of this update is to document the creation of the docker files for this experment. After creating the docker files for One and two core, i will then try to 
create a bash script to automate the execution of all 40 benchmarks (local linux and docker images).

Docker image creation: 
- created a simple docker script for one socket for testing (located in documentation folder)
- Since docker blocks some system calls we need to find a work around, We use numactl and that retures a call to memPolicy and that is a blocked sysCall on docker.
- to circumvent this block we will use the <docker run -ti --privileged ...> command to execute the docker image. 
- Just to reiderate the --privileged command is very dangerous in a normal seeing due to the fact that the image has root privlage so use with caution 

Docker run commands: 
- After running the commands for the setup and creation of the benchmarks run the following commands to execute example:
- <docker build -t linpack> this will create an image called linpack that will run the benchmark
- <docker run -ti --privileged linpack> this will run the benchmark

Completed Today:
- this benchmark is one step close to compleation, I have created two docker files that will be executed whe you run the docker.sh script. the docker.sh script will first ask you 1 or 2 cores (do ./docker.sh 1) then it will create a docker image from your choice of core, then run the benchmark with those cores attached, after compeation (2hr avg) it will delete itself. I have implementd a script called runAll.sh that will run docker.sh 1 and 2 core, and both 1 and 2 core linux benchmarks (avg run time of all 6hr).  

What i will be doing next: 
- all that is left to do is to find a way to log all the data from the benchmarks 
- modify the run all script to run each benchmarks a total of 10 time (total 40 runs = 60 hr avg)

Updated steps for how to run benchmarks:
- After ssh into node : <mkdir linpack>
- enable setup script:  <chmod +x /local/repository/install_enableUtil.sh>
- run setup script: <sudo bash /local/repository/install_enableUtil.sh>
- CD into linpack dir
- run benchmark script: <./runAll.sh>

Running the docker image of the benchmark seems to require double the time compared to local linus runtime and it looks like it took a preformacne hit.
![image](https://user-images.githubusercontent.com/46765712/115619748-4894d280-a2c2-11eb-8c93-6ece7b9b81f5.png)





