/* Vida */
var _a = 20;
var _b = 20
var _c = 35;
/* Vida */
desenhar(s_gui_bar,_a, _b, 2);
repeat(global._vida){
desenhar(s_gui_coracao,_a + 17, _b + 5, 2);
	_a +=_c;
}
/*-----------------------------------------------*/

/* Diamantes */ 
var _x = 20;
var _y = 20
var _qt = 35;
/* Diamantes */ 
desenhar(s_gui_bar,_x , _y + 40, 2);
repeat(global._diamantes){
desenhar(s_gui_diamante,_x + 18, _y + 47, 2);
	_x +=_qt;
}
/*-----------------------------------------------*/

/* Restart */
if (global._vida <= 0 && global._diamantes > 0) 
{
	var _wgui = display_get_gui_width();
	var _hgui = display_get_gui_height();
	draw_text(_wgui/2, _hgui/2, "PRESS ENTER TO RESTART");
	if(keyboard_check(vk_enter)){room_restart(); global._vida = global.vida; }
}
if( global._diamantes == 0) {
	var _wgui = display_get_gui_width();
	var _hgui = display_get_gui_height();
	draw_text(_wgui/2, _hgui/2, "GAMER OVER");
}
/*-----------------------------------------------*/



