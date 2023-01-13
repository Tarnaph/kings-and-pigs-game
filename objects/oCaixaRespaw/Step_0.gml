// Inherit the parent event
event_inherited();

//if(estaNoChao()){ estado = "on"}

global._timeRespaw--;

if(global._timeRespaw <= (150) ) { estado= "idle" } else { estado = "espera" }

//show_debug_message(global._timeRespaw)

switch(estado)
{
		
	case "espera":
		patrulhar(s_artefato_caixa_look, s_artefato_caixa_look);
	break;
	
	
	case "idle":
		velh = 0;
		muda_sprite(s_artefato_caixa_look);
		//criaShakeCamera(1);
		if (image_index >= image_number-vel_sprite(s_artefato_caixa_look))
		{
			
			if(global._level <= 5)
			{
				_r = random(global._level/2);
				repeat(_r+1)
				{ 
					var _porco = instance_create_layer(x, y -14, layer, oPorco );
					_porco.velh = random_range(1,1) * choose(-1,1);
					_porco.velv = random_range(-1,-2);
					_porco.cairdaplataforma = true;	
					_porco.estado = "run";
					_porco._vida = global._level/3;
				}
			}
			if(global._level >= 2 && global._level <= 5)
			{
				_r = random(global._level/2);
				repeat(_r+1)
				{ 
					var _porcoBomber = instance_create_layer(x, y -14, layer, oPorcoBomber );
					_porcoBomber.velh = random_range(1,1) * choose(-1,1);
					_porcoBomber.velv = random_range(-1,-2);
					_porcoBomber.cairdaplataforma = true;	
					_porcoBomber.estado = "run";
					_porcoBomber._vida = global._level/3;
				}
			}
			
			if(global._level >= 3 && global._level <= 5)
			{
				_r = random(global._level/2);
				repeat(_r)
				{ 
					var _porcoCaixa = instance_create_layer(x, y -14, layer, oPorcoCaixa );
					_porcoCaixa.velh = random_range(1,1) * choose(-1,1);
					_porcoCaixa.velv = random_range(-1,-2);
					_porcoCaixa.cairdaplataforma = true;	
					_porcoCaixa.estado = "run";
					_porcoCaixa._vida = global._level/2;
				}
			}
			
			if(global._level >= 6)
			{
				if(!instance_exists(oMage))
				{
					_r = random(global._level/2);
					repeat(1)
					{ 
						var _maga = instance_create_layer(x, y -14, layer, oMage );
						_maga.velh = random_range(1,1) * choose(-1,1);
						_maga.velv = random_range(-1,-2);
						_maga.cairdaplataforma = true;	
						_maga.estado = "run";
						_maga._vida = global._level*2;
					}
				}
			}
			if(global._timeRespaw < 0){global._timeRespaw = global.timeRespaw * global._level /2;}
			
			estado = "espera"
			
		}
		
		var _bomba = instance_place(x,y,oBomba);
		if(_bomba) { _bomba.estado = "on"; }
		
		
	break;
}



