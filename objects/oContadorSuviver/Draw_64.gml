var _wgui = display_get_gui_width();
var _hgui = display_get_gui_height();

draw_set_font(ft_idle2) 
draw_text_transformed(_wgui/2 -80,_hgui/2 -50 ,global._timeSurvive / 60 /60,1,1,0 );
draw_set_font(-1) 

with(oPlayersIdle)
{
	if(estado == "saindo") {global._timeSurvive = global.timeSurvive;}
	if(estado != "saindo" && global._timeSurvive >= 0) 
	{
		repeat(global._level * 1.2){global._timeSurvive--;}
	}
	if( estado == "morto") {}

	if(global._timeSurvive <= 0)
	{
		velh = 0;
		velv = 0;
		grav =10;
		estado = "morto";
		
	
	}
}
