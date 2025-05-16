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
# Iteration 6: Camera Control
- Add the camera class
- Possibility to control the camera orientation and position using inputs.

![Screen-Recording-2025-05-16-110444](https://github.com/user-attachments/assets/cc413034-90c9-4e8a-a46a-19ff54721f30)






# Iteration 5: Going 3D 
- Changed the vertices and indices to now render a pyramid , made the draw function dependent on the number indices and not hard coded.
- Added the GLM library for matrix manipulation.
- Defined the Model matrix ( just a rotation around Y axis dependent from time)
- Defined the View matrix (a translation of the world by a hard coded 3D vector)
- Defined the Projection matrix (Persepctive projection with a fixed rotation given in radians)
- Added the Depth testing to tell opengl which vertices to consider.


![Screen-Recording-2025-05-16-110444](https://github.com/user-attachments/assets/e72c986c-3a20-44d6-beb9-59c691e0401b)



# Iteration 4: Textures
In this iteration, we :
- changed the vertices to add two more fields for each one of them which are the texture coordinates.
- We add a lirabry that reads images and transforms them into a format acceptable by opengl. (stbi)
- We create a texture class that can create texture type parametrize it and link an image into it.
- We modified our VAO to make it capable of reading the modified vertices data.

![image](https://github.com/user-attachments/assets/4e9b79ca-9586-4b71-82e1-7f8cc3c595ae)



# Iteration 3: Shaders
Shaders at this iteration takes two types of inputs:
- First one is layout, those must be set up after the binding of the VBO, they're used for data that comes with the vertices: colors/normals/texture coordinates... for the layout we need to specify the stride and offset for each attribute we're using, layout always enter by the vertex shader and must be passed from it to the next one.
- Second one is uniforms, they're shader specific and we can only give them after activating the shader that holds them.

by passing colors layout and a scaling factor uniform to our triangles we get the following image:

![image](https://github.com/user-attachments/assets/6589a627-b08f-433a-96c8-b4b3cfc02b20)










# Iteration 2: More Triangles
Now Instead of drawing just 1 triangle and to avoid duplicating vertices and filling memory with them, we use indexing.
- Define a set of vertices like before
- Create Triangles using the indices of the vertices (Second array called indices)
- To make OpenGl learn about the newly created indices, we use an EBO, generate it, bind it, fill it.
( 1 important note here, when unbinding the order is VBO -> VAO -> EBO)

![image](https://github.com/user-attachments/assets/ddfc3361-28fc-4a59-b8d0-96e73550a204)




# Iteration 1: First Triangle
In This iteration we make the code slightly more interesting:
- we create 3 vertices, (the origin is the center of the window x points to the left y points up and it's normalized [-1,1] )
- We Make a simple vertex Shader and fragment Shader, compile them and attach them to the program (all of these are opengl objects defined by references)
- we tell opengl where to find the vertices by defining a VBO.
- We use VAO to switch between different VBOs even if we only have 1 VBO so we define a VAO and assign the VBO to it (the order here is veeery important)
- we bind the VAO and use the shader program and draw the triangle.

![image](https://github.com/user-attachments/assets/c4ec7b96-622b-4a18-9be8-c0e8529c51c3)

# Iteration 0: Basic Window
Iteration 0 is basically the installation and seeing if everything is working fine.
This should be the output:

![Capture d’écran du 2025-05-05 16-22-36](https://github.com/user-attachments/assets/0f5c4650-0d57-4674-8be5-6c168885837b)
