global.timeBase = room_speed *2;

global.timeJump = global.timeBase;
global._timeJump = global.timeJump ;

global.timeEsquiva = global.timeBase;
global._timeEsquiva = global.timeEsquiva ;

global.timeDash = global.timeBase;
global._timeDash = global.timeDash;

global.timeInvulneravel = global.timeBase;
global._timeInvulneravel = global.timeInvulneravel;

global.timeSurvive = global.timeBase * 1000;
global._timeSurvive = global.timeSurvive;

global.timeRespaw = global.timeBase * 10;
global._timeRespaw = global.timeRespaw;

// Subtracao do cronometro 
global.subt_cronometro_dash  = 90;
global.subt_cronometro_jump  = 100;
global.subt_cronometro_invul = 50;
global.subt_cronometro_esquiva  = 100;


/* Timer Esquiva  */
function cronometroEsquiva() 
{
	if (global._timeEsquiva < global.timeBase) { global._timeEsquiva--; /*image_alpha = .5; */}
	if(global._timeEsquiva <= 0 ) {global._timeEsquiva = global.timeEsquiva; /*image_alpha = 1;*/}
	//show_debug_message(global._timeEsquiva);
}

/* Timer Jump  */
function cronometroJump() 
{
	if (global._timeJump < global.timeBase) { global._timeJump--; /*image_alpha = .5;*/}
	if(global._timeJump <= 0 ) {global._timeJump = global.timeJump; /*image_alpha = 1;*/}
	//show_debug_message(global._timeJump);
}
		
/* Timer Dash  */
function cronometroDash()
{
	if (global._timeDash < global.timeBase) { global._timeDash--;/*image_alpha = .5;*/}
	if(global._timeDash <= 0 ) {global._timeDash = global.timeDash;/* image_alpha = 1;*/}
	//show_debug_message(global._timeDash);
}

/* Timer Invulneravel  */
function cronometroInvulneravel()
{
	if (global._timeInvulneravel < global.timeBase) { global._timeInvulneravel--;image_alpha = .5;}
	if(global._timeInvulneravel <= 0 ) {global._timeInvulneravel = global.timeInvulneravel; image_alpha = 1; }	
	//show_debug_message(global._timeInvulneravel);
}

