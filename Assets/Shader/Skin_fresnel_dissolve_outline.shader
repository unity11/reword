// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34271,y:32801,varname:node_4013,prsc:2|diff-9185-OUT,spec-5246-OUT,gloss-2719-OUT,normal-1742-RGB,emission-390-OUT,clip-6860-OUT,olwid-1422-OUT,olcol-4384-RGB;n:type:ShaderForge.SFN_Color,id:3235,x:32923,y:32874,ptovrint:False,ptlb:D_color,ptin:_D_color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1882,x:32923,y:32674,ptovrint:False,ptlb:D,ptin:_D,varname:node_6683,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:1653,x:32923,y:33038,varname:node_1653,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9185,x:33695,y:32799,varname:node_9185,prsc:2|A-1882-RGB,B-3235-RGB,C-1653-RGB,D-7140-OUT;n:type:ShaderForge.SFN_Tex2d,id:4258,x:32921,y:33306,ptovrint:False,ptlb:dissolvetex,ptin:_dissolvetex,varname:node_2045,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Desaturate,id:7112,x:33121,y:33306,varname:node_7112,prsc:2|COL-4258-RGB;n:type:ShaderForge.SFN_Add,id:2217,x:33298,y:33293,varname:node_2217,prsc:2|A-1882-A,B-7112-OUT;n:type:ShaderForge.SFN_Multiply,id:6860,x:33480,y:33272,varname:node_6860,prsc:2|A-1653-A,B-2217-OUT,C-838-OUT;n:type:ShaderForge.SFN_Slider,id:838,x:32887,y:33523,ptovrint:False,ptlb:dt_range,ptin:_dt_range,varname:node_5909,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:1,max:1;n:type:ShaderForge.SFN_Tex2d,id:6884,x:33948,y:32433,ptovrint:False,ptlb:S,ptin:_S,varname:node_6884,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2088,x:33695,y:33099,ptovrint:False,ptlb:E,ptin:_E,varname:node_2088,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1742,x:33963,y:32880,ptovrint:False,ptlb:N,ptin:_N,varname:node_1742,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:1032,x:33695,y:33001,ptovrint:False,ptlb:E_int,ptin:_E_int,varname:node_1032,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:8643,x:33875,y:33064,varname:node_8643,prsc:2|A-1032-OUT,B-2088-RGB;n:type:ShaderForge.SFN_ValueProperty,id:7140,x:32923,y:33203,ptovrint:False,ptlb:D_int,ptin:_D_int,varname:node_7140,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:1422,x:34016,y:33229,ptovrint:False,ptlb:outline,ptin:_outline,varname:node_1422,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Color,id:4384,x:34016,y:33396,ptovrint:False,ptlb:outline_color,ptin:_outline_color,varname:node_4384,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:2719,x:33429,y:32682,ptovrint:False,ptlb:S_range,ptin:_S_range,varname:node_2719,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_Fresnel,id:3036,x:33049,y:33639,varname:node_3036,prsc:2|EXP-988-OUT;n:type:ShaderForge.SFN_ValueProperty,id:988,x:32887,y:33658,ptovrint:False,ptlb:f_range,ptin:_f_range,varname:node_7644,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:1268,x:33249,y:33696,varname:node_1268,prsc:2|A-3036-OUT,B-7081-OUT,C-639-RGB;n:type:ShaderForge.SFN_ValueProperty,id:7081,x:33049,y:33792,ptovrint:False,ptlb:f_int,ptin:_f_int,varname:node_1167,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:390,x:33761,y:33538,ptovrint:False,ptlb:f_switch,ptin:_f_switch,varname:node_2281,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-8643-OUT,B-6319-OUT;n:type:ShaderForge.SFN_Add,id:6319,x:33515,y:33653,varname:node_6319,prsc:2|A-8643-OUT,B-1268-OUT;n:type:ShaderForge.SFN_Color,id:639,x:33049,y:33885,ptovrint:False,ptlb:f_color,ptin:_f_color,varname:node_639,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:1582,x:33948,y:32632,ptovrint:False,ptlb:S_color,ptin:_S_color,varname:node_1582,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:5246,x:34184,y:32584,varname:node_5246,prsc:2|A-6884-RGB,B-1582-RGB;proporder:1882-3235-7140-6884-1582-2719-1742-2088-1032-390-639-7081-988-4258-838-1422-4384;pass:END;sub:END;*/

