// Inherit the parent event
event_inherited();

switch(estado)
{
	case "idle":
		muda_sprite(s_porco_caixa_idle);
		if (image_index >= image_number-vel_sprite(s_porco_caixa_idle)){estado = "patrulha";}
	break;
	
	case "patrulha":
			ver_player_e_ataca("ataca",0);
			patrulhar(s_porco_caixa_run, s_porco_caixa_idle);
	break;
	
	case "run":
		muda_sprite(s_porco_caixa_run);
		if (image_index >= image_number-vel_sprite(s_porco_caixa_run)){estado = "patrulha";}
	break;
	
	case "ataca":
		muda_sprite(s_porco_caixa_attack);
		if (image_index >= image_number-vel_sprite(s_porco_caixa_attack))
		{
			var _caixa = instance_create_layer(x, y -14, layer, oCaixa );
			_caixa.velh = random_range(3,7) * image_xscale;
			_caixa.velv = random_range(-1,-8);
			_caixa.estado = "idle";
			estado = "idle";
		}
	break;
	
	case "dano":
		velh = 0;
		muda_sprite(s_porco_caixa_hit);
		if (image_index >= image_number-vel_sprite(s_porco_caixa_hit))
		{
			_vida -= 1;
			if(_vida <= 0) {estado = "morto";} else {estado = "patrulha";}
		}
		
	break;
	
	case "morto":
		muda_sprite(s_porco_caixa_dead);
		if (image_index >= image_number-vel_sprite(s_porco_caixa_hit))
		{
			image_speed = 0;
			image_index = image_number-vel_sprite(s_porco_caixa_hit);
			criaLot();
			var _key = instance_create_layer(x, y, layer, oKey );
				_key.velh = random_range(-4,6);
				_key.velv = random_range(-4,-6);
			instance_destroy();
		}
		
	break;
}
