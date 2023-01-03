// gravidade
velv += grav;

//verifica se esta no chao
function estaNoChao()
{
	var _chao = place_meeting(x, y + 1, oChao);
	return _chao;
}

// reduz a vel do bola no chao e ar
if(estaNoChao()) { if(velh != 0){ velh *= .9;} }
else { velh *= .97;}

// dano no players
if(velh != 0)
{
var _player = instance_place(x,y,oPlayersIdle);
if (_player) { _player.tomandodano = true;}
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
