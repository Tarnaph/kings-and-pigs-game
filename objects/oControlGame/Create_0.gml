global.diamantes = 2;
global._diamantes = global.diamantes;

global.vida = 3;
global._vida = global.vida;


// Desenha gui
desenhar = function(_sprit, _x, _y, _scale)
{
	draw_sprite_ext(_sprit,5*(get_timer() /1000000),_x, _y,_scale,2,0,c_white,1);
}


