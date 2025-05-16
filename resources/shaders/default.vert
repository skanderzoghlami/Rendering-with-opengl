#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aColor;
layout (location = 2) in vec2 aTexture;

out vec3 color ;
out vec2 textCoord ;

uniform mat4 model , view , projection;

uniform float scale;
void main() {
    gl_Position =  projection * view * model * vec4(aPos,  1.0f);
    color = aColor;
    textCoord = aTexture;
}