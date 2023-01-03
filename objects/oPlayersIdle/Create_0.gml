// atributos base
velh = 0;							// velocidade horizontal
velv = 0;							// velocidade vertical
velj = 6;							// velocidade pulo
vel = 2;							// velocidade base
grav = .5;							// gravidade

// atributos vida
//vida = 3;							// vida max
//_vida = vida;						// vida temporaria
//global.vida = _vida;


visao = 50;							// alcance do golpe

direcao = 1;
_direcao = 1;

balao = false;
_balao = false;

_dashMaximo = 3;

_hit = false;							// inicia o contador da invulneravel
invulneravel =  room_speed * 2;			// tempo invulneravel base
_invulneravel = invulneravel;		// tempo invulneravel temporario

time = room_speed * 2;					// tempo de espera base
_time = time;						// tempo de espera temporari

estado = "saindo";				// idle, anda, pula, attack, hit

/*
// atributos vida
tomandodano = false; //  ele n esta tomando dano
danotime = room_speed * 2; // tempo invulneravel
invulneravel = danotime; // tempo invulneravel
tempo = danotime;
morto = false; // morre
vida = 22; // total de vida
*/