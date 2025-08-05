#version 330 core
layout(location = 0) in vec3 position;  

out vec3 texCoords;

uniform mat4 projection;
uniform mat4 view;

void main() {
    vec4 pos =  projection * view * vec4(position, 1.0);
    gl_Position = vec4(pos.xy, pos.w , pos.w) ;
    texCoords = position;  // Pass the position as texture coordinates
    texCoords.z = - texCoords.z; // invert Z for correct mapping
}