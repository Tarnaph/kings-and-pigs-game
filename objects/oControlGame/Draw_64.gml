// avatar
desenhar(s_gui_foto,20,20,2)

// level
draw_text_transformed(28,73,"LV: " + string(global._level),1.1,1.1,0 );

// vida
var _a = 20;
var _b = 20
var _c = 35;
repeat(global._vida){
desenhar(s_gui_coracao,_a + 70, _b + 3, 2);
	_a +=_c;
}

// Coin
desenhar(s_artefatos_coin,105, 80, 2);

draw_text_transformed(135,52, string(global._coin) + "/" + string(global._level * 10),1.2,1.2,0 );	

//draw_text(135,55,"X " + string(global._coin) + "/" + string(global._level * 10) );


//"Hello, " + global.Name + "!\nI hope you are well!");


/*
//Diamantes
var _x = 20;
var _y = 20
var _qt = 35;
repeat(global._diamantes){
desenhar(s_gui_diamante,_x + 18, _y + 47, 2);
	_x +=_qt;
}

//Key
var _x = 20;
var _y = 20
var _qt = 35;
repeat(global._key){
desenhar(s_artefastos_key,_x + 18, _y + 47, 2);
	_x +=_qt;
}
*/
/*
//Restart 
if (global._vida <= 0 && global._diamantes > 0) 
{
	var _wgui = display_get_gui_width();
	var _hgui = display_get_gui_height();
	desenhar(s_gui_start,_wgui/2, _hgui/2, 2);
	if(keyboard_check(vk_anykey)){room_restart(); global._vida = global.vida; }
	if(gamepad_button_check(0,gp_start)){room_restart(); global._vida = global.vida; }
}
if( global._diamantes == 0)
{
	var _wgui = display_get_gui_width();
	var _hgui = display_get_gui_height();
	desenhar(s_gui_gamer_over,_wgui/2, _hgui/2, 2);
	if(keyboard_check(vk_anykey)){game_restart();}
	if(gamepad_button_check(0,gp_start)){game_restart();}
}*/
/*-----------------------------------------------*/
/*
var _wgui = display_get_gui_width();
	var _hgui = display_get_gui_height();
	desenhar(s_gui_dialogo,_wgui/2, _hgui, 2);
*/