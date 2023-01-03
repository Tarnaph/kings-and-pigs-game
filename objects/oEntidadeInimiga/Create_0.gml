// Inherit the parent event
event_inherited();

// base
vel = 1;

// inimigos
ipatrulha = false // se faz patrulha
iandando = true; // tem movimentacao
iandandotime = room_speed * 2; // tempo da patrulha
podecair = false; // se pode cair da plataforma

momento = "normal"; // normal, patrulha, fogonabomba, fogonocanhao

/*-------------------------------- 
Patrulhar
- Time da patrula
- Para ou volta a patrulha randon
- Bate na parede e volta
--------------------------------*/

