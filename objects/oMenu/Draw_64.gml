draw_set_font(ft_idle);
var tam_menu = array_length(menu_inicial);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i =0; i < tam_menu; i++)
{
	var _wgui = display_get_gui_width();
	var _hgui = display_get_gui_height();
	var _hstr = string_height("I");
	var _wstr = string_width(menu);
	
	if (i == menu_selected)
	{
		_scale = 2;
		if(_jump || _enter) {estado = i};
	} 
	else
	{
		_scale = 1
	};
	
	draw_text_transformed(_wgui /2,_hgui /2.2 + _hstr *i, menu_inicial[i],_scale,_scale,0 );	
}

switch(estado)
		{
			case 0:
				room_goto_next()
			break;	
			case 1:
				room_goto(abertura3);
			break;
			case 2:
				room_goto(menuCreditos);
			break;
			case 3:
				game_end();
			break;
	
		}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
draw_set_color(-1)
