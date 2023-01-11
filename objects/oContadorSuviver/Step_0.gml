/// @description Insert description here
// You can write your code in this editor
with(self)
{
	_inimigo = instance_place(x,y,oInimigoPai);
	if(_inimigo) {global._timeSurvive += 100;}
}


