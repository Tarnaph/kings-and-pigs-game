// Inherit the parent event
event_inherited();

if(estaNoChao()){ estado = "boom"}

switch(estado)
{
	case "idle":
		muda_sprite(s_artefato_caixa_idle);
	break;
	
	
	case "boom":
		velh = 0;
		muda_sprite(s_artefatos_bomba_boom);
		criaShakeCamera(1);
		if (image_index >= image_number-vel_sprite(s_artefatos_bomba_boom))
		{
			_r = random(2);
				repeat(_r+1)
				{ 
				var _bomba = instance_create_layer(x, y -14, layer, oBomba );
				_bomba.velh = random_range(1,3) * choose(-1,1);
				_bomba.velv = random_range(-1,-3);
				_bomba.estado = "on";
			}
			_r = random(1);
				repeat(_r+1)
				{ 
				var _porco = instance_create_layer(x, y -14, layer, oPorco );
				_porco.velh = random_range(1,2) * choose(-1,1);
				_porco.velv = random_range(-1,-2);
				_porco.estado = "idle";
			}
			
			
			instance_destroy();
		}
		
		
	
		var _bomba = instance_place(x,y,oBomba);
		if(_bomba) { _bomba.estado = "on"; }
	break;
}



