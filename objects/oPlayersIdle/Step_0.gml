// morto
if(estado != "morto")
{
	if(_hit == false)
	{
		// Controladores do personagem
		var _up,_left,_right,_down,_jump,_attack,_dash;
		_up = keyboard_check(inputs.up);
		_left = keyboard_check(inputs.left);
		_right = keyboard_check(inputs.right);
		_down = keyboard_check(inputs.down);
		_jump = keyboard_check(inputs.jump);
		_attack = keyboard_check(inputs.attack);
		_dash = keyboard_check(inputs.dash);
		
		/* Timer dash e jump  */
		if (global._timeJump < 120) { global._timeJump --}
		if (global._timeDash < 120) { global._timeDash --}
		if(global._timeJump <= 0 ) {global._timeJump = global.timeJump;}
		if(global._timeDash <= 0 ) {global._timeDash = global.timeDash;}
		
		if(_jump && estaNoChao() && global._timeJump >= 120){
			global._timeJump -= 80;
			velv = -velj;
		}
		if(_dash && estaNoChao() &&  global._timeDash >= 120) { 
			estado = "dash";
			global._timeDash -= 20;
		}
		
		//anda 
		velh = (_right - _left) * vel;

		// sprites
		if (velh != 0 && estaNoChao() && estado != "dash")  { estado = "anda";  }
		if (velv < 0  && !estaNoChao()) { estado = "pula";  }	
		if (velv > 0  && !estaNoChao()) { estado = "cai";  }	
		if(_attack && estaNoChao())     { estado = "ataca"; }
		
	
		if (velh = 0  && estaNoChao() 
		&& estado != "hit" 
		&& estado != "morto" 
		&& estado != "dash" 
		&& estado != "ataca"
		&& estado != "saindo"
		&& estado != "entrando")  
		{ estado = "idle";  }
	
		leva_dano_de_inimigo(oInimigoPai,"hit",false);
		leva_dano_de_projeto(oProjetoPai,"hit",false);
		
		// entra na porta
		if(_up && estaNoChao())
		{
			_tocou = instance_place(x,y,oPorta);
			if(_tocou && _tocou.saida == true)
			{ 
				velh = 0;
				_tocou.estado = "open"; 
				estado = "entrando";
			}
		}
	}
	contadorInvulneravel(1);
	
	// fallwall
	if(estaNaParede() 
		&& !estaNoChao() 
		//&& image_xscale == direcao
		&& velv > 0 
		&& estado != "hit"
		&& estado != "morto")
		{estado = "fallwall";}
	if(!estaNaParede()){ grav = .5;}
	
	// Pega pocao de vida
	_p_vida = instance_place(x,y,oPocaoCoracao);
	if(_p_vida && global._vida <= 2)
	{ 
		global._vida += 1;
		instance_destroy(_p_vida);
	}
	
	_p_diamante = instance_place(x,y,oConsulDiamante);
	if(_p_diamante && global._diamantes <= 2)
	{ 
		global._diamantes += 1;
		instance_destroy(_p_diamante);
	}
}

show_debug_message(global._timeDash);

switch(estado)
{
	case "entrando":
		muda_sprite(s_players_entrando);
		if (image_index >= image_number-vel_sprite(s_players_entrando)){ room_goto_next();}
	break;
	
	case "saindo":
		muda_sprite(s_players_saindo);
		if (image_index >= image_number-vel_sprite(s_players_saindo)){ estado = "idle";}
	break;
	
	case "idle":
		muda_sprite(s_players_idle);
	break;

	case "anda":
		direcao = 1 * image_xscale;
		muda_sprite(s_players_run);
	break;

	case "pula":
		 muda_sprite(s_players_jump);
	break;
	
	case "cai":
		muda_sprite(s_players_fall);
		ataqueDePulo();
		
	break;
	
	case "ataca":
		muda_sprite(s_players_attack);
		if (image_index >= image_number-vel_sprite(s_players_attack)){ estado = "idle";}
	break;
	
	case "dash":

		muda_sprite(s_players_attack);
		dash();
		_hit = true;
		image_alpha = .5;
		if (image_index >= image_number-vel_sprite(s_players_attack))
		{
			image_alpha = 1;
			_hit = false;
			estado = "idle";
		}
	break;

	case "hit":
		_hit = true;
		 muda_sprite(s_players_hit);
		if (image_index >= image_number-vel_sprite(s_players_hit))
		{
			global._vida -= 1;
			_hit = false;
			if(global._vida <= 0) {estado = "morto"; global._diamantes -= 1;} else {estado = "idle";}
		}
		
	break;
	
	case "fallwall":
		muda_sprite(s_players_fall_wall);
		velv = .2;
		if(keyboard_check(vk_space) && global._timeJump >= 120)
		{velv = -velj * 1.1 ;   direcao *= -1; global._timeJump -= 80;}
	break;

	case "morto":
		muda_sprite(s_players_dead);
		if (image_index >= image_number-vel_sprite(s_players_dead))
		{
			image_speed = 0;
			image_index = image_number-vel_sprite(s_players_dead);	
		}
	break;
	
}


// MUDAR O NOME DE _HIT PARA ALGO MAIS FACIL	