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

# Iteration 10: Displaying Depth maps
We have previously enabled depth testing using the depth buffer, each fragment coord will have a Z coordinate, we can display that coordinate in the fragment shader, but the problem is that the depth isn't linear, we would like closer distances to have more precision that farther ones.
To solve this we linearize the Z value, we can later use logistic depth to better control how fast we go from values closer to zero and closer to 1.
<img width="782" height="803" alt="image" src="https://github.com/user-attachments/assets/dd2c013c-0d1a-4db3-9337-bb1927224d66" />





# Iteration 9: Loading 3D Models using Assimp
In this point of the project we diverge from the youtube series, in my project I'll use assimp to load 3D models as it can be easily integrated and it allows support for 40+ types of 3D models and not only GLTF.
Assimp reads the file, parses the 3D data and uses it to create an "internal scene graph" aiscene, this aiscene has a set of nodes that each have a set of meshes.
we traverse the nodes and extract all the meshes from them and process each mesh by transforming it into mesh objects as defined in our project's Mesh class.

<img width="767" height="830" alt="image" src="https://github.com/user-attachments/assets/388dff52-f413-4738-bc74-062049213036" />



# Iteration 8: Different Lighting types
- Point light is implemented using a quadratic attenuation function where the intensity decreases as we go further from source.
- Directional Light has no intensity it's same in all directions
- Spotlight depends of the angle between the lightdirection and the center of the light cone
![Presentation1](https://github.com/user-attachments/assets/dfc3bc4e-cd75-49db-9646-84529f2058ec)

# Iteration 7: Specular Maps
- We modify the texture class to make it able to hold more than one texture using the slot GLuint
- We modify the program to render a plane with the two textures: wood and specular

![image](https://github.com/user-attachments/assets/cf801e92-9e34-4f51-9ce4-4af4518f0a09)


# Iteration 6: Phong Lighting
- Changed the Camera class to support updates to the camera matrix.
- Added Phong Lighting where: Ambient is hard coded, Diffuse is calculated using the dot product between the lightdirection and the normal, and specular is calculated using the dot product between the reflected ray (light direction wrt to normal) and the viewdirection from the camera. 

![image](https://github.com/user-attachments/assets/7f66e9ce-692e-4701-872b-e2d1ff50c4e2)




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
