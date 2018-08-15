// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33997,y:32644,varname:node_3138,prsc:2|emission-5676-OUT,alpha-8005-OUT;n:type:ShaderForge.SFN_Tex2d,id:8231,x:32521,y:32746,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_8231,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1419-UVOUT;n:type:ShaderForge.SFN_ScreenPos,id:1419,x:32245,y:32753,varname:node_1419,prsc:2,sctp:2;n:type:ShaderForge.SFN_Fresnel,id:4004,x:32559,y:32922,varname:node_4004,prsc:2|EXP-2093-OUT;n:type:ShaderForge.SFN_Add,id:4997,x:33155,y:32813,varname:node_4997,prsc:2|A-8231-RGB,B-3371-OUT;n:type:ShaderForge.SFN_Vector1,id:2093,x:32296,y:33026,varname:node_2093,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Add,id:3371,x:32852,y:32862,varname:node_3371,prsc:2|A-4004-OUT,B-4004-OUT;n:type:ShaderForge.SFN_Tex2d,id:4396,x:32955,y:33171,ptovrint:False,ptlb:Gradient,ptin:_Gradient,varname:node_4396,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5075-UVOUT;n:type:ShaderForge.SFN_Add,id:4984,x:33359,y:32919,varname:node_4984,prsc:2|A-4997-OUT,B-4396-RGB;n:type:ShaderForge.SFN_TexCoord,id:5075,x:32757,y:33171,varname:node_5075,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Lerp,id:5676,x:33289,y:32671,varname:node_5676,prsc:2|A-8231-RGB,B-7868-OUT,T-3371-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7868,x:32752,y:32547,ptovrint:False,ptlb:node_7868,ptin:_node_7868,varname:node_7868,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Lerp,id:8005,x:33803,y:33072,varname:node_8005,prsc:2|A-6002-OUT,B-8172-OUT,T-9236-OUT;n:type:ShaderForge.SFN_Vector1,id:6002,x:33320,y:33069,varname:node_6002,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:8172,x:33320,y:33146,varname:node_8172,prsc:2,v1:0;n:type:ShaderForge.SFN_Fresnel,id:4652,x:33320,y:33225,varname:node_4652,prsc:2|EXP-4723-OUT;n:type:ShaderForge.SFN_Vector1,id:4723,x:33155,y:33259,varname:node_4723,prsc:2,v1:3;n:type:ShaderForge.SFN_Add,id:7664,x:33504,y:33250,varname:node_7664,prsc:2|A-4652-OUT,B-4652-OUT;n:type:ShaderForge.SFN_Clamp01,id:9236,x:33681,y:33240,varname:node_9236,prsc:2|IN-7664-OUT;proporder:8231-4396-7868;pass:END;sub:END;*/

Shader "shaders/Portal" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
        _Gradient ("Gradient", 2D) = "white" {}
        _node_7868 ("node_7868", Float ) = 0
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
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _node_7868;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 projPos : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
////// Lighting:
////// Emissive:
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(sceneUVs.rg, _Texture));
                float node_4004 = pow(1.0-max(0,dot(normalDirection, viewDirection)),1.5);
                float node_3371 = (node_4004+node_4004);
                float3 emissive = lerp(_Texture_var.rgb,float3(_node_7868,_node_7868,_node_7868),node_3371);
                float3 finalColor = emissive;
                float node_4652 = pow(1.0-max(0,dot(normalDirection, viewDirection)),3.0);
                return fixed4(finalColor,lerp(1.0,0.0,saturate((node_4652+node_4652))));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
