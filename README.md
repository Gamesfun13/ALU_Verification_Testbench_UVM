# ALU Verification Testbench (UVM)

A SystemVerilog testbench built with the **Universal Verification Methodology (UVM)** to verify an 8-bit ALU design using Cadence Xcelium.

## Overview

The Design Under Test (DUT) is an 8-bit ALU that supports the following operations, selected via a 3-bit `ALU_Sel` signal:

| ALU_Sel | Operation        |
|---------|------------------|
| 000     | Addition         |
| 001     | Subtraction      |
| 010     | Logical AND      |
| 011     | Logical OR       |
| 100     | Logical XOR      |
| 101     | Shift Left       |
| 110     | Shift Right      |
| 111     | Pass-through (A) |

The testbench drives randomized stimulus through the ALU, monitors the outputs, and uses a scoreboard to automatically check each result against the expected value. A coverage monitor tracks functional coverage of the input space and operation selection.

## Project Structure

| File                 | Description                                              |
|----------------------|----------------------------------------------------------|
| `ALU.sv`             | DUT — 8-bit ALU module                                   |
| `ALUInterface.sv`    | SystemVerilog interface between DUT and testbench        |
| `ALUPackage.sv`      | UVM package including all testbench files                |
| `TB_Top.sv`          | Top-level module — instantiates DUT and runs the test    |
| `Transaction.sv`     | Sequence item (randomized A, B, ALU_Sel)                 |
| `Sequencer.sv`       | UVM sequencer                                            |
| `Driver.sv`          | Drives stimulus from sequences to the DUT                |
| `monitor.sv`         | Monitors DUT inputs/outputs                              |
| `cov_monitor.sv`     | Functional coverage collection                           |
| `agent.sv`           | Encapsulates sequencer, driver, monitor, cov_monitor     |
| `scoreboard.sv`      | Compares DUT output against expected results             |
| `Environment.sv`     | Top-level UVM environment                                |
| `Test.sv`            | Test — runs arithmetic, logical, and shift sequences     |
| `arith_sequence.sv`  | Sequence for addition/subtraction (Sel 0–1)              |
| `logical_sequence.sv`| Sequence for AND/OR/XOR/pass (Sel 2–4, 7)                |
| `shift_sequence.sv`  | Sequence for shift left/right (Sel 5–6)                  |


## Running the Testbench

```bash
xrun -uvm -coverage U -covoverwrite ALUInterface.sv ALUPackage.sv ALU.sv TB_Top.sv
```

The test runs 10 iterations each of the arithmetic, logical, and shift sequences (150 transactions total), then reports pass/fail counts and functional coverage.

## Sample Results

```
Coverage: 100
Pass: 150, Fails: 0
UVM_ERROR : 0
UVM_FATAL : 0
```

