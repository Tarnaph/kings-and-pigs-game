draw_self();
//draw_text(x+10,y+10,_vida);
//draw_line(x, y - 14, x + visao *image_xscale, y - 15);


/* Balões */
if( estado == "dash"){ criar_balao(oPlayersIdle,s_balao_loser,30);}
if( estado == "hit"){ criar_balao(oPlayersIdle,s_balao_hit,50);}
if( estado == "pula"){ criar_balao(oPlayersIdle,s_baloes_pulo,30);}
if( estado == "morto"){ criar_balao(oPlayersIdle,s_baloes_no,30);}
