// Inherit the parent event
event_inherited();

if(saida)
{
	if(global._key > 0) { image_alpha = 1 } 
	else { image_alpha = 0.3 }
	
}

switch(estado)
{
	case "idle":
		muda_sprite(s_porta_idle);
	break;
	
	case "open":
		muda_sprite(s_porta_open);
		if (image_index >= image_number-vel_sprite(s_porta_open))
		{
			image_speed = 0;
			image_index = image_number-vel_sprite(s_porta_open);
		}
		
	break;
	
	case "close":
		muda_sprite(s_porta_close);
		if (image_index >= image_number-vel_sprite(s_porta_close))
		{ 
			estado = "idle";
			if(!saida){global._key -= 1}
		}
	break;
}