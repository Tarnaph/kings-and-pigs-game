// muda orientacao
if(velh !=0) { image_xscale = sign(velh); }

/* Verifica se esta em contato com o parede */
function estaNaParede()
{
	var _parede = place_meeting(x + 1 *image_xscale , y, oChao);
	return _parede;
}

// dano no inimigo
var _inimigo = instance_place(x,y, oInimigoPai );
	if(_inimigo && _inimigo.estado != "dano" &&  _inimigo.estado != "morto")
	{
		criaShakeCamera(1);
		_inimigo.estado = "dano";
		instance_destroy();
	}


// reduz a vel do bola no chao e ar

	if(velh != 0){ velh *= .75;} 

