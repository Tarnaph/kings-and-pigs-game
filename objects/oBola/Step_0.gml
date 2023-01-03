// Inherit the parent event
event_inherited();

switch(estado)
{
	case "idle":
		// transforma bola parada em bomba muahahaha
		if (velh == 0) { instance_change(oBomba, true); }

		if(velh > 0){ estado = "voando";}
	break;
	
	case "voando":
		// se a bala acerta outra bomba ativa ela
		var _bomba = instance_place(x,y,oBomba);
		if(_bomba) { _bomba.estado = "boom"; }
		
		if(velh = 0){ estado = "idle";}
	break;
	
	case "boom":
		instance_destroy();
	break;
}

