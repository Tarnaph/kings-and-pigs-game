// Inherit the parent event
event_inherited();

// patrulha no chao
if (ipatrulha && estaNoChao())
{
	// time da patrulha, volta a patrulha e escolhe o lado
	iandandotime -= 1;
	if(iandandotime <= 0 ) // acabou o tempo
	{
		iandando = choose(true, false); // escolhe se anda ou n 
		if(iandando)
		{
			velh = choose(vel,-vel); // escolhe que lado andar
		}
		else
		{
			velh = 0;
		}
		iandandotime = room_speed *2; // reseta o time de andar
	}
	// bate na parede volta
	if((podecair == false) && (place_meeting(x + velh * 10, y + 1, oChao) == false ))
	{
		velh *= -1;
	}
	
	// checando se colidi com bomba
	var _bomba = instance_place(x,y,oBomba);
		if(_bomba && _bomba.momento == "off")
		{
			velh = 0;
			_bomba.momento = "on"
		}
	
}	
	// se colidir com uma bomba
	/*
	if(momento == "fogonabomba")
	{
		tempo -= .45;
		velh =0;
		if(tempo <= 0)
		{
			momento = "normal";
			tempo = danotime;
		}
		
		show_debug_message("asd");
	}
	
	var _bomba = instance_place(x, y, oBomba);
	if (_bomba && _bomba.momento == "off") 
	{ 		
		sprite_index = s_porco_fosforo_idle;
		_bomba.momento = "on";
		momento = "fogonabomba";
		
	}	
	*/
	

/*
if(momento == "fogonabomba")
{
	if(sprite_index != s_porco_fosforo_idle)
	{
		
		sprite_index = s_porco_fosforo_idle;
		image_index = 0;
		
	}
	if(image_index >= image_number -1)
	{
		var _bomba = instance_place(x,y,oBomba);
		if(_bomba)
		{
			_bomba.momento = "on";
		}
		
	}
}
*/

