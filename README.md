# 🧠 Verilog_ModelSim_Projects

This repository contains my Verilog HDL projects simulated using **ModelSim**.  
Each folder includes a specific logic circuit or digital module, along with its testbench for simulation and verification.

---

## 📦 Categories

### 🔁 Flip-Flops & Sequential Circuits
- `D_FF_with_PRE_CLR` – D Flip-Flop with preset and clear
- `Synchronous_Counter_T_FF` – Counter using T Flip-Flops
- `SynchronousCounter8bit_1`, `SynchronousCounter8bit_2` – 8-bit counters
- `CounterUpDown8bit` – Up/Down counter

### 📐 Combinational Logic
- `Mux8to1` – 8-to-1 multiplexer
- `Demux1to8` – 1-to-8 demultiplexer
- `Decoder3to8` – 3-to-8 decoder
- `RippleCarryAdder` – 4-bit adder using full adders

### 🧪 Test & Detection
- `Phat_Hien_1011`, `Phat_Hien_1111` – Sequence detectors

### 📤 Shift Registers
- `Shift_SIPO` – Serial-in Parallel-out
- `SisoShiftRegistor8bit` – 8-bit shift register

### 🚦 FSM-Based Projects
- `Traffic_Light_Control`, `Traffic_Light_Control_2`, `TrafficLightFSM` – Traffic light systems using FSM
- `System_Door` – Simple password-locked door FSM

---

## 🔧 Tools Used
- Verilog HDL
- ModelSim (Mentor Graphics)
- Optional: GTKWave for waveform viewing

---

## 🚀 How to Run Simulation
1. Open ModelSim
2. Create a new project and add `.v` files inside the folder
3. Compile and run the testbench
4. View results via waveform (`vsim` + `add wave *`)

---

## ✍️ Author

Created by **25Apples** – learning digital systems design through simulation and practice.

---
