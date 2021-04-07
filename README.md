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


What i am working on next:
- [ ] Streamlining the process for running this benchmark
- [ ] Editing the run scripts (linux.sh, vm.sh) to reflect what we are doing
- [ ] edit the do_it.sh script to run, currently that script will run the benchmark 10 times but we need to foucs that
- [ ] TRANSFER THIS BENCHMARK TO REAL_PC WE ARE USING NODES WITH LIMITED RESOUCES, WE ARE BEING BOTTLENECKED 
- [ ] work on real_pc variant 
- [ ] The do_it.sh script is funky and i need to rekit. 
- [ ] rework the print result functionality to the results dir 
- [ ] modify and understand numactl and its attachemnt of cores to benchmark 


