varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform sampler2D u_mascara; // La máscara del lazo
uniform vec2 u_resolution;

void main()
{
    vec2 uv = v_vTexcoord;

    // Lee la máscara para saber si estamos dentro del lazo
    vec4 mascara = texture2D(u_mascara, uv);

    if (mascara.a > 0.1) { // Si estamos dentro del lazo


        // Ondas verticales
        float onda1 = sin(uv.x * 140.0 + u_time * 4.0) * 0.002;
        float onda2 = sin(uv.x * 100.0 + u_time * 3.0 + 1.5) * 0.001;

        // Ondas horizontales
        float onda3 = cos(uv.y * 20.0 + u_time * 2.5) * 0.002;


        // Aplicar distorsión
        uv.y += onda1 + onda2  * 0.01;
        uv.x += onda3;

    }

    // Leer el color del fondo con las coordenadas distorsionadas
    vec4 col = texture2D(gm_BaseTexture, uv);


    if (mascara.a > 0.1) {
    // Color rosita
       vec3 tint = vec3(0.7, 0.2, 1.0);
       //el pulse hace que lata el efecto. aumenta y reduce opacidad
        float pulse = 0.8 + 0.2 * sin(u_time * 2.0);
        col.rgb = mix(col.rgb, tint, 0.15 * pulse);

        // Aumenta brillo sutilmente
        col.rgb += vec3(0.05) * pulse;
    }

    gl_FragColor = v_vColour * col;
}