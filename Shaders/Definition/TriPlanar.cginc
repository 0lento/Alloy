/////////////////////////////////////////////////////////////////////////////////
/// @file TriPlanar.cginc
/// @brief TriPlanar shader definition.
/////////////////////////////////////////////////////////////////////////////////

#ifndef ALLOY_SHADERS_DEFINITION_TRIPLANAR_CGINC
#define ALLOY_SHADERS_DEFINITION_TRIPLANAR_CGINC

#define A_TRIPLANAR_ON
#define A_RIM_EFFECTS_MAP_OFF

#include "../Lighting/Standard.cginc"
#include "../Type/Standard.cginc"

void aSurfaceShader(
    inout ASurface s)
{
    aTriPlanar(s);
    aRim(s);
}

#endif // ALLOY_SHADERS_DEFINITION_TRIPLANAR_CGINC
