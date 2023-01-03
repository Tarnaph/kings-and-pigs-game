// gravidade
	velv += grav;

//verifica se esta no chao
function estaNoChao()
{
	var _chao = place_meeting(x, y + 1, oChao);
	return _chao;
}

// olha para onde esta andando
if(velh !=0) { image_xscale = sign(velh); }

// sprite 
muda_sprite = function(_sprite)
{
	if (sprite_index != _sprite)
	{
		sprite_index = _sprite;
		image_index = 0;
	}
}

	
	