Shader "JOJO/Skin_fresnel_dissolve_outline" {
    Properties {
        _D ("D", 2D) = "white" {}
        _D_color ("D_color", Color) = (1,1,1,1)
        _D_int ("D_int", Float ) = 1
        _S ("S", 2D) = "white" {}
        _S_color ("S_color", Color) = (0.5,0.5,0.5,1)
        _S_range ("S_range", Range(0, 2)) = 1
        _N ("N", 2D) = "black" {}
        _E ("E", 2D) = "white" {}
        _E_int ("E_int", Float ) = 1
        [MaterialToggle] _f_switch ("f_switch", Float ) = 0
        _f_color ("f_color", Color) = (0.5,0.5,0.5,1)
        _f_int ("f_int", Float ) = 1
        _f_range ("f_range", Float ) = 1
        _dissolvetex ("dissolvetex", 2D) = "white" {}
        _dt_range ("dt_range", Range(-1, 1)) = 1
        _outline ("outline", Float ) = 0
        _outline_color ("outline_color", Color) = (0.5,0.5,0.5,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _D; uniform float4 _D_ST;
            uniform sampler2D _dissolvetex; uniform float4 _dissolvetex_ST;
            uniform float _dt_range;
            uniform float _outline;
            uniform float4 _outline_color;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*_outline,1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _D_var = tex2D(_D,TRANSFORM_TEX(i.uv0, _D));
                float4 _dissolvetex_var = tex2D(_dissolvetex,TRANSFORM_TEX(i.uv0, _dissolvetex));
                clip((i.vertexColor.a*(_D_var.a+dot(_dissolvetex_var.rgb,float3(0.3,0.59,0.11)))*_dt_range) - 0.5);
                return fixed4(_outline_color.rgb,0);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _D_color;
            uniform sampler2D _D; uniform float4 _D_ST;
            uniform sampler2D _dissolvetex; uniform float4 _dissolvetex_ST;
            uniform float _dt_range;
            uniform sampler2D _S; uniform float4 _S_ST;
            uniform sampler2D _E; uniform float4 _E_ST;
            uniform sampler2D _N; uniform float4 _N_ST;
            uniform float _E_int;
            uniform float _D_int;
            uniform float _S_range;
            uniform float _f_range;
            uniform float _f_int;
            uniform fixed _f_switch;
            uniform float4 _f_color;
            uniform float4 _S_color;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _N_var = tex2D(_N,TRANSFORM_TEX(i.uv0, _N));
                float3 normalLocal = _N_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 _D_var = tex2D(_D,TRANSFORM_TEX(i.uv0, _D));
                float4 _dissolvetex_var = tex2D(_dissolvetex,TRANSFORM_TEX(i.uv0, _dissolvetex));
                clip((i.vertexColor.a*(_D_var.a+dot(_dissolvetex_var.rgb,float3(0.3,0.59,0.11)))*_dt_range) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _S_range;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float4 _S_var = tex2D(_S,TRANSFORM_TEX(i.uv0, _S));
                float3 specularColor = (_S_var.rgb*_S_color.rgb);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = (_D_var.rgb*_D_color.rgb*i.vertexColor.rgb*_D_int);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 _E_var = tex2D(_E,TRANSFORM_TEX(i.uv0, _E));
                float3 node_8643 = (_E_int*_E_var.rgb);
                float3 emissive = lerp( node_8643, (node_8643+(pow(1.0-max(0,dot(normalDirection, viewDirection)),_f_range)*_f_int*_f_color.rgb)), _f_switch );
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _D_color;
            uniform sampler2D _D; uniform float4 _D_ST;
            uniform sampler2D _dissolvetex; uniform float4 _dissolvetex_ST;
            uniform float _dt_range;
            uniform sampler2D _S; uniform float4 _S_ST;
            uniform sampler2D _E; uniform float4 _E_ST;
            uniform sampler2D _N; uniform float4 _N_ST;
            uniform float _E_int;
            uniform float _D_int;
            uniform float _S_range;
            uniform float _f_range;
            uniform float _f_int;
            uniform fixed _f_switch;
            uniform float4 _f_color;
            uniform float4 _S_color;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _N_var = tex2D(_N,TRANSFORM_TEX(i.uv0, _N));
                float3 normalLocal = _N_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 _D_var = tex2D(_D,TRANSFORM_TEX(i.uv0, _D));
                float4 _dissolvetex_var = tex2D(_dissolvetex,TRANSFORM_TEX(i.uv0, _dissolvetex));
                clip((i.vertexColor.a*(_D_var.a+dot(_dissolvetex_var.rgb,float3(0.3,0.59,0.11)))*_dt_range) - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _S_range;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float4 _S_var = tex2D(_S,TRANSFORM_TEX(i.uv0, _S));
                float3 specularColor = (_S_var.rgb*_S_color.rgb);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuseColor = (_D_var.rgb*_D_color.rgb*i.vertexColor.rgb*_D_int);
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
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
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _D; uniform float4 _D_ST;
            uniform sampler2D _dissolvetex; uniform float4 _dissolvetex_ST;
            uniform float _dt_range;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _D_var = tex2D(_D,TRANSFORM_TEX(i.uv0, _D));
                float4 _dissolvetex_var = tex2D(_dissolvetex,TRANSFORM_TEX(i.uv0, _dissolvetex));
                clip((i.vertexColor.a*(_D_var.a+dot(_dissolvetex_var.rgb,float3(0.3,0.59,0.11)))*_dt_range) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
