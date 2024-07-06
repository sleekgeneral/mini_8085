# Mini 8085
This repository contains a mini project developed using the 8085 microprocessor. The project demonstrates the implementation of 18 essential operations including MOV, ACI, MVI, JUMP, CALL, ADC, ANA, and more. The primary objective of this project is to provide a practical understanding of how these operations work on the 8085 microprocessor.

## Operations Implemented
This project includes the following 20 operations:

MOV R1,R2

MOV R,M

ACI DATA

MVI R,DATA

JUMP ADDR

CALL ADDR

MOV M,R

ADC R

ANA R 

ADD R

CMP R 

STA ADDR

SUB R

SBB R

LXI Rp,DATA

LDA ADDR

JC ADDR

CZ ADDR

RET

RZ

000 - REG B

001 - REG C

010 - REG D

011 - REG E

100 - REG H

101 - REG L

111 - REG A

## USAGE

Select the operation you wish to implement from the list of 18 operations.

Refer to the provided PDF for the detailed list of op codes.

Load the op codes of the selected operation into the mem.txt file.

Use your 8085 emulator/vivado to simulate the loaded code.

Add the necessary registers in the emulator/waveform to verify the correct execution of the operation.


