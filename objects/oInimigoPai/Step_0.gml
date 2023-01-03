/*switch(estado)
{
	case "pegabomba":
		muda_sprite(s_porco_bomber_pick);		
		if (image_index >= image_number-vel_sprite(s_porco_bomber_pick)){estado = "idle";}
	break;
	
	case "idle":
		muda_sprite(s_porco_bomber_idle);
		if (image_index >= image_number-vel_sprite(s_porco_bomber_idle)){estado = "patrulha";}
	break;
	
	case "patrulha":
			ver_player_e_ataca("jogabomba");
			patrulhar(s_porco_bomber_run);
	break;
	
	case "run":
		muda_sprite(s_porco_bomber_run);
	break;
	
	case "jogabomba":
		muda_sprite(s_porco_bomber_joga);
		if (image_index >= image_number-vel_sprite(s_porco_bomber_joga))
		{
			var _bomba = instance_create_layer(x, y -14, layer, oBomba );
			_bomba.velh = random_range(1,5) * image_xscale;
			_bomba.velv = random_range(-1,-10);
			_bomba.momento = "on";
			estado = "idle";
		}
	break;
	
	case "dano":
		velh = 0;
		muda_sprite(s_porco_bomber_hit);
		if (image_index >= image_number-vel_sprite(s_porco_bomber_hit))
		{
			_vida -= 1;
			if(_vida <= 0) {estado = "morto";} else {estado = "patrulha";}
		}
		
	break;
	
	case "morto":
		muda_sprite(s_porco_bomber_dead);
		if (image_index >= image_number-vel_sprite(s_porco_bomber_hit))
		{
			image_speed = 0;
			image_index = image_number-vel_sprite(s_porco_bomber_hit);
		}
		
	break;
}
*/