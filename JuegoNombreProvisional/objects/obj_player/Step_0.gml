//Función con los movimientos del player
//player_movement();
playerGravity();
if keyboard_check_pressed(vk_control)
	if (mask_on) && jumpKeyPressed {
			move_y *= -1; // Invierte la dirección: de 1 a -1 o viceversa
			// Aleja un pixel del suelo/techo actual 
			 y += (2 * dir_grav); 
		}