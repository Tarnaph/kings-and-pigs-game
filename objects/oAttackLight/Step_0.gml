
if (estaNaParede()){estado = "morto"}

switch(estado)
{
	case "idle":
	break;
	
	case "morto":
		instance_destroy();
	break;
}