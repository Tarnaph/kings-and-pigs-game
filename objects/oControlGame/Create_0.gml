global.diamantes = 3;


desenhar = function(_sprit, _x, _y, _scale)
{
	draw_sprite_ext(_sprit,5*(get_timer() /1000000),_x, _y,_scale,2,0,c_white,1);
}


