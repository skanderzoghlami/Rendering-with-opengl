#version 330 core
out vec4 FragColor;

in vec2 TexCoords;

uniform vec3 lightPos;
uniform sampler2D texture_diffuse1;

void main() {
    // ambient
    float ambientStrength = 0.1;
    vec3 ambient = ambientStrength * vec3(texture(texture_diffuse1, TexCoords));
    // diffuse
    vec3 norm = normalize(vec3(0.0, 0.0, 1.0));
    vec3 lightDir = normalize(lightPos);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diff * vec3(texture(texture_diffuse1, TexCoords));
    // result
    vec3 result = (ambient + diffuse) * vec3(texture(texture_diffuse1, TexCoords));
    FragColor = vec4(result, 1.0);
}
