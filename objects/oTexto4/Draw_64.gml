// Desenha gui
desenhar = function(_sprit, _x, _y)
{
	//draw_sprite_ext(_sprit,5*(get_timer() /1000000),_x, _y,_scale,2,0,c_white,1);
	draw_sprite(_sprit,image_index,_x,_y);
}

// desenha fundo preto 
function desenhaFundoPreto()
{
	var _x = display_get_gui_width()/2;
	var _y = display_get_gui_height()/2;
	draw_sprite(s_fundo_preto,image_index,_x,_y);
}
	
// pega o tamanho do texto
var _t_texto = array_length(texto);

var _x = display_get_gui_width();
var _y = display_get_gui_height();
		
draw_set_font(ft_idle);
draw_set_colour(c_white);

var copy_texto = string_copy(texto[n],0, indice)
draw_text_ext(_x/2 -250 ,_y/2-50,copy_texto,20,500)
if(indice < string_length(texto[n])){indice += .5}
show_debug_message(n)
show_debug_message(_t_texto)
if(n < _t_texto -1)
{
	if(keyboard_check_pressed(vk_anykey)){ n +=1; indice = 0;}
	if(gamepad_is_connected(0))
	{
		if(gamepad_button_check_pressed(0,gp_face1)){ n +=1; indice = 0;}
	}
}
else
{
	if(keyboard_check_pressed(vk_anykey)){ room_goto(menu)}
	if(gamepad_is_connected(0))
	{
		if(gamepad_button_check_pressed(0,gp_face1)){ room_goto(menu);}
	}
}
