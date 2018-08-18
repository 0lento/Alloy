/////////////////////////////////////////////////////////////////////////////////
/// @file Multiplicative.cginc
/// @brief Multiplicative deferred decal surface shader definition.
/////////////////////////////////////////////////////////////////////////////////

#ifndef ALLOY_SHADERS_DEFINITION_DECAL_MULTIPLICATIVE_CGINC
#define ALLOY_SHADERS_DEFINITION_DECAL_MULTIPLICATIVE_CGINC

#include "../Lighting/Unlit.cginc"
#include "../Type/DecalMultiplicative.cginc"

void aSurfaceShader(
    inout ASurface s)
{
    half4 base = aBase(s);

    s.baseColor = aLerpWhiteTo(base.rgb, base.a);
    aTeamColor(s);
}

#endif // ALLOY_SHADERS_DEFINITION_DECAL_MULTIPLICATIVE_CGINC
