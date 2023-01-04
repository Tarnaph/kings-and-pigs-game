// Inherit the parent event
event_inherited();

switch(estado)
{
	case "pegabomba":
		muda_sprite(s_porco_bomber_pick);		
		if (image_index >= image_number-vel_sprite(s_porco_bomber_pick)){estado = "idle"; bomba += 1;}
	break;
	
	case "idle":
		muda_sprite(s_porco_bomber_idle);
		if (image_index >= image_number-vel_sprite(s_porco_bomber_idle)){estado = "patrulha";}
	break;
	
	case "patrulha":
			interagir_com_objeto(oBomba, "pegabomba",true);
			ver_player_e_ataca("ataca",0);
			patrulhar(s_porco_bomber_run, s_porco_bomber_idle);
	break;
	
	case "run":
		muda_sprite(s_porco_bomber_run);
	break;
	
	case "ataca":
		muda_sprite(s_porco_bomber_joga);
		if (image_index >= image_number-vel_sprite(s_porco_bomber_joga))
		{
			var _bomba = instance_create_layer(x, y -14, layer, oBomba );
			_bomba.velh = random_range(3,7) * image_xscale;
			_bomba.velv = random_range(-1,-8);
			_bomba.estado = "on";
			bomba -= 1;
			if (bomba <= 0){ instance_change(oPorco, true); } else {estado = "idle";}
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
			criaLot();
			instance_destroy();
		}
		
	break;
}
