
//verifica se esta no chao
function estaNoChao()
{
	var _chao = place_meeting(x, y + 1, oChao);
	return _chao;
}



/* Faz a mudança do sprite */
muda_sprite = function(_sprite)
{
	if (sprite_index != _sprite)
	{
		sprite_index = _sprite;
		image_index = 0;
	}
}

/* Retorna a velocidade real da sprite*/
vel_sprite = function(_sprite)
{
	return sprite_get_speed(_sprite) / room_speed;
}

// Se bater na parede volta ou se achar buraco na frente
if((place_meeting(x + velh, y, oChao))) { velh *= -1;  }

/* Muda o x no sentido da velocidade horizontal */
if(velh !=0) { image_xscale = sign(velh); }