if (velv != 0) { velv += grav; }
velh *= .85;

// Script de controle de sons do jogo 
controladoDeSons();

switch(estado)
{
	case "idle":
		show_debug_message("consumivel idle");
	break;
	case "destruido":
		instance_destroy();
		estado = "idle";
	break;
}
