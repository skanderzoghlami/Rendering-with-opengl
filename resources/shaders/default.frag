#version 330 core
out vec4 FragColor;
// FROM VERTEX SHADER

in vec3 color;
in vec2 texCoord;
in vec3 Normal;
in vec3 crntPos;

// FROM MAIN
uniform sampler2D tex0;
uniform vec4 lightColor;
uniform vec3 lightPos;
uniform vec3 camPos;

void main() {
    // Amnient is hard coded
    float ambient = 0.20f;

    // diffuse Calculatio
    vec3 normal = normalize(Normal);
    vec3 lightDirection = normalize(lightPos - crntPos);
    float diffuse = max(dot(normal, lightDirection), 0.0f);

    // specular Calculatio
    float specularLight = 0.50f; // Max value
    vec3 viewDirection = normalize(camPos - crntPos);
    vec3 reflectionDirection = reflect(-lightDirection, normal);
    float specAmount = pow(max(dot(viewDirection, reflectionDirection), 0.0f), 8);
    float specular = specAmount * specularLight;

    // Summing All Phong's components
    FragColor = texture(tex0, texCoord) * lightColor * (diffuse + ambient + specular);
}