var _wgui = display_get_gui_width();
var _hgui = display_get_gui_height();

repeat(global._level * global._level)
{
	global._timeSurvive--;
}


draw_set_font(ft_idle2) 
draw_text_transformed(_wgui/2 -80,_hgui/2 -50 ,global._timeSurvive / 60,1,1,0 );
draw_set_font(-1) 

with(oPlayersIdle)
{

	if(global._timeSurvive <= 0)
	{
		estado = "morto";
		global._timeSurvive = global.timeSurvive;
		show_debug_message("morri")
	}
}
