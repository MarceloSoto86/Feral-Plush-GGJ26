function cerrar_lazo() {
    if (array_length(lazo_puntos) < 3) return;

    //Primer punto
    var p0 = lazo_puntos[0];
    //Ultimo punto
    var pN = lazo_puntos[array_length(lazo_puntos) - 1];

    // Si estan lejos hace un Snap automático y cierra la forma
    if (point_distance(p0[0], p0[1], pN[0], pN[1]) < 20) {
        //Basicamente agrega un ultimo punto al array en la misma posicion que el primero.
        array_push(lazo_puntos, p0);
    }
}