/* Verifica se esta em contato com o chao */
function estaNoChao()
{
	var _chao = place_meeting(x, y + 1, oChao);
	return _chao;
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

/* Se ver o player realiza um ataque */
ver_player_e_ataca = function(_estado, _vel)
{
	var _vi = collision_line(x, y - 14, x + visao * image_xscale, y - 15, oPlayersIdle, false, true);
	if(_vi){ velh *= _vel; estado = _estado;}
}

// Se bater na parede volta ou se achar buraco na frente
if((place_meeting(x + velh, y, oChao))) { velh *= -1; }
if(cairdaplataforma == false && (place_meeting(x + velh * 10, y + 1, oChao) == false)) { velh *= -1; }

// Quando enconta em obj muda o estado do player e destroi o item
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

/* Faz a patrulha. Escolhe correr ou ficar parado por um tempo */
patrulhar = function(_sprite, _sprite2)
{
	if (estaNoChao())
	{
		_time -= 1;
		if(_time <= 0 )
		{
			_run = choose(true, false);
			if(_run)
			{
				muda_sprite(_sprite);
				velh = choose(vel,-vel);
			}
			else
			{
				muda_sprite(_sprite2);
				velh = 0;
			}
			_time = time;
		}
	
	}	
}
// Cria balao
criaBalao = function(_x,_y,_v,_sprite)
{
	if (balao == _balao)
	{
		_balao = true;
		var _b = instance_create_layer(x + _x, y- _y, layer, _sprite );
		_b.velh = _v * image_xscale;
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

// desenha
desenhar = function(_sprit, _x, _y)
{
	draw_sprite(_sprit, image_index, x, y);
	//draw_sprite_ext(_sprit,5*(get_timer() /1000000),_x, _y,_scale,2,0,c_white,1);
}

// Loot
criaLot = function()
{
	if loot == 1
	{
		_r = random(2);
		repeat(_r)
		{
			var _coin = instance_create_layer(x, y, layer, oCoin );
			_coin.velh = random_range(-12,12);
			_coin.velv = random_range(-10,-5);
			
			_vida = instance_create_layer(x, y-20, layer, oPocaoCoracao );
			_vida.velh = random_range(-12,12);
			_vida.velv = random_range(-10,-5);
		}
		/*
		if global._vida == 1
		{
			_x = choose(true, false);
			if _x == true 
			{
				_vida = instance_create_layer(x, y-20, layer, oPocaoCoracao );
				_vida.velh = random_range(-12,12);
				_vida.velv = random_range(-10,-5);
			}
		}*/
		loot = 0;
	}
}

