Shader "Unlit/Alpha"
{
	Properties{
		_UV("贴图", 2D) = "White"{}
		_Alpha("透明度", Range(0,1)) = 0.5
	}
		SubShader{
			//Tags { "RenderType" = "Transparent" }
			Tags{ "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent" }
			pass {
				Tags{ "LightMode" = "ForwardBase" }
				Cull Front
				ZWrite Off         //关深度写入
				Blend SrcAlpha OneMinusSrcAlpha
				CGPROGRAM
					// Physically based Standard lighting model, and enable shadows on all light types
					#pragma vertex vert
					#pragma fragment frag
					#include "UnityCG.cginc"



					sampler2D _UV;
					float4 _UV_ST;
					float _Alpha;

					struct v2f {
						float4 vertex : POSITION;
						float2 uv :TEXCOORD0;
					};
					v2f vert(appdata_full data)
					{
						v2f o;
						o.vertex = UnityObjectToClipPos(data.vertex);
						o.uv = TRANSFORM_TEX(data.texcoord, _UV);
						return o;
					}
					float4 frag(v2f o) : SV_Target
					{
						float4 color = tex2D(_UV, o.uv);
						return float4(color.xyz, _Alpha);
					}
						ENDCG
				}
				pass {
					Tags{ "LightMode" = "ForwardBase" }
					Cull Back
					ZWrite Off         //关深度写入
					Blend SrcAlpha OneMinusSrcAlpha
					CGPROGRAM
						// Physically based Standard lighting model, and enable shadows on all light types
						#pragma vertex vert
						#pragma fragment frag
						#include "UnityCG.cginc"



						sampler2D _UV;
						float4 _UV_ST;
						float _Alpha;

						struct v2f {
							float4 vertex : POSITION;
							float2 uv :TEXCOORD0;
						};
						v2f vert(appdata_full data)
						{
							v2f o;
							o.vertex = UnityObjectToClipPos(data.vertex);
							o.uv = TRANSFORM_TEX(data.texcoord, _UV);
							return o;
						}
						float4 frag(v2f o) : SV_Target
						{
							float4 color = tex2D(_UV, o.uv);
							return float4(color.xyz, _Alpha);
						}
						ENDCG
					}
		}
}
