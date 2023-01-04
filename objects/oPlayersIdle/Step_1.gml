// movimentacoes
inputs = {
	up:ord("W"),
	left:ord("A"),
	right:ord("D"),
	down:ord("S"),
	jump:vk_space,
	dash:ord("F"),
	attack:ord("J")
}

/* Verifica se esta em contato com o chao */
function estaNoChao()
{
	var _chao = place_meeting(x, y + 1, oChao);
	return _chao;
}

/* Verifica se esta em contato com o parede */
function estaNaParede()
{
	var _parede = place_meeting(x + 1 *image_xscale , y, oChao);
	return _parede;
}

/* Adicionando Gravidade se não estiver no chão */ 
if (!estaNoChao()) {velv += grav};

/* Muda o x no sentido da velocidade horizontal */
if(velh !=0) { image_xscale = sign(velh); }

/* Faz a mudança do sprite */
muda_sprite = function(_sprite)
{
	if (sprite_index != _sprite)
	{
		sprite_index = _sprite;
		image_index = 0;
	}
}

/* Retorna a velocidade real da sprite*/
vel_sprite = function(_sprite)
{
	return sprite_get_speed(_sprite) / room_speed;
}

// Quando leva_dano_de_inimigo
leva_dano_de_inimigo = function(_obj,_estado,_destroi)
{
	_inimigo = instance_place(x,y,_obj);
	if(_inimigo && _inimigo.estado != "morto" && _inimigo.estado == "ataca")
	{ 
		velh = 0;
		estado = _estado;
		if(_destroi){ instance_destroy(_inimigo); }
	}
}

// Quando leva_dano_de_projeto
leva_dano_de_projeto = function(_obj,_estado,_destroi)
{
	_projeteis = instance_place(x,y,_obj);
	if(_projeteis 
	&& _projeteis.estado != "idle" 
	&& _projeteis.estado != "espera"
	&& _projeteis.estado != "open"
	&& _projeteis.estado != "close")
	{ 
		velh = 0;
		velv = 0;
		estado = _estado;
		_projeteis.estado = "boom";
		if(_destroi){ instance_destroy(_projeteis); }
	}
}

/*contadorInvulneravel = function(_n)
{
	if(_hit == true){ _invulneravel -= _n; image_alpha = .2;}
	if(_invulneravel < invulneravel) { _invulneravel--};
		if(_invulneravel <= 0)
	{
		image_alpha = 1;
		_hit = false;
		_invulneravel = invulneravel;
	}
}*/

// attack - se cair na cabeça de um inimigo da dano
ataqueDePulo = function()
{
	var _inimigo = instance_place(x,y + 3, oInimigoPai );
	if(_inimigo && _inimigo.estado != "dano" &&  _inimigo.estado != "morto" && velv > 0 && !estaNoChao())
	{
		velv = -velj;
		_inimigo.estado = "dano";
	}
}

/* attack - se cair na cabeça de um inimigo da dano
ataqueComMartelo = function()
{
	var _inimigo = instance_place(x,y + 50, oInimigoPai );
	show_debug_message(_inimigo);
	if(_inimigo == true && _inimigo.estado != "dano" &&  _inimigo.estado != "morto" && velv > 0 && estaNoChao())
	{
		_inimigo.estado = "dano";
	}
}*/
dash = function()
{
	velh = 6 * image_xscale;
	var _inimigo = instance_place(x,y, oInimigoPai );
	if(_inimigo && _inimigo.estado != "dano" &&  _inimigo.estado != "morto" && estaNoChao())
	{
		_inimigo.estado = "dano";
		velh = -velh;
	}
}

// Cria balao
criaBalao = function(_x,_y,_v,_sprite)
{
	if (balao == _balao)
	{
		_balao = true;
		var _b = instance_create_layer(x + _x, y- _y, layer, _sprite );
		_b.velh = _v* image_xscale;
		_b.velv = 0;
		_b.grav = 0;	
	}
}

// Destroi balao
destroiBalao = function(_sprite)
{
	_balao = false;
	instance_destroy(_sprite);
}

//interagir_com_objeto
interagir_com_objeto = function(_obj,_estado,_destroi)
{
	_tocou = instance_place(x,y,_obj);
	if(_tocou)
	{ 
		velh = 0;
		estado = _estado;
		if(_destroi){ instance_destroy(_tocou); }
	}
}


	
