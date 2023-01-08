// atributos base
velh = 0;							// velocidade horizontal
velv = 0;							// velocidade vertical
velj = 7;							// velocidade pulo
vel = 2;							// velocidade base
grav = .5;							// gravidade

visao = 50;							// alcance do golpe

direcao = 1;
_direcao = 1;

_puloDuplo = false;

balao = false;
_balao = false;

resetaTime = -1;

//_hit = false;							// inicia o contador da invulneravel
//invulneravel =  room_speed * 4;			// tempo invulneravel base
//_invulneravel = invulneravel;		// tempo invulneravel temporario

/*
time = room_speed * 2;					// tempo de espera base
_time = time;						// tempo de espera temporari
*/
estado = "saindo";				// idle, anda, pula, attack, hit

