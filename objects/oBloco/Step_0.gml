// Inherit the parent event
event_inherited();


//var _vi = collision_line(x, y, x, y+visao, oPlayersIdle, false, true );
var _vi = instance_place(x,y-1,oPlayersIdle);
if(_vi)
{	
	
	if (velv == 0)
	{
		velh = 3; 
		estado = "cai";
	}
	
}
	/*
	&& _projeteis.estado != "idle" 
	&& _projeteis.estado != "espera"
	&& _projeteis.estado != "open"
	&& _projeteis.estado != "close")*/

// dano no players
/*if(velv != 0)
{
	var _player = instance_place(x,y,oPlayersIdle);
	if (_player) { 
		_player.leva_dano_de_projeto(oBloco,"hit",false);
		_player.velh = 0;
		_player.velv = 0;
		}
}*/

if (estaNoChao()) {estado = "idle";}

switch(estado)
{
	case "idle":
	
	break;
	
	case "on":
		velv = 0;
	break;
	
	case "cai":
		
	break;
}
