// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:7055,x:34085,y:32803,varname:node_7055,prsc:2|emission-8634-OUT,alpha-8608-OUT;n:type:ShaderForge.SFN_Tex2d,id:7855,x:32823,y:32787,ptovrint:False,ptlb:maintexture,ptin:_maintexture,varname:node_7855,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1690-OUT;n:type:ShaderForge.SFN_Color,id:9911,x:32823,y:32993,ptovrint:False,ptlb:mt_color,ptin:_mt_color,varname:node_9911,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_VertexColor,id:4729,x:32823,y:33171,varname:node_4729,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:4763,x:32823,y:33347,ptovrint:False,ptlb:Int Size,ptin:_IntSize,varname:node_4763,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:8608,x:33762,y:33084,varname:node_8608,prsc:2|A-4729-A,B-4763-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3417,x:32021,y:32944,ptovrint:False,ptlb:mt_u_speed,ptin:_mt_u_speed,varname:node_3417,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:7085,x:32021,y:33047,ptovrint:False,ptlb:mt_v_spedd,ptin:_mt_v_spedd,varname:node_7085,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Append,id:5101,x:32246,y:32944,varname:node_5101,prsc:2|A-3417-OUT,B-7085-OUT;n:type:ShaderForge.SFN_TexCoord,id:2593,x:32458,y:32787,varname:node_2593,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6520,x:32458,y:32944,varname:node_6520,prsc:2|A-5101-OUT,B-9292-T;n:type:ShaderForge.SFN_Time,id:9292,x:32246,y:33092,varname:node_9292,prsc:2;n:type:ShaderForge.SFN_Add,id:1690,x:32660,y:32787,varname:node_1690,prsc:2|A-2593-UVOUT,B-6520-OUT;n:type:ShaderForge.SFN_Multiply,id:8634,x:33773,y:32906,varname:node_8634,prsc:2|A-7855-RGB,B-9911-RGB,C-4729-RGB;proporder:7855-9911-4763-3417-7085;pass:END;sub:END;*/

Shader "JOJO/Additive" {
    Properties {
        _maintexture ("maintexture", 2D) = "white" {}
        [HDR]_mt_color ("mt_color", Color) = (0.5,0.5,0.5,1)
        _IntSize ("Int Size", Float ) = 1
        _mt_u_speed ("mt_u_speed", Float ) = 0
        _mt_v_spedd ("mt_v_spedd", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _maintexture; uniform float4 _maintexture_ST;
            uniform float4 _mt_color;
            uniform float _IntSize;
            uniform float _mt_u_speed;
            uniform float _mt_v_spedd;
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
                float4 node_9292 = _Time;
                float2 node_1690 = (i.uv0+(float2(_mt_u_speed,_mt_v_spedd)*node_9292.g));
                float4 _maintexture_var = tex2D(_maintexture,TRANSFORM_TEX(node_1690, _maintexture));
                float3 emissive = (_maintexture_var.rgb*_mt_color.rgb*i.vertexColor.rgb);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(i.vertexColor.a*_IntSize));
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
