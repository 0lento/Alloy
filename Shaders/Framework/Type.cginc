///////////////////////////////////////////////////////////////////////////////
/// @file Type.cginc
/// @brief Shader type uber-header.
///////////////////////////////////////////////////////////////////////////////

#ifndef ALLOY_SHADERS_FRAMEWORK_TYPE_CGINC
#define ALLOY_SHADERS_FRAMEWORK_TYPE_CGINC

// Headers both for this file, and for all Definition and Feature modules.
#include "../Config.cginc"
#include "../Framework/Feature.cginc"
#include "../Framework/Lighting.cginc"
#include "../Framework/Utility.cginc"

#include "UnityCG.cginc"
#include "UnityInstancing.cginc"

#if !defined(A_VERTEX_COLOR_IS_DATA) && defined(A_PROJECTIVE_DECAL_SHADER)
    #define A_VERTEX_COLOR_IS_DATA
#endif

#if !defined(A_SHADOW_MASKS_BUFFER_ON) && (defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4))
    #define A_SHADOW_MASKS_BUFFER_ON
#endif

#if !defined(A_ALPHA_BLENDING_ON) && (defined(_ALPHABLEND_ON) || defined(_ALPHAPREMULTIPLY_ON))
    #define A_ALPHA_BLENDING_ON 
#endif

#if !defined(A_ROUGHNESS_SOURCE_BASE_COLOR_ALPHA) && defined(_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A)
    #define A_ROUGHNESS_SOURCE_BASE_COLOR_ALPHA
#endif

#if !defined(A_NORMAL_MAPPING_ON) && (defined(EFFECT_BUMP) || defined(_TERRAIN_NORMAL_MAP))
    #define A_NORMAL_MAPPING_ON
#endif

// Features
#include "../Feature/AO2.cginc"
#include "../Feature/CarPaint.cginc"
#include "../Feature/Decal.cginc"
#include "../Feature/Detail.cginc"
#include "../Feature/DirectionalBlend.cginc"
#include "../Feature/Dissolve.cginc"
#include "../Feature/Emission.cginc"
#include "../Feature/Emission2.cginc"
#include "../Feature/Eye.cginc"
#include "../Feature/MainTextures.cginc"
#include "../Feature/OrientedTextures.cginc"
#include "../Feature/Parallax.cginc"
#include "../Feature/Puddles.cginc"
#include "../Feature/Rim.cginc"
#include "../Feature/Rim2.cginc"
#include "../Feature/SecondaryTextures.cginc"
#include "../Feature/SkinTextures.cginc"
#include "../Feature/SpeedTree.cginc"
#include "../Feature/TeamColor.cginc"
#include "../Feature/Terrain.cginc"
#include "../Feature/TransitionBlend.cginc"
#include "../Feature/Transmission.cginc"
#include "../Feature/TriPlanar.cginc"
#include "../Feature/VertexBlend.cginc"
#include "../Feature/WeightedBlend.cginc"
#include "../Feature/Wetness.cginc"

/// Vertex data to be modified for specific shader type.
struct AVertex {
    /// Vertex position in object space.
    float4 positionObject;

    /// Vertex normal in object space.
    /// Expects normalized vectors.
    half3 normalObject;

    /// Vertex tangent in object space and bitangent sign.
    /// XYZ: Normalized tangent, W: Bitangent sign.
    half4 tangentObject;

    /// UV0 texture coordinates.
    float4 uv0;

    /// UV1 texture coordinates.
    float4 uv1;

    /// UV2 texture coordinates.
    float4 uv2;

    /// UV3 texture coordinates.
    float4 uv3;

    /// Vertex color.
    /// Expects linear-space LDR color values.
    half4 color;
};

/// Deferred geometry buffer representation of surface data.
struct AGbuffer {
    /// RGB: Albedo, A: Specular occlusion.
    half4 diffuseOcclusion : SV_Target0;

    /// RGB: f0, A: 1-Roughness.
    half4 specularSmoothness : SV_Target1;

    /// RGB: Packed world-space normal, A: Material type.
    half4 normalType : SV_Target2;

    /// RGB: Emission, A: 1-Subsurface.
    half4 emissionSubsurface : SV_Target3;

#ifdef A_SHADOW_MASKS_BUFFER_ON
    /// RGBA: Shadow Masks.
    half4 shadowMasks : SV_Target4;
#endif
};

/// Abstract declaration for user-defined vertex shader.
void aVertexShader(inout AVertex v);

/// Abstract declaration for user-defined color shader.
void aColorShader(inout half4 color, ASurface s);

/// Abstract declaration for user-defined G-Buffer shader.
void aGbufferShader(inout AGbuffer gb, ASurface s);

/// Abstract declaration for user-defined surface shader.
void aSurfaceShader(inout ASurface s);

/// Vertex output data constructor.
AVertex aNewVertex();

/// Gbuffer output data constructor.
AGbuffer aNewGbuffer();

/// Applies standard vertex transformations.
void aStandardVertexShader(inout AVertex v);

/// Applies standard color transformations.
void aStandardColorShader(inout half4 color, ASurface s);

/// Volumetric effects for base passes.
void aVolumetricBase(inout half4 color, ASurface s);

/// Volumetric effects for additive passes.
void aVolumetricAdd(inout half4 color, ASurface s);

/// Volumetric effects for multiplicative passes.
void aVolumetricMultiply(inout half4 color, ASurface s);

#endif // ALLOY_SHADERS_FRAMEWORK_TYPE_CGINC
