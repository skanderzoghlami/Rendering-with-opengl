#version 330 core
out vec4 FragColor;

in vec3 Normal;
in vec3 Position;

uniform vec3 cameraPos;
uniform samplerCube skybox;

void main() {
    vec3 I = normalize(Position - cameraPos);
    vec3 Reflect = reflect(I, normalize(Normal));
    vec3 Refract = refract(I, normalize(Normal) , 0.5);
    vec3 R = Refract ;
    FragColor = vec4(texture(skybox, R).rgb, 1.0);
}