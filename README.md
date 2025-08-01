# 🧠 From ASM to OS — Assembly Language and Low-Level Systems Programming

Welcome to **From ASM to OS**, a hands-on course and project series focused on learning Assembly Language from the ground up — with the ultimate goal of building a custom operating system. This project guides you through the foundational computer architecture, core assembly syntax, bootloader creation, kernel entry, and even BIOS-level experiments in a safe virtualized environment.

---

## 📚 Course Structure

### 📘 Module 0: Pre-Course Foundations
- What is a computer system?
- CPU, RAM, Storage, Buses
- Instruction Cycle (Fetch-Decode-Execute)
- Binary, Hex, ASCII
- ISA and Machine Code

🔧 **Activities**:
- Simulations with [visualgo.net](https://visualgo.net)
- Architecture basics quiz

---

### 🔢 Module 1: Introduction to Assembly Language
- What is Assembly? How it maps to Machine Code
- CPU Architectures: x86, x86_64, ARM
- Registers: General, Special
- Addressing Modes
- Memory Segments: Stack, Heap, Code, Data

🔧 **Activities**:
- Set up NASM/YASM, QEMU/VirtualBox, FreeDOS
- Write your first `.asm` (Hello World using `INT 21h`)

---

### ⚙️ Module 2: Core Assembly Programming
- Data types & directives: `db`, `dw`, `dd`, `resb`, etc.
- Arithmetic and control flow: `JMP`, `CALL`, `RET`
- Stack operations: `PUSH`, `POP`
- String and memory operations: `MOVSB`, `REP`, etc.

🔧 **Activities**:
- Basic calculator
- String reverser
- Binary-to-hex converter

---

### 🖥️ Module 3: OS Interaction (DOS & Linux)
- BIOS/DOS interrupts (`INT 10h`, `INT 21h`)
- Linux syscalls in Assembly (`write`, `read`, etc.)
- Mixing Assembly and C

🔧 **Activities**:
- Read and print file contents
- Build a mini `cat` clone in Linux ASM

---

### 🧰 Module 4: Debugging, Tools & Environments
- Tools: `gdb`, `ndisasm`, `objdump`, `make`
- File formats: MZ, PE, ELF
- Linking and object generation

🔧 **Activities**:
- Debug a crash
- Disassemble a binary

---

### 🚀 Module 5: Bare Metal and Bootloaders
- BIOS boot process, Real Mode (16-bit)
- Writing 512-byte bootloaders
- Disk structure and boot sectors
- Entering Protected Mode

🔧 **Activities**:
- Bootloader that prints to screen
- Load a binary file from disk
- Create a two-stage loader

---

### ⚙️ Module 6: Protected Mode and Kernel Entry
- GDT and IDT setup
- IRQs and interrupt handling
- Writing a kernel entry in 32-bit
- VGA text-mode programming

🔧 **Activities**:
- Build a VGA terminal driver
- Timer/Keyboard interrupt handling

---

### 🛠️ Module 7: Educational BIOS-Level Programming

> ⚠️ **For educational use only — VM environments strongly recommended.**

- BIOS, CMOS, and Real-Time Clock basics
- Anatomy of a boot-sector infector (safe simulation)
- MBR and BIOS interrupt handling

🔧 **Activities**:
- Simulate a harmless boot overwrite
- Dummy BIOS virus inside QEMU

---

### 🕹️ Module 8: Advanced Assembly Topics
- Flat memory model
- UEFI boot programming
- SIMD (MMX, SSE, AVX) usage
- Inline ASM in C
- Intro to reverse engineering

🔧 **Activities**:
- Write optimized math ASM functions
- Reverse engineer a compiled binary using Ghidra/Radare2

---

## 🏁 Final Project Ideas
Pick one of the following as your capstone:

- 🔹 Build a simple command-line shell
- 🔹 Create a game loader bootloader
- 🔹 Write a dummy educational boot-sector virus (in VM)

---

## 🧰 Tools Required

- NASM or YASM assembler
- QEMU / VirtualBox
- FreeDOS or Linux VM (for testing)
- `gdb`, `ndisasm`, `objdump`, `make`
- Ghidra or Radare2 (for RE labs)

---

## 🧑‍🏫 Course Philosophy

- 🔍 Clear explanations with visuals
- 💡 Commented code examples
- 🧪 Challenge-based, hands-on tasks
- 🧷 Safe, sandboxed experimentation (VM-only)

---

## 📜 License

This project is for educational use. Use safely, ethically, and legally.

---

## 🌐 Contributing

Contributions, suggestions, and improvements are welcome! Submit an issue or pull request if you'd like to help expand this project.

---

Happy hacking! 🧠⚙️💻
