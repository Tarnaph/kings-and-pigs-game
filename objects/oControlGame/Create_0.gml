global.coin = 0;
global._coin = global.coin;


global.diamantes = 2;
global._diamantes = global.diamantes;

global.vida = 2;
global._vida = global.vida;

/*
global.timeJump = room_speed *2;
global._timeJump = global.timeJump ;

global.timeDash = room_speed *2;
global._timeDash = global.timeDash ;
*/ 

// Desenha gui
desenhar = function(_sprit, _x, _y, _scale)
{
	draw_sprite_ext(_sprit,5*(get_timer() /1000000),_x, _y,_scale,2,0,c_white,1);
}


