# Starlet Development
The **Starlet Development** repository acts as a central hub for coordinated development and testing, bringing together all Starlet libraries. 

⚠️ **Starlet** is a long-term personal project that I continue to develop and refine in the background. It serves as a foundation for future game and graphics projects and is **not intended for public release**. It is public to demonstrate my skills in C++, OpenGL, engine design, and software architecture, reflecting my commitment to learning, experimentation, and building complex systems.

## 🚀 Starlet Ecosystem
The **Starlet** ecosystem is a collection of light, modular C++ libraries designed for creating OpenGL applications. 

- [**Starlet Engine**](https://github.com/masonlet/starlet-engine): Core game/graphics engine (C++ / OpenGL)
- [**Starlet Math**](https://github.com/masonlet/starlet-math): Lightweight Header-only math library
- [**Starlet Controls**](https://github.com/masonlet/starlet-controls): Input & control management
- [**Starlet Scene**](https://github.com/masonlet/starlet-scene): ECS based scene management
- [**Starlet Graphics**](https://github.com/masonlet/starlet-graphics): Mesh, texture, shader management
- [**Starlet Serializer**](https://github.com/masonlet/starlet-serializer): Lightweight file/text parser/writer
- [**Starlet Logger**](https://github.com/masonlet/starlet-logger): Logging and debugging utilities
- [**Starlet Tests**](https://github.com/masonlet/starlet-tests): Unit tests for Starlet libraries using Google Test
- [**Starlet Samples**](https://github.com/masonlet/starlet-samples): Engine demonstration & sample scenes
- [**Starlet Starter**](https://github.com/masonlet/starlet-starter): Starting template for new Starlet game projects

## Building the Project
This project uses **CMake**. Follow these steps to build:

### 1. Clone the Repository
```bash
git clone https://github.com/Masonlet/starlet-development.git
cd starlet-development
```

### 2. Clone and Build Starlet
Run the included `clone_starlet_` script to clone all repositories and build the project:
```bash
# Clone starlet-samples and build using HTTPS (default)
./clone_starlet.sh

# Clone a specific test repository
./clone_starlet.sh starlet-tests

# Clone using SSH instead of HTTPS
./clone_starlet.sh starlet-samples ssh
```
