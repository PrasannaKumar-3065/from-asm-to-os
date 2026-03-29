# x86 Bare-Metal Sandbox & Bootloader
**Exploring OS Fundamentals from Scratch**

## Overview
I am currently diving deep into low-level systems programming to understand how computers operate at the bare-metal level. This project serves as my hands-on learning environment for x86 assembly, bootloader design, and the foundational bridge between hardware and software. 

## Current Implementation

### Bootloader Development
- **16-bit Real Mode Bootloader**: Implemented a basic bootloader capable of text output to the screen via BIOS interrupts (`INT 0x10`).
- **Disk I/O Operations**: Built sector-reading routines from disk via BIOS interrupts (`INT 0x13`) with basic error handling.
- **Protected Mode Transition**: Successfully configured a Global Descriptor Table (GDT) and implemented the transition logic from 16-bit real mode to 32-bit protected mode via long jumps.

### Assembly Programming Fundamentals
- **Control Flow**: Utilizing conditional branching (`JMP`, conditional jumps) and loop constructs.
- **Memory Operations**: Managing basic register operations, memory addressing, and stack frames.
- **Arithmetic & Processing**: Built simple computational routines and string manipulation tools using BIOS interrupts.

## Development Environment
- **Assembler**: NASM (Netwide Assembler)
- **Emulator**: QEMU for x86 system emulation
- **Build Tools**: Custom shell scripts for automated compilation and execution

## Project Structure
- `src/`: Assembly source files (.asm)
  - `hello.asm`: Basic bootloader with screen output
  - `protected_mode.asm`: GDT setup and mode transition example
  - `asm_disk_read.asm`: Disk sector reading implementation
  - `calculator_assembly.asm`: Basic arithmetic operations
- `run_assembly.sh`: Build and execution script
- `img/`: Output directory for compiled binaries

## Long-Term Research Vision
While my immediate focus is mastering standard OS architecture (memory management, paging, drivers, and file systems), my overarching research interest lies at the intersection of artificial intelligence and low-level systems.

**Future Research Goal:** As this operating system matures, I intend to use it as a research vehicle to investigate the theoretical feasibility of integrating Large Language Models with system-level APIs. Specifically, I want to research concepts like prompt-driven state management and AI-assisted kernel reconfigurations. This is a long-term academic goal that will build upon the bare-metal foundation I am establishing here.
