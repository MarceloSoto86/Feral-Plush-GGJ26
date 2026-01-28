// Dibuja la superficie con shader de distorsión si existe
if (surface_exists(superf_lazo)) {
    // Crear superficie de fondo si no existe
    if (!surface_exists(superf_fondo)) {
        superf_fondo = surface_create(room_width, room_height);
    }

    // Captura lo que hay en pantalla antes de aplicar efectos
    surface_set_target(superf_fondo);
    draw_clear_alpha(c_black, 0);

    // Copia el contenido actual del application surface
    draw_surface(application_surface, 0, 0);

    surface_reset_target();

    // Aplicar shader de distorsión
    shader_set(sh_distorsion_lazo);

    //Agarra el tiempo, lo convierte en segundos (dividiendo por 1000)  y se lo pasa al shader.
    shader_set_uniform_f(shader_get_uniform(sh_distorsion_lazo, "u_time"), current_time / 1000);

    //Manda la info del tamaño y resolución de pantalla (room) al shader.
    var u_resolution = shader_get_uniform(sh_distorsion_lazo, "u_resolution");
    shader_set_uniform_f(u_resolution, room_width, room_height);

    //Agarra la textura de lo que esté debajo del polígono que se crea con el lazo y lo manda al shader.
    var u_mascara = shader_get_sampler_index(sh_distorsion_lazo, "u_mascara");
    texture_set_stage(u_mascara, surface_get_texture(superf_lazo));

    // Dibuja el fondo con distorsión
    draw_surface(superf_fondo, 0, 0);

    shader_reset();
}

//Dibuja la linea.
//Basicamente revisa si hay por lo menos dos puntos y despues se unen p0 y p1 (punto 0 y punto 1) por una linea.

if (array_length(lazo_puntos) >= 2) {
    //Define el color de la linea
    draw_set_color(c_fuchsia);

    for (var i = 0; i < array_length(lazo_puntos) - 1; i++) {

    //Se repite partiendo desde el último punto hasta completar el trazo. Por eso son solo 2 puntos.
        var p0 = lazo_puntos[i];
        var p1 = lazo_puntos[i + 1];

//intento de efecto glow en la linea. bien uga buga. 
//Son lineas superpuestas con distinta opacidad.
//Con el numerito del final, cambian el grosor de cada linea

     // Glow externo
        draw_set_alpha(0.1);
        draw_line_width(p0[0], p0[1], p1[0], p1[1], 8);

        // Glow medio
        draw_set_alpha(0.3);
        draw_line_width(p0[0], p0[1], p1[0], p1[1], 5);

        // Glow interno
        draw_set_alpha(0.6);
        draw_line_width(p0[0], p0[1], p1[0], p1[1], 3);

        // Línea principal
        draw_set_alpha(1);
        draw_line_width(p0[0], p0[1], p1[0], p1[1], 2);
    }
    draw_set_alpha(1);
}