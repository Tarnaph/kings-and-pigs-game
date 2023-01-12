// Inherit the parent event
event_inherited();

switch(estado)
{
	case "idle":
		muda_sprite(s_boss_maga_magic);
	break;
	
	case "on":
		muda_sprite(s_boss_maga_magic);
		//_time -= 1;
		/*
		if (image_index >= image_number-vel_sprite(s_boss_maga_magic))
		{
			estado = "boom"
			if(_time <= 0)
			{ estado = "boom"; _time = time;}
		}	*/	
	break;
	
	case "boom":
	/*
		velh = 0;
		muda_sprite(s_boss_maga_magic);
		criaShakeCamera(1);
		if (image_index >= image_number-vel_sprite(s_boss_maga_magic))
		{
			 
			/*var _player = instance_place(x,y,oPlayersIdle);
			if (_player) { _player.estado = "hit";}
			instance_destroy();
		}
*/
		
	break;
}


