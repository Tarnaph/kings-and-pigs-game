// Inherit the parent event
event_inherited();

switch(estado)
{
	case "idle":
		muda_sprite(s_artefatos_bomba_idle);
	break;
	
	case "on":
		muda_sprite(s_artefatos_bomba_on);
		//_time -= 1;
		if (image_index >= image_number-vel_sprite(s_artefatos_bomba_on))
		{
			estado = "boom"
			if(_time <= 0)
			{ estado = "boom"; _time = time;}
		}		
	break;
	
	case "boom":
		velh = 0;
		muda_sprite(s_artefatos_bomba_boom);
		criaShakeCamera(2);
		if (image_index >= image_number-vel_sprite(s_artefatos_bomba_boom))
		{
			 
			/*var _player = instance_place(x,y,oPlayersIdle);
			if (_player) { _player.estado = "hit";}*/
			instance_destroy();
		}
		
		
	
		var _bomba = instance_place(x,y,oBomba);
		if(_bomba) { _bomba.estado = "on"; }
	break;
}


