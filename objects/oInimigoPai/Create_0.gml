// atributos base
velh = 0;							// velocidade horizontal
velv = 0;							// velocidade vertical
velj = 6;							// velocidade pulo
vel = 1;							// velocidade base
grav = .5;							// gravidade

// atributos vida
vida = 2;							// vida max
_vida = vida;						// vida temporaria

loot = 1;

balao = false;
_balao = false;

visao = 100;						// alcance da visao
cairdaplataforma = false;			// se pode ou não cair das plataformas

invulneravel =  room_speed;			// tempo invulneravel base
_invulneravel = invulneravel;		// tempo invulneravel temporario

time = room_speed * 2;					// tempo de espera base
_time = time;						// tempo de espera temporari

estado = "idle";				// pegabomba, idle, run, jogabomba, dano, morto

