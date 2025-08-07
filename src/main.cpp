//------- Ignore this ----------
#include <filesystem>
namespace fs = std::filesystem;
//------------------------------

#include "model.h"


const unsigned int width = 800, height = 800;

float skyboxVertices[] =
{
	//   Coordinates
	-1.0f, -1.0f,  1.0f,//        7--------6
	 1.0f, -1.0f,  1.0f,//       /|       /|
	 1.0f, -1.0f, -1.0f,//      4--------5 |
	-1.0f, -1.0f, -1.0f,//      | |      | |
	-1.0f,  1.0f,  1.0f,//      | 3------|-2
	 1.0f,  1.0f,  1.0f,//      |/       |/
	 1.0f,  1.0f, -1.0f,//      0--------1
	-1.0f,  1.0f, -1.0f
};

unsigned int skyboxIndices[] =
{
	// Right
	1, 2, 6,
	6, 5, 1,
	// Left
	0, 4, 7,
	7, 3, 0,
	// Top
	4, 5, 6,
	6, 7, 4,
	// Bottom
	0, 3, 2,
	2, 1, 0,
	// Back
	0, 1, 5,
	5, 4, 0,
	// Front
	3, 7, 6,
	6, 2, 3
};

int main()
{
	// Initialize GLFW
	glfwInit();

	// Tell GLFW what version of OpenGL we are using
	// In this case we are using OpenGL 3.3
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	// Tell GLFW we are using the CORE profile
	// So that means we only have the modern functions
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

	// Create a GLFWwindow object of 800 by 800 pixels, naming it "YoutubeOpenGL"
	GLFWwindow *window = glfwCreateWindow(width, height, "Skanderender", NULL, NULL);
	// Error check if the window fails to create
	if (window == NULL)
	{
		std::cout << "Failed to create GLFW window" << std::endl;
		glfwTerminate();
		return -1;
	}
	// Introduce the window into the current context
	glfwMakeContextCurrent(window);

	// Load GLAD so it configures OpenGL
	gladLoadGL();
	// Specify the viewport of OpenGL in the Window
	// In this case the viewport goes from (x,y) = (0,0), to (800,800) (0,0) is bottom left corner
	glViewport(0, 0, width, height);

	Shader shaderProgram("resources/shaders/default.vert", "resources/shaders/default.frag");
	Shader skyboxShader("resources/shaders/skybox.vert", "resources/shaders/skybox.frag");
	// Take care of all the light related things
	glm::vec4 lightColor = glm::vec4(1.0f, 1.0f, 1.0f, 1.0f);
	glm::vec3 lightPos = glm::vec3(0.5f, 0.5f, 0.5f);
	glm::mat4 lightModel = glm::mat4(1.0f);
	lightModel = glm::translate(lightModel, lightPos);


	shaderProgram.Activate();
	/* Light Related Uniforms to pass to the shader */
	glUniform4f(glGetUniformLocation(shaderProgram.ID, "lightColor"), lightColor.x, lightColor.y, lightColor.z, lightColor.w);
	glUniform3f(glGetUniformLocation(shaderProgram.ID, "lightPos"), lightPos.x, lightPos.y, lightPos.z);
	/* Faces sorting via  depth testing / culling */
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_CULL_FACE);
	glCullFace(GL_FRONT); 
	glFrontFace(GL_CCW); // Default: CCW = front face
	glDepthFunc(GL_LESS);
	/* Camera */
	Camera camera(width, height, glm::vec3(0.0f, 0.0f, 2.0f));
	/* 3D Models */
	Model model("resources/models/sword/scene.gltf"); // Still works, but now supports many more formats!
	Model model2("resources/models/bunny/scene.gltf"); // Still works, but now supports many more formats!


	double totalFPS = 0.0;
	double totalFrames = 1;
	// Main loop
	double prevTime = glfwGetTime();
	double prevTimeFPS = glfwGetTime();
	unsigned int frameCount = 0;

	// Create VAO, VBO, and EBO for the skybox
	unsigned int skyboxVAO, skyboxVBO, skyboxEBO;
	glGenVertexArrays(1, &skyboxVAO);
	glGenBuffers(1, &skyboxVBO);
	glGenBuffers(1, &skyboxEBO);
	glBindVertexArray(skyboxVAO);
	glBindBuffer(GL_ARRAY_BUFFER, skyboxVBO);
	glBufferData(GL_ARRAY_BUFFER, sizeof(skyboxVertices), &skyboxVertices, GL_STATIC_DRAW);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, skyboxEBO);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(skyboxIndices), &skyboxIndices, GL_STATIC_DRAW);
	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void*)0);
	glEnableVertexAttribArray(0);
	glBindBuffer(GL_ARRAY_BUFFER, 0);
	glBindVertexArray(0);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

    // Paths 
	std::string facesCubemap[6] =
	{
		"resources/skybox/skb1/right.jpg",
		"resources/skybox/skb1/left.jpg",
		"resources/skybox/skb1/top.jpg",
		"resources/skybox/skb1/bottom.jpg",
		"resources/skybox/skb1/front.jpg",
		"resources/skybox/skb1/back.jpg"
	};
	unsigned int cubemapTexture;
	glGenTextures(1, &cubemapTexture);
	glBindTexture(GL_TEXTURE_CUBE_MAP, cubemapTexture);
	glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
	glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
	glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_EDGE);
	glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

	for (unsigned int i = 0; i < 6; i++)
	{
		int width, height, nrChannels;
		unsigned char *data = stbi_load(facesCubemap[i].c_str(), &width, &height, &nrChannels, 0);
		if (data)
		{
			stbi_set_flip_vertically_on_load(false); // No need to flip for cubemaps
			glTexImage2D(GL_TEXTURE_CUBE_MAP_POSITIVE_X + i, 0, GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, data);
			stbi_image_free(data);
		}
		else
		{
			std::cout << "Cubemap texture failed to load at path: " << facesCubemap[i] << std::endl;
			stbi_image_free(data);
		}
	}
	skyboxShader.Activate();
	glUniform1i(glGetUniformLocation(skyboxShader.ID, "skybox"), 0);



	while (!glfwWindowShouldClose(window))
	{
		lightPos = camera.Position;
		glUniform3f(glGetUniformLocation(shaderProgram.ID, "lightPos"), lightPos.x, lightPos.y, lightPos.z);

		glClearColor(0.07f, 0.13f, 0.17f, 1.0f);
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		double crntTime = glfwGetTime();
		float deltaTimeFPS = static_cast<float>(crntTime - prevTimeFPS);
		frameCount++;
		if (deltaTimeFPS > 1.0 / 30.0) // 30 FPS
		{
			std::string fps = std::to_string(frameCount / deltaTimeFPS);
			std::string ms  = std::to_string((deltaTimeFPS * 1000.0) / frameCount);
			totalFrames += frameCount;
			std::string title = "Skanderender - FPS: " + fps + " - Frame time: " + ms + "ms";
			glfwSetWindowTitle(window, title.c_str());	
			prevTimeFPS = crntTime;
			frameCount = 0;
			camera.Inputs(window, deltaTimeFPS);
		}
		camera.updateMatrix(45.0f, 0.1f, 100.0f);		

		// Activate the shader program
		shaderProgram.Activate();
		glUniform1f(glGetUniformLocation(shaderProgram.ID, "time"), static_cast<float>(crntTime));
		
		glm::vec3 TimedPosupdate = glm::vec3(sin(crntTime), 0.0f, cos(crntTime));
		glm::mat4 model1Matrix = glm::rotate(glm::mat4(1.0f), static_cast<float>(crntTime), glm::vec3(0.0f, 0.0f, 1.0f));
		model.Draw(shaderProgram, camera , glm::translate(model1Matrix, glm::vec3(0.0f, 0.0f, 0.0f)) , false);

		model2.Draw(shaderProgram, camera , glm::translate(glm::mat4(1.0f), -TimedPosupdate), true);

		glDepthFunc(GL_LEQUAL); // Set depth function to less than or equal to ensure skybox is rendered last
		skyboxShader.Activate();
		glm::mat4 skyboxView = glm::mat4(1.0);
		glm::mat4 skyboxprojection = glm::mat4(1.0);
		skyboxView = glm::mat4(glm::mat3(glm::lookAt(camera.Position, camera.Position + camera.Orientation, camera.Up)));
		skyboxprojection = glm::perspective(glm::radians(45.0f), static_cast<float>(width) / static_cast<float>(height), 0.1f, 100.0f);
		glUniformMatrix4fv(glGetUniformLocation(skyboxShader.ID, "view"), 1, GL_FALSE, glm::value_ptr(skyboxView));
		glUniformMatrix4fv(glGetUniformLocation(skyboxShader.ID, "projection"), 1, GL_FALSE, glm::value_ptr(skyboxprojection));
		glBindVertexArray(skyboxVAO);
		glActiveTexture(GL_TEXTURE0);
		glBindTexture(GL_TEXTURE_CUBE_MAP, cubemapTexture);
		glDrawElements(GL_TRIANGLES, 36, GL_UNSIGNED_INT, 0);
		glBindVertexArray(0);
		glDepthFunc(GL_LESS); // Reset depth function to default


		// Swap the back buffer with the front buffer
		glfwSwapBuffers(window);
		// Take care of all GLFW events
		glfwPollEvents();
	}
	// Delete all the objects we've created
	shaderProgram.Delete();
	// Delete window before ending the program
	glfwDestroyWindow(window);
	// Terminate GLFW before ending the program
	glfwTerminate();
	return 0;
}