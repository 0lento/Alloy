/////////////////////////////////////////////////////////////////////////////////
/// @file Terrain.cginc
/// @brief Terrain surface shader definition.
/////////////////////////////////////////////////////////////////////////////////

#ifndef ALLOY_SHADERS_DEFINITION_TERRAIN_CGINC
#define ALLOY_SHADERS_DEFINITION_TERRAIN_CGINC

#define A_TERRAIN_ON
#define A_DETAIL_MASK_OFF

#include "../Lighting/Standard.cginc"
#include "../Type/Terrain.cginc"

void aSurfaceShader(
    inout ASurface s)
{
    aTerrain(s);
    aDetail(s);
}

#endif // ALLOY_SHADERS_DEFINITION_TERRAIN_CGINC
