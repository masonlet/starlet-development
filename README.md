# StarletDevelopment
The **StarletDevelopment** repository acts as a central hub for coordinated development and testing, bringing together all Starlet libraries. 

⚠️ **Starlet** is a long-term personal project that I continue to develop and refine in the background. It serves as a foundation for future game and graphics projects and is **not intended for public release**. It is public to demonstrate my skills in C++, OpenGL, engine design, and software architecture, reflecting my commitment to learning, experimentation, and building complex systems.

## 🚀 Starlet Ecosystem
The **Starlet** ecosystem is a collection of light, modular C++ libraries designed for creating OpenGL applications. 

- [**StarletEngine**](https://github.com/Masonlet/StarletEngine) – Core game/graphics engine (C++ / OpenGL)
- [**StarletMath**](https://github.com/Masonlet/StarletMath) – Lightweight Header-only math library
- [**StarletControls**](https://github.com/Masonlet/StarletControls) – Input & control management
- [**StarletScene**](https://github.com/Masonlet/StarletScene) – ECS based scene management
- [**StarletGraphics**](https://github.com/Masonlet/StarletGraphics) – Mesh, texture, shader management
- [**StarletSerializer**](https://github.com/Masonlet/StarletSerializer) – Lightweight file/text parser/writer
- [**StarletTests**](https://github.com/Masonlet/StarletTests) – Unit tests for Starlet libraries using Google Test
- [**StarletSamples**](https://github.com/Masonlet/StarletSamples) – Engine demonstration & sample scenes
- [**StarletStarter**](https://github.com/Masonlet/StarletStarter) - Starting template for new Starlet game projects

## Building the Project
This project uses **CMake**. Follow these steps to build:

### 1. Clone the Repository
```bash
git clone https://github.com/Masonlet/StarletDevelopment.git
cd StarletDevelopment
```

### 2. Clone the Starlet Repositories
Run one of the included `clone_starlet_` files

### 3. Create a Build directory and Generate Build Files
```bash
mkdir build
cd build 
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DBUILD_LOCAL=ON ..
```
`-DCMAKE_EXPORT_COMPILE_COMMANDS=ON` flag generates a `compile_commands.json` file  
Can be safely omitted on Windows if you're using Visual Studio

### 4. Build the Project
- **Linux**:
  ```bash
  make
  ```

- **Windows**:
  ```bash
  cmake --build .
  ```
  Or open the generated `.sln` file in Visual Studio and build the solution.
