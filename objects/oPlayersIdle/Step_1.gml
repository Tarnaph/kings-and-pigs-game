// movimentacoes
inputs = {
	up:ord("W"),
	left:ord("A"),
	right:ord("D"),
	down:ord("S"),
	jump:vk_space,
	runner:vk_shift,
	dash:ord("F"),
	menu:vk_escape,
	esquiva:vk_control,
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
		global._timeInvulneravel -= global.subt_cronometro_invul;
		velh = 0;
		estado = _estado;
		criaShakeCamera(1);
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
		global._timeInvulneravel -= global.subt_cronometro_invul;
		velh = 0;
		velv = 0;
		estado = _estado;
		_projeteis.estado = "boom";
		criaShakeCamera(1);
		if(_destroi){ instance_destroy(_projeteis); }
	}
}


// attack - se cair na cabeça de um inimigo da dano
ataqueDePulo = function()
{
	var _inimigo = instance_place(x,y + 3, oInimigoPai );
	if(_inimigo && _inimigo.estado != "dano" &&  _inimigo.estado != "morto" && velv > 0 && !estaNoChao())
	{
		velv = -velj;
		criaShakeCamera(1);
		_inimigo.estado = "dano";
		
		// Cria bola de energia
		
		if(global._level >= 3)
		{
			repeat(global._level /2)
			{
				var _l = instance_create_layer(x, y +10, layer, oAttackLight );
				_l.velh = random(3) * image_xscale;
				_l.estado = "on";
			}
		}
	}
	
}

// Atack dash
dash = function()
{
	velh = 2 * image_xscale;
	velv = 0;
	var _inimigo = instance_place(x,y, oInimigoPai );
	if(_inimigo && _inimigo.estado != "dano" &&  _inimigo.estado != "morto")
	{
		criaShakeCamera(1);
		_inimigo.estado = "dano";
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

// Andar
function andar(_right, _left,_runner)
{ 
	if((_right && _runner) ||( _left && _runner)){velh = (_right - _left) * (vel + 2); }
	else {velh = (_right - _left) * vel; }
}

// Pular do chao
function pular(_jump)
{ if(_jump && estaNoChao() && global._timeJump >= global.timeJump){ global._timeJump -= global.subt_cronometro_jump; velv = -velj;} }


// Pular da parede
function pularDaParede(_jump)
{if(_jump && global._timeJump >=  global.timeJump) {velv = -velj; global._timeJump -= global.subt_cronometro_jump;}}


// Dashar Ataque
function dashar(_dash,_estado)
{
	if(_dash && global._timeDash >= global.timeDash && estado != "fallwall") 
	{ estado = _estado; global._timeDash -= global.subt_cronometro_dash; /*global._timeInvulneravel--*/}
}


// Entrar na porta
function entrarPorta(_up)
{
	if(_up && estaNoChao()){ _tocou = instance_place(x,y,oPorta);
	if(_tocou && _tocou.saida == true && global._key > 0) { _tocou.estado = "open"; estado = "entrando";}
	}
}

// Pssar de level
function levelUp()
{
	if(global._coin >= global._level * 10) 
	{ 
		estado = "level" 
	};
}

	
