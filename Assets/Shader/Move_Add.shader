// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33165,y:32769,varname:node_9361,prsc:2|emission-9283-OUT;n:type:ShaderForge.SFN_Tex2d,id:1512,x:32649,y:32672,ptovrint:False,ptlb:main_texture,ptin:_main_texture,varname:node_1512,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1203-OUT;n:type:ShaderForge.SFN_Color,id:245,x:32649,y:32869,ptovrint:False,ptlb:mt_color,ptin:_mt_color,varname:node_245,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_VertexColor,id:1574,x:32649,y:33039,varname:node_1574,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9283,x:32908,y:32870,varname:node_9283,prsc:2|A-1512-RGB,B-245-RGB,C-1574-RGB,D-5047-RGB;n:type:ShaderForge.SFN_Tex2d,id:5047,x:32649,y:33208,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_5047,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:3812,x:32272,y:32754,varname:node_3812,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Time,id:9124,x:31833,y:32610,varname:node_9124,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:4761,x:31833,y:32546,ptovrint:False,ptlb:u_speed,ptin:_u_speed,varname:node_4761,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:6684,x:31833,y:32765,ptovrint:False,ptlb:v_speed,ptin:_v_speed,varname:node_6684,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:2200,x:32087,y:32546,varname:node_2200,prsc:2|A-4761-OUT,B-9124-T;n:type:ShaderForge.SFN_Multiply,id:3940,x:32087,y:32685,varname:node_3940,prsc:2|A-9124-T,B-6684-OUT;n:type:ShaderForge.SFN_Append,id:3643,x:32272,y:32620,varname:node_3643,prsc:2|A-2200-OUT,B-3940-OUT;n:type:ShaderForge.SFN_Add,id:1203,x:32470,y:32672,varname:node_1203,prsc:2|A-3643-OUT,B-3812-UVOUT;proporder:1512-245-4761-6684-5047;pass:END;sub:END;*/

Shader "JOJO/Move_Add" {
    Properties {
        _main_texture ("main_texture", 2D) = "white" {}
        [HDR]_mt_color ("mt_color", Color) = (0.5,0.5,0.5,1)
        _u_speed ("u_speed", Float ) = 0
        _v_speed ("v_speed", Float ) = 0
        _mask ("mask", 2D) = "white" {}
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
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _main_texture; uniform float4 _main_texture_ST;
            uniform float4 _mt_color;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform float _u_speed;
            uniform float _v_speed;
            struct VertexInput {
                float4 vertex : POSITION;
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
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 node_9124 = _Time;
                float2 node_1203 = (float2((_u_speed*node_9124.g),(node_9124.g*_v_speed))+i.uv0);
                float4 _main_texture_var = tex2D(_main_texture,TRANSFORM_TEX(node_1203, _main_texture));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(i.uv0, _mask));
                float3 emissive = (_main_texture_var.rgb*_mt_color.rgb*i.vertexColor.rgb*_mask_var.rgb);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
