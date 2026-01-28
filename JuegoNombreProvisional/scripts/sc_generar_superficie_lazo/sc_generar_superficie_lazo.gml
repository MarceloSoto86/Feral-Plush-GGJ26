function generar_superficie_lazo() {
    if (array_length(lazo_puntos) < 3) return;

    // Destruye superficie anterior si existe
    if (surface_exists(superf_lazo)) {
        surface_free(superf_lazo);
    }

    // Crea nueva superficie del tamaño de la room
    superf_lazo = surface_create(room_width, room_height);

    // Dibuja en la superficie de la room para generar la mascara
    surface_set_target(superf_lazo);
    // Superficie transparente
    draw_clear_alpha(c_black, 0);

    // Dibujar el polígono relleno
    draw_set_color(c_white);
    draw_primitive_begin(pr_trianglefan);

    //Por cada punto, un vertice en el polígono.
    for (var i = 0; i < array_length(lazo_puntos); i++) {
        draw_vertex(lazo_puntos[i][0], lazo_puntos[i][1]);
    }

    //Termina de dibujar
    draw_primitive_end();
    //Libera la superficie.
    surface_reset_target();
}