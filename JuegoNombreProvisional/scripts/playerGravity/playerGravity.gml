//DESACTIVAR SCRIPT DE "player_movement" EN STEP DE OBJ_PLAYER PARA TESTEOS
//Movimiento con gravedad activable (NO ES ESTABLE AUN)



function playerGravity(){
	jumpKeyPressed = keyboard_check_pressed(ord("W"));
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
// move_x/xspd --> para ASDW reeplazar vk_left por ord(“A”) y vk_right por ord(“D”)
// esto sustrae el valor de izquierda de la derecha para obtener el valor a desplazar
move_x = move_x * moveSpd; //el valor a desplazar en x se multiplica por la velocidad de movimiento

meet_ground = place_meeting(x,y+(2*dir_grav),obj_wall)
if(meet_ground)
{
	move_y = 0;
	can_jump = true;
	
	//if(keyboard_check_pressed(vk_space) && can_jump) {
	//	move_y = -jspd * dir_grav;
	//	can_jump = false;
	//}
	//Salto
	if (jumpKeyPressed && place_meeting(x,(y+1*dir_grav),obj_wall) && can_jump)
	{
		yspd = jspd;
	}
}
else //en el aire
{
	move_y += (0.8 * dir_grav);
	//limita velocidad
	if(dir_grav == 1) move_y = clamp(move_y,-jspd,14);
	else move_y = clamp(move_y,-14,jspd)
	
	//aplica gravedad según dirección
	if (abs(move_y) < 10) {
		move_y += (1* dir_grav);
	}
	
	//salto controlado
	if(keyboard_check_released(vk_space)) {
		if(dir_grav == 1 && move_y	< -3) move_y= -3;
		if(dir_grav == -1 && move_y > 3) move_y= 3;
	}
}

//CÓDIGO VIEJO
//if place_meeting(x,y+2,obj_ground) //este if es para verificar si se encuentra tocando el suelo el pj y lo hace chequeando dos pixeles en y
//{
//	move_y = 0; //si hay suelo, resetea el valor de move 'y' al tocarlo
//	if(!place_meeting(x+move_x,y+2,obj_ground) && place_meeting(x+move_x,y+10,obj_ground)) // este if hace un chequeo más amplio de los pixeles en y y asigna el movimiento horizontal a la caída vertical para deslizarse mejor sobre laderas
//	{
//		move_y = abs(move_x); //al ser abs(), el valor negativo del salto se convierte en positivo, es decir, cae/se mueve hacia abajo por gravedad
//		move_x = 0;
//	}
//	if keyboard_check(vk_space) move_y = -jump_speed; //el valor negativo de jump speed hace que salte/se dispare hacia arriba
//}
//else if move_y < 10 // si está en el aire esto chequea la velocidad y si es menor a 10 la incrementa, es decir, crea gravedad
//{
//	move_y += 1;
	
//	// salto controlado:

//if(keyboard_check_released(vk_space)) && move_y < -3
//{
//	move_y = -3;
//}
//}



move_and_collide(move_x, move_y,obj_wall, 4,0,0,moveSpd,-1); //los dos últimos argumentos limitan la velocidad máxima en ambas direcciones (en x la limita mientras que en y no)
if move_x != 0
{
	image_xscale = sign(move_x);
}

//if (!collision_rectangle(x-8,y,x+8,y+1,obj_ground,false,false)) {
//	gravity = 0.3;
//}

//if (vspeed > 0) {
//	var ground = collision_rectangle(x-8,y,x+8,y+vspeed,obj_ground,false,false);
//	if (ground) { 
//		y = ground.y;
//		vspeed = 0;
//		gravity = 0;
//	}
//}
}