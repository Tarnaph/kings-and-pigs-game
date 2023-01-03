// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/*function criar_balao(_obj,_s, _y){
	var inst = instance_find(_obj, 0);
	if (instance_exists(inst))
	{
	    x = inst.x;
	    y = inst.y;
		
		draw_sprite(_s, image_index, x, y- _y);
	}
}*/


function criar_balao(_obj,_s, _y){
	with(self)
	{
	    a = x;
	    b = y;
		draw_sprite(_s, image_index, a, b- _y);
	}
}