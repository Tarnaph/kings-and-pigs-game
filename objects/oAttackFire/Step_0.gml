
if (estaNaParede()){estado = "morto"}
if(velh = 0){estado = "morto"}

switch(estado)
{
	case "idle":
	break;
	
	case "morto":
		instance_destroy();
	break;
}