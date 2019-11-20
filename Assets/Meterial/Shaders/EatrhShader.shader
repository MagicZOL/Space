Shader "pro/EatrhShader"
{
    Properties
    {
        _MainTex1 ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "white" {}
        _TexValue ("Texture Value", Range(0,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex1;
        sampler2D _MainTex2;
        float _TexValue;

        struct Input
        {
            float2 uv_MainTex1;
            float2 uv_MainTex2;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex1, IN.uv_MainTex1);
            fixed4 d = tex2D (_MainTex2, IN.uv_MainTex2);

            o.Albedo = lerp(c.rgb, d.rgb, _TexValue); //a와b의 중간값
            o.Alpha = d.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
