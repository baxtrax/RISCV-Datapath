# RISC-V Datapath
Includes all components nessary to create a datapath for a RISC-V ish CPU. Does not include all instructions and only is used to show off the concept.

## Details
### The Top Level 0 Diagram
A overview diagram of the Datapath Module and its inputs and outputs.

![alt text](https://github.com/baxtrax/RISCV-Datapath/blob/main/Images/Datapath-Level0.png?raw=true)

All of these inputs and outputs will be connected to a Control Unit that will control the CPU as needed for the specific instructions.

### The Top Level 1 Diagram
More indepth view of the Inside of the Datapath Module. All of these components were designed in other repositorys on this account and added together with the proper connections to create this datapath.
![alt text](https://github.com/baxtrax/RISCV-Datapath/blob/main/Images/Datapath-Level1.png?raw=true)

### Testbench and verification
The Datapath Module is composed of one main file, datapath.v. This module has its own respective testbench to verify the code.

#### Testing and Verification
##### Testing Datapath Module
![alt text](https://github.com/baxtrax/InstructionMemory/blob/main/Images/TopSim.png?raw=true)
The datapath is composed of many parts and if needed, the file to test those parts was included.

## Running it
You can use these files with any type of simulation software. This project I personally used Quartus Prime and its simulation package that comes with named ModelSim(Now updated to QuestaSim) but any software that can run and simulate verilog code should do just fine as well.
