if(mouse_check_button_pressed(mb_left)) {
    //Array que junta los puntos por los que pasa el mouse.
    lazo_puntos = [];
    //booleano que avisa que se tienen que agregar puntos al array
    dibujando = true;

    //Pone el primer punto para que "last" no tire error
    array_push(lazo_puntos, [mouse_x, mouse_y]);
}

if(dibujando) {

var last = lazo_puntos[array_length(lazo_puntos) - 1];

    // Evita puntos demasiado juntos
    if (point_distance(last[0], last[1], mouse_x, mouse_y) > 3) {
        array_push(lazo_puntos, [mouse_x, mouse_y]);
    }

}

if(mouse_check_button_released(mb_left)){
    //Avisa que dejaste de dibujar.
    dibujando = false;
    //Script que cierra el lazo (bah, la superficie en realidad)
    cerrar_lazo();

    generar_superficie_lazo();
	}