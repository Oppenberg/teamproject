# ****Stream Memory Benchmark****

## **Updates**

**4/07: Alvin M** 

Pulled the code from the original research paper, KVM-Docker comparisoin. The code on that repository is heavly reliant on there hardware (ibm server). running the benchamrk is 
simple, The resechers modeled there execution of the benchmark off of The university of virginia's CS departments software http://www.cs.virginia.edu/stream/ref.html. The 
code/benchmark is open source. The resechers modeld there testing off of linux,VM,Docker. This foray into running this benchmark is just to get the benchmark running and to 
see what it does. I setup this branch on the team project so that we can instantiate this when we need it. 

In order to run this benchmark you will need to first understand that the benchmark is called stream.c and we need to modify the vectorsize, (1342174781.75 for 29.99 gb)
beacuse that affects how much memory this benchmark will use. the **MAKEFILE** will create a dir called bin and inside bin will contain the stream.exe benchamrk to be executed.
the Makefile also has the header and supporting utilis that we will need for that benchamrk. When running this benchamrk use "make all" to generate all files for execution.
the original do_it.sh script calls each supporting script (linux.sh, docker.sh, vm.sh) 10 times. each benchmark script will dump there results into a results directory. when 
running the original content the reserchers utilize numactl, explicitly the command "numactl --physcpubind=0-7,16-23 --localalloc ./bin/stream.exe" to generate the benchmark
with the cores attached (refrance: https://serverfault.com/questions/313557/what-does-numactl-localalloc-do). We need to change this in a later update to execute diffrently
implicitly without change the physical cores that are to be bound are 0-7,16-23 we do not have that many cores in the node profile (switching to real_pc later), so to run it 
on the max amount of cores per node (12) we will execute the command as "numactl --physcpubind=0-11 --localalloc ./bin/stream.exe". 

Recap: 
- Adjust stream.c to proper array size depending on memery capacity before make all
- Execute command: make all
- make all will create a dir called bin where the stream.exe runnable is located
- make all will create supporting utils for the benchmakr to run
- use "numactl --physcpubind=0-11 --localalloc ./bin/stream.exe" to run one instance of stream benchmark 
- for later updates, the do_it.sh, docker file and streamlineing will be done

![image](https://user-images.githubusercontent.com/46765712/113948103-20917380-97da-11eb-8e09-d892ffcaec07.png)



What i am working on next:
- [ ] Streamlining the process for running this benchmark
- [ ] Editing the run scripts (linux.sh, vm.sh) to reflect what we are doing
- [ ] edit the do_it.sh script to run, currently that script will run the benchmark 10 times but we need to foucs that
- [ ] TRANSFER THIS BENCHMARK TO REAL_PC WE ARE USING NODES WITH LIMITED RESOUCES, WE ARE BEING BOTTLENECKED 
- [ ] work on real_pc variant 
- [ ] The do_it.sh script is funky and i need to rekit. 
- [ ] rework the print result functionality to the results dir 
- [ ] modify and understand numactl and its attachemnt of cores to benchmark 


**4/07: Alvin M** 

I have updated the branch with new scripts and dockerfiles. 
Docker imagae Creation: 
- Created two Dockerfiles that are to be executed depending on sockets
- created a runDocker.sh script to handel the creation of docker image and to run it (./runDocker.sh 1)
- Since docker blocks some system calls we need to find a work around, We use numactl and that retures a call to memPolicy and that is a blocked sysCall on docker.
- to circumvent this block we will use the <docker run -ti --privileged ...> command to execute the docker image.
- Just to reiderate the --privileged command is very dangerous in a normal seeing due to the fact that the image has root privlage so use with caution

Docker run commands: 
- After running the commands for the setup and creation of the benchmarks run the following commands to execute example
- <docker build -t stream> this will create an image called linpack that will run the benchmark
- <docker run -ti --privileged stream> this will run the benchmark

Completed Today:

- this benchmark is one step close to compleation, I have created two docker files that will be executed whe you run the runDocker.sh script. the runDocker.sh script will first ask you 1 or 2 cores (do ./runDocker.sh 1) then it will create a docker image from your choice of core, then run the benchmark with those cores attached, after compeation it will delete itself. I have implementd a script called runAll.sh that will run docker.sh 1 and 2 core, and both 1 and 2 core linux benchmarks 

Updated steps for running the benchmark: 
- After ssh into node : mkdir stream
- enable setup script: <chmod +x /local/repository/install_enableUtil.sh>
- run setup script: <sudo bash /local/repository/install_enableUtil.sh>
- CD into stream dir
- run make files: make all
- run benchmark script: <./runAll.sh>

**4/07: Alvin M** 
- This is most likely my last update for this benchmark due to the fact that all executeables and scritps are written and docker images are uploaded onto docker hub. At 
  this current state we have completed all the requirements for this project.
  
List of changes:
- Uploaded Docker build images to docker hub 
- https://hub.docker.com/repository/docker/mintyblot/stream-1
- https://hub.docker.com/repository/docker/mintyblot/stream-2
- The docker images are of Dockerfile.OneSocket and Dockerfile.TwoSocket 
- Added a bash script to execute both local benchmarks and both benchmarks from docker hub (images of Local Dockerfile.OneSocket and Dockerfile.TwoSocket but on docker hub )
- Modified install_enableUtil.sh to first take the name of user and build utilities at that users Dir
- install_enableUtil.sh will take username, install numactl, enable scripts, mkdir at user, move files to user then make all at dir.

How to run:
- After SSH into node run the following commands 
- <chmod +x /local/repository/install_enableUtil.sh>
- <sudo +x /local/repository/install_enableUtil.sh>
- install_enableUtil.sh will then promt you on your username, case sensetiveExample: Am943807@head -> enter: Am943807)
- <cd stream>
- <runAllImage.sh> for docker hub image and local benchmark
- <runAll.sh> to run/create benchmark from local and local benchmark
