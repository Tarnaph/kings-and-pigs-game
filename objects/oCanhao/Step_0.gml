// Inherit the parent event
event_inherited();

switch(estado)
{
	case "idle":
		muda_sprite(s_artefatos_canhao_idle);
		
	break;
	
	case "on":
		muda_sprite(s_artefatos_canhao_fire);
		if (image_index >= image_number-3)
		{
			var _bola = instance_create_layer(x + (25* image_xscale), y - (10), layer, oBola);
			_bola.estado = "voando";
			_bola.velh = (7 + random_range(-2,4)) * image_xscale;
			_bola.velv = -3;
			estado = "espera";		
		}		
	break;
	
	case "espera":
		muda_sprite(s_artefatos_canhao_idle);
		_time -= .1;
		if (_time <= 0)
		{
			_time = time;
			estado = "idle"
		}
break;
}