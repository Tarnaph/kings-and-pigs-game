global.timeBase = room_speed *2;

global.timeJump = global.timeBase;
global._timeJump = global.timeJump ;

global.timeDash = global.timeBase;
global._timeDash = global.timeDash;

global.timeInvulneravel = global.timeBase;
global._timeInvulneravel = global.timeInvulneravel;

global.timeSurvive = global.timeBase * 10;
global._timeSurvive = global.timeSurvive;

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
	if (global._timeDash < global.timeBase) { global._timeDash--;image_alpha = .5;}
	if(global._timeDash <= 0 ) {global._timeDash = global.timeDash; image_alpha = 1;}
	//show_debug_message(global._timeDash);
}

/* Timer Invulneravel  */
function cronometroInvulneravel()
{
	if (global._timeInvulneravel < global.timeBase) { global._timeInvulneravel--;image_alpha = .5;}
	if(global._timeInvulneravel <= 0 ) {global._timeInvulneravel = global.timeInvulneravel; image_alpha = 1; }	
	//show_debug_message(global._timeInvulneravel);
}

