Shader "Alloy/Particles/Multiply (Double)" {
Properties {
    // Particle Properties 
    _ParticleProperties ("'Particle Textures' {Section:{Color:0}}", Float) = 0
    [HDR]
    _TintColor ("'Tint' {}", Color) = (1,1,1,1)
    [LM_MasterTilingOffset] [LM_Albedo] 
    _MainTex ("'Color(RGB) Opacity(A)' {Visualize:{RGB, A}}", 2D) = "white" {}
    _MainTexVelocity ("Scroll", Vector) = (0,0,0,0)
    _MainTexSpin ("Spin", Float) = 0
    [Gamma]
    _TintWeight ("'Weight' {Min:0, Max:1}", Float) = 1
    _InvFade ("'Soft Particles Factor' {Min:0.01, Max:3}", Float) = 1
    
    // Particle Effects Properties 
    [Toggle(_PARTICLE_EFFECTS_ON)]
    _ParticleEffects ("'Particle Effects' {Feature:{Color:1}}", Float) = 0
    _ParticleEffectMask1 ("'Mask 1(RGBA)' {Visualize:{RGB, A}}", 2D) = "white" {}
    _ParticleEffectMask1Velocity ("Scroll", Vector) = (0,0,0,0)
    _ParticleEffectMask1Spin ("Spin", Float) = 0
    _ParticleEffectMask2 ("'Mask 2(RGBA)' {Visualize:{RGB, A}}", 2D) = "white" {}
    _ParticleEffectMask2Velocity ("Scroll", Vector) = (0,0,0,0)
    _ParticleEffectMask2Spin ("Spin", Float) = 0
    
    // Rim Fade Properties 
    [Toggle(_RIM_FADE_ON)]
    _RimFadeProperties ("'Rim Fade' {Feature:{Color:2}}", Float) = 0
    [Gamma]
    _RimFadeWeight ("'Weight' {Min:0, Max:1}", Float) = 1
    _RimFadePower ("'Falloff' {Min:0.01}", Float) = 4
    
    // Distance Fade Properties 
    [Toggle(_DISTANCE_FADE_ON)]
    _DistanceFadeProperties ("'Distance Fade' {Feature:{Color:3}}", Float) = 0
    _DistanceFadeNearFadeCutoff ("'Near Fade Cutoff' {Min:0}", Float) = 1
    _DistanceFadeRange ("'Range' {Min:0.5}", Float) = 1

    // Advanced Options
    _AdvancedOptions ("'Advanced Options' {Section:{Color:20}}", Float) = 0
    _RenderQueue ("'Render Queue' {RenderQueue:{}}", Float) = 0
}

Category {
    Tags { 
        "Queue" = "Transparent" 
        "IgnoreProjector" = "True" 
        "RenderType" = "Transparent"  
        "PreviewType" = "Plane"
    }
    Blend DstColor SrcColor
    ColorMask RGB
    Cull Off Lighting Off ZWrite Off
    
    SubShader {
        Pass {
            CGPROGRAM
            #pragma target 3.0
            
            #pragma shader_feature _PARTICLE_EFFECTS_ON
            #pragma shader_feature _RIM_FADE_ON
            #pragma shader_feature _DISTANCE_FADE_ON

            #pragma multi_compile_particles
            #pragma multi_compile_fog
            
            #pragma vertex aMainVertexShader
            #pragma fragment aMainFragmentShader

            #include "../../Framework/Particle.cginc"
            
            half4 aMainFragmentShader(
                AFragmentInput i) : SV_Target
            {
                i.color.a *= aFadeParticle(i);
                
                half4 col;
                half4 tex = _TintColor * aParticleEffects(i);
                col.rgb = tex.rgb * i.color.rgb * 2;
                col.a = i.color.a * tex.a;
                col = lerp(fixed4(0.5f,0.5f,0.5f,0.5f), col, col.a);
                UNITY_APPLY_FOG_COLOR(i.fogCoord, col, fixed4(0.5,0.5,0.5,0.5)); // fog towards gray due to our blend mode
                col.rgb = aHdrClamp(col.rgb);
                return col;
            }
            ENDCG 
        }
    }
}
CustomEditor "AlloyFieldBasedEditor"
}
