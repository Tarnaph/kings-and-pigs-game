///@script
function criar_balao(_obj,_s, _y){
	with(self)
	{
	    a = x;
	    b = y;
		draw_sprite(_s, image_index, a, b- _y);
	}
}
///@script
function criar_box_skill(_obj,_s,_x, _y){
	with(self)
	{
	    a = x;
	    b = y;
		draw_sprite(_s, image_index, a + _x , b + _y);
	}
}
