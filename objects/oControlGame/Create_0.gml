global.coin = 0;
global._coin = global.coin;

global.diamantes = 0;
global._diamantes = global.diamantes;

global.vidaMaxima = 3;
global.vida = global.vidaMaxima;
global._vida = global.vida;

global.key = 1;
global._key = global.key;

global.level = 1;
global._level = 1;

///  @Desenha gui
desenhar = function(_sprit, _x, _y, _scale)
{
	draw_sprite_ext(_sprit,5*(get_timer() /1000000),_x, _y,_scale,2,0,c_white,1);
}

//@ audio
if !audio_is_playing(global._music)
{
	
	audio_play_sound(global._music, 0 , true);
}

//@reseta status
function resetaStatus()
{
	global._vida = global.vida;
	global._key = global.key;
	global._level = global.level;
	global._coin = global.coin;
}




