# ****Stream Memory Benchmark****

## **Updates**

**4/07: Alvin M** 

Pulled the code from the original research paper, KVM-Docker comparisoin. The code on that repository is heavly reliant on there hardware (ibm server). running the benchamrk is 
simple, The resechers modeled there execution of the benchmark off of The university of virginia's CS departments software http://www.cs.virginia.edu/stream/ref.html. The 
code/benchmark is open source. The resechers modeld there testing off of linux,VM,Docker. This foray into running this benchmark is just to get the benchmark running and to 
see what it does. I setup this branch on the team project so that we can instantiate this when we need it. 

In order to run this benchmark you will need to first understand that the benchmark is called stream.c and we need to modify the vectorsize, (1342174781.75 for 29.99 gb) beacuse that affects how much memory this benchmark will use. the **MAKEFILE** will create a dir called bin and inside bin will contain the stream.exe benchamrk to be executed.
the Makefile also has the header and supporting utilis that we will need for that benchamrk. When running this benchamrk use "make all" to generate all files for execution.


What i am working on next:
- [] Streamlining the process for running this benchmark
- [] Editing the run scripts (linux.sh, vm.sh) to reflect what we are doing
- [] edit the do_it.sh script to run, currently that script will run the benchmark 10 times but we need to foucs that
- [] TRANSFER THIS BENCHMARK TO REAL_PC WE ARE USING NODES WITH LIMITED RESOUCES, WE ARE BEING BOTTLENECKED 
- [] work on real_pc variant 
- [] The do_it.sh script is funky and i need to rekit. 
- [] rework the print result functionality to the results dir 
- [] modify and understand numactl and its attachemnt of cores to benchmark 


