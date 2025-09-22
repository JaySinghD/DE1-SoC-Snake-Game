# 🐍 DE1-SoC-Snake-Game

## Overview
This project recreates the classic Snake game entirely in **digital hardware** using **Verilog** on the **DE1-SoC FPGA development board**. Designed and implemented by Jay Dadhiala and Seva Alipov independently as part of the **ECE241: Digital Systems** course at the University of Toronto, the game runs without any software intervention, showcasing full control logic, VGA rendering, and input handling in hardware.

Project Started and Completed in 11/2024

> ⚠️ _Note: Source code is shared for educational and demonstration purposes only. Please do not reuse without permission._

---

## Key Features

- **Grid-Based Snake Movement**  
  Snake navigates a pixel grid with directional control via onboard buttons.

- **Item Spawning & Interaction**  
  Randomized item generation and collision detection with the snake head. **Purple** items increase snake speed, **red** items decrease snake speed, and **green** items return the snake speed to normal.

- **Score Tracking & Game State Management**  
  Internal counters track score, game over conditions, and reset logic. Score and snake head position are displayed on the 7-segment displays of the DE1-SoC FPGA board.

- **VGA Display Output**  
  Real-time rendering of the snake, items, and grid using custom VGA controller modules.

- **Modular Verilog Architecture**  
  Clean separation of logic across modules like `movement`, `itemSpawn`, `rememberSnake`, `manageDraw`, and `vga_adapter`.

---

## System Architecture

The game is composed of multiple Verilog modules, each responsible for a specific function:

| Module | Function |
|--------|----------|
| `movement` | Handles directional input and snake head updates |
| `itemSpawn` | Generates items randomly on the grid |
| `itemSnakeInteraction` | Detects collisions and updates score |
| `rememberSnake` | Stores snake body positions |
| `manageDraw` | Coordinates drawing logic |
| `vga_adapter`, `vga_controller`, `vga_address_translator` | VGA signal generation and pixel mapping |
| `mux3to1`, `hex_adapter` | Display and control multiplexing |
| `memNticks`, `counters` | Timing and game tick management |

### Overall Bock Diagram
<img width="1200" height="932" alt="Project Block Diagram" src="https://github.com/user-attachments/assets/f7b09efd-f5c9-4a16-a147-4bae7b7beda2" />

---

## Video Demo 
Please ensure that **audio is turned on** so you may hear a verbal explination of the project as well.



https://github.com/user-attachments/assets/7ca75624-36ae-485f-9caa-f700f968ce3e



---

## Academic Context

This project was developed as part of the **ECE241: Digital Systems** course at the University of Toronto. It reflects independent design and implementation work facilitated by course instruction. All logic was built from scratch using Verilog and tested on physical hardware.

---

## License

This repository is shared for educational and demonstration purposes only.  
Please do not reuse or redistribute the code without explicit permission from the authors.
