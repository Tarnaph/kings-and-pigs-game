// Inherit the parent event
event_inherited();

// morto
if(morto && estaNoChao()) { sprite_index = s_players_dead; velh =0; velv =0; exit; }

// controladores
var _left,_right,_jump,_attack;
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check(inputs.jump);
_attack = keyboard_check(inputs.attack);
velh = (_right - _left) * vel;
if(_jump &&  estaNoChao()){velv = -velj; }

// sprites
if (velh != 0 && estaNoChao())  { sprite_index = s_players_run;   }
if (velh = 0  && estaNoChao())  { sprite_index = s_players_idle;  }
if (velv < 0  && !estaNoChao()) { sprite_index = s_players_jump;  }	
if (velv > 0  && !estaNoChao()) { sprite_index = s_players_fall;  }	
if(_attack && estaNoChao())     { sprite_index = s_players_attack;}


// attack - se cair na cabeça de um inimigo da dano
var _inimigo = instance_place(x,y + 1, oEntidadeInimiga );
if(_inimigo && !_inimigo.morto && !_inimigo.tomandodano && velv > 0 && !estaNoChao())
{
	velv = -velj;
	_inimigo.tomandodano = true;
}


// attack - se cair na cabeça de um inimigo da dano
var _inimigo2 = instance_place(x,y + 1, oInimigoPai );
if(_inimigo2 && _inimigo2.estado != "dano" &&  _inimigo2.estado != "morto" && velv > 0 && !estaNoChao())
{
	velv = -velj;
	_inimigo2.estado = "dano";
}


// tomando dano
if(tomandodano)
{
	sprite_index = s_players_hit; 
	danotime -= 1;
	image_alpha = .2;
		
	if( danotime <= 0 ){tomandodano = false; danotime =  invulneravel; vida--; image_alpha = 1;}
}

if(_inimigo && !_inimigo.morto &&!_inimigo.tomandodano && morto == false && estaNoChao())
{
	tomandodano = true;
}

if(_inimigo2 && _inimigo2.estado != "dano" &&  _inimigo2.estado != "morto")
{
	tomandodano = true;
}

if(vida <= 0){morto = true;}


	
	




