function criaShakeCamera(_t)
{
	var _shake = instance_create_layer(0,0,layer,oShakeCamera);
	_shake.shake = _t;
}