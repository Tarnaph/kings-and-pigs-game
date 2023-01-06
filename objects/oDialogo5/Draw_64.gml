// Desenha gui
desenhar = function(_sprit, _x, _y)
{
	//draw_sprite_ext(_sprit,5*(get_timer() /1000000),_x, _y,_scale,2,0,c_white,1);
	draw_sprite(_sprit,image_index,_x,_y);
}

function desenhaFundoPreto()
{
	var _x = display_get_gui_width()/2;
	var _y = display_get_gui_height()/2;
	draw_sprite(s_fundo_preto,image_index,_x,_y);
}


if (_dialogo == false && dialogo == false)
{
	var _vi =collision_circle(x,y,visao,oPlayersIdle,false,true);
	//var _vi = collision_line(x, y, x + visao * image_xscale, y, oPlayersIdle, false, true);
	if(_vi) { _dialogo = true }
}
	
if (_dialogo == true)
{
		_time -= .5;
		//show_debug_message(_time)
		var _x = display_get_gui_width();
		var _y = display_get_gui_height();
		
		desenhaFundoPreto();
		
		if(_time == 90) {falas = "sala01a"};
		if(_time == 50) {falas = "sala01b"};
		if(_time == 0) {falas = "sala01c"};
		if(_time == -50) {falas = "sala01d"};
		if(_time == -100) {falas = "sala01e"};
		if(_time == -150) {falas = "sala01f"};
		

// antes dos boss
sala01 =[
	"E esse simbolo?",
	"Que simbolo?",
	"Meus deus, esse que estava na parede.",
	"Ah deve ser algum sinal de alerta.",
	"Pois então, tome cuidado.",
	"Mais barulho, bora lá!"
]		

	draw_set_font(ft_idle);
	draw_set_colour(#6B4B5B);

	switch(falas)
	{
		case "sala01a":
			desenhar(s_gui_dialogo, _x/2, _y/4);
			draw_text(_x/2 -235,_y/4 - 12,sala01[0])
		break;
		case "sala01b":
			desenhar(s_gui_dialogo, _x/2, _y/4);
			draw_text(_x/2 -235,_y/4 - 12,sala01[0]);
			desenhar(s_gui_dialogo_v2, _x/2, _y/4 + 80);
			draw_text(_x/2 -235,_y/4 + 67,sala01[1]);
		break;
		case "sala01c":
			desenhar(s_gui_dialogo, _x/2, _y/4);
			draw_text(_x/2 -235,_y/4 - 12,sala01[0]);
			desenhar(s_gui_dialogo_v2, _x/2, _y/4 + 80);
			draw_text(_x/2 -235,_y/4 + 67,sala01[1]);	
			desenhar(s_gui_dialogo, _x/2, _y/4 + 160 );
			draw_text(_x/2 -235,_y/4 + 147,sala01[2]);
		break;
		case "sala01d":
			desenhar(s_gui_dialogo, _x/2, _y/4);
			draw_text(_x/2 -235,_y/4 - 12,sala01[0]);
			desenhar(s_gui_dialogo_v2, _x/2, _y/4 + 80);
			draw_text(_x/2 -235,_y/4 + 67,sala01[1]);	
			desenhar(s_gui_dialogo, _x/2, _y/4 + 160 );
			draw_text(_x/2 -235,_y/4 + 147,sala01[2]);
			desenhar(s_gui_dialogo_v2, _x/2, _y/4 + 240);
			draw_text(_x/2 -235,_y/4 + 227,sala01[3]);
		break;
		case "sala01e":
			desenhar(s_gui_dialogo, _x/2, _y/4);
			draw_text(_x/2 -235,_y/4 - 12,sala01[0]);
			desenhar(s_gui_dialogo_v2, _x/2, _y/4 + 80);
			draw_text(_x/2 -235,_y/4 + 67,sala01[1]);	
			desenhar(s_gui_dialogo, _x/2, _y/4 + 160 );
			draw_text(_x/2 -235,_y/4 + 147,sala01[2]);
			desenhar(s_gui_dialogo_v2, _x/2, _y/4 + 240);
			draw_text(_x/2 -235,_y/4 + 227,sala01[3]);
			desenhar(s_gui_dialogo, _x/2, _y/4 + 320 );
			draw_text(_x/2 -235,_y/4 + 307,sala01[4]);
		break;
		case "sala01f":
		desenhar(s_gui_dialogo, _x/2, _y/4);
			draw_text(_x/2 -235,_y/4 - 12,sala01[0]);
			desenhar(s_gui_dialogo_v2, _x/2, _y/4 + 80);
			draw_text(_x/2 -235,_y/4 + 67,sala01[1]);	
			desenhar(s_gui_dialogo, _x/2, _y/4 + 160 );
			draw_text(_x/2 -235,_y/4 + 147,sala01[2]);
			desenhar(s_gui_dialogo_v2, _x/2, _y/4 + 240);
			draw_text(_x/2 -235,_y/4 + 227,sala01[3]);
			desenhar(s_gui_dialogo, _x/2, _y/4 + 320 );
			draw_text(_x/2 -235,_y/4 + 307,sala01[4]);
			desenhar(s_gui_dialogo_v2, _x/2, _y/4 + 400);
			draw_text(_x/2 -235,_y/4 + 387,sala01[5]);
		break;
	}
	if(_time == -300) {_time = time; _dialogo = false; dialogo = true};	
		
}