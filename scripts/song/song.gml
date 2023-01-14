global.music = song_bgm;
global._music = song_bgm;

// Troca de sfx
function tocaSFX(_sfx,_n,_tf)
{
	if(audio_is_playing(_sfx) == false) { audio_play_sound(_sfx,_n,_tf); }
}

// Troca de musica 
function tocaSFXPauseAndPlay(_sfx,_n,_tf)
{
	if(audio_is_playing(_sfx) == true) { audio_stop_sound(_sfx)};
	audio_play_sound(_sfx,_n,_tf);
}

// Troca de musica qts vezes necessitar
function tocaSFXdPlay(_sfx,_n,_tf)
{
	audio_play_sound(_sfx,_n,_tf);
}

// Toca musica tema
tocaSFX(song_bgm,0,true)

function controladoDeSons()
{
	

	// Sons do player
	with(oPlayersIdle)
	{
		if(estado == "anda" && velh != 0){ tocaSFX(sfx_player_run, 0, true);} else { audio_stop_sound(sfx_player_run); }
		if(estado == "pula" ){ tocaSFX(sfx_player_jump, 0, false);} else { audio_stop_sound(sfx_player_jump); }
		if(estado == "dash" ){ tocaSFX(sfx_player_attack, 0, false);} else { audio_stop_sound(sfx_player_attack); }
		if(estado == "hit" ){ tocaSFX(sfx_player_hit, 0, false);} else { audio_stop_sound(sfx_player_hit); }
		if(estado == "esquiva" ){ tocaSFX(sfx_player_esquiva, 0, false);} else { audio_stop_sound(sfx_player_esquiva); }
		if(estado == "morto" ){ tocaSFX(sfx_player_dead, 0, false);} else { audio_stop_sound(sfx_player_dead); }
		if(estado == "fallwall" ){ tocaSFX(sfx_player_fallwall, 0, true);} else { audio_stop_sound(sfx_player_fallwall); }
		if(estado == "level" ){ tocaSFX(sfx_player_level, 0, false);} else { audio_stop_sound(sfx_player_level); }
		/*
		case "entrando":
		break;
		case "saindo":
		break;
		case "idle":
		break;
		case "cai":
		break;
		*/
		
	}
	
	// Sons do menu
	with(oMenuPai)
	{
		if(keyboard_check_released(vk_anykey) ){ tocaSFX(sfx_menu_troca, 0, false);} else { audio_stop_sound(sfx_menu_troca); }
		if(gamepad_is_connected(0))
		{
			if( gamepad_button_check_released(0,gp_face1)||
				gamepad_button_check_released(0,gp_padu) ||
				gamepad_button_check_released(0,gp_padd)) { tocaSFX(sfx_menu_troca, 0, false);} else { audio_stop_sound(sfx_menu_troca); }
		}
	}
	
	// Sons do intros
	with(oIntroTextoPai)
	{
		if(keyboard_check_released(vk_anykey) ){ tocaSFX(sfx_menu_troca, 0, false);} else { audio_stop_sound(sfx_menu_troca); }
		if(gamepad_is_connected(0))
		{
			if( gamepad_button_check_released(0,gp_face1)) { tocaSFX(sfx_menu_troca, 0, false);} else { audio_stop_sound(sfx_menu_troca); }
		}
	}
	
	// Sons de consumiveis
	with(oConsumiveisPai)
	{
		if(estado != "idle") { tocaSFXPauseAndPlay(sfx_consumiveis, 0, false);} /*else { audio_stop_sound(sfx_consumiveis); }*/
	}
	
	// Sons de consumiveis
	with(oPorta)
	{
		if(estado != "idle") { tocaSFXPauseAndPlay(sfx_door, 0, false);} /*else { audio_stop_sound(sfx_consumiveis); }*/
	}
	
	// Sons do porco
	with(oInimigoPai)
	{
		if(estado == "idle") { tocaSFXPauseAndPlay(sfx_pig_idle, 0, false);} /*else { audio_stop_sound(sfx_pig_idle); }*/
		if(estado == "patrulha" && velh != 0) { tocaSFXPauseAndPlay(sfx_pig_run, 0, false);}/* else { audio_stop_sound(sfx_pig_run); }*/
		//if(estado == "run") { tocaSFX(sfx_pig_idle, 0, false);} else { audio_stop_sound(sfx_pig_idle); }
		if(estado == "ataca") { tocaSFXPauseAndPlay(sfx_pig_attack, 0, false);} /*else { audio_stop_sound(sfx_pig_attack); }*/
		if(estado == "dano") { tocaSFXPauseAndPlay(sfx_pig_hit, 0, false);} /*else { audio_stop_sound(sfx_pig_hit); }*/
		
	}
/*	
idle	
patrulha
run
ataca
dano
morto
*/
}
	
