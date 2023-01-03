// Inherit the parent event
event_inherited();

switch(estado)
{
	case "pegabomba":
		muda_sprite(s_porco_bomber_pick);		
		if (image_index >= image_number-vel_sprite(s_porco_bomber_pick))
		{
			instance_change(oPorcoBomber, true);
		}
	break;
	
	case "ligacanhao":
		criaBalao(5,34,0,oBalaoAtack);
		muda_sprite(s_porco_fosforo_canhao);
		if (image_index >= image_number-vel_sprite(s_porco_fosforo_canhao))
		{
			_canhao = instance_place(x,y,oCanhao);
			if(_canhao)
			{
				_canhao.estado ="on";
			}
			estado = "idle";
			destroiBalao(oBalaoAtack);
		}
	break;
	
	case "idle":
		muda_sprite(s_porco_idle);
		if (image_index >= image_number-vel_sprite(s_porco_idle)){estado = "patrulha";}
	break;
	
	case "patrulha":
		ver_player_e_ataca("ataca",0);
		interagir_com_objeto(oCanhao, "ligacanhao",false);
		
		interagir_com_objeto(oBomba, "pegabomba",true);
		patrulhar(s_porco_run, s_porco_idle);
	break;
	
	case "run":
		muda_sprite(s_porco_run);
	break;
	
	case "ataca":
		criaBalao(5,34,3,oBalaoAtack);
		velh = 3* image_xscale;
		muda_sprite(s_porco_attack);
		if (image_index >= image_number-vel_sprite(s_porco_attack))
		{
			
			velh = 0;
			estado = "idle";
			destroiBalao(oBalaoAtack);
			_balao = false;
		}
	
	break;
	
	case "dano":
		criaBalao(5,34,0,oBalaoHit);
		velh = 0;
		muda_sprite(s_porco_hit);
		if (image_index >= image_number-vel_sprite(s_porco_hit))
		{
			_vida -= 1;
			destroiBalao(oBalaoHit);
			if(_vida <= 0) {estado = "morto";} else {estado = "patrulha";}
		}
		
	break;
	
	case "morto":
		muda_sprite(s_porco_dead);
		if (image_index >= image_number-vel_sprite(s_porco_hit))
		{
			image_speed = 0;
			image_index = image_number-vel_sprite(s_porco_hit);
		}
		
	break;
}
