//DESACTIVAR SCRIPT DE "player_movement" EN STEP DE OBJ_PLAYER PARA TESTEOS
//Movimiento con gravedad activable (NO ES ESTABLE AUN)



function playerGravity(){
jumpKeyPressed = keyboard_check_pressed(vk_space)
// move_x/xspd --> para ASDW reeplazar vk_left por ord(“A”) y vk_right por ord(“D”)
// esto sustrae el valor de izquierda de la derecha para obtener el valor a desplazar
moveDir = keyboard_check(vk_right) - keyboard_check(vk_left);
//Movimiento horizontal es la velocidad de playerInit * la dirección
move_x = moveSpd * moveDir;
if move_x > 0
	{sprite_index = spr_player_right;
	image_speed = 0.45;}
else if move_x < 0
	{sprite_index = spr_player_left
	image_speed = 0.45;}
else
image_speed = 0
	
meet_ground = place_meeting(x,y+(2*dir_grav),obj_wall)
if(meet_ground)
{
	move_y = 0;
	can_jump = true;
	
	//Salto
	if (jumpKeyPressed && can_jump)
	{
		yspd = jspd;
		move_y = jspd*dir_grav;
	}
	
}
else //en el aire
{
	//aplica gravedad según dirección
		if (abs(move_y) <= 10) {
		move_y += (0.30* dir_grav);
	}
	
	//salto controlado
	if(keyboard_check_released(vk_space)) {
		if(dir_grav == 1 && move_y	< -3) move_y= -3;
		if(dir_grav == -1 && move_y > 3) move_y= 3;
	}
}
move_and_collide(move_x, move_y,obj_wall, 4,0,0,moveSpd,-1);
}
