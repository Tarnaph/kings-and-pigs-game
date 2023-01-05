// morto
if(estado != "morto")
{
	if(estado != "hit")
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
		
		// Game pad
		if(gamepad_is_connected(0))
		{
			_up = gamepad_button_check(0,gp_padu);
			_left = gamepad_button_check(0,gp_padl);
			_right = gamepad_button_check(0,gp_padr);
			_down = gamepad_button_check(0,gp_padd);
			_jump = gamepad_button_check(0,gp_face1);
			_attack = gamepad_button_check(0,gp_face2);
			_dash = gamepad_button_check(0,gp_face3);
			andar(_right, _left);
		}
		
		// Cronometro Jump
		cronometroJump();
		
		// Cronometro Dash
		cronometroDash();
		
		// Cronometro Invulnerabilidade
		cronometroInvulneravel();
		
		// Pular do Chão
		pular(_jump);
		
		// Pular da parede
		
		// Andar
		andar(_right, _left);
		
		// Dahsar
		dashar(_dash,"dash")
		
		// Entra na porta
		entrarPorta(_up);
	
		// Mudar os estados
		if (velh != 0 && estaNoChao() && estado != "dash")  { estado = "anda";  }
		if (velv < 0  && !estaNoChao() && estado != "dash") { estado = "pula";  }	
		if (velv > 0  && !estaNoChao() && estado != "dash") { estado = "cai";   }	
		if(_attack && estaNoChao())     { estado = "ataca"; }
		if (velh = 0  && estaNoChao() 
			&& estado != "hit" 
			&& estado != "morto" 
			&& estado != "dash" 
			&& estado != "ataca"
			&& estado != "saindo"
			&& estado != "entrando")  
		{ estado = "idle";  }
		if(estaNaParede() 
			&& !estaNoChao() 
			//&& image_xscale == direcao
			&& velv > 0 
			&& estado != "hit"
			&& estado != "morto")
		{estado = "fallwall";}
	
		// Sistema de dano
		if (global._timeInvulneravel >= global.timeInvulneravel) { leva_dano_de_inimigo(oInimigoPai,"hit",false); leva_dano_de_projeto(oProjetoPai,"hit",false); }
		
	}
	
#region consumiveis	
	// Pega pocao de vida
	_p_vida = instance_place(x,y,oPocaoCoracao);
	if(_p_vida && global._vida <= 30)
	{ 
		global._vida += 1;
		instance_destroy(_p_vida);
	}
	// Pega pocao de vida
	_p_diamante = instance_place(x,y,oConsulDiamante);
	if(_p_diamante && global._diamantes <= 2)
	{ 
		global._diamantes += 1;
		instance_destroy(_p_diamante);
	}
	
	// Pega coin
	_p_coin = instance_place(x,y,oCoin);
	if(_p_coin)
	{ 
		global._coin += 1;
		instance_destroy(_p_coin);
	}
#endregion
}

	


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
		// nada
	break;
	
	case "dash":
		muda_sprite(s_players_attack);
		dash();
		if (image_index >= image_number-vel_sprite(s_players_attack)){ estado = "idle"; }
	break;

	case "hit":
		 muda_sprite(s_players_hit);
		if (image_index >= image_number-vel_sprite(s_players_hit))
		{
			global._vida -= 1;
			if(global._vida <= 0) {estado = "morto"; global._diamantes -= 1;} else {estado = "idle";}
		}
		
	break;
	
	case "fallwall":
		muda_sprite(s_players_fall_wall);
		velv = .2;
		pularDaParede(_jump);
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


