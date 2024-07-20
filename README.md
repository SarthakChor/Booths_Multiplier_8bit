# 8-bit Booth's Multiplier Using Verilog

## Overview

This project implements an 8-bit Booth's Multiplier using Verilog. Booth's algorithm is used for efficient multiplication of two signed 8-bit binary numbers by minimizing the number of addition and subtraction operations required.

## Features

- **Efficient Multiplication**: Utilizes Booth's algorithm to perform signed binary multiplication.
- **Behavioral Verilog**: The design is implemented using behavioral Verilog, describing the functionality in terms of algorithms and data flow.
- **Synchronous Operation**: Operates on a clock signal to synchronize the multiplication process.

## File Structure

- `Booths_Multiplier_8bit.v`: Verilog module implementing the 8-bit Booth's multiplier.
- `Clk_divider.v`:Verilog module to slow down the Clock frequency of FPGA board.

## How It Works

1. **Initialization**: 
   - Computes the 2's complement of the multiplicand (`In1`).
   - Initializes the accumulator with the multiplicand and multiplier.
2. **Booth's Algorithm**:
   - Iterates through 8 cycles, checking the least significant bits of the accumulator to determine whether to add, subtract, or shift.
   - Performs arithmetic right shifts after each operation.
3. **Clk divider module**:
   - This module slow downs the in-built clock frequency of the FPGA module because it is high enough that we cant notice its pulse.
4. **Result**:
   - The final product is obtained from the upper 16 bits of the accumulator after 8 iterations.

## Usage

1. **Inputs**:
   - `In1`: 8-bit signed integer (multiplicand).
   - `In2`: 8-bit signed integer (multiplier).
   - `clk_in`: Clock signal.

2. **Output**:
   - `Product`: 16-bit signed integer (result of the multiplication).
   - `clk_out`: Clock at which the output is generated. Not needed to define as output but I am using this to check weather the output is calculated at its positive edge or not.

## Simulation

To verify the design, simulate the Verilog code using a hardware description language (HDL) simulator such as ModelSim, Vivado, or any other Verilog simulator. Check the output `Product` for correctness based on the inputs `In1` and `In2`.
