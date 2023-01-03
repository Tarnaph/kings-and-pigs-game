// Inherit the parent event
event_inherited();

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
		if (image_index >= image_number-vel_sprite(s_porta_open)){ estado = "idle"; }
	break;
}