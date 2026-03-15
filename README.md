# A2_InstructionFetch_ECE4300

.v Files:

ifIdLatch.v - passes on the output of incrementer.v and instrMem.v on every clock cycle  
incrementer.v - increments the output address of pc.v by 4 on every clock cycle  
instrMem.v - stores the "instructions", initializes an array of 2^10 32-bit registers, populates the first 10 entries with dummy instructions, then outputs the data from an input address from pc.v on every clock cycle.  
mux.v - simple 2x1 mux, uses the ex_mem_pc_src input to select between passing on the address to branch to or the next address in the sequence.  
pc.v - program counter, simply forwards the next address from the mux.  
top.v - top module, wires everything together.  

fetch_tb.v - initializes the top module with necessary inputs and outputs, then tests the module. clocks a few times to read some instructions, then branches ahead and clocks some more to make sure nothing breaks.  
Timing Diagram from fetch_tb.v is in the attached screenshot.  
