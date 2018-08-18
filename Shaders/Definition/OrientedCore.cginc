/////////////////////////////////////////////////////////////////////////////////
/// @file Oriented.cginc
/// @brief Oriented Blend & Core shader definition.
/////////////////////////////////////////////////////////////////////////////////

#ifndef ALLOY_SHADERS_DEFINITION_ORIENTED_CGINC
#define ALLOY_SHADERS_DEFINITION_ORIENTED_CGINC

#define A_ORIENTED_TEXTURES_ON
#define A_ORIENTED_TEXTURES_BLEND_OFF

#include "../Lighting/Standard.cginc"
#include "../Type/Standard.cginc"
    
void aSurfaceShader(
    inout ASurface s)
{    
    aOrientedTextures(s);
    aCutout(s);
}

#endif // ALLOY_SHADERS_DEFINITION_ORIENTED_CGINC
