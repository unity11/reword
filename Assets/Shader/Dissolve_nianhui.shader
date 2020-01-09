// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33585,y:32714,varname:node_9361,prsc:2|emission-5619-OUT,alpha-6855-OUT,clip-8272-OUT;n:type:ShaderForge.SFN_Tex2d,id:1765,x:32604,y:32747,ptovrint:False,ptlb:main_texture,ptin:_main_texture,varname:node_1765,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6f847ac66a06eb947ac4f893046d3c72,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:4774,x:32604,y:32940,ptovrint:False,ptlb:mt_color,ptin:_mt_color,varname:node_4774,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_VertexColor,id:6263,x:32604,y:33101,varname:node_6263,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3770,x:32922,y:32812,varname:node_3770,prsc:2|A-1765-RGB,B-4774-RGB,C-6263-RGB,D-4255-OUT;n:type:ShaderForge.SFN_Tex2d,id:5870,x:31872,y:33096,ptovrint:False,ptlb:dissolve_texture,ptin:_dissolve_texture,varname:node_5870,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:034a53f8919103348a29942a45589685,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:1418,x:31872,y:33291,ptovrint:False,ptlb:soft_value,ptin:_soft_value,varname:node_1418,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:4884,x:32117,y:33208,varname:node_4884,prsc:2|A-5870-R,B-1418-OUT;n:type:ShaderForge.SFN_TexCoord,id:4997,x:31872,y:33415,varname:node_4997,prsc:2,uv:1,uaff:True;n:type:ShaderForge.SFN_Vector1,id:6675,x:31872,y:33355,varname:node_6675,prsc:2,v1:-1.5;n:type:ShaderForge.SFN_Lerp,id:5489,x:32117,y:33355,varname:node_5489,prsc:2|A-1418-OUT,B-6675-OUT,T-4997-U;n:type:ShaderForge.SFN_Subtract,id:862,x:32341,y:33247,varname:node_862,prsc:2|A-4884-OUT,B-5489-OUT;n:type:ShaderForge.SFN_Clamp01,id:4255,x:32516,y:33247,varname:node_4255,prsc:2|IN-862-OUT;n:type:ShaderForge.SFN_Multiply,id:8272,x:32890,y:33149,varname:node_8272,prsc:2|A-1765-A,B-4774-A,C-6263-A,D-4255-OUT;n:type:ShaderForge.SFN_Multiply,id:6855,x:32890,y:33020,varname:node_6855,prsc:2|A-6263-A,B-4255-OUT;n:type:ShaderForge.SFN_Multiply,id:7546,x:33322,y:33349,varname:node_7546,prsc:2|A-5207-OUT,B-4560-RGB;n:type:ShaderForge.SFN_OneMinus,id:8853,x:32742,y:33383,varname:node_8853,prsc:2|IN-4255-OUT;n:type:ShaderForge.SFN_Subtract,id:756,x:32970,y:33349,varname:node_756,prsc:2|A-4255-OUT,B-8853-OUT;n:type:ShaderForge.SFN_Add,id:5619,x:33262,y:32812,varname:node_5619,prsc:2|A-3770-OUT,B-7546-OUT;n:type:ShaderForge.SFN_OneMinus,id:5207,x:33137,y:33349,varname:node_5207,prsc:2|IN-756-OUT;n:type:ShaderForge.SFN_Color,id:4560,x:33137,y:33520,ptovrint:False,ptlb:dissolvecolor,ptin:_dissolvecolor,varname:node_4560,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:1765-4774-5870-1418-4560;pass:END;sub:END;*/

Shader "JOJO/Dissolve_nianhui" {
    Properties {
        _main_texture ("main_texture", 2D) = "white" {}
        [HDR]_mt_color ("mt_color", Color) = (0.5,0.5,0.5,1)
        _dissolve_texture ("dissolve_texture", 2D) = "white" {}
        _soft_value ("soft_value", Float ) = 0
        [HDR]_dissolvecolor ("dissolvecolor", Color) = (0.5,0.5,0.5,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _main_texture; uniform float4 _main_texture_ST;
            uniform float4 _mt_color;
            uniform sampler2D _dissolve_texture; uniform float4 _dissolve_texture_ST;
            uniform float _soft_value;
            uniform float4 _dissolvecolor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float4 _main_texture_var = tex2D(_main_texture,TRANSFORM_TEX(i.uv0, _main_texture));
                float4 _dissolve_texture_var = tex2D(_dissolve_texture,TRANSFORM_TEX(i.uv0, _dissolve_texture));
                float node_4255 = saturate(((_dissolve_texture_var.r*_soft_value)-lerp(_soft_value,(-1.5),i.uv1.r)));
                clip((_main_texture_var.a*_mt_color.a*i.vertexColor.a*node_4255) - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = ((_main_texture_var.rgb*_mt_color.rgb*i.vertexColor.rgb*node_4255)+((1.0 - (node_4255-(1.0 - node_4255)))*_dissolvecolor.rgb));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(i.vertexColor.a*node_4255));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _main_texture; uniform float4 _main_texture_ST;
            uniform float4 _mt_color;
            uniform sampler2D _dissolve_texture; uniform float4 _dissolve_texture_ST;
            uniform float _soft_value;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 uv1 : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _main_texture_var = tex2D(_main_texture,TRANSFORM_TEX(i.uv0, _main_texture));
                float4 _dissolve_texture_var = tex2D(_dissolve_texture,TRANSFORM_TEX(i.uv0, _dissolve_texture));
                float node_4255 = saturate(((_dissolve_texture_var.r*_soft_value)-lerp(_soft_value,(-1.5),i.uv1.r)));
                clip((_main_texture_var.a*_mt_color.a*i.vertexColor.a*node_4255) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
