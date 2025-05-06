# OG-Render

This is a rendering engine that uses opengl, I started this project in 2024 following the guides from learnopengl.com but I quitted it.
Now I'm retaking the same project but from the beginning while following the youtube series made by Victor gordan.
The goal is to make a cleaner more documented version that is easier to setup and run.

# Setup: 
As the goal is easier setup the first thing is to make sure that the installation is as easy as possible, first thing to do is to run this if you're on linux to install all dependencies:

<pre>  sudo apt install libx11-dev libxrandr-dev libxi-dev libgl1-mesa-dev libxinerama-dev libxcursor-dev </pre>

And for GLAD and GLFW, everything should be taken care of thanks to CMake, I used a new feature to fetch the most recent versions and make them available in the project thus making it easier to use the project.


After that the rest should be easy for anyone familiar with cmake:

<pre> $ bash
mkdir build  
cd build 
cmake .. 
make   
./OGLRender </pre>

# Iteration 1:
In This iteration we make the code slightly more interesting:
- we create 3 vertices, (the origin is the center of the window x points to the left y points up and it's normalized [-1,1] )
- We Make a simple vertex Shader and fragment Shader, compile them and attach them to the program (all of these are opengl objects defined by references)
- we tell opengl where to find the vertices by defining a VBO.
- We use VAO to switch between different VBOs even if we only have 1 VBO so we define a VAO and assign the VBO to it (the order here is veeery important)
- we bind the VAO and use the shader program and draw the triangle.

![image](https://github.com/user-attachments/assets/c4ec7b96-622b-4a18-9be8-c0e8529c51c3)

# Iteration 0:
Iteration 0 is basically the installation and seeing if everything is working fine.
This should be the output:

![Capture d’écran du 2025-05-05 16-22-36](https://github.com/user-attachments/assets/0f5c4650-0d57-4674-8be5-6c168885837b)
