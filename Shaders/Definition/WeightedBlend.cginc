/////////////////////////////////////////////////////////////////////////////////
/// @file WeightedBlend.cginc
/// @brief Weighted Blend shader definition.
/////////////////////////////////////////////////////////////////////////////////

#ifndef ALLOY_SHADERS_DEFINITION_WEIGHTED_BLEND_CGINC
#define ALLOY_SHADERS_DEFINITION_WEIGHTED_BLEND_CGINC

#define A_MAIN_TEXTURES_ON
#define A_MAIN_TEXTURES_CUTOUT_OFF
#define A_WEIGHTED_BLEND_ON
#define A_SECONDARY_TEXTURES_ON

#include "../Lighting/Standard.cginc"
#include "../Type/Standard.cginc"
    
void aSurfaceShader(
    inout ASurface s)
{
    aParallax(s);
    aDissolve(s);
    aMainTextures(s);
    aDetail(s);
    aTeamColor(s);
    aEmission(s);

    aHeightmapBlend(s);
    aSecondaryTextures(s);
    aCutout(s);

    s.mask = 1.0h;
    aAo2(s);
    aDecal(s);
    aWetness(s);
    aRim(s);
}

#endif // ALLOY_SHADERS_DEFINITION_WEIGHTED_BLEND_CGINC
