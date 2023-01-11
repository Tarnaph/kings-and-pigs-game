// criando game control
// cria se n existe
/**/
if(instance_exists(oControlGame) == false)
{		instance_create_depth(0,0,0, oControlGame);
	
		
	
}
else
{
	
}

if !audio_is_playing(global._music)
        {
            audio_play_sound(global._music, 0, true);
        }