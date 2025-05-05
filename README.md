# OGLRender

This is a rendering engine that uses opengl, I started this project in 2024 following the guides from learnopengl.com but I quitted it.
Now I'm retaking the same project but from the beginning while following the youtube series made by Victor gordan.
The goal is to make a cleaner more documented version that is easier to setup and run.

# Setup: 
As the goal is easier setup the first thing is to make sure that the installation is as easy as possible, first thing to do is to run this if you're on linux to install all dependencies:

<pre>  sudo apt install libx11-dev libxrandr-dev libxi-dev libgl1-mesa-dev libxinerama-dev libxcursor-dev </pre>

And for GLAD and GLFW, everything should be taken care of thanks to CMake, I used a new feature to fetch the most recent versions and make them available in the project thus making it easier to use the project.


After that the rest should be easy for anyone familiar with cmake:

<pre> mkdir build  </pre>
<pre> cd build  </pre>
<pre> cmake ..  </pre>
<pre> make   </pre>
<pre> ./OGLRender </pre>

# Iteration 0:
Iteration 0 is basically the installation and seeing if everything is working fine.
This should be the output:
![Iteration 0](images/it0.png)