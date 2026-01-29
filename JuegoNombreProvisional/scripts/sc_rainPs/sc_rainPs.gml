function sc_rainPs(){
//Sistema de partículas
numHalfW = sprite_width div 2;
numHalfH = sprite_height div 2;

psRain = part_system_create_layer("Instances",false);

//Partículas de lluvia
prtRain = part_type_create();
part_type_speed(prtRain, 12,16,0,0);
part_type_direction(prtRain,270,275,0,0);
part_type_shape(prtRain, pt_shape_line);
part_type_orientation(prtRain,0,5,0,0,true);
part_type_size(prtRain,0.0625,0.125,0,0);
part_type_color_mix(prtRain,c_white,c_teal);
part_type_life(prtRain,27,30);
part_type_scale(prtRain,2,1);

//Emisor
peRain = part_emitter_create(psRain);
part_emitter_region(psRain,peRain,x,x+sprite_width,y+numHalfH,y+numHalfH,ps_shape_rectangle,ps_distr_linear);
part_emitter_stream(psRain,peRain,prtRain,7);
}