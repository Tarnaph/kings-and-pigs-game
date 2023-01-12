// Inherit the parent event
event_inherited();

switch(estado)
{
	
	
	case "idle":
		muda_sprite(s_boss_maga_idle);
		if (image_index >= image_number-vel_sprite(s_boss_maga_idle)){estado = "patrulha";}
	break;
	
	case "patrulha":
			ver_player_e_ataca("ataca",0);
			patrulhar(s_boss_maga_run, s_boss_maga_idle);
	break;
	
	case "run":
		muda_sprite(s_boss_maga_run);
		if (image_index >= image_number-vel_sprite(s_boss_maga_run)){estado = "patrulha";}
	break;
	
	case "ataca":
		muda_sprite(s_boss_maga_attack);
		if (image_index >= image_number-vel_sprite(s_boss_maga_attack))
		{
			// magia
			var _m = instance_create_layer(x, y, layer, oMagic1 );
			_m.velh = random_range(1,2) * image_xscale;
			_m.estado = "on";
			
			// bomba
			_r = random(global._level/2);
				repeat(_r+1)
				{ 
				var _bomba = instance_create_layer(x, y -14, layer, oBomba );
				_bomba.velh = random_range(5,7) * choose(-1,1);
				_bomba.velv = random_range(-5,-9);
				_bomba.estado = "on";
			}
			
			estado = "idle"
		}
	break;
	
	case "dano":
		velh = 0;
		muda_sprite(s_boss_maga_hit);
		if (image_index >= image_number-vel_sprite(s_boss_maga_hit))
		{
			_vida -= 1;
			if(_vida <= 0) {estado = "morto";} else {estado = "patrulha";}
		}
		
	break;
	
	case "morto":
		muda_sprite(s_boss_maga_dead);
		if (image_index >= image_number-vel_sprite(s_boss_maga_dead))
		{
			image_speed = 0;
			image_index = image_number-vel_sprite(s_boss_maga_dead);
			criaLot();
			var _key = instance_create_layer(x, y, layer, oKey );
				_key.velh = random_range(-4,6);
				_key.velv = random_range(-4,-6);
			instance_destroy();
		}
		
	break;
}
