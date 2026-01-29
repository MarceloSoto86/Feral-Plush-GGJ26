// si estamos en suelo/terreno sólido

//if(place_meeting(x,y+2,obj_ground))
//{
	//instance_change(obj_playerclone,true);
//	var _inst = instance_create_layer(x,y,"Instances",obj_playerclone)
//	instance_destroy()
//}

if (mask_on) {
    dir_grav *= -1; // Invierte la dirección: de 1 a -1 o viceversa
    
    // Aleja un pixel del suelo/techo actual 
   
    y += (2 * dir_grav); 
}