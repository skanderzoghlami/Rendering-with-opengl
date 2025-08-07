#version 330 core

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec3 aColor;
layout (location = 3) in vec2 aTex;

out vec3 crntPos;
out vec3 color;
out vec2 texCoord;
out vec3 Normal;

uniform mat4 camMatrix;
uniform mat4 model;

uniform mat4 translation;
uniform mat4 rotation;
uniform mat4 scale;

uniform bool instanced; // If true, the mesh can be instanced

// Instance ID for instanced rendering
// Function to get per-instance transformation
mat4 getInstanceMatrix(int id) {
    float angle = float(id) * 0.5; // Unique angle per instance
    float radius = 5.0; // Smaller radius to keep instances visible
    float x = cos(angle) * radius;
    float z = sin(angle) * radius;

    // Proper matrix construction for translation
    return mat4(
        1.0, 0.0, 0.0, 0.0,
        0.0, 1.0, 0.0, 0.0,
        0.0, 0.0, 1.0, 0.0,
        x,   0.0, z,   1.0);
}

void main() {
    vec4 localPos = vec4(aPos, 1.0f);

    if (instanced) {
        // If instanced, apply the instance transformation first
        mat4 instanceMatrix = getInstanceMatrix(gl_InstanceID);
        localPos = scale * rotation * translation * model * localPos;
        localPos = instanceMatrix * localPos;
        crntPos = vec3(localPos);
    } else {
        // If not instanced, use the model matrix
        crntPos = vec3(model * translation * -rotation * scale * localPos);
    }
    // Outputs the positions/coordinates of all vertices
    color = aColor;
    texCoord = mat2(1.0 , 0.0 , 0.0 ,-1.0) * aTex;
    Normal = aNormal;
    gl_Position =  camMatrix * vec4(crntPos, 1.0);
}