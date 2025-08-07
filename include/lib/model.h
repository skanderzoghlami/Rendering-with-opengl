#ifndef MODEL_CLASS_H
#define MODEL_CLASS_H

#include <assimp/Importer.hpp>
#include <assimp/scene.h>
#include <assimp/postprocess.h>
#include "mesh.h"

class Model
{
public:
    Model(const char* path);
    void Draw(Shader& shader, Camera& camera , glm::mat4 modelMatrix = glm::mat4(1.0f) , bool instanced = false);

private:
    std::string directory;
    std::vector<Mesh> meshes;

    // Prevents textures from being loaded twice
    std::vector<std::string> loadedTexName;
    std::vector<Texture> loadedTex;

    void loadModel(std::string path);
    void processNode(aiNode* node, const aiScene* scene);
    Mesh processMesh(aiMesh* mesh, const aiScene* scene);
    std::vector<Texture> loadMaterialTextures(aiMaterial* mat, aiTextureType type, std::string typeName);
};

#endif