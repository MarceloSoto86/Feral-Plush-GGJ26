function player_movement(){
//Obtener input

rightKey = keyboard_check(ord("D"));
leftKey = keyboard_check(ord("A"));
jumpKeyPressed = keyboard_check_pressed(ord("W"));

//Movimiento en X
//Dirección
moveDir = rightKey - leftKey;

//Obtener velocidad en x
xspd = moveDir * moveSpd;

//Colisiones en x
var _subPixel = .5;
if place_meeting(x+xspd,y,obj_wall)
{
	//Acercarse de forma precisa a la pared
	var _pixelCheck = _subPixel * sign(xspd);
	while !place_meeting(x + _pixelCheck,y,obj_wall)
	{
		x += _pixelCheck;
	}
	//Setear xspd a 0 para "colisionar"
	xspd = 0;
}

//Moverse
x += xspd;

//Movimiento en Y
	//Gravedad
	yspd += grav;
	
	//Dar tope a velocidad de caída
	//if yspd > termVel { yspd = termVel; };

	//Salto
	if jumpKeyPressed && place_meeting(x,y+1,obj_wall)
	{
		yspd = jspd;
	}
	
//Colisiones en Y
//var _subPixel = .5;
if place_meeting(x,y+yspd,obj_wall)
{
	//Acercarse de forma precisa al suelo
	var _pixelCheck = _subPixel * sign(yspd);
	while !place_meeting(x,y + _pixelCheck,obj_wall)
	{
		y += _pixelCheck;
	}
	
	//Setear velocidad de Y a 0 para "colisionar"
	yspd = 0;
}
	
//Moverse
y += yspd;
}