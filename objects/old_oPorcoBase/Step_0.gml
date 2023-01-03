// Inherit the parent event
event_inherited();

// sprites

	if(velh != 0 && estaNoChao() && !tomandodano) { sprite_index = s_porco_run;  }
	if(velh = 0 && estaNoChao()  && !tomandodano) { sprite_index = s_porco_idle; }
	if(velv < 0 && !estaNoChao() && !tomandodano) { sprite_index = s_porco_jump; }
	if(velv > 0 && !estaNoChao() && !tomandodano) { sprite_index = s_porco_fall; }
	
	//if(momento == "fogonabomba") { sprite_index = s_porco_fosforo_idle; }
	

// levando dano
if(tomandodano && !morto)
{
	sprite_index = s_porco_hit;
	danotime -= 1;
	velh = 0;
	if( danotime <=0 ){tomandodano = false; danotime =  invulneravel; vida--;}
	if(vida <= 0){morto = true;}
}

// liga bomba
var _bomba = instance_place(x,y,oBomba);
if(_bomba && _bomba.momento == "off" && !morto)
{
	velh = 0;
	_bomba.momento = "on"
}

// liga canhao
var _canhao = instance_place(x,y,oCanhao);
if(_canhao && _canhao.estado == "off" && _canhao.load && !morto)
{
	velh *= -1
	_canhao.estado = "on"
}

// morte
if(morto) 
{
	sprite_index = s_porco_dead;
	image_speed = 0;
	image_index = sprite_get_number(s_porco_dead)-1;
	ipatrulha = false;
}

	
	
	